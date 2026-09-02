Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A467C61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5670.1788326810537290343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xbfkw6vg;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-484415c8cb1so468710f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326808; x=1788931608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GHEt83feZ7mEGXkJ8EGO1kZiv0uAX2NTdm98FC+NT4c=;
        b=xbfkw6vgSrRgl/HHvY0HSBRj1y7VGCENq3AhDoRIUMU0sGfebr8fP05q5wbR64kD3w
         QOboPs3VI32gYMSHuZXNSfMu9m0pfmiSjCWm9qwINw1iT1e6oXz7maKSSoTG5J/mhUu3
         W5kO3GZqYhTxZVmbfQvxoPXzDqfwSbJ7+f41M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326808; x=1788931608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GHEt83feZ7mEGXkJ8EGO1kZiv0uAX2NTdm98FC+NT4c=;
        b=htFbaYWiVY5ntI32cjJtjdJhutctzgz90zERIpHru/WtBO85OuXv4CfbP84hI5xSi3
         bC19bxg1+lGhSZr7qnAwnlDtpu13oN3YlUW9RNJlms2ndhaTp0jscmI7cSyGVBySGF+r
         CZV3SUUCEIgq8jP1+hQwlTpo67feCV4HKIfL4ubqMeyOkq8jPSc50WyKHKtHhSVAem9u
         3hf7IJtaOgDBiCrn3xryURzU/+w/Mt+r65MEU7Lt5mvB30wUtQykJHvdvsF1IbnpQ4yt
         ijf9y74gl02EPEHW7A1OZVUPd6HjE/FUSTZbm0jmtRyPV8siiEpaW+5QEQ3P7tzKun4X
         Mktw==
X-Gm-Message-State: AFuF++l5j6LDYkb1bKK6mGVx1Q7VDOhBdviT0f0FbMQIJFIxSOxdCXnv
	LJZ1Hj/WUzzeQ8puoMHQEtAz1bYF6qloYUWR+cASfW9Oam2ATGW5cmY7bxWsEMJHOKYqUwa6v9k
	UtKp+IlA=
X-Gm-Gg: AR+sD11mB1vVuev36uU9krlEOsGK963F46hfaG0i/QFR84PZGN8YND0KMoM24c/391p
	9pZCq3eDpNY7vHv5pXlZeqw878N8Etg43+maQOj5l6SRRsiB0rzHLcAjNi0HYPzqBxxxRDF5Thu
	SV5H0Cq0atu6miSFFWPVfcnET8R8llFb/RtUss2EglGLb7eQWyXYEkE6bXsUHpbCff4DG92O9QR
	y8Ri74LcEbMTUfr8e6inW1wZF0QTRcbTxp2hN8ys6Y+jFanorKrBt/slldgxXOzK/Lq6/rqExbz
	kFHKSMGYo4GztZqk8De2Kj4SkUCfXBX77mWDxJBhVY4vGLook7U7fsPXZsITcbw8WXulTwItRew
	Srv6ZQdrIxDwrA66+gQNUQ1XLnkMxW4RpbiitQXwOTnR8M7vnkK36R4sLvMnyaAUWVe7SHAgnC7
	VpA3lw6poWaZ1zjvkTplQ1Rds6YCXL8GR1JA0emTyW7tfWqwE+4WVSJK0YmsZd74gygX+8RXa8p
	cNhumC5Yj659GOJOA==
X-Received: by 2002:a05:600c:37c7:b0:49b:909e:922e with SMTP id 5b1f17b1804b1-49ce583d716mr38168675e9.10.1788326808524;
        Tue, 01 Sep 2026 22:26:48 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/27] libarchive: patch CVE-2026-5745
Date: Wed,  2 Sep 2026 07:25:26 +0200
Message-ID: <f35b64a303e5c3641a76576e69fe921a4b6166f9.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244860

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-5745

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libarchive/libarchive/CVE-2026-5745.patch | 39 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-5745.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-5745.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-5745.patch
new file mode 100644
index 00000000000..a060b081ad8
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-5745.patch
@@ -0,0 +1,39 @@
+From 5f7025543205106d64081cbafd8c345bf859b86f Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Sat, 18 Apr 2026 21:04:59 -0700
+Subject: [PATCH] Merge pull request #2905 from Patsakas/Patsakas-fix-acl-bug
+
+Fix NULL pointer increment in archive_acl_from_text_nl
+
+(Not a security issue, and arguably not really even a bug, but easy to fix regardless.)
+
+(cherry picked from commit 0b0b888f86b46e3b279f5f7c6eef0479f35978ee)
+
+CVE: CVE-2026-5745
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/5f7025543205106d64081cbafd8c345bf859b86f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_acl.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_acl.c b/libarchive/archive_acl.c
+index ab601833..14a107a4 100644
+--- a/libarchive/archive_acl.c
++++ b/libarchive/archive_acl.c
+@@ -1718,7 +1718,6 @@ archive_acl_from_text_nl(struct archive_acl *acl, const char *text,
+ 
+ 			tag = 0;
+ 			s = field[n].start;
+-			st = field[n].start + 1;
+ 			len = field[n].end - field[n].start;
+ 
+ 			if (len == 0) {
+@@ -1726,6 +1725,8 @@ archive_acl_from_text_nl(struct archive_acl *acl, const char *text,
+ 				continue;
+ 			}
+ 
++			st = s + 1; 
++
+ 			switch (*s) {
+ 			case 'u':
+ 				if (len == 1 || (len == 4
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index fb6ed5686df..b36632cc1fe 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -50,6 +50,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2026-4424-1.patch \
            file://CVE-2026-4424-2.patch \
            file://CVE-2026-5121-02.patch \
+           file://CVE-2026-5745.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

