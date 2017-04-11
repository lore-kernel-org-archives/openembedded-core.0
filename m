Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 718BE77BF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:57:19 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id a103so5192383ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LP4LS6fhYGdF3udrh9C1i4Lj/9bvVh7jvucx/9dVB6k=;
	b=HN00imDGHz5FUyrXnHUnEBuFMzm1LDFeYy4YU2p/bKaY9MB5CROGk4lZ9nk4OBcDEs
	m4uYRDSXvEknMlTkelaS/zpI+NeANcjQvYk1DslrDF4DGrdvGiFNKrGb0Q1VjtV2n/3q
	E8seEAbLOTRolCcOdatzq5cHwXkpQrblWn25s4UBZWRZ8CZzNG0vtWThLtVUEzX+/gJ3
	1gooz7J2gibB4lyZYIAMJ9rr+F1jotDJA/7O04DVoHoUVDGHqVDIjEyEUAmc/hB3f+TV
	J8eme2aCx7zqfbcE6rzLwkOrZXriV6rpegCpJ1jnIlWHGCCPfUMGqgOYZ8gZTMYmqZCr
	LqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LP4LS6fhYGdF3udrh9C1i4Lj/9bvVh7jvucx/9dVB6k=;
	b=KiOCot6Vji04+r2UbdIXxek/TS91RfQU7zFfbSVDVXGKcGTB2+ZDWolT/SoS6Aw3Yr
	/ICh2eAw07s+66eNv1S0fVPxV/xy1Q3CkGx4AUY3Xj19LCOda+qNWNTbYruzXgMw6r/p
	JBmNJxtpyc/ViVX3sgoG7Az78ktN8l0s8rctB1Y7dIx0AZAfXQaW3JO6SbflxrHsfX81
	XaGc7vahGORo2glpr4s3jBzHlCzj2WdeQsYh0IRz15CLMJGtay9ZpKKFKtiUW5194LiY
	gdFV2QZK2qk7lMeJgIR5/Q2rcrRalcgJBsVN1rGy6JTVsB5So3ZvCjhlna1PDq1GwxM/
	WDGw==
X-Gm-Message-State: AN3rC/7N6xAMSLUBWoIs7/ADGuzd93YNX7uhXePgT+mDyffZYfLxV+Ke
	ATkzMKYmS9asQTtdXIk=
X-Received: by 10.36.47.142 with SMTP id j136mr17590799itj.29.1491922639166;
	Tue, 11 Apr 2017 07:57:19 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162])
	by smtp.gmail.com with ESMTPSA id 71sm8025298iof.29.2017.04.11.07.57.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 07:57:18 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 16:56:57 +0200
Message-Id: <ca4db4d697218007fb9258590b9f745abb4b3072.1491922350.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 4/8] yocto-compat-layer: include bitbake-diffsigs output
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
X-List-Received-Date: Tue, 11 Apr 2017 14:57:19 -0000

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

