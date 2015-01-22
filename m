Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A4357251B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 09:09:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0M99LWa023893
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 22 Jan 2015 01:09:21 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 22 Jan 2015 01:09:21 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 22 Jan 2015 17:09:14 +0800
Message-ID: <616033e0154f736864022de2105cbb1a93f7b6cf.1421917634.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421917634.git.hongxu.jia@windriver.com>
References: <cover.1421917634.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] distcc: fix initscript can not stop distcc daemon correctly
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
X-List-Received-Date: Thu, 22 Jan 2015 09:09:27 -0000
Content-Type: text/plain

The distcc's initscript has used option '--pid-file' to save daemon
process id, but it didn't to create that file, that caused start/stop
distcc daemon failed.

We refer what Ubuntu 14.04 did, create pid file before start and
delete it after stop

[YOCTO #7090]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/distcc/files/distcc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/distcc/files/distcc b/meta/recipes-devtools/distcc/files/distcc
index c7c414d..e36f0fa 100755
--- a/meta/recipes-devtools/distcc/files/distcc
+++ b/meta/recipes-devtools/distcc/files/distcc
@@ -51,6 +51,9 @@ should_start() {
 		echo "$DAEMON not starting"
 		exit 0
 	fi
+	# we need permission to write to the pid file
+	touch /var/run/$NAME.pid
+	chown distcc /var/run/$NAME.pid
 }
 
 case "$1" in
@@ -75,6 +78,7 @@ case "$1" in
 	    echo "$0: stop failed with error code $code" >&2
 	    exit $code
 	}
+	rm -f /var/run/$NAME.pid >/dev/null 2>&1
 	echo "."
 	;;
   restart|force-reload)
@@ -92,6 +96,7 @@ case "$1" in
 		--exec $DAEMON -- $DAEMON_ARGS $ALLOW ||
 	{
 	    code=$?
+	    rm -f /var/run/$NAME.pid >/dev/null 2>&1
 	    echo "$0: restart failed with error code $code" >&2
 	    exit $code
 	}
-- 
1.9.1


