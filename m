Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 28062758FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:08:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B98jJP010590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:08:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 11 Jun 2015 02:08:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 02:08:43 -0700
Message-ID: <135be24d84523a7ccfc166283a659109f238c713.1434013682.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013682.git.liezhi.yang@windriver.com>
References: <cover.1434013682.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] libpcap: fix PACKAGECONFIG
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
X-List-Received-Date: Thu, 11 Jun 2015 09:08:44 -0000
Content-Type: text/plain

The BLUEZ is default to bluez5, but there is only PACKAGECONFIG[bluez4],
no PACKAGECONFIG[bluez5], and the current version of libpcap (or the
higher version 1.7.3) only supports bluez4, we can't use
${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
for PACKAGECONFIG any more since BLUEZ is default to bluez5, and not
supported, and there is no bluez4 in oe-core any more, set PACKAGECONFIG to ""
by default, other layers where bluez4 is available can enable it via bbappend.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 9b059d7..b7c3995 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -20,7 +20,7 @@ inherit autotools binconfig-disabled pkgconfig bluetooth
 
 EXTRA_OECONF = "--with-pcap=linux"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
-- 
1.7.9.5


