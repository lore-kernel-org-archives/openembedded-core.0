Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UBikz-0008Ow-0r
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 10:29:29 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r229D3qZ012984
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Mar 2013 01:13:04 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Sat, 2 Mar 2013 01:13:03 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Mar 2013 17:12:59 +0800
Message-ID: <15f063c81001e37e8bcfb39abb37eec3fb7be860.1362215186.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362215186.git.hongxu.jia@windriver.com>
References: <cover.1362215186.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] package_deb.bbclass:fix meta-toolchain-sdk fail on do_populate_sdk
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
X-List-Received-Date: Sat, 02 Mar 2013 09:29:30 -0000
Content-Type: text/plain

When build meta-toolchain-sdk in a newly created environment, there is
an error:
...
packagegroup-core-standalone-gmae-sdk-target set to manually installed.
You might want to run `apt-get -f install' to correct these:
The following packages have unmet dependencies:
avahi-dev: Depends: avahi (= 0.6.31-r6.1) but it is not going to be installed
E: Unmet dependencies. Try 'apt-get -f install' with no packages (or specify a
solution).
...
In this case, avahi was installed and then removed by dpkg (the reason is
unknown, only with log `Noting disappearance of avahi, which has been
completely replaced'), the uninstall was done by dpkg rather than apt,
and apt detected the package dependency was broken, so apt-get install failed.

Use `apt-get install -f' to correct the upper broken dependencies in place.
The removed avahi will be reinstalled.

[YOCTO #3720]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/package_deb.bbclass |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 309c48d..2f27800 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -117,12 +117,18 @@ package_install_internal_deb () {
 	fi
 
 	# normal install
-	for i in ${package_to_install}; do
-		apt-get install $i --force-yes --allow-unauthenticated
+	if [ ! -z "${package_to_install}" ]; then
+		apt-get install ${package_to_install} --force-yes --allow-unauthenticated
 		if [ $? -ne 0 ]; then
 			exit 1
 		fi
-	done
+
+		# Attempt to correct the probable broken dependencies in place.
+		apt-get -f install
+		if [ $? -ne 0 ]; then
+			exit 1
+		fi
+	fi
 
 	rm -f `dirname ${BB_LOGFILE}`/log.do_${task}-attemptonly.${PID}
 	if [ ! -z "${package_attemptonly}" ]; then
-- 
1.7.10.4



