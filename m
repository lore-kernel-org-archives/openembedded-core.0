Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id CFFFB7070E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 21:15:27 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id z107so2840376qgd.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 14:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=trFMGNzRTSuDh44GWvFulF/tcKULECn06v1oBDUOsCk=;
	b=d06XxK+VrJsW4Eux9D6PAJGUS/APDA6/7z8uLlkGAQI3edF/0SJAFBlc53Ux0iflal
	ul2bwJ5EbgZaVgg7247/3VCxmh01SAI/gmzd+YDa+H5rlyim7iZbYZFKxcJUGBZR9poL
	cOvhnb6nIBpr3A6oat4Sua6lTU51b/U+wUfRff2r7vAADcWHhYBwb/M2qDB00dObDo5i
	QDJOUqvHPpMAj8Ws3WxkZ6GO8gJq80m28NC+7scCU+phzHq+J+sAWqNUyD3Y0MjLAgVC
	mzuGDkKD3Q5PwvCSRplRjL2kBdWaXh9T7YiEMrALIWmxcrhp/3f2t7qvS2X/3UrEfodm
	iPDw==
MIME-Version: 1.0
X-Received: by 10.140.83.17 with SMTP id i17mr20715016qgd.16.1409346928422;
	Fri, 29 Aug 2014 14:15:28 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Fri, 29 Aug 2014 14:15:28 -0700 (PDT)
Date: Fri, 29 Aug 2014 15:15:28 -0600
Message-ID: <CACS+7ZT0kbHCbkQadiMqmGpvkbVr3YaGp7HXamYdo-uQewx7Jw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/5] xserver-nodm-init: Only start in runlevel 5
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
X-List-Received-Date: Fri, 29 Aug 2014 21:15:28 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Runlevel 3 is often multi-user without X, so don't start the X
server in runlevel 3. This allows one to start up a machine without
X running from the bootloader.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-graphics/x11-common/xserver-nodm-init.bb           | 2 +-
 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index 0a16ff5..b68d40e 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -47,6 +47,6 @@ do_install() {
 RDEPENDS_${PN} = "${@base_conditional('ROOTLESS_X', '1',
'xuser-account', '', d)}"

 INITSCRIPT_NAME = "xserver-nodm"
-INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
+INITSCRIPT_PARAMS = "start 9 5 . stop 20 0 1 2 3 6 ."
 SYSTEMD_SERVICE_${PN} = "xserver-nodm.service"

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index f6692a8..ef6c11c 100755
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
@@ -4,8 +4,8 @@
 # Provides: xserver
 # Required-Start: $local_fs $remote_fs dbus
 # Required-Stop: $local_fs $remote_fs
-# Default-Start:     2 5
-# Default-Stop:      0 1 6
+# Default-Start:     5
+# Default-Stop:      0 1 2 3 6
 ### END INIT INFO

 killproc() {            # kill the named process(es)
-- 
1.9.3

