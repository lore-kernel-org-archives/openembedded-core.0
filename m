Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TjduG-00026Y-Do
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 23:39:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBEMOOjm026825
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 14:24:24 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Fri, 14 Dec 2012 14:24:22 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 16:40:34 -0600
Message-ID: <1355524834-9550-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1355524834-9550-1-git-send-email-mark.hatle@windriver.com>
References: <1355524834-9550-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] package_rpm.bbclass: Refactor the attempt only install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 22:39:00 -0000
Content-Type: text/plain

Smart does not have a method to perform an install, but ignore failures.

There was a class of failures that stopped Smart from processing
attemptonly installs.  To work around this we need to iterate over the to
be attempted list.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 05108b2..dc8a54e 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -465,10 +465,14 @@ EOF
 
 	if [ -n "${package_attemptonly}" ]; then
 		echo "Note: installing attempt only packages..."
+		echo "Attempting $pkgs_to_install"
 		echo "Note: see `dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}"
 		translate_oe_to_smart ${sdk_mode} --attemptonly $package_attemptonly
-		echo "Attempting $pkgs_to_install"
-		smart --data-dir=${target_rootfs}/var/lib/smart install -y $pkgs_to_install >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1 || true
+		for each_pkg in $pkgs_to_install ;  do
+			# We need to try each package individually as a single dependency failure
+			# will break the whole set otherwise.
+			smart --data-dir=${target_rootfs}/var/lib/smart install -y $each_pkg >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1 || true
+		done
 	fi
 }
 
-- 
1.7.3.4



