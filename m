Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E14A6C66B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:21:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAN2KQDi015496
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 18:20:56 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 18:20:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 10:37:55 +0800
Message-ID: <cover.1542940552.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2 0/2] Improve performance for native/cross/crosssdk's cleansstate
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
X-List-Received-Date: Fri, 23 Nov 2018 02:21:05 -0000
Content-Type: text/plain

* V2
  - Teach sstate.bbclass rather than edit nopackages.bbclass to fix the problem.

* V1
These 2 patches can improve performance a lot for native/cross/crosssdk's
cleansstate:

This test is based on more than 600,000 sstate files
* Without disk caches
  # echo 3 >/proc/sys/vm/drop_caches
  $ bitbake -p
  $ time bitbake quilt-native -ccleansstate
  - Before:
    real    4m53.815s
    user    0m0.820s
    sys     0m0.128s

  - After
    real    0m58.483s
    user    0m0.744s
    sys     0m0.108s

  Saved 293 - 58 = 235s (80% improvement)

* With disk caches (26.6s -> 5.8s, 78% improvement)
  $ bitbake -p
  $ time bitbake quilt-native -ccleansstate
  - Before:
    real    0m26.682s
    user    0m0.748s
    sys     0m0.088s

  - After
    real    0m5.846s
    user    0m0.716s
    sys     0m0.116s

  Saved 26.6 - 5.8  = 20.8s (78% improvement)

======
I have another idea is put sstate files into the directory
named by the recipe, e.g.:

sstate-cache/quilt-native/sstate:quilt-native::0.65:r0::3:773341447192feb6c1519cace0e6be35_populate_lic.tgz
sstate-cache/quilt-native/sstate:quilt-native::0.65:r0::3:773341447192feb6c1519cace0e6be35_populate_lic.tgz.siginfo
sstate-cache/quilt-native/sstate:quilt-native::0.65:r0::3:ab4a82a07b10926bb42d2f37242413c7_patch.tgz.siginfo
sstate-cache/quilt-native/sstate:quilt-native::0.65:r0::3:e8a4c952a66942653e36f289eaf68ca5_fetch.tgz.siginfo
sstate-cache/quilt-native/sstate:quilt-native::0.65:r0::3:fd35240c437cefa66e24cfe65d3fb335_unpack.tgz.siginfo

This can make it easier to manage sstate files, and can reduce the load of
glob.glob(), currently, the remove command is something like:

$ rm -f glob.glob(sstate-cache/*/sstate:foo.*bar.*)

If we put them into recipe named directory, then we can run:

$ rm -f glob.glob(sstate-cache/<recipe>/sstate:foo.*bar.*)

Which should be faster, what's your opinion, please ?


The following changes since commit fc5418e7bbdecfb27bafe595084e0fd0f991a388:

  meta/icecc.bbclass: Update system blacklists (2018-11-21 11:48:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sstate
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/sstate

Robert Yang (2):
  sstate.bbclass: Only remove sstate file when task is existed
  sstate.bbclass: set SSTATE_EXTRAPATHWILDCARD explicitly

 meta/classes/sstate.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.7.4


