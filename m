Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60BCC5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:00:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15957.1787576451463710869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ctloGyMO;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso31741295e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576450; x=1788181250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DhixAEf5yQU2VfSddTpF2UUxoGuZTP2p6bjyGGDjNfM=;
        b=ctloGyMO7U3q6/2Ydw/Xa3SXSq6xiUoBhajQuqZFbpCTokYtyNFC8MIDSf0bnQZVjl
         J/jZ/sP+cwtsTxOYsM5pKr/98+hMbB04LZZb6RxW2HIttF2/KdoNLDTMXu5JZnv2KTCM
         nHSD8hwJY9g/oBorMjvvsbp3cZFv1jbnnEOuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576450; x=1788181250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DhixAEf5yQU2VfSddTpF2UUxoGuZTP2p6bjyGGDjNfM=;
        b=et9HHr86oI5lSBHvs3LJ3Ryl7vbx8Af/vRR5FyQg/9BrJ/e6UaVQ0jsDCUgpnaCEFk
         uIHWf5ZCuBpqwfoxqdOgR9I6NH6yt8J1wfTtUTpnuMMwcRDHNtsBYNljyCgRHF7STnCY
         RXi0EJlhF/+gPwplplk5Ea+l/O1n5WzHSJYi8XlCE+uG1FXMgAeCjw1PQIXzOdMeV1Ho
         pV31QHc5i11hH5w/HDyB4ZectONmS5bM/jcvcxayvUneulD7NQjkYQYgmV8U52dtDiyF
         D4Ydvtm022pSauOaVsW6F8ZNrFygYhENPbDbMmPhHJS3IwzUSvhPQteX9PHn9ZVlffq2
         kxKw==
X-Gm-Message-State: AFuF++k9g+eEAQrLV62P2Oh78JdC3wMczhPYPENrHVV2+5dgegEoPrSo
	bzyPAGYpxbyDAOOIcd1lHC7PJ2gTqFFSJO0HLyz6Fs1zO/zE9KLf+QV5aT1p+bzSKyZqyeyBWU8
	tc1uWgOQ=
X-Gm-Gg: AR+sD13lP5Yc8f/gOk0QiEXyE8VBTzYTq6YolYRHbm4mkQG5S1jd5lA7RMyaCXxiL60
	eG1X/0K8HSc1f0AitScAmbdv7H4qTrK6ERyvqz6UFEYgESCw2NB6v5GXxegTLQ7kF8HCU/M0Rso
	CAcGZXq5/iOxKcCsrCASZdXnjqbqb+uMxoq+gmIcR0TWIZuUsVElSqkML8kg0FtkA/z9Is7XOTQ
	D3VLAph9cyBzHOR3hOzvWd+cpb5jLT7vpBTAT/dwLanyTXZUGZa6MCJHI1bSA6KHO2jvs7HnHza
	yYOGSkuebKx3MFW4zRHOQml1RreNBjJaGz91eKdrnhelYCBMkyzpYMSfLqTMI6xbbV+M7T3hamn
	yxB+h2O25UO2JfEWY4yhr83uN82faV8KrmIzjZ9k6wBhqMcS5FBFpwmj7d3ZdETyP8lL5Vsqp+o
	xb1lbIWTZexGQu1jMiy7XGqevWqTptdRwn5lxsEoZFO2b6KRrYAlOClahEmMmRIIFp8wMJTxvRD
	Sy1i+lK5mh3g8b59NXKGVJ3+9PfiXNjrlGcY0N6mcV/sGr/TL2hXlGaiov6u88yqX6wwSc=
X-Received: by 2002:a05:600c:190f:b0:499:873b:471c with SMTP id 5b1f17b1804b1-499b8333889mr306398735e9.6.1787576449495;
        Mon, 24 Aug 2026 06:00:49 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/19] cpio: patch CVE-2026-66484
Date: Mon, 24 Aug 2026 14:59:56 +0200
Message-ID: <d37ef92c4a220fcf68ff267f5ef63643cbcafae1.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244108

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE description.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: a49025d54fe7723df999710e7a385aaeb42303a2)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-extended/cpio/cpio_2.15.bb       |  1 +
 .../cpio/files/CVE-2026-66484.patch           | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66484.patch

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index 808a1222102..5ae6dc9ef9f 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://run-ptest \
            file://test.sh \
            file://CVE-2026-66485.patch \
+           file://CVE-2026-66484.patch \
            "
 
 SRC_URI[sha256sum] = "efa50ef983137eefc0a02fdb51509d624b5e3295c980aa127ceee4183455499e"
diff --git a/meta/recipes-extended/cpio/files/CVE-2026-66484.patch b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
new file mode 100644
index 00000000000..97ce9a785cf
--- /dev/null
+++ b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
@@ -0,0 +1,28 @@
+From e2b9cbdd3354d2b1569b7390d1bc15c1930559ad Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Thu, 23 Jul 2026 15:55:46 +0300
+Subject: [PATCH] The --no-absolute-filenames option affects hard link targets
+ too.
+
+* src/tar.c (stash_tar_linkname): Apply cpio_safer_name_suffix.
+
+CVE: CVE-2026-66485
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=e2b9cbdd3354d2b1569b7390d1bc15c1930559ad]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/tar.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/tar.c b/src/tar.c
+index 493f299..a1fc60a 100644
+--- a/src/tar.c
++++ b/src/tar.c
+@@ -37,6 +37,8 @@ stash_tar_linkname (char *linkname)
+ 
+   strncpy (hold_tar_linkname, linkname, TARLINKNAMESIZE);
+   hold_tar_linkname[TARLINKNAMESIZE] = '\0';
++  cpio_safer_name_suffix (hold_tar_linkname, true, !no_abs_paths_flag,
++  			  false);
+   return hold_tar_linkname;
+ }
+ 

