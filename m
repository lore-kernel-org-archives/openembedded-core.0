Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32C046B0D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 06:27:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6G6RJBZ020337
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 23:27:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 15 Jul 2013 23:27:19 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jul 2013 14:27:25 +0800
Message-ID: <cover.1373953711.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V5 0/3] Add a method for image level user/group configuration
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
X-List-Received-Date: Tue, 16 Jul 2013 06:27:19 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Changes from V4:
1. Take into consideration the possibility of whitespaces in /etc/passwd and /etc/group
2. Change bbfatal in perform_usermod and perform_groupmod to bbwarn. Please see detailed reason below.

PackageA pulls in userA.
Now we want userA to map to a fixed user ID without having to worry whether PackageA is installed.
We can now use the following configuration to achieve this requirement.
EXTRA_USERS_PARAMS += "
usermod, -u 2013 userA; \
"
After this configuration, if PacakgeA is installed in our image, the user ID is modified to 2013;
otherwise, there's no change in /etc/passwd, i.e., userA will not be added to /etc/passwd silently.

Hope this information will be useful.

//Chen Qi


The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:

  meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/extrausers
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/extrausers

Chen Qi (3):
  useradd_base.bbclass: add a new bbclass
  useradd.bbclass: code refactor
  extrausers.bbclass: add a new bbclass

 meta/classes/extrausers.bbclass   |   61 ++++++++++
 meta/classes/useradd.bbclass      |   99 ++--------------
 meta/classes/useradd_base.bbclass |  230 +++++++++++++++++++++++++++++++++++++
 3 files changed, 299 insertions(+), 91 deletions(-)
 create mode 100644 meta/classes/extrausers.bbclass
 create mode 100644 meta/classes/useradd_base.bbclass

-- 
1.7.9.5


