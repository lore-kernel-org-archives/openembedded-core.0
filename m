Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZTSU-0003Vs-8m
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 22:56:02 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 May 2012 13:44:16 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so2991809wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=yDIa68XL6EqdyTbjS893dfY8QhEzwj2slwMKf7L/Jz8=;
	b=czWG/T2kRXJsc0xTKKe9yGRQ/OF+tp694SO5BU6Je7daAUOVbT+qGcMPP3blBVscYk
	pjhrJJbRZNujc93Ff3LBueHG7RY3uReCCXfQ0HhYwf1CuaWQD7aOud1HIy9oi/pmx6jo
	i+K/To5pwHWEyzXEB6N83G5hnjEUYdD/3jlFNHRpJvnGDSD1K0hwaeZmKoiyvsjuSfpR
	3nnBU4OYwJ0ByaXw7h/ExzE42Lbav39/RdUQ8NoaX2LSV2mNMUoBGaZxGlURtpd73Jrm
	YmvfO8ou2FRvq1DF/vlkZz2xqd/hin9NxX3yiydpZsWtR6K31T7mvdAKB5Va4BG90F4E
	qpLw==
Received: by 10.216.193.129 with SMTP id k1mr8165104wen.201.1338324256754;
	Tue, 29 May 2012 13:44:16 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	fm1sm30464662wib.10.2012.05.29.13.44.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 13:44:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2012 21:43:54 +0100
Message-Id: <e50f2bf59b64accf580fc2df96e1fbc9eb6cfb98.1338323483.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1338323483.git.ross.burton@intel.com>
References: <cover.1338323483.git.ross.burton@intel.com>
In-Reply-To: <cover.1338323483.git.ross.burton@intel.com>
References: <cover.1338323483.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmubQUQKCyZ8N8X67XXzgEBwd1ZtyFpdwaFs4A+J2hDTav8pUmR+xamwfg9oCe0qIFTWB/7
Subject: [PATCH 1/4] connman: just give xuser the extra rights it needs
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
X-List-Received-Date: Tue, 29 May 2012 20:56:02 -0000

---
 .../connman/add_xuser_dbus_permission.patch        |   14 +++++---------
 1 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
index aa7a910..707b3ca 100644
--- a/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
+++ b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
@@ -1,24 +1,20 @@
-Some platform (like atom-pc) enables rootless X,
-thus we need to add the xuser in the list.
+Because Poky doesn't support at_console we need to special-case the session
+user.
 
 Upstream-Status: Inappropriate [configuration]
 
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 diff --git a/src/connman-dbus.conf b/src/connman-dbus.conf
-index 98a773e..cbe2ba3 100644
+index 98a773e..466809c 100644
 --- a/src/connman-dbus.conf
 +++ b/src/connman-dbus.conf
-@@ -8,6 +8,13 @@
+@@ -8,6 +8,9 @@
          <allow send_interface="net.connman.Counter"/>
          <allow send_interface="net.connman.Notification"/>
      </policy>
 +    <policy user="xuser">
-+        <allow own="net.connman"/>
 +        <allow send_destination="net.connman"/>
-+        <allow send_interface="net.connman.Agent"/>
-+        <allow send_interface="net.connman.Counter"/>
-+        <allow send_interface="net.connman.Notification"/>
 +    </policy>
      <policy at_console="true">
          <allow send_destination="net.connman"/>
-- 
1.7.7.6



