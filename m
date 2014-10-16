Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83C8660DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 07:16:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9G7GZHE027591
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Oct 2014 00:16:35 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 00:16:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 16 Oct 2014 15:16:24 +0800
Message-ID: <cover.1413442931.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1][RFC] multilib.bbclass: fix incorrect TARGET_VENDOR in multilib image
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
X-List-Received-Date: Thu, 16 Oct 2014 07:16:38 -0000
Content-Type: text/plain

While multilib enabled, both of lib32-core-image-minimal and
core-image-minimal's WORKDIR located in the same dir.
$ ls tmp/work/qemux86_64-poky-linux/ -al
...
drwxrwxr-x  3 jiahongxu jiahongxu 4096 Oct 13 16:01 core-image-minimal
drwxrwxr-x  3 jiahongxu jiahongxu 4096 Oct 16 11:11 lib32-core-image-minimal
...

The reason is variable TARGET_VENDOR was not override for multilib
in that situation.

Is it necessary to do the multilib expansion on TARGET_VENDOR ? (See
the following patch)

It affected many other variables, such as:
"HOST_VENDOR, STAGING_BINDIR_TOOLCHAIN, TARGET_SYS, MULTIMACH_TARGET_SYS,
REAL_MULTIMACH_TARGET_SYS, SSTATE_PKGSPEC"

If we do the modification, there may be potential issues which were
caused by the above variables.

Any suggestions is welcomed.

//Hongxu

The following changes since commit ccf5a4d2342c4fd40e4e0b332ea7e34e0bf175d4:

  build-appliance-image: Update to dizzy head revision (2014-10-11 08:11:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-ml-rfc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-ml-rfc

Hongxu Jia (1):
  multilib.bbclass: fix incorrect TARGET_VENDOR in multilib image

 meta/classes/multilib.bbclass | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.1


