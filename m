Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TDv00-0006Lb-Se
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 12:25:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8IAD7uT008893
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 03:13:07 -0700 (PDT)
Received: from fc17-64.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 18 Sep 2012 03:13:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2012 18:18:31 +0800
Message-ID: <0c67727e1f680f450680af0cad3dca4b8a295998.1347950270.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1347950270.git.liezhi.yang@windriver.com>
References: <cover.1347950270.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] rpm 5.4.9: DEPENDS on bison-native
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
X-List-Received-Date: Tue, 18 Sep 2012 10:25:49 -0000
Content-Type: text/plain

The rpm should depend on bison-native, otherwise errors when "bitbake
rpm-native" in a fresh build:

| make[4]: Entering directory `/path/to/rpm-native-5.4.9-r46/rpm-5.4.9/syck/lib'
| bison -d -t -v -p syck -o gram.c gram.y
| make[4]: bison: Command not found

Basically, both the rpm-native and rpm should depend on bison-native,
but don't need depend on bison, but it seems that it isn't necessary
to add another depend line:

DEPENDS_virtclass-native = "libpcre-native ... bison-native"

So just add it to the DEPENDS.

[YOCTO #3123]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index e276cc3..ee0e86f 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -42,8 +42,8 @@ HOMEPAGE = "http://rpm5.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-DEPENDS = "libpcre attr acl popt ossp-uuid file"
-PR = "r46"
+DEPENDS = "libpcre attr acl popt ossp-uuid file bison"
+PR = "r47"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
-- 
1.7.11.2



