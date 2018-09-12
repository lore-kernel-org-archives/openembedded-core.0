Return-Path: <Alexey.Brodkin@synopsys.com>
X-Greylist: delayed 481 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Sep 2018 16:03:22 UTC
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id E03DF7982B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 16:03:22 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id EF22510C1B41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1536767722; bh=Wfc/Gl6SzqirhuByjkjBz4FQtsyOR1b5dxPlpueUssA=;
	h=From:To:Cc:Subject:Date:From;
	b=LbwnYklVMBoGwa40ye2lh5bQfxfisdTNeY0DDAZwMZ414E2ixZzmb0mk0H59lugsM
	QBTq73EAw5Ix6/AD2TvlNszXuctsQ0ZSRoNn+mKbYRjD40Uw3DcWXWONkaWQIICRI3
	nlLjjnQiEPuJ0hcUhwY4Y8O+bxje//kfMQD3+Z9j1jhJep+fgnCj29gTMBsh8VDRZF
	QczkYvisa6rwQFfhAQXh1KIYBAtte1AKVZcF5q1jgypz7LznjAwT0RsXtKe9BnV9W8
	IeUF/7jINoMPK4C4t7ktZxlZY1oYXhA/xpGB6n3HgfmnJHtakRHxEjf5erq4BV0I/Y
	8l0l+Wk1sHjOw==
Received: from abrodkin-7480l.internal.synopsys.com (unknown [10.121.8.87])
	by mailhost.synopsys.com (Postfix) with ESMTP id 1E4A93120;
	Wed, 12 Sep 2018 08:55:21 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 18:55:19 +0300
Message-Id: <20180912155519.7513-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.17.1
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] linux-libc-headers: Don't do useless configuration
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
X-List-Received-Date: Wed, 12 Sep 2018 16:03:23 -0000

There's no point in configuring Linux kernel before
headers installation.

Moreover in come cases it might lead to problems on kernels
starting from 4.17 with architecture or platfrom sets
CROSS_COMPILE variable automatically, see [1].

Also note Buildroot doesn't do that kind of confiuration as
well, see [2].

[1] https://lkml.org/lkml/2018/9/12/486
[2] https://git.buildroot.org/buildroot/tree/package/linux-headers/linux-headers.mk#n106

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 05c82558e653..1a365ddeb6a9 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -54,7 +54,6 @@ S = "${WORKDIR}/linux-${PV}"
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
 
 do_configure() {
-	oe_runmake allnoconfig
 }
 
 do_compile () {
-- 
2.17.1


