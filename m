Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 12B1B7F342
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 12:41:19 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id h195so11472393pfe.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=uY+cnwI9b+N1vyanGCiCp+YYp0Mww2WkCjLCiPciUc0=;
	b=UaEh6+o7htIZ7gwjF5CqvKy5OZstDJlC0rnRuKRjfZZqggh4jBIAFGnZncrmzNFjVs
	wC/ap7yyCuyJLPiJQtVy7fhoxj3xF7GcDp4uJRnEHSknSkuF2RX7RuI4CXH68N/QhL2M
	ie/rfhegqaoIaJcW8jEkv4E2APSTtEzpJEouI4hwgvjhbna0H5tSnzmaLh0ncw6/MYmk
	mM7vsY6bfUa8leAtepDcUXoetrPl4KRelT02IR8nDTDIpTXLCWhxZN2gwORv+C0i+W5U
	gtC7SYrJZaccyvMDKipoSOJaS7cotC+0B1yA8Xy63GYos9SqBxFlz5zCdhhyDJzDKPoR
	wn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=uY+cnwI9b+N1vyanGCiCp+YYp0Mww2WkCjLCiPciUc0=;
	b=hgLRnYy1gYhxTweN7IylPXKZfaCsCjhbYG0bRUSUNJho/qRZeu4Q24effot7OZoWY+
	F+llEDkbGKkfmc4UruISO/dxAcBwQyXkLcMiKK52qsDXDzRgQCaEtVTnN4898OJhcbPY
	VtIJUPybsrQiroandsOPx4UXrQcUTJBJLOeBKOOmnJ8XMdaZ8dvB+Dm01DZU17oz2Fy8
	pbG3YGcgCRH+xeXm/LLM9/PHj2IhQcbJrTRoCRNd+ZpeeEmIjdYUdjT0Y4jSFRkj4dWa
	ogUV52FjWmmhpaLMnZKSYiXs2LV2DNBkCUvrYkWWHl25F7Gu0nR8+1a7ojsKtjuvEmui
	j2TA==
X-Gm-Message-State: APjAAAV/Wp4/IcKaZ01pEJbko+qbfB2VVvuz1YlkaEsovUpic7dbG2nG
	yzA7cnYBlds4s0G+6FcEjsbgjw==
X-Google-Smtp-Source: APXvYqxKrICR/Kj5reda4FFK7IoZjn1USOHE3gqpMA2297GmC1vJbaPfWBKHoh9jR76C0kDsTe02BA==
X-Received: by 2002:aa7:8259:: with SMTP id e25mr34805663pfn.166.1568119281048;
	Tue, 10 Sep 2019 05:41:21 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	e21sm1054300pgr.43.2019.09.10.05.41.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 05:41:20 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:40:59 +0000
Message-Id: <20190910124059.3908-3-nathan@nathanrossi.com>
In-Reply-To: <20190910124059.3908-1-nathan@nathanrossi.com>
References: <20190910124059.3908-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 3/6] chrpath.bbclass: Add break_hardlinks kwarg to allow breaking hardlinks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Sep 2019 12:41:20 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add the break_hardlinks kwarg to break hardlinks when modifying files.
This uses the bb.utils.break_hardlinks function to break hardlinks. The
default is to maintain existing behaviour and leave hardlinks in place.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/chrpath.bbclass | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index ad3c3975a5..2870c10d51 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -1,7 +1,7 @@
 CHRPATH_BIN ?= "chrpath"
 PREPROCESS_RELOCATE_DIRS ?= ""
 
-def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d):
+def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardlinks = False):
     import subprocess as sub
 
     p = sub.Popen([cmd, '-l', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
@@ -39,6 +39,9 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d):
 
     # if we have modified some rpaths call chrpath to update the binary
     if modified:
+        if break_hardlinks:
+            bb.utils.break_hardlinks(fpath)
+
         args = ":".join(new_rpaths)
         #bb.note("Setting rpath for %s to %s" %(fpath, args))
         p = sub.Popen([cmd, '-r', args, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
@@ -46,7 +49,7 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d):
         if p.returncode != 0:
             bb.fatal("%s: chrpath command failed with exit code %d:\n%s%s" % (d.getVar('PN'), p.returncode, out, err))
 
-def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d):
+def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardlinks = False):
     import subprocess as sub
 
     p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
@@ -61,11 +64,14 @@ def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d):
         if baseprefix not in rpath:
             continue
 
+        if break_hardlinks:
+            bb.utils.break_hardlinks(fpath)
+
         newpath = "@loader_path/" + os.path.relpath(rpath, os.path.dirname(fpath.replace(rootdir, "/")))
         p = sub.Popen([d.expand("${HOST_PREFIX}install_name_tool"), '-change', rpath, newpath, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
         out, err = p.communicate()
 
-def process_dir (rootdir, directory, d):
+def process_dir(rootdir, directory, d, break_hardlinks = False):
     import stat
 
     rootdir = os.path.normpath(rootdir)
@@ -95,7 +101,7 @@ def process_dir (rootdir, directory, d):
             continue
 
         if os.path.isdir(fpath):
-            process_dir(rootdir, fpath, d)
+            process_dir(rootdir, fpath, d, break_hardlinks = break_hardlinks)
         else:
             #bb.note("Testing %s for relocatability" % fpath)
 
@@ -108,8 +114,9 @@ def process_dir (rootdir, directory, d):
             else:
                 # Temporarily make the file writeable so we can chrpath it
                 os.chmod(fpath, perms|stat.S_IRWXU)
-            process_file(cmd, fpath, rootdir, baseprefix, tmpdir, d)
-                
+
+            process_file(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardlinks = break_hardlinks)
+
             if perms:
                 os.chmod(fpath, perms)
 
---
2.23.0.rc1

