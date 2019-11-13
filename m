Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id CE1957F4FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 05:14:10 +0000 (UTC)
IronPort-SDR: wlVB9B/BRpYEAe7bpjy3D3rjXDbsHiqZ17hLgrJX2sCLwg7BrXsbd/NTLkXID9P+ea6oiEo3Lj
	+7XvdFxUASDfBWQQotZD/w3Rj7wQidGeK640pT27jO9VeowFz+U8878j7h/hLTnosn/dBDuZMO
	7G3ENKHIfruJQ1Mh24PkSq4Zab+5J6tXzYQ0hyaJxD9DVDYSERNghmMPvUiQg3vEzWkeiSQXUh
	eeqVqTsTtqoXQyeNh7ntdMuR1ZOdmemYwmcFELRF6w9NKVmmPtWmbx0zzHrIQTYMjHs6//9850
	ZvI=
X-IronPort-AV: E=Sophos;i="5.68,299,1569276000"; 
   d="scan'208";a="2366742"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 06:14:04 +0100
Message-Id: <20191113051404.17934-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191113051404.17934-1-pkj@axis.com>
References: <20191113051404.17934-1-pkj@axis.com>
MIME-Version: 1.0
Subject: [master][zeus][PATCH 2/2] sysstat: Correct when to use the package provided systemd unit files
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
X-List-Received-Date: Wed, 13 Nov 2019 05:14:11 -0000
Content-Transfer-Encoding: 8bit

There have been a number of changes back and forth as to when and how
to use the systemd unit files provided by the package. The correct
condition is actually that both cron and systemd need to be enabled
for them to be installed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 9394090136..62de36b44b 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -17,7 +17,7 @@ DEPENDS += "base-passwd"
 # autotools-brokensep as this package doesn't use automake
 inherit autotools-brokensep gettext systemd upstream-version-is-even
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
 PACKAGECONFIG[cron] = "--enable-install-cron --enable-copy-only,--disable-install-cron --disable-copy-only"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}"
@@ -46,7 +46,9 @@ do_install() {
 	        echo "d ${localstatedir}/log/sa - - - -" \
 		     > ${D}${sysconfdir}/tmpfiles.d/sysstat.conf
 
-	        if ${@bb.utils.contains('PACKAGECONFIG', 'cron', 'false', 'true', d)}; then
+		# Unless both cron and systemd are enabled, install our own
+		# systemd unit file. Otherwise the package will install one.
+	        if ${@bb.utils.contains('PACKAGECONFIG', 'cron systemd', 'false', 'true', d)}; then
 			install -d ${D}${systemd_unitdir}/system
 			install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
 			sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
-- 
2.21.0


