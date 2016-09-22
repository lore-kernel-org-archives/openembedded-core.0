Return-Path: <bounce+05c21e.62d95b-openembedded-core=lists.openembedded.org@nathanrossi.com>
X-Greylist: delayed 302 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Sep 2016 13:58:26 UTC
Received: from rs224.mailgun.us (rs224.mailgun.us [209.61.151.224])
	by mail.openembedded.org (Postfix) with ESMTP id E643F71982
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 13:58:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=nathanrossi.com;
	q=dns/txt; 
	s=pic; t=1474552707; h=References: In-Reply-To: Message-Id: Date:
	Subject: Cc: To: From: Sender;
	bh=VGRbplP7iQUMUIp8so3cZnjl79RGezSec8BQYeqsmu0=;
	b=HlFnM8UkLUDTiRcOkjl/TxEE0x1ZwUYLgTFrIZZcTzTq93GqvuigaHYSBJesdA3312oZvYsJ
	p1t0UBd+Y+K3DPRwqyMeW6FDAWpAyx18fKtDI715vcOQgHjKrvgVufayyQ9q8+3rFyYKeBDq
	9yboQHIjiSZ09OkJ60E6s2Jzxi0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nathanrossi.com; s=pic;
	q=dns; h=Sender: From: To: Cc: Subject: Date: Message-Id: In-Reply-To:
	References;
	b=gzl27IyoOvpCPc4wSDD9vIbTCoICm/3A7KO1y76adWY1LtW/cEs7p0U7or+mS+Q2Cz1Lo9
	63CAO2wr4cV1LASB827HPEC4MWC/jyDEi7NE56ylg+Bd82R5yrinf7RD5mAkIJA03D3u4OtJ
	4MnRhEXZsYpZ9bRr/++7xiETJbUAk=
Sender: nathan@nathanrossi.com
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyI4NjhkNiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjYyZDk1YiJd
Received: from nathanbox.home.rossihq.com
	(CPE-124-186-123-69.lns10.woo.bigpond.net.au [124.186.123.69])
	by mxa.mailgun.org with ESMTP id 57e3e253.7f2be46fd670-in2;
	Thu, 22 Sep 2016 13:53:23 -0000 (UTC)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2016 23:53:01 +1000
Message-Id: <20160922135301.21195-2-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160922135301.21195-1-nathan@nathanrossi.com>
References: <20160922135301.21195-1-nathan@nathanrossi.com>
Subject: [PATCH 2/2] scripts/runqemu: Using a cpio* rootfs has no special network
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
X-List-Received-Date: Thu, 22 Sep 2016 13:58:30 -0000

When booting a system with the rootfs being of cpio* type the networking
setup should still work the same as for all other root filesystem types.
This change removes the clearing of the NETWORK_CMD variable allowing
for the slirp/tap setup to be provided to QEMU.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 scripts/runqemu | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2ed6f9a26e..5095e67817 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -821,7 +821,6 @@ class BaseConfig(object):
             self.rootfs_options = '-drive file=%s,if=virtio,format=raw' % self.rootfs
 
         if self.fstype in ('cpio.gz', 'cpio'):
-            self.set('NETWORK_CMD', '')
             self.kernel_cmdline = 'root=/dev/ram0 rw debugshell'
             self.rootfs_options = '-initrd %s' % self.rootfs
         else:
-- 
2.9.3

