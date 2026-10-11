Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5BBCA9ED7
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:29 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23577.1791708088427987845
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QyFw8W0v;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d870d54so487174f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708087; x=1792312887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K3WbsvUORKZ/20/6gUhi+3d/uow9CTxOfJbCz6ZdZRE=;
        b=QyFw8W0veYWmRDm7A7A2fDkFlIvicEmO93je2NSIfuxnsEyva6tAtOFzziS1783VWc
         oQZMbuHDuYsMfH21O98jhJApw+LClbINKWSMUhvmzqYaL5JoEGLhcMlv6d47X6q2tPOy
         d40ETG9Fr+Z288zY5w4S3cNCmjA58htrh1/Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708087; x=1792312887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K3WbsvUORKZ/20/6gUhi+3d/uow9CTxOfJbCz6ZdZRE=;
        b=ue4VDVFHEBg4ABmyCXl5K6wQ0X1fub/X2mD/3hPIZ1AhvMPbXabzGZXIok7Y/MdGaW
         IS8Eidqbs/jsLMpk4s3xTekBQHj5DVuNEXxsrW3i+0Z8E1Lu2YDyBR7vZ/tr2s/CTagR
         GasbzamgLCl9ZRvcr5ln5Xnn5JfKVaaWh6FaWRK5l4OWGv4V63246s6Yhl7M5rH5HQs8
         Ih5RqDeeYarMj5897MlnRD3ud5K7vm+uuWXxEde5n8dECaX1/rb7tDayGmyhOtEwrJrH
         9qV019W9/h2Ude1e4ikyD1Utqpk00qJkbEUE+L6D7ej/4sahhkiQQ+qAN83f4ekyKQVa
         9sXQ==
X-Gm-Message-State: AFq9FYL/kE8GqUs2h+Xkhiw+j6oj7up9gu9U0ADrnpze5bRv42kQYXP1
	FwADDGWEM1J3xTwhJi3YKgAnQChFy8xn9OMRwcDD+Pbr4yiwWMTDUUZdwZZwTXGC+vD/1lgQq4U
	LLFXmiG0=
X-Gm-Gg: AYBFou3wzC1UQnQ3neegdVGmrjvy/nhW3hhjx76EJzrqJSBU8rIAQfdPQYXOwYVJzoi
	508NU/S/9/9HYNh7AITLuyBlmrknDh4eycoVAVzgsCGX+0MbV7CbK9CPR+GKdiQjd6Ehj9uVQXG
	oHQohmptJFE/uNZmvJY+8oc+KQ1H/RemUiudTEX8FFq8sj8iNbavQh3dIwLi4X2574WOm+HKsG/
	N56uwmFN/AwBl3yseLTGJh77f3Fx+Ta5togD+gCJLnD1cpRxNcz9eDzFevnZ1OI/2XYCz/RsaJF
	lEc5MEGMJsrKbTI/ClqyuhBUElfPsTtH/S3Mf5MdJ9l38JJ05l4VoUXx7n3zU8hlb4VIh13XbdY
	STaqUCjoP82JJrVZh9u2I8rAeJzGCUTwe/118qB7LhWkurszFkH0derMqVGrpTMo0Vq2mIxSCKi
	eTRArvnO21rKrGRCdw7H6n27zpHUKKtVvb1Gvf9C/3yM3TyBxiNsL6f9tc/s6QKQBfTTB1ZZF1E
	0mHg//G2il9cOsZ6vfAZyDFtKq3+rH5w7Vztb1qMJC6YCjd+8dUSfsgkOj4KYQg1zc6QtIsRQ==
X-Received: by 2002:a05:6000:2991:20b0:48c:4e9e:dc7 with SMTP id ffacd0b85a97d-48dbaced3c8mr8355579f8f.42.1791708086543;
        Sun, 11 Oct 2026 01:41:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 39/60] libsolv: patch CVE-2026-48863
Date: Sun, 11 Oct 2026 10:40:12 +0200
Message-ID: <7dc8f3f4f1a4e62ed04bd1f68847f6eefc941973.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247548

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-48863

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsolv/libsolv/CVE-2026-48863.patch      | 25 +++++++++++++++++++
 .../libsolv/libsolv_0.7.36.bb                 |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch b/meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch
new file mode 100644
index 00000000000..131d035b408
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch
@@ -0,0 +1,25 @@
+From 44f8c085045b1f771641091bbb2b810d12cff9e8 Mon Sep 17 00:00:00 2001
+From: Michael Schroeder <mls@suse.de>
+Date: Tue, 26 May 2026 10:30:31 +0200
+Subject: [PATCH] Fix wrong variable being used in solv_pgpvrfy
+
+CVE: CVE-2026-48863
+Upstream-Status: Backport [https://github.com/openSUSE/libsolv/commit/44f8c085045b1f771641091bbb2b810d12cff9e8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ext/solv_pgpvrfy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/solv_pgpvrfy.c b/ext/solv_pgpvrfy.c
+index 9f1bd72e..9358558b 100644
+--- a/ext/solv_pgpvrfy.c
++++ b/ext/solv_pgpvrfy.c
+@@ -589,7 +589,7 @@ solv_pgpvrfy(const unsigned char *pub, int publ, const unsigned char *sig, int s
+ 	if (rlen)
+ 	  memcpy(sigdata + 32 - rlen, r, rlen);
+ 	if (slen)
+-	  memcpy(sigdata + 64 - slen, s, rlen);
++	  memcpy(sigdata + 64 - slen, s, slen);
+ 	res = mped25519(pub + 1 + 10 + 2 + 1, sigdata, sig + 2, hashl);
+ 	break;
+       }
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
index cca2511ea57..b6704a3d3bb 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;ta
            file://run-ptest \
            file://CVE-2026-9150.patch \
            file://CVE-2026-9149.patch \
+           file://CVE-2026-48863.patch \
 "
 
 SRCREV = "1e377699be108ec82bb798ec9c223d45d84a733c"

