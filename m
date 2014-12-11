Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4709D65D3B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 10:27:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBBARcpq005818
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 11 Dec 2014 02:27:38 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 11 Dec 2014 02:27:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<paul.eggleton@linux.intel.com>
Date: Thu, 11 Dec 2014 18:27:24 +0800
Message-ID: <e63d787e45d4468e08859b3922d14a882725d613.1418293391.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418293391.git.hongxu.jia@windriver.com>
References: <cover.1418293391.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] linux-libc-headers.inc: fix QA package-missing warnings
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
X-List-Received-Date: Thu, 11 Dec 2014 10:27:38 -0000
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
index b18d09f..a69bbe6 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -71,3 +71,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
+PACKAGES="${PN}-dev"
+RPROVIDES_${PN}-dev = "${PN}"
-- 
1.9.1


