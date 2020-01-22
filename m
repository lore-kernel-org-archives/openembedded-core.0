Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 534617FD4C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 14:45:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q6so7522678wro.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KcTyXGV9jGlrQRU9NgR5sm5ULQGvZ+0TNYt9QX7bI20=;
	b=okj0Q/AxLjSgtvQY9Cx0zw46GKzRASoizNGoxhfHE4rXUe1NoBCzSrcfLND3RaDWtt
	tN4po12//2RDASjWxbhSTy9adBp+kuyN3sGJheXfKowZbvmkqiWi6lM3CJzoVUzrgTrU
	Zqr6/yXfcYN59djkXqzM1Q41UtPpRA4WoBofJYIRZtHoZs+yXQu9leQ3e9YInXI/gN4O
	PTihpupL89mre+q6USwIs3M8Old9OJJC2noPHhz5PPxKQNEmrye3zHppbDZXKanMt7Ok
	f15MA8IIyJwc7uxNtAm3+Ew36gL7GO2BIAOneaoqMzCSTYYPuy9ntFJcn8DuzUIiCFGf
	VN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KcTyXGV9jGlrQRU9NgR5sm5ULQGvZ+0TNYt9QX7bI20=;
	b=fpeLhcNgY4zzHJKO4iortuSThNxu84TC0EeY+1R1xLDGJFsdWEwG4DSMv2p3JA0dzE
	dEhE9c7BSdeHvdXSXC5d+MBSH6gF5AMhzAi4dTwBApuCNMxJ0WZKfZQ/hJ+Cr9MconEn
	nP5l8et64xbLY/1SNrzmqvSoKuSLwawxxXsvfIXmfrIXCbv79Rs7/iS61ODYwm7kdBWf
	FEXzv0GS5wM8KmMK9MsqZX0+9SyZPVLqFjIxhIvNSaYQRU2D960/Sy5IW2y3fr6D90+t
	W+mLPe5U5aloafDBbn1GVNxPAKEsjrBGAoDGU93RBylSREHrlB1dvEclSO0LAJw+AkV6
	XpUg==
X-Gm-Message-State: APjAAAWt06IKSEzgAJV96E+ux0dnobRCodlCz0BPyV/q1fz5EbQE5uH3
	wva3QXij36lcq6JZrTDhqsuVCAxUTrc=
X-Google-Smtp-Source: APXvYqwOyvsoZuLqt+S/02Wu/auqldWJn6vT+0r9FXGE39b7f+pjO7AlmeSTJBxJSAPpewohqFzAWw==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr11563574wrv.197.1579704353798;
	Wed, 22 Jan 2020 06:45:53 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	60sm58552442wrn.86.2020.01.22.06.45.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 06:45:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 14:45:47 +0000
Message-Id: <20200122144548.5723-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122144548.5723-1-ross.burton@intel.com>
References: <20200122144548.5723-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] connman: add PACKAGECONFIG for the commandline client
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
X-List-Received-Date: Wed, 22 Jan 2020 14:45:53 -0000
Content-Transfer-Encoding: 8bit

The client depends on readline which is GPLv3.  Add a PACKAGECONFIG so users who
don't need the client and are against GPLv3 can disable it.

Also remove the explicit installation of the client in do_install_append, as the
Makefile installs it now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ff3aff5f1ff..d3eeb3be1c2 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
-DEPENDS  = "dbus glib-2.0 ppp readline"
+DEPENDS  = "dbus glib-2.0 ppp"
 
 INC_PR = "r20"
 
@@ -27,13 +27,11 @@ EXTRA_OECONF += "\
     --enable-ethernet \
     --enable-tools \
     --disable-polkit \
-    --enable-client \
 "
 
-PACKAGECONFIG ??= "wispr \
+PACKAGECONFIG ??= "wispr iptables client\
                    ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd wifi', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-                   iptables \
 "
 
 # If you want ConnMan to support VPN, add following statement into
@@ -54,6 +52,7 @@ PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-masq-ipv4 kernel-module-nft-nat"
 PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
 PACKAGECONFIG[nfc] = "--enable-neard, --disable-neard, neard, neard"
+PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
@@ -87,7 +86,6 @@ do_install_append() {
 	if [ -e ${B}/tools/wispr ]; then
 		install -m 0755 ${B}/tools/wispr ${D}${bindir}
 	fi
-	install -m 0755 ${B}/client/connmanctl ${D}${bindir}
 
 	# We don't need to package an empty directory
 	rmdir --ignore-fail-on-non-empty ${D}${libdir}/connman/scripts
-- 
2.20.1


