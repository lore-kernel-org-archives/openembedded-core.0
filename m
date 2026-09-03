Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82935C624DE
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 21:22:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.283.1788470519839307972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 14:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NXdankI4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so3169395e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788470518; x=1789075318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7b2woydD5W7iUTUJJ0y+QBEHmrTTbWm/RWUlxnr/Jo=;
        b=NXdankI4gExrxH6lRqs+oqgdZQAuGNkZybtHgxSYuxGcENnv6o2Hm3IuOUC6h/aPLB
         frboxMXFJEub3lhyebNzjfEBxjBo+B6QjkInKiQCajmW3VA3zF/8rJVF7r0INvknzzyV
         hHfUFPJQkmynSBFqkl10xOMZPze8krEHbnDdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470518; x=1789075318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r7b2woydD5W7iUTUJJ0y+QBEHmrTTbWm/RWUlxnr/Jo=;
        b=LtmhIt3G/uWGKRfL1HzujvuSlzz4P2H3u1pHjtGXTI4BMoq6n8PzTXbZDZUIs2GzWC
         e6OBmI5cwRBztCowSqqVh2FLkwZcTSpaid07aig8xBI7O/J/z9R4pHPDUDXJIPzhIoO2
         SbJoDwoASfHneVbycvKqlecb1VEWvSCeMiwY5cNmq2dOIVjQ3Cu3XJCFLeMxkNyPX/3f
         0jkzucjzikofxVwYSEXt8/KWiCQTasOaijIQUaDX3+xwIZ1r41vq29QBj8TyNCZ+d63B
         9clxwYSX5N6VWQJ678GkEiDd1jCK5gYNsobE+z1YFua1hop2ZPAmaPnOsdROjopZpFM/
         FdFQ==
X-Gm-Message-State: AFuF++lHIe5RtDkP4xXr0uK+ufsHlIlAb95JVmMgnBhrw+hRw2w/9Sgx
	A0+DWDFpKVzQTS/gvb0rn+yCkFQutkIIUIcKSV2T0VgZQp/IA8vy3csQAvgrL1AJ6BFRKX2DUfc
	jK/iPzYE=
X-Gm-Gg: AYBFou0dg3XJsiyN511vKaeSi45fq/fPIhQFQLlXxiyFPKLGjbneCvMpZl0s6oKvCiq
	U8HIbSdFarATS56luhTYNc1r9stiW7+Xu8Zkaay7xLr0ZybXHQ05uMgQjx3PuJ2v5TNLwNJeNjU
	0UhniHoGzc1tPgQ9C+jFLl2z3emczTZUknrd5U9B4pdNBmUKbeHy2EFzQ6baAKfpRtl2Jtk/6/p
	qbsmZ7lJng90sCDNVe+nY+xtv87zc4KuJ7O8fusGJfF7S145297YBhpZfAC/4vh6FnAgjcfk5r9
	0CtdcHO4ulVe+Mw95S09+XyIm9x8i1blALzABYTpDsbg5Vw8g0zmEkrz3aliPpQ4d5wez4q0brX
	Q+wF3ZUeebU8nHBinlMlM6bwtKtEKEuo40uJ4fmTNPIYmWXHnXm/I2H2GN1Ip4sNJaxUrzKJWsT
	Ei2rMIZVedSLMvXkv+iEPjfpJzySyb2gAA1Pflv35t+5O+ZCJ+59ua57z6N6zGUqZzl8B1arLpt
	fQlQUqFQknNSFSD
X-Received: by 2002:a05:600c:3b0e:b0:49c:eb04:1c49 with SMTP id 5b1f17b1804b1-49cf8254d53mr12116055e9.13.1788470517358;
        Thu, 03 Sep 2026 14:21:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f77:7f7:7ec1:8841])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f914bsm118566385e9.3.2026.09.03.14.21.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:21:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] meta/scripts: Replace bb.fetch2 with bb.fetch
Date: Thu,  3 Sep 2026 22:21:54 +0100
Message-ID: <20260903212155.632078-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 21:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245046

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass              | 14 +++++------
 meta/classes-global/package.bbclass           |  2 +-
 meta/classes-global/sstate.bbclass            | 14 +++++------
 meta/classes-global/uninative.bbclass         |  8 +++----
 meta/classes-global/utility-tasks.bbclass     |  4 ++--
 meta/classes-recipe/cargo_common.bbclass      |  2 +-
 meta/classes-recipe/devupstream.bbclass       |  2 +-
 meta/classes-recipe/kernel-yocto.bbclass      |  4 ++--
 meta/classes-recipe/npm.bbclass               | 10 ++++----
 meta/classes/archiver.bbclass                 | 16 ++++++-------
 meta/classes/copyleft_compliance.bbclass      |  2 +-
 meta/classes/externalsrc.bbclass              |  2 +-
 meta/classes/go-vendor.bbclass                |  2 +-
 meta/classes/prexport.bbclass                 |  2 +-
 meta/conf/bitbake.conf                        |  2 +-
 meta/lib/oe/patch.py                          | 10 ++++----
 meta/lib/oe/recipeutils.py                    | 18 +++++++-------
 meta/lib/oe/sanity.py                         |  6 ++---
 meta/lib/oe/spdx30_tasks.py                   |  4 ++--
 meta/lib/oeqa/selftest/cases/bbtests.py       |  2 +-
 .../images/build-appliance-image_15.0.0.bb    |  2 +-
 meta/recipes-core/psplash/psplash_git.bb      |  2 +-
 scripts/contrib/check-srcuri-tag.py           | 18 +++++++-------
 scripts/lib/devtool/upgrade.py                | 12 +++++-----
 scripts/lib/recipetool/append.py              |  2 +-
 scripts/lib/recipetool/create.py              | 24 +++++++++----------
 scripts/lib/recipetool/create_npm.py          |  8 +++----
 scripts/lib/scriptutils.py                    |  4 ++--
 28 files changed, 99 insertions(+), 99 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 5b4996a1e00..9553f004325 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -176,9 +176,9 @@ python base_do_fetch() {
         return
 
     try:
-        fetcher = bb.fetch2.Fetch(src_uri, d)
+        fetcher = bb.fetch.Fetch(src_uri, d)
         fetcher.download()
-    except bb.fetch2.BBFetchException as e:
+    except bb.fetch.BBFetchException as e:
         bb.fatal("Bitbake Fetcher Error: " + repr(e))
 }
 
@@ -204,9 +204,9 @@ python base_do_unpack() {
             d.setVar("SOURCE_BASEDIR", unpackdir + '/' + basedir)
 
     try:
-        fetcher = bb.fetch2.Fetch(src_uri, d)
+        fetcher = bb.fetch.Fetch(src_uri, d)
         fetcher.unpack(d.getVar('UNPACKDIR'))
-    except bb.fetch2.BBFetchException as e:
+    except bb.fetch.BBFetchException as e:
         bb.fatal("Bitbake Fetcher Error: " + repr(e))
 }
 
@@ -706,7 +706,7 @@ python () {
             for s in srcuri.split():
                 if not s.startswith("file://"):
                     continue
-                fetcher = bb.fetch2.Fetch([s], d)
+                fetcher = bb.fetch.Fetch([s], d)
                 local = fetcher.localpath(s)
                 for mp in paths:
                     if local.startswith(mp):
@@ -739,9 +739,9 @@ python do_cleanall() {
         return
 
     try:
-        fetcher = bb.fetch2.Fetch(src_uri, d)
+        fetcher = bb.fetch.Fetch(src_uri, d)
         fetcher.clean()
-    except bb.fetch2.BBFetchException as e:
+    except bb.fetch.BBFetchException as e:
         bb.fatal(str(e))
 }
 do_cleanall[nostamp] = "1"
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 1dd30fe8b83..e21350a06f4 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -299,7 +299,7 @@ python package_get_auto_pr() {
                 pr = d.getVar('PR')
                 # Strip PR to make AUTOINC can increase when SRCREV is changed
                 base_ver = "AUTOINC-%s" % version[:-len(pr)]
-                srcpv = bb.fetch2.get_srcrev(d)
+                srcpv = bb.fetch.get_srcrev(d)
                 value = conn.getPR(base_ver, pkgarch, srcpv)
                 d.setVar("PRSERV_PV_AUTOINC", str(value))
 
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 169654767ca..b2fa93650ab 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -714,7 +714,7 @@ def sstate_package(ss, d):
 sstate_package[vardepsexclude] += "SSTATE_SIG_KEY SSTATE_PKG"
 
 def pstaging_fetch(sstatefetch, d):
-    import bb.fetch2
+    import bb.fetch
 
     # Only try and fetch if the user has configured a mirror
     mirrors = d.getVar('SSTATE_MIRRORS')
@@ -751,11 +751,11 @@ def pstaging_fetch(sstatefetch, d):
             localdata.delVar('SRC_URI')
             localdata.setVar('SRC_URI', srcuri)
             try:
-                fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
+                fetcher = bb.fetch.Fetch([srcuri], localdata, cache=False)
                 fetcher.checkstatus()
                 fetcher.download()
 
-            except bb.fetch2.BBFetchException:
+            except bb.fetch.BBFetchException:
                 pass
 
 def sstate_setscene(d):
@@ -1008,7 +1008,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 bb.utils.to_boolean(localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK')):
             localdata.delVar('BB_NO_NETWORK')
 
-        from bb.fetch2 import FetchConnectionCache
+        from bb.fetch import FetchConnectionCache
         def checkstatus_init():
             while not connection_cache_pool.full():
                 connection_cache_pool.put(FetchConnectionCache())
@@ -1030,13 +1030,13 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             import traceback
 
             try:
-                fetcher = bb.fetch2.Fetch(srcuri.split(), localdata2,
+                fetcher = bb.fetch.Fetch(srcuri.split(), localdata2,
                             connection_cache=connection_cache)
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 found.add(tid)
                 missed.remove(tid)
-            except bb.fetch2.FetchError as e:
+            except bb.fetch.FetchError as e:
                 bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)\n%s" % (srcuri, repr(e), traceback.format_exc()))
             except Exception as e:
                 bb.error("SState: cannot test %s: %s\n%s" % (srcuri, repr(e), traceback.format_exc()))
@@ -1063,7 +1063,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
 
             # Have to setup the fetcher environment here rather than in each thread as it would race
-            fetcherenv = bb.fetch2.get_fetcher_environment(d)
+            fetcherenv = bb.fetch.get_fetcher_environment(d)
             with bb.utils.environment(**fetcherenv):
                 bb.event.enable_threadlock()
                 import concurrent.futures
diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/uninative.bbclass
index c246a1ecd6c..573698f9243 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -64,7 +64,7 @@ python uninative_event_fetchloader() {
             # Our games with path manipulation of DL_DIR mean standard PREMIRRORS don't work
             # and we can't easily put 'chksum' into the url path from a url parameter with
             # the current fetcher url handling
-            premirrors = bb.fetch2.mirror_from_string(localdata.getVar("PREMIRRORS"))
+            premirrors = bb.fetch.mirror_from_string(localdata.getVar("PREMIRRORS"))
             for line in premirrors:
                 try:
                     (find, replace) = line
@@ -76,11 +76,11 @@ python uninative_event_fetchloader() {
             srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};sha256sum=%s" % chksum)
             bb.note("Fetching uninative binary shim %s (will check PREMIRRORS first)" % srcuri)
 
-            fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
+            fetcher = bb.fetch.Fetch([srcuri], localdata, cache=False)
             fetcher.download()
             localpath = fetcher.localpath(srcuri)
             if localpath != tarballpath and os.path.exists(localpath) and not os.path.exists(tarballpath):
-                # Follow the symlink behavior from the bitbake fetch2.
+                # Follow the symlink behavior from the bb.fetch.
                 # This will cover the case where an existing symlink is broken
                 # as well as if there are two processes trying to create it
                 # at the same time.
@@ -118,7 +118,7 @@ ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
 
     except RuntimeError as e:
         bb.warn(str(e))
-    except bb.fetch2.BBFetchException as exc:
+    except bb.fetch.BBFetchException as exc:
         bb.warn("Disabling uninative as unable to fetch uninative tarball: %s" % str(exc))
         bb.warn("To build your own uninative loader, please bitbake uninative-tarball and set UNINATIVE_TARBALL appropriately.")
     except subprocess.CalledProcessError as exc:
diff --git a/meta/classes-global/utility-tasks.bbclass b/meta/classes-global/utility-tasks.bbclass
index 394cc3158d5..a6adc38aa10 100644
--- a/meta/classes-global/utility-tasks.bbclass
+++ b/meta/classes-global/utility-tasks.bbclass
@@ -50,9 +50,9 @@ python do_checkuri() {
         return
 
     try:
-        fetcher = bb.fetch2.Fetch(src_uri, d)
+        fetcher = bb.fetch.Fetch(src_uri, d)
         fetcher.checkstatus()
-    except bb.fetch2.BBFetchException as e:
+    except bb.fetch.BBFetchException as e:
         bb.fatal(str(e))
 }
 
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index f58bd80728c..2e1df9d9d34 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -169,7 +169,7 @@ python cargo_common_do_patch_paths() {
 
     patches = dict()
     workdir = d.getVar('UNPACKDIR')
-    fetcher = bb.fetch2.Fetch(src_uri, d)
+    fetcher = bb.fetch.Fetch(src_uri, d)
     for url in fetcher.urls:
         ud = fetcher.ud[url]
         if ud.type == 'git' or ud.type == 'gitsm':
diff --git a/meta/classes-recipe/devupstream.bbclass b/meta/classes-recipe/devupstream.bbclass
index 60026a527fc..dc83c086b7f 100644
--- a/meta/classes-recipe/devupstream.bbclass
+++ b/meta/classes-recipe/devupstream.bbclass
@@ -34,7 +34,7 @@ python devupstream_virtclass_handler () {
     d.setVar("DEFAULT_PREFERENCE", "-1")
 
     src_uri = d.getVar("SRC_URI:class-devupstream") or d.getVar("SRC_URI")
-    uri = bb.fetch2.URI(src_uri.split()[0])
+    uri = bb.fetch.URI(src_uri.split()[0])
 
     # Modify the PV if the recipe hasn't already overridden it
     pv = d.getVar("PV")
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 628823ff544..43674e8bcb3 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -69,7 +69,7 @@ def find_sccs(d):
 # the name of the repository or directory as it will be found in UNPACKDIR
 def find_kernel_feature_dirs(d):
     feature_dirs=[]
-    fetch = bb.fetch2.Fetch([], d)
+    fetch = bb.fetch.Fetch([], d)
     for url in fetch.urls:
         urldata = fetch.ud[url]
         parm = urldata.parm
@@ -89,7 +89,7 @@ def find_kernel_feature_dirs(d):
 # find the master/machine source branch. In the same way that the fetcher proceses
 # git repositories in the SRC_URI we take the first repo found, first branch.
 def get_machine_branch(d, default):
-    fetch = bb.fetch2.Fetch([], d)
+    fetch = bb.fetch.Fetch([], d)
     for url in fetch.urls:
         urldata = fetch.ud[url]
         parm = urldata.parm
diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index f351e1845e3..6f3261238dc 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -129,10 +129,10 @@ python npm_do_configure() {
     import shlex
     import stat
     import tempfile
-    from bb.fetch2.npm import NpmEnvironment
-    from bb.fetch2.npm import npm_unpack
-    from bb.fetch2.npm import npm_package
-    from bb.fetch2.npmsw import foreach_dependencies
+    from bb.fetch.npm import NpmEnvironment
+    from bb.fetch.npm import npm_unpack
+    from bb.fetch.npm import npm_package
+    from bb.fetch.npmsw import foreach_dependencies
     from bb.progress import OutOfProgressHandler
     from oe.npm_registry import NpmRegistry
 
@@ -284,7 +284,7 @@ python npm_do_compile() {
     """
     import shlex
     import tempfile
-    from bb.fetch2.npm import NpmEnvironment
+    from bb.fetch.npm import NpmEnvironment
 
     bb.utils.remove(d.getVar("NPM_BUILD"), recurse=True)
 
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 3124b7040d4..b274c53e799 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -189,19 +189,19 @@ python do_ar_original() {
     # archives more useful (no extra paths that are only used during
     # compilation).
     for i, url in enumerate(urls):
-        decoded = bb.fetch2.decodeurl(url)
+        decoded = bb.fetch.decodeurl(url)
         for param in ('destsuffix', 'subdir'):
             if param in decoded[5]:
                 del decoded[5][param]
-        encoded = bb.fetch2.encodeurl(decoded)
+        encoded = bb.fetch.encodeurl(decoded)
         urls[i] = encoded
 
-    # Cleanup SRC_URI before call bb.fetch2.Fetch() since now SRC_URI is in the
+    # Cleanup SRC_URI before call bb.fetch.Fetch() since now SRC_URI is in the
     # variable "urls", otherwise there might be errors like:
     # The SRCREV_FORMAT variable must be set when multiple SCMs are used
     ld = bb.data.createCopy(d)
     ld.setVar('SRC_URI', '')
-    fetch = bb.fetch2.Fetch(urls, ld)
+    fetch = bb.fetch.Fetch(urls, ld)
     tarball_suffix = {}
     for url in fetch.urls:
         local = fetch.localpath(url).rstrip("/");
@@ -216,9 +216,9 @@ python do_ar_original() {
             # This is an additional safety net, in practice the name has
             # to be set when using the git fetcher, otherwise SRCREV cannot
             # be set separately for each URL.
-            params = bb.fetch2.decodeurl(url)[5]
-            type = bb.fetch2.decodeurl(url)[0]
-            location = bb.fetch2.decodeurl(url)[2]
+            params = bb.fetch.decodeurl(url)[5]
+            type = bb.fetch.decodeurl(url)[0]
+            location = bb.fetch.decodeurl(url)[2]
             name = params.get('name', '')
             if type.lower() == 'file':
                 name_tmp = location.rstrip("*").rstrip("/")
@@ -348,7 +348,7 @@ python do_ar_mirror() {
 
     bb.utils.mkdirhier(destdir)
 
-    fetcher = bb.fetch2.Fetch(src_uri, d)
+    fetcher = bb.fetch.Fetch(src_uri, d)
 
     for ud in fetcher.expanded_urldata():
         if is_excluded(ud.url):
diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 9ff9956fe90..5932bb657d2 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -30,7 +30,7 @@ python do_prepare_copyleft_sources () {
     sources_dir = d.getVar('COPYLEFT_SOURCES_DIR')
     dl_dir = d.getVar('DL_DIR')
     src_uri = d.getVar('SRC_URI').split()
-    fetch = bb.fetch2.Fetch(src_uri, d)
+    fetch = bb.fetch.Fetch(src_uri, d)
     ud = fetch.ud
 
     pf = d.getVar('PF')
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 902ff2604f8..71a7b4ea36b 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -79,7 +79,7 @@ python () {
 
         bb.fetch.get_hashvalue(d)
         local_srcuri = []
-        fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
+        fetch = bb.fetch.Fetch((d.getVar('SRC_URI') or '').split(), d)
         for url in fetch.urls:
             url_data = fetch.ud[url]
             parm = url_data.parm
diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 538b7cec67e..b27b0a4b694 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -60,7 +60,7 @@ python do_go_vendor() {
 
     base_package = d.getVar('BP')
     default_destsuffix = "{}/src/import/vendor.fetch".format(base_package)
-    fetcher = bb.fetch2.Fetch(src_uri, d)
+    fetcher = bb.fetch.Fetch(src_uri, d)
     go_import = d.getVar('GO_IMPORT')
     source_dir = d.getVar('S')
 
diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
index e5098e3308b..cb478674228 100644
--- a/meta/classes/prexport.bbclass
+++ b/meta/classes/prexport.bbclass
@@ -33,7 +33,7 @@ python prexport_handler () {
         oe.prservice.prserv_export_tofile(e.data, None, datainfo, False)
         if 'AUTOINC' in ver:
             import re
-            srcpv =  bb.fetch2.get_srcrev(e.data)
+            srcpv =  bb.fetch.get_srcrev(e.data)
             base_ver = "AUTOINC-%s" % ver[:ver.find(srcpv)]
             e.data.setVar('PRSERV_DUMPOPT_VERSION', base_ver)
             retval = oe.prservice.prserv_dump_db(e.data)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 41e98ce6296..63d84cf37bb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -743,7 +743,7 @@ SRC_URI[vardepsexclude] += "\
 
 SRCDATE = "${DATE}"
 SRCREV ??= "INVALID"
-AUTOREV = "${@bb.fetch2.get_autorev(d)}"
+AUTOREV = "${@bb.fetch.get_autorev(d)}"
 SRCPV = ""
 
 SRC_URI = ""
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 0a201afe0ad..2277e8835d5 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -96,14 +96,14 @@ class PatchSet(object):
             if not patch.get("remote"):
                 raise PatchError("Patch file must be specified in patch import.")
             else:
-                patch["file"] = bb.fetch2.localpath(patch["remote"], self.d)
+                patch["file"] = bb.fetch.localpath(patch["remote"], self.d)
 
         for param in PatchSet.defaults:
             if not patch.get(param):
                 patch[param] = PatchSet.defaults[param]
 
         if patch.get("remote"):
-            patch["file"] = self.d.expand(bb.fetch2.localpath(patch["remote"], self.d))
+            patch["file"] = self.d.expand(bb.fetch.localpath(patch["remote"], self.d))
 
         patch["filemd5"] = bb.utils.md5_file(patch["file"])
 
@@ -575,7 +575,7 @@ class GitApplyTree(PatchTree):
         return patches
 
     def _need_dirty_check(self):
-        fetch = bb.fetch2.Fetch([], self.d)
+        fetch = bb.fetch.Fetch([], self.d)
         check_dirtyness = False
         for url in fetch.urls:
             url_data = fetch.ud[url]
@@ -798,7 +798,7 @@ class QuiltTree(PatchSet):
             if type == "file":
                 import shutil
                 if not patch.get("file") and patch.get("remote"):
-                    patch["file"] = bb.fetch2.localpath(patch["remote"], self.d)
+                    patch["file"] = bb.fetch.localpath(patch["remote"], self.d)
 
                 shutil.copyfile(patch["quiltfile"], patch["file"])
             else:
@@ -928,7 +928,7 @@ def patch_path(url, fetch, unpackdir, expand=True):
 
 def src_patches(d, all=False, expand=True):
     unpackdir = d.getVar('UNPACKDIR')
-    fetch = bb.fetch2.Fetch([], d)
+    fetch = bb.fetch.Fetch([], d)
     patches = []
     sources = []
     for url in fetch.urls:
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 64bf2f950f8..99e7bc7acf4 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -393,7 +393,7 @@ def patch_recipe(d, fn, varvalues, patch=False, relpath='', redirect_output=None
 def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True, all_variants=False):
     """Copy (local) recipe files, including both files included via include/require,
     and files referred to in the SRC_URI variable."""
-    import bb.fetch2
+    import bb.fetch
     import oe.path
 
     # FIXME need a warning if the unexpanded SRC_URI value contains variable references
@@ -404,7 +404,7 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True, all_variants=F
         # Collect the local paths from SRC_URI
         srcuri = rdata.getVar('SRC_URI') or ""
         if srcuri not in uri_values:
-            fetch = bb.fetch2.Fetch(srcuri.split(), rdata)
+            fetch = bb.fetch.Fetch(srcuri.split(), rdata)
             if download:
                 fetch.download()
             for pth in fetch.localpaths():
@@ -455,7 +455,7 @@ def get_recipe_local_files(d, patches=False, archives=False):
     """Get a list of local files in SRC_URI within a recipe."""
     import oe.patch
     uris = (d.getVar('SRC_URI') or "").split()
-    fetch = bb.fetch2.Fetch(uris, d)
+    fetch = bb.fetch.Fetch(uris, d)
     # FIXME this list should be factored out somewhere else (such as the
     # fetcher) though note that this only encompasses actual container formats
     # i.e. that can contain multiple files as opposed to those that only
@@ -1011,17 +1011,17 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
 
 def get_recipe_upstream_version(rd, stable_upgrade=False):
     """
-        Get upstream version of recipe using bb.fetch2 methods with support for
+        Get upstream version of recipe using bb.fetch methods with support for
         http, https, ftp and git.
 
-        bb.fetch2 exceptions can be raised,
+        bb.fetch exceptions can be raised,
             FetchError when don't have network access or upstream site don't response.
             NoMethodError when uri latest_versionstring method isn't implemented.
 
         Returns a dictonary with version, repository revision, current_version, type and datetime.
         Type can be A for Automatic, M for Manual and U for Unknown.
     """
-    from bb.fetch2 import decodeurl
+    from bb.fetch import decodeurl
     from datetime import datetime
 
     ru = {}
@@ -1067,9 +1067,9 @@ def get_recipe_upstream_version(rd, stable_upgrade=False):
         ru['type'] = 'A'
         ru['datetime'] = datetime.now()
     else:
-        ud = bb.fetch2.FetchData(src_uri, rd)
+        ud = bb.fetch.FetchData(src_uri, rd)
         if rd.getVar("UPSTREAM_CHECK_COMMITS") == "1":
-            bb.fetch2.get_srcrev(rd)
+            bb.fetch.get_srcrev(rd)
             upversion = None
             revision = None
             try:
@@ -1077,7 +1077,7 @@ def get_recipe_upstream_version(rd, stable_upgrade=False):
                 upversion = pv
                 if revision != ud.revision:
                     upversion = upversion + "-new-commits-available"
-            except bb.fetch2.FetchError as e:
+            except bb.fetch.FetchError as e:
                 bb.warn("Unable to obtain latest revision: {}".format(e))
         else:
             if stable_upgrade:
diff --git a/meta/lib/oe/sanity.py b/meta/lib/oe/sanity.py
index 292fbddbb2b..387d745024c 100644
--- a/meta/lib/oe/sanity.py
+++ b/meta/lib/oe/sanity.py
@@ -202,7 +202,7 @@ def check_connectivity(d):
         data.delVar('PREMIRRORS')
         data.delVar('MIRRORS')
         try:
-            fetcher = bb.fetch2.Fetch(test_uris, data)
+            fetcher = bb.fetch.Fetch(test_uris, data)
             fetcher.checkstatus()
         except Exception as err:
             # Allow the message to be configured so that users can be
@@ -887,7 +887,7 @@ def check_sanity_everybuild(status, d):
         for mirror_entry in mirrors:
             pattern, mirror = mirror_entry
 
-            decoded = bb.fetch2.decodeurl(pattern)
+            decoded = bb.fetch.decodeurl(pattern)
             try:
                 pattern_scheme = re.compile(decoded[0])
             except re.error as exc:
@@ -919,7 +919,7 @@ def check_sanity_everybuild(status, d):
             bb.warn("You are using a local hash equivalence server but have configured an sstate mirror. This will likely mean no sstate will match from the mirror. You may wish to disable the hash equivalence use (BB_HASHSERVE), or use a hash equivalence server alongside the sstate mirror.")
 
         # Check that when SSTATE_DIR is shared between builds, hashserve database is not private to a build
-        hashserv_proto,_,hashserv_path,_,_,_ = bb.fetch2.decodeurl(hashserv)
+        hashserv_proto,_,hashserv_path,_,_,_ = bb.fetch.decodeurl(hashserv)
         if hashserv_proto == "unix":
             dbdir = d.getVar("BB_HASHSERVE_DB_DIR") or d.getVar("PERSISTENT_DIR") or d.getVar("CACHE")
             topdir = d.getVar("TOPDIR")
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index b2f208e1f67..9978ae731ca 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -441,7 +441,7 @@ def add_download_files(d, objset):
     inputs = set()
 
     urls = d.getVar("SRC_URI").split()
-    fetch = bb.fetch2.Fetch(urls, d)
+    fetch = bb.fetch.Fetch(urls, d)
 
     for download_idx, src_uri in enumerate(urls):
         fd = fetch.ud[src_uri]
@@ -503,7 +503,7 @@ def add_download_files(d, objset):
             _enrich_source_package(d, dl, fd, file_name, primary_purpose)
 
             if fd.method.supports_checksum(fd):
-                for checksum_id in bb.fetch2.CHECKSUM_LIST:
+                for checksum_id in bb.fetch.CHECKSUM_LIST:
                     if checksum_id not in oe.spdx30.HashAlgorithm.NAMED_INDIVIDUALS:
                         continue
 
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 860f4992690..52fa1819a6f 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -365,7 +365,7 @@ require conf/distro/include/no-gplv3.inc
         self.write_config("DISTROOVERRIDES .= \":gitunpack-enable-recipe\"")
 
         result = bitbake('gitunpackoffline-fail -c fetch', ignore_status=True)
-        self.assertTrue(re.search("Recipe uses a floating tag/branch .* for repo .* without a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev()", result.output), msg = "Recipe without PV set to SRCPV should have failed: %s" % result.output)
+        self.assertTrue(re.search("Recipe uses a floating tag/branch .* for repo .* without a fixed SRCREV yet doesn't call bb.fetch.get_srcrev()", result.output), msg = "Recipe without PV set to SRCPV should have failed: %s" % result.output)
 
     def test_unexpanded_variable_in_path(self):
         """
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 1b88e93bd3b..1c4bdc4ee13 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -48,7 +48,7 @@ IMAGE_CMD:ext4:append () {
 }
 
 fakeroot do_populate_poky_src () {
-	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git repo
+	# Because bb.fetch's git's unpack uses -s cloneflag, the unpacked git repo
 	# will become invalid in the target.
 	for d in bitbake openembedded-core meta-yocto; do
 		rm -rf ${UNPACKDIR}/$d/.git
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 3be0e26a0c7..48a6be6e134 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -26,7 +26,7 @@ python __anonymous() {
     pkgs = []
     localpaths = []
     for uri in splashfiles:
-        fetcher = bb.fetch2.Fetch([uri], d)
+        fetcher = bb.fetch.Fetch([uri], d)
         flocal = os.path.basename(fetcher.localpath(uri))
         fbase = os.path.splitext(flocal)[0]
         outsuffix = fetcher.ud[uri].parm.get("outsuffix")
diff --git a/scripts/contrib/check-srcuri-tag.py b/scripts/contrib/check-srcuri-tag.py
index 33a2b781f75..c655209a73f 100755
--- a/scripts/contrib/check-srcuri-tag.py
+++ b/scripts/contrib/check-srcuri-tag.py
@@ -44,7 +44,7 @@ if not scriptpath.add_bitbake_lib_path():
 scriptpath.add_oe_lib_path()
 
 import bb.cache        # pylint: disable=wrong-import-position
-import bb.fetch2       # pylint: disable=wrong-import-position
+import bb.fetch       # pylint: disable=wrong-import-position
 import bb.tinfoil      # pylint: disable=wrong-import-position
 import oe.recipeutils  # pylint: disable=wrong-import-position
 
@@ -71,7 +71,7 @@ def get_literal_srcrev(name, data):
     """Return (sha, None) or (None, reason) for the named git URL.
 
     SRCREV candidates are read unexpanded (to avoid triggering AUTOREV
-    resolution) in the same fallback order used by bb.fetch2, accepting only a
+    resolution) in the same fallback order used by bb.fetch, accepting only a
     plain hex SHA (or the SHA embedded in a cached AUTOINC+<sha> value).
     """
     pn = data.getVar("PN") or ""
@@ -127,7 +127,7 @@ def lsremote_tags(ud, data):
 
     try:
         output = ud.method._lsremote(ud, data, "refs/tags/*")
-    except (bb.fetch2.NetworkAccess, bb.fetch2.FetchError) as exc:
+    except (bb.fetch.NetworkAccess, bb.fetch.FetchError) as exc:
         result = (None, f"remote error: {exc}")
         _lsremote_cache[key] = result
         return result
@@ -206,8 +206,8 @@ def add_candidate(result, exp_url, name, data):
         return
 
     try:
-        ud = bb.fetch2.FetchData(exp_url, data)
-    except bb.fetch2.FetchError as exc:
+        ud = bb.fetch.FetchData(exp_url, data)
+    except bb.fetch.FetchError as exc:
         result.status = "remote-error"
         result.detail = str(exc)
         return
@@ -227,8 +227,8 @@ def check_url(entry, data, args):
     """Process a single git/gitsm SRC_URI entry.  Returns a UrlResult."""
     exp = data.expand(entry)
     try:
-        scheme, host, path, _u, _p, parm = bb.fetch2.decodeurl(exp)
-    except bb.fetch2.MalformedUrl as exc:
+        scheme, host, path, _u, _p, parm = bb.fetch.decodeurl(exp)
+    except bb.fetch.MalformedUrl as exc:
         return UrlResult(entry, exp, "", "parse-error", detail=str(exc))
 
     base_url = f"{scheme}://{host}{path}"
@@ -256,9 +256,9 @@ def check_recipe(data, args):
 
 def add_tag_to_entry(entry, tag_fmt):
     """Return entry with ;tag=<tag_fmt> added (entry must be a literal URL)."""
-    decoded = list(bb.fetch2.decodeurl(entry))
+    decoded = list(bb.fetch.decodeurl(entry))
     decoded[5]["tag"] = tag_fmt
-    return bb.fetch2.encodeurl(decoded)
+    return bb.fetch.encodeurl(decoded)
 
 
 def find_source_file(entry, data):
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 5c2e6ebd46d..58165541f65 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -235,7 +235,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
         (stdout, _) = __run('git submodule --quiet foreach \'echo $sm_path\'')
         paths += [os.path.join(srctree, p) for p in stdout.splitlines()]
         checksums = {}
-        _, _, _, _, _, params = bb.fetch2.decodeurl(uri)
+        _, _, _, _, _, params = bb.fetch.decodeurl(uri)
         srcsubdir_rel = params.get('destsuffix', 'git')
         if not srcbranch:
             check_branch, check_branch_err = __run('git branch -r --contains %s' % srcrev)
@@ -393,8 +393,8 @@ def _create_new_recipe(newpv, checksums, srcrev, srcbranch, srcsubdir_old, srcsu
         new_src_uri = []
         for entry in src_uri:
             try:
-                scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(entry)
-            except bb.fetch2.MalformedUrl as e:
+                scheme, network, path, user, passwd, params = bb.fetch.decodeurl(entry)
+            except bb.fetch.MalformedUrl as e:
                 raise DevtoolError("Could not decode SRC_URI: {}".format(e))
             if replacing and scheme in ['git', 'gitsm']:
                 branch = params.get('branch', 'master')
@@ -407,7 +407,7 @@ def _create_new_recipe(newpv, checksums, srcrev, srcbranch, srcsubdir_old, srcsu
                         break
                     else:
                         params['branch'] = srcbranch
-                        entry = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
+                        entry = bb.fetch.encodeurl((scheme, network, path, user, passwd, params))
                         changed = True
                 replacing = False
             new_src_uri.append(entry)
@@ -426,7 +426,7 @@ def _create_new_recipe(newpv, checksums, srcrev, srcbranch, srcsubdir_old, srcsu
     newnames = []
     addnames = []
     for newentry in new_src_uri:
-        _, _, _, _, _, params = bb.fetch2.decodeurl(newentry)
+        _, _, _, _, _, params = bb.fetch.decodeurl(newentry)
         if 'name' in params:
             newnames.append(params['name'])
             if newentry not in old_src_uri:
@@ -462,7 +462,7 @@ def _create_new_recipe(newpv, checksums, srcrev, srcbranch, srcsubdir_old, srcsu
         newvalues['SRC_URI[%smd5sum]' % nameprefix] = None
         oldsums.remove('md5sum')
         if not oldsums:
-            oldsums = ["%ssum" % s for s in bb.fetch2.SHOWN_CHECKSUM_LIST]
+            oldsums = ["%ssum" % s for s in bb.fetch.SHOWN_CHECKSUM_LIST]
 
     for checksum in oldsums:
         newvalues['SRC_URI[%s%s]' % (nameprefix, checksum)] = checksums[checksum]
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 041d79f1623..076a449e426 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -118,7 +118,7 @@ def determine_file_source(targetpath, rd):
             workdirfile = os.path.relpath(srcpath, unpackdir)
             # FIXME this is where we ought to have some code in the fetcher, because this is naive
             for item in src_uri.split():
-                localpath = bb.fetch2.localpath(item, rd)
+                localpath = bb.fetch.localpath(item, rd)
                 # Source path specified in do_install might be a glob
                 if fnmatch.fnmatch(os.path.basename(localpath), workdirfile):
                     srcfile = 'file://%s' % localpath
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 7fc740b1498..bf533a45cfc 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -16,7 +16,7 @@ import logging
 import scriptutils
 from urllib.parse import urlparse, urldefrag, urlsplit
 import hashlib
-import bb.fetch2
+import bb.fetch
 logger = logging.getLogger('recipetool')
 import oe.license
 import oe.spdx_license
@@ -354,12 +354,12 @@ def supports_srcrev(uri):
     # odd interactions with the urldata cache which lead to errors
     localdata.setVar('SRCREV', '${AUTOREV}')
     try:
-        fetcher = bb.fetch2.Fetch([uri], localdata)
+        fetcher = bb.fetch.Fetch([uri], localdata)
         urldata = fetcher.ud
         for u in urldata:
             if urldata[u].method.supports_srcrev():
                 return True
-    except bb.fetch2.FetchError as e:
+    except bb.fetch.FetchError as e:
         logger.debug('FetchError in supports_srcrev: %s' % str(e))
         # Fall back to basic check
         if uri.startswith(('git://', 'gitsm://')):
@@ -373,7 +373,7 @@ def reformat_git_uri(uri):
         # Appends scheme if the scheme is missing
         if not '://' in uri:
             uri = 'git://' + uri
-        scheme, host, path, user, pswd, parms = bb.fetch2.decodeurl(uri)
+        scheme, host, path, user, pswd, parms = bb.fetch.decodeurl(uri)
         # Detection mechanism, this is required due to certain URL are formatter with ":" rather than "/"
         # which causes decodeurl to fail getting the right host and path
         if len(host.split(':')) > 1:
@@ -393,7 +393,7 @@ def reformat_git_uri(uri):
         elif (scheme == "http" or scheme == 'https' or scheme == 'ssh') and not ('protocol' in parms):
             parms.update({('protocol', scheme)})
         # Always append 'git://'
-        fUrl = bb.fetch2.encodeurl(('git', host, path, user, pswd, parms))
+        fUrl = bb.fetch.encodeurl(('git', host, path, user, pswd, parms))
         return fUrl
     else:
         return uri
@@ -487,7 +487,7 @@ def create_recipe(args):
 
         # Check whether users provides any branch info in fetchuri.
         # If true, we will skip all branch checking process to honor all user's input.
-        scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(fetchuri)
+        scheme, network, path, user, passwd, params = bb.fetch.decodeurl(fetchuri)
         srcbranch = params.get('branch')
         if args.srcbranch:
             if srcbranch:
@@ -515,7 +515,7 @@ def create_recipe(args):
         # Assume 'master' branch if not set
         if scheme in ['git', 'gitsm'] and 'branch' not in params and 'nobranch' not in params:
             params['branch'] = 'master'
-        fetchuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
+        fetchuri = bb.fetch.encodeurl((scheme, network, path, user, passwd, params))
 
         tmpparent = tinfoil.config_data.getVar('BASE_WORKDIR')
         bb.utils.mkdirhier(tmpparent)
@@ -578,7 +578,7 @@ def create_recipe(args):
 
         # Since we might have a value in srcbranch, we need to
         # recontruct the srcuri to include 'branch' in params.
-        scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(srcuri)
+        scheme, network, path, user, passwd, params = bb.fetch.decodeurl(srcuri)
         if scheme in ['git', 'gitsm']:
             params['branch'] = srcbranch or 'master'
 
@@ -594,7 +594,7 @@ def create_recipe(args):
                 sys.exit(1)
             # Drop tag from srcuri as it will have conflicts with SRCREV during recipe parse.
             del params['tag']
-        srcuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
+        srcuri = bb.fetch.encodeurl((scheme, network, path, user, passwd, params))
 
         if os.path.exists(os.path.join(srctree, '.gitmodules')) and srcuri.startswith('git://'):
             srcuri = 'gitsm://' + srcuri[6:]
@@ -603,7 +603,7 @@ def create_recipe(args):
 
         if is_package(fetchuri):
             localdata = bb.data.createCopy(tinfoil.config_data)
-            pkgfile = bb.fetch2.localpath(fetchuri, localdata)
+            pkgfile = bb.fetch.localpath(fetchuri, localdata)
             if pkgfile:
                 tmpfdir = tempfile.mkdtemp(prefix='recipetool-')
                 try:
@@ -708,7 +708,7 @@ def create_recipe(args):
     if not srcuri:
         lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
     lines_before.append('SRC_URI = "%s"' % srcuri)
-    shown_checksums = ["%ssum" % s for s in bb.fetch2.SHOWN_CHECKSUM_LIST]
+    shown_checksums = ["%ssum" % s for s in bb.fetch.SHOWN_CHECKSUM_LIST]
     for key, value in sorted(checksums.items()):
         if key in shown_checksums:
             lines_before.append('SRC_URI[%s] = "%s"' % (key, value))
@@ -716,7 +716,7 @@ def create_recipe(args):
         lines_before.append('')
         lines_before.append('# Modify these as desired')
         # Note: we have code to replace realpv further down if it gets set to some other value
-        scheme, _, _, _, _, _ = bb.fetch2.decodeurl(srcuri)
+        scheme, _, _, _, _, _ = bb.fetch.decodeurl(srcuri)
         if scheme in ['git', 'gitsm']:
             srcpvprefix = 'git'
         elif scheme == 'svn':
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index bf53edc08e4..10eca3c63ed 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -12,9 +12,9 @@ import re
 import sys
 import tempfile
 import bb
-from bb.fetch2.npm import NpmEnvironment
-from bb.fetch2.npm import npm_package
-from bb.fetch2.npmsw import foreach_dependencies
+from bb.fetch.npm import NpmEnvironment
+from bb.fetch.npm import npm_package
+from bb.fetch.npmsw import foreach_dependencies
 from oe.license_finder import match_licenses, find_license_files
 from recipetool.create import RecipeHandler
 from recipetool.create import generate_common_licenses_chksums
@@ -275,7 +275,7 @@ class NpmRecipeHandler(RecipeHandler):
         # dependencies have to be fetched again using the npmsw url
         bb.note("Fetching npm dependencies ...")
         bb.utils.remove(os.path.join(srctree, "node_modules"), recurse=True)
-        fetcher = bb.fetch2.Fetch([url_local], d)
+        fetcher = bb.fetch.Fetch([url_local], d)
         fetcher.download()
         fetcher.unpack(srctree)
 
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 33e197a22cc..860415789b1 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -202,7 +202,7 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
             tinfoil.parse_recipes()
 
             def eventhandler(event):
-                if isinstance(event, bb.fetch2.MissingChecksumEvent):
+                if isinstance(event, bb.fetch.MissingChecksumEvent):
                     checksums.update(event.checksums)
                     return True
                 return False
@@ -211,7 +211,7 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
             res = tinfoil.build_targets(fetchrecipepn,
                                         'do_unpack',
                                         handle_events=True,
-                                        extra_events=['bb.fetch2.MissingChecksumEvent'],
+                                        extra_events=['bb.fetch.MissingChecksumEvent'],
                                         event_callback=eventhandler)
             if not res:
                 raise FetchUrlFailure(srcuri)

