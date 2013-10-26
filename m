Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F36C6D3D6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2013 07:53:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9Q7rJVa026988
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 26 Oct 2013 00:53:19 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sat, 26 Oct 2013 00:53:18 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Oct 2013 03:53:15 -0400
Message-ID: <cover.1382773654.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for mips64
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
X-List-Received-Date: Sat, 26 Oct 2013 07:53:21 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

As the same reason to powerpc64, mips64 also need the flag:

    PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
    prevents 64-bit userland from seeing this definition, instead defaulting
    to u64 == long in userspace.
    Perf want LL64, flag __SANE_USERSPACE_TYPES__ to get int-ll64.h.
    
    Fix the below issue:
    | tests/attr.c:71:4: error: format '%llu' expects argument of type 'long
    long unsigned int', but argument 6 has type '__u64' [-Werror=format=]
    | tests/attr.c:80:7: error: format '%llu' expects argument of type 'long
    long unsigned int', but argument 4 has type '__u64' [-Werror=format=]
    |        attr->type, attr->config, fd) < 0) {
    |        ^


The following changes since commit 754e8768b69acba89bd6c3ba5dbe55b9df4d8083:

  base.bbclass: fix nondeterministic PACKAGECONFIG processing order (2013-10-24 08:38:27 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/perf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/perf

Wenzong Fan (1):
  perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for mips64

 meta/recipes-kernel/perf/perf.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.7.9.5


