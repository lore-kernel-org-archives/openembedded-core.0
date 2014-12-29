Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A54E771449
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 08:16:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBT8G8xr021809
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 29 Dec 2014 00:16:08 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Dec 2014 00:16:07 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <otavio@ossystems.com.br>
Date: Mon, 29 Dec 2014 16:16:05 +0800
Message-ID: <3e218eb0dc610d5b96077fb05b89d52d4e27b9ff.1419840627.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <e9074ded94dbbe718226ad040c289dd608d9606a.1419471695.git.hongxu.jia@windriver.com>
References: <e9074ded94dbbe718226ad040c289dd608d9606a.1419471695.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/4] linux-libc-headers.inc: fix QA package-missing warnings
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
X-List-Received-Date: Mon, 29 Dec 2014 08:16:14 -0000
Content-Type: text/plain

While building linux-libc-headers with QA package-missing checking enabled,
there was warning:
...
QA Issue: package linux-libc-headers not generated, but listed in PACKAGES
...

Only linux-libc-headers-dev was generated, the others are empty, we should
set PACKAGE manually.

We also set linux-libc-headers-dev as linux-libc-headers's provider, so
package management could install linux-libc-headers.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index b18d09f..aaa02b1 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -71,3 +71,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
+PACKAGES = "${PN}-dev"
+RPROVIDES_${PN}-dev = "${PN}"
-- 
1.9.1


