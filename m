Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22B5D0E6C3
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 07:43:56 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.40673.1729496629190653863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 00:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OaLsCnuH;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20ca388d242so28074665ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 00:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729496628; x=1730101428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W8zr7WDGjnjPfngm14favcv+QISJ3d91VsMdlk14L7E=;
        b=OaLsCnuHSMCBE18lMb3/HjN7xCbKFakG6rcz/2V1LpWQquV/9RPDzEn3qbvuCPMCgH
         4tLyHvjcw1Z+qL8sqdbvDXqYI/ewV62eJJGDLDNOgFHj9E+Qn7QKeTEKNSz72MzaDkZ5
         97xNAtAiKtbwmiB3+Vx12YTxqNEsf+8Xwf2ZvZJUBtcc4edq9bLaUgv/nXc2kxmMmcl0
         fotN/DPi/ig+LcXY9sgoJXbMD9+zdxpsEarqXjr8jhgb3y0lvbQImK/WlH3mLYxn633Y
         fABSG5krQ5QmVJt5rkRfWwqS/OjOd+91O5/Ep8DrPja4qRSfCl8hn5Z7mxuFpPbs6Fnk
         9Wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729496628; x=1730101428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8zr7WDGjnjPfngm14favcv+QISJ3d91VsMdlk14L7E=;
        b=QPyNUHTDx0jh87KVxQ+xbyiQvGjZIkRJlldh4usahyQ16M9gtTt6YIVysVcYJbaLsG
         7OqV6jjtUuaXa+BhcNlUGdPdRsZ/5NPPSOqhRYwLpv9T9iMtrz2SoFkdbXdYlj6L9S0A
         PPXHUsvS1qNUSr7uEXPWLraZXYplpKl+ybOJqZTk3bYW7IF4gjgH2lolViAnzRWBm5Xl
         fXpmLEuWjuAqqIy/0svxjKyFbtwTRlAxPe1uh9DZ2oxbZCU2jkZVEcB8Hscg1qpOuee0
         PhyPqDLHIusUABU05aUwAVnt9vDnL5sqoBgvQUlM/qXDosl8g7uW5yIe/WPfImImo8tE
         tvGg==
X-Gm-Message-State: AOJu0Yy5r8hHc1aCjDG4U/cNRdJn32z2vf3RQZPXznzk3OCUPkxWpuCv
	O1Y1LIzgScf6F91SMEojCdUkxv4zg4tiCGy13k5zoo29kRcsIZK1ealZ8w==
X-Google-Smtp-Source: AGHT+IHBBdrDnVxBz983HYMqhfv3Ms9KIvN1mzpZeGXp6RnweIr9/RGT2ZhnmLmW8KOP46jD4LjB0Q==
X-Received: by 2002:a17:902:da91:b0:20c:7be3:2832 with SMTP id d9443c01a7336-20e5a8ef950mr148624205ad.31.1729496627690;
        Mon, 21 Oct 2024 00:43:47 -0700 (PDT)
Received: from LL-3020L.kpit.com ([2401:4900:1c43:33e1:a5ea:686e:ea6f:f68a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0bd97sm20101715ad.92.2024.10.21.00.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:43:47 -0700 (PDT)
From: Virendra Thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org,
	wangmy@fujitsu.com
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [kirkstone][PATCH] libyaml: Add libyaml ptest
Date: Mon, 21 Oct 2024 13:12:10 +0530
Message-Id: <20241021074210.751082-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 07:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206096

From: Virendra Thakur <virendrak@kpit.com>

Install libyaml test suite and run it as ptest.
The run-ptest script iterates through executable
files copied from the host, runs each on the target.

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libyaml/libyaml/example.yaml              | 45 +++++++++++++++++++
 .../recipes-support/libyaml/libyaml/run-ptest | 28 ++++++++++++
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 25 ++++++++++-
 4 files changed, 97 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libyaml/libyaml/example.yaml
 create mode 100644 meta/recipes-support/libyaml/libyaml/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5c6a30635f..fcd509d6d2 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -42,6 +42,7 @@ PTESTS_FAST = "\
     libxml-sax-base-perl-ptest \
     libxml-simple-perl-ptest \
     libxml2-ptest \
+    libyaml-ptest \
     lua-ptest \
     lzo-ptest \
     m4-ptest \
diff --git a/meta/recipes-support/libyaml/libyaml/example.yaml b/meta/recipes-support/libyaml/libyaml/example.yaml
new file mode 100644
index 0000000000..107b2b1204
--- /dev/null
+++ b/meta/recipes-support/libyaml/libyaml/example.yaml
@@ -0,0 +1,45 @@
+# anchors yaml
+base: &base
+    name: Everyone has same name
+
+foo: &foo
+    <<: *base
+    age: 10
+
+bar: &bar
+    <<: *base
+    age: 20
+# global tag example
+%TAG ! tag:clarkevans.com,2002:
+--- !shape
+  # Use the ! handle for presenting
+  # tag:clarkevans.com,2002:circle
+- !circle
+  center: &ORIGIN {x: 73, y: 129}
+  radius: 7
+- !line
+  start: *ORIGIN
+  finish: { x: 89, y: 102 }
+- !label
+  start: *ORIGIN
+  color: 0xFFEEBB
+  text: Pretty vector drawing.
+# array example
+- member
+- member2
+# numbers example
+---
+string: "Hello"
+integer: 123
+float: 12.345
+boolean: No
+# strings example
+message: "YAML & JSON"
+# mapping example
+person:
+    name: "ramesh"
+    surname: "sharma"
+    age:  23
+#json example
+---
+{"key": ["value", 3]}
diff --git a/meta/recipes-support/libyaml/libyaml/run-ptest b/meta/recipes-support/libyaml/libyaml/run-ptest
new file mode 100644
index 0000000000..794b24c6ba
--- /dev/null
+++ b/meta/recipes-support/libyaml/libyaml/run-ptest
@@ -0,0 +1,28 @@
+#!/bin/sh
+for testlist in test-version test-reader run-emitter run-dumper run-parser run-scanner run-loader; do
+       case ${testlist} in
+       test-version|test-reader)
+               outputrun=$(./$testlist)
+	       if ! echo ${outputrun}| grep -q "FAILURE"
+               then
+                       echo "PASS: ${testlist}"
+               else
+                       echo "FAIL : ${testlist}"
+                       exit 1
+               fi
+               ;;
+       esac
+       case ${testlist} in
+       run-emitter|run-dumper|run-parser|run-scanner|run-loader)
+	       outputrun=$(./$testlist example.yaml)
+	       echo $outputrun
+	       if ! echo ${outputrun}| grep "FAILURE ([1-50]"
+	       then
+		       echo "PASS: ${testlist}"
+	       else
+		       echo "FAIL : ${testlist}"
+		       exit 1
+	       fi
+               ;;
+       esac
+done
diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 514c60779c..3e8b74e5fa 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -7,13 +7,34 @@ SECTION = "libs/devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://License;md5=7bbd28caa69f81f5cd5f48647236663d"
 
-SRC_URI = "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
+SRC_URI = "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
+           file://run-ptest \
+           file://example.yaml \
+           "
 SRC_URI[md5sum] = "bb15429d8fb787e7d3f1c83ae129a999"
 SRC_URI[sha256sum] = "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4"
+SRC_URI[run-ptest.md5sum] = "040b47d9b00d2ddbc707792ff6626243"
+SRC_URI[run-ptest.sha256sum] = "71030494ab116f1c31bf125de9d5fbe2f01aacf4daada36b44202be135a80964"
+SRC_URI[example.yaml.md5sum] = "d7f8a342650b153d219431633b0c383b"
+SRC_URI[example.yaml.sha256sum] = "d7c50b29716fcc7445e181c7d7043d70f8e58096793dc1f351c8e7f41034f813"
 
 S = "${WORKDIR}/yaml-${PV}"
 
-inherit autotools
+inherit autotools ptest
+
+do_compile_ptest() {
+        sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" tests/Makefile
+        oe_runmake check
+}
+
+do_install_ptest() {
+    # install the tests dir
+    cp -rf ${B}/tests/.libs/* ${D}${PTEST_PATH}
+    install -m 755 ${WORKDIR}/example.yaml ${D}${PTEST_PATH}
+
+}
+
+RDEPENDS:${PN}-ptest += "make bash"
 
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
-- 
2.34.1


