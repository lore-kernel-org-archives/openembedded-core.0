Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 322A56E33B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 08:37:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBC8bBAl010796
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 00:37:11 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Dec 2013 00:37:10 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Dec 2013 16:38:04 +0800
Message-ID: <85e2c3972116140d8302bbd577bd13cd121f98d6.1386837420.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386837420.git.Qi.Chen@windriver.com>
References: <cover.1386837420.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] init-ifupdown: adjust priority of networking to fix system freeze problem
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
X-List-Received-Date: Thu, 12 Dec 2013 08:37:11 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

On mpc8315e, a system freeze is encountered at system boot time if
connman and init-ifupdown are installed.

The error message before the freeze is:
    "ip: RTNETLINK answers: File exists"

This problem is introduced by the following commit.
    dc80eea sysvinit: fix problem in switching runlevels

Part of the above commit is to make the networking init script run
at runlevel 2 3 4 5 instead of runlevel S. However, after the change,
networking is run after connman. And this causes the problem stated
above.

Make networking run first when entering runlevel 2 3 4 5, so that we
don't break things.

[YOCTO #5651]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../init-ifupdown/init-ifupdown_1.0.bb             |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 0f4290c..77e8384 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -9,7 +9,7 @@ PR = "r3"
 inherit update-rc.d
 
 INITSCRIPT_NAME = "networking"
-INITSCRIPT_PARAMS = "start 10 2 3 4 5 . stop 80 0 6 1 ."
+INITSCRIPT_PARAMS = "start 01 2 3 4 5 . stop 80 0 6 1 ."
 
 SRC_URI = "file://copyright \
            file://init \
-- 
1.7.9.5


