Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T8j7x-0007kJ-Gz
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 04:44:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q842W9B7000856
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Sep 2012 19:32:10 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Mon, 3 Sep 2012 19:32:09 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 4 Sep 2012 10:32:16 +0800
Message-ID: <9db4baaea1e4a6e07152da598ba6dffcf8e6d637.1346666634.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346666634.git.kai.kang@windriver.com>
References: <cover.1346666634.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] wget: disable iri/idn support
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
X-List-Received-Date: Tue, 04 Sep 2012 02:44:33 -0000
Content-Type: text/plain

There is a build issue with wget idn support. When libidn has been
populated to sysroot but rpm packages are not created, wget checks libidn
support automatically and then depends on libidn. But package libidn
doesn't exist, build image which includes wget will fail with:
| error: Failed dependencies:
|   libidn.so.11 is needed by wget-1.13.4-r14.3.core2
|   libidn.so.11(LIBIDN_1.0) is needed by wget-1.13.4-r14.3.core2

Disable iri/idn support to fix it.

Signer-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/wget/wget.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 3575c87..2787068 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -4,11 +4,12 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "openssl"
 
-INC_PR = "r15"
+INC_PR = "r16"
 
 inherit autotools gettext update-alternatives
 
-EXTRA_OECONF = "--with-libc --enable-ipv6 --with-libssl-prefix=${STAGING_DIR_HOST} --with-ssl=openssl --disable-rpath"
+EXTRA_OECONF = "--with-libc --enable-ipv6 --with-libssl-prefix=${STAGING_DIR_HOST} \
+                --with-ssl=openssl --disable-rpath --disable-iri"
 
 ALTERNATIVE_${PN} = "wget"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.5.4



