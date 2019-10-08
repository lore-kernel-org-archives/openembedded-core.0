Return-Path: <phong@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69FE560557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:37:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x98FbcAc027877
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Oct 2019 08:37:38 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 8 Oct 2019 08:37:37 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21010)	id 62DCF2004B;
	Tue,  8 Oct 2019 11:37:37 -0400 (EDT)
From: Peiran Hong <peiran.hong@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Oct 2019 11:33:31 -0400
Message-ID: <20191008153331.19195-1-peiran.hong@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] dbus: Change path of system_bus_socket from /var/run/dbus/ to /run/dbus/
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
X-List-Received-Date: Tue, 08 Oct 2019 15:37:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixed a warning message during startup caused by referencing the legacy
directory /var/run instead of /run. An extra parameter is passed to the
configure script to achiveve this. Upstream cannot provide a fix due to
another Linux distribution (Slackware) uses /var/run and /run as
different directories.

Refer to https://gitlab.freedesktop.org/dbus/dbus/issues/282 for
details.

Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
---
 meta/recipes-core/dbus/dbus_1.12.16.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus_1.12.16.bb b/meta/recipes-core/dbus/dbus_1.12.16.bb
index 05716608b0..f4fec2365c 100644
--- a/meta/recipes-core/dbus/dbus_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.16.bb
@@ -92,11 +92,13 @@ pkg_postinst_dbus() {
 	fi
 }
 
+
 EXTRA_OECONF = "--disable-tests \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --enable-largefile \
+                --with-system-socket=/run/dbus/system_bus_socket \
                 "
 
 EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
-- 
2.21.0


