Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 181446ACB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 08:42:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9E8g6UU021916
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 01:42:06 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 14 Oct 2014 01:42:06 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Oct 2014 16:39:59 +0800
Message-ID: <be59231ba5c4dfafcb4d8e9951e8d10414ed0c64.1413275947.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413275947.git.Chong.Lu@windriver.com>
References: <cover.1413275947.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Tue, 14 Oct 2014 08:42:12 -0000
Content-Type: text/plain

The gconfd-2 will be called in org.gnome.GConf.service file and the path of
gconfd-2 is ${libexecdir}, this will get following error when multilib exported
in the sdk:
error: file /usr/share/dbus-1/services/org.gnome.GConf.service from install
of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
gconf-3.2.6-r0.0.x86_64

Changed ${libexecdir} to /usr/libexec to fix this issue.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 17fdafa..81dde74 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -19,6 +19,7 @@ SRC_URI[archive.sha256sum] = "1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e
 
 S = "${WORKDIR}/GConf-${PV}"
 
+libexecdir = "/usr/libexec"
 EXTRA_OECONF = "--enable-shared --disable-static --enable-debug=yes \
                 --disable-introspection --disable-orbit --with-openldap=no --disable-gtk"
 
-- 
1.9.1


