Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SnE0A-0004Yt-Cb
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 21:16:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q66J3ujW021588
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2012 12:03:56 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 6 Jul 2012 12:03:56 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jul 2012 14:14:01 -0500
Message-ID: <6f6a9549daaa722253b706306553f725bd5423f8.1341601764.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341601764.git.mark.hatle@windriver.com>
References: <cover.1341601764.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/3] package_rpm: Avoid duplicate package generation failures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2012 19:17:47 -0000
X-List-Received-Date: Fri, 06 Jul 2012 19:17:47 -0000
Content-Type: text/plain

When constructing a multilib based image, it's possible to end up with
the same package listed in multiple steps of the install.  During resolution
we use the --replacepkgs option to avoid errors, as the resulting install
solution will be as expected.  (We do not enable the replacepkgs option
for the final install step, only the generation of the install solution.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 78279f5..2a29917 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -318,7 +318,7 @@ package_install_internal_rpm () {
 			--root "${target_rootfs}/install" \
 			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-base_archs.macro`" \
 			-D "__dbi_txn create nofsync" \
-			-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+			-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 			${target_rootfs}/install/install.manifest
 	fi
 
@@ -348,7 +348,7 @@ package_install_internal_rpm () {
 				--root "${target_rootfs}/install" \
 				-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync private" \
-				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+				-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 			$pkg_name >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" || true
 		done
 	fi
@@ -399,7 +399,7 @@ package_install_internal_rpm () {
 				--root "${target_rootfs}/install" \
 				-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync private" \
-				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+				-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 				$pkg_name >> "`dirname ${BB_LOGFILE}`/log.do_${task}_recommend.${PID}" 2>&1 || true
 		done
 		cat ${target_rootfs}/install/recommend.list ${target_rootfs}/install/recommend.new | sort -u > ${target_rootfs}/install/recommend.new.list
@@ -428,7 +428,7 @@ package_install_internal_rpm () {
 			--root "${target_rootfs}/install" \
 			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-ml_archs.macro`" \
 			-D "__dbi_txn create nofsync" \
-			-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+			-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 			${target_rootfs}/install/install_multilib.manifest
 
 		# Now that we have a solution, pull out a list of what to install...
@@ -524,7 +524,7 @@ EOF
 				--root "${target_rootfs}/install" \
 				-D "_dbpath ${target_rootfs}/initial" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync" \
-				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+				-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 				${target_rootfs}/install/initial_install.manifest
 
 			${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf "%{packageorigin}\n" \
-- 
1.7.3.4



