Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 03C8B77BB1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:36:30 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id a140so8556393ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7NlzUohMTHk0ca0mja0fzJM5eYh/4qqJL7CFYwMVOec=;
	b=xn7/IxXDuHNY21eg6tfVEq1BEe9qguNa71h5xxd5ZCFh3HgUZwyONMh1qxrDhlchiF
	6rmP/kccVdyUT9TL9Q09sbWbglRyGzdDgQy6IYPJ3XF3CxweEp1qHLPwNQ60PAKTVE4V
	LgqrRq5kflKXXjcBlBzKYG7Nsz+56kAu6711XZ+92sCUcfGNdTv4rqv3Ny9oM7/ExrIA
	054g2ERumibk61AWiHYu5iDaQtdnPXmJy0WnM2th6XI9Vqfi6jgSOvWlaDgCunlNeThh
	hp8MKL7Pn3w5HkLqef8InZfGV1qZ61Jo3NWhSEDE1OldEzUUYcz+bij8BvbP8jxhN/hj
	cf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7NlzUohMTHk0ca0mja0fzJM5eYh/4qqJL7CFYwMVOec=;
	b=OFZJlcC52eie4jeX8I5UrootLamJvVcqTxJc4iCgtA6R3bdiaN/HVDJ+Pz8ZQ6wJIR
	For6HVY8B6Sn0UqW6THnKWoYH27j2wSDgqC86WouHlYYEsUlQ2HTLgMA+c58YkwMwFnm
	Sk84t3UBfEU4ErdnjZ2OmGh6L8fR1nNOgYr8DwLvzZ8mg42r5qT4hCDPLzSnKJJLU56F
	C7aOl5yCY/9Vpc4o7l5xpY4FKl5CGSAlHj+tbcGX+Sckph4QpXGYQPtbUlFvnywiyewx
	q3W2WUHjH8TV0qqQRmXpX/IsL9YrBvwvQeM2gadT0B3/wVflLVDJOzObOIEP3X6NqPK6
	ZCbQ==
X-Gm-Message-State: AFeK/H3KkH+ZF1H/0LhHXKZ7eEOpb+dTYQID7/06+BYYgRC+Kow5K644IpwHIYYGLia/W4tA
X-Received: by 10.36.123.16 with SMTP id q16mr15887675itc.52.1491399391605;
	Wed, 05 Apr 2017 06:36:31 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E12B.dip0.t-ipconnect.de.
	[93.232.225.43]) by smtp.gmail.com with ESMTPSA id
	l129sm13211911ite.1.2017.04.05.06.36.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 06:36:30 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 15:36:06 +0200
Message-Id: <b57ac90f02f18be863551ed630acc2d8007a0ffd.1491399200.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
References: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 3/3] yocto-compat-layer: include bitbake-diffsigs output
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
X-List-Received-Date: Wed, 05 Apr 2017 13:36:31 -0000

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
 scripts/lib/compatlayer/cases/common.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index b91da9b..d909d5b 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -76,4 +76,14 @@ class CommonCompatLayer(OECompatLayerTestCase):
                        (self.tc.layer['name'], len(sig_diff)))
             for diff in sorted(sig_diff_filtered):
                 msg.append('   %s: %s -> %s' % diff)
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
             self.assertTrue(False, '\n'.join(msg))
-- 
git-series 0.9.1

