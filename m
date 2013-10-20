Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30B156D183
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 10:48:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9KAmgKB005802
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 03:48:42 -0700 (PDT)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Sun, 20 Oct 2013 03:48:41 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Oct 2013 18:48:31 +0800
Message-ID: <1382266112-24559-3-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1382266112-24559-1-git-send-email-ming.liu@windriver.com>
References: <1382266112-24559-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] strace: replace += with _append for appending to OVERRIDES variables
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
X-List-Received-Date: Sun, 20 Oct 2013 10:48:40 -0000
Content-Type: text/plain

In some cases, it's unfit to use "+=" in a conditional appending, we would
end up with the variable being set rather than being appended, which is not
it mean to.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-devtools/strace/strace_4.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
index 79a4ad7..aad53b7 100644
--- a/meta/recipes-devtools/strace/strace_4.8.bb
+++ b/meta/recipes-devtools/strace/strace_4.8.bb
@@ -19,7 +19,7 @@ inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
 
 PACKAGECONFIG_class-target ?= "libaio"
-PACKAGECONFIG_class-target += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+PACKAGECONFIG_append_class-target = " ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
 
 PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
-- 
1.8.4.1


