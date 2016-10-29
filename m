Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D631671DB1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 13:50:31 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id u84so4009297pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=/id3CnJ3qwvrB5SHL7uxllrcsaMRSZokeFWjDHEJJ5I=;
	b=EMIrzpU2/t5T6X8TzF1PM3SF6j7/PpPFcsf8ThgJjwh+QZlhpdBh0iWdYJgbuAYqYK
	oIJEuyJKwLSiY7DmIox8/ldiraAIkVY+vSZGJ4dYIMo9uwtLWVrymOhs5dPnOk4O8sOp
	Yjv2JiQw+TJ5tHq7TnTQSeBkNg1PRMvMHSlGB9AH2ApMxezSmr6elw/rOcACO+gz39nH
	pAxmGAik3S8R4mzaLoYehdyY1cjyHdTVyMu95SMipQgup0qMgivg3SymIdqlLfHeet5B
	Eg/YkDXG17aKIiyj4dxXsjP75NZZ6Q3qqm9IWyfHk66jc+J/JdE1gs74I6suBxtAxpXP
	7TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/id3CnJ3qwvrB5SHL7uxllrcsaMRSZokeFWjDHEJJ5I=;
	b=HLbimkMpvZEvNrysNmyjY8XGLEd6195qetTGbwNxNaqPFZE+1cUgu5VGSEW3gmtpCW
	SdKIX6NSwxSx/sA301/g3KeZdSUXyZkl7kl0CdfyQNR9UwKlBgkpmcVDE0S6vHz0W8Yp
	CRSb9khc98R/yu5EsaUgAYC3jpKpFFT/PJj9YkiDMKiF4/LCpspcFOBtI04fWv53CQlr
	gnMOEZ/dDhix5sehaKlvh0f5BvbHK+AyUmG3202JverHT3M5pjLnkQP6QjN0tLnbwzUb
	nR28uTdLEV4+PGZua3zBuHwvP1+6VzmxJt78IApIkdkYHoaSjmWvEO8S0QmhvzyDDNBl
	wOTg==
X-Gm-Message-State: ABUngvdrzXLv3rWJfzbi1MrkHyzdPWkOakVB5GbQV3M0dFswZtMz0x/XB6+XjzYjNLLJKQ==
X-Received: by 10.99.6.134 with SMTP id 128mr27887474pgg.53.1477749032610;
	Sat, 29 Oct 2016 06:50:32 -0700 (PDT)
Received: from nathanbox.home.rossihq.com
	(CPE-1-121-165-196.qwl9.woo.bigpond.net.au. [1.121.165.196])
	by smtp.gmail.com with ESMTPSA id 3sm25528640pam.21.2016.10.29.06.50.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Oct 2016 06:50:31 -0700 (PDT)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Oct 2016 23:50:19 +1000
Message-Id: <20161029135020.2579-1-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH] qemuboot.bbclass: Setup the vardeps for write_qemuboot_conf
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
X-List-Received-Date: Sat, 29 Oct 2016 13:50:31 -0000

Setting up the vardeps on write_qemuboot_conf forces the updating of
variables in qemuboot.conf when machine/deploy configuration changes.
This is particularly useful when developing or setting up the qemuboot
(e.g.  changing QB_* variables) for new targets or when changing
deployment variables (e.g. KERNEL_IMAGETYPE).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/qemuboot.bbclass | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index b5cc93dc93..39df3ad388 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -44,25 +44,22 @@ QB_OPT_APPEND ?= "-show-cursor"
 # Create qemuboot.conf
 ROOTFS_POSTPROCESS_COMMAND += "write_qemuboot_conf; "
 
-python write_qemuboot_conf() {
-    import configparser
-
-    build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE', \
-                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME', \
-                'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE', \
+def qemuboot_vars(d):
+    build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
+                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
+                'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
                 'STAGING_DIR_HOST']
+    return build_vars + [k for k in d.keys() if k.startswith('QB_')]
 
-    # Vars from bsp
-    qb_vars = []
-    for k in d.keys():
-        if k.startswith('QB_'):
-            qb_vars.append(k)
+write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
+python write_qemuboot_conf() {
+    import configparser
 
     qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('IMAGE_NAME', True))
     qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('IMAGE_LINK_NAME', True))
     cf = configparser.ConfigParser()
     cf.add_section('config_bsp')
-    for k in build_vars + qb_vars:
+    for k in qemuboot_vars(d):
         cf.set('config_bsp', k, '%s' % d.getVar(k, True))
 
     # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is the name of a symlink
-- 
2.10.1


