Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62FB2731EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 08:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBM8hoU8008094
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Dec 2015 00:43:50 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 22 Dec 2015 00:43:49 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>, 
	<ross.burton@intel.com>, <jackie.huang@windriver.com>,
	<mark.hatle@windriver.com>, <liezhi.yang@windriver.com>
Date: Tue, 22 Dec 2015 16:43:18 +0800
Message-ID: <cover.1450772654.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3][RFC] fix confliction between connman and networkmanager
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
X-List-Received-Date: Tue, 22 Dec 2015 08:43:53 -0000
Content-Type: text/plain

Provide two solutions for discussion.

SOLUTION 1: add virtual/netmanager to RPROVIDES and choose connman or
            networkmanager by override PREFERRED_PROVIDER_virtual/netmanager;

SOLUTION 2: add variable NETWORK_MANAGER to RDEPENDS, and select connman or
            networkmanager by override NETWORK_MANAGER.

SOLUTION 3: for networkmanager, directly remove RCONFLICTS_${PN} = "connman".
            The networkmanager and connman are not file confliction, they
            just provide the same function. Install both of them is ok.
            https://wiki.ubuntu.com/DesktopTeam/ConnectionManagerComparison 

If one of them is accepted, we also need to modify networkmanager in
meta-oe and related recipes/layers(such as meta-xfce).

//Hongxu

The following changes since commit 0381b78aa4dfc0d338fba69502e8f03a0c0f21e7:

  bitbake: event/utils/methodpool: Add a cache of compiled code objects (2015-12-22 00:02:05 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/netmanager-confliction
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/netmanager-confliction

Hongxu Jia (3):
  connman.inc: add missing RDEPENDS
  connman.inc: add networkmanager to RCONFLICTS
  add virtual/netmanager to fix confliction between connman and
    networkmanager

 meta/conf/bitbake.conf                                        | 2 ++
 meta/recipes-connectivity/connman/connman.inc                 | 9 ++++++++-
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb   | 3 +--
 meta/recipes-extended/images/core-image-kernel-dev.bb         | 2 +-
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 2 +-
 5 files changed, 13 insertions(+), 5 deletions(-)

-- 
1.9.1


