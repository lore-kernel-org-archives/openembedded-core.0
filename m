Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id C285F780B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:32 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id o17so7598687pli.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8KCJXzbiEwg38Twegu5fIFflsxTYOn7Pe5CpmvXwZSQ=;
	b=rJ4CxryOn0Mj41Q468Wa92BX3yj0tRaJY17aoey/+0QRibtB8w/mBk21HcVPZoZHdm
	wE6/Ie9rn6porLqSSM6dWG5DR7pQtpZG1+FzMFKW7kSqGMygb7fup2V8NIFZaObLJ6ob
	n3QwzONczKbsycLt2ZQ3Rt3EulTuqTv99vPRufSgpWl5KAGKx4K7AFJBF5P3H5b9n6Df
	xhYYruxJnBx7j/gJa7Bh7OnTMlEablYoT/TCtTnNdH4WxPjEGogHoPTMhoO+abVpFrhU
	RsFhNixIQQ5NIpsH/YRtm+Uj9biklaHCzkj3cZSvkHX+15UWHgAt2yh3x4JlKx1sxham
	E3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8KCJXzbiEwg38Twegu5fIFflsxTYOn7Pe5CpmvXwZSQ=;
	b=shBHosDHRcRxYaTW6SfDSjxAAcB1Oe8l1Ex+ETNjExdEoS9HlH8/pBOnLJPRh8g8cs
	Ud4feCg29XNJuS0xJYoW3ER8mbF/P2QYIAF7ctBacDVdws/aRPX/XNFHx3gvkCaC91jx
	10ZusmvFIuaYpBET2DF8THmptiRLW/juaEPbiAkdYBWPD6Ii3K3IPXXtxpDsdivUcq9R
	QS5lHfyQnXFaj2Oa3JyLYQWqLMgeuRZJiMhZaE5/QJ9pGDQO2zEieQIyKwGTCAbFnAgp
	JYAXC2hzbczZKfxhZlwhxZFD7iJ0eG2bhzuuGc3iluJBlMjNuY+9RATeiL+f5dQi3+PT
	0Miw==
X-Gm-Message-State: AJaThX4ihv9LLJaXVk1qsg2Jkn331qwFs7HmdwU0poGq/OPZtfGV6k+x
	mAMFVyWrdNR0Tc+QVVzdGKhmwg==
X-Google-Smtp-Source: AGs4zMZrN5gwddC+Gywbxb2rf7MMsezaRLnJKO0cjcbepdDA4j5uZXGUVZeZ6RPrwVb8/rao6vMc9w==
X-Received: by 10.159.216.150 with SMTP id s22mr36495747plp.158.1511750134074; 
	Sun, 26 Nov 2017 18:35:34 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:08 -0800
Message-Id: <1511750112-2263-22-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 22/26] binutls: Security fix for CVE-2017-9753
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:33 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9753.patch          | 79 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9753.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 68d21c8..c6ef647 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -64,6 +64,7 @@ SRC_URI = "\
      file://CVE-2017-9750.patch \
      file://CVE-2017-9751.patch \
      file://CVE-2017-9752.patch \
+     file://CVE-2017-9753.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9753.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9753.patch
new file mode 100644
index 0000000..241142b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9753.patch
@@ -0,0 +1,79 @@
+From 04f963fd489cae724a60140e13984415c205f4ac Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 14 Jun 2017 10:35:16 +0100
+Subject: [PATCH] Fix seg-faults in objdump when disassembling a corrupt
+ versados binary.
+
+	PR binutils/21591
+	* versados.c (versados_mkobject): Zero the allocated tdata structure.
+	(process_otr): Check for an invalid offset in the otr structure.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9753
+CVE: CVE-2017-9754
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog  |  6 ++++++
+ bfd/versados.c | 12 ++++++++----
+ 2 files changed, 14 insertions(+), 4 deletions(-)
+
+Index: git/bfd/versados.c
+===================================================================
+--- git.orig/bfd/versados.c
++++ git/bfd/versados.c
+@@ -149,7 +149,7 @@ versados_mkobject (bfd *abfd)
+   if (abfd->tdata.versados_data == NULL)
+     {
+       bfd_size_type amt = sizeof (tdata_type);
+-      tdata_type *tdata = bfd_alloc (abfd, amt);
++      tdata_type *tdata = bfd_zalloc (abfd, amt);
+ 
+       if (tdata == NULL)
+ 	return FALSE;
+@@ -345,13 +345,13 @@ reloc_howto_type versados_howto_table[]
+ };
+ 
+ static int
+-get_offset (int len, unsigned char *ptr)
++get_offset (unsigned int len, unsigned char *ptr)
+ {
+   int val = 0;
+ 
+   if (len)
+     {
+-      int i;
++      unsigned int i;
+ 
+       val = *ptr++;
+       if (val & 0x80)
+@@ -394,9 +394,13 @@ process_otr (bfd *abfd, struct ext_otr *
+ 	  int flag = *srcp++;
+ 	  int esdids = (flag >> 5) & 0x7;
+ 	  int sizeinwords = ((flag >> 3) & 1) ? 2 : 1;
+-	  int offsetlen = flag & 0x7;
++	  unsigned int offsetlen = flag & 0x7;
+ 	  int j;
+ 
++	  /* PR 21591: Check for invalid lengths.  */
++	  if (srcp + esdids + offsetlen >= endp)
++	    return;
++
+ 	  if (esdids == 0)
+ 	    {
+ 	      /* A zero esdid means the new pc is the offset given.  */
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -8,6 +8,10 @@
+        (ieee_archive_p): Likewise.
+ 
+ 2017-06-14  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/21591
++       * versados.c (versados_mkobject): Zero the allocated tdata structure.
++       (process_otr): Check for an invalid offset in the otr structure.
+  
+        PR binutils/21589
+        * vms-alpha.c (_bfd_vms_get_value): Add an extra parameter - the
-- 
2.7.4


