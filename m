Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0A026FC54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 07:23:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8I7Njjp021170
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 00:23:45 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 00:23:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 18 Sep 2014 15:23:40 +0800
Message-ID: <cover.1411023982.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 0/3] sstatesig: add support to dump incremental locked signatures
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
X-List-Received-Date: Thu, 18 Sep 2014 07:23:49 -0000
Content-Type: text/plain

How to test incrementally locked signature dump:

1) Create a new build

2) Dump locked sig file for db
$ bitbake -S none db
...
Writing locked sigs to /home/jiahongxu/yocto/build-20140904-yocto/locked-sigs.inc
NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be rerun and all succeeded.
...

3) Back up locked-sigs.inc
$ cp locked-sigs.inc locked-sigs.inc.bak

4) Dump locked sig file for db again
$ bitbake -S none db
...
Writing locked sigs to /home/jiahongxu/yocto/build-20140904-yocto/locked-sigs.inc
NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be rerun and all succeeded.
...

5) Compare locked-sigs.inc and locked-sigs.inc.bak to verify nothing changed
$ vimdiff locked-sigs.inc locked-sigs.inc.bak

6) Require locked-sigs.inc
vim local.conf
...
require "${TOPDIR}/locked-sigs.inc"
...

7) Incrementally dump locked sig file for world
$ bitbake -S none world
...
Writing locked sigs to /home/jiahongxu/yocto/build-20140904-yocto/locked-sigs.inc
NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be rerun and all succeeded.
...

8) Compare locked-sigs.inc and locked-sigs.inc.bak to verify incrementally dumping
$ vimdiff locked-sigs.inc locked-sigs.inc.bak

9) Back up locked-sigs.inc
$ cp locked-sigs.inc locked-sigs.inc.bak

10) Dump for world again
$ bitbake -S none world
...
Writing locked sigs to /home/jiahongxu/yocto/build-20140904-yocto/locked-sigs.inc
Nothing added to /home/jiahongxu/yocto/build-20140904-yocto/locked-sigs.inc
NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be rerun and all succeeded.
...

11) Compare locked-sigs.inc and locked-sigs.inc.bak to verify nothing changed
$ vimdiff locked-sigs.inc locked-sigs.inc.bak

//Hongxu

The following changes since commit 280b6d0011f101e7a8edabd34c265b37a2f791ed:

  sstatesig: fix overrides behaviour to remove SIGGEN_LOCKEDSIGS_i586 (2014-09-17 22:00:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/locked-sstate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/locked-sstate

Hongxu Jia (3):
  sstatesig: Only dump incremental locked signatures
  sstatesig: add new item checking for locked signature dump
  sstatesig: fix to support unincremental locked signature dump

 meta/lib/oe/sstatesig.py | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

-- 
1.9.1


