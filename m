Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46C186FC0D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 07:32:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5J7WI2N021670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 00:32:18 -0700 (PDT)
Received: from pek-kkang-d1.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Thu, 19 Jun 2014 00:32:18 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jun 2014 15:31:52 +0800
Message-ID: <33b60242a24e4a5b0f906dd2b00dcf147a324cb8.1403162980.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403162980.git.kai.kang@windriver.com>
References: <cover.1403162980.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/1] initscripts: update populate-volatile.sh
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
X-List-Received-Date: Thu, 19 Jun 2014 07:32:20 -0000
Content-Type: text/plain

If a partition such as /tmp mounted on a volatile directory which create
by script populate-volatile.sh from initscripts, it will show errors.

In /var/log/boot, error message:

Thu Jun 19 05:39:09 2014: bootlogd.
Thu Jun 19 05:39:10 2014: rm: cannot remove '/tmp': Device or resource busy

Check volatile directories and if it is be mounted then don't force make
it as a link.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../initscripts/initscripts-1.0/populate-volatile.sh           | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index e707b20..904037e 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -72,10 +72,12 @@ link_file() {
 	if [ -L \"$2\" ]; then
 		[ \"\$(readlink -f \"$2\")\" != \"\$(readlink -f \"$1\")\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
 	elif [ -d \"$2\" ]; then
-		cp -a $2/* $1 2>/dev/null;
-		cp -a $2/.[!.]* $1 2>/dev/null;
-		rm -rf \"$2\";
-		ln -sf \"$1\" \"$2\";
+		if awk '\$2 == \"$2\" {exit 1}' /proc/mounts; then
+			cp -a $2/* $1 2>/dev/null;
+			cp -a $2/.[!.]* $1 2>/dev/null;
+			rm -rf \"$2\";
+			ln -sf \"$1\" \"$2\";
+		fi
 	else
 		ln -sf \"$1\" \"$2\";
 	fi
-- 
1.9.1


