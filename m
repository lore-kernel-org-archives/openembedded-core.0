Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id E6AED65E45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 08:13:34 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so324926eek.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=pojjhOwotSfd4yP42mcdQDCo6PpuPAA9Q4lyo1POz7M=;
	b=sB8VNxa8xCIQz+6hlMWv4qAnDs7KlLN9fpM2gpYtifLhgZWy592TXLOtWnee+TwjBZ
	6mSaNW09brDeY7SNbxxSbyj6jfwxX7aETEJ+dh+o5moyGWEMTc1J8rv3XVklEEUKHozD
	bbc+n0btfIZQe4wNCFa8gPQQWDqU9BRNK03XSuSVpr5L3Xs9+HVdPASdG7+5c7DXAN4K
	YBz9yiQmWuLp/AszCUM70+uZ9/wE1wocRu9dXW8CUOJ5H+SsjYDs/pRbec4kdd7XP+rF
	90Tc9wV6nom2f12e7RoVs2VZoIBGbqRGqxOZdYnDzerruowAQsEm3TsBblK0u0j4dwlv
	leKQ==
X-Received: by 10.15.34.197 with SMTP id e45mr32252eev.112.1397722414551;
	Thu, 17 Apr 2014 01:13:34 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-162.unitymediagroup.de.
	[178.200.247.162]) by mx.google.com with ESMTPSA id
	t50sm65118253eev.28.2014.04.17.01.13.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Apr 2014 01:13:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Apr 2014 10:13:26 +0200
Message-Id: <1397722406-14830-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] make menuconfig work for recent xfce environment
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
X-List-Received-Date: Thu, 17 Apr 2014 08:13:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xfce terminal was renamed 'Terminal' -> 'xfce4-teminal' mainline end of 2012,
so the distros supporting 'Terminal' will dissapear. The distros not
mentionied in  __init__ do (e.g fedora 19 - tested) fail - or will fail
sooner or later.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/lib/oe/terminal.py | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index a33abd7..0a623c7 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -60,19 +60,9 @@ class Mate(XTerminal):
     priority = 2
 
 class Xfce(XTerminal):
-    command = 'Terminal -T "{title}" -e "{command}"'
+    command = 'xfce4-terminal -T "{title}" -e "{command}"'
     priority = 2
 
-    def __init__(self, command, title=None, env=None, d=None):
-        # Upstream binary name is Terminal but Debian/Ubuntu use
-        # xfce4-terminal to avoid possible(?) conflicts
-        distro = distro_name()
-        if distro == 'ubuntu' or distro == 'debian':
-            cmd = 'xfce4-terminal -T "{title}" -e "{command}"'
-        else:
-            cmd = command
-        XTerminal.__init__(self, cmd, title, env, d)
-
 class Konsole(XTerminal):
     command = 'konsole -T "{title}" -e {command}'
     priority = 2
-- 
1.8.3.1


