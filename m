Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04772C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 21:43:32 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.32845.1654897407602742861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LAn0p21r;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id o16so196903wra.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CR6UkZUuS6acAAgx24EaiP1da4rnTNHECXKHjjMSFiY=;
        b=LAn0p21rNgymfz4O2qKn41u45SDadMKU6g5w9Jk9m9Usu0gsb1rrs3rMDlPAnAOvOZ
         gyWqszPWzP6ZMexykf/XfbyVqepkJsmBxKkYTL7aS/3xoK2e+WQc65CaKMAM/SaHLACa
         5NcvMoU6hfiVwQ8STiZtqU+4f/KCyhi1MOjWP257nndFuXvp5EjBR3yptL8pnW4gEKef
         229VL7xsy0MpYShUT9PaNRaZRAyl6CfnvRUisSaAAkE7Uum0J4rnLc7MU9zmX78s/F1w
         lSSJ3gzy2fuknVIok2FTP/+KkM6nL2hS9+Ttxa115z4dScKC00sqjyR0JlqxDQ/YVvkV
         kelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CR6UkZUuS6acAAgx24EaiP1da4rnTNHECXKHjjMSFiY=;
        b=loX4SqaFpqLaBdMwFUoHf1/BPqlUnHNr6CD70X345H6qm4t4c8PWDmBmyS1LrfwcBx
         2R0RtnuDbXaixaS+n+CqeG+Cmd3cZ3pIBq/xaRfZg2bG6R/G9GZ5uc1a9VNNxO5LGa0r
         O28UW8r4DjWFSdREfjOmWEK26+N6LQg+vUtkyCcTLjH9mbe35I1qAI2opdXmKiN++KT+
         a3ZVxVjppj8mrT4+g1LixPxbMho9HavN3o3D6CUoDADAsFNjzu1yQyjf3Rm4LcMvvLgd
         Q9xnBUWYg46ZFKrAvhsjXEgypWBwGbeH+8v6v80Jed6Yg1kkVAq7me/J6VQPR10jl0RD
         5sgw==
X-Gm-Message-State: AOAM5337AYB7XXVMlw28+Fr9DopylVO2iVsOcTjsNALKgsgFaLkfoL/G
	+2zlbWDc0Gm9rkH8ybgbvy6hfiU4gg==
X-Google-Smtp-Source: 
 ABdhPJzgCvJBxYBMx5S9hTNb9wVnPbrtFt5I45Vg8SUgCdoVWGDEdURZ3rVGYjasJGibi6oDY6CaRQ==
X-Received: by 2002:adf:e30f:0:b0:210:346e:d5da with SMTP id
 b15-20020adfe30f000000b00210346ed5damr44896667wrj.313.1654897406207;
        Fri, 10 Jun 2022 14:43:26 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 e15-20020adfe7cf000000b0020feb9c44c2sm579309wrn.20.2022.06.10.14.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 14:43:25 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v3 6/7] utils: Add cmdline_shebang_wrapper util.
Date: Fri, 10 Jun 2022 23:43:13 +0200
Message-Id: <20220610214314.2754247-6-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610214314.2754247-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220610214314.2754247-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 21:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166818

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
index 0000000000..302eea8901
--- /dev/null
+++ b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
@@ -0,0 +1,21 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+SUMMARY = "Check that create_cmdline_shebang works"
+LICENSE = "CLOSED"
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
index b4eb3d38ab..b617632d9f 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -184,6 +184,40 @@ END
 	chmod +x $cmd
 }
 
+create_cmdline_shebang_wrapper () {
+	# Create a wrapper script where commandline options are needed
+	#
+	# These are useful to work around shebang relocation issues, where shebangs are too
+  # long or have arguments in them, thus preventing them from using the /usr/bin/env
+	# shebang
+	#
+	# Usage: create_cmdline_wrapper FILENAME <extra-options>
+
+	cmd=$1
+	shift
+
+	echo "Generating wrapper script for $cmd"
+
+  # Strip #! and get remaining interpreter + arg
+  argument="$(basename "$(head -n1 $cmd | sed -e 's|#![ ]*||g' )")"
+  # strip the shebang from the real script as we do not want it to be usable anyway
+  tail -n +2 $cmd > $cmd.real
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


