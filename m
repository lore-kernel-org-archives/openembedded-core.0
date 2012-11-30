Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TeHBT-00060U-I7
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 04:22:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAU38I94015985
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 19:08:18 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 29 Nov 2012 19:08:18 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2012 11:08:41 +0800
Message-ID: <cover.1354084523.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/3] Make poky work correctly with long TMPDIR
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
X-List-Received-Date: Fri, 30 Nov 2012 03:22:38 -0000
X-List-Received-Date: Fri, 30 Nov 2012 03:22:38 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Poky had a problem with long TMPDIR. 
If the TMPDIR had a length of 410 chars, for example, the world building
would fail for three reasons.
1) autotools.bbclass: With long TMPDIR, aclocal would have a very long argument
   list whick makes building some packages (coretuils for example) fail.
2) qt4-native: It hardcodes some static char arrays to be 256.
3) ghostscript: It configures its MAX_TOKEN to be 256.

This series of patches are aimed at making poky building system working correctly with long TMPDIR.
The three patches solve the three above problems respectively.

The following changes since commit 0d7d413d64bab8d3c758414c6c8c653ccc325653:

  build-appliance-image: Update to dee77eca39f406f90e60d9c5ef7a66fcc8f57dbf commit (2012-11-21 20:40:43 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/autotools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/autotools

Chen Qi (3):
  autotools.bbclass: use relative path for acpaths whenever possible
  qt4-native: make qt4-native work with long building path
  ghostscript: make ghostscript work with long building path

 meta/classes/autotools.bbclass                     |   14 ++--
 ...tscript-work-with-long-building-directory.patch |   19 +++++
 .../ghostscript/ghostscript_9.05.bb                |   10 +--
 ...e-qt4-native-work-with-long-building-path.patch |   82 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-native.inc                 |    3 +-
 5 files changed, 116 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch

-- 
1.7.9.5



