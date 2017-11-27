Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id F30C47822A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:26 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id v15so7604720plk.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0YEOjS17RCGxpKYC67E8lk/NeUts5Pf4r1fR5H2Dkjs=;
	b=uDRDIai2pWuNOPbyo/2y44zSKtzHZ+zZThHVpVXeYTRnli7A+Dw6KSZxSa6pO9aKz1
	BvSjVGGpJA9LYTuKaHBnQbcuT+EElG+vUPVA+kBWHpd3iCdRY/MeB4yZo7s4GPuNmxwg
	Fvh1iblQQWX/4HrVxP6MqF81bQL3YG348dS+GE0rAbp8gE5aCbrKH8PvCA6Nf++HOX2O
	ce+GogzCc+dGl+ePHEctdT6ngwA4heTFohQVHKKjn8u3pskdkqkZU5DygLmETAWcyadF
	E0Y91Ei3VgBrfEWTQKqGi2/Ld/s1kzzBK4ObWlYAErmAukZ58cci4CeQ+X020J3mvJ9g
	m2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0YEOjS17RCGxpKYC67E8lk/NeUts5Pf4r1fR5H2Dkjs=;
	b=q8XRV2H2VdI1GSJJi0UJ3WIQmi0TuFnt/2EDOJ3B8ucpina/p8V5/MFOVNF7hnP1Ua
	5AdedReSxmlkBHxb85BwsZ8oCpN9NWdlQEfBv7/boJStV6H6/o/ojzwzJpLpDBkJolVN
	drr2TBRqh2Q7TpqRabyfnmg0U/XKN4OBT2XovEEZnvaBikPZUWDvWHwshRiw4dQOhhn+
	NXiAUfDhqM3cwzAzjhFPG7+3msRxXKYgMJzMN40xNM1QPrBV613J3cqzffxQ0govO5BR
	iHxmw12n1DYd7n26dyRs4C30WPkqG6ksScfrScl0jj5o5/C50wA+oSsOVJn9f7GM6ew6
	ZDtQ==
X-Gm-Message-State: AJaThX7/oc6VHc3t0/YAUYmKEfAX9uyozQl1UB6wo5jHn+MCWR1B8m7B
	im/8opzPJsSrLBnhOdl9U3A=
X-Google-Smtp-Source: AGs4zMZTvkBXeAlMeScv6JsYm/yl9m6XVBcdCzdQpGszk9Mnh2pwl1paEJPcgwf31DDlCTQ5Bu66cQ==
X-Received: by 10.159.247.15 with SMTP id d15mr33737947pls.88.1511750128336;
	Sun, 26 Nov 2017 18:35:28 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:02 -0800
Message-Id: <1511750112-2263-16-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 16/26] binutls: Security fix for CVE-2017-9747
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Nov 2017 02:35:27 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9747.patch          | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9747.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 235306b..6822adb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -58,6 +58,7 @@ SRC_URI = "\
      file://CVE-2017-9744.patch \
      file://CVE-2017-9745.patch \
      file://CVE-2017-9746.patch \
+     file://CVE-2017-9747.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9747.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9747.patch
new file mode 100644
index 0000000..41ead54
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9747.patch
@@ -0,0 +1,43 @@
+From 62b76e4b6e0b4cb5b3e0053d1de4097b32577049 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 15 Jun 2017 13:08:47 +0100
+Subject: [PATCH] Fix address violation parsing a corrupt ieee binary.
+
+	PR binutils/21581
+	(ieee_archive_p): Use a static buffer to avoid compiler bugs.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9747
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 2 ++
+ bfd/ieee.c    | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+Index: git/bfd/ieee.c
+===================================================================
+--- git.orig/bfd/ieee.c
++++ git/bfd/ieee.c
+@@ -1357,7 +1357,7 @@ ieee_archive_p (bfd *abfd)
+ {
+   char *library;
+   unsigned int i;
+-  unsigned char buffer[512];
++  static unsigned char buffer[512];
+   file_ptr buffer_offset = 0;
+   ieee_ar_data_type *save = abfd->tdata.ieee_ar_data;
+   ieee_ar_data_type *ieee;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2017-06-15  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/21581
++       (ieee_archive_p): Likewise.
++
+ 2017-06-14  Nick Clifton  <nickc@redhat.com>
+  
+        PR binutils/21578
-- 
2.7.4


