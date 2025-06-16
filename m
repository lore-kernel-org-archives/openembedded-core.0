Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA3CC7115F
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:50:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.26735.1750067409580993779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kRG1TBji;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4532ff4331cso10696965e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750067408; x=1750672208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqdAMnYVvaZy7QyYhtomIwEcGeBlaRlyo9siKTpizVQ=;
        b=kRG1TBjih97JmCnF4UsAYJQzbZG6Q0VHju7FBbmsz+lMubzimd20YctXKZbwwRdYcw
         hNEm8Ke21jPkxOX9c/ZWhXHEKu6GzHBHBTJdgul4In4SUI0Ywfk8gh4DqTsU3VFHm5vO
         GmrY84ljsXA5/HiR4dog3SuNhYSdPQz+AtQhpH7lV2gjTaT+XWLZY13Jk2OP2iW+Dppo
         Qi/ijnEz0jt7q2LEjgfTQIUPHLZOR/D3x9CrQeK/Qe5Qn3InKap3G/z3Wr410kI2WP3n
         Jt74KqMP2REcun9KndgzV7nI0/WyBhlVYqG6VJJBvYtXI24pvnDDuGzzSMMFN8qjnSl5
         W6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067408; x=1750672208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqdAMnYVvaZy7QyYhtomIwEcGeBlaRlyo9siKTpizVQ=;
        b=E/n/8qN1Mc7yxuR4pd6+Znf1ayWbwc4bqqYM8d0cNyNbros8+UtXZ5nKqMDk9JRmuQ
         cZq2auMQhFBxtQ1nG48xM+y3M7fewNLyRWqam2zM/xweEv3dknLFr7Kh4QAR72KnU+jL
         YahLhc+RjZ7dPk70H8DqwORlphqn24JviLZ94YnwRfXXf7Bu+DijJpY8AS/aTNU4i3h9
         POaL9WY339eqzOI6XvM3bwFsQ6dYnuB41sKMpIoG7/ZIHre052BCcMvAh19Eh9p88uC2
         Vf3h+WRbxjIAo8U5jxRIs8BcWxvjNVDtPjKuB7/lqGuprEWKw+bSxiLHor1lVJ7b8Dr+
         c02w==
X-Gm-Message-State: AOJu0YzdKjZEW/W6JHHhYmIyXgZ2n8j+fzfxVgTOWiVQPw2moJkH3FVz
	UJw5r/rwz8fMJBCLISMmmqenIACsKqOh/iiDOIDJHD/T7KsiQTz3apHzB42Vzg==
X-Gm-Gg: ASbGncsuaH7HNKkuUPeCCEXN3hIqpZyvKW74vdic484UfGA58c9gT8lDbJoG45cNt89
	tSbISEmLO28ffdHMIgXXQZ7blSm96rYRpOI/RYrzq1ZKdm9xGpbWWcCijR+WapG34jZ+lxgBM7R
	7Un8MQg/f3vrrct7mMxYi+rG++9SEPbTrtlvICdAEmTnwbkFz5iZpAKsOFzVEMh7xjQ/0OTDGqa
	5AZauOJcDzqkFMuD/PUDYlMncnOVqY7H/tEgx8qyIh5325aNVxpvOG8uk59+m7OO4K1PN7V5WbN
	GtkP8CjPplaCWb2YTwPubgW/MX0fsrNJcFzTDsMvNlPtDqXuhTjm/7abjP34DRYaDxipZXSKZMc
	UAD6hyKjzjmssRqwrrWrMFEk=
X-Google-Smtp-Source: AGHT+IElRbZaRN1qNxq7a82ONsxaAASBL8DjMCFt1iXrYGrdQGRTHB6cVdi8hD5+GboShOllMSyqlg==
X-Received: by 2002:a05:600c:6099:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-4533cadb4femr63276035e9.22.1750067406966;
        Mon, 16 Jun 2025 02:50:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fa7a9a8sm72811805e9.23.2025.06.16.02.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/10] meta: set S to be in UNPACKDIR in recipes that explicitly set S
Date: Mon, 16 Jun 2025 11:49:55 +0200
Message-Id: <20250616095000.2918921-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616095000.2918921-1-alex.kanavin@gmail.com>
References: <20250616095000.2918921-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218803

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb       | 2 +-
 meta-selftest/recipes-test/devtool/devtool-test-ignored.bb      | 2 +-
 meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb   | 2 +-
 .../recipes-test/devtool/devtool-test-long-filename.bb          | 2 +-
 meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb     | 2 +-
 meta-selftest/recipes-test/devtool/devtool-test-subdir.bb       | 2 +-
 .../recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb         | 2 +-
 .../devtool/devtool-upgrade-test1_1.5.3.bb.upgraded             | 2 +-
 .../recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb         | 2 +-
 .../devtool/devtool-upgrade-test3_1.5.3.bb.upgraded             | 2 +-
 .../recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb         | 2 +-
 .../devtool/devtool-upgrade-test4_1.5.3.bb.upgraded             | 2 +-
 meta-selftest/recipes-test/selftest-ed/selftest-ed_1.20.2.bb    | 2 +-
 meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb    | 2 +-
 meta/classes-recipe/barebox.bbclass                             | 2 +-
 meta/classes-recipe/pypi.bbclass                                | 2 +-
 meta/recipes-bsp/barebox/barebox-tools.bb                       | 2 +-
 meta/recipes-bsp/grub/grub-efi_2.12.bb                          | 2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc                     | 2 +-
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 2 +-
 meta/recipes-core/base-passwd/base-passwd_3.6.7.bb              | 2 +-
 meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb      | 2 +-
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 meta/recipes-core/glibc/ldconfig-native_2.12.1.bb               | 2 +-
 meta/recipes-core/netbase/netbase_6.5.bb                        | 2 +-
 meta/recipes-core/sysvinit/sysvinit_3.14.bb                     | 2 +-
 meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb         | 2 +-
 meta/recipes-devtools/chrpath/chrpath_0.18.bb                   | 2 +-
 .../docbook-xml/docbook-xsl-stylesheets_1.79.1.bb               | 2 +-
 meta/recipes-devtools/expect/expect_5.45.4.bb                   | 2 +-
 meta/recipes-devtools/git/git_2.49.0.bb                         | 2 +-
 meta/recipes-devtools/go/go-binary-native_1.24.4.bb             | 2 +-
 meta/recipes-devtools/go/go-common.inc                          | 2 +-
 meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb        | 2 +-
 meta/recipes-devtools/patch/patch.inc                           | 2 +-
 meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb             | 2 +-
 meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb       | 2 +-
 meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb          | 2 +-
 meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb       | 2 +-
 meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb       | 2 +-
 meta/recipes-devtools/perl/libtry-tiny-perl_0.32.bb             | 2 +-
 meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb           | 2 +-
 meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb           | 2 +-
 meta/recipes-devtools/python/python3-babel_2.17.0.bb            | 2 +-
 meta/recipes-devtools/python/python3-dbus_1.4.0.bb              | 2 +-
 meta/recipes-devtools/python/python3-maturin_1.8.6.bb           | 2 +-
 meta/recipes-devtools/python/python3-numpy_2.2.6.bb             | 2 +-
 meta/recipes-devtools/python/python3-pycairo_1.28.0.bb          | 2 +-
 meta/recipes-devtools/python/python3-pygobject_3.52.3.bb        | 2 +-
 meta/recipes-devtools/python/python3-scons_4.9.1.bb             | 2 +-
 meta/recipes-devtools/python/python3_3.13.4.bb                  | 2 +-
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/tcltk/tcl_9.0.1.bb                        | 2 +-
 meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb                     | 2 +-
 meta/recipes-extended/pam/libpam_1.7.0.bb                       | 2 +-
 meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb         | 2 +-
 meta/recipes-extended/perl/libtimedate-perl_2.30.bb             | 2 +-
 meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb | 2 +-
 meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb         | 2 +-
 meta/recipes-extended/perl/libxml-sax-perl_1.02.bb              | 2 +-
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb          | 2 +-
 meta/recipes-extended/timezone/timezone.inc                     | 2 +-
 meta/recipes-extended/unzip/unzip_6.0.bb                        | 2 +-
 meta/recipes-extended/zip/zip_3.0.bb                            | 2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb                         | 2 +-
 meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb                        | 2 +-
 meta/recipes-gnome/gtk+/gtk4_4.18.5.bb                          | 2 +-
 meta/recipes-graphics/libsdl2/libsdl2_2.32.6.bb                 | 2 +-
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 meta/recipes-graphics/mesa/libglu_9.0.3.bb                      | 2 +-
 meta/recipes-graphics/mesa/mesa-gl.bb                           | 2 +-
 meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb       | 2 +-
 meta/recipes-graphics/xorg-font/xorg-font-common.inc            | 2 +-
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb           | 2 +-
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc              | 2 +-
 meta/recipes-graphics/xorg-util/xorg-util-common.inc            | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc             | 2 +-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc   | 2 +-
 meta/recipes-kernel/perf/perf.bb                                | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.2.bb  | 2 +-
 .../gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb                | 2 +-
 .../gstreamer/gstreamer1.0-plugins-base_1.26.2.bb               | 2 +-
 .../gstreamer/gstreamer1.0-plugins-good_1.26.2.bb               | 2 +-
 .../gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb               | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb | 2 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb                | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb        | 2 +-
 meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb   | 2 +-
 meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb         | 2 +-
 meta/recipes-support/appstream/appstream_1.0.5.bb               | 2 +-
 meta/recipes-support/boost/boost-1.88.0.inc                     | 2 +-
 .../recipes-support/ca-certificates/ca-certificates_20250419.bb | 2 +-
 meta/recipes-support/consolekit/consolekit_0.4.6.bb             | 2 +-
 meta/recipes-support/enchant/enchant2_2.8.6.bb                  | 2 +-
 meta/recipes-support/icu/icu_77-1.bb                            | 2 +-
 meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb       | 2 +-
 meta/recipes-support/libcheck/libcheck_0.15.2.bb                | 2 +-
 meta/recipes-support/libevent/libevent_2.1.12.bb                | 2 +-
 meta/recipes-support/libfm/libfm-extra_1.3.2.bb                 | 2 +-
 meta/recipes-support/libmpc/libmpc_1.3.1.bb                     | 2 +-
 meta/recipes-support/libpcre/libpcre2_10.45.bb                  | 2 +-
 meta/recipes-support/libpcre/libpcre_8.45.bb                    | 2 +-
 meta/recipes-support/libsoup/libsoup_3.6.5.bb                   | 2 +-
 meta/recipes-support/liburcu/liburcu_0.15.3.bb                  | 2 +-
 meta/recipes-support/libusb/libusb1_1.0.29.bb                   | 2 +-
 meta/recipes-support/libxslt/libxslt_1.1.43.bb                  | 2 +-
 meta/recipes-support/libyaml/libyaml_0.2.5.bb                   | 2 +-
 meta/recipes-support/sqlite/sqlite3.inc                         | 2 +-
 109 files changed, 109 insertions(+), 109 deletions(-)

diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb b/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
index 9a136f29788..f6555a31dd2 100644
--- a/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
+++ b/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
@@ -12,7 +12,7 @@ SRCREV = "d3d096eda182644868f8e7458dcfa538ff637db3"
 SRCREV_FORMAT .= "_hello-lib"
 SRCREV_hello-lib = "59c84574e844617043cf337bc8fa537cf87ad8ae"
 
-S = "${WORKDIR}/rust"
+S = "${UNPACKDIR}/rust"
 
 inherit cargo cargo-update-recipe-crates ptest-cargo
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb b/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
index 6a3d58c8841..c7740eb118d 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
@@ -4,6 +4,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRC_URI = "file://${BPN}.tar.gz \
            file://${BPN}.patch"
 
-S = "${WORKDIR}/${BPN}"
+S = "${UNPACKDIR}/${BPN}"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
index d0fd6979783..03e082e83fb 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-native = " file://file3"
 SRC_URI[md5sum] = "92a253df9211e9c20172796ecf388f13"
 SRC_URI[sha256sum] = "26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e"
 
-S = "${WORKDIR}/syslinux-${PV}"
+S = "${UNPACKDIR}/syslinux-${PV}"
 
 EXCLUDE_FROM_WORLD = "1"
 BBCLASSEXTEND = "native"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb b/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
index 3ec22cae7fa..3653403a2e6 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
@@ -4,6 +4,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRC_URI = "file://${BPN}.tar.gz \
            file://0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch"
 
-S = "${WORKDIR}/${BPN}"
+S = "${UNPACKDIR}/${BPN}"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
index e25b3d97473..f6960320dbe 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-0.4.tar.gz
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-S = "${WORKDIR}/xrestop-0.4"
+S = "${UNPACKDIR}/xrestop-0.4"
 
 SRC_URI[md5sum] = "d8a54596cbaf037e62b80c4585a3ca9b"
 SRC_URI[sha256sum] = "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d759828860e552119af3ce257"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb b/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
index 3f6956524ba..966142431b2 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
@@ -4,6 +4,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRC_URI = "file://devtool-test-subdir.tar.gz \
            file://testfile;subdir=${BPN}"
 
-S = "${WORKDIR}/${BPN}"
+S = "${UNPACKDIR}/${BPN}"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
index fee5bee7398..254ea457085 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "681bcca9784bf3cb2207e68236d1f68e2aa7b80f999b5750dc77dcd756
 
 PR = "r5"
 
-S = "${WORKDIR}/pv-${PV}"
+S = "${UNPACKDIR}/pv-${PV}"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
index d75df0c8c7e..f80744e14be 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
@@ -11,7 +11,7 @@ RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
 SRC_URI[sha256sum] = "9dd45391806b0ed215abee4c5ac1597d018c386fe9c1f5afd2f6bc3b07fd82c3"
 
-S = "${WORKDIR}/pv-${PV}"
+S = "${UNPACKDIR}/pv-${PV}"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
index 69c0d351ec8..0501e2025f4 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
@@ -8,7 +8,7 @@ RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
 SRC_URI[md5sum] = "9365d86bd884222b4bf1039b5a9ed1bd"
 
-S = "${WORKDIR}/pv-${PV}"
+S = "${UNPACKDIR}/pv-${PV}"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.upgraded
index 3ce7e85e101..2ba7c8213e4 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.upgraded
@@ -7,7 +7,7 @@ SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
-S = "${WORKDIR}/pv-${PV}"
+S = "${UNPACKDIR}/pv-${PV}"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
index 9abf80e6ed5..71c03653f73 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
@@ -14,7 +14,7 @@ SRC_URI[sha512sum] = "32efe7071a363f547afc74e96774f711795edda1d2702823a347d0f995
 
 PR = "r5"
 
-S = "${WORKDIR}/pv-${PV}"
+S = "${UNPACKDIR}/pv-${PV}"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.upgraded
index cd2a0842f4d..0bc9f71da6a 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.upgraded
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "9dd45391806b0ed215abee4c5ac1597d018c386fe9c1f5afd2f6bc3b07
 SRC_URI[sha384sum] = "218c8d2d097aeba5310be759bc20573f18ffa0b11701eac6dd2e7e14ddf13c6e0e094ca7ca026eaa05ef92a056402e36"
 SRC_URI[sha512sum] = "1cf9d7376fceefcd594d0a8b591afc8e11ce89f7210d10ad74438974ecebe9cc5d9ec4db9cc79e0566bfd2b0278c0cc263c07547803e7536432cd1ffd32d8a45"
 
-S = "${WORKDIR}/pv-${PV}"
+S = "${UNPACKDIR}/pv-${PV}"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.20.2.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.20.2.bb
index d4232b72ee4..e183d2d4e55 100644
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.20.2.bb
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.20.2.bb
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
 SRC_URI[sha256sum] = "65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523"
 
-S = "${WORKDIR}/ed-${PV}"
+S = "${UNPACKDIR}/ed-${PV}"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb
index acd1ce5907e..6b8ce6e23b6 100644
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb
@@ -22,7 +22,7 @@ UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
 SRC_URI[sha256sum] = "d6d0c7192b02b0519c902a93719053e865ade5a784a3b327d93d888457b23c4b"
 
-S = "${WORKDIR}/ed-${PV}"
+S = "${UNPACKDIR}/ed-${PV}"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index a562dce1690..ece8fb64856 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "bison-native flex-native lz4-native"
 
-S = "${WORKDIR}/barebox-${PV}"
+S = "${UNPACKDIR}/barebox-${PV}"
 B = "${WORKDIR}/build"
 
 require conf/image-uefi.conf
diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index b0bc167cdfa..eb30004a0fc 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -41,7 +41,7 @@ PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
 SECTION = "devel/python"
 SRC_URI:prepend = "${PYPI_SRC_URI} "
-S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
+S = "${UNPACKDIR}/${PYPI_PACKAGE}-${PV}"
 
 # Replace any '_' characters in the pypi URI with '-'s to follow the PyPi website naming conventions
 UPSTREAM_CHECK_PYPI_PACKAGE ?= "${@pypi_normalize(d)}"
diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index 2a117bc9c08..e519796c1d2 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
 
-S = "${WORKDIR}/barebox-${PV}"
+S = "${UNPACKDIR}/barebox-${PV}"
 B = "${WORKDIR}/build"
 
 inherit pkgconfig
diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/grub/grub-efi_2.12.bb
index 5b435245ee6..6354b43989c 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
@@ -11,7 +11,7 @@ SRC_URI += " \
            file://cfg \
           "
 
-S = "${WORKDIR}/grub-${PV}"
+S = "${UNPACKDIR}/grub-${PV}"
 
 # Determine the target arch for the grub modules
 python __anonymous () {
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7bae968094f..287ebf658ef 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -69,7 +69,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-bluez5-disable-aics-tests.patch \
            "
-S = "${WORKDIR}/bluez-${PV}"
+S = "${UNPACKDIR}/bluez-${PV}"
 
 CVE_PRODUCT = "bluez"
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index ac99d0db498..6dc76494f7c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            "
 SRC_URI[sha256sum] = "912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a"
 
-S = "${WORKDIR}/wpa_supplicant-${PV}"
+S = "${UNPACKDIR}/wpa_supplicant-${PV}"
 
 inherit pkgconfig systemd
 
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
index 3d5247ee87b..177927d6748 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc18262
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/"
 
-S = "${WORKDIR}/work"
+S = "${UNPACKDIR}/work"
 
 PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG[selinux] = "--enable-selinux, --disable-selinux, libselinux"
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb
index e443b6b34fa..941896ec48d 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://${UNPACKDIR}/COPYING;md5=4bd090a20bfcd1a18f1f79837b5e
 
 inherit native
 
-S = "${WORKDIR}/gettext-${PV}"
+S = "${UNPACKDIR}/gettext-${PV}"
 
 python get_aclocal_files() {
     fpath = oe.path.join(d.getVar("S"), "/gettext-tools/m4/Makefile.am")
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 38e75aab618..ba7763c8417 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -30,7 +30,7 @@ LEAD_SONAME = "libglib-2.0.*"
 
 inherit meson gettext gi-docgen pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages gobject-introspection-data
 
-S = "${WORKDIR}/glib-${PV}"
+S = "${UNPACKDIR}/glib-${PV}"
 
 GIDOCGEN_MESON_OPTION = "documentation"
 
diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
index 9ca95d1e52f..cd091d0d87f 100644
--- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
@@ -24,7 +24,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${P}:"
 
 inherit native
 
-S = "${WORKDIR}/${PN}-${PV}"
+S = "${UNPACKDIR}/${PN}-${PV}"
 
 do_compile () {
 	$CC ldconfig.c -std=gnu99 chroot_canon.c xmalloc.c xstrdup.c cache.c readlib.c  -I. dl-cache.c -o ldconfig
diff --git a/meta/recipes-core/netbase/netbase_6.5.bb b/meta/recipes-core/netbase/netbase_6.5.bb
index d273dbfe663..c6cf798421f 100644
--- a/meta/recipes-core/netbase/netbase_6.5.bb
+++ b/meta/recipes-core/netbase/netbase_6.5.bb
@@ -22,4 +22,4 @@ do_install () {
 	install -m 0644 ${S}/etc/ethertypes ${D}${sysconfdir}/ethertypes
 }
 
-S = "${WORKDIR}/netbase"
+S = "${UNPACKDIR}/netbase"
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.14.bb b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
index 521eda0bfba..d4bb797624f 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.14.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "c90874b8c054a35991fb8c4d30c443ed1e9b1815ff6165c7b483f558be4e4b53"
 
-S = "${WORKDIR}/sysvinit-${PV}"
+S = "${UNPACKDIR}/sysvinit-${PV}"
 
 inherit update-alternatives features_check github-releases
 DEPENDS:append = " update-rc.d-native base-passwd virtual/crypt"
diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
index ad0bfa1d129..5ad2997c27d 100644
--- a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c
 
 inherit autotools gettext pkgconfig
 
-S = "${WORKDIR}/util-linux-${PV}"
+S = "${UNPACKDIR}/util-linux-${PV}"
 
 EXTRA_AUTORECONF += "--exclude=gtkdocize"
 EXTRA_OECONF += "--disable-all-programs --enable-libuuid"
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.18.bb b/meta/recipes-devtools/chrpath/chrpath_0.18.bb
index 653c1115d0f..3d89fd2c92b 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.18.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.18.bb
@@ -12,7 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
 SRC_URI[sha256sum] = "f09c49f0618660ca11fc6d9580ddde904c7224d4c6d0f6f2d1f9bcdc9102c9aa"
 
 inherit autotools
-S = "${WORKDIR}/chrpath"
+S = "${UNPACKDIR}/chrpath"
 
 # We don't have a staged chrpath-native for ensuring our binary is
 # relocatable, so use the one we've just built
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index ea81bf95075..7e4730b5e9d 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -13,7 +13,7 @@ UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/docbook/files/docbook-xsl/
 # Reject versions ending in .0 as those are release candidates
 UPSTREAM_CHECK_REGEX = "/docbook-xsl/(?P<pver>(\d+[\.\-_]*)+(?!\.0)\.\d+)/"
 
-S = "${WORKDIR}/docbook-xsl-${PV}"
+S = "${UNPACKDIR}/docbook-xsl-${PV}"
 
 inherit allarch xmlcatalog
 
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index e3ecf4b25e8..48b5b0d934b 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -37,7 +37,7 @@ SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/expect/files/Expect/"
 UPSTREAM_CHECK_REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
 
-S = "${WORKDIR}/${BPN}${PV}"
+S = "${UNPACKDIR}/${BPN}${PV}"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devtools/git/git_2.49.0.bb
index 3538170d08b..e1b501d62b1 100644
--- a/meta/recipes-devtools/git/git_2.49.0.bb
+++ b/meta/recipes-devtools/git/git_2.49.0.bb
@@ -16,7 +16,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-git.sh \
            "
 
-S = "${WORKDIR}/git-${PV}"
+S = "${UNPACKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "\
 	file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1 \
diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.4.bb b/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
index 9f788536c4a..d673c2c068d 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
 CVE_PRODUCT = "golang:go"
 
-S = "${WORKDIR}/go"
+S = "${UNPACKDIR}/go"
 
 inherit goarch native
 
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index ca8469dbd91..20386f09991 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -15,7 +15,7 @@ LICENSE = "BSD-3-Clause"
 inherit goarch
 
 SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
-S = "${WORKDIR}/go"
+S = "${UNPACKDIR}/go"
 B = "${S}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
 
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb
index 2e39a1e1d76..de556a5d81c 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb
@@ -7,7 +7,7 @@ SRC_URI += "file://0008-libtool-Avoid-relinking-when-cross-compiling-its-poi.pat
 
 inherit nativesdk
 
-S = "${WORKDIR}/libtool-${PV}"
+S = "${UNPACKDIR}/libtool-${PV}"
 FILES:${PN} += "${datadir}/libtool/*"
 
 do_install () {
diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
index a12d426b2cd..44d3046fd87 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -6,7 +6,7 @@ SECTION = "utils"
 HOMEPAGE = "http://savannah.gnu.org/projects/patch/"
 
 SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz"
-S = "${WORKDIR}/patch-${PV}"
+S = "${UNPACKDIR}/patch-${PV}"
 
 inherit autotools update-alternatives
 
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
index 42ba15a572e..debf2717ce9 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
@@ -20,7 +20,7 @@ GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
 SRC_URI[perl-cross.sha256sum] = "131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d"
 
-S = "${WORKDIR}/perl-cross-${PV}"
+S = "${UNPACKDIR}/perl-cross-${PV}"
 
 do_configure () {
 }
diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
index b57618724d1..b27a8c15e6c 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
@@ -18,7 +18,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz \
            "
 SRC_URI[sha256sum] = "66aeac6127418be5e471ead3744648c766bd01482825c5b66652675f2bc86a8f"
 
-S = "${WORKDIR}/Module-Build-${PV}"
+S = "${UNPACKDIR}/Module-Build-${PV}"
 
 inherit cpan_build ptest-perl
 
diff --git a/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb b/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
index 1c3a7e5136e..eae128b0ccc 100644
--- a/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
+++ b/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
@@ -13,7 +13,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Fatal-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "37dfffdafb84b762efe96b02fb2aa41f37026c73e6b83590db76229697f3c4a6"
 
-S = "${WORKDIR}/Test-Fatal-${PV}"
+S = "${UNPACKDIR}/Test-Fatal-${PV}"
 
 inherit cpan ptest-perl
 
diff --git a/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb b/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb
index 79a06170e02..0045e575af8 100644
--- a/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb
+++ b/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://cpan.metacpan.org/authors/id/H/HA/${CPAN_AUTHOR}/${CPAN_NAME}
 
 SRC_URI[sha256sum] = "923ffdc78fcba96609753e4bae26b0ba0186893de4a63cd5236e012c7c90e208"
 
-S = "${WORKDIR}/${CPAN_NAME}-${PV}"
+S = "${UNPACKDIR}/${CPAN_NAME}-${PV}"
 
 inherit cpan ptest-perl
 
diff --git a/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb b/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
index 656b38f2d84..2eccf409991 100644
--- a/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
+++ b/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
@@ -17,7 +17,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "3da27e003a3c3cafed3c09b42be05cf9bdbff0bee5c8590a731b02853880a273"
 
-S = "${WORKDIR}/Test-Warnings-${PV}"
+S = "${UNPACKDIR}/Test-Warnings-${PV}"
 
 inherit cpan ptest-perl
 
diff --git a/meta/recipes-devtools/perl/libtry-tiny-perl_0.32.bb b/meta/recipes-devtools/perl/libtry-tiny-perl_0.32.bb
index d0714695b8a..e924b3bd640 100644
--- a/meta/recipes-devtools/perl/libtry-tiny-perl_0.32.bb
+++ b/meta/recipes-devtools/perl/libtry-tiny-perl_0.32.bb
@@ -13,7 +13,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Try-Tiny-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "ef2d6cab0bad18e3ab1c4e6125cc5f695c7e459899f512451c8fa3ef83fa7fc0"
 
-S = "${WORKDIR}/Try-Tiny-${PV}"
+S = "${UNPACKDIR}/Try-Tiny-${PV}"
 
 inherit cpan ptest-perl
 
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
index 1f312b00e1c..b6d28c4bb3a 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8"
 
-S = "${WORKDIR}/XML-Parser-${PV}"
+S = "${UNPACKDIR}/XML-Parser-${PV}"
 
 EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR} CC='${CC}' LD='${CCLD}' FULL_AR='${AR}'"
 
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
index dff0f84aabc..a4f08433e74 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "531fddaebea2416743eb5c4fdfab028f502123d9a220405a4100e68fc480dbf8"
 
-S = "${WORKDIR}/XML-Simple-${PV}"
+S = "${UNPACKDIR}/XML-Simple-${PV}"
 
 EXTRA_PERLFLAGS = "-I ${PERLHOSTLIB}"
 
diff --git a/meta/recipes-devtools/python/python3-babel_2.17.0.bb b/meta/recipes-devtools/python/python3-babel_2.17.0.bb
index f7ffbccdac2..adffaa044ca 100644
--- a/meta/recipes-devtools/python/python3-babel_2.17.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.17.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "0c54cffb19f690cdcc52a3b50bcbf71e07a808d1c80d549f2459b9d2cf
 
 inherit pypi setuptools3
 
-S = "${WORKDIR}/babel-${PV}"
+S = "${UNPACKDIR}/babel-${PV}"
 
 CLEANBROKEN = "1"
 
diff --git a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
index 057c97f6564..2854eda30a0 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.ta
 
 SRC_URI[sha256sum] = "c36b28f10ffcc8f1f798aca973bcc132f91f33eb9b6b8904381b4077766043d5"
 
-S = "${WORKDIR}/dbus-python-${PV}"
+S = "${UNPACKDIR}/dbus-python-${PV}"
 
 inherit setuptools3-base meson pkgconfig
 
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.6.bb b/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
index ab509331c36..f80bf6051f5 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
 SRC_URI += "file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/libc-0.2.167"
 SRC_URI[sha256sum] = "0e0dc2e0bfaa2e1bd238e0236cf8a2b7e2250ccaa29c1aa8d0e61fa664b0289d"
 
-S = "${WORKDIR}/maturin-${PV}"
+S = "${UNPACKDIR}/maturin-${PV}"
 
 CFLAGS += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
 
diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.6.bb b/meta/recipes-devtools/python/python3-numpy_2.2.6.bb
index 10468d68503..25bab41f62f 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.6.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.6.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 inherit pkgconfig ptest python_mesonpy github-releases cython
 
-S = "${WORKDIR}/numpy-${PV}"
+S = "${UNPACKDIR}/numpy-${PV}"
 
 PACKAGECONFIG[svml] = "-Ddisable-svml=false,-Ddisable-svml=true"
 
diff --git a/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb
index c610f3eae92..498c4db5869 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb
@@ -15,7 +15,7 @@ GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
 SRC_URI[sha256sum] = "26ec5c6126781eb167089a123919f87baa2740da2cca9098be8b3a6b91cc5fbc"
 
-S = "${WORKDIR}/pycairo-${PV}"
+S = "${UNPACKDIR}/pycairo-${PV}"
 
 inherit meson pkgconfig python3targetconfig github-releases
 
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb b/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
index d0384fcce1f..42b071ca086 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
@@ -21,7 +21,7 @@ SRCNAME = "pygobject"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${UNPACKDIR}/${SRCNAME}-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
 
diff --git a/meta/recipes-devtools/python/python3-scons_4.9.1.bb b/meta/recipes-devtools/python/python3-scons_4.9.1.bb
index c8496679707..1eac1ce5a9a 100644
--- a/meta/recipes-devtools/python/python3-scons_4.9.1.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.9.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "bacac880ba2e86d6a156c116e2f8f2bfa82b257046f3ac2666c85c53c6
 
 inherit pypi python_setuptools_build_meta
 
-S = "${WORKDIR}/scons-${PV}"
+S = "${UNPACKDIR}/scons-${PV}"
 
 RDEPENDS:${PN}:class-target = "\
   python3-core \
diff --git a/meta/recipes-devtools/python/python3_3.13.4.bb b/meta/recipes-devtools/python/python3_3.13.4.bb
index 5b49fee3bff..a5277b3c5ab 100644
--- a/meta/recipes-devtools/python/python3_3.13.4.bb
+++ b/meta/recipes-devtools/python/python3_3.13.4.bb
@@ -53,7 +53,7 @@ CVE_STATUS[CVE-2023-36632] = "disputed: Not an issue, in fact expected behaviour
 
 PYTHON_MAJMIN = "3.13"
 
-S = "${WORKDIR}/Python-${PV}"
+S = "${UNPACKDIR}/Python-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index f9c1fcd1c8a..30b159a84f3 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -12,7 +12,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
 "
 SRC_URI[rust.sha256sum] = "d939eada065dc827a9d4dbb55bd48533ad14c16e7f0a42e70147029c82a7707b"
 
-RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
+RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
 
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
index 485b293768d..70aa9b606c6 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
@@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "488fcb6c875a1762e9e8478319b20fbad9a31de475f056aeed94cc54b4
 UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
 
-S = "${WORKDIR}/${BPN}${PV}"
+S = "${UNPACKDIR}/${BPN}${PV}"
 
 VER = "${PV}"
 
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
index 076bbc906c4..225f04be489 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
@@ -32,7 +32,7 @@ SRC_URI:class-native = "${BASE_SRC_URI}"
 UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>8(\.\d+)+)-src"
 
-S = "${WORKDIR}/tcl${PV}"
+S = "${UNPACKDIR}/tcl${PV}"
 
 VER = "${PV}"
 
diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-extended/pam/libpam_1.7.0.bb
index 4abc52bd93b..dea9ff592b6 100644
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.0.bb
@@ -31,7 +31,7 @@ DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
 EXTRA_OEMESON = "-Ddocs=disabled -Dsecuredir=${base_libdir}/security"
 
-S = "${WORKDIR}/Linux-PAM-${PV}"
+S = "${UNPACKDIR}/Linux-PAM-${PV}"
 
 inherit meson gettext pkgconfig systemd ptest github-releases
 
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index 6e9f8817732..7e167d6e675 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}
 
 SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
 
-S = "${WORKDIR}/Convert-ASN1-${PV}"
+S = "${UNPACKDIR}/Convert-ASN1-${PV}"
 
 inherit cpan ptest-perl
 
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index 3b681225c2c..7f9f40d9961 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=21;md5=576b7cb41e5e821501a01ed66f0f9
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.gz"
 
-S = "${WORKDIR}/TimeDate-${PV}"
+S = "${UNPACKDIR}/TimeDate-${PV}"
 
 inherit cpan ptest-perl
 
diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
index ae0e5ad08a9..9653cb427b2 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2
 
 UPSTREAM_CHECK_REGEX = "XML\-NamespaceSupport\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${UNPACKDIR}/${SRCNAME}-${PV}"
 
 inherit cpan ptest-perl
 
diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
index 8e8be934416..8d97e95e830 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-Base-${PV}
 
 SRC_URI[sha256sum] = "66cb355ba4ef47c10ca738bd35999723644386ac853abbeb5132841f5e8a2ad0"
 
-S = "${WORKDIR}/XML-SAX-Base-${PV}"
+S = "${UNPACKDIR}/XML-SAX-Base-${PV}"
 
 inherit cpan ptest-perl
 
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
index 218af5c4375..67bdac981dd 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-${PV}.tar.
 
 SRC_URI[sha256sum] = "4506c387043aa6a77b455f00f57409f3720aa7e553495ab2535263b4ed1ea12a"
 
-S = "${WORKDIR}/XML-SAX-${PV}"
+S = "${UNPACKDIR}/XML-SAX-${PV}"
 
 inherit cpan ptest-perl
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index de5fb3c5433..da3ff908915 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -52,7 +52,7 @@ SRC_URI = "http://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489a4315d"
 
-S = "${WORKDIR}/tcp_wrappers_${PV}"
+S = "${UNPACKDIR}/tcp_wrappers_${PV}"
 
 CFLAGS += "-std=gnu17"
 
diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 8f7868f0981..9a5105ffd74 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -12,7 +12,7 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
            "
 
-S = "${WORKDIR}/tz"
+S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index b2fed672396..d6289deff75 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -43,7 +43,7 @@ CVE_STATUS[CVE-2008-0888] = "fixed-version: Patch from https://bugzilla.redhat.c
 # exclude version 5.5.2 which triggers a false positive
 UPSTREAM_CHECK_REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
 
-S = "${WORKDIR}/unzip60"
+S = "${UNPACKDIR}/unzip60"
 
 # Makefile uses CF_NOOPT instead of CFLAGS.  We lifted the values from
 # Makefile and add CFLAGS.  Optimization will be overriden by unzip
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 27691bd89a4..0824b30da28 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -7,7 +7,7 @@ LICENSE = "Info-ZIP"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04d43c5d70b496c032308106e26ae17d"
 
 
-S = "${WORKDIR}/zip30"
+S = "${UNPACKDIR}/zip30"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz \
            file://fix-security-format.patch \
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 1e29bd9bb07..54666801c56 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.xz;na
 SRC_URI[archive.md5sum] = "2b16996d0e4b112856ee5c59130e822c"
 SRC_URI[archive.sha256sum] = "1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c"
 
-S = "${WORKDIR}/GConf-${PV}"
+S = "${UNPACKDIR}/GConf-${PV}"
 
 EXTRA_OECONF = "--enable-shared --disable-static \
                 --disable-orbit --with-openldap=no --disable-gtk"
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
index 15870dcc08b..5892bb31397 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            "
 SRC_URI[sha256sum] = "7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb5be476d51bf2f3c7"
 
-S = "${WORKDIR}/gtk+-${PV}"
+S = "${UNPACKDIR}/gtk+-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.5.bb b/meta/recipes-gnome/gtk+/gtk4_4.18.5.bb
index 85773b11743..6c5ffa5fae1 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.18.5.bb
@@ -40,7 +40,7 @@ UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
 SRC_URI[sha256sum] = "bb5267a062f5936947d34c9999390a674b0b2b0d8aa3472fe0d05e2064955abc"
 
-S = "${WORKDIR}/gtk-${PV}"
+S = "${UNPACKDIR}/gtk-${PV}"
 
 CVE_PRODUCT = "gnome:gtk"
 
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.6.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.6.bb
index 75710b962a3..fff757624ab 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.6.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.6.bb
@@ -23,7 +23,7 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
-S = "${WORKDIR}/SDL2-${PV}"
+S = "${UNPACKDIR}/SDL2-${PV}"
 
 SRC_URI[sha256sum] = "6a7a40d6c2e00016791815e1a9f4042809210bdf10cc78d2c75b45c4f52f93ad"
 
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 784ab8b79f0..5dda701ed09 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -20,7 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 SRC_URI[sha256sum] = "e3da2250654c8d52b3f59f8cb3f3d8e7fb1a2ee64378dbc400fbc5663de7edb8"
 
-S = "${WORKDIR}/libva-${PV}"
+S = "${UNPACKDIR}/libva-${PV}"
 
 GITHUB_BASE_URI = "https://github.com/intel/libva/releases"
 
diff --git a/meta/recipes-graphics/mesa/libglu_9.0.3.bb b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
index 9e23ff830fc..0e38671e417 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.3.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://archive.mesa3d.org/glu/glu-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "bd43fe12f374b1192eb15fe20e45ff456b9bc26ab57f0eee919f96ca0f8a330f"
 
-S = "${WORKDIR}/glu-${PV}"
+S = "${UNPACKDIR}/glu-${PV}"
 
 DEPENDS = "virtual/libgl"
 
diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 2bdabddc287..e2f03c81c45 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -4,7 +4,7 @@ SUMMARY += " (OpenGL only, no EGL/GLES)"
 
 PROVIDES = "virtual/libgl virtual/mesa"
 
-S = "${WORKDIR}/mesa-${PV}"
+S = "${UNPACKDIR}/mesa-${PV}"
 
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
index 584a19a42a4..7d70c37c466 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/liberationfonts/liberation-fonts/files/7261482/lib
 SRC_URI[sha256sum] = "7191c669bf38899f73a2094ed00f7b800553364f90e2637010a69c0e268f25d0"
 GITHUB_BASE_URI = "https://github.com/liberationfonts/liberation-fonts/releases"
 
-S = "${WORKDIR}/liberation-fonts-ttf-${PV}"
+S = "${UNPACKDIR}/liberation-fonts-ttf-${PV}"
 
 inherit allarch fontcache github-releases
 
diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index edf7cf76421..a11b8e8ab25 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -11,7 +11,7 @@ XORG_PN = "${BPN}"
 
 SRC_URI_EXT = "bz2"
 SRC_URI = "${XORG_MIRROR}/individual/font/${XORG_PN}-${PV}.tar.${SRC_URI_EXT}"
-S = "${WORKDIR}/${XORG_PN}-${PV}"
+S = "${UNPACKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig features_check
 
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index e51e3fbc3ad..28010f5f227 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -19,7 +19,7 @@ inherit allarch features_check
 # The font-alias requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-S = "${WORKDIR}/misc"
+S = "${UNPACKDIR}/misc"
 
 PACKAGES = "${PN}"
 FILES:${PN} = "${libdir}/X11/ ${datadir}/fonts/X11/"
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 15c7ecf7826..ba7fcb73044 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -10,7 +10,7 @@ XORG_EXT ?= "tar.xz"
 
 SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.${XORG_EXT}"
 
-S = "${WORKDIR}/${XORG_PN}-${PV}"
+S = "${UNPACKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools features_check pkgconfig
 
diff --git a/meta/recipes-graphics/xorg-util/xorg-util-common.inc b/meta/recipes-graphics/xorg-util/xorg-util-common.inc
index a4c85a4ebcd..198921116d7 100644
--- a/meta/recipes-graphics/xorg-util/xorg-util-common.inc
+++ b/meta/recipes-graphics/xorg-util/xorg-util-common.inc
@@ -8,6 +8,6 @@ XORG_PN = "${BPN}"
 
 SRC_URI = "${XORG_MIRROR}/individual/util/${XORG_PN}-${PV}.tar.gz"
 
-S = "${WORKDIR}/${XORG_PN}-${PV}"
+S = "${UNPACKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 7645f11c146..0dece7bba3e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -30,7 +30,7 @@ impossible or difficult to exploit. There is currently no upstream patch \
 available for this flaw."
 CVE_STATUS[CVE-2022-3553] = "cpe-incorrect: This is specific to XQuartz, which is the macOS X server port"
 
-S = "${WORKDIR}/${XORG_PN}-${PV}"
+S = "${UNPACKDIR}/${XORG_PN}-${PV}"
 
 inherit meson pkgconfig
 
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 3a8d32e7857..1f5c47f4533 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -60,7 +60,7 @@ KORG_ARCHIVE_COMPRESSION ?= "xz"
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.${KORG_ARCHIVE_COMPRESSION}"
 UPSTREAM_CHECK_URI = "https://www.kernel.org/"
 
-S = "${WORKDIR}/linux-${PV}"
+S = "${UNPACKDIR}/linux-${PV}"
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
 
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 6cc5499d8dd..b30ae30e9d1 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -66,7 +66,7 @@ include ${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perf-perl.inc', '', d)}
 
 inherit kernelsrc
 
-S = "${WORKDIR}/${BP}"
+S = "${UNPACKDIR}/${BP}"
 
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.2.bb
index 88cc0b530d2..e3410f09075 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
 SRC_URI[sha256sum] = "2eceba9cae4c495bb4ea134c27f010356036f1fa1972db5f54833f5f6c9f8db0"
 
-S = "${WORKDIR}/gst-libav-${PV}"
+S = "${UNPACKDIR}/gst-libav-${PV}"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base ffmpeg"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
index e0329cd0047..b311286cc27 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            "
 SRC_URI[sha256sum] = "cb116bfc3722c2de53838899006cafdb3c7c0bc69cd769b33c992a8421a9d844"
 
-S = "${WORKDIR}/gst-plugins-bad-${PV}"
+S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
index dc703569404..c264a14ee6b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            "
 SRC_URI[sha256sum] = "f4b9fc0be852fe5f65401d18ae6218e4aea3ff7a3c9f8d265939b9c4704915f7"
 
-S = "${WORKDIR}/gst-plugins-base-${PV}"
+S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
 DEPENDS += "iso-codes util-linux zlib"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
index 467ccd9893d..7a81a29d958 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
 
 SRC_URI[sha256sum] = "d864b9aec28c3a80895468c909dd303e5f22f92d6e2b1137f80e2a1454584339"
 
-S = "${WORKDIR}/gst-plugins-good-${PV}"
+S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
index 106fea361cb..fcd97e42450 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
 
 SRC_URI[sha256sum] = "ec2d7556c6b8c2694f9b918ab9c4c6c998fb908c6b6a6ad57441702dad14ce73"
 
-S = "${WORKDIR}/gst-plugins-ugly-${PV}"
+S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
 DEPENDS += "gstreamer1.0-plugins-base"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
index 50ff21c1ef1..3c60e09d853 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 
 PNREAL = "gst-python"
 
-S = "${WORKDIR}/${PNREAL}-${PV}"
+S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
 EXTRA_OEMESON += "\
     -Dtests=disabled \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
index 85b56155505..51085bb3fa8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.x
 
 SRC_URI[sha256sum] = "f942b2a499ed6d161222868db0e80de45297b4777ff189c6fb890bde698c2dc3"
 
-S = "${WORKDIR}/${PNREAL}-${PV}"
+S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
 inherit meson pkgconfig upstream-version-is-even gobject-introspection
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb
index 7079641bc43..9b8aaf09df6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
 
 SRC_URI[sha256sum] = "0e24194236ed3b7f06f90e90efdf17f3f5ee39132e20081189a6c7690601051a"
 
-S = "${WORKDIR}/${REALPN}-${PV}"
+S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 
 inherit meson pkgconfig features_check upstream-version-is-even
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb
index d288236abc9..a921e39144c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb
@@ -13,7 +13,7 @@ inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection p
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
-S = "${WORKDIR}/gstreamer-${PV}"
+S = "${UNPACKDIR}/gstreamer-${PV}"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
            file://run-ptest \
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
index 29d48fd333c..819096878b8 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
@@ -16,7 +16,7 @@ CVE_PRODUCT = "libsamplerate"
 
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsamplerate/releases"
 
-S = "${WORKDIR}/libsamplerate-${PV}"
+S = "${UNPACKDIR}/libsamplerate-${PV}"
 
 inherit autotools pkgconfig github-releases
 
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index 63c1570621b..0ec40dda7aa 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
 CVE_PRODUCT = "libsndfile"
 
-S = "${WORKDIR}/libsndfile-${PV}"
+S = "${UNPACKDIR}/libsndfile-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
diff --git a/meta/recipes-support/appstream/appstream_1.0.5.bb b/meta/recipes-support/appstream/appstream_1.0.5.bb
index 3e4f8708d8d..bb293f76e2d 100644
--- a/meta/recipes-support/appstream/appstream_1.0.5.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.5.bb
@@ -32,7 +32,7 @@ SRC_URI = " \
 "
 SRC_URI[sha256sum] = "ce0ed29e89abd5f0cf790ea87d792f1967c3413060beb30e63a979578d975121"
 
-S = "${WORKDIR}/AppStream-${PV}"
+S = "${UNPACKDIR}/AppStream-${PV}"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
diff --git a/meta/recipes-support/boost/boost-1.88.0.inc b/meta/recipes-support/boost/boost-1.88.0.inc
index 917f1a9600f..96bd986f6a9 100644
--- a/meta/recipes-support/boost/boost-1.88.0.inc
+++ b/meta/recipes-support/boost/boost-1.88.0.inc
@@ -17,4 +17,4 @@ SRC_URI[sha256sum] = "46d9d2c06637b219270877c9e16155cbd015b6dc84349af064c088e9b5
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
 
-S = "${WORKDIR}/${BOOST_P}"
+S = "${UNPACKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
index 01f594095e9..a11433c9daf 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
@@ -20,7 +20,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
            "
-S = "${WORKDIR}/ca-certificates"
+S = "${UNPACKDIR}/ca-certificates"
 inherit allarch
 
 EXTRA_OEMAKE = "\
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index fc1b9856312..acef3483bb3 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.
 
 SRC_URI[sha256sum] = "b41d17e06f80059589fbeefe96ad07bcc564c49e65516da1caf975146475565c"
 
-S = "${WORKDIR}/ConsoleKit-${PV}"
+S = "${UNPACKDIR}/ConsoleKit-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd polkit', d)}"
 
diff --git a/meta/recipes-support/enchant/enchant2_2.8.6.bb b/meta/recipes-support/enchant/enchant2_2.8.6.bb
index 66de313d9d8..2696fc0f81a 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.6.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.6.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "c4cd0889d8aff8248fc3913de5a83907013962f0e1895030a3836468cd
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-S = "${WORKDIR}/enchant-${PV}"
+S = "${UNPACKDIR}/enchant-${PV}"
 
 PACKAGECONFIG ??= "aspell"
 PACKAGECONFIG[aspell]  = "--with-aspell,--without-aspell,aspell,aspell"
diff --git a/meta/recipes-support/icu/icu_77-1.bb b/meta/recipes-support/icu/icu_77-1.bb
index 90af2cdc27c..e655b18ad24 100644
--- a/meta/recipes-support/icu/icu_77-1.bb
+++ b/meta/recipes-support/icu/icu_77-1.bb
@@ -10,7 +10,7 @@ DEPENDS = "icu-native autoconf-archive-native"
 
 CVE_PRODUCT = "international_components_for_unicode"
 
-S = "${WORKDIR}/icu/source"
+S = "${UNPACKDIR}/icu/source"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
 ICU_MAJOR_VER = "${@d.getVar('PV').split('-')[0]}"
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
index 569da165105..00994dfae05 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "d305207fe207f2b3fb5cb4c019da12b44ce3fcbc593dfd5080d867b1a2
 
 CVE_PRODUCT = "libatomic_ops"
 
-S = "${WORKDIR}/libatomic_ops-${PV}"
+S = "${UNPACKDIR}/libatomic_ops-${PV}"
 
 ALLOW_EMPTY:${PN} = "1"
 
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
index 5ab67b87286..16e0c441ab0 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/check-${PV}.tar.gz \
 SRC_URI[sha256sum] = "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a"
 GITHUB_BASE_URI = "https://github.com/libcheck/check/releases/"
 
-S = "${WORKDIR}/check-${PV}"
+S = "${UNPACKDIR}/check-${PV}"
 
 inherit autotools pkgconfig texinfo github-releases
 
diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index 25388fb4d7f..2fadf109432 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/release-${PV}-stable/${BP}-stable.tar.gz
 SRC_URI[sha256sum] = "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>.+)-stable"
 
-S = "${WORKDIR}/${BPN}-${PV}-stable"
+S = "${UNPACKDIR}/${BPN}-${PV}-stable"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
diff --git a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
index b7a9b25f862..5bf2f0f5025 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/libfm-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "a5042630304cf8e5d8cff9d565c6bd546f228b48c960153ed366a34e87cad1e5"
 
-S = "${WORKDIR}/libfm-${PV}"
+S = "${UNPACKDIR}/libfm-${PV}"
 
 EXTRA_OECONF = "--with-extra-only --with-gtk=no"
 
diff --git a/meta/recipes-support/libmpc/libmpc_1.3.1.bb b/meta/recipes-support/libmpc/libmpc_1.3.1.bb
index ed57396c0a0..b3853fc9644 100644
--- a/meta/recipes-support/libmpc/libmpc_1.3.1.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.3.1.bb
@@ -7,6 +7,6 @@ SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8"
 
-S = "${WORKDIR}/mpc-${PV}"
+S = "${UNPACKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-support/libpcre/libpcre2_10.45.bb b/meta/recipes-support/libpcre/libpcre2_10.45.bb
index e82de0fa5bd..4fbb8921c5a 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.45.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.45.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "21547f3516120c75597e5b30a992e27a592a31950b5140e7b8bfde3f19
 
 CVE_PRODUCT = "pcre2"
 
-S = "${WORKDIR}/pcre2-${PV}"
+S = "${UNPACKDIR}/pcre2-${PV}"
 
 PROVIDES += "pcre2"
 DEPENDS += "bzip2 zlib"
diff --git a/meta/recipes-support/libpcre/libpcre_8.45.bb b/meta/recipes-support/libpcre/libpcre_8.45.bb
index 933bb00de65..67327065e49 100644
--- a/meta/recipes-support/libpcre/libpcre_8.45.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.45.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e321
 
 CVE_PRODUCT = "pcre"
 
-S = "${WORKDIR}/pcre-${PV}"
+S = "${UNPACKDIR}/pcre-${PV}"
 
 PROVIDES += "pcre"
 DEPENDS += "bzip2 zlib"
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
index fbe9a79b0f1..29e45dfb977 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
 
-S = "${WORKDIR}/libsoup-${PV}"
+S = "${UNPACKDIR}/libsoup-${PV}"
 
 inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gi-docgen vala
 
diff --git a/meta/recipes-support/liburcu/liburcu_0.15.3.bb b/meta/recipes-support/liburcu/liburcu_0.15.3.bb
index fb4e457719f..ae5daed7018 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.3.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
 SRC_URI[sha256sum] = "26687ec84e3e114759454c884a08abeaf79dec09b041895ddf4c45ec150acb6d"
 
-S = "${WORKDIR}/userspace-rcu-${PV}"
+S = "${UNPACKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
 
 CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/recipes-support/libusb/libusb1_1.0.29.bb
index bae5e2c09f7..2f43ee68b70 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.29.bb
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 SRC_URI[sha256sum] = "5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85"
 
-S = "${WORKDIR}/libusb-${PV}"
+S = "${UNPACKDIR}/libusb-${PV}"
 
 inherit autotools pkgconfig ptest github-releases
 
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
index d251fa8122f..c0699cbce80 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CVE_STATUS[CVE-2022-29824] = "not-applicable-config: Static linking to libxml2 is not enabled."
 
-S = "${WORKDIR}/libxslt-${PV}"
+S = "${UNPACKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
 
diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index b1f516f7fee..9b77e7cfc89 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://License;md5=7bbd28caa69f81f5cd5f48647236663d"
 SRC_URI = "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
 SRC_URI[sha256sum] = "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4"
 
-S = "${WORKDIR}/yaml-${PV}"
+S = "${UNPACKDIR}/yaml-${PV}"
 
 inherit autotools
 
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index d093ec5859e..28a33282ae1 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -13,7 +13,7 @@ def sqlite_download_version(d):
 
 SQLITE_PV = "${@sqlite_download_version(d)}"
 
-S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
+S = "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
 UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
-- 
2.39.5


