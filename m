Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BB1C41513
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 11:13:26 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.29844.1690542796258322407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 04:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MAK1ujlE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so22437385e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690542794; x=1691147594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dn3XGKYwcIZZlXN78BwkS47xYD2U90NTdLeBAG51vDk=;
        b=MAK1ujlE7GtTl7YqJvkHy+dG+q2okUrYpszVRSyqjStV2yoTn6fyhQ40+2BJq9EtBc
         y0udjHNE1/cqp12D17DGEOMJSdgMF7AfAiG2PljeAhL/VXO60Vmqj05gLUOoLR8GNWCA
         MrUYabWU7e3oY1NY+a9K/48hFNcA/yFVu0A4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542794; x=1691147594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn3XGKYwcIZZlXN78BwkS47xYD2U90NTdLeBAG51vDk=;
        b=h1czZbdWN2FXV2R/tOB+aw5cMRD/jNyBlgV2YPjXL2NS6flTAHniUqotfB+uNO/NJL
         OqCg5AIqa30auee7ZY0VpqumIocN+COqlhy2m4MJHHFa9H/gUjlARhBOOMMNuHnOPoLT
         LKjqgbPvaIKEZEcLs51Ih5BJSXN5dX/oUPqE7+T2xn9JtH/QzzNy7EMJ+kknnROT9e9u
         XqNmdZuD85RLhbugX55XahcowfvHavuhxwhjD3r3yPE+SHQz+v/0trWWRbwmwLgtmJcp
         ciq35bdZNouFh+OeLIQSgiKKVljnZ3yksAPtXXXix09dcBMedE743zFpXjl09vjvzbpz
         vcxw==
X-Gm-Message-State: ABy/qLbE1pwYJluhAsBBLraQT8t6jyUiJewfOrOLLKueViffbDcxu+3p
	2hS0bEXpPIHywMunM+8JX0TGvIeC5+u2wvRyoIY=
X-Google-Smtp-Source: APBJJlE7srR8FLEVs457Pbvv6P+aIG4h5BxPXQx7oGnoFmLgaNtoapP+wLkc7v7N+AoZPcha3HnYrw==
X-Received: by 2002:a7b:ce98:0:b0:3fb:feb0:6f40 with SMTP id q24-20020a7bce98000000b003fbfeb06f40mr1658583wmj.11.1690542794039;
        Fri, 28 Jul 2023 04:13:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4e39:f3a8:af2d:87a2])
        by smtp.gmail.com with ESMTPSA id k17-20020a7bc311000000b003fc02218d6csm6730736wmj.25.2023.07.28.04.13.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 04:13:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] oeqa/ltp: Show warning for non-zero exit codes
Date: Fri, 28 Jul 2023 12:13:09 +0100
Message-Id: <20230728111311.1665976-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728111311.1665976-1-richard.purdie@linuxfoundation.org>
References: <20230728111311.1665976-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 11:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185022

When test command timeouts occur, there was no warning in the logs. Change
this to ignore "exit 1" but report all other exit codes so that timeouts
are clear.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 13a4f84ac00..c7e79438a48 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -74,6 +74,11 @@ class LtpTest(LtpTestBase):
             (status, output) = self.target.run(cmd, timeout=1200)
             endtime = time.time()
 
+            # status of 1 is 'just' tests failing. 255 likely was a command output timeout 
+            if status and status != 1:
+                msg = 'Command %s returned exit code %s' % (cmd, status)
+                self.target.logger.warning(msg)
+
             # Write the console log to disk for convenience
             with open(os.path.join(self.ltptest_log_dir, "%s-raw.log" % ltp_group), 'w') as f:
                 f.write(output)
-- 
2.39.2


