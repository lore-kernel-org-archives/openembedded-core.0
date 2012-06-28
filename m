Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkMZO-0005rp-LJ
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 23:48:10 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3494282pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=zrrj4aEzb5IMVQ5LLplUAgGJttW5zeSxzIVvyhPoStU=;
	b=Ke7DMsC/HKW4rO1JbLyOyUOm0o2dgLZ6fa6LHDi7tQb7tRzaHms3EGl8+LAyzL+b5H
	qRrqgghfxkdtmYWlJs7Pwp3VTbJH1hUawltNPUewzQ3al3qU9JcLfV/37ylpexq1b1t9
	Bk+WRaknRueLXWSSRVuMq/5Dhv4fbtrz/kvuAjWUYoN/ayxIScguNgQQ/Gvp0jd1AjaB
	jtznDxhzvRemrLQB2aw+zEXzZ/e/bcbqn3pb9lnitzWFStc2dYKGh/T4ESNZWK9pE7/j
	5OaqfAw5kr3YFQzhjvzt0RL1zLACddPzzpMap2ngTN09lZ+VjMVhapWvwSWAHUJhE2AP
	KJeQ==
Received: by 10.68.220.39 with SMTP id pt7mr12433552pbc.40.1340919437519;
	Thu, 28 Jun 2012 14:37:17 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id os1sm3220209pbb.49.2012.06.28.14.37.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 14:37:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 14:36:50 -0700
Message-Id: <9f94d7186a9b9bb9d976f934fe2dab53ab58a2b4.1340919157.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
References: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340919157.git.raj.khem@gmail.com>
References: <cover.1340919157.git.raj.khem@gmail.com>
Subject: [PATCH 04/11] eglibc: support mipsel little endian, filter out -march=mips32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2012 21:48:10 -0000

From: Dennis Lan <dennis.yxun@gmail.com>

Quote for eglibc source:
 for mips eglibc now builds syscall tables for all abi's
 so we make sure that we choose right march option which is
 compatible with o32,n32 and n64 abi's
 e.g. -march=mips32 is not compatible with n32 and n64 therefore
 we filter it out in such case -march=from-abi which will be
 mips1 when using o32 and mips3 when using n32/n64

Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
---
 meta/recipes-core/eglibc/eglibc_2.15.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index e57a112..b2922b4 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -101,6 +101,7 @@ do_patch_append() {
 # mips1 when using o32 and mips3 when using n32/n64
 
 TUNE_CCARGS_mips := "${@oe_filter_out('-march=mips32', '${TUNE_CCARGS}', d)}"
+TUNE_CCARGS_mipsel := "${@oe_filter_out('-march=mips32', '${TUNE_CCARGS}', d)}"
 
 # We need to ensure that all of the i386 and x86_64 headers are identical
 # to support the multilib case.  We do this by copying headers from x86_64
-- 
1.7.9.5



