Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1Tdb5i-0007ZG-IS
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 07:25:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAS6BYm3020729
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2012 22:11:34 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 27 Nov 2012 22:11:32 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Nov 2012 14:11:29 +0800
Message-ID: <cover.1354081123.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com, saul.wold@intel.com
Subject: [PATCH 0/2] eglibc: move the fix code for optimization isssue to .inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 06:25:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

I made a patch against the eglibc_2.16.bb for the optimization issue two weeks ago,
but it's not a version specific issue and we still keep the versions 2.13 and 2.15
(and not having the 2.16 yet), so it would be more appropriate to move the code to
the .inc file. 
And we also want to cherry-pick this commit to our oe-core branch so I revert the
previous one and make a new commit against the .inc file but I'm not sure if it is
proper to do that. Please correct me if it is not, thanks!

* Test info:
1) MACHINE=qemux86-64/qemuppc/qemumips
$ bitbake core-image-sato 
$ bitbake eglibc

2) MACHINE=qemux86-64/qemuppc/qemumips
   DEBUG_OPTIMIZATION = "-O0 -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
   DEBUG_BUILD = "1" or SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
$ bitbake core-image-sato
$ bitbake eglibc

The following changes since commit 764cc1eb3043c84121f597d2271108b91052095e:

  bitbake.conf: Change build output message to list BUILD_SYS, TARGET_SYS and NATIVELSBSTRING (2012-11-27 08:57:39 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_eglibc_1128_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_eglibc_1128_1

Jackie Huang (2):
  Revert "eglibc: always compile with optimization."
  eglibc: always compile with optimization.

 meta/recipes-core/eglibc/eglibc.inc     |   11 +++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb |   11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

-- 
1.7.4



