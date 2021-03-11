Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.6353.1615471096988044679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 05:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ay8hztuo;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id 73so1152524qtg.13
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 05:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B4lAwLIVNRV2Ua5ih/SJtISgxgZgnG+cevRi9ycgwp4=;
        b=Ay8hztuojBONMaiQbgSTJ3KceiEcKnAky9JxpJmBbR5HpS57WkjJXCg+745jfMNtMi
         k9ISLeDwbcfr4RykPJCcQBw3haXlnkc+c+qomQ/6C6F2O82k5iZrA0OB7QtmmIOtBGRR
         +sUiC63DFyZ+aboGl9jQORMn4P2KWGGaCL5dqInJQQpDJ0+XEh+fx54eTXxMdtJX0LYL
         xJWhUMEzGq98wdXXNkMDzTJ/EnrkP87pg8Nl+ffcQMMFgbR5mpmHO7kkqv07odmoj8f3
         DjJnt4CUjZA/IlBxwANDgyjTS/9yEwtZP4apS7NwGvJYitbXhg83lFJ22J1mSPmbzoJ6
         0r/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B4lAwLIVNRV2Ua5ih/SJtISgxgZgnG+cevRi9ycgwp4=;
        b=AzBEuVs791jjQ4fjQbDJiwvtruRIMBk+clWgEvYgKtnF9G4QZUHOtwJLQNJdGJAqwK
         2an2HZOAwmjRTI7pV1uU654F1RqhIoXRZH7sxiirjLyygPGEQ9n6N/SZtDMNEdkAWYJd
         nhQLgne8gzk/aZgUbcuCFFiUgGQ2+WU4mo8vews1uRpzMl1VXF7zcOwmVL79i/2+KB1P
         /OFypeKIvVT6uMlrI6UbnJa0O8Qjhl9A96EJApHbZ1SgZzXQ5dapkjfhXuxuwL7PkNCk
         mMTtnYGSzgnfJQNPESzplZNQT7S+NsTDfeUpKgjCvCGjiTwu4bhn7f56p/GhlTneQvLt
         C9OQ==
X-Gm-Message-State: AOAM533ms9WdLCr0GCxyu7asxvqNEtMq25umCpsyBw/l6t3sBfXn0LRO
	/LWoEX0mw5/XnKws5jPqHTc=
X-Google-Smtp-Source: ABdhPJzWDovdDvJsp61zH0PbUsZFjK/8KpMnVp8usrZ3UpQrF3xcIkV8csGIXCsta3eIfTPS6HFgZA==
X-Received: by 2002:ac8:4e86:: with SMTP id 6mr7378924qtp.213.1615471095998;
        Thu, 11 Mar 2021 05:58:15 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id m3sm1894550qkk.15.2021.03.11.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 05:58:15 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: reproducibility fixes for pmu-events.c
Date: Thu, 11 Mar 2021 08:58:14 -0500
Message-Id: <20210311135814.38512-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

perf generates pmu-events.c as part of the build process. The
code that generates the events is doing tree walks and potentially
other non-determinstic things.

We'd rather not mess with that implementation, so we add a script
that knows how to read the pmu-events.c, sort the entries and then
copy it over the generated one.

With this, we should always have events in the same order, improving
reproducibility.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb              | 16 ++++
 .../perf/perf/sort-pmuevents.py               | 93 +++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100755 meta/recipes-kernel/perf/perf/sort-pmuevents.py

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2beb404c03..c7653e523c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -250,6 +250,14 @@ do_configure_prepend () {
         # all the calls have YFLAGS, which contains prefix mapping information.
         sed -i -e 's,$(YACC),$(YACC) $(YFLAGS),g' ${S}/scripts/Makefile.host
     fi
+    if [ -e "${S}/tools/perf/pmu-events/Build" ]; then
+        target='$(OUTPUT)pmu-events/pmu-events.c $(V)'
+        replacement1='$(OUTPUT)pmu-events/pmu-events.c $(V)\n'
+        replacement2='\t$(srctree)/sort-pmuevents.py $(OUTPUT)pmu-events/pmu-events.c $(OUTPUT)pmu-events/pmu-events.c.new\n'
+        replacement3='\tcp $(OUTPUT)pmu-events/pmu-events.c.new $(OUTPUT)pmu-events/pmu-events.c'
+        sed -i -e "s,$target,$replacement1$replacement2$replacement3,g" \
+                       "${S}/tools/perf/pmu-events/Build"
+    fi
     # end reproducibility substitutions
 
     # We need to ensure the --sysroot option in CC is preserved
@@ -292,6 +300,14 @@ do_configure_prepend () {
     # so we copy it from the sysroot unistd.h to the perf unistd.h
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/uapi/asm-generic/unistd.h
+
+    # the fetcher is inhibited by the 'inherit kernelsrc', so we do a quick check and
+    # copy for a helper script we need
+    for p in $(echo ${FILESPATH} | tr ':' '\n'); do
+	if [ -e $p/sort-pmuevents.py ]; then
+	    cp $p/sort-pmuevents.py ${S}
+	fi
+    done
 }
 
 python do_package_prepend() {
diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
new file mode 100755
index 0000000000..5ddf0f144f
--- /dev/null
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -0,0 +1,93 @@
+#!/usr/bin/env python3
+
+# perf pmu-events sorting tool
+#
+# Copyright (C) 2021 Bruce Ashfield
+#
+# SPDX-License-Identifier: MIT
+#
+
+import sys
+import os
+import re
+from collections import OrderedDict
+
+if len(sys.argv) < 2:
+    print( "[ERROR]: input and output pmu files missing" )
+    sys.exit(1)
+
+if len(sys.argv) < 3:
+    print( "[ERROR]: output pmu file missing" )
+    sys.exit(1)
+
+infile = sys.argv[1]
+outfile = sys.argv[2]
+
+if not os.path.exists(infile):
+    print( "ERROR. input file does not exist: %s" % infile )
+    sys.exit(1)
+
+if os.path.exists(outfile):
+    print( "WARNING. output file will be overwritten: %s" % infile )
+
+with open(infile, 'r') as file:
+    data = file.read()
+
+preamble_regex = re.compile( '^(.*?)^struct', re.MULTILINE | re.DOTALL )
+
+preamble = re.search( preamble_regex, data )
+struct_block_regex = re.compile( '^struct.*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
+field_regex =  re.compile( '{.*?},', re.MULTILINE | re.DOTALL )
+cpuid_regex = re.compile( '\.cpuid = (.*?),', re.MULTILINE | re.DOTALL )
+name_regex = re.compile( '\.name = (.*?),', re.MULTILINE | re.DOTALL )
+
+# create a dictionary structure to store all the structs, their
+# types and then their fields.
+entry_dict = {}
+for struct in re.findall( struct_block_regex, data ):
+    # print( "struct: %s %s" % (struct[0],struct[1]) )
+    entry_dict[struct[1]] = {}
+    entry_dict[struct[1]]['type'] = struct[0]
+    entry_dict[struct[1]]['fields'] = {}
+    for entry in re.findall( field_regex, struct[2] ):
+        #print( "    entry: %s" % entry )
+        cpuid = re.search( cpuid_regex, entry )
+        if cpuid:
+            #print( "    cpuid found: %s" % cpuid.group(1) )
+            entry_dict[struct[1]]['fields'][cpuid.group(1)] = entry
+            
+        name = re.search( name_regex, entry )
+        if name:
+            #print( "    name found: %s" % name.group(1) )
+            entry_dict[struct[1]]['fields'][name.group(1)] = entry
+        
+
+# created ordered dictionaries from the captured values. These are ordered by
+# a sorted() iteration of the keys. We don't care about the order we read
+# things, just the sorted order. Hency why we couldn't create these during
+# reading.
+#
+# yes, there's a more concise way to do this, but our nested dictionaries of
+# fields make it complex enough that it becomes unreadable.
+entry_dict_sorted = OrderedDict()
+for i in sorted(entry_dict.keys()):
+    entry_dict_sorted[i] = {}
+    entry_dict_sorted[i]['type'] = entry_dict[i]['type']
+    entry_dict_sorted[i]['fields'] = {}
+    for f in sorted(entry_dict[i]['fields'].keys()):
+        entry_dict_sorted[i]['fields'][f] = entry_dict[i]['fields'][f] 
+
+# dump the sorted elements to the outfile
+outf = open( outfile, 'w' )
+
+print( preamble.group(1) )
+outf.write( preamble.group(1) )
+for d in entry_dict_sorted:
+    outf.write( "struct %s %s[] = {\n" % (entry_dict_sorted[d]['type'],d) )
+    for f in entry_dict_sorted[d]['fields']:
+        outf.write( entry_dict_sorted[d]['fields'][f] + '\n' )
+
+    outf.write( "};\n" )
+
+outf.close()
+    
-- 
2.19.1

