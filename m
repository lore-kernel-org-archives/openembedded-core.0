Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1753477CFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:39:03 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id t68so15802800iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 11:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LP4LS6fhYGdF3udrh9C1i4Lj/9bvVh7jvucx/9dVB6k=;
	b=QQaWk5uDZ7Z0KOskKO8Mhrw1sbWnIrjTjZcN8uwlxqdTJMpbsRZ0YSZNO2crsEyKqc
	JDuYbU2t/t3Dq6G006KMzNapZhXYY6Zj0uQErHpny9l/xQfOK9xHhJ9yfdZr8H+i09GY
	WOWQ2pZxpMMNhGnteZCZTghVPMdylJIozVMkiZvMzUXXhTR2xfudNQuC4s4yZZBOJIr2
	hOCM27lVkeKc//CB5SbSoajfuaGmlIZ9eBc1tIVDZgOTxfsWbI1llXpD5p3vkVruKnZ9
	SqFL0p61MwjJPsZnFayzcgPUIpJkp42bWc1G4ATMnlXcO2JKoxP5opAvahuZSoT0eWx4
	FfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LP4LS6fhYGdF3udrh9C1i4Lj/9bvVh7jvucx/9dVB6k=;
	b=FG7xvi5wyKmeDwilW/zKAL9EYSHJRd0EBMuQgdChmyBvzkcHtJaRM/TQJqnMr6jtnt
	WRVp1TP3c0DpboDPt+4JQn/rQbtNXsmk/WK2RT7BbV/TZfPOgcpP+JOCqSHbjVqYu9d1
	N8697OMwoqG7LGpVW6PpPhkp+JYeVa61dY78yk2zGNmzVoPXffLp1iMTdoSU6+QIyCFq
	wQOMK0v2sEH3QYDzH6F5lMvHZkcVMRg/DK1W+Jg/XbObA3zQUUU7gVYPbGHpeZlxc/qg
	u0QyjTj/9PbiKYajhQ99KWmsTNQ2vA/QWM2Kb+zvPcD6LVs36DbK2vhFQQD49BC0AD8M
	ZriA==
X-Gm-Message-State: AFeK/H1fwTD8rWYjiLp5Ly7IAzFxkHBoytAJyZ918ghZshb2TxYFZJb8EwrutICzz6Y9q1ev
X-Received: by 10.107.30.67 with SMTP id e64mr59581911ioe.54.1491935945097;
	Tue, 11 Apr 2017 11:39:05 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162]) by smtp.gmail.com with ESMTPSA id
	m63sm8260499ioa.15.2017.04.11.11.39.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 11:39:04 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 20:38:39 +0200
Message-Id: <d4cd4ba7378e81dc90754277202dfd379e4f09b8.1491935802.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
References: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 4/8] yocto-compat-layer: include bitbake-diffsigs output
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
X-List-Received-Date: Tue, 11 Apr 2017 18:39:04 -0000

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
 scripts/lib/compatlayer/cases/common.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index b91da9b..a4c2a51 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -75,5 +75,17 @@ class CommonCompatLayer(OECompatLayerTestCase):
             msg.append('Layer %s changed %d signatures, initial differences (first hash without, second with layer):' %
                        (self.tc.layer['name'], len(sig_diff)))
             for diff in sorted(sig_diff_filtered):
+                recipe, taskname = diff[0].rsplit(':', 1)
+                cmd = 'bitbake-diffsigs --task %s %s --signature %s %s' % \
+                      (recipe, taskname, diff[1], diff[2])
                 msg.append('   %s: %s -> %s' % diff)
-            self.assertTrue(False, '\n'.join(msg))
+                msg.append('      %s' % cmd)
+                try:
+                    output = check_command('Determining signature difference failed.',
+                                           cmd).decode('utf-8')
+                except RuntimeError as error:
+                    output = str(error)
+                if output:
+                    msg.extend(['      ' + line for line in output.splitlines()])
+                    msg.append('')
+            self.fail('\n'.join(msg))
-- 
git-series 0.9.1

