Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B68B6CFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 20:13:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9LKDCQT025971
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 13:13:12 -0700 (PDT)
Received: from yow-kscherer-l1.wrs.com (128.224.147.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 21 Oct 2013 13:13:12 -0700
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2013 16:13:11 -0400
Message-ID: <1382386391-22092-2-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1382386391-22092-1-git-send-email-konrad.scherer@windriver.com>
References: <1382386391-22092-1-git-send-email-konrad.scherer@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] pigz: Add pigz to buildtools tarball
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
X-List-Received-Date: Mon, 21 Oct 2013 20:13:13 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

When using the tar executable in the buildtools, tar will execute
gzip. If this happens before zlib-native is built, then the gzip
on the host will be used and can fail if the libz in the buildtools
is not compatible. Adding pigz to the build tools avoids this host
contamination.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb |    1 +
 meta/recipes-extended/pigz/pigz_2.3.bb       |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 54fba11..9dabbd0 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -39,6 +39,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-chrpath \
     nativesdk-tar \
     nativesdk-git \
+    nativesdk-pigz \
     nativesdk-make \
     "
 
diff --git a/meta/recipes-extended/pigz/pigz_2.3.bb b/meta/recipes-extended/pigz/pigz_2.3.bb
index 724d00b..bf8dd95 100644
--- a/meta/recipes-extended/pigz/pigz_2.3.bb
+++ b/meta/recipes-extended/pigz/pigz_2.3.bb
@@ -6,5 +6,5 @@ SRC_URI[sha256sum] = "74bbd5962f9420549fc987ddd1ccda692ec2b29d2d612fbbe26edf3fa3
 
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.1


