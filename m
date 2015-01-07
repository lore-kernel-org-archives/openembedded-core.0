Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6428E728C9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 17:25:22 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id z60so1154267qgd.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 09:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=D5WWRwYniY54QTCiwhqb4Np1z+nD7h1OU+CiawFUsF8=;
	b=iux55IqXQ8++IM+G8zS/PytUPmDWEJVLqJAgbf0+dEzZi0Ne/S1saBaWDyykf0EuGT
	6vEjGdnWAgf4PqmzLqJ82guJywJMg57NGIsKGyZyr5eGhWEinC1pTx9QfWJNgHz0xkAw
	72+UYPq5Gu0Oe1udzKt+TqePNlrtKK91v4YfVykgax2NSVAxTYlJN8UI34qpBNyC7P90
	Q9A8S0EBNMwvF+FZnoIUlfnJKDwKBllyWPrZE8cJ4er95YYksKhocfwZE4lIDhPcbCoZ
	wL73KvGssZ8+8Qhw/eDe3gha+n+mqb/fxUAVyKPyFxmqhIxBvRJ3BzbaMrHOtClZPuO/
	uqig==
X-Received: by 10.140.49.5 with SMTP id p5mr6239089qga.15.1420651523466;
	Wed, 07 Jan 2015 09:25:23 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id j9sm1756227qgj.46.2015.01.07.09.25.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 09:25:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id E1F9E1CA798ED; Wed,  7 Jan 2015 15:25:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  7 Jan 2015 15:25:18 -0200
Message-Id: <1420651519-25240-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1420651519-25240-1-git-send-email-otavio@ossystems.com.br>
References: <1420651519-25240-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] module.bbclass: Add KERNEL_SRC in EXTRA_OEMAKE
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
X-List-Received-Date: Wed, 07 Jan 2015 17:25:26 -0000

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
---
 meta/classes/module.bbclass | 4 ++--
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
2.1.4


