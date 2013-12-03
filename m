Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEC7C6D840
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 13:47:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB3Dl8as004027
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Dec 2013 05:47:09 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Dec 2013 05:47:08 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Dec 2013 21:46:57 +0800
Message-ID: <cover.1386078157.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH V2 0/2] dhcp-client: fix invoke dhclient-script failed on Read-only file system
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
X-List-Received-Date: Tue, 03 Dec 2013 13:47:12 -0000
Content-Type: text/plain

Change in V2:
* we should *never* check IMAGE_FEATURES in individual recipes.
  Two reasons:
  1) It may cause unnecessary rebuilds.
  2) IMAGE_FEATURES may be set in <image>.bb instead of local.conf.

* The make_resolv_conf function in that script doesn't take into
  consideration the situation in which /etc/resolv.conf is a symlink
  to /var/run/resolv.conf.

The following changes since commit a17ffbdbb7d142a94ef842a32b749b18e2e7f0a1:

  bitbake: hob: fix rotating progress icon animation (2013-12-02 17:51:35 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-dhcpclient
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-dhcpclient

Hongxu Jia (2):
  dhclient-script: let resolv.conf and resolv.conf.dhclient on the same
    direcotry
  dhclient-script: override make_resolv_conf for read-only fs

 meta/recipes-connectivity/dhcp/dhcp.inc            |  7 +-
 ...ript-let-resolv.conf-and-resolv.conf.dhcl.patch | 74 ++++++++++++++++++++++
 .../dhcp/files/readonly-dhclient-enter-hooks       | 31 +++++++++
 3 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch
 create mode 100644 meta/recipes-connectivity/dhcp/files/readonly-dhclient-enter-hooks

-- 
1.8.1.2


