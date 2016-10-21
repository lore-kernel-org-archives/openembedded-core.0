Return-Path: <bounce+05c21e.62d95b-openembedded-core=lists.openembedded.org@nathanrossi.com>
Received: from rs224.mailgun.us (rs224.mailgun.us [209.61.151.224])
	by mail.openembedded.org (Postfix) with ESMTP id 9858271D41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 12:07:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=nathanrossi.com;
	q=dns/txt; 
	s=pic; t=1477051670; h=Message-Id: Date: Subject: Cc: To: From: Sender; 
	bh=gVIgfG0fiLuuyQCmwayesetIZ0s1bdhXVDZjfdx/eZ4=;
	b=LQMGf25x8K/JhJ7PtS17jOKwETYU0qNq8pWRTcDaweJIfyIzi11xHn6KDMN49Kj1nVzBHf47
	s/DBgIp6SOOEeX2HHMZ2hcp7m2Xw+N8NHVSyxHmAdiX8/yooYqtqUModsN2uMY4ADWIEzIhs
	3Hvl6jwKRg/Qc1/EaHQu4L92q0U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nathanrossi.com; s=pic;
	q=dns; h=Sender: From: To: Cc: Subject: Date: Message-Id;
	b=kUqA/auuoTczt0WqLJwdPT47fpLYRRWcLI06JCZxfRc1G6ggHwhaXU3KiLp71hgRNKB+3w
	Uq7U6f0PWkTA4hsXctY5FHxyY4ZPGlhfRHvt+5/hXZGD5kxB/KnAY3lwBiDhcm2zHCbVLbO8
	jMgxehPNc2yjFDpFTKurHcwbSRI9E=
Sender: nathan@nathanrossi.com
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyI4NjhkNiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjYyZDk1YiJd
Received: from nathanbox.home.rossihq.com
	(CPE-1-121-165-196.qwl9.woo.bigpond.net.au [1.121.165.196])
	by mxa.mailgun.org with ESMTP id 580a0509.7f22f408da30-in1;
	Fri, 21 Oct 2016 12:07:37 -0000 (UTC)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 22:07:26 +1000
Message-Id: <20161021120728.22639-1-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] kernel-fitimage.bbclass: Check value of UBOOT_SIGN_ENABLE
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

Check the value of UBOOT_SIGN_ENABLE, as it is defaulted to "0" which
for matches as True in python due to being a non-empty string.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 8580247f82..3bbf91f65a 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -26,7 +26,7 @@ python __anonymous () {
         # Verified boot will sign the fitImage and append the public key to
         # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
         # the fitImage:
-        if d.getVar('UBOOT_SIGN_ENABLE', True):
+        if d.getVar('UBOOT_SIGN_ENABLE', True) == "1":
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
 }
-- 
2.9.3

