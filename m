Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C01C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 13:17:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.6119.1655212624367329031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EA8I3mPZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id h5so11313104wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CR6UkZUuS6acAAgx24EaiP1da4rnTNHECXKHjjMSFiY=;
        b=EA8I3mPZDJjyq8mRgWB8T7otdQWzNgEVa+kZ9ByhAmsXxLWmyxfTuRDJEJgIp8a8wO
         ulxufCeQ0KWBIY25ijUJ581MxNV7jFb1FqIqAfJDlS29fygF5Y85CbFO/fRWh/vYDu3R
         hLZIy/XzeODhtTp+JoLLcZBNaYn7PuxMV5CJ7+b0X8ew9qYi+BT2d+Egn1T9JmdFN9BL
         06LDSf+0mwQd2KZRHofIQZiA0/ldMx70tMhVYfPjt6kdVdzr7gaxquOJA04ZDE8rfYvv
         7KjySXfT8MMunDSQfOpuGQA1DkbNIcE4HHrKf4sS59AvIfsMQfDTrrYrGiVLhkqe4K8b
         jLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CR6UkZUuS6acAAgx24EaiP1da4rnTNHECXKHjjMSFiY=;
        b=7hXNYrBIilFvfjB8/la2xEK7t/miU7EQ8Xy8CjZIH3O/rC7QZ2XSkErjqoL1Gi1LY/
         T3N1YaPQuLw/odDu2FYwkw5GHl/xIj3XXRo/S+JtJKi6qhfrgbcCrLdgsmywkcx2vIql
         CnJ8QdAPxTx1OfPDBgziPt16gfrz8rW0Mn1e2XbkPN5Vg5VnABswJMRrD622hsZqWc1k
         3pTXvxlGe+GnhcSQlyF8zB5ndyyoafc2HeguT9taKSnLZ95U6sZdbBjSmrmROWSZAX3Z
         WVCnmUJHChuAYUWAH8IEYm+kqUxn+6qpes0MZsEv10fzfZC7MkYbdBwRRF8Hdf2Cfpwi
         TnWw==
X-Gm-Message-State: AJIora/lf6zPD3ZP8UV33yZKVp1x/wAFofiLv4aQc9IhAnfG4skV4vln
	iTix9tg/RehUyRdUW+PgXttDybl6kQ==
X-Google-Smtp-Source: 
 AGRyM1uOs0oxabxQAjK1p8sikDXfSisFtzm7BcYu1K95HQn12N8yKqmtdst+Ybtoew2/KyOTP7G9HQ==
X-Received: by 2002:a5d:6945:0:b0:211:7de7:7247 with SMTP id
 r5-20020a5d6945000000b002117de77247mr4836105wrw.169.1655212622934;
        Tue, 14 Jun 2022 06:17:02 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a5d6f0f000000b002183cf9cd69sm12161092wrb.15.2022.06.14.06.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 06:17:02 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v4 6/7] utils: Add cmdline_shebang_wrapper util.
Date: Tue, 14 Jun 2022 15:16:51 +0200
Message-Id: <20220614131652.566471-6-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614131652.566471-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614131652.566471-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 13:17:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166887

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


