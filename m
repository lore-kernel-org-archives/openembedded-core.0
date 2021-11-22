Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA81C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 16:35:35 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.220.1637598934502811192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 08:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DMSRPH2J;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id i5so33877958wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 08:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zSWZfOrsWCYFtpZz2ZPwkziMuqLEGfZP3DAnFIAT0f0=;
        b=DMSRPH2JDczOn8CAmv3zKy5EhDve6EuTWepa046dJlLMB9+w3FMsyfibM0Drn7XATU
         bRQzIWxtCKm5oNS85rhZZwAtWm2ppYia818qZXd8mSGSvKDboJCNiYcXhhLiwPugL3fS
         5X6iTxI2zwJyOE9AysTuiDDqMu0OCP+VXGNRQeIGmI8Yl2EwYzBkrOvKJtk6+YW8fxro
         +pxj3uszJRll/ysT799HNDLnJT06cm+JWalLvz0MSnYBsxOZxdv9RBZe0VCKfJKd2vLL
         ufPPkuV463DB4LdVQJ6QE37xhsWVIzZM+7bsIlUBITCQufORADzDZzNNUeYkz0dKiiX7
         sczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zSWZfOrsWCYFtpZz2ZPwkziMuqLEGfZP3DAnFIAT0f0=;
        b=FKx7krahgXJAEK9ZqdHeqajVxacKK1i6XVN93UCkBuaRkInOaZgDgN4aLeTbMP2LvF
         GRx02bmmmUUFoIlgLh5HoEB8iYTFypUJI1vyVUFdS13GbRp6aibQKKoQVe7JNXIUP6EM
         9s+7w1a9NlxowqPwe+GOhGbgEVtKHb5Zxq9yfzb1cSVZBxq6LlA2e7y2u7zAGbNowExz
         tBhQvnePnNo3G2oxYN9fzdYVaG14V/pmZip6DxxwXmF22LBgtaXXlX5GRkKjLZfFzFrK
         x0msFXnczd4/C9oMMQerzP9C8B8dSM0VxXslhjngA947YhGvFxkuAp1FzOI9fc9F4H4b
         7rAw==
X-Gm-Message-State: AOAM532nKIOo1+BrY6j/22fswThAA7qhzksh7xyU3hA/OjSAnvxAnbld
	8SzVcUG2guD3jPWDwxiBi0VRGMxCVJkDjw==
X-Google-Smtp-Source: 
 ABdhPJzGGKSrNxAkNsS+1SzIQjTyPEQ24MX1GlzuhTFOJ0FrZt+xsclsYbTl5Rpiv1BjJjF5dckeyw==
X-Received: by 2002:adf:d0c2:: with SMTP id z2mr39343986wrh.330.1637598932476;
        Mon, 22 Nov 2021 08:35:32 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id
 i17sm11444719wmq.48.2021.11.22.08.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 08:35:32 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][OE-core][Patch 2/2] perf: sort-pmuevents: allow for additional
 type qualifiers and storage class
Date: Mon, 22 Nov 2021 17:34:59 +0100
Message-Id: <20211122163459.41079-3-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211122163459.41079-1-max.krummenacher@toradex.com>
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 16:35:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158584

With kernel 5.16 some structs in pmu-events do get a const qualifier, some
a static const storage class and qualifier.

The current sort-pmuevents cannot cope with that and drops all struct
arrays with such additional elements. This then leads to compiler errors.

Allow '^struct', '^const struct', '^static struct', '^static const struct'.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
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
2.20.1


