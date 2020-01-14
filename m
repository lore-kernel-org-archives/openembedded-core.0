Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC0347DD6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 05:56:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00E5uLvN018102
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 21:56:31 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 13 Jan 2020 21:56:10 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2020 13:56:08 +0800
Message-ID: <20200114055609.4115-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/2] enchant2: fix qa issue about staticdev
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
X-List-Received-Date: Tue, 14 Jan 2020 05:56:40 -0000
Content-Type: text/plain

staticdev package defaults to include ${libdir}/${BPN}/*.a, but
for enchant2, the file locates under ${libdir}/echant-2/. So fix
it to avoid the following QA issue.

  QA Issue: non -staticdev package contains static .a library: enchant2 path '/.../usr/lib/enchant-2/enchant_aspell.a'

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/enchant/enchant2_2.2.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.7.bb b/meta/recipes-support/enchant/enchant2_2.2.7.bb
index bdfd738487..03db5c7fae 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.7.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.7.bb
@@ -26,3 +26,4 @@ FILES_${PN} += " \
     ${datadir}/enchant-2 \
     ${libdir}/enchant-2 \
 "
+FILES_${PN}-staticdev += "${libdir}/enchant-2/*.a"
-- 
2.17.1


