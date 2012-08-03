Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1Sx8mU-000324-7s
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 05:42:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q733UmNK016362
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 20:30:48 -0700 (PDT)
Received: from usp-ub1204-64.corp.ad.wrs.com (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 2 Aug 2012 20:30:48 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Aug 2012 11:30:20 +0800
Message-ID: <cover.1343964466.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] gdk-pixbuf: fix parallel install issue
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
X-List-Received-Date: Fri, 03 Aug 2012 03:42:30 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This patch fixes parallel install issue that lib libpixbufloader-png.la
depends on libgdk_pixbuf-2.0.la which will be regenerated during insta-
llation, if libgdk_pixbuf-2.0.la is regenerating and at the same time
libpixbufloader-png.la links it, the error will happen.
    
Error message is:
* usr/bin/ld: cannot find -lgdk_pixbuf-2.0
* collect2: ld returned 1 exit status
    
Make an explicit dependency to the libs install targets would fix this
issue.
    
[YOCTO #2883]

The following changes since commit 85c005d71c30bc5de61f9a9eb9818f37183af54b:

  tzdata: Upgrade tzdata to upstream 2012d (2012-08-02 23:21:12 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/2883
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/2883

Wenzong Fan (1):
  gdk-pixbuf: fix parallel install issue

 .../extending-libinstall-dependencies.patch        |   42 ++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/extending-libinstall-dependencies.patch

-- 
1.7.9.5



