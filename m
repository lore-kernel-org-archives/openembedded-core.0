Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A014773177
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 08:19:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2S8JnYB007021
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Mar 2016 01:19:49 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 01:19:48 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<mark.hatle@windriver.com>
Date: Mon, 28 Mar 2016 04:19:01 -0400
Message-ID: <164f4ee8121e48f14c463406c6b686d8ed4b6ad6.1459147231.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1459147231.git.hongxu.jia@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/17] ifupdown: fix do_compile failed while GCCVERSION = "4.9%"
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
X-List-Received-Date: Mon, 28 Mar 2016 08:19:49 -0000
Content-Type: text/plain

In repo https://anonscm.debian.org/git/collab-maint/ifupdown.git
...
commit 4bfa7e5ae6175469d1049b6ace86c259814add16
Author: Guus Sliepen <guus@debian.org>
Date:   Wed Jun 3 12:43:59 2015 +0200

    Compile with -std=c99.

    This prepares for the use of C99 features in the source code. With
    -std=c99, some GNU extensions are disabled, and the standard library
    headers are more strict in what they define, so we need to compile with
    -D_DEFAULT_SOURCE.
...

We override CFLAGS in recipe, so we should add above to keep
sync with upstream.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/ifupdown/ifupdown_0.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.2.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.2.bb
index 732b295..70ff10d 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.2.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.2.bb
@@ -22,7 +22,7 @@ inherit update-rc.d update-alternatives
 
 do_compile () {
 	chmod a+rx *.pl *.sh
-	oe_runmake 'CC=${CC}' "CFLAGS=${CFLAGS} -Wall -W -D'IFUPDOWN_VERSION=\"${PV}\"'"
+	oe_runmake 'CC=${CC}' "CFLAGS=${CFLAGS} -std=c99 -D_DEFAULT_SOURCE -Wall -W -D'IFUPDOWN_VERSION=\"${PV}\"'"
 }
 
 do_install () {
-- 
1.9.1


