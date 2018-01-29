Return-Path: <sstncr@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id EC1FC787D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 14:39:02 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a88so5385053pfe.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 06:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Y07eP+cHACb8BynKufswz41sPUvGhU/IhWZr6juiZik=;
	b=oYSSXQW4bT0WmZCIIdj0Fl4C1OsDWOrpOeVemIvKEI8BY3uo3qkuWYIgoBWgl90ibk
	Cux8bmNCuPL1egpiGfOC1CslWTtIsS0gzXesTqaUXmk15nNzc4M6Wj7LpydjjSWcTl8s
	JW7UyV0lcexvSLp7fIEzRoCxyqnnffgT2YLIddzzwdU5fAN3fmOE0FYJJwIkMBOJDnMh
	nHiVsmyNuq0ERsKuj7BixgJDcCOkbezzgL75sNz0torL9zw9y2+kJ0VZcYS85PEzJB3h
	eAgb4pP5czJ56coSlrZnUCy7ZyHHVMsFv2JrvVLQbxr4AMNmTbZpbBvYaiP68FDp4gIp
	yS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y07eP+cHACb8BynKufswz41sPUvGhU/IhWZr6juiZik=;
	b=AQJjeA7HM/Fq1q76dzaOcLnkrdbwqvqQ7KuyiY/S/yBySMVyw8VEVSU3GmWodZKWkf
	w4yrlY83Vb6XbmYt6NdvRYLg+xIlJT+8FHuqreWtn4B17dDvPqXPjD3XwIYPPPMXuEs3
	zgvJqq2Yo3JEWnFZcVq2DqPOfWNAmpANZNmkzsibvpB4vmXp24GxDlRuZZOhyM/ICXnI
	R7P25r9zfTxuHX7CxZglP/pxMf2SDtl+8bgCNzmrpVAO46iu6tuambcGDfNm5k92/rVA
	mtPM5fxLuf1TRyhCT0U06WkuakuwaxsjkufJu06fas76pihPRYYKdZGrvhgwRT7mqr2G
	A0Ig==
X-Gm-Message-State: AKwxytdGaF6shdxmziEkf1cgAE96AwnYK0Nc6dmPu9O5O/TY53wwizcO
	UQu3/4uvcMr3Cv9/7wcGZHpVRwuV
X-Google-Smtp-Source: AH8x226GJAW7l5lq05NaZ3j/yEvwC3zDF1m09JDf8/c8jeAiGlJX5ejC4VkTK3Rl+D9qWiTopg11gg==
X-Received: by 10.99.168.5 with SMTP id o5mr21689087pgf.27.1517236743689;
	Mon, 29 Jan 2018 06:39:03 -0800 (PST)
Received: from ubuntu-xenial.corp.fitbit.com ([86.120.134.70])
	by smtp.gmail.com with ESMTPSA id
	m185sm18545503pfm.68.2018.01.29.06.39.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Jan 2018 06:39:03 -0800 (PST)
From: Stefan Stanacar <sstncr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 14:38:46 +0000
Message-Id: <1517236726-28726-1-git-send-email-sstncr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel.bbclass: Fix symlink creation when using externalsrc
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
X-List-Received-Date: Mon, 29 Jan 2018 14:39:03 -0000

do_unpack is by default in SRCTREECOVEREDTASKS so this append can't run, since
do_unpack gets removed by when externalsrc is enabled.

This was hidden because externalsrc does actually run do_fetch and do_unpack if
there are type=kmeta or file:// entries in the SRC_URI value of the kernel recipe.
(which is the case for linux-yocto).

Make this a separate task so that it actually gets run for kernel recipes with
no file:// or type=kmeta in SRC_URI.

Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2f6eca3..6a8d6e8 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -125,7 +125,7 @@ inherit ${KERNEL_CLASSES}
 # the symlink.
 do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
-base_do_unpack_append () {
+python do_symlink_staging_dir () {
     s = d.getVar("S")
     if s[-1] == '/':
         # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
@@ -142,6 +142,7 @@ base_do_unpack_append () {
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
+addtask do_symlink_staging_dir after do_unpack before do_patch do_configure
 
 inherit kernel-arch deploy
 
-- 
2.7.4


