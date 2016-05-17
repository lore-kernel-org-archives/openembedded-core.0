Return-Path: <afenkart@gmx.ch>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD6770100
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:21:36 +0000 (UTC)
Received: from localhost ([89.176.167.254]) by mail.gmx.com (mrgmx001) with
	ESMTPSA (Nemesis) id 0MLvGW-1ax806040C-007l2k; Tue, 17 May 2016 11:16:34
	+0200
From: Andreas Fenkart <andreas.fenkart@dev.digitalstrom.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 11:16:19 +0200
Message-Id: <1463476580-17779-3-git-send-email-andreas.fenkart@dev.digitalstrom.org>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1463476580-17779-1-git-send-email-andreas.fenkart@dev.digitalstrom.org>
References: <1463476580-17779-1-git-send-email-andreas.fenkart@dev.digitalstrom.org>
Sender: afenkart@gmx.ch
X-Provags-ID: V03:K0:8JN6j7HKpzzBshTiDmOYNOCfyGyQAK86tShLapC+ikgoL3qWB5H
	pPSPWkOmih5nL9IqOpb6ELrP9eBdnepABECwEGuAXcs6wSDmNGXja0/c767RfnSVPdZhgip
	tqNE11+lOr/a4OrcKrUILS2FxPw/siPjTxMiu6qNwAr9EKYY7Dv+RuVVH9d/rqfsRjALqBZ
	7kFP0fc+zmNFZQUrsv6OA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:defsYvEuhus=:g8vg2c8y/5T6Aw0FRl3MyZ
	cKrmTGzVuotDvqdT935TRh2QZ87N4ZugFVvSg8OT5ZEEJQA65ebqlqJMVtopOWIQfLsCfE7hH
	6P2/p7MnBh8lA3fY3O0hAJFFxj9CO5j0LobxJVNcYpEP2SpYb6Z6/3b/+WjCIsD6wt/dbA7Jf
	8/s+RGpFClRjKoRF21ZoA/sQrsAcLLt4OdaNSUXflC27gFiEwM/DtE7Y2kw0oJCaxakLRwCn1
	Zo/b3E6yaIC8donMkVv2WKu8AYHqEUTGwXpA4kOTS50iUyGEh1HYwNbh7UgYHC9G6zOtG5k86
	7RWNl+kTEbKcqqBpJFuLNKx8G/sI0EPzrdTEiRN3BxnHTU5NB5Wp/qw+oOMeZMQQMXNRhKNFV
	rFzfo9jx/p0zwCWrDpuWasVDYWEZ+/ywtmKglp1UGkF2OqOUwVTLssJ2NMDuqirjLBZAMNqZQ
	rD4YAIJE2QTeI21dfIAVSfTDDdPyRf7FdfJT8f6qxesvRNSKSznIUsvIlzh619t0d/zvULfBY
	V3JfA3hXvtizNFI13pPIg6fc1OrULGNH7wHK8IbkLsJeWVo0VmlLoweJ3gX1emdsSSWwqHRqX
	RXJCoLZ3+tseL8Ux98PP7qmrsCH8pVc/69sL8KmKPl7dTEPM/v0NH51ziYZVVTnttiY31BVeg
	fTEdDljZOvhf66gBghtHzBpKIwr4AE3g3I4Kcu3L76gFFnL1WB6ZvroxjwutuFgBLvvqKhGM8
	6NxmYZS75uKLuXR6VrKMmuiuuqqTmuqSYwmeAzmUNXfKwavw5k1dphKzAl4=
Subject: [PATCH 2/3] kernel-module-split: allow to override KERNEL_MODULE_PATTERN
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
X-List-Received-Date: Tue, 17 May 2016 09:21:38 -0000

can be use to add LINUX_VERSION to each module package

Signed-off-by: Andreas Fenkart <andreas.fenkart@dev.digitalstrom.org>
---
 meta/classes/kernel-module-split.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index e1a70e6..b526ef8 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -29,6 +29,7 @@ do_install_append() {
 PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
 
 KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
+KERNEL_MODULE_PATTERN ?= 'kernel-module-%s'
 
 python split_kernel_module_packages () {
     import re
@@ -181,7 +182,7 @@ python split_kernel_module_packages () {
 
     module_deps = parse_depmod()
     module_regex = '^(.*)\.k?o$'
-    module_pattern = 'kernel-module-%s'
+    module_pattern = d.getVar("KERNEL_MODULE_PATTERN", True)
 
     postinst = d.getVar('pkg_postinst_modules', True)
     postrm = d.getVar('pkg_postrm_modules', True)
-- 
2.8.1


