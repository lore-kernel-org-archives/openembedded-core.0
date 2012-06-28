Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sk3QW-0005sW-Fj
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 03:21:44 +0200
Received: by dalh21 with SMTP id h21so2079019dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 18:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=zrrj4aEzb5IMVQ5LLplUAgGJttW5zeSxzIVvyhPoStU=;
	b=s3E9Ld4/NfVQTji8AG6YBlyc+3HnJ+021fL004DMbSORVJx0728w/hopTgQEG7Ti+7
	oTarkIxsFxByN9jyYdkX2Ccu8/Oq4AnpY71nN2+aS8k51iEq9jSKjLbvcLzA1Fzgntcc
	U9iD81vyMyDEQYsn9TTFA6ND5u3J8oCLUrMaQLKNDAHGEbd55B04W+FuAMCYluLynEa7
	201W6qc4AqqOQncZf3m8yQw5TnhT+MG0eUSezcNCgHX73bqqIzKJ9Qp4WdGnuVyFe6ux
	LH9Jmk+GNLd5riBUXFewx4KXa4HUz2EjpMMePOVQEZxCVtRk+/Lsvr1qGQM7JApFH9yp
	1u3g==
Received: by 10.68.190.40 with SMTP id gn8mr834321pbc.118.1340845841837;
	Wed, 27 Jun 2012 18:10:41 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gj8sm368275pbc.39.2012.06.27.18.10.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jun 2012 18:10:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 18:10:21 -0700
Message-Id: <e7eb300513b285a6e90a46989ed283e1cf28bfc0.1340845612.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <ac748647d97bee19bca3a4f312c82619b148c96e.1340845612.git.raj.khem@gmail.com>
References: <ac748647d97bee19bca3a4f312c82619b148c96e.1340845612.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340845612.git.raj.khem@gmail.com>
References: <cover.1340845612.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] eglibc: support mipsel little endian, filter out -march=mips32
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
X-List-Received-Date: Thu, 28 Jun 2012 01:21:44 -0000

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



