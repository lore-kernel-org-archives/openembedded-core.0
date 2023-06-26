Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0515EB64DD
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 13:33:23 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.7924.1687786401452267882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 06:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dvIXQtrj;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-988b204ce5fso411051166b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687786399; x=1690378399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYLczQrVra/UbU0Cgi7PND809G/pCOaHio+YUlWyGT0=;
        b=dvIXQtrjooguV8aaaBmLUgbZPtC/shxWZTaJH94HRuW8eIJNsOeIm4p3zkusn/Q07F
         Xg+OD5jKr6pd7blzonOtuHBv8u74ZchDklgMjTnYmGMnL5GkpslT66YPI4o88MD33oNo
         xbb1QEcmIUvESaTtc/aYpIanxFuwgxjm9I6b4szDEGzrR3XBk2pysmuQy9ZAmNv7Qj51
         qKjsRYCudHd2vfYFlX1lf+1p+H9fCeehmgY4yNmBunqIslvZwi59alKnKFZH/sFRSssc
         NdoHUKjBoxxL/cS9JjazHDJuQxHeklhlJGo1ud3dYy5esmWCC7ANuZvzIPFhWp1zKQGm
         5Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786399; x=1690378399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYLczQrVra/UbU0Cgi7PND809G/pCOaHio+YUlWyGT0=;
        b=gDek4p6e+1TXR02IHeOQrXsz4O3DMJfmwEChgEK+aQlXS4F0Q+KSYpknJrCkConaku
         0ODy1weBneHTPkzIB7WCDBYJG0TFoKVocxhEAdmr1G7AQTNgs4sh3xZpcD90xKen6Lfo
         trwgwpy11MEYj9uoW74bjTPq4O9UNmUh7m/aRBZKYgMOzVMRDKCRhV8DxzGfIPwEflwm
         I5WKOXgMGq+d0sPdvHcWg/il4DbZHdrTa4pAU7O1rq7nWvjxhEfPfs56NNNx8Mw/GtLW
         IJnAXVH19mLRta9wN/wMyYkz5MR9+mRJ4lUyG7Y6qjBDSInLi/ONK+IeW369Cnd87KRF
         CH3A==
X-Gm-Message-State: AC+VfDxkzz5HXsxBYp34qNAhJJxICk9Na0ugNAtmuFHbevr7P/zrdTzv
	Kr0ryUBbxXlublllfChfYnWoVVfkYPkvkA==
X-Google-Smtp-Source: ACHHUZ7UoO7ZR466pdnY0JHYvbk06ZqvAR1Dl2j0UVsD8U7bimDGQ8XdsLNJ394th2iVNF18sdmx9g==
X-Received: by 2002:a17:906:6488:b0:98d:5333:79c with SMTP id e8-20020a170906648800b0098d5333079cmr8615787ejm.5.1687786399684;
        Mon, 26 Jun 2023 06:33:19 -0700 (PDT)
Received: from t14s-af.praguecc.cz ([193.85.242.128])
        by smtp.gmail.com with ESMTPSA id h13-20020a1709060f4d00b0097073f1ed84sm3301988ejj.4.2023.06.26.06.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:33:19 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 2/4] runqemu: Fix automated call to runqemu-ifup
Date: Mon, 26 Jun 2023 15:29:25 +0200
Message-ID: <20230626133213.47920-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626133213.47920-1-adrian.freihofer@siemens.com>
References: <20230626133213.47920-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 13:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183415

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

When runqemu tries to call runqemu-ifup to create tap devices, it checks the
output of runqemu-ifup to get the newly created tap device.

The behavior of runqemu-ifup was recently modified along with its output, it
no longer expects the uid parameter to be passed and it prints out a warning
if it was, since this warning was now part of the output runqemu tries to parse
it and convert it to an int() which proved impossible.

Pass the correct arguments to the runqemu-ifup call and echo the warning
to stderr instead to make sure its not being parsed and used by runqemu in any
case.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 scripts/runqemu      | 2 +-
 scripts/runqemu-ifup | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 3f187ca793c..6a3fbb2d6fe 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1186,7 +1186,7 @@ to your build configuration.
             gid = os.getgid()
             uid = os.getuid()
             logger.info("Setting up tap interface under sudo")
-            cmd = ('sudo', self.qemuifup, str(uid), str(gid))
+            cmd = ('sudo', self.qemuifup, str(gid))
             try:
                 tap = subprocess.check_output(cmd).decode('utf-8').strip()
             except subprocess.CalledProcessError as e:
diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index c65ceaf1c83..05c9325b6bd 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -30,7 +30,7 @@ if [ $EUID -ne 0 ]; then
 fi
 
 if [ $# -eq 2 ]; then
-	echo "Warning: uid parameter is ignored. It is no longer needed."
+	echo "Warning: uid parameter is ignored. It is no longer needed." >&2
 	GROUP="$2"
 elif [ $# -eq 1 ]; then
 	GROUP="$1"
-- 
2.41.0


