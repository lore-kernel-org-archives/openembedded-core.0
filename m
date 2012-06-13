Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Sej4k-0005ct-R1
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 10:37:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5D8QcaK022671
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 01:26:38 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 13 Jun 2012 01:26:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jun 2012 16:27:46 +0800
Message-ID: <383a2fd8ee2090cddea30dc5a825d3983780298b.1339568577.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1339568577.git.liezhi.yang@windriver.com>
References: <cover.1339568577.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] gcc-cross: argument list too long when do_install
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
X-List-Received-Date: Wed, 13 Jun 2012 08:37:15 -0000
Content-Type: text/plain

There would be an "Argument list too long" error when the length of
tmpdir is longer than 190, this is caused by:

headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`

The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
it, use the $(sort list) of GNU make which can handle the too long list
would fix the problem, the header would be short enough after sorted.
The "tr ' ' '\012'" was used for translating the space to "\n", the
$(sort list) doesn't need this.

This doesn't impact the output, so it doesn't need the PR bump.

[YOCTO #2591]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 45828bb..c3b79ab 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -102,6 +102,10 @@ do_headerfix () {
 	#
 	sed -i ${S}/gcc/config/*/linux*.h -e \
 		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\) \( *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_DIR "\3#'
+
+	# Fix the "Argument list too long" error
+	sed -i ${S}/gcc/Makefile.in -e \
+		's#headers=`echo $(PLUGIN_HEADERS) | tr .*012.* | sort -u`#headers=\"$(sort $(PLUGIN_HEADERS))\"#'
 }
 
 addtask headerfix after do_unpack before do_patch
-- 
1.7.1



