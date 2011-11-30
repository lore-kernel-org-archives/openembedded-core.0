Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RVhdD-0005EP-4Q
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 11:43:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAUAaYJo028064
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 02:36:34 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 30 Nov 2011 02:36:34 -0800
Message-ID: <43e4ff11b1c935566e81f3ad7f2c64a709c4cdb3.1322648566.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322648566.git.xiaofeng.yan@windriver.com>
References: <cover.1322648566.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 30 Nov 2011 16:53:33 +0800
Date: Wed, 30 Nov 2011 18:33:18 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] x11-common: Change drive mode of Xfbdev when xserver using framebuffer
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
X-List-Received-Date: Wed, 30 Nov 2011 10:43:15 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The previous mode of starting X is as follow:
$Xfbdev :0 -keybd keyboard -mouse tslib
This mode cause that some keys can't be mapped rightly. \
for example "Down" have the same function with "Enter".

another drive mode "evdev" can work rightly in new version.
$Xfbdev :0 -keybd evdev,,device=/dev/input/event0 -mouse tslib

So I select drive mode "evdev".

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../x11-common/x11-common/etc/X11/Xserver          |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
index 57923e6..736cd6d 100644
--- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
+++ b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
@@ -28,11 +28,13 @@ module_id() {
 
 ARGS=" -br -pn"
 
+KD_DRIVE_KEYBOARD="-keybd keyboard"
+KD_DRIVE_EVDEV="-keybd evdev,,device=/dev/input/event0"
 if [ "$XSERVER" != "/usr/bin/Xorg" ]; then
 
         . /etc/formfactor/config
 
-        ARGS="$ARGS -keybd keyboard"
+        ARGS="$ARGS $KD_DRIVE_EVDEV"
 
         # use usb mouse if present
         if [ -z "$TSLIB_TSDEVICE" ] && [ -e /dev/input/mice ]; then
-- 
1.7.0.4



