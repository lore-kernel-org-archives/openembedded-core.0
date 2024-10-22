Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4B2D1CDAE
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 08:13:43 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.13361.1729584820143438226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 01:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L34Q0PEC;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cbca51687so53442085ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729584819; x=1730189619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDhqXs/7tBHOK8+rM2w6KA4J6cWCAX5enm8kOfDZMYI=;
        b=L34Q0PECcwwOzahJYfDaCu8wHpy6TdODHFkloSRJyrWwIb/c0/4VByUV/M5CJTnabX
         xG4FVYvYx8pxm0YxTx7cxS3+wsWh9LN2VDA2VVzVifSEWv2Z0fUoDNYKa6vtrEEYmZ/D
         gQooPyRFa8FFUC0Y5hyqn1XkXHHTUB9NtvaSI+eGoWHSe6Sy4WdPAKD8GmHs2ZllkTja
         dGqoneyDdsLgQmMEfbD9oAwR6Hz1uYYJ8mIzVGa+zaA2UPx45LBmn80DRZ4+ZtKPrXbc
         fbLElXiilqHr3wxMRBBrtec5jY8EBEK7H2AYArwu0xVEzOZT1+WW69mmehWU/QREe1MC
         umlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729584819; x=1730189619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDhqXs/7tBHOK8+rM2w6KA4J6cWCAX5enm8kOfDZMYI=;
        b=ux4k0OjPqDbHkWAtw+BSWli4cfyCuyA3w1kFcfS3huc4z0/uq+ycp4XnCynDJXBcoS
         sMvD4QELAeDiWI8cYJkhH8WG9Z0+erw2YcWHs/c4devSUF6w6v6RXDWiFkoigf4+KxQr
         LZhsbXYx13YDpSZ+v3i6fweeM9bWBuuhoC6BlLry0qRraGQn+QK+o5/O1CYd4KjmhTON
         7OYe3EtBmovAe9qAT/dZJgAGJm/NYVxxmWirh79qaaFa/ImkiHwvgd5KMatH4SWKHdOK
         +NpXeuKVYYIKASkrcdwvz1SmdnPbBZmARmjvrwxNz/GN5r+G8RoRra0aktQZzz0V8iDR
         Cu7g==
X-Gm-Message-State: AOJu0Yy0GhtzBPtH3roSFad6yphetij8d+AGcmzGmPay7AsVQ/Def+qc
	CYFBUZBB2Njic5xrhnGS+8IxHZ0a79pJP5+vcpjg0MuQwy709YTyVRTdTQ==
X-Google-Smtp-Source: AGHT+IFoSypmUzQAIhisDtv3I+XUoEtpzYSboGfnZ+r6dyAUFDneLBYpypU7WErQlctMEvKwafYN1A==
X-Received: by 2002:a17:902:e5c9:b0:20b:a25e:16c5 with SMTP id d9443c01a7336-20e5a93c9edmr149173815ad.53.1729584818479;
        Tue, 22 Oct 2024 01:13:38 -0700 (PDT)
Received: from LL-3020L.kpit.com ([2401:4900:1c43:33e1:6992:9095:9d79:53aa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef08d34sm37581515ad.63.2024.10.22.01.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 01:13:37 -0700 (PDT)
From: Virendra Thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org,
	wangmy@fujitsu.com
Subject: [master][PATCH] libyaml: Add libyaml ptest
Date: Tue, 22 Oct 2024 13:41:40 +0530
Message-Id: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 08:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206142

Install libyaml test suite and run it as ptest.
The run-ptest script iterates through executable
files copied from the host, runs each on the target.

example.yaml file created by using examples present in libyaml upstream.
Reference: https://github.com/yaml/libyaml/tree/master/examples

Signed-off-by: Virendra Thakur <thakur.virendra1810@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libyaml/libyaml/example.yaml              | 45 +++++++++++++++++++
 .../recipes-support/libyaml/libyaml/run-ptest | 28 ++++++++++++
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 25 ++++++++++-
 4 files changed, 97 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libyaml/libyaml/example.yaml
 create mode 100644 meta/recipes-support/libyaml/libyaml/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 4a48188562..cd9fae3e45 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -48,6 +48,7 @@ PTESTS_FAST = "\
     libxml-simple-perl \
     libxml2 \
     libxmlb \
+    libyaml \
     logrotate \
     lua \
     lzo \
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
index aa7fc5e914..7b108b8548 100644
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
+    install -m 755 ${UNPACKDIR}/example.yaml ${D}${PTEST_PATH}
+
+}
+
+RDEPENDS:${PN}-ptest += "make bash"
 
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
-- 
2.34.1


