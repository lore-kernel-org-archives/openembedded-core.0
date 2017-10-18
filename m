Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 679D960762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 08:17:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9I8HPY9025985
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 01:17:25 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 18 Oct 2017 01:17:23 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Oct 2017 16:02:04 +0800
Message-ID: <20171018080205.9834-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Don't extend package name if extended already for multilib
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
X-List-Received-Date: Wed, 18 Oct 2017 08:17:24 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

This patch is for mips64 which could set for 2 kinds of multilbs:

MULTILIBS ?= "multilib:lib32 multilib:libn32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"

Tested on Yocto with sample config for qemux86-64:
1 set MACHINE and multilibs in local.conf

===============================================
MACHINE = "qemux86-64"

require conf/multilib.conf
MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64"
===============================================

2 bitbake lib32-meta-ide-support core-image-sato

No such error shows:
ERROR: Nothing PROVIDES 'virtual/lib32-libn32-libc'.


Kai Kang (1):
  toolchain-scripts.bbclass: do not extend dependency if extended
    already

 meta/classes/toolchain-scripts.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--
2.14.1


