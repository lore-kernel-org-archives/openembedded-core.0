Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9E28762252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:24 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id z2so2494789wiv.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Vz5SIpVNzpuF5v9dXDZ/gK6JnOj+C/xl4egg7AT5yTo=;
	b=QO/ghuc2XIPOWxlNeKW3KiCTg4SOVWA3rbOE4qu/7cfpS4qq4AI1XWMIAmbnn6UrzU
	szb7/kApeeGiqoY1gLNGmX8b0PPzBuIEsydyD024dUmKyOuDt8FJ/NiMhnzixmaxAjG4
	7/7fz5yjPVYDO2bBPKHoyxo+ef3LvQ7ULymQPRtQlWkGkwhfM1NSFZVA+6nh/5Hg6YjJ
	CoiBHfWneqhtpyiz2VoXF8ztVbEHw0x+Nr2NKzJvgY3Ty9PMeh1Vlg9MbBOHHk4JQfXR
	dwBHL9foht2jMpjnQUAg2zfaPynv7/KaT4bOqKCzNOBMmWj9GojtrCBoS6OZGpIMrJLu
	y0fw==
X-Gm-Message-State: ALoCoQlEUpjTg/0ZD1YZTUdpLE5R7pExF62caA5nXAtSSgJiZK1ukYotL6fi0nGQEV1swIFFDsHN
X-Received: by 10.194.19.165 with SMTP id g5mr34462484wje.65.1410177565562;
	Mon, 08 Sep 2014 04:59:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:44 +0100
Message-Id: <0d89eb7181ce4f386f585597b9f04e786b759434.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 26/27] qemu.bbclass: add -r ${OLDEST_KERNEL} parameter
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:25 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* in some cases (e.g. with external toolchain which doesn't respect our
  reasonably old version set in OLDEST_KERNEL) it's possible to have libc
  which requires newer kernel than what we have on builders, qemu supports
  -r param to use different uname than what's returned by host system.
* change qemu_run_binary to pass -r ${OLDEST_KERNEL} and add the same to
  QEMU_OPTIONS which are used by qemuwrapper-cross
* maybe we should eventually convert all qemu_run_binary usages always include
  qemuwrapper-cross dependency and always call qemu through that (it
  seems very strange that qemu_target_binary is called from qemuwrapper
  and for allarch recipes it can return qemu-allarch as qemu binary).

  qemu_run_binary is used by:
  meta/classes/gtk-immodules-cache.bbclass:            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-$maj_ver.0')} \
  meta/classes/qemu.bbclass:def qemu_run_binary(data, rootfs_path, binary):
  meta/recipes-core/systemd/systemd_213.bb:         ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
  meta/recipes-graphics/pango/pango.inc:    ${@qemu_run_binary(d, '$D','${bindir}/${MLPREFIX}pango-querymodules')} \

  and qemuwrapper directly by:
  scripts/postinst-intercepts/update_font_cache:PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
  scripts/postinst-intercepts/update_pixbuf_cache:PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/qemu.bbclass |   25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index abee8aa..b2cf85d 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -29,19 +29,20 @@ def qemu_run_binary(data, rootfs_path, binary):
 
     libdir = rootfs_path + data.getVar("libdir", False)
     base_libdir = rootfs_path + data.getVar("base_libdir", False)
+    oldest_kernel = data.getVar("OLDEST_KERNEL", True)
 
-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -L " + rootfs_path\
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -r " + oldest_kernel + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=" + libdir + ":" + base_libdir + " "\
             + rootfs_path + binary
 
-QEMU_OPTIONS = ""
-QEMU_OPTIONS_iwmmxt    = "-cpu pxa270-c5"
-QEMU_OPTIONS_armv6     = "-cpu arm1136"
-QEMU_OPTIONS_armv7a    = "-cpu cortex-a8"
-QEMU_OPTIONS_e500v2    = "-cpu e500v2"
-QEMU_OPTIONS_e500mc    = "-cpu e500mc"
-QEMU_OPTIONS_e5500     = "-cpu e5500"
-QEMU_OPTIONS_e5500-64b = "-cpu e5500"
-QEMU_OPTIONS_e6500     = "-cpu e6500"
-QEMU_OPTIONS_e6500-64b = "-cpu e6500"
-QEMU_OPTIONS_ppc7400   = "-cpu 7400"
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL}"
+QEMU_OPTIONS_append_iwmmxt    = " -cpu pxa270-c5"
+QEMU_OPTIONS_append_armv6     = " -cpu arm1136"
+QEMU_OPTIONS_append_armv7a    = " -cpu cortex-a8"
+QEMU_OPTIONS_append_e500v2    = " -cpu e500v2"
+QEMU_OPTIONS_append_e500mc    = " -cpu e500mc"
+QEMU_OPTIONS_append_e5500     = " -cpu e5500"
+QEMU_OPTIONS_append_e5500-64b = " -cpu e5500"
+QEMU_OPTIONS_append_e6500     = " -cpu e6500"
+QEMU_OPTIONS_append_e6500-64b = " -cpu e6500"
+QEMU_OPTIONS_append_ppc7400   = " -cpu 7400"
-- 
1.7.10.4


