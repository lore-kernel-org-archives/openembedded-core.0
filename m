Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 311E9728DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 06:21:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ6Lfat005904
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 22:21:41 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Dec 2014 22:21:41 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 14:21:40 +0800
Message-ID: <4e76b9a962889ed75e0c1306b584974f7db57325.1418969925.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418969925.git.Qi.Chen@windriver.com>
References: <cover.1418969925.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] update-rc.d: use '-f' option in updatercd_postrm
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
X-List-Received-Date: Fri, 19 Dec 2014 06:21:42 -0000
Content-Type: text/plain

Use '-f' ('--force') option so that while removing packages using deb,
we don't fail because of the following error:

   update-rc.d: $initd/$bn exists during rc.d purge (use -f to force)

Using '-f' option would make this a warning but continue to execute.

   update-rc.d: $initd/$bn exists during rc.d purge (continuing)

We need this option now because things under /etc/init.d/ are configuration
files by default. As dpkg doesn't remove configuration files when using
'remove', errors appear.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/update-rc.d.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index bc1aa7d..a9c0323 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -48,9 +48,9 @@ fi
 updatercd_postrm() {
 if type update-rc.d >/dev/null 2>/dev/null; then
 	if [ -n "$D" ]; then
-		OPT="-r $D"
+		OPT="-f -r $D"
 	else
-		OPT=""
+		OPT="-f"
 	fi
 	update-rc.d $OPT ${INITSCRIPT_NAME} remove
 fi
-- 
1.9.1


