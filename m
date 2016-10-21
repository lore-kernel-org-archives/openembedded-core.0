Return-Path: <bounce+05c21e.62d95b-openembedded-core=lists.openembedded.org@nathanrossi.com>
Received: from rs224.mailgun.us (rs224.mailgun.us [209.61.151.224])
	by mail.openembedded.org (Postfix) with ESMTP id 9754760190
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 12:07:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=nathanrossi.com;
	q=dns/txt; 
	s=pic; t=1477051670; h=References: In-Reply-To: Message-Id: Date:
	Subject: Cc: To: From: Sender;
	bh=keZeSRLpY0B2qohD2VkXoQxmgOrZjIav5Db+af4O98s=;
	b=dtnPxbiuobYjf3Q+76kKsWEN1fFdaAK+di25AjuLvnx8xz/tTjuusrqGn7bHedkcnRj2YUBe
	fj2kDFnIHwiDrLkVliS8iQfADWI/9W4EfGULdtl3bMuuWEfd2xwvEKjmobl5uL4cQiSX1aJs
	5xddWvAkI6V36Q4JsPLxV1U/sVA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nathanrossi.com; s=pic;
	q=dns; h=Sender: From: To: Cc: Subject: Date: Message-Id: In-Reply-To:
	References;
	b=BoXGBcGk5UdjNrs+Cv6gVjU6P9QfHPaSyPchDfvlkK1GvOBaV7jo4n/ir+XSJT4Noi/3vr
	Bz0bY85nvxcsSLhopx6LgOzRmG8z1zkQ8s1dGlkr9oQ60iXPLq4a6jGKPnLQaKFDSfHc0C5U
	MFtOJ/sQg3D6ut4Iay1DgZ8Gv3rdE=
Sender: nathan@nathanrossi.com
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyI4NjhkNiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjYyZDk1YiJd
Received: from nathanbox.home.rossihq.com
	(CPE-1-121-165-196.qwl9.woo.bigpond.net.au [1.121.165.196])
	by mxa.mailgun.org with ESMTP id 580a050a.7f22f408da30-in1;
	Fri, 21 Oct 2016 12:07:38 -0000 (UTC)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 22:07:27 +1000
Message-Id: <20161021120728.22639-2-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161021120728.22639-1-nathan@nathanrossi.com>
References: <20161021120728.22639-1-nathan@nathanrossi.com>
Subject: [PATCH] kernel-fitimage.bbclass: Allow unset load/entry addresses for ramdisks
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
X-List-Received-Date: Fri, 21 Oct 2016 12:07:50 -0000

Allow the load and entry addresses to remain unset if the UBOOT_RD_*
variables are also unset for ramdisk entries in the image tree. This
allows for U-Boot to decide dynamically where to load the ramdisk.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/kernel-fitimage.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 3bbf91f65a..5c9e76b9ac 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -178,6 +178,15 @@ EOF
 fitimage_emit_section_ramdisk() {
 
 	ramdisk_csum="sha1"
+	ramdisk_loadline=""
+	ramdisk_entryline=""
+
+	if [ -n "${UBOOT_RD_LOADADDRESS}" ]; then
+		ramdisk_loadline="load = <${UBOOT_RD_LOADADDRESS}>;"
+	fi
+	if [ -n "${UBOOT_RD_ENTRYPOINT}" ]; then
+		ramdisk_entryline="entry = <${UBOOT_RD_ENTRYPOINT}>;"
+	fi
 
 	cat << EOF >> ${1}
                 ramdisk@${2} {
@@ -187,8 +196,8 @@ fitimage_emit_section_ramdisk() {
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
                         compression = "none";
-                        load = <${UBOOT_RD_LOADADDRESS}>;
-                        entry = <${UBOOT_RD_ENTRYPOINT}>;
+                        ${ramdisk_loadline}
+                        ${ramdisk_entryline}
                         hash@1 {
                                 algo = "${ramdisk_csum}";
                         };
-- 
2.9.3

