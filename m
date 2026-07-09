Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3789C44509
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5810.1783591632434396806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S6BNsGog;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c7902f47so12975165e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591631; x=1784196431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P3etCHOUtgrargOsAUyr6TshCsDa6Y2PpKT6TU+YTYY=;
        b=S6BNsGog/Ld/8KUJYXKl7Pl9wSm3c4Uny7IP8RpjIffJICN18jE4CP/zKNIA+0ikPa
         yxY/G56dIfdHk2bzevBqE9tp+yIoDmq6zdBB5MsdH6s9Ll7S9hAHuIombYtnNIM9pd6E
         mLTWKWE20jgIHC3u8h7hAc2C6E4t9bY2l5sdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591631; x=1784196431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=P3etCHOUtgrargOsAUyr6TshCsDa6Y2PpKT6TU+YTYY=;
        b=C8QCm/6liLtH5ipulUEaMWx+nqDoTYYESy9ETCxuhM7MCaqcnAB4Jwj1+tr74GS839
         lLk/7Rw4iz5kVqPASVhY+MPJxOx1grp49D4+F7+FwVUWXK1Q3CNu7Lvvd6LkerqOHTbN
         pnNbMoI/sP1v1QxnJ+dcuwqbODefsDjX2UoJ2yP3eVJ4r8JtvzGAcaxslx0nRNJ22TpC
         5yDGdWmOtkkw4YddM0l+9F/lXuBgTrujZvwNPmpEyZ5oKuiiMSvvbnsUpXd70WzxzCok
         9VYY6bEyMwKVL4/5cDQwADo6zjR39vHS52jAKgb0s/Q6cg141dBJnxMlzeajMsXFkWgs
         vqjg==
X-Gm-Message-State: AOJu0YyYh/fLN8tB1uNIAt6kJHcNJ1LNFUaH01nHlAfWo8LkP+e8GRN9
	fHgPMYYFu3xrclYMnN73zEhAJl0FDH1l10WWMmD10vBfpbVFs2OkWBxZWUnNfgYkmuD1V8Bs771
	/t0vQ7Fk=
X-Gm-Gg: AfdE7cmE8zGVswlUdruCPvFwwcdNEfXjnLldsQQsmw7KvlUxppXchdkNGg7KSNHs/TQ
	eGIQulP1kkIfP2RI4niEbpUlFHFMwJLvm/XFEeaLusTrMvRs5dJWMDV1lmD6PxVdYR1eCvA/kqH
	yoxkjiHCjk5aKLfsCeQe+OSHilG4jwVBMkpgcW2nqwXLRIzaIkFm/ZxxBHD4O6DU8/k4GALTloB
	Iq+Jv1C5rFsrjp7zXF/atjlOKn5kW8KbidVT7zYTV1jXEuH/F9dMDipGhp3TtDC7ssv6iQzjy5y
	v077PQJ4I7rcbC0cqmhCVrW9rmiyOV5WQUk/NUm229NdA6QYGHvmQiGuhyU7Wnq1sPv3MOt+TEF
	9gOmFBfaU+sTe814xFL+LFovwwFO2itw4rNKlnWFpBL27Kwg+Tae12yDt3gHl3F1fKMMo2YROxD
	CL1DFsoik2RkgJR6lqKUfrpRtQCGFEKDXHpcx7TtlAur8mqmsOD7nwGRm2mxbT7TaxVs3lrYGgw
	7R9rkwwOCVBA7r+xQ==
X-Received: by 2002:a05:600c:630a:b0:493:c84c:2b57 with SMTP id 5b1f17b1804b1-493e686c848mr61109365e9.29.1783591630556;
        Thu, 09 Jul 2026 03:07:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/25] binutils: Fix CVE-2026-6846
Date: Thu,  9 Jul 2026 12:06:33 +0200
Message-ID: <bab9ec27c2c5bd5a25efb39e3f34c064b4a3f1cd.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240563

From: Shubham Pushpkar <spushpka@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7a089e0302382f4d4e077941156e1eaa68d01393
[2] https://security-tracker.debian.org/tracker/CVE-2026-6846

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2026-6846.patch     | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 7e83f72632f..3ed80a82924 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -74,5 +74,6 @@ SRC_URI = "\
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69644-CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
+     file://CVE-2026-6846.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
new file mode 100644
index 00000000000..8eaca87583d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
@@ -0,0 +1,57 @@
+From 2a340616f7e6591f83e85777d1d1f6108c33f5b8 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 6 Apr 2026 22:58:22 +0930
+Subject: [PATCH] PR 34049 buffer overflow in xcoff_link_add_symbols
+
+The fact that coffcode.h:coff_set_alignment_hook for rs6000 removes
+sections can result in target_index > section_count.  Thus any array
+indexed by target_index must not be sized by section_count.
+
+	PR ld/34049
+	* xcofflink.c (xcoff_link_add_symbols): Size reloc_info array
+	using max target_index.
+
+CVE: CVE-2026-6846
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a089e0302382f4d4e077941156e1eaa68d01393]
+
+(cherry picked from commit 7a089e0302382f4d4e077941156e1eaa68d01393)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ bfd/xcofflink.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 6ef9abcd8..196967ed0 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -1300,6 +1300,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+   } *reloc_info = NULL;
+   bfd_size_type amt;
+   unsigned short visibility;
++  unsigned int max_target_index;
+
+   keep_syms = obj_coff_keep_syms (abfd);
+
+@@ -1363,7 +1364,19 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+      order by VMA within a given section, so we handle this by
+      scanning along the relocs as we process the csects.  We index
+      into reloc_info using the section target_index.  */
+-  amt = abfd->section_count + 1;
++  max_target_index = 0;
++  for (o = abfd->section_last; o != NULL; o = o->prev)
++    if (o->target_index != 0)
++      {
++	/* The last section added from the object file will have the
++	   highest target_index.  See coffgen.c coff_real_object_p and
++	   make_a_section_from_file.  Sections added by
++	   xcoff_link_create_extra_sections will have a zero
++	   target_index.  */
++	max_target_index = o->target_index;
++	break;
++      }
++  amt = max_target_index + 1;
+   amt *= sizeof (struct reloc_info_struct);
+   reloc_info = bfd_zmalloc (amt);
+   if (reloc_info == NULL)
+--
+2.35.6

