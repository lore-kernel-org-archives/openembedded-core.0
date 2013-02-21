Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U8aNp-000611-9z
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 18:56:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1LHeOke004577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 09:40:24 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 21 Feb 2013 09:40:23 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Feb 2013 11:40:21 -0600
Message-ID: <cover.1361468282.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] MIPS n32 shouldn't have SITEINFO_BITS = "64"
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
X-List-Received-Date: Thu, 21 Feb 2013 17:56:43 -0000
Content-Type: text/plain

MIPS n32 is a mips64 which is 32 bit. This historical quirk is recognized
by insane.bbclass (except for a typo I made in a previous patch, also
fixed here), but siteinfo doesn't know, so various programs fail to build
correctly for it because SITEINFO_BITS is telling them they are 64-bit
builds. (We ran into this with nss, which isn't in oe-core that I know
of.)

So, add "bit-32" to mips-linux-gnun32's feature list (the SITEINFO_BITS
test checks for 32 first, 64 second, so I don't have to remove bit-64),
and remove the nonexistent mips-linux-gnun32 cases. Likewise for
mipsel/mips64el.

The following changes since commit a5362de60c0051f16b88a40bd9cb41915bee0b0f:
  Ross Burton (1):
        rootfs_ipkg: fix BAD_RECOMMENDATIONS handling

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/gnun32
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/gnun32

Peter Seebach (1):
  More n32 fixups

 meta/classes/insane.bbclass   |    2 +-
 meta/classes/siteinfo.bbclass |    6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)



