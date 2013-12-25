Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A2A3860D71
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Dec 2013 08:36:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBP8a1xg015918
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Dec 2013 00:36:02 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 25 Dec 2013 00:36:02 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Dec 2013 16:36:00 +0800
Message-ID: <cover.1387959755.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Split the functions script into a separate package in initscripts
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
X-List-Received-Date: Wed, 25 Dec 2013 08:36:01 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This is part of the systemd integration work.

Now we have two init systems in our project -- SysV and systemd.
If we are only using the SysV based systems, everything's happy because the initscripts
package will and should be always installed. As a part of the package, the /etc/init.d/functions
script is always available. And other init scripts which source this script don't have any problem.
Things are different when we are using systemd based systems. Basically the initscripts
package is useless in systemd based images and should not be installed. We can do this
by setting VIRTUAL-RUNTIME_initscripts to "". This leads to the problem that some services
failing to start because of lack of the /etc/init.d/functions script. An example is the distcc.

The above situation leads to a natural solution of splitting the functions script into a
separate package, say, initscripts-functions. As the /etc/init.d/functions script is useful
for both SysV and systemd systems, this patch also adds it to the RDEPENDS of packagegroup-core-boot.

//Chen Qi


The following changes since commit 005af45191ded6185c618c708181b31281e43092:

  bitbake: fetch2: avoid printing "no checksum" error message twice (2013-12-22 14:29:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/initscripts-functions
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/initscripts-functions

Chen Qi (2):
  initscripts: split the functions script into a separate package
  packagegroup-core-boot: make initscripts-functions a basic element of
    RDEPENDS

 meta/recipes-core/initscripts/initscripts_1.0.bb   |    8 ++++++--
 .../packagegroups/packagegroup-core-boot.bb        |    1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.7.9.5


