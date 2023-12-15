Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BD4C4167D
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:26 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.57787.1702626736903288805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OVpkB/RS;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5522ba3f94aso344145a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626735; x=1703231535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHMe6SVMtM0cteoR+PGSqkPuESqBvJ4e5dqHdXMU8EU=;
        b=OVpkB/RS3CphT36re2RRgGN3tKDq57JwjmkVwbBpmaVkV4tCpXfU3OhVgIPOZTik7G
         HNNdICxbPKP+I1puWw7wsKYMxLC+sfQ/sZi13TDnBcHdv+zMLq6Px2Owc8Fa6TLx3s6Y
         hBD3+6i4gNrCBFUiA5O9bxeTCvLKCQ2Ogf5dmgeC309/g5xW9ixvnNCFIMULf6lI0GRk
         SSWMai/TtL8I8yGSVbo0Br4mhZpPtaDSuGDhfFBCd2F6y3xzmVn61qce4U3CV38avspq
         m64TFTBpHYeiSHRT7eASF7yfJG8U23tp35siM0LKE+KX3MlIidNjIhycRz7MKeRbm6Fh
         z0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626735; x=1703231535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHMe6SVMtM0cteoR+PGSqkPuESqBvJ4e5dqHdXMU8EU=;
        b=BvB5UbumEZYNNx/2plycTT4KRFiQEfgOKcboBVpo/a9/DDiKKkJyvrxQoqS8gjCfMP
         fiYAkgUFC0/G/8uXI++dFzju8Blroe7S4TxzTnUWY3Hf4CJrEOp8tMwIDN9+WYWs7dmI
         KevOqt+mCZ0VMZNnYUKw70iAEomwWwr2fnmfKibp1Q/Jg/xusK8BYhLAZxYwUyiQ+ihH
         SOZr51ImYUWqHsBTsLp0PKa8p6Faz25/0HM3WQjbZ2CyA+0dQMBE/lz9H1nUnHueXebx
         /4oku7wjJ81YN43Gh47DeM2e5UtcDt9E1ROeAky+qgfQvKhGW76MRk+18xBcNWgF/aL8
         mceQ==
X-Gm-Message-State: AOJu0YySb6KQ5fZXxKHvItU9oDIoQbTBhhbqlndiEtwgvo1cZwX419tN
	7bPR0hoxRUxpzT1oQypL3M9r42zwm10=
X-Google-Smtp-Source: AGHT+IHa4LGgiMCYjwQjMKsigOiHhhylNExwjRlX6Hmnu1C4jMCh0zP5bsc6Opqt1TtIRAcyc42ZKw==
X-Received: by 2002:a50:8d1d:0:b0:551:ea5d:ff74 with SMTP id s29-20020a508d1d000000b00551ea5dff74mr1054625eds.106.1702626735341;
        Thu, 14 Dec 2023 23:52:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00551d6d51401sm2961885edb.53.2023.12.14.23.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/10] libcap-ng-python: depend on setuptools to obtain distutils copy
Date: Fri, 15 Dec 2023 08:52:02 +0100
Message-Id: <20231215075210.3049785-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075210.3049785-1-alex@linutronix.de>
References: <20231215075210.3049785-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192414

Upstream has made the needed fixes (not easy to backport), but
hasn't released a new version with them. Distutils has been
removed from the core python library in 3.12.0.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb
index 1240589d007..9e0ccd55e37 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb
@@ -6,7 +6,8 @@ SUMMARY .= " - python"
 
 inherit lib_package autotools python3targetconfig
 
-DEPENDS += "libcap-ng python3 swig-native"
+# drop setuptools when version > 0.8.3 is released; it's needed only for distutils
+DEPENDS += "libcap-ng python3 swig-native python3-setuptools-native"
 
 S = "${WORKDIR}/libcap-ng-${PV}"
 
-- 
2.39.2


