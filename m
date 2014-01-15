Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9520461FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 07:10:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0F7AF7T001548
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 23:10:15 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 14 Jan 2014 23:10:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jan 2014 15:10:14 +0800
Message-ID: <4975a4727b07aa321bb8d19429efc0796a115ecc.1389769773.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389769773.git.Qi.Chen@windriver.com>
References: <cover.1389769773.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] shutdown-desktop: use poweroff for the Exec field in the shutdown.desktop
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
X-List-Received-Date: Wed, 15 Jan 2014 07:10:14 -0000
Content-Type: text/plain

Use 'poweroff' instead of 'halt' for the Exec field in the shutdown.desktop.

The purpose of this patch is to make the 'shutdown' icon on on our sato
images work as expected for both sysvinit and systemd images. Previously,
the Exec field was 'halt'. The `halt' command could poweroff the system
in sysvinit images but it only could halt the system in systemd images.
The difference is due to the different implementations of the `halt' command.

In sysvinit, the `halt' command will effective execute `/sbin/init 0'. This
is for the compatibility with sysvinit 2.4, as stated in the comments of the
source code. In systemd, the `halt' command will effectively execute the
reboot(RB_HATL_SYSTEM).

As the 'shutdown' icon is expected to actually shutdown the system, we should
use poweroff instead of halt for its Exec field.

[YOCTO #4347]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../shutdown-desktop/shutdown.desktop              |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop b/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
index 2726889..99bee4c 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
@@ -3,7 +3,7 @@ Encoding=UTF-8
 Type=Application
 Name=Shutdown
 Comment=Close down the machine safely
-Exec=halt
+Exec=poweroff
 Icon=system-shutdown
 Terminal=false
 Categories=Utility;
-- 
1.7.9.5


