Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CA39A606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 13:51:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3PDphQF009492
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 06:51:44 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Apr 2016 06:51:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2016 06:51:37 -0700
Message-ID: <cover.1461592183.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/6] insane.bbclass: package_qa_check_license -> do_qa_populate_lic
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
X-List-Received-Date: Mon, 25 Apr 2016 13:51:45 -0000
Content-Type: text/plain

The package_qa_check_license() was in do_qa_configure which had a
potential problem, when the recipe sets do_configure[noexec] = "1", then
the license checking won't run, which may hidden license issues. Rename
it to do_qa_populate_lic() and run in do_populate_lic[postfuncs] which
is more reasonable (when no populate license, no license checking).

// Robert

The following changes since commit e2dbe5eb869b8336b91023b83d7ca866197efa73:

  license.bbclass: make sure that image manifest dir exists (2016-04-22 16:28:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/lic
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/lic

Robert Yang (6):
  insane.bbclass: remove workdir from package_qa_check_license()
  insane.bbclass: package_qa_check_license -> do_qa_populate_lic
  packagegroup.bbclass: set LICENSE and LIC_FILES_CHKSUM
  packagegroup-foo.bb: remove LICENSE = "MIT"
  meta-world-pkgdata: add LIC_FILES_CHKSUM
  libxsettings-client: fix LICENSE

 meta/classes/insane.bbclass                        | 15 ++++++---------
 meta/classes/packagegroup.bbclass                  |  5 +++++
 meta/conf/bitbake.conf                             |  2 +-
 meta/recipes-core/meta/meta-world-pkgdata.bb       |  2 ++
 .../packagegroups/packagegroup-base.bb             |  1 -
 .../packagegroups/packagegroup-core-boot.bb        |  1 -
 .../packagegroup-core-buildessential.bb            |  1 -
 .../packagegroup-core-eclipse-debug.bb             |  1 -
 .../packagegroups/packagegroup-core-nfs.bb         |  1 -
 .../packagegroups/packagegroup-core-sdk.bb         |  1 -
 .../packagegroup-core-ssh-dropbear.bb              |  1 -
 .../packagegroups/packagegroup-core-ssh-openssh.bb |  1 -
 .../packagegroup-core-standalone-sdk-target.bb     |  1 -
 .../packagegroups/packagegroup-core-tools-debug.bb |  1 -
 .../packagegroup-core-tools-profile.bb             |  1 -
 .../packagegroup-core-tools-testapps.bb            |  1 -
 .../packagegroups/packagegroup-cross-canadian.bb   |  1 -
 .../packagegroups/packagegroup-self-hosted.bb      |  1 -
 .../packagegroup-core-device-devel.bb              |  1 -
 .../packagegroup-core-full-cmdline.bb              |  1 -
 .../packagegroups/packagegroup-core-lsb.bb         |  1 -
 .../libxsettings-client/MIT-style-license          | 22 ----------------------
 .../libxsettings-client_0.10.bb                    | 13 ++-----------
 .../packagegroups/packagegroup-core-clutter.bb     |  1 -
 .../packagegroups/packagegroup-core-directfb.bb    |  1 -
 .../packagegroups/packagegroup-core-x11-base.bb    |  1 -
 .../packagegroups/packagegroup-core-x11-xserver.bb |  1 -
 .../packagegroups/packagegroup-core-x11.bb         |  1 -
 .../packagegroups/packagegroup-core-x11-sato.bb    |  1 -
 29 files changed, 16 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client/MIT-style-license

-- 
2.7.4


