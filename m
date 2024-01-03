Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5B3C47077
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 14:59:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.19165.1704293946543822486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 06:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Je9Yxsaj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-336990fb8fbso8274006f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 06:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704293944; x=1704898744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wl0OdlDDOItrqDTJHKzgWdYVE2GOFvo91gpUy1efj4=;
        b=Je9YxsajSM7XR4EPCwMbj6Rcj6o1G30KOy4jgi+gTlAE04QhnV80nvW6TF34pPs8vf
         TvYPRZehgtOQ2G5FZ4i0FtLRHPZKKmmRcFck/W7r/TdD1YKomvTuI+JRNHPxNupHRMYH
         1s87/dHViQiPYfqKctHusemGHTKvFv+4jMleM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293944; x=1704898744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wl0OdlDDOItrqDTJHKzgWdYVE2GOFvo91gpUy1efj4=;
        b=pZICU9W3QeGBY1qmce8MYhG4cU6EkhpQHju0yZyNq6jbJYLWLcBASwak7Bftzpjwwa
         arBe+bu36Dv/go8FpGN1BXgFajClgpxd6zIK6YMZrx6dkh+dRrTUTlII0DoqxGWY7rUX
         qelfQVUEFv320QssPzAxCmVOZYJV6CjBQckcrdpvwxThYenD+t6TBnVk2K0cfEBcisyn
         p3WM2VIZVf2dBX1IXJuBQLL0uN82ID2xIFX2jk0dA+5rbToYPGWZAyMcvk4qct8dotxL
         LNNQ7iVMXygLvKqkXA3DZ2lOCceN6fZz2RUB4io0gXJ8CqxIAvpO9WX0QppmVic//KGZ
         SEsw==
X-Gm-Message-State: AOJu0YynJklzIi9Zz6ch2N/YKtNRsceYjHVWKyq+e01N9gE238P09NpR
	PDxM0q0zmOLGr5YMz761GoXizj96p9tjY++Bu3Qd61BMxsc=
X-Google-Smtp-Source: AGHT+IGOxdvEHAsizfO2YMu/DZEl+6Kyx4C8PwpSCG7TRhaPElNovYLBmgxekDMhdNZz4MI5VX8XzQ==
X-Received: by 2002:adf:ee0b:0:b0:337:3a52:9aca with SMTP id y11-20020adfee0b000000b003373a529acamr2657770wrn.136.1704293944761;
        Wed, 03 Jan 2024 06:59:04 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a0e2:8719:e940:13c9])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d4612000000b003367bb8898dsm30992081wrq.66.2024.01.03.06.59.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:59:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] rootfs: Fix MULTILIB_RE_ALLOW to be inherit order independent
Date: Wed,  3 Jan 2024 14:59:00 +0000
Message-Id: <20240103145902.2124110-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
References: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 14:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193289

This variable is only used by the ipk backend with multilibs.

In order to make it work correctly regardless of inherit order, change
the string to be space delimeted, set using += and add in the regex '|'
sperator at the end of processing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/image.bbclass         | 2 +-
 meta/classes-recipe/rootfs_ipk.bbclass    | 2 +-
 meta/lib/oe/package_manager/ipk/rootfs.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 7231fad940d..6bdddc0134c 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -609,7 +609,7 @@ python create_symlinks() {
             bb.note("Skipping symlink, source does not exist: %s -> %s" % (dst, src))
 }
 
-MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
+MULTILIBRE_ALLOW_REP += "${base_bindir} ${base_sbindir} ${bindir} ${sbindir} ${libexecdir} ${sysconfdir} ${nonarch_base_libdir}/udev /lib/modules/[^/]*/modules.*"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 
diff --git a/meta/classes-recipe/rootfs_ipk.bbclass b/meta/classes-recipe/rootfs_ipk.bbclass
index a48ad07dfc8..87fff53a588 100644
--- a/meta/classes-recipe/rootfs_ipk.bbclass
+++ b/meta/classes-recipe/rootfs_ipk.bbclass
@@ -29,7 +29,7 @@ OPKG_POSTPROCESS_COMMANDS = ""
 
 OPKGLIBDIR ??= "${localstatedir}/lib"
 
-MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg|/usr/lib/opkg"
+MULTILIBRE_ALLOW_REP += "${OPKGLIBDIR}/opkg /usr/lib/opkg"
 
 python () {
 
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index 1f74f7e39a9..ba93eb62ea8 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -165,7 +165,7 @@ class PkgRootfs(DpkgOpkgRootfs):
     """
     def _multilib_sanity_test(self, dirs):
 
-        allow_replace = self.d.getVar("MULTILIBRE_ALLOW_REP")
+        allow_replace = "|".join((self.d.getVar("MULTILIBRE_ALLOW_REP") or "").split())
         if allow_replace is None:
             allow_replace = ""
 
-- 
2.39.2


