Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URNfr-0001BB-Qb
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 16:12:58 +0200
Received: by mail-ea0-f169.google.com with SMTP id n15so1875919ead.28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 06:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=TosBiNkAVZ3ElHB0vQly8CBNwnyU4Tgr1oxNoR2WlIs=;
	b=onB4ULtcZ/yQXCtYkywWMaSZZTKbzoFo9z4PKEj9dnFZbmAgBqVkRb5cDFZ4XhwvsU
	f22fgcQCwvxu7B2oVEOHnpSWT8aMQmClZYW6o7gr48V90UPG+bMew/dgz3JRfr5nS9ud
	MMh2gGfuOdVMcwqsz8fpZ2L+j5BHaE+r4E0ogcEdT13Dk//NW3lEB+Tr4nBL2Oqv79SZ
	SRMyauuofw/sQnXGOoKQkRRVGs12Pq+12U+Zh6vJughtcKqpYoXx4pSrGQgIaAXu1+21
	1e5qcbZLF60Wz4kes1ntJKKHBTuGvh4pGb4X/Dou+9NTC1KVTANhERu4JTqY/tCd4xM5
	dydQ==
X-Received: by 10.15.36.2 with SMTP id h2mr51477920eev.2.1365947728578;
	Sun, 14 Apr 2013 06:55:28 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by mx.google.com with ESMTPS id
	cb50sm21598213eeb.14.2013.04.14.06.55.27
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 06:55:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Apr 2013 15:55:22 +0200
Message-Id: <1365947722-16267-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkRvL0QyRwMkwTCNKCmspvGxdxpgMV9U7SdiAPtJWGbTF1XSdOEJi/32T/dv9zebgzKQeXH
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][PATCH] systemd: remove udev-extraconf from RRECOMMENDS
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
X-List-Received-Date: Sun, 14 Apr 2013 14:12:58 -0000

In the original udev and systemd updates these extra conf rules and scripts where removed and moved to a different recipe to avoid pulling them in by default, making them opt-in. The systemd merge into oe-core regressed this into making it impossible to opt out of it when using package feeds for upgrades.

Change it back to opt-in for images/packagegroups.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Since udev-extraconf is persona non grata in angstrom I have no idea what depends on it, so please tell me what needs to get fixed after removing this.

 meta/recipes-core/systemd/systemd_199.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 0d07f85..fbf2a2f 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -202,7 +202,7 @@ FILES_udev-dbg += "/lib/udev/.debug"
 
 RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
-RRECOMMENDS_udev += "udev-extraconf udev-hwdb"
+RRECOMMENDS_udev += "udev-hwdb"
 
 FILES_udev += "${base_sbindir}/udevd \
                ${base_libdir}/systemd/systemd-udevd \
-- 
1.8.1.4



