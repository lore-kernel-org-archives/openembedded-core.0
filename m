Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id A335A6B89F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:15:04 +0000 (UTC)
Received: from localhost (213.114.79.21) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.279.1; Fri, 10 Jan 2014
	08:14:53 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2014 08:15:03 +0100
Message-ID: <66484b0f9b20980f5e45f01aba5eeec8c24a974f.1389338076.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389338076.git.anders@chargestorm.se>
References: <cover.1389338076.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 1/1] systemd-compat-units: do not mask available services
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
X-List-Received-Date: Fri, 10 Jan 2014 07:15:05 -0000
Content-Type: text/plain

Do also check systemd_unitdir/system/ for available unit files.

This was hiding dnsmasq.service for us, as /etc/systemd/system has
priority over systemd_unitdir/system...

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 9f28283..e32ad79 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -42,7 +42,7 @@ pkg_postinst_${PN} () {
 	fi
 
 	for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
-		if [ \( -e $i -o $i.sh \) -a ! -e $D${sysconfdir}/systemd/system/$i.service ] ; then
+		if [ \( -e $i -o $i.sh \) -a ! \( -e $D${sysconfdir}/systemd/system/$i.service -o  -e $D${systemd_unitdir}/system/$i.service \) ] ; then
 			echo -n "$i: " ; systemctl ${OPTS} mask $i.service
 		fi
 	done ; echo
-- 
1.8.5.2


