Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id C824276419
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 07:41:49 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t747fneE027788 for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Aug 2015 02:41:49 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015080402415006-881296 ;
	Tue, 4 Aug 2015 02:41:50 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 4 Aug 2015 10:41:48 +0300
Message-Id: <1438674108-24258-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/04/2015 02:41:50 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/04/2015 02:41:50 AM,
	Serialize complete at 08/04/2015 02:41:50 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-08-04_03:, , signatures=0
Subject: [PATCH] kernel-yocto: do_configme: Add $TOOLCHAIN_OPTIONS to CFLAGS
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
X-List-Received-Date: Tue, 04 Aug 2015 07:41:52 -0000

The kernel configure step was broken by the sysroot poisoning in [1].
In linux-yocto.inc this was fixed by appending $TOOLCHAIN_OPTIONS to
KERNEL_CC, TOOLCHAIN_OPTIONS containing the needed --sysroot arg.

However, [1] also breaks the yocto configure fragment generation:
after parsing the fragments, when make is called on the merged file
to fill in any missing symbols with default values. The call chain is:

do_kernel_configme() -> configme -> merge_config.sh
-> make KCONFIG_ALLCONFIG=$TMP_FILE

This issue was uncaught until now because configme redirects all stdout
and stderr to merge_log.txt prior to calling merge_configs.sh and there
is no return value checking, so building continues and the silent error
is ignored.

Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling configme fixes this.

TODO: In a future patch this kind of error should be made loud and cause
the build to fail.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2014-October/098253.html

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/kernel-yocto.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 231e08d..3a67238 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -248,6 +248,7 @@ do_kernel_configme() {
 
 	cd ${S}
 	PATH=${PATH}:${S}/scripts/util
+	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}"
 	configme ${configmeflags} --reconfig --output ${B} ${LINUX_KERNEL_TYPE} ${KMACHINE}
 	if [ $? -ne 0 ]; then
 		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
-- 
2.1.4


