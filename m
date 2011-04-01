Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0N-0004v2-0j
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:39 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=QVXyCFTQYI3lxNX3UOEt5iV/V70yOE6v5hS6KWkpK5w=;
	b=x/voGox7/8h/X+/xjiho60GeSgRtYV7qt0O1NAF2pbp7/bH67mIr3fi0G6yO/kULuy
	eZFlkbXUPe06Au4iBmy9neiR4WHXNu3VdXMfHZWmqZNmain2788xYhjnlHwb+gE5IiSU
	CSAeAuJpwvS+OHSqic76SHybj/bstgDVdVY1c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MFt+tfZt5oOJUz/vD6/yn7idiG2knTLiaclzUZyF8CNoKtPjzp9aSkWDGAyRxIhgyW
	mlpGNLDl99KawXWdeVCpWBTcWOnXctiC1BQg1yMUgw51cNS+vflfGrphWAihXTVbVskN
	E6t88fm1t3WwUZvNl6QJ5mgaMkatD7cyjcCLk=
Received: by 10.43.62.72 with SMTP id wz8mr4552182icb.350.1301632119320;
	Thu, 31 Mar 2011 21:28:39 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id vx7sm1038754icb.14.2011.03.31.21.28.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:30 -0700
Message-Id: <172d562811e976f011e5a584e0ad24f74765f7d8.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 08/46] avahi.inc: Conditionalize RECOMMENDS by using overrides
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:39 -0000

libnss-mdns is not supportable on uclibc since nss is not available on
uclibc

we add gettext-dev to RRECOMMENDS only of eglibc/glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 9f83d8d..6d4b830 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -16,8 +16,10 @@ PRIORITY = "optional"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0 gtk+ libglade"
-RRECOMMENDS_${PN} = "libnss-mdns"
-RRECOMMENDS_avahi-daemon = "libnss-mdns"
+
+# uclibc has no nss
+RRECOMMENDS_avahi-daemon_append_libc-glibc = "libnss-mdns"
+RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
 
 SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
         file://00avahi-autoipd \
@@ -66,7 +68,9 @@ FILES_avahi-ui-utils = "${bindir}/bssh ${bindir}/bvnc ${bindir}/bshell \
                         ${datadir}/applications \
                         ${datadir}/avahi/interfaces"
 
-RRECOMMENDS_avahi-dev = "gettext-dev expat-dev libcap-dev libdaemon-dev dbus-dev glib-2.0-dev update-rc.d-dev"
+RRECOMMENDS_avahi-dev = "expat-dev libcap-dev libdaemon-dev dbus-dev glib-2.0-dev update-rc.d-dev"
+RRECOMMENDS_avahi-dev_append_libc-glibc = " gettext-dev"
+
 RRECOMMENDS_avahi-dev[nodeprrecs] = 1
 
 CONFFILES_avahi-daemon = "${sysconfdir}/avahi/avahi-daemon.conf"
-- 
1.7.4.1



