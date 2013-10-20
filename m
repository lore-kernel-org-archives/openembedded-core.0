Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8432C6D1C4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 10:48:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9KAmd5e005799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 03:48:39 -0700 (PDT)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Sun, 20 Oct 2013 03:48:39 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Oct 2013 18:48:30 +0800
Message-ID: <1382266112-24559-2-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1382266112-24559-1-git-send-email-ming.liu@windriver.com>
References: <1382266112-24559-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] bzip2: replace += with _append for appending to OVERRIDES variables
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
X-List-Received-Date: Sun, 20 Oct 2013 10:48:37 -0000
Content-Type: text/plain

In some cases, it's unfit to use "+=" in a conditional appending, we would
end up with the variable being set rather than being appended, which is not
it mean to.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 4189f78..c7c5d68 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -26,7 +26,7 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "bunzip2 bzcat"
 
 #install binaries to bzip2-native under sysroot for replacement-native
-EXTRA_OECONF_class-native += "--bindir=${STAGING_BINDIR_NATIVE}/${PN}"
+EXTRA_OECONF_append_class-native = " --bindir=${STAGING_BINDIR_NATIVE}/${PN}"
 do_configure_prepend () {
 	cp ${WORKDIR}/configure.ac ${S}/
 	cp ${WORKDIR}/Makefile.am ${S}/
-- 
1.8.4.1


