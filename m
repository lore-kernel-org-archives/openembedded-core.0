Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9FCE772B49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 11:55:52 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id z2so8816492wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K4lxWNkOTTPyknmrA3BY+g0PRpdxVrYZ+kbMqKPqkkw=;
	b=YrPTqNmifBiuC1qQzxar6s6NUUl+tKYlmXyEx7OOHQac3iG1VZ96DxLlVrfjN6kp8X
	bChqZDg74NmOGAQamutPnQIkvjmh/URA8viLiWZBilDDUEB0CiBDPHDTPL6yRzibWPcZ
	4KuDuebDQNC2x4HljNK3LF8sjuPiG2ribawedsYLJuUbSiStei+n7UzVaW+cvIiNT7AP
	/R4rIanJfO58Dn1oI4Ko8JeineGNydytRf2nyPRIzHhupK1torvdFkhXGMva7oqvCjD4
	6ooCZ5vxJD0Gv3y6yql6ASJZKOo3khCyzv6lwJ9yULBUkD8T0wsiC+5ZQ6DxBRcB+zui
	9NPw==
X-Gm-Message-State: ALoCoQn2IoogP60RQ2qUeJJjZfkXeDkiLcTawcbxrzNstnFqDd4XT2pdJm6TtLRvfQjg7A5qCBcA
X-Received: by 10.181.8.193 with SMTP id dm1mr24307586wid.55.1421322952886;
	Thu, 15 Jan 2015 03:55:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id vh8sm1798509wjc.12.2015.01.15.03.55.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 03:55:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 11:54:13 +0000
Message-Id: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: dvhart@linux.intel.com, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/8] module.bbclass: Add KERNEL_SRC in EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 15 Jan 2015 11:55:58 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

When the sstate hash changes for do_configure task, the do_configure
default implementation triggers the 'clean' to be run. For it to
succeed we need to have KERNEL_SRC defined in EXTRA_OEMAKE. Fixes
following error:

,----
| DEBUG: Executing shell function do_configure
| NOTE: make -e MAKEFLAGS= clean
| make -C  M=.../tmp/work/... clean
| make[1]: *** M=.../tmp/work/...: No such file or directory.  Stop.
| Makefile:20: recipe for target 'clean' failed
| make: *** [clean] Error 2
| ERROR: oe_runmake failed
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/module.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index ad6f7af..5cb8623 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -6,10 +6,11 @@ addtask make_scripts after do_patch before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[deptask] = "do_populate_sysroot"
 
+EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
+
 module_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
-		   KERNEL_SRC=${STAGING_KERNEL_DIR}    \
 		   KERNEL_VERSION=${KERNEL_VERSION}    \
 		   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 		   AR="${KERNEL_AR}" \
@@ -19,7 +20,6 @@ module_do_compile() {
 module_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
-	           KERNEL_SRC=${STAGING_KERNEL_DIR} \
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 	           modules_install
 }
-- 
1.7.10.4


