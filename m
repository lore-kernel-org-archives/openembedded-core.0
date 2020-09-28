Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.36923.1601300312372337742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 06:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eiKx4u88;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id q9so1160266wmj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UzPWPCa+5eYt77cSWFT2lcr5uWdmxNgtZk4aSy7W4ME=;
        b=eiKx4u88OrCZ29CGqwWJloNQVa6jVFh7EoIVZM4v/k05wp1B3WiExFYB3xztv2WSHO
         NBBaMCMjutM3jFKyLRZsDwOzKgMIjqePWwwh7eonrIcAw5PIkT1rS6ffNbaT9fJljY+V
         1/hM/VCQ6Htv0Ux9IEDuOAg8v5ue8aeyr2YIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UzPWPCa+5eYt77cSWFT2lcr5uWdmxNgtZk4aSy7W4ME=;
        b=HN4/mlVTpSC/Y4hUHPlwANIhMv+XaS4tDD+Tp8vC6tsfCQbUz/cm7zVgqNvBtYhdca
         Y72d1RkcOKADKnYEEi0x0bFx0QpVWu4kFCPUI5kcjNFNssfCS7CSjM9EvHFCEI9ws8iN
         qavw+I1AngtAso1mRvSDlw7DNNdUu1EkvvogSePrMAt/qJoPXi9cP8IJ7KSkYXTUYBx9
         XljrtUwICmx8upaHhrRuwkWHOFptPwrQ6O33hmqbg2sEgCpFxniH2Hv8e+8DQBYJKkO1
         6xZ/MztMBDNgkVrLm3FxH6JmaX7vhdaFqAatR+y7F3bXpLuqfO7m1DWCFC+MjB0cjBNx
         HUJA==
X-Gm-Message-State: AOAM530vSkQ4YLphckFh5fIHB5TJp7bCsCt2qduDiJV6BItZ6FtXOAKf
	17hOvadFcF2GHwAL+0gF2oSVzI97PsA8Tw==
X-Google-Smtp-Source: ABdhPJwCo9QQBih7M8qIncY0ioYBsS2Zt+vW88PtCJRehnA4OhunXBqwAlelPrvSnS0/NZBCldXcCw==
X-Received: by 2002:a1c:117:: with SMTP id 23mr1703140wmb.48.1601300310402;
        Mon, 28 Sep 2020 06:38:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (1.d.f.d.8.7.4.c.e.3.5.3.c.6.0.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6c:353e:c478:dfd1])
        by smtp.gmail.com with ESMTPSA id k6sm1314345wmf.30.2020.09.28.06.38.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:38:29 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] base/bitbake.conf: Enable pseudo path filtering
Date: Mon, 28 Sep 2020 14:38:03 +0100
Message-Id: <20200928133803.2741507-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a pretty big change to the way pseudo operates when used in OpenEmbedded.
Normally, pseudo monitors and logs (adds to its database) any file created or
modified whilst in a fakeroot environment. There are large numbers of files
we simply don't care about the permissions of whilst in that fakeroot context,
for example ${S}, ${B}, ${T}, ${SSTATE_DIR}, the central sstate control
directories,

This change uses new functionality in pseudo to ignore these directory trees,
resulting in a cleaner database with less chance of "stray" mismatches if files
are modified outside pseudo context. It also should reduce some overhead from
pseudo as the interprocess round trip to the server is avoided.

There is a possible complication where some existing recipe may break, for
example, we found a recipe which was writing to "${B}/install" for
"make install" in do_install and since we listed ${B} as not to be tracked,
there were errors trying to chown root for files in this location.

This patch fixes a few corner cases in OE-Core when used with this new
ignore list:

* The archiver directory matched a "${WORKDIR}/deploy*" pattern so was renamed
  to something else since that directory does need its root permissions
* The ${S} and ${B} ignoring is conditional on them being different to ${WORKDIR}
* package_write_* task output (the debs/rpms/ipks) are now owned by the build
  user so we don't want the file ownership information in the hashequiv outhash
  calculation even if they are built under pseudo.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/archiver.bbclass          | 2 +-
 meta/classes/base.bbclass              | 5 +++++
 meta/classes/populate_sdk_base.bbclass | 2 ++
 meta/conf/bitbake.conf                 | 1 +
 meta/lib/oe/sstatesig.py               | 2 ++
 5 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index aff1f9dbb04..598298ef6f6 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -53,7 +53,7 @@ ARCHIVER_MODE[recipe] ?= "0"
 ARCHIVER_MODE[mirror] ?= "split"
 
 DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
-ARCHIVER_TOPDIR ?= "${WORKDIR}/deploy-sources"
+ARCHIVER_TOPDIR ?= "${WORKDIR}/archiver-sources"
 ARCHIVER_OUTDIR = "${ARCHIVER_TOPDIR}/${TARGET_SYS}/${PF}/"
 ARCHIVER_RPMTOPDIR ?= "${WORKDIR}/deploy-sources-rpm"
 ARCHIVER_RPMOUTDIR = "${ARCHIVER_RPMTOPDIR}/${TARGET_SYS}/${PF}/"
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4c681cc870d..6309d709b8d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -388,6 +388,11 @@ python () {
     oe.utils.features_backfill("DISTRO_FEATURES", d)
     oe.utils.features_backfill("MACHINE_FEATURES", d)
 
+    if d.getVar("WORKDIR") != d.getVar("S"):
+        d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")
+    if d.getVar("WORKDIR") != d.getVar("B"):
+        d.appendVar("PSEUDO_IGNORE_PATHS", ",${B}")
+
     # Handle PACKAGECONFIG
     #
     # These take the form:
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 990505e89b8..61b31d5e5e5 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -178,6 +178,8 @@ do_populate_sdk[sstate-inputdirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
 do_populate_sdk[stamp-extra-info] = "${MACHINE_ARCH}${SDKMACHINE}"
 
+PSEUDO_IGNORE_PATHS .= ",${SDKDEPLOYDIR}"
+
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a318d1ca588..ebc9c9b56b9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -695,6 +695,7 @@ FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATE
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
+export PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats"
 
 ##################################################################
 # Not sure about the rest of this yet.
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 21ae0a7657f..6a8630048cf 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -482,6 +482,8 @@ def OEOuthashBasic(path, sigfile, task, d):
     h = hashlib.sha256()
     prev_dir = os.getcwd()
     include_owners = os.environ.get('PSEUDO_DISABLED') == '0'
+    if "package_write_" in task:
+        include_owners = False
     extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
 
     try:
-- 
2.25.1

