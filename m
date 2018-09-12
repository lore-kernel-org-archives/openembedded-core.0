Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id DD5A979663
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 17:04:50 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 2135810C1B50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 10:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1536771892; bh=Zg0Epsumch59xHw2GZ7ZoQT0s3DYVYXZcxjAu85ci9o=;
	h=From:To:Cc:Subject:Date:From;
	b=WeVZAZE+qV4AlvY/8Pju6o/akIFVFvCNLKdnfYDuoXGdP0pKV56wyRkb7oMHYoI5N
	OtdB1GAuWP+aRZ5lNkbYrdsbsmi/fJkgdFls2aeTL4cjqBv61WiXju7XHbo95R8AJC
	O4Pr5gNSJtElaFN8WudxfppD7KRvfbnmtbTwo4/YLod+si42KNUkSoEKi5Nh5bGZQY
	GqA8Rfjob86S+V7Efs3dfX3HZL5kBXjS6Bwq6dQu4jf4cD722u4E/g3Sp+QVu6LgYr
	Y7Z5+UzoEbytKK6LfuwK4M9d51ypk9KHu380+psPbmiOK6NGwqFN2ylsEWrW66/SYH
	bXK1mNHYr1DVQ==
Received: from abrodkin-7480l.internal.synopsys.com (unknown [10.121.8.87])
	by mailhost.synopsys.com (Postfix) with ESMTP id 49DC55403;
	Wed, 12 Sep 2018 10:04:50 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 20:04:45 +0300
Message-Id: <20180912170445.4322-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.17.1
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v2] linux-libc-headers: Don't do useless configuration
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
X-List-Received-Date: Wed, 12 Sep 2018 17:04:51 -0000

There's no point in configuring Linux kernel before
headers installation.

Moreover in come cases it might lead to problems on kernels
starting from 4.17 with architecture or platfrom sets
CROSS_COMPILE variable automatically, see [1].

Also note Buildroot doesn't do that kind of confiuration as
well, see [2].

And while at it convert empty do_compile to noexec as well.

[1] https://lkml.org/lkml/2018/9/12/486
[2] https://git.buildroot.org/buildroot/tree/package/linux-headers/linux-headers.mk#n106

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

Changes v1 -> v2:
 * Use noexec approach for do_configure
 * Convert do_compile to noexec as well

 .../linux-libc-headers/linux-libc-headers.inc              | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 05c82558e653..be215af9b953 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -53,12 +53,9 @@ S = "${WORKDIR}/linux-${PV}"
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
 
-do_configure() {
-	oe_runmake allnoconfig
-}
+do_configure[noexec] = "1"
 
-do_compile () {
-}
+do_compile[noexec] = "1"
 
 do_install() {
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix}
-- 
2.17.1


