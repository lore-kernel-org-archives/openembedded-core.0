Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E491738B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 09:23:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t249NTOc008548
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Mar 2015 01:23:29 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 01:23:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2015 01:23:28 -0800
Message-ID: <ab080f058a65abb743f6a87048d9ecb418f5b158.1425460972.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425460972.git.liezhi.yang@windriver.com>
References: <cover.1425460972.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bash 3.2.48: disable parallel build
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
X-List-Received-Date: Wed, 04 Mar 2015 09:23:29 -0000
Content-Type: text/plain

It's Makefile has the two rules:
$(BUILTINS_LIBRARY): $(BUILTIN_DEFS) $(BUILTIN_C_SRC) config.h ${BASHINCDIR}/memalloc.h version.h
    @(cd $(DEFDIR) && $(MAKE) $(MFLAGS) DEBUG=${DEBUG} libbuiltins.a ) || exit 1

${DEFDIR}/builtext.h: $(BUILTIN_DEFS)
    @(cd $(DEFDIR) && $(MAKE) $(MFLAGS) builtext.h ) || exit 1

which causes parallel issues:
mkbuiltins.o: file not recognized: File truncated
collect2: ld returned 1 exit status

I don't have any good ideas to fix the problem, so disable parallel
build for it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/bash/bash_3.2.48.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 35e624b..34272d1 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -41,3 +41,5 @@ SRC_URI[patch056.md5sum] = "222eaa3a2c26f54a15aa5e08817a534a"
 SRC_URI[patch056.sha256sum] = "063a8d8d74e4407bf07a32b965b8ef6d213a66abdb6af26cc3584a437a56bbb4"
 SRC_URI[patch057.md5sum] = "47d98e3e042892495c5efe54ec6e5913"
 SRC_URI[patch057.sha256sum] = "5fc689394d515990f5ea74e2df765fc6e5e42ca44b4591b2c6f9be4b0cadf0f0"
+
+PARALLEL_MAKE = ""
-- 
1.7.9.5


