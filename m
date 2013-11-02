Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD6F61957
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2013 05:20:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA25KxsL029144
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2013 22:20:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 1 Nov 2013 22:20:58 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Nov 2013 13:21:59 +0800
Message-ID: <f727b289d6057ae6a57c220cb694d6a940e63533.1383369426.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383369426.git.Qi.Chen@windriver.com>
References: <cover.1383369426.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bootlogd: create log file if not present
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
X-List-Received-Date: Sat, 02 Nov 2013 05:20:59 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

Previously, our system had no boot log even if the bootlogd daemon was
started correctly. The root cause is that the log file doesn't exist
when starting the bootlogd.

Add '-c' option to bootlogd so that it will create the boot log if
it doesn't exist.

[YOCTO #5273]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
index 7b87827..b181357 100755
--- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
+++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
@@ -47,9 +47,9 @@ case "$ACTION" in
 		then
 			umask 027
 			start-stop-daemon --start --quiet \
-				--exec $DAEMON -- -r
+				--exec $DAEMON -- -r -c
 		else
-			$DAEMON -r
+			$DAEMON -r -c
 		fi
 		echo "$NAME."
 		;;
-- 
1.7.9.5


