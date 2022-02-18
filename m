Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75778C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.9079.1645178788318551793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D7zN+eRI;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id o24so13661786wro.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MtPCvJ42HAP2eVp5pg3KHSH7DPmKG/z69jl4B5lE7lA=;
        b=D7zN+eRIpvvfKd4ZQjPr9SZHtQMBQoHBoTthfJ4RKh72fI7Dh5POLvgCUWE3yt2wIc
         2WbglPhcYRUbHhjLuzj6ozlL5/4Xl9JwLlI6yLivGyweOsAJO+bT1m85qa7RUxh8Mx/n
         mtzYirbJ6HTpB/YV9A6fGbWJLssEXIEKBIWFl2uByhwv1Jc3gF33kMhmfbUkPvI5onUU
         jbD6hC2gLxOZslCKQxRS+lZzxIhFY4WpPeF6oThU2im/UU12WLCpF22AWmaxnbe5pew3
         5A9otu5uK/WtJYwk7U7oNEFjySBmr28M7eaMLSy5p74VUyIPqqJ0bh4lfesSoX1ztdrl
         AJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MtPCvJ42HAP2eVp5pg3KHSH7DPmKG/z69jl4B5lE7lA=;
        b=YIFKrI8XIzQg5FTA3ajkM8g6+Kg8Un85RdEuBgFkCNwelFBOf8MncSoS8Ir3DZIu1t
         lyKCEMG64agJss6yNW8n2dSecds9Cg33Y5gd5afyWloIzG9zLkOh2xNq8IA8d3FCaFgr
         bIgmFC5lBwU4FcQARZeszn08JjuhvsO04968T/Wm1wONZeIQh3KSov0AgeSzX3XPcTb/
         7O7ZMn6s5sxqynm9vzpJEKNsBmx+/VTOV9RVdBnp10Y6zTU57VA7/0I7CfxIzlBv2e1l
         FEfQgI0qguB2113lvneEQuFD11AYt/7zJHsX9QAxasJMkblet0CYxqD+dQ3sgGVGlzGo
         sP4A==
X-Gm-Message-State: AOAM530VYgYfKY5J2V6Vg6WyKj7lEbqYQlK/S/wbGIoGw1sXlTbMMlN9
	usErh42i+qwl7+ILc+tl2rQ=
X-Google-Smtp-Source: 
 ABdhPJx4AKW6IG6K384kWf6aQa2O2SovSx1rF0pbCbF+0dtAR8kx2q2iLmkQbGoWblRAdCC693482g==
X-Received: by 2002:a5d:522a:0:b0:1e3:36c0:6e76 with SMTP id
 i10-20020a5d522a000000b001e336c06e76mr5640475wra.11.1645178786863;
        Fri, 18 Feb 2022 02:06:26 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:26 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 10/46][dunfell] grub: add a fix a NULL pointer dereference in
 gnulib
Date: Fri, 18 Feb 2022 11:05:18 +0100
Message-Id: <20220218100554.1315511-11-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161898

This change adds a fix for a NULL pointer dereference of state
in gnulib. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...-Fix-dereference-of-a-possibly-NULL-.patch | 52 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch

diff --git a/meta/recipes-bsp/grub/files/0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch b/meta/recipes-bsp/grub/files/0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch
new file mode 100644
index 0000000000..102a494561
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch
@@ -0,0 +1,52 @@
+From eaf9da8b5f8349c51cfc89dd8e39a1a61f89790a Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Wed, 28 Oct 2020 14:43:01 +0000
+Subject: [PATCH] gnulib/argp-help: Fix dereference of a possibly NULL state
+
+All other instances of call to __argp_failure() where there is
+a dgettext() call is first checking whether state is NULL before
+attempting to dereference it to get the root_argp->argp_domain.
+
+Fixes: CID 292436
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3a37bf120a9194c373257c70175cdb5b337bc107]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ conf/Makefile.extra-dist                             |  1 +
+ .../lib/gnulib-patches/fix-null-state-deref.patch    | 12 ++++++++++++
+ 2 files changed, 13 insertions(+)
+ create mode 100644 grub-core/lib/gnulib-patches/fix-null-state-deref.patch
+
+diff --git a/conf/Makefile.extra-dist b/conf/Makefile.extra-dist
+index 9e55458..96d7e69 100644
+--- a/conf/Makefile.extra-dist
++++ b/conf/Makefile.extra-dist
+@@ -29,6 +29,7 @@ EXTRA_DIST += grub-core/genemuinit.sh
+ EXTRA_DIST += grub-core/genemuinitheader.sh
+ 
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-null-deref.patch
++EXTRA_DIST += grub-core/lib/gnulib-patches/fix-null-state-deref.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-uninit-structure.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-unused-value.patch
+ EXTRA_DIST += grub-core/lib/gnulib-patches/fix-width.patch
+diff --git a/grub-core/lib/gnulib-patches/fix-null-state-deref.patch b/grub-core/lib/gnulib-patches/fix-null-state-deref.patch
+new file mode 100644
+index 0000000..813ec09
+--- /dev/null
++++ b/grub-core/lib/gnulib-patches/fix-null-state-deref.patch
+@@ -0,0 +1,12 @@
++--- a/lib/argp-help.c	2020-10-28 14:32:19.189215988 +0000
+++++ b/lib/argp-help.c	2020-10-28 14:38:21.204673940 +0000
++@@ -145,7 +145,8 @@
++       if (*(int *)((char *)upptr + up->uparams_offs) >= upptr->rmargin)
++         {
++           __argp_failure (state, 0, 0,
++-                          dgettext (state->root_argp->argp_domain,
+++                          dgettext (state == NULL ? NULL
+++                                    : state->root_argp->argp_domain,
++                                     "\
++ ARGP_HELP_FMT: %s value is less than or equal to %s"),
++                           "rmargin", up->name);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index df2c8b8a16..94873475c1 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -56,6 +56,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch \
            file://0008-gnulib-regexec-Resolve-unused-variable.patch \
            file://0009-gnulib-regcomp-Fix-uninitialized-token-structure.patch \
+           file://0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


