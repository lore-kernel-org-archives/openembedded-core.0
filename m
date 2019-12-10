Return-Path: <claus.stovgaard@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 53C8D7FAAA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 13:37:43 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so3273912wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 05:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Io3Q61O50wdvJtSSAEcu5SCXLtSCusLybHWdgYjKM8M=;
	b=rLa6IasZjZBFeNrOonw/FiRkBvCv/S94lQOtH2QVlDm8usFPioaxvj4yMTGLK1swPD
	uUufmQlQitRWh8x9hkY3y8Y2jVBQq7HGEEXRnoqGcbsApGjbvfNtLemFsV5/AQuF6eog
	ZPqIByF4z4YiW9uhsVxpbB8AeWFn+z+raGLOAbWwt/Kol9TlGbiiLB2ZmZRHqBQG6+EY
	cC1/bDqfyl2rlm8duskg/hiSR/1MZxEm16nmpsyE/ldRMZNysGeae/j02C8lFTZWyj+b
	OHqacpRcslQ7pkHGD+V0zuijmEbQ5+AbHnhpvaWo9rb+eghcA9WdmXB9exwAZityM9pK
	foPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Io3Q61O50wdvJtSSAEcu5SCXLtSCusLybHWdgYjKM8M=;
	b=NM8fSyN6z/H7qI45Juo8bVNWe1/VxdebrcfPZBwv6OTd7QhyWYNrWtp6ky5LFS9rQp
	4l2Ai5fa1NzNKx4SJSWQu/crgFa5P888JP6sqQUnKDuxqUnztCvPCjP6coDjgIXTyT/w
	Kp+RMObjJdsMz87dNT6DHB7hp5kV5qNxSDjHg4/Du1lWB76npHN2SX/buK1MCreiE1ix
	1/cPWtIRJU4cBIO0+QERyY2PS/e6HFZbNJ+dAhB+1Y5jlOYVtME3SUKriiK4CUsHjg8F
	g8wFiflj53yjLJ8t7Vv8/R5MjrJEoJIkBaSXfezqdg9vDFNUILkgvoQUGxQlcz/vePHB
	6gNQ==
X-Gm-Message-State: APjAAAVdTHNKuWuIGfyMySkRGvwt0zU1ldz1LNVZFarSl4ia5aT9XcLH
	Bu7mnmGax+434CIMcJpzlXCVrE9m
X-Google-Smtp-Source: APXvYqx1kT+r8QyMUGmPHoUHT5BYzKSuwt2US6xLyBe05oWcc7PbWKs3d6iBJUcgDXtewMlqPdwAdA==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr5389788wmi.0.1575985063528;
	Tue, 10 Dec 2019 05:37:43 -0800 (PST)
Received: from stas.phaseone.com (0126800801.0.fullrate.ninja. [2.110.44.75])
	by smtp.gmail.com with ESMTPSA id 5sm3590281wrh.5.2019.12.10.05.37.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 05:37:42 -0800 (PST)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2019 14:37:26 +0100
Message-Id: <20191210133726.470102-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] connman: use PACKAGECONFIG to control readline/client option
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
X-List-Received-Date: Tue, 10 Dec 2019 13:37:43 -0000
Content-Transfer-Encoding: 8bit

Only depend on readline when enabling the client, like bluez5.
Default to enable readline and compile the client as before.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 meta/recipes-connectivity/connman/connman.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index fb38ab4fc1..a128cb198f 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
-DEPENDS  = "dbus glib-2.0 ppp readline"
+DEPENDS  = "dbus glib-2.0 ppp"
 
 INC_PR = "r20"
 
@@ -27,13 +27,13 @@ EXTRA_OECONF += "\
     --enable-ethernet \
     --enable-tools \
     --disable-polkit \
-    --enable-client \
 "
 
 PACKAGECONFIG ??= "wispr \
                    ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd wifi', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
                    iptables \
+                   readline \
 "
 
 # If you want ConnMan to support VPN, add following statement into
@@ -54,6 +54,7 @@ PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables-ipv4 kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-meta kernel-module-nft-masq-ipv4 kernel-module-nft-nat"
 PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
 PACKAGECONFIG[nfc] = "--enable-neard, --disable-neard, neard, neard"
+PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
@@ -87,7 +88,9 @@ do_install_append() {
 	if [ -e ${B}/tools/wispr ]; then
 		install -m 0755 ${B}/tools/wispr ${D}${bindir}
 	fi
-	install -m 0755 ${B}/client/connmanctl ${D}${bindir}
+	if [ -e ${B}/client/connmanctl ]; then
+		install -m 0755 ${B}/client/connmanctl ${D}${bindir}
+	fi
 
 	# We don't need to package an empty directory
 	rmdir --ignore-fail-on-non-empty ${D}${libdir}/connman/scripts
-- 
2.23.0


