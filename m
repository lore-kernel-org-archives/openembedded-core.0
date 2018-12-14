Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id BD4277BDB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 18:15:36 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v13so6323801wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A7g1hdBP/rylj139o/0CNgglMIwrd2UoNfE89LFpsAk=;
	b=ZWEVwTHqGVeZaZLU1JI6j+ecSuKtZdEwAiO0ioEpeGnNLfW6afCfEJM/QXKkBb2ZIH
	mnFR6JvrmIKqCJf23PO24Yrsj31e56FqS3RcDdvf+1VJeexU5m8rnqDfvR4XHBxP8qx7
	mqLiATXhPOV2LDUVPKRPHHsTmScCb2GF/8G2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A7g1hdBP/rylj139o/0CNgglMIwrd2UoNfE89LFpsAk=;
	b=OlCq2BWayl1Rf9VMwICSxSi/Qka8SjXJuDcbo4g0INHE2Mp2aPm/l5Xz3k9XGXWXiz
	gC0GP7v0lKn2n5GXZ0cX1TnO67jS2lwjRU1we/dH00NxOQT1AaI3uQ1blUFIACL933K2
	V78bVqFr3DnXbEBH2BC7faNUtQPVsK2qhka/75HV1FadTDyKb9y42abCUt/buhXpESr5
	+dfpmjwjlWNkhlLj3apEf80hEN8z5a20AP4XhcnEeAgQ4NX1teGO22SEkoLjnnKoeN9U
	F/HOwrxX7XL0ZCKHN1jOi9d4zJCKLgWHtBw4AeArhnpxtSfxUufgY/Tyt4rEuyaTAqAA
	8QrQ==
X-Gm-Message-State: AA+aEWaGOp8/pyOfHA7sfT8Fvb0n0jalxb7rZOskOOJb9+TeOAKpAbB7
	eI8Whk5qL4kQG/dpAnWDXr4DNFb6foAArw==
X-Google-Smtp-Source: AFSGD/X3l2WcHZATtOu6S+EhSUoZzgB3sDg6tt9cea2t6hhz6teS+LamOTPN6FOoKgpAsr2yqsqWhw==
X-Received: by 2002:adf:b102:: with SMTP id l2mr3336634wra.296.1544811337061; 
	Fri, 14 Dec 2018 10:15:37 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f2sm3885653wre.34.2018.12.14.10.15.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 10:15:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 18:15:34 +0000
Message-Id: <20181214181535.9186-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/2] lib/oe/recipeutils: Add a new function to mimic do_checkpkg
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
X-List-Received-Date: Fri, 14 Dec 2018 18:15:36 -0000
Content-Transfer-Encoding: 8bit

The code in distrodata.bbclass related to the do_checkpkg task is rather
dated, has holes in it (ignoring some recipes) and has horrible locking
and csv related issues.

We should use modern APIs such as tinfoil to make the calls we need directly
against bitbake, cutting out the middleman and clarifing the code.

This change imports the bits of distrodata.bbclass that are needed by the
automated upgrade helper (AUH) into a standalone function which uses the
tinfoil API. This can then be used by AUH and by the tests in
oeqa/selftest/distrodata as well as by any other standalone script that needs
this functionality. Its likely it can be further improved from here but this is a
good start and appears to function as before, with slightly wider recipe
coverage as some things skipped by distrodata are not skipped here (images,
pieces of gcc, nativesdk only recipes).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/recipeutils.py | 53 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 9c99164d248..39d3de4bb1f 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -16,8 +16,10 @@ import shutil
 import re
 import fnmatch
 import glob
-from collections import OrderedDict, defaultdict
+import bb.tinfoil
 
+from collections import OrderedDict, defaultdict
+from bb.utils import vercmp_string
 
 # Help us to find places to insert values
 recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()']
@@ -1017,3 +1019,52 @@ def get_recipe_upstream_version(rd):
         ru['datetime'] = datetime.now()
 
     return ru
+
+def get_recipe_upgrade_status(recipes=None):
+    pkgs_list = []
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.prepare(config_only=False)
+
+        if not recipes:
+            recipes = tinfoil.all_recipe_files(variants=False)
+
+        for fn in recipes:
+            try:
+                if fn.startswith("/"):
+                    data = tinfoil.parse_recipe_file(fn)
+                else:
+                    data = tinfoil.parse_recipe(fn)
+            except bb.providers.NoProvider:
+                bb.note(" No provider for %s" % fn)
+                continue
+
+            unreliable = data.getVar('UPSTREAM_CHECK_UNRELIABLE')
+            if unreliable == "1":
+                bb.note(" Skip package %s as upstream check unreliable" % pn)
+                continue
+
+            uv = get_recipe_upstream_version(data)
+
+            pn = data.getVar('PN')
+            cur_ver = uv['current_version']
+
+            upstream_version_unknown = data.getVar('UPSTREAM_VERSION_UNKNOWN')
+            if not uv['version']:
+                status = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
+            else:
+                cmp = vercmp_string(uv['current_version'], uv['version'])
+                if cmp == -1:
+                    status = "UPDATE" if not upstream_version_unknown else "KNOWN_BROKEN"
+                elif cmp == 0:
+                    status = "MATCH" if not upstream_version_unknown else "KNOWN_BROKEN"
+                else:
+                    status = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
+
+            next_ver = uv['version'] if uv['version'] else "N/A"
+            revision = uv['revision'] if uv['revision'] else "N/A"
+            maintainer = data.getVar('RECIPE_MAINTAINER')
+            no_upgrade_reason = data.getVar('RECIPE_NO_UPDATE_REASON')
+
+            pkgs_list.append((pn, status, cur_ver, next_ver, maintainer, revision, no_upgrade_reason))
+
+    return pkgs_list
-- 
2.19.1


