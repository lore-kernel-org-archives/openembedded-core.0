Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D9FBF6011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 18:22:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3HILsoP026512
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Apr 2019 11:22:04 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 17 Apr 2019 11:21:43 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <ross.burton@intel.com>, <changqing.li@windriver.com>
Date: Wed, 17 Apr 2019 14:21:37 -0400
Message-ID: <1555525297-26931-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LYTPzM_YPZJ4AH1uwbGE0vMRYqX-VFaS4cqsG3H9SHvUg@mail.gmail.com>
References: <CAJTo0LYTPzM_YPZJ4AH1uwbGE0vMRYqX-VFaS4cqsG3H9SHvUg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] xfconf: fix 'Failed to get connection to xfconfd' during do_rootfs
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
X-List-Received-Date: Wed, 17 Apr 2019 18:22:31 -0000
Content-Type: text/plain

Packages such as gdk-pixbuf can result in the following error during
the rootfs construction:
  CRITICAL **: 16:51:57.223: Failed to get connection to xfconfd: Cannot autolaunch D-Bus without X11 $DISPLAY

This is hit during the postinst-intercepts/update_pixbuf_cache.

Based on discussions upstream this appears to be an issue for xfconf
and has an upstream update

https://git.xfce.org/xfce/xfconf/commit?id=6f11cc65a2213f424728b5a0d25b1b63c19e773e

Drawing from this change we can go ahead and use PACKAGECONFIG to
emulate it.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

Guys,

This is still broken in Yocto and I would like to see it fixed. I haven't
dug into the issue as much as you two so I wanted to float this fix
out there but hold back from calling it a proper fix. Please let
me know what you think or feel free to take this, evaluate it and
modify it into a full fledged fix.

MarkA


 meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
index 2667ff9..22a7bc1 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
@@ -16,3 +16,5 @@ FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
 
 FILES_${PN}-dev += "${libdir}/gio/modules/libxfconfgsettingsbackend.la"
+
+PACKAGECONFIG[gsettings-backend] = ",--disable-gsettings-backend,"
-- 
2.7.4


