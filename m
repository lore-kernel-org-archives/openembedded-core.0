Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 979A1794BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 09:02:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9G90b4j024036
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Oct 2018 02:01:36 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 16 Oct 2018 02:00:54 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<randy.macleod@windriver.com>, <richard.purdie@linuxfoundation.org>
Date: Tue, 16 Oct 2018 02:00:54 -0700
Message-ID: <20181016090054.122374-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] boost.inc: make libboost_python3.so available
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
X-List-Received-Date: Tue, 16 Oct 2018 09:02:28 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Currently boost provides ${libdir}/libboost_python35.so,
but there is some logic as below in CMakeLists.txt
of package cv-bridge under meta-ros layer.
[snip]
if(PYTHONLIBS_VERSION_STRING VERSION_LESS 3)
    find_package(Boost REQUIRED python)
else()
    find_package(Boost REQUIRED python3)
endif()
[snip]

And comes below do_configure error for cv-bridge:
meta-ros/recipes-ros/vision-opencv/cv-bridge_1.11.16.bb:do_configure
| CMake Error at $Prj/cv-bridge/1.11.16-r0/recipe-sysroot-native/usr/share/cmake-3.12/Modules/FindBoost.cmake:2048 (message):
|   Unable to find the requested Boost libraries.
|
|   Boost version: 1.68.0
|
|   Boost include path:
|   $Prj/cv-bridge/1.11.16-r0/recipe-sysroot/usr/include
|
|
|   Could not find the following Boost libraries:
|
|           boost_python3
|
|   No Boost libraries were found.  You may need to set BOOST_LIBRARYDIR to the
|   directory containing Boost libraries or BOOST_ROOT to the location of
|   Boost.
| Call Stack (most recent call first):
|   CMakeLists.txt:11 (find_package)

Can update CMakeLists.txt of cv-bridge as below
to remove the configure error:
 - find_package(Boost REQUIRED python3)
 + find_package(Boost REQUIRED python35)

But once the python version changes such as
python37, it fails again. So make boost provides
libboost_python3.so to make the fix flexibly.

[YOCTO #12833]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/boost/boost.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index c4faea211f0..98f0b71d73a 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -198,6 +198,10 @@ do_install() {
 			ln -s libboost_${lib}.so ${D}${libdir}/libboost_${lib}-mt.so
 		fi
 	done
+	if [ -e ${D}${libdir}/libboost_python3[0-9].so ] && [ ! -e ${D}${libdir}/libboost_python3.so ]; then
+		lib_python3_so=$(basename `ls ${D}${libdir}/libboost_python3[0-9].so`)
+		ln -s ${lib_python3_so} ${D}${libdir}/libboost_python3.so
+	fi
 
 }
 
-- 
2.17.1


