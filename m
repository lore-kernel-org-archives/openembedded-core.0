Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6405C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:12 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.862.1637704692026792550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CRgjlC4b;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id t11so717175qtw.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/LvK7emFZetd2AFhidjx/YOdFE3FLG0Gmrj8f0YB2Bk=;
        b=CRgjlC4b34VEnWsClXv510kUIZesLjwxZG2cBq4jAdQDLbGwwBYiH2zHXw/mSGogjJ
         7hotszLijkVtgMs3aBf5zPoVcea2n+qWZg4qB4nBX9/TsdNyYZe48SMrifRx0ISwbHoF
         Pibo0eN9Moe1TdUAW2Nihyzfcg9S9jVrnebPUAJGTvO4Cw0wNP1lbA1+n6fsojhb15lf
         QjiIVXJtq4MroWgbxF4LsUpy5Zp7DcsqR8+E4BF/m6+0cnuFzYrytH3wqm6ruITdxwr0
         AjGJfpdfHce/4hYugDW3ANNM391NDELG4chftmB1yW5slz+29MFhsiN8rBIL0etvjYLq
         tM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/LvK7emFZetd2AFhidjx/YOdFE3FLG0Gmrj8f0YB2Bk=;
        b=Q7KMahpa01mFTsNbT6OW7OC8r0FupplLQBGl3vsf2CSGxwp9QxpfVfnAhYe2BLctpI
         9R5YnkzMT/ncPl/qHwsv8WZC3SxDTqz9pQ7/dRa9zRfwrpIwoLAt0Fhf/OJPrl8LFpvx
         5oIn6JRhaxMvoVMASiW9Xb1tqCdcZs8Y7k+TLvTBiJPzh0hjI+/OS4KG/+R1FHdwzBaZ
         MPfKTxFPCFBqW2rrLR1LKdUFFTOQsgsCpzh9UnVP7FsyXWFQsiOBwlxKgo2AEeQ8iWKo
         GPp2NPfvUb4oubqxlEr8DK5XQbBJ1REZYB03qFRRCbO8IfiJT5lC7fZUTeZSkzmB4S9W
         PlBg==
X-Gm-Message-State: AOAM5317MpDC1Krbaht2hZ/ATXjQc0QYzVUavaG5rNYt3fLgRo/9f3mj
	JKHSo7XxuLSaq5UNOC23IJAJuwIAhpA+xg==
X-Google-Smtp-Source: 
 ABdhPJyEoIX/Ryk8lHZaZeRV6RL3y3wgZ1+ADErg6wH9gWUImgz9CVENCLgGEVfEPD4sWMCGLBSbhQ==
X-Received: by 2002:a05:622a:1a05:: with SMTP id
 f5mr832671qtb.283.1637704691020;
        Tue, 23 Nov 2021 13:58:11 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:58:10 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 20/20] perf: sort-pmuevents: allow for additional type
 qualifiers and storage class
Date: Tue, 23 Nov 2021 16:57:47 -0500
Message-Id: 
 <8cdf4e7f12de93155719d03a3cf27176993b28b9.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158641

From: Max Krummenacher <max.oss.09@gmail.com>

With kernel 5.16 some structs in pmu-events do get a const qualifier, some
a static const storage class and qualifier.

The current sort-pmuevents cannot cope with that and drops all struct
arrays with such additional elements. This then leads to compiler errors.

Allow '^struct', '^const struct', '^static struct', '^static const struct'.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../perf/perf/sort-pmuevents.py               | 30 ++++++++++---------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index 4f841eb822..09ba3328a7 100755
--- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -33,10 +33,10 @@ if os.path.exists(outfile):
 with open(infile, 'r') as file:
     data = file.read()
 
-preamble_regex = re.compile( '^(.*?)^struct', re.MULTILINE | re.DOTALL )
+preamble_regex = re.compile( '^(.*?)^(struct|const struct|static struct|static const struct)', re.MULTILINE | re.DOTALL )
 
 preamble = re.search( preamble_regex, data )
-struct_block_regex = re.compile( '^struct.*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
+struct_block_regex = re.compile( '^(struct|const struct|static struct|static const struct).*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
 field_regex =  re.compile( '{.*?},', re.MULTILINE | re.DOTALL )
 cpuid_regex = re.compile( '\.cpuid = (.*?),', re.MULTILINE | re.DOTALL )
 name_regex = re.compile( '\.name = (.*?),', re.MULTILINE | re.DOTALL )
@@ -45,24 +45,25 @@ name_regex = re.compile( '\.name = (.*?),', re.MULTILINE | re.DOTALL )
 # types and then their fields.
 entry_dict = {}
 for struct in re.findall( struct_block_regex, data ):
-    # print( "struct: %s %s" % (struct[0],struct[1]) )
-    entry_dict[struct[1]] = {}
-    entry_dict[struct[1]]['type'] = struct[0]
-    entry_dict[struct[1]]['fields'] = {}
-    for entry in re.findall( field_regex, struct[2] ):
+    # print( "struct: %s %s %s" % (struct[0],struct[1],struct[2]) )
+    entry_dict[struct[2]] = {}
+    entry_dict[struct[2]]['type_prefix'] = struct[0]
+    entry_dict[struct[2]]['type'] = struct[1]
+    entry_dict[struct[2]]['fields'] = {}
+    for entry in re.findall( field_regex, struct[3] ):
         #print( "    entry: %s" % entry )
         cpuid = re.search( cpuid_regex, entry )
         if cpuid:
             #print( "    cpuid found: %s" % cpuid.group(1) )
-            entry_dict[struct[1]]['fields'][cpuid.group(1)] = entry
-            
+            entry_dict[struct[2]]['fields'][cpuid.group(1)] = entry
+
         name = re.search( name_regex, entry )
         if name:
             #print( "    name found: %s" % name.group(1) )
-            entry_dict[struct[1]]['fields'][name.group(1)] = entry
-        
-        if not entry_dict[struct[1]]['fields']:
-            entry_dict[struct[1]]['fields']['0'] = entry
+            entry_dict[struct[2]]['fields'][name.group(1)] = entry
+
+        if not entry_dict[struct[2]]['fields']:
+            entry_dict[struct[2]]['fields']['0'] = entry
 
 # created ordered dictionaries from the captured values. These are ordered by
 # a sorted() iteration of the keys. We don't care about the order we read
@@ -74,6 +75,7 @@ for struct in re.findall( struct_block_regex, data ):
 entry_dict_sorted = OrderedDict()
 for i in sorted(entry_dict.keys()):
     entry_dict_sorted[i] = {}
+    entry_dict_sorted[i]['type_prefix'] = entry_dict[i]['type_prefix']
     entry_dict_sorted[i]['type'] = entry_dict[i]['type']
     entry_dict_sorted[i]['fields'] = {}
     for f in sorted(entry_dict[i]['fields'].keys()):
@@ -85,7 +87,7 @@ outf = open( outfile, 'w' )
 print( preamble.group(1) )
 outf.write( preamble.group(1) )
 for d in entry_dict_sorted:
-    outf.write( "struct %s %s[] = {\n" % (entry_dict_sorted[d]['type'],d) )
+    outf.write( "%s %s %s[] = {\n" % (entry_dict_sorted[d]['type_prefix'], entry_dict_sorted[d]['type'],d) )
     for f in entry_dict_sorted[d]['fields']:
         outf.write( entry_dict_sorted[d]['fields'][f] + '\n' )
 
-- 
2.19.1


