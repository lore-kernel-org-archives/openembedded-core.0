Return-Path: <bounce+05c21e.62d95b-openembedded-core=lists.openembedded.org@nathanrossi.com>
Received: from rs224.mailgun.us (rs224.mailgun.us [209.61.151.224])
	by mail.openembedded.org (Postfix) with ESMTP id 489506069C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 07:52:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=nathanrossi.com;
	q=dns/txt; 
	s=pic; t=1475135557; h=Message-Id: Date: Subject: Cc: To: From: Sender; 
	bh=ltXMKvdpOI7eb03u3QhLZDhc7GHO33MC3/GVh7Zfo4M=;
	b=SCmo7j/lfecZEkjV+ZwkdN5aKMAart/E6KisKOvYZRkxk5RcnMS/2l6jpV/3d8w6rE3v7akF
	Rx+ymW4pKaZ+/cEKs/l6jVJJbMo3Q+fxpLM+bR+AFS73eweesGJnRKJlUeRHfZ6Mh85UFDlk
	h9WX/WQYXewTh4PbhlOe4Fn2dXs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nathanrossi.com; s=pic;
	q=dns; h=Sender: From: To: Cc: Subject: Date: Message-Id;
	b=ljUaMhi7S4DOu0Jc5gsRkSHu06nHnphgcgfFUirp5ouKkx+wi1EQLN4tZilGtRb/lJqfYb
	0/QDY5XsEdOD/sNGs8/8Z5D40Yd5OA4vhq2jJQNDPgcEJxeCn23UevwdwizM9wxhZKCgTcAg
	n369yuDgOGtlihgyuo8SQJPOiVskE=
Sender: nathan@nathanrossi.com
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyI4NjhkNiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjYyZDk1YiJd
Received: from nathanbox.home.rossihq.com
	(CPE-124-186-123-69.lns10.woo.bigpond.net.au [124.186.123.69])
	by mxa.mailgun.org with ESMTP id 57ecc845.7f2942383270-in2;
	Thu, 29 Sep 2016 07:52:37 -0000 (UTC)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:52:10 +1000
Message-Id: <20160929075210.15250-1-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] linux-yocto.inc: Run kernel_version_sanity_check with final source
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
X-List-Received-Date: Thu, 29 Sep 2016 07:52:37 -0000

Ensure that the kernel_version_sanity_check task runs after all source
modifications are complete, including any that are introduced during the
kernel_metadata task. This also avoids any race condition issues when
kernel_version_sanity_check and kernel_metadata tasks are running at the
same time.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index a5595abe8d..d8d4387a4c 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -64,7 +64,7 @@ do_install_append(){
 }
 
 # extra tasks
-addtask kernel_version_sanity_check after do_kernel_checkout before do_compile
+addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
 addtask kernel_link_images after do_compile before do_install
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
-- 
2.9.3

