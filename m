Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5197977DF9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 16:38:34 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id t68so19346598iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 09:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=axIHVCEmHB7lGjXCHAC8jPehdfDGfGZsE4Mm2tbFAMs=;
	b=Zo0bGuaorcF4q1iZP0vJBCAMDC7AJC2GNbFgbRXidIS8GYt2s7B/Sc/lru8zzF365w
	vD8s1XIz2obfLOF3SZt0pIzHYyaW9wNk785in2YEiHUS/HAamzWSU7YDfm4oWtvyL4Uc
	aJRcopdf++I2uxyNEdtWesaLDunat4GFHFkmAG20RbqU2StPmBc8PBWcQ8Q9v9YyUgrP
	64UwaOWfLqz+jr38AKvYRVGi64IAPyBZagTbC03MUr3ZC6Ll5tpmZjg53BvTOkQez3C/
	STfqE4UX67Po0WV3Cws8ztaX4Is9P2BcCJuVJRXoo15yE0DekmUFHF3Cm8D6vCrX3s+v
	KeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=axIHVCEmHB7lGjXCHAC8jPehdfDGfGZsE4Mm2tbFAMs=;
	b=s5hjSeryTJ928fJv7uWi/G1b5jtV/r37+JgMbkMm2ep6mSyVwCasDKEVkOkLYSvNK5
	CVVWWG5XNJWU8BoCv9sL4qRpRAn4a6O+0SDPePXzFEqJHQ+2cc0iR0vXQSWBo+Hpo2CQ
	eblM8x5DCkjoqRctD18+uHxO60ZpZ6Tb6ZWhbpUzLUoUDoVZDoC5JqWAzHeVoKSXlLaM
	EAlHCcBCe6WmN/+YKc78qRQ1UiAn44Sh+2qbwFnV57R+3uJjGsG1faIAyfhCgPHJl9QZ
	qsjURzXz0gFWS4mn9hLXdbG/wOnSVVtpm8rA6S4civfkMOZa/Nugo3dD6Fo0g+tUX6DI
	4kFQ==
X-Gm-Message-State: AN3rC/7DGD6mGhPr+xNG318sf8+YPXYthkMDffbTIXROizBKNs/nP+Ayox8KVCXWb8qQjUVK
X-Received: by 10.107.137.148 with SMTP id t20mr4665370ioi.79.1491583116006;
	Fri, 07 Apr 2017 09:38:36 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8EAD9.dip0.t-ipconnect.de.
	[93.232.234.217]) by smtp.gmail.com with ESMTPSA id
	n10sm11907916itg.8.2017.04.07.09.38.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Apr 2017 09:38:34 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 18:38:18 +0200
Message-Id: <515d24bcd8b23e5d94f18e042061efb7fbcd226a.1491583077.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.d48bda0d5a83909c959650e8872315be6a4162a7.1491583077.git-series.patrick.ohly@intel.com>
References: <cover.d48bda0d5a83909c959650e8872315be6a4162a7.1491583077.git-series.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 3/5] yocto-compat-layer: include bitbake-diffsigs output
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
X-List-Received-Date: Fri, 07 Apr 2017 16:38:35 -0000

After filtering out potential false positives, it becomes feasible to
include the output of bitbake-diffsigs for those tasks which
definitely have a change.

Depends on bitbake-diffsigs with the "--signature" parameter.

Enhanced output now is:

   AssertionError: False is not true : Layer meta-xxxx changed 120 signatures, initial differences (first hash without, second with layer):
      gstreamer1.0-plugins-base:do_fetch: 76973f19f2e30d282152bdd7e4efe5bb -> e6e7c6fa9f2bd59d7d8d107f7c6ca1ac
         Task dependencies changed from:
         ['PV', 'SRCREV', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]', 'base_do_fetch']
         to:
         ['GST_IMX_PATCHES_TO_APPEND', 'PV', 'SRCREV', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]', 'base_do_fetch']
         basehash changed from d679d30bd1ea41c56e57419b57587f3c to 090a79b45f5fa26d10f9d34e2ed7a1e6
            List of dependencies for variable SRC_URI changed from '{'PV', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]'}' to '{'GST_IMX_PATCHES_TO_APPEND', 'PV', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]'}'
         changed items: {'GST_IMX_PATCHES_TO_APPEND'}
         Dependency on variable GST_IMX_PATCHES_TO_APPEND was added
         Variable SRC_URI value changed:
         "     http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz     file://get-caps-from-src-pad-when-query-caps.patch     file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch     file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch     file://make-gio_unix_2_0-dependency-configurable.patch     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch     file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch     file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch     file://0003-riff-add-missing-include-directories-when-calling-in.patch     file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch [--] {+${GST_IMX_PATCHES_TO_APPEND}+}"

      pulseaudio:do_install: 6bb6fe23e11a6d5fef9c3a25e73e4f9c -> 3f54ea75673a792e307197cfa6ef2694
         basehash changed from ac4efcfa783bd04a5a98a2c38719aedd to 37679d99623a37c8df955da3a01415a5
         Variable do_install value changed:
         @@ -1,3 +1,7 @@
              autotools_do_install
           	install -d ${D}${sysconfdir}/default/volatiles
          	install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/volatiles.04_pulse
         +    if [ -e "${WORKDIR}/daemon.conf" ] && [ -e "${WORKDIR}/default.pa" ]; then
         +        install -m 0644 ${WORKDIR}/daemon.conf ${D}${sysconfdir}/pulse/daemon.conf
         +        install -m 0644 ${WORKDIR}/default.pa ${D}${sysconfdir}/pulse/default.pa
         +    fi

[YOCTO #11161]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/cases/common.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index b91da9b..6eb29c1 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -76,4 +76,14 @@ class CommonCompatLayer(OECompatLayerTestCase):
                        (self.tc.layer['name'], len(sig_diff)))
             for diff in sorted(sig_diff_filtered):
                 msg.append('   %s: %s -> %s' % diff)
-            self.assertTrue(False, '\n'.join(msg))
+                try:
+                    recipe, taskname = diff[0].rsplit(':', 1)
+                    output = check_command('Determining signature difference failed.',
+                                           'bitbake-diffsigs --task %s %s --signature %s %s' %
+                                           (recipe, taskname, diff[1], diff[2])).decode('utf-8')
+                except RuntimeError as error:
+                    output = str(error)
+                if output:
+                    msg.extend(['      ' + line for line in output.splitlines()])
+                    msg.append('')
+            self.fail('\n'.join(msg))
-- 
git-series 0.9.1

