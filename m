Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F5206FA5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 02:39:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4R2dSSZ029828
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 19:39:28 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 19:39:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 May 2014 22:15:14 -0400
Message-ID: <c1187468913f63dc08aaed43588d10372f2dce38.1401154976.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1401154976.git.liezhi.yang@windriver.com>
References: <cover.1401154976.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] consolekit: fix console-kit-log-system-start.service startup
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
X-List-Received-Date: Tue, 27 May 2014 02:39:29 -0000
Content-Type: text/plain

From: Jonathan Liu <net147@gmail.com>

console-kit-log-system-start.service fails to to start if the
/var/log/ConsoleKit directory does not exist. Normally it is created
automatically but as we mount a tmpfs at /var/log, we need to add
a tmpfiles.d entry to create it.

(From OE-Core master rev: 2a9a14bf400fe0c263c58aa85b02aba7311b1328)

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.6.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 63da028..ac5c37f 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -37,6 +37,12 @@ FILES_pam-plugin-ck-connector += "${base_libdir}/security/*.so"
 RDEPENDS_pam-plugin-ck-connector += "${PN}"
 
 do_install_append() {
+	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d ${localstatedir}/log/ConsoleKit - - - -" \
+			> ${D}${sysconfdir}/tmpfiles.d/consolekit.conf
+	fi
+
 	# Remove /var/run from package as console-kit-daemon will populate it on startup
 	rm -fr "${D}${localstatedir}/run"
 }
-- 
1.7.10.4


