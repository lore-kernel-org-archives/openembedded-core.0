Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id E253F758D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:35:23 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so108150581wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 07:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6HYLgA3WQrzqJHvQPjdjxVHVm6ZMy0q0p1o3tCJavGM=;
	b=lG+6SnaXDxT/VBtNZM8vVncEwRa7/Uh0LRSb+jhCBb9WK+qPMhloLOTyWl/PCeoqWq
	DEetycMy1aQAXs19FuKsrVHoypTFWPJA4yaFkLClztzOCY6NAJ/EqaPrFXkIh7d6/TjC
	qbsTCMeRXoMZqaVnOzXIfTA5HM2ieP+muXmCsIt0rpjS+stV774HfHres2kpVmnJJ2J7
	5clQKzN2Z6B8Ore+b//SrYkT9dFhpXLHGOGpASBOfZJiWcdvA80F/YxcX+DWjU0nKAWl
	3hlAASxyC4B2PBZ83ZCoh27UQKykuzADT3cHiz9B5w/B6g2regBfZpQGT5DqCPxJJRQQ
	IXrQ==
X-Gm-Message-State: ALoCoQl6r2VprTYu8mo5pBN11Mfo9Sq5ykkErYhMRY3iSl4zoOICc2YAu5pN9gfn6WqQDrL83hbA
X-Received: by 10.194.5.4 with SMTP id o4mr52674730wjo.51.1435070124606;
	Tue, 23 Jun 2015 07:35:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id z9sm12982900wiv.9.2015.06.23.07.35.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Jun 2015 07:35:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 15:30:05 +0100
Message-Id: <1435069807-13557-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
References: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/6] bluez5: fix lib/libexecdir confusion
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
X-List-Received-Date: Tue, 23 Jun 2015 14:35:24 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index ae9402f..0fe5be5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -66,13 +66,13 @@ ALLOW_EMPTY_libasound-module-bluez = "1"
 PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
+FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
   ${libdir}/alsa-lib/*.la \
 "
 
-FILES_${PN}-obex = "${libdir}/bluez5/bluetooth/obexd \
+FILES_${PN}-obex = "${libexecdir}/bluetooth/obexd \
                     ${exec_prefix}/lib/systemd/user/obex.service \
                     ${datadir}/dbus-1/services/org.bluez.obex.service \
                    "
@@ -91,7 +91,7 @@ def get_noinst_tools_paths (d, bb, tools):
 FILES_${PN}-noinst-tools = "${@get_noinst_tools_paths(d, bb, d.getVar('NOINST_TOOLS', True))}"
 
 FILES_${PN}-dbg += "\
-  ${libdir}/${BPN}/bluetooth/.debug \
+  ${libexecdir}/bluetooth/.debug \
   ${libdir}/bluetooth/plugins/.debug \
   ${libdir}/*/.debug \
   */udev/.debug \
-- 
2.1.4


