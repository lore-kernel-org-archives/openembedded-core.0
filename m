Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A99A078934
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 03:08:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2D38Wr3006030
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 20:08:32 -0700
Received: from localhost.localdomain (172.25.59.221) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 12 Mar 2018 20:07:52 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Mar 2018 22:08:25 -0500
Message-ID: <1520910506-1642-2-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520910506-1642-1-git-send-email-jason.wessel@windriver.com>
References: <1520910506-1642-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] boost: Fix link problems with caffe and Movidius SDK
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
X-List-Received-Date: Tue, 13 Mar 2018 03:08:31 -0000
Content-Type: text/plain

When using an image built with the Yocto Project which has a compiler
and all the required libraries, projects such as caffe for the
Movidius SDK which use python3 and boost fail to build because they
look for libboost_python.so.  The error that cmake returns doesn't
even point to the fact that this is why the configuration fails.

Example showing the problem with the missing symlink:
================
  git clone https://github.com/weiliu89/caffe.git
  cd caffe
  mkdir build
  cd build
  cmake -DBLAS=Open ..

-- Configuring done
CMake Error at CMakeLists.txt:85 (add_dependencies):
  The dependency target "pycaffe" of target "pytest" does not exist.
================

Conditionally creating the link when building python3 support into
boost is all that is needed.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-support/boost/boost.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 0461ec6..c53edf7 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -195,6 +195,9 @@ do_install() {
 		fi
 	done
 
+	if [ -e ${D}${libdir}/libboost_python3.so ]; then
+		ln -s libboost_python3.so ${D}${libdir}/libboost_python.so
+	fi
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


