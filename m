Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86B2E7718C
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 20:42:02 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.4130.1734727316484557479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 12:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZzwfBMea;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3ebadbb14dcso964344b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 12:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734727314; x=1735332114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12l7Nn23gkoRUSlW2rQg3Z83dBJI0FtaE3fQ1K/Ponk=;
        b=ZzwfBMeae42QVRWKONGt95l2JqZ0yuCK/mnDSSJqWUVYLXOli30I9cKArbmZPqxfE/
         4ScMKga74NX2ovEIBGP2KiVWk+7hbdc9WoNcWUQllJOzpFb2NkOEr90UIOedtv1khM09
         z3s5Vx9WrOnXGkTIaFt4d+Q5jy2OFUufhnVSd3e3smbYRH2qOznNhUyFkz7VvmBgG2A2
         qwFaHKicMXgnWJcdzcRW5N1qpUgIWfZlAhhK/tb8aXhyMATPTPcIe3O6HEzjsHNS0tIr
         oNuVcA7j62qZBYPyI837l4b+ACbCHZ+jsAPDbV44j7lvSVEbxgJ5jrnMRzueaCCSqDoX
         BIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734727314; x=1735332114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12l7Nn23gkoRUSlW2rQg3Z83dBJI0FtaE3fQ1K/Ponk=;
        b=c+9ZuZBViJDjVkDl8VT1tQ92EqcsmFB1rIJ2bZqHOGQyGBE789KJ7qnh8e5IPyguh/
         9xBYVdz9CdEaW0MlB7bRQ4H3IObE+AFgIkxhFnm3cg9GvyLQUVZfTv0DqQlUFV5kcMq1
         HGfnm4oOXckAUdEYHWZee6x0B5QQCvcjO4lEEOUFcch65ChrI2gvncibxaOeNmGfuAeb
         TkQzq4AHFgln531QqJytVNnW4avnOEZdzx/T74Qjp7VsrPxF6TXj8oropcRWPBaKFkgt
         9K4dbKKuDeyLQZUD2dMfjQq0GbUEvVOlQCJAVadVneaVHWKSUVWzqxvsEYZVs3zp5o69
         xFzw==
X-Gm-Message-State: AOJu0YzDv4k+I3yh7foqpmfkAMdrLPVvimCpx6BIqDP8PiRmGJV7+E1o
	JrGyjjl+/oETSDlPaqrKaIr497glICj5CGGPqPOBLDv7cTKsEsY4kh4QXQ==
X-Gm-Gg: ASbGncve5awsCqG7rHL3xHIwA11SkzxknLaEm7RjRo9/8wg87UKLXRhwrFrJQ/FkFYN
	2EHzkFiMeGbuk+xQNNS1NwrMye/g+/19NHtRjpbAXITJ7LYnOOoQZPjgYnzaY223Kqf2QwgHf5R
	MrR0FsHTVsaBk675vXw/zxCgeMHIuxX7/QTECWf95ckhCtiNcNW0HTDidcbzVAmzKly5/jjCmCC
	50F0HfsBVqygVcXSjSWZwx4JOwPW1u3m/RmtbIYAB8g5nN3o0W9yVk=
X-Google-Smtp-Source: AGHT+IFeBGf515h+HVBZOlfLaA0OHlkwJR1NldsI0u6J7ulfQVpJ7l1fXrkLurQQ0+e55PiZ3gs2Zw==
X-Received: by 2002:a05:6808:1906:b0:3eb:5480:59c6 with SMTP id 5614622812f47-3ed890a93aemr2878618b6e.30.1734727314626;
        Fri, 20 Dec 2024 12:41:54 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ece26db9dasm975106b6e.48.2024.12.20.12.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 12:41:53 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/2] lib: configfragements: enable/disable multiple fragements at once
Date: Fri, 20 Dec 2024 13:41:45 -0700
Message-ID: <20241220204145.2636370-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220204145.2636370-1-JPEWhacker@gmail.com>
References: <20241220204145.2636370-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 20:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208989

Extends the 'enable-fragment' and 'disable-fragment' commands so that
they accept multiple fragments at once as a convenience for the user

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/bbconfigbuild/configfragments.py | 31 +++++++++++++----------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index a0c3883399..a4896cc734 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -103,34 +103,37 @@ class ConfigFragmentsPlugin(LayerPlugin):
         """ Enable a fragment in the local build configuration """
         def enable_helper(varname, origvalue, op, newlines):
             enabled_fragments = origvalue.split()
-            if args.fragmentname in enabled_fragments:
-                print("Fragment {} already included in {}".format(args.fragmentname, args.confpath))
-            else:
-                enabled_fragments.append(args.fragmentname)
+            for f in args.fragmentname:
+                if f in enabled_fragments:
+                    print("Fragment {} already included in {}".format(f, args.confpath))
+                else:
+                    enabled_fragments.append(f)
             return " ".join(enabled_fragments), None, 0, True
 
-        if not self.fragment_exists(args.fragmentname):
-            raise Exception("Fragment {} does not exist; use 'list-fragments' to see the full list.".format(args.fragmentname))
+        for f in args.fragmentname:
+            if not self.fragment_exists(f):
+                raise Exception("Fragment {} does not exist; use 'list-fragments' to see the full list.".format(f))
 
         self.create_conf(args.confpath)
         modified = bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGMENTS"], enable_helper)
         if modified:
-            print("Fragment {} added to {}.".format(args.fragmentname, args.confpath))
+            print("Fragment {} added to {}.".format(", ".join(args.fragmentname), args.confpath))
 
     def do_disable_fragment(self, args):
         """ Disable a fragment in the local build configuration """
         def disable_helper(varname, origvalue, op, newlines):
             enabled_fragments = origvalue.split()
-            if args.fragmentname in enabled_fragments:
-                enabled_fragments.remove(args.fragmentname)
-            else:
-                print("Fragment {} not currently enabled in {}".format(args.fragmentname, args.confpath))
+            for f in args.fragmentname:
+                if f in enabled_fragments:
+                    enabled_fragments.remove(f)
+                else:
+                    print("Fragment {} not currently enabled in {}".format(f, args.confpath))
             return " ".join(enabled_fragments), None, 0, True
 
         self.create_conf(args.confpath)
         modified = bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGMENTS"], disable_helper)
         if modified:
-            print("Fragment {} removed from {}.".format(args.fragmentname, args.confpath))
+            print("Fragment {} removed from {}.".format(", ".join(args.fragmentname), args.confpath))
 
     def do_disable_all_fragments(self, args):
         """ Disable all fragments in the local build configuration """
@@ -151,11 +154,11 @@ class ConfigFragmentsPlugin(LayerPlugin):
 
         parser_enable_fragment = self.add_command(sp, 'enable-fragment', self.do_enable_fragment, parserecipes=False)
         parser_enable_fragment.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
-        parser_enable_fragment.add_argument('fragmentname', help='The name of the fragment (use list-fragments to see them)')
+        parser_enable_fragment.add_argument('fragmentname', help='The name of the fragment (use list-fragments to see them)', nargs='+')
 
         parser_disable_fragment = self.add_command(sp, 'disable-fragment', self.do_disable_fragment, parserecipes=False)
         parser_disable_fragment.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
-        parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment')
+        parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment', nargs='+')
 
         parser_disable_all = self.add_command(sp, 'disable-all-fragments', self.do_disable_all_fragments, parserecipes=False)
         parser_disable_all.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
-- 
2.47.1


