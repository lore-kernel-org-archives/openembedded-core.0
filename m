Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3E777FED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 08:27:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4V8RQPU006148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 01:27:26 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 31 May 2017 01:27:25 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 May 2017 16:27:16 +0800
Message-ID: <22aa14ac1a926e97fb676743cb1e440ff2aaae1f.1496218782.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496218782.git.jackie.huang@windriver.com>
References: <cover.1496218782.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] ncurses: add SYSROOT_DESTDIR for siteconfig_gencache
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
X-List-Received-Date: Wed, 31 May 2017 08:27:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

After switching to Recipe Specific Sysroots, ncurses
will not be populated in its own sysroots, then
siteconfig_gencache fails to find some headers,
so add ${SYSROOT_DESTDIR}/${includedir} into the
search list to fix the issue.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 8990b0f5ef..1f21cd413d 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -18,6 +18,8 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ncurses.git"
 EXTRA_AUTORECONF = "-I m4"
 CONFIG_SITE =+ "${WORKDIR}/config.cache"
 
+EXTRASITECONFIG = "CFLAGS='${CFLAGS} -I${SYSROOT_DESTDIR}${includedir}'"
+
 # Whether to enable separate widec libraries; must be 'true' or 'false'
 #
 # TODO: remove this variable when widec is supported in every setup?
-- 
2.11.0


