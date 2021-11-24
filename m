Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F324C4332F
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:50 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.4000.1637788489716341549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hJWIwIc7;
 spf=pass (domain: gmail.com, ip: 209.85.219.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id a24so2649913qvb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/LvK7emFZetd2AFhidjx/YOdFE3FLG0Gmrj8f0YB2Bk=;
        b=hJWIwIc7njDxIGPYQROKkjeGVfmVjIyfcAieT9PR5MbKnVXiyT2aeP3H4MeZn4bmUf
         DimUoeF2Vy2HrvRht98uWw75mysXTghKdT2VeOCRV1RScLELBGqrf/7MFe6mziIWCuuk
         QW+B7eXEu044qmKlfCxFHK9U2LXjmGv8iG2ilZhxzV1emHSdiW9ncPpMVHbPnpIKNICQ
         AZFXg0/hVUa9kiYrVNfMfCXJxoAUpWsNtXErtl4ygt3xvYhGkJG+kzuSQJte3zJQ0OkE
         tw7+0+T90Mx+Ns2bxTk/dBl0rMPHbsGdtB0rxTMOgNPV/gKFEqAS0+ox6kTyF4PDIA8Q
         wiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/LvK7emFZetd2AFhidjx/YOdFE3FLG0Gmrj8f0YB2Bk=;
        b=oG1DY7cAc5tztyCX4LvmloAOVg4CCXQvJrGAd3f1s80VUGJxvQnqRj1GLYb30IJYf6
         wCoKyfK5y8gRNvSzWthr60sPz9ewyu6D4KKHSXOOLbgR1RhKEFvfijXUHz/pMQMSWCOi
         BfBJYb353vlxDfsoPs8RUsLTShLD/i33VliCAe1diTwdMVBXcfTy8zNu05BQt/+6bPmg
         6pAJ7aXtG8j05h+2oyxjkHg28GwJu0ryax39+/wS/z1rBT7qDttA1HBiB2YXXBq4y8ID
         oMaTgYHMzSST6kF7PlC8ThbN7VHcT9TX+BXTk3q2LkY2S84e8b1D6jZuc2Jy8Oayu8kh
         RpXA==
X-Gm-Message-State: AOAM5324vxfATJl6SsnrTGQDlRZzS8zkyDQuAcelNC9I2JFusluJRv4Y
	7qITfKANJ7xGprCP3ZHw8U4=
X-Google-Smtp-Source: 
 ABdhPJysgB1eS7MS7YCWKP4KCqDHJw58n7XVrPKLstaL2HHQFR3po1dLQFnkrkVr0PFyhYzv/4ceUw==
X-Received: by 2002:a05:6214:5198:: with SMTP id
 kl24mr11686508qvb.6.1637788488879;
        Wed, 24 Nov 2021 13:14:48 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:48 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 20/20] perf: sort-pmuevents: allow for additional type
 qualifiers and storage class
Date: Wed, 24 Nov 2021 16:14:26 -0500
Message-Id: 
 <487361c5d91ff9389454f1ef3577038a9878e116.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158766

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


