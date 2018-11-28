Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9346D197
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 08:15:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j10so25292197wru.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 00:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=11Cz27zlB4ZCWphPczEB3uMI9i9WWbL/ltMH0Tn2vPE=;
	b=r5Ydrilhy7XW25wYMTYRpZgx9ot5zsQw4FZ7/s3XuiPKQbk94aZBrZpiRLeSt8i2Sv
	As/XwFpcNdFboyIVQxoQBZFoVSfzaA+Wwd2wjic1ZCYZ/8jyyYW5BTW2rZbvQTy2itcG
	B8Qhbn8+/Ab/ALHBH/Iyn9i0NHgf+iWVhZ4TD/R9P7AdUVHs6e2OELBBHsbYCs1S/t5s
	QnlyuboaQzsQzGFYvgTcmW30pfoWcVIbInIFTWekxZ+wvBos3IqAQhwhy3DHfnHMxeDw
	GJZ50IUMssurQHQYyQIfqiDgluq6PUzsb2I3i4AuIfGiTYq4i14fejzCGbVv+1S3YNpl
	zibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=11Cz27zlB4ZCWphPczEB3uMI9i9WWbL/ltMH0Tn2vPE=;
	b=S+AY0KYFFaQ6Ps1f39ZRadENGXH880XOLvblZPF6gyWwgFbC3phecbPutgjRpGtpu7
	X+SqcZHv+0tIu6q3+NPCsvekT6GuW2tCXeGEArMtXfbZbfC49AKKZ0S2L1H8rMupnDbi
	olDnLn8l5w9hbiMfLUNiYAljnUaAU0l+Qs69BgPEjbCHO26Ck1kLstuAQXFGULteAfRz
	C72u4VkRz0Fy+e3gOg2w7yW5G4z0BjV8jkt2/a+0On3BWt1eHIM0PkvtQAQel+JabsPr
	bHZf7gfqnfk/IF1xGbaXNVV/9ToQ+/ws3agVh8tK3I8bHZCUaj840KBsu8w7TRd3XK66
	QVgg==
X-Gm-Message-State: AA+aEWanhidrI4QCW3gOVCQ6qRGjFs+0BiS+UALTEdBei31E9X8KlMwg
	VFnTHutCBB4usSjjYQENA/GI+M39
X-Google-Smtp-Source: AFSGD/VLEl6JMYZDGrjbRwGlbLpj4yUb3DwlcwyM6GwhyluS89det7E9Q0aEQZ8YyZK1PWYY78t3sQ==
X-Received: by 2002:adf:9542:: with SMTP id 60mr29292700wrs.60.1543392956629; 
	Wed, 28 Nov 2018 00:15:56 -0800 (PST)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	j33sm7260633wre.91.2018.11.28.00.15.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 00:15:55 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 09:15:30 +0100
Message-Id: <20181128081530.31125-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] avahi: avoid depending on skipped package
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
X-List-Received-Date: Wed, 28 Nov 2018 08:15:56 -0000

When built without D-Bus, libavahi-client is not build:
  Building libavahi-client:           no   (You need avahi-daemon and D-Bus!)
which causes avahi-dev RDEPENDS failing when creating an image
containing development-tools:
 *   - nothing provides libavahi-client = 0.7-r0 needed by avahi-dev-0.7-r0.cortexa8hf-neon

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-connectivity/avahi/avahi_0.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb b/meta/recipes-connectivity/avahi/avahi_0.7.bb
index 3d5f334a88..2e04d304c7 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
@@ -38,7 +38,8 @@ FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
 FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*  ${libdir}/girepository-1.0/Avahi*.typelib"
 FILES_avahi-utils = "${bindir}/avahi-*"
 
-RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
+RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV})"
+RDEPENDS_${PN}-dev += "${@["", " libavahi-client (= ${EXTENDPKGV})"][bb.utils.contains('PACKAGECONFIG', 'dbus', 1, 0, d)]}"
 
 RRECOMMENDS_avahi-daemon_append_libc-glibc = " libnss-mdns"
 
-- 
2.17.1


