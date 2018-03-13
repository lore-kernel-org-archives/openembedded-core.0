Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 98C2E78934
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 03:08:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2D38VeK028920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 20:08:31 -0700 (PDT)
Received: from localhost.localdomain (172.25.59.221) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 12 Mar 2018 20:07:52 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Mar 2018 22:08:24 -0500
Message-ID: <1520910506-1642-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] alsa-lib: Add an RPROVIDES for alsa-lib
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
X-List-Received-Date: Tue, 13 Mar 2018 03:08:30 -0000
Content-Type: text/plain

There are a number of other recipes outside oe-core that depend on
alsa-lib and the rpm4 dependencies resolve sometimes to include
alsa-lib and the packages in the other layers fail to install because
the dependency cannot be resolved, despite the fact that libasound is
installed.

The simple is to add an RPROVIDES for alsa-lib to libasound which
provides all the shared objects for alsa.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
index c5bf107..f7f01e8 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
@@ -25,6 +25,7 @@ FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
 
 RDEPENDS_libasound = "alsa-conf"
+RPROVIDES_libasound = "alsa-lib"
 
 # alsa-lib gets automatically added to alsa-lib-dev dependencies, but the
 # alsa-lib package doesn't exist. libasound is the real library package.
-- 
2.7.4


