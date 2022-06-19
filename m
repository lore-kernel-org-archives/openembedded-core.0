Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DA0CCA47A
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:20:57 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.22003.1655666451768596134
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WB3RKPxV;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id w20so14108939lfa.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cu+ASYQ6/0fvHLurB13BxU9FK1Y8GKvpxkKPQgx/lqA=;
        b=WB3RKPxVZcaCahWqRu1nwI4B66lA1bRYRz1JKB9OslCIOsNJWvSZQ2/Pns5Q2htmNe
         XhAQuGbSdYhbW0ve00K68ZnHk0w/kxGDG5KAxVpsKDut+XOGc5M7WGbMHyScJQA5v3JA
         PGsQZpNWIueF24VSWe1K5TPD0m6PiILPB0pF0KWSZhz1MZ7zopaNm549rOdb5P0BbybS
         gw0jRz5TfuLYfHO7if24un2v2W2Rx3UVT14Sq9gTzR2EFT1I0YhonhxgSIV1o6Npakkb
         QczBJ6QlBQtG0F93bEZC2ZXhJb5WPWQQY3lcBzrzRNWO/F/HRbGvts6d0r6wdi21xIcq
         QSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cu+ASYQ6/0fvHLurB13BxU9FK1Y8GKvpxkKPQgx/lqA=;
        b=bclsjq2B0eDux8GhkxG1/9h0G8JRaKeb0BLt3TezmO/KEjeyLlsbvL8KcIj64SbAaD
         8M/6bSKR643CWfWxJy5vDsI3TKPq00D12TtfbBWlS2EfPaNDPIRP/f+DKFkO4/AUB43d
         XhCaIpK3hXRbjTW9VOR4orKfSd43/jWtN5JhdCRfedcLMSLbQk5J+Vx+Lx6mVnJssI70
         2pvYjMGj/+dMcGM1cPzLoomiyzbJO9xN5CmOlgThxQrtjdiEZDcJBkYAPXfOuwjv9bV8
         xP7GVU6WN+kkXW/q3kLeTRnSZGSIv19U2e5nJBRlk+YG500uvohHnUrBvMYU4L1K9dO+
         Mvfw==
X-Gm-Message-State: AJIora/EBxaBEHTtSoRIgOVkYm4iCU3209IhXw96w+Xb4Ks34LTPpmG0
	/T9Hz+bpiAHJ9aAvVJ6AW0HXbLNoPg==
X-Google-Smtp-Source: 
 AGRyM1uimHXbdwtOWM4+K+GimBg7GzUXCiPdnXenYleNT5ktdM4GHVKU6u3edZLQP2SuhEdia1DrTw==
X-Received: by 2002:a05:6512:3084:b0:47f:6c9e:952e with SMTP id
 z4-20020a056512308400b0047f6c9e952emr1711104lfd.332.1655666450146;
        Sun, 19 Jun 2022 12:20:50 -0700 (PDT)
Received: from pneves-XPS-15-9550.home (83.11.57.73.ipv4.supernova.orange.pl.
 [83.11.57.73])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a2eb741000000b0025a59470621sm817020ljo.26.2022.06.19.12.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:20:49 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v6 6/7] utils: Add cmdline_shebang_wrapper util.
Date: Sun, 19 Jun 2022 21:20:40 +0200
Message-Id: <20220619192041.1113263-6-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220619192041.1113263-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220619192041.1113263-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:20:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167044

Useful to work around shebang relocation issues, where
shebangs are too long or have arguments in them, thus preventing them
from using the /usr/bin/env shebang.
---
 .../wrapper/cmdline-shebang-wrapper-test.bb   | 21 ++++++++++++
 .../recipes-test/wrapper/files/test.awk       |  2 ++
 meta/classes/utils.bbclass                    | 34 +++++++++++++++++++
 meta/lib/oeqa/selftest/cases/wrapper.py       | 11 ++++++
 4 files changed, 68 insertions(+)
 create mode 100644 meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
 create mode 100644 meta-selftest/recipes-test/wrapper/files/test.awk
 create mode 100644 meta/lib/oeqa/selftest/cases/wrapper.py

diff --git a/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
new file mode 100644
index 0000000000..c4126a41fc
--- /dev/null
+++ b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Check that create_cmdline_shebang works"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI += "file://test.awk"
+
+EXCLUDE_FROM_WORLD = "1"
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/test.awk ${D}${bindir}/test
+    sed -i -e 's|@AWK_BIN@|${bindir}/awk|g' ${D}${bindir}/test
+    create_cmdline_shebang_wrapper ${D}${bindir}/test
+    if [ $(${D}${bindir}/test) != "Don't Panic!" ]; then
+        bbfatal "Wrapper is broken"
+    else
+        bbnote "Wrapper is good"
+    fi
+}
+
+BBCLASSEXTEND = "native"
diff --git a/meta-selftest/recipes-test/wrapper/files/test.awk b/meta-selftest/recipes-test/wrapper/files/test.awk
new file mode 100644
index 0000000000..91429197b1
--- /dev/null
+++ b/meta-selftest/recipes-test/wrapper/files/test.awk
@@ -0,0 +1,2 @@
+#! @AWK_BIN@ -f
+BEGIN { print "Don't Panic!" }
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index b4eb3d38ab..b58c22771f 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -184,6 +184,40 @@ END
 	chmod +x $cmd
 }
 
+create_cmdline_shebang_wrapper () {
+	# Create a wrapper script where commandline options are needed
+	#
+	# These are useful to work around shebang relocation issues, where shebangs are too
+	# long or have arguments in them, thus preventing them from using the /usr/bin/env
+	# shebang
+	#
+	# Usage: create_cmdline_wrapper FILENAME <extra-options>
+
+	cmd=$1
+	shift
+
+	echo "Generating wrapper script for $cmd"
+
+	# Strip #! and get remaining interpreter + arg
+	argument="$(sed -ne 's/^#! *//p;q' $cmd)"
+	# strip the shebang from the real script as we do not want it to be usable anyway
+	tail -n +2 $cmd > $cmd.real
+	cmdname=$(basename $cmd)
+	dirname=$(dirname $cmd)
+	cmdoptions=$@
+	if [ "${base_prefix}" != "" ]; then
+		relpath=`python3 -c "import os; print(os.path.relpath('${D}${base_prefix}', '$dirname'))"`
+		cmdoptions=`echo $@ | sed -e "s:${base_prefix}:\\$realdir/$relpath:g"`
+	fi
+	cat <<END >$cmd
+#!/usr/bin/env bash
+realpath=\`readlink -fn \$0\`
+realdir=\`dirname \$realpath\`
+exec -a \$realdir/$cmdname $argument \$realdir/$cmdname.real $cmdoptions "\$@"
+END
+	chmod +x $cmd
+}
+
 create_wrapper () {
 	# Create a wrapper script where extra environment variables are needed
 	#
diff --git a/meta/lib/oeqa/selftest/cases/wrapper.py b/meta/lib/oeqa/selftest/cases/wrapper.py
new file mode 100644
index 0000000000..6de63310c0
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/wrapper.py
@@ -0,0 +1,11 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class WrapperTests(OESelftestTestCase):
+    def test_shebang_wrapper(self):
+        """
+        Summary:   Build a recipe which will fail if the cmdline_shebang_wrapper function is defective.
+        Expected:  Exit status to be 0.
+        Author:    Paulo Neves <ptsneves@gmail.com>
+        """
+        res = bitbake("cmdline-shebang-wrapper-test -c install", ignore_status=False)
-- 
2.25.1


