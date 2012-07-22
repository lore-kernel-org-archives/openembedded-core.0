Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1Ssv1w-0000lE-AR
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 14:13:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6MC1X1k008083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 05:01:33 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 22 Jul 2012 05:01:32 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 20:01:25 +0800
Message-ID: <cover.1342958140.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] useradd.bbclass: use locking of bb.utils to avoid lock race issue of useradd/groupadd
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
X-List-Received-Date: Sun, 22 Jul 2012 12:13:00 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

A race condition can occur when adding users and groups to the
passwd and group files, in [YOCTO #1794], 10 times retry added
but it is not fixed completely.

This fix re-writes the useradd_preinst and useradd_sysroot with
python and use locking of bb.utils to lock the passwd and group
files before executing useradd/groupadd commands to avoid the
lock race themselves.

[YOCTO #2779]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
The following changes since commit 1eae5b6c87cd4f825dba9d2526b34231d33b1e92:

  python-native: Use append instead of += so the lsb override for EXTRA_OECONF works as expected (2012-07-22 12:07:53 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/yocto_2779_groupadd_0722_v2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/yocto_2779_groupadd_0722_v2

Jackie Huang (1):
  useradd.bbclass: use locking of bb.utils to avoid lock race issue of
    useradd/groupadd

 meta/classes/useradd.bbclass |  200 +++++++++++++++++------------------------
 1 files changed, 83 insertions(+), 117 deletions(-)

-- 
1.7.4



