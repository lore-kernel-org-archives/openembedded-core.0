Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF22601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 00:16:37 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id s8so3698861pfj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 17:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1JDDIVrsctwrKndp1mdmNabWIk7ZzGlqYWACHWqiKmA=;
	b=tBHWsoKn7GLbdas5hXDrB7SOOL4vRQ55YMyWX97T/UGMqtEpNg+d18+AYOckVJzchD
	4Uhz0QaFbKtrNt5JxoE7OEyMibP1canRWz23AMcYC2ae8Ob/L7P88MQ9R3mUtVJLPC9a
	WZbFoVVZgzhIEjDilqUcF7NBGVqaasveHd1ieUIevgTzGJvUMvnsTuZBtAzOpA8TBUlJ
	zLZp55VqPHFAF78FVp+gxWCkJssjVXMCaBtZ23V5f7SYRZIPdWUh/2q3Rkg6YrJoECZ2
	oyC/jjAMmCuhaM90V1jvWjJ9CtLlNk2NkodPl0AL8dOe1c7LJai+4YR4n71zcR4tFvN5
	IFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1JDDIVrsctwrKndp1mdmNabWIk7ZzGlqYWACHWqiKmA=;
	b=X+ZGglMa107Je8ro8KOpBDENqMs2NvhnPyRImc8MhtvjH3gn8igWoDpLsWsOcnzeF9
	wsucMmQyQB/l8HExY5LcMi7zWSYgCkTe6KRCYoj9wAtdUdJJyJQPC+OLNjjNDZOOiJsZ
	mU5cvEWaH4MMrxUt5LwRTuQ/uEzX1XEL+Idxk+bb6BTKut1lbWXdVr4vfAV1EESDkQ+F
	MpOCGoPPQM/qcXJdb/Fjira6i2V2eAQJFxNdTXcMkAZJPWmvuX/kmm96WaoRYdan1kP/
	nFBaYGWZYO7d6VIPdhc2YC3mpAnZrKuvF0t9fwHGy2Iocm4ays27kjUH+D4AXNWqdIXr
	nI4Q==
X-Gm-Message-State: AA6/9RkFseOWq5UrEWxdP7uQT5gJkSUkESr9jSFlXSt7JPoXRFDdnA7/Dfa3TVNQAC8QYw==
X-Received: by 10.99.107.130 with SMTP id g124mr4736336pgc.76.1476317799280;
	Wed, 12 Oct 2016 17:16:39 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	n87sm14442920pfb.3.2016.10.12.17.16.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Oct 2016 17:16:38 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2016 17:16:30 -0700
Message-Id: <1476317790-14542-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] binutils: fix for MIPS "Can't find matching LO16 reloc" errors
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
X-List-Received-Date: Thu, 13 Oct 2016 00:16:39 -0000

Patch taken from Binutils Bugzilla:

  https://sourceware.org/bugzilla/show_bug.cgi?id=20649

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.27.inc   |  1 +
 .../0015-binutils-mips-gas-pic-relax-linkonce.diff | 65 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-binutils-mips-gas-pic-relax-linkonce.diff

diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index 03b7bed..b0c5267 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -34,6 +34,7 @@ SRC_URI = "\
      file://0012-Add-support-for-Netlogic-XLP.patch \
      file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
      file://0014-libtool-remove-rpath.patch \
+     file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0015-binutils-mips-gas-pic-relax-linkonce.diff b/meta/recipes-devtools/binutils/binutils/0015-binutils-mips-gas-pic-relax-linkonce.diff
new file mode 100644
index 0000000..78b971a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-binutils-mips-gas-pic-relax-linkonce.diff
@@ -0,0 +1,65 @@
+Patch taken from Binutils Bugzilla:
+
+  https://sourceware.org/bugzilla/show_bug.cgi?id=20649
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+Index: binutils/gas/config/tc-mips.c
+===================================================================
+--- binutils.orig/gas/config/tc-mips.c	2016-09-29 05:12:31.000000000 +0100
++++ binutils/gas/config/tc-mips.c	2016-09-29 20:05:13.257411084 +0100
+@@ -1353,7 +1353,7 @@ static void s_mips_stab (int);
+ static void s_mips_weakext (int);
+ static void s_mips_file (int);
+ static void s_mips_loc (int);
+-static bfd_boolean pic_need_relax (symbolS *, asection *);
++static bfd_boolean pic_need_relax (symbolS *);
+ static int relaxed_branch_length (fragS *, asection *, int);
+ static int relaxed_micromips_16bit_branch_length (fragS *, asection *, int);
+ static int relaxed_micromips_32bit_branch_length (fragS *, asection *, int);
+@@ -4258,6 +4258,8 @@ mips_move_text_labels (void)
+   mips_move_labels (seg_info (now_seg)->label_list, TRUE);
+ }
+ 
++/* Duplicate the test for LINK_ONCE sections as in `adjust_reloc_syms'.  */
++
+ static bfd_boolean
+ s_is_linkonce (symbolS *sym, segT from_seg)
+ {
+@@ -14823,7 +14825,7 @@ mips_frob_file (void)
+ 	 constants; we'll report an error for those later.  */
+       if (got16_reloc_p (l->fixp->fx_r_type)
+ 	  && !(l->fixp->fx_addsy
+-	       && pic_need_relax (l->fixp->fx_addsy, l->seg)))
++	       && pic_need_relax (l->fixp->fx_addsy)))
+ 	continue;
+ 
+       /* Check quickly whether the next fixup happens to be a matching %lo.  */
+@@ -17043,7 +17045,7 @@ nopic_need_relax (symbolS *sym, int befo
+ /* Return true if the given symbol should be considered local for SVR4 PIC.  */
+ 
+ static bfd_boolean
+-pic_need_relax (symbolS *sym, asection *segtype)
++pic_need_relax (symbolS *sym)
+ {
+   asection *symsec;
+ 
+@@ -17068,7 +17070,6 @@ pic_need_relax (symbolS *sym, asection *
+   return (!bfd_is_und_section (symsec)
+ 	  && !bfd_is_abs_section (symsec)
+ 	  && !bfd_is_com_section (symsec)
+-	  && !s_is_linkonce (sym, segtype)
+ 	  /* A global or weak symbol is treated as external.  */
+ 	  && (!S_IS_WEAK (sym) && !S_IS_EXTERNAL (sym)));
+ }
+@@ -17507,7 +17508,7 @@ md_estimate_size_before_relax (fragS *fr
+   if (mips_pic == NO_PIC)
+     change = nopic_need_relax (fragp->fr_symbol, 0);
+   else if (mips_pic == SVR4_PIC)
+-    change = pic_need_relax (fragp->fr_symbol, segtype);
++    change = pic_need_relax (fragp->fr_symbol);
+   else if (mips_pic == VXWORKS_PIC)
+     /* For vxworks, GOT16 relocations never have a corresponding LO16.  */
+     change = 0;
-- 
1.9.1


