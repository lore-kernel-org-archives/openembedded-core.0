Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA93678EA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:04:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7D74QT5014494
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 00:04:26 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 13 Aug 2018 00:04:26 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2018 00:04:24 -0700
Message-ID: <20180813070425.85090-2-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180813070425.85090-1-zhixiong.chi@windriver.com>
References: <20180813070425.85090-1-zhixiong.chi@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] nspr: fix script conflict for multilib
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
X-List-Received-Date: Mon, 13 Aug 2018 07:04:26 -0000
Content-Type: text/plain

Stop the nspr-config scripts conflicting in a multilib case.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-support/nspr/nspr_4.19.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nspr/nspr_4.19.bb b/meta/recipes-support/nspr/nspr_4.19.bb
index b43c78081d..b5264be2a0 100644
--- a/meta/recipes-support/nspr/nspr_4.19.bb
+++ b/meta/recipes-support/nspr/nspr_4.19.bb
@@ -149,7 +149,9 @@ TESTS = " \
     xnotify \
     zerolen"
 
-inherit autotools
+inherit autotools multilib_script
+
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/nspr-config"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.17.1


