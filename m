Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXOK-00079O-4C
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:35 +0100
Received: by mail-wi0-f173.google.com with SMTP id ez12so1212041wid.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=6RsAi9ZIMwc4buMk/hTyRz1jHit9JBwxv/fs7MwPf24=;
	b=G9Tyk0VHuj0bPTdi1SL+d1PUQFe3zwq0iXaYmO+Vl/e1U5tDr5z2MdDhoTVmMSZmIm
	tb8HrIdwUHf9VBKQxHqJIKxt/tJDdaaxi5o2xSuxP1DBy75zcwbPRlNUvnlN06mF9QPY
	lGkDwEkyqdkJBZG85r2S1YzFkO74G72GcscAQbhbKPEfHOYhTgJBeN8QgKoEMdX8tIH1
	u0WKDnQ+dejuhXrxmKp9XvnWucBBhxh+HKNfBv1TBVT1RRVbQbBMb9jnslW+Ucn91PB3
	xIclwX9GsYBdaFcZ8R/DllV/Js0OpEWKNzrwJCqEauG4ETsiRxFBHf4qTKKOXtextklW
	2seA==
X-Received: by 10.194.89.234 with SMTP id br10mr15814451wjb.43.1364316812511; 
	Tue, 26 Mar 2013 09:53:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:20 +0000
Message-Id: <c923eb2b2240ffd057a7777dea6cbc241c807a97.1364316412.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlZOQlhwC8r4PUR70fk/MoRkFEgdwNj51SNsgww70fLsgW0n3PVYnnB329lf/OZkaWjQMDo
Subject: [PATCH 22/24] dbus: explicitly disable systemd when no systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 17:10:42 -0000

If systemd isn't a distro feature, explicitly disable the systemd unit path
check as otherwise it will search the sysroot.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index affffbc..c64084f 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -68,8 +68,8 @@ pkg_postinst_dbus() {
 EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
 EXTRA_OECONF_X_class-native = "--without-x --disable-x11-autolaunch"
 # TODO: would like to --enable-systemd but that's a circular build-dependency
-# between systemd <->dbus
-EXTRA_OECONF_SYSTEMD = "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '', d)}"
+# between systemd<->dbus
+EXTRA_OECONF_SYSTEMD = "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
 EXTRA_OECONF = "--disable-tests \
                 --disable-checks \
-- 
1.7.10.4



