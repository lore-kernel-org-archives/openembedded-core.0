Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4CXs-0000oC-Eh
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 15:36:20 +0100
Received: by wera1 with SMTP id a1so1972270wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2012 06:27:47 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.103.35 as permitted sender)
	client-ip=10.180.103.35; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.103.35 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.103.35])
	by 10.180.103.35 with SMTP id ft3mr9203528wib.0.1330871267349 (num_hops
	= 1); Sun, 04 Mar 2012 06:27:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.103.35 with SMTP id ft3mr7352304wib.0.1330871267289;
	Sun, 04 Mar 2012 06:27:47 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gp8sm15105938wib.5.2012.03.04.06.27.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 06:27:46 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2012 15:27:36 +0100
Message-Id: <1330871257-5525-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330871257-5525-1-git-send-email-koen@dominion.thruhere.net>
References: <1330871257-5525-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlW6+usSTyuZXdI85n0lqD2PNtEJI7GFq8fGsOV8J3RfeuJuDVoq6f8B9O5S4V5BhtVLKT1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/3] polkit 0.104: add 2 backports from upstream to fix crashes during auth
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
X-List-Received-Date: Sun, 04 Mar 2012 14:36:20 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/polkit/polkit_0.104.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index 5dc82c5..dfbd300 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -11,12 +11,14 @@ DEPENDS = "expat dbus-glib eggdbus intltool-native"
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=none,libpam,libpam"
 
-PR = "r3"
+PR = "r4"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
            file://introspection.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch \
+           file://0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch \
           "
 
 SRC_URI[md5sum] = "e380b4c6fb1e7bccf854e92edc0a8ce1"
-- 
1.7.2.5



