Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8F4745FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 05:48:51 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f21-v6so7986238wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 22:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uYpere2D2rbl99u7QuOBBhyDALXrwBUxuNrNJV90kZc=;
	b=XPyczDRhNaNSsddddfcniJOBbDOubx+E/u3rAv0Gj9xK2/QVKNtnCiLIRjgreid/sw
	ZdHV1N0waIIPKDLNlEvemdWzrIJfIuV2gzj+0Dkx0u0GwnLQcU8CuP2uk6rRLs6JK60R
	k8PNkxZGKjroXmTkBkKyEpmacwKTlij4Dc0Pa/G9bi0v8dJlBELYyMBIXfNND4rK/QJk
	eySQUG9Gpeq2qdz5PQWu1D8XDtv72lbuS3dA7tlWXdqu4pdVyOYlQUsY+dDqTheZUyfB
	JAGQClIX1gvgdneVNl1JFFhObwsMMjWclRsNu+8rlbyTq65dgh+VhOokWH752OF+xrku
	O7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uYpere2D2rbl99u7QuOBBhyDALXrwBUxuNrNJV90kZc=;
	b=o/MVgJW4dwzWCNNP9McY5LAgHLUqpbSmGmelo0Ih6UIIAfFnrfaYfMMSpSbEeaN24G
	wUFYAVtxaPDBlKF92/tCGTc4UzjzdDkgkRQ/sHlNSaBign/QZKxDoNjpmxSA7rNHEEU7
	jqWE7nIdeQ5hZcYs6vjUZX9Nn3+zLaZykNq59GuqoLf3wV8WRLvjJXybZzCNOJD6SHzR
	XUEUi+4uLSbZInGlu7cn2j/DRcB506Z/9W1zAfXmz443zajRc4+3JeQf/5kVYnAEt9uW
	kOKrV7xDSJ2tFu4ptjEoYxe7VV8WNBckqemEb+dMDHKy/2qBx1MMrg7TEhvNnjv57n7h
	e2vA==
X-Gm-Message-State: APzg51BXVCYDsGmbZ/BSussUa3yEwsA1KUrht1Ikiq/Oe9b7A1TUvVx1
	iKFWDBe0O9ooQrJIs692DSzDXUtK
X-Google-Smtp-Source: ANB0VdYgQBjcPXusik4WSQLSbVS0xoc9tkNsDWkWqrFcbiOHmmlgtcMF400siVvPYiwKO739n3q4tw==
X-Received: by 2002:a1c:bd84:: with SMTP id
	n126-v6mr10142763wmf.67.1537163331796; 
	Sun, 16 Sep 2018 22:48:51 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l24-v6sm35729195wrb.65.2018.09.16.22.48.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Sep 2018 22:48:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2018 05:48:43 +0000
Message-Id: <20180917054844.12934-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180917054844.12934-1-Martin.Jansa@gmail.com>
References: <20180917054844.12934-1-Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] dummy-sdk-package.inc: work around MACHINE_ARCH SSTATE_MANMACH
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
X-List-Received-Date: Mon, 17 Sep 2018 05:48:51 -0000

* since following change:
  allarch: only enable allarch when multilib is	not used
  the sstate-diff-machines.sh reports different signature for target-sdk-provides-dummy
  when multilib is enabled

 === Comparing signatures for task do_populate_sysroot.sigdata between qemux86 and qemux86copy ===
ERROR: lib32-target-sdk-provides-dummy different signature for task do_populate_sysroot.sigdata between qemux86 and qemux86copy
basehash changed from b0a44b2c7003b6b4aa3a023d9cb9fe82 to 3a59fa25ddb6a95aff079d477ebf3457
Variable SSTATE_MANMACH value changed from 'qemux86' to 'qemux86copy'

ERROR: target-sdk-provides-dummy different signature for task do_populate_sysroot.sigdata between qemux86 and qemux86copy
basehash changed from 9e44f1deb3d15886ee96db1a3332764c to 6b417d08a5113c9b06d13b3681f5ab4f
Variable SSTATE_MANMACH value changed from 'qemux86' to 'qemux86copy'

It's using:
inherit allarch

python() {
    # Put the package somewhere separate to ensure it's never used except
    # when we want it
    # (note that we have to do this in anonymous python here to avoid
    # allarch.bbclass disabling itself)
    d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')
}

and DUMMYARCH = "sdk-provides-dummy-target"

The difference as shown with bitbake -e before and after reverting allarch.bbclass commit:

before revert:
   $SSTATE_MANMACH [2 operations]
     set? oe-core/meta/classes/sstate.bbclass:61
       "${SSTATE_PKGARCH}"
     set sstate.bbclass:100 [__anon_111_oe_core_meta_classes_sstate_bbclass]
       "machineName"
   pre-expansion value:
     "machineName"
SSTATE_MANMACH="machineName"

   $SSTATE_PKGARCH
     set oe-core/meta/classes/sstate.bbclass:11
       "${PACKAGE_ARCH}"
SSTATE_PKGARCH="sdk-provides-dummy-target"

   $PACKAGE_ARCH [3 operations]
     set oe-core/meta/conf/bitbake.conf:150
       [_defaultval] "${TUNE_PKGARCH}"
     set oe-core/meta/conf/documentation.conf:304
       [doc] "The architecture of the resulting package or packages."
     set dummy-sdk-package.inc:12 [__anon_12_oe_core_meta_recipes_core_meta_dummy_sdk_package_inc]
       "${DUMMYARCH}"
   pre-expansion value:
     "${DUMMYARCH}"
PACKAGE_ARCH="sdk-provides-dummy-target"

after revert:
   $SSTATE_MANMACH
     set? oe-core/meta/classes/sstate.bbclass:61
       "${SSTATE_PKGARCH}"
SSTATE_MANMACH="allarch"

   $SSTATE_PKGARCH [2 operations]
     set oe-core/meta/classes/sstate.bbclass:11
       "${PACKAGE_ARCH}"
     set sstate.bbclass:98 [__anon_111__oe_core_meta_classes_sstate_bbclass]
       "allarch"
   pre-expansion value:
     "allarch"
SSTATE_PKGARCH="allarch"

   $PACKAGE_ARCH [4 operations]
     set oe-core/meta/conf/bitbake.conf:150
       [_defaultval] "${TUNE_PKGARCH}"
     set oe-core/meta/conf/documentation.conf:304
       [doc] "The architecture of the resulting package or packages."
     set oe-core/meta/classes/allarch.bbclass:5
       "all"
     set dummy-sdk-package.inc:12 [__anon_12_oe_core_meta_recipes_core_meta_dummy_sdk_package_inc]
       "${DUMMYARCH}"
   pre-expansion value:
     "${DUMMYARCH}"
PACKAGE_ARCH="sdk-provides-dummy-target"

the relevant part of the anonymous python in sstate.bbclass:

    elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH") == "all":
        d.setVar('SSTATE_PKGARCH', "allarch")
    else:
        d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))

So with allarch.bbclass change, the PACKAGE_ARCH isn't set to "all" because multilib is enabled,
but that causes sstate.bbclass to set SSTATE_MANMACH to MACHINE instead of SSTATE_PKGARCH
allarch, where it got MACHINE is still a bit of mystery to me.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index ed83dd77da..eafcb823ab 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -1,6 +1,8 @@
 SUMMARY = "Dummy packages which handle excluding packages from the sdk, e.g. ensuring perl is excluded from buildtools"
 LICENSE = "MIT"
 
+PACKAGE_ARCH = "all"
+
 inherit allarch
 
 python() {
-- 
2.17.1


