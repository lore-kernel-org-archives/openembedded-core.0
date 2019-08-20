Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25A2E7ECB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 09:06:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7K96NJL016835
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 02:06:23 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 20 Aug 2019 02:06:23 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2019 05:05:59 -0400
Message-ID: <20190820090559.196193-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190820090559.196193-1-kai.kang@windriver.com>
References: <20190820090559.196193-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] adwaita-icon-theme: workaround for do_populate_sysroot failure
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
X-List-Received-Date: Tue, 20 Aug 2019 09:06:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to run task do_populate_sysroot of adwaita-icon-theme rarely:

| DEBUG: Executing shell function sysroot_stage_all
| cpio: ./icons/Adwaita/16x16/legacy/_inst.21134_: Cannot stat: No such
  file or directory

In script ${S}/install-sh, temporary files _inst.* are created and will be
removed by shell builtin command trap when the script exits:

    # Make a couple of temp file names in the proper directory.
    dsttmp=${dstdirslash}_inst.$$_
    rmtmp=${dstdirslash}_rm.$$_

    # Trap to clean up those temp files at exit.
    trap 'ret=$?; rm -f "$dsttmp" "$rmtmp" && exit $ret' 0

The temporary files should be deleted already after task do_install. But
somehow they are still exist until the gap between commands find and
cpio in populate_sysroot function sysroot_stage_dir().

Remove the temporary files explicitly to avoid such issues.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
index 02676f4401..2f999222dc 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
@@ -19,6 +19,11 @@ SRC_URI[sha256sum] = "698db6e407bb987baec736c6a30216dfc0317e3ca2403c7adf3a5aa46c
 
 DEPENDS += "librsvg-native"
 
+do_install_append () {
+    # remove temp files explicitly
+    find ${D} \( -name _inst.* -o -name _rm.* \) -delete
+}
+
 PACKAGES = "${PN}-cursors ${PN}-symbolic-hires ${PN}-symbolic ${PN}-hires ${PN}"
 
 RREPLACES_${PN} = "gnome-icon-theme"
-- 
2.20.0


