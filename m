Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 69A2365FC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 02:03:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4R23wQ3020571
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 19:03:58 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 19:03:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 May 2014 21:39:46 -0400
Message-ID: <614584df9a2bf3580c77d8300c6eeccb66eff717.1401154373.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1401154373.git.liezhi.yang@windriver.com>
References: <cover.1401154373.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] dbus-native: dbus-native: do_compile failed on selinux.c on CentOS 5.10
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
X-List-Received-Date: Tue, 27 May 2014 02:03:59 -0000
Content-Type: text/plain

Found this error on CentOS 5.10, other distros may also has this
problem, I think that we can disable the selinux for dbus-native:

bus/selinux.c:327: error: array type has incomplete element type

[YOCTO #6374]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/dbus/dbus.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index b3d3834..33f2f22 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -85,6 +85,8 @@ EXTRA_OECONF = "--disable-tests \
                 --disable-libaudit \
                 --disable-systemd"
 
+EXTRA_OECONF_class-native = "--disable-selinux"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG_class-native = ""
-- 
1.7.10.4


