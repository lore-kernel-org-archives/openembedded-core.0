Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B87C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:44 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2822.1790154698527964404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bf2DZgwY;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so4670255e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154697; x=1790759497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EPcrx/GoqK6sNW8ul6E4tcDcXoMSSYL5Ib87SqCDo0Y=;
        b=bf2DZgwYCs0owHA8qMSvy4cdrqJNurG5FipWVY7i19S3RUdU2AiPpusgSHnHdnv2UX
         gfNws+LgvSH+dZM+BPV9j3jlwEBtfagfxnoxaOkfZJMw/DtDoRqKYDqPIRFtNsBN+XdZ
         7pdiQTih034u4ZyrUPRtT5UKNBGCL9h7R2mi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154697; x=1790759497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EPcrx/GoqK6sNW8ul6E4tcDcXoMSSYL5Ib87SqCDo0Y=;
        b=dBU2DWaN79fEFRp4X3bcQabLFTynujK2U3YJ6RB5mXH6q4O6t1Lhp80m+18FPTq4sq
         eUG3vzlq/PgD9twaU4/QiXkrRRpWoyfNB7KkGnfpnBfLkaALI4/8VVJOVeu0ewblHCMt
         XMrwFq4sJwlc+8s5hG9sWhyCLX4I1iBw2LFk+5hL0+46td+eLleNl4ZvRMYIJmMVYuBr
         SSnMXyE51eWFLzWEAa/BJiGWveOryqs3wBwlQsYVufjhl+A9EfnrqjGcdqxRsMbO7jJH
         oyq+x7aVh/UR38ux097vNMxKPWN4sgXiRd/n5p2UMXGrZapOAdyLgzadz/nJHhMA6Qqk
         wNSQ==
X-Gm-Message-State: AFuF++ny9ZElxijrwQBwdCHr138Xc4Se4nRMDTtN2Or9E3Q64aEwAZG5
	y3o2+fGAALvJDi1p+PJtfgs0juvLWDyuWwW8X9lZO20IvewhtszTOgJBASeCJTMA8j1msP9gSXR
	WDEPt1Ws=
X-Gm-Gg: AYBFou1PqnUJRsWNA9t/UNJpf9PJ0pF8wAT3toALUzQzrdzxzbZJMKN5NLlVGGgTVv/
	KZ4Jg4tmLBXLHvUngkxc+V0T7OJ2WRkFlCPehcbMKJCqy3s+4PhSnDJCAg5JcvKkoRufMEyMG8m
	KK0RbErX+VNe/M3LBRnbERO4YCXinHq6yYJf/NPboKN8C2rx1US0r1Hn8UtVY/kXzwqGvrwfBTr
	iuGwy8tgq4LC9CPsSphbKAOKDeURbt320daAQLJiXtUbpwrI81/di/doPQMJVVLwb26JA/P5C6g
	zH5Iur/YmVMu17q4a2qeN2lA0SC8NmtbbfEpa2fqGtMkBlZIHiMmyS+opj4eFfRqvzGtokBI9Pl
	uY27HP26QjsJJfIXNhltsgMOfyjZtGIb5+Udqsnlgi68GM09I/2s0QQ+odGcaBl2mnk1jfzNbSs
	otUbX16kk3IKFuMNAzS+ItRDm1iltlJpK08f3SI9Q7acgMRck2DCLlWWWbYx+kdrrKch4/c5Qru
	U1l9gC7dit8htg1BurA/yOPvY0gvH6TAGg69gU2s/bcl9GfJBu7dukAqozXb5BL1gJYKZRn
X-Received: by 2002:a05:600c:3b98:b0:49d:462:6eda with SMTP id 5b1f17b1804b1-49fdf139f27mr26866615e9.28.1790154696764;
        Wed, 23 Sep 2026 02:11:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/48] cpio: patch CVE-2026-66484
Date: Wed, 23 Sep 2026 11:10:19 +0200
Message-ID: <bc0c7e824c2a0b0df7c60c0a481877438bae805b.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246479

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE description.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: a49025d54fe7723df999710e7a385aaeb42303a2)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed the CVE: tag]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cpio/cpio_2.15.bb       |  1 +
 .../cpio/files/CVE-2026-66484.patch           | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66484.patch

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index f4b562fdc2c..62dcd444d5e 100644
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
index 00000000000..538f80daf9b
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
+CVE: CVE-2026-66484
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

