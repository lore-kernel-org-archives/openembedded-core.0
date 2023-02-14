Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E09C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 16:34:15 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.11912.1676392448651248062
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 08:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pXQYnkGK;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id a23so10557751pga.13
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hmQsTZ986ndukYfGGlCnEpUHJ3EvHjosbKIPW/eDw2I=;
        b=pXQYnkGKkoNmurlOoxblE1ZkYaDvOOkaIrkcBZQkAmfyq0Gc1I+kca9QbU/qdhgay3
         4SsuM7jSeIFNIiP9WZDNd3vOG/Jk/MQHmnV+aUH4hLIUFbi9f8PuxWXnxaI24qWbajOd
         Za3MHl4Iw3c7vxa97pcGQKxg4AExzHtO7M9MRkTw9mp71+ubB6kJiYeSf+6GIsNbospi
         jxOaDdk8br81tT/jNK5ma4wuZWo/BMM4qMuqbNwtS0v/GH0kNY4v9f0zsXvk6g36ND1M
         lYfOsP9kibSX7L03oZbSd8AnjTQZh9pYUDWhF3czfMilYryAZxZcHwHCI0NPjORYWFHf
         rz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmQsTZ986ndukYfGGlCnEpUHJ3EvHjosbKIPW/eDw2I=;
        b=sKdWJPMg0LTW0Vn8zfSo3nymQLsdO1zyWWccwSlOvZRKt7QS8qRfM14bfxKvha8tdy
         NZK7t+aiMviNulILUS71XJsBgdsi3v7XGZUfl37m4jn3B0GMm37iO/wZdRiqODCnN/ZN
         kbjGC0cQFNjlP7Hblz5EzDi3h4A1xbwl/4Mtu+fFwVl7BmzYOXH9UhFY5njdS+O3m+UV
         Jr/NLsC5FGvrnndK1iXlVY5iz2pxj4VpM0F92hdbqbstqZKhuabuwCcGoQe0fBbfeQCd
         gtXF+O6EczJgjKvxN81//TXfor7Ojjh+rLQN0aoSjnfYhOl7KdZFE76bN4xskzqg8ml7
         +vrw==
X-Gm-Message-State: AO0yUKXISz0M+dI5YkYwPr7abrAHJo9PKIar5a8Od14EjouTBLVmx0W7
	zlMzxvCXDSXUfmWPUtrQfMbDkF1aVns=
X-Google-Smtp-Source: AK7set8ztlNf0bkyl+68Ncfn663hW8YPmLOvpejaJD8vIq35lxVAthrb8odnF5ScYh82+gCxtMs7sg==
X-Received: by 2002:a62:1c4a:0:b0:596:15de:ea1e with SMTP id c71-20020a621c4a000000b0059615deea1emr2085631pfc.9.1676392447267;
        Tue, 14 Feb 2023 08:34:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::789d])
        by smtp.gmail.com with ESMTPSA id k17-20020aa790d1000000b0058da7e58008sm10017536pfk.36.2023.02.14.08.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 08:34:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] elfutils: Backport fix for DW_TAG_unspecified_type handling
Date: Tue, 14 Feb 2023 08:34:04 -0800
Message-Id: <20230214163404.100597-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177155

Re-enable funcretval tests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils_0.188.bb                |  3 +-
 .../handle_DW_TAG_unspecified_type.patch      | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/handle_DW_TAG_unspecified_type.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.188.bb b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
index 182229becf..74271b2411 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.188.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-PR29926-debuginfod-Fix-usage-of-deprecated-CURLINFO_.patch \
            file://0002-debuginfod-client-Use-CURLOPT_PROTOCOLS_STR-for-libc.patch \
+           file://handle_DW_TAG_unspecified_type.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
@@ -98,8 +99,6 @@ do_install_ptest() {
 		cp -r ${B}/debuginfod                   ${D}${PTEST_PATH}
 		sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
 		find ${D}${PTEST_PATH} -type f -name *.[hoc] | xargs -i rm {}
-		# TODO: remove below filter after https://sourceware.org/bugzilla/show_bug.cgi?id=30047 is fixed
-		sed -i -e '/funcretval/d' ${D}${PTEST_PATH}/tests/run-native-test.sh
 	fi
 }
 
diff --git a/meta/recipes-devtools/elfutils/files/handle_DW_TAG_unspecified_type.patch b/meta/recipes-devtools/elfutils/files/handle_DW_TAG_unspecified_type.patch
new file mode 100644
index 0000000000..8cab01c29a
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/handle_DW_TAG_unspecified_type.patch
@@ -0,0 +1,88 @@
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 26 Jan 2023 17:19:15 +0000 (+0100)
+Subject: backends: Handle DW_TAG_unspecified_type in dwarf_peeled_die_type
+X-Git-Url: https://sourceware.org/git/?p=elfutils.git;a=commitdiff_plain;h=f2c522567ad63ac293535fba9704895e685ab5bc;hp=3fa98a6f29b0f370e32549ead7eb897c839af980
+
+backends: Handle DW_TAG_unspecified_type in dwarf_peeled_die_type
+
+binutils 2.40 introduces DW_TAG_unspecified_type for assembly
+functions with an unknown return type. This breaks the
+run-funcretval.sh testcase because dwfl_module_return_value_location
+returns an error for such functions because it cannot determine the
+return value location. Fix that by treating DW_TAG_unspecified_type
+as if the DIE doesn't have a DW_AT_type.
+
+Also update the testcase to explicitly checking for
+DW_TAG_unspecified_type and printing "returns unspecified type".
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=30047
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=f2c522567ad63ac293535fba9704895e685ab5bc;hp=3fa98a6f29b0f370e32549ead7eb897c839af980]
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+---
+
+--- a/backends/libebl_CPU.h
++++ b/backends/libebl_CPU.h
+@@ -1,5 +1,6 @@
+ /* Common interface for libebl modules.
+    Copyright (C) 2000, 2001, 2002, 2003, 2005, 2013, 2014 Red Hat, Inc.
++   Copyright (C) 2023 Mark J. Wielaard <mark@klomp.org>
+    This file is part of elfutils.
+ 
+    This file is free software; you can redistribute it and/or modify
+@@ -53,7 +54,9 @@ extern bool (*generic_debugscn_p) (const
+      dwarf_tag (_die); })
+ 
+ /* Get a type die corresponding to DIE.  Peel CV qualifiers off
+-   it.  */
++   it.  Returns zero if the DIE doesn't have a type, or the type
++   is DW_TAG_unspecified_type.  Returns -1 on error.  Otherwise
++   returns the result tag DW_AT value.  */
+ static inline int
+ dwarf_peeled_die_type (Dwarf_Die *die, Dwarf_Die *result)
+ {
+@@ -69,7 +72,14 @@ dwarf_peeled_die_type (Dwarf_Die *die, D
+   if (dwarf_peel_type (result, result) != 0)
+     return -1;
+ 
+-  return DWARF_TAG_OR_RETURN (result);
++  if (result == NULL)
++    return -1;
++
++  int tag = dwarf_tag (result);
++  if (tag == DW_TAG_unspecified_type)
++    return 0; /* Treat an unspecified type as if there was no type.  */
++
++  return tag;
+ }
+ 
+ #endif	/* libebl_CPU.h */
+--- a/tests/funcretval.c
++++ b/tests/funcretval.c
+@@ -1,5 +1,6 @@
+ /* Test program for dwfl_module_return_value_location.
+    Copyright (C) 2005 Red Hat, Inc.
++   Copyright (C) 2023 Mark J. Wielaard <mark@klomp.org>
+    This file is part of elfutils.
+ 
+    This file is free software; you can redistribute it and/or modify
+@@ -67,7 +68,18 @@ handle_function (Dwarf_Die *funcdie, voi
+     error (EXIT_FAILURE, 0, "dwfl_module_return_value_location: %s",
+ 	   dwfl_errmsg (-1));
+   else if (nlocops == 0)
+-    puts ("returns no value");
++    {
++      // Check if this is the special unspecified type
++      // https://sourceware.org/bugzilla/show_bug.cgi?id=30047
++      Dwarf_Die die_mem, *typedie = &die_mem;
++      Dwarf_Attribute attr_mem, *attr;
++      attr = dwarf_attr_integrate (funcdie, DW_AT_type, &attr_mem);
++      if (dwarf_formref_die (attr, typedie) != NULL
++	  && dwarf_tag (typedie) == DW_TAG_unspecified_type)
++	puts ("returns unspecified type");
++      else
++	puts ("returns no value");
++    }
+   else
+     {
+       printf ("return value location:");
-- 
2.39.1


