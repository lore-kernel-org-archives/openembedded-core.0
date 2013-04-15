Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URgfj-0001dy-6Y
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:30:13 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so2162634eae.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=PYAYGEdog+5TZlqGjU8YoyCBQLDdNKMv/ntKjZjLNV0=;
	b=DkRHWy1iCudLs2afNWWeZ9eWSodBN0KIaLFL5CIYoa2xG8p6pnRQ7LB8AYZwrIwtGY
	LbDLwVXn4kkKviv2F3lmGrJCdRmIn0qM63KDTZcFmRD1ea8jwmaEzna3xIKwt0U+CtQA
	+4Q5vWJlp8yqMLQunea/F/DuBSc4Znb0Z+bGom21MidRAank/5sHXqD/PW2+lcNN2ppF
	sRIpgEeP3sXto4HRJ5ZNqkmn4Wx1ZyCoTzjyfuWBiwBQKE/NGer7Gc9QYfMfyKi/w3ql
	srR+TOhAsdhihZaM5VbxsfGfK2jD1FawvzwIxdsJ4Bgt650ns1uxkQ8sAxRqOLg3tO6C
	BUOA==
X-Received: by 10.15.75.70 with SMTP id k46mr15113743eey.4.1366020754718;
	Mon, 15 Apr 2013 03:12:34 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id bj2sm26086814eeb.1.2013.04.15.03.12.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 03:12:33 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 12:12:24 +0200
Message-Id: <1366020744-2958-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQmxGk+YYxcANRu3yGCsFIe8Xl3d1JymqqZZgJDLb3K2I31Pf478MwcBwVGpcsiCPthVjIPc
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] udev: remove udev-extraconf from RRECOMMENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 10:30:13 -0000

In the original udev and systemd updates these extra conf rules and scripts where removed and moved to a different recipe to avoid pulling them in by default, making them opt-in. The systemd merge into oe-core regressed this into making it impossible to opt out of it when using package feeds for upgrades.

Change it back to opt-in for images/packagegroups.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/udev/udev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index d025458..b9f479a 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -14,7 +14,7 @@ LDFLAGS += "-lrt"
 
 DEPENDS = "acl glib-2.0 libusb usbutils pciutils gperf-native libxslt-native util-linux"
 RPROVIDES_${PN} = "hotplug"
-RRECOMMENDS_${PN} += "udev-extraconf usbutils-ids pciutils-ids"
+RRECOMMENDS_${PN} += "usbutils-ids pciutils-ids"
 RDEPENDS_libudev = "${PN} (= ${EXTENDPKGV})"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-- 
1.8.1.4



