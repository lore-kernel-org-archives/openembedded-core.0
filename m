Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 73E966FBB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 05:55:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9A5t9n0024511
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Oct 2014 22:55:09 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 9 Oct 2014 22:55:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Oct 2014 22:55:07 -0700
Message-ID: <83d0db4cdaf85a1d21725e229c1e0b1a84eee4f3.1412920464.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1412920464.git.liezhi.yang@windriver.com>
References: <cover.1412920464.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] wpa-supplicant: fix for rebuild
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
X-List-Received-Date: Fri, 10 Oct 2014 05:55:10 -0000
Content-Type: text/plain

Fixed when rebuild:
make: *** No rule to make target `/path/to/old//sysroots/qemux86-64/usr/lib/dbus-1.0/include/dbus/dbus-arch-deps.h', needed by `dbus/dbus_old.o'.  Stop.

The .d files save the path of the dependencies files which may not exist
when rebuild, we can remove them to make the rebuild work.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../wpa-supplicant/wpa-supplicant.inc              |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 3a1cce0..7923bb9 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -50,6 +50,8 @@ do_configure () {
         	sed -i "s/%ssl%/$ssl/" wpa_supplicant/.config
 	fi
 
+	# For rebuild
+	rm -f wpa_supplicant/*.d wpa_supplicant/dbus/*.d
 }
 
 export EXTRA_CFLAGS = "${CFLAGS}"
-- 
1.7.9.5


