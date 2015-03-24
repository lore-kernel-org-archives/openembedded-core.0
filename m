Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3E460034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:57:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2OIvtij010660
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Mar 2015 11:57:55 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 24 Mar 2015 11:57:54 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 24 Mar 2015 14:57:49 -0400
Message-ID: <f3f09243e4101fb20f05cb9f996fd0c2c5dcdbbe.1427222980.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1427222980.git.bruce.ashfield@windriver.com>
References: <cover.1427222980.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] kernel-yocto: allow in-tree defconfigs
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
X-List-Received-Date: Tue, 24 Mar 2015 18:57:55 -0000
Content-Type: text/plain

In a similar manner to the kernel itself, which does the following to
bring a defconfig into the configuration:

    defconfig: $(obj)/conf
    ifeq ($(KBUILD_DEFCONFIG),)
        $< --defconfig $(Kconfig)
    else
        @echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
        $(Q)$< --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
    endif

We do the same with the linux-yocto configuration processing. If a
defconfig is specified via the KBUILD_DEFCONFIG variable, we copy it
from the source tree, into a common location and normalized "defconfig"
name, where the rest of the process will include and incorporate it
into the configuration process.

If the fetcher has already placed a defconfig in WORKDIR (from the
SRC_URI), we don't overwrite it, but instead warn the user that SRC_URI
defconfigs take precedence.

[YOCTO: #7474]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1e226a5722ac..14551a23f28c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -56,6 +56,7 @@ def get_machine_branch(d, default):
     return default
 
 do_kernel_metadata() {
+	set +e
 	cd ${S}
 	export KMETA=${KMETA}
 
@@ -75,6 +76,41 @@ do_kernel_metadata() {
 		machine_srcrev="${SRCREV}"
 	fi
 
+	# In a similar manner to the kernel itself:
+	#
+	#   defconfig: $(obj)/conf
+	#   ifeq ($(KBUILD_DEFCONFIG),)
+	#	$< --defconfig $(Kconfig)
+	#   else
+	#	@echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
+	#	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
+	#   endif
+	#
+	# If a defconfig is specified via the KBUILD_DEFCONFIG variable, we copy it
+	# from the source tree, into a common location and normalized "defconfig" name,
+	# where the rest of the process will include and incoroporate it into the build
+	#
+	# If the fetcher has already placed a defconfig in WORKDIR (from the SRC_URI),
+	# we don't overwrite it, but instead warn the user that SRC_URI defconfigs take
+	# precendence.
+	#
+	if [ -n "${KBUILD_DEFCONFIG}" ]; then
+		if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
+			if [ -f "${WORKDIR}/defconfig" ]; then
+				# If the two defconfigs are the same, leave the existing one in place
+				cmp "${WORKDIR}/defconfig" "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}"
+				if [ $? -ne 0 ]; then
+					bbnote "defconfig detected in WORKDIR. ${KBUILD_DEFCONFIG} skipped"
+				else
+					cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
+					sccs="${WORKDIR}/defconfig"
+				fi
+			fi
+		else
+			bbfatal "A KBUILD_DECONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
+		fi
+	fi
+
 	# if we have a defined/set meta branch we should not be generating
 	# any meta data. The passed branch has what we need.
 	if [ -n "${KMETA}" ]; then
@@ -86,11 +122,10 @@ do_kernel_metadata() {
 		bbfatal "Could not create ${machine_branch}"
 	fi
 
-	sccs="${@" ".join(find_sccs(d))}"
+	sccs="$sccs ${@" ".join(find_sccs(d))}"
 	patches="${@" ".join(find_patches(d))}"
 	feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
 
-	set +e
 	# add any explicitly referenced features onto the end of the feature
 	# list that is passed to the kernel build scripts.
 	if [ -n "${KERNEL_FEATURES}" ]; then
-- 
2.1.0


