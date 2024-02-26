Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D022C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 22:41:27 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.7393.1708987285177741899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 14:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1rejf1-0002oq-0Q; Mon, 26 Feb 2024 23:41:23 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1rejf0-0034vs-KB; Mon, 26 Feb 2024 23:41:22 +0100
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1rejf0-00Ee3a-1q;
	Mon, 26 Feb 2024 23:41:22 +0100
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] perf: fix TMPDIR contamination for recent mainline kernels
Date: Mon, 26 Feb 2024 23:39:18 +0100
Message-Id: <20240226223918.3490014-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 22:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196231

The sed command

  sed -i -e "s,prefix='\$(DESTDIR_SQ)/usr'$,prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(PYTHON_SITEPACKAGES_DIR)' --root='\$(DESTDIR)',g" \
    ${S}/tools/perf/Makefile.perf

that was introduced by oe-core commit 43f96506 ("perf: fix the
install-python_ext") [1] and adapted with oe-core commit 138673f8
("perf: Fix reproducibility issues with 5.19 onwards") [2], patches the
'setup.py install' arguments for the 'install-python_ext' Make target
similar to what the setuptools3_legacy.bbclass provides as
${SETUPTOOLS_INSTALL_ARGS}.

However, this only applies to the linux-yocto kernel patched with
linux-yocto commit 3fd60d4d ("perf: change --root to --prefix for python
install") [3] that was introduced in 2012 and never went upstream in any
way.

For a recent mainline kernel instead, we will run into host path
contamination QA warnings like:

| WARNING: perf-1.0-r0 do_package_qa: QA Issue: File /usr/lib/python3.11/site-packages/perf-0.1-py3.11-linux-x86_64.egg/EGG-INFO/SOURCES.txt in package perf-python contains reference to TMPDIR
| File /usr/lib/python3.11/site-packages/perf-0.1-py3.11-linux-x86_64.egg/__pycache__/perf.cpython-311.pyc in package perf-python contains reference to TMPDIR [buildpaths]

To fix this, this commit introduces a replacement for Makefile.perf that
results in the exact same setup.py install args as for the linux-yocto
kernel.

In oe-core commit c849ed0c ("perf: fix the install-python_ext on
upstream kernel") [4], the sed that was originally meant for 'Makefile'
only, was extended to 'Makefile*' (and thus including) Makefile.perf to
fix similar issues.

Since this would the affect the just-introduced Makefile.perf-specific
sed, the scope of this extra sed was limited back to 'Makefile' only.
The line could also be entirely removed maybe, since it seems to be for
very old kernels only.

In general, I would tend to argue that the above-mentioned linux-yocto
patch for  should be dropped if it requires additional sed-based
patching anyway.

[1] https://git.openembedded.org/openembedded-core/commit/?id=43f965061f8af4c4537e9d9c0257253e613a616d
[2] https://git.openembedded.org/openembedded-core/commit/?id=138673f833a72c636a7fa185089f25dda350dc54
[3] https://git.yoctoproject.org/linux-yocto/commit/?id=3fd60d4d6f0095b03ff9b7b1499a049c580e7302
[4] https://git.openembedded.org/openembedded-core/commit/?id=c849ed0c66a2fb7d91795c421eb4c87b47d03c0d

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/recipes-kernel/perf/perf.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index a392166e73..00a735ffc6 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -225,14 +225,18 @@ do_configure:prepend () {
     if [ -e "${S}/tools/perf/Makefile.perf" ]; then
         sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
             ${S}/tools/perf/Makefile.perf
+        # Variant with linux-yocto-specific patch
         sed -i -e "s,prefix='\$(DESTDIR_SQ)/usr'$,prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(PYTHON_SITEPACKAGES_DIR)' --root='\$(DESTDIR)',g" \
             ${S}/tools/perf/Makefile.perf
+        # Variant for mainline Linux
+        sed -i -e "s,root='/\$(DESTDIR_SQ)',prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(PYTHON_SITEPACKAGES_DIR)' --root='/\$(DESTDIR_SQ)',g" \
+            ${S}/tools/perf/Makefile.perf
         # backport https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8
         sed -i -e 's,\($(Q)$(SHELL) .$(arch_errno_tbl).\) $(CC) $(arch_errno_hdr_dir),\1 $(firstword $(CC)) $(arch_errno_hdr_dir),g' \
             ${S}/tools/perf/Makefile.perf
     fi
     sed -i -e "s,--root='/\$(DESTDIR_SQ)',--prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
-        ${S}/tools/perf/Makefile*
+        ${S}/tools/perf/Makefile
 
     if [ -e "${S}/tools/build/Makefile.build" ]; then
         sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
-- 
2.39.2


