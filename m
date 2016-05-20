Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 679AC6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 10:09:13 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n129so27853022wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gY6bTn7DO5W4p0Hl46RzzgUDp0HZhTcghiex5WVIC4c=;
	b=pO9ligXQW9sn+t1eSTm3Y/ayFqVrDU7POkd5XAoULbw9v5bJC/yUMpkaM24TNt7c3l
	8PyLvfzCMVqQTkhUi6bxl8aNHVPmmzPrYce8UFmzGkJKJSpJvPT448f+WmTMfHbYcYge
	rjFd5doH0RlBLlMXSI5uKUyB3RIxQEqVjAXyLkr3ZvM3iJ82JmM2E6ekyYaY7wUO/Ujs
	tlHflwpbFSctWcGcC2Z20NUS2cGAni7My4WqktnzcDz9bpXb6/UriKcWNmrZXA86ib7F
	dE4Y2TEbfOWMGye/T/enT6YL5q1A9/xoCf+DYPXXjK3GU1BPscRSYRwPQnsEGmgcpD5j
	ME2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gY6bTn7DO5W4p0Hl46RzzgUDp0HZhTcghiex5WVIC4c=;
	b=VwJ4JnjZ4LQdPhpHQstU3HyhbtcA4c971pHS0VxTZ9tfmKSXvl4XUQX0LUOjTEHnx+
	raWrLYJ4pyTMFANPhy6YaX8rcSDC/hh9PtnWup2yeVWQy85Ko3ayY7frbHKW6Hbv6Gnh
	wqHfE3icV94R41cfwzZM+Db0lI76rj88O4FTzfcVvpVDbH3F5O3VFTBeRT+HtLw9CoKL
	AWS6G4q0/FMNoWe6+kkfOl4ZlbVVfr3I+2G+eORIFC3P9peAFIN1lxz6C559wsE3DB0A
	COxEO1YYfXQBXuttS7ZBrpGv7yAyNeaJaVYyUZDxt9GMzvl1fkIJp+96oF0luaKubApK
	kqDg==
X-Gm-Message-State: AOPr4FUxq/znMKG1Yt03KRt3f4vUe/c+FkmZDtYuVLWVI1d7oJsh0xTxuEeNVpR50E9Hzw==
X-Received: by 10.28.92.18 with SMTP id q18mr2883273wmb.48.1463738952972;
	Fri, 20 May 2016 03:09:12 -0700 (PDT)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id c85sm7555669wmd.0.2016.05.20.03.09.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 May 2016 03:09:11 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 11:13:11 +0100
Message-Id: <1463739192-30404-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.8.2
Subject: [PATCH 1/2] package.bbclass: handle package name with spaces and single quotes
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
X-List-Received-Date: Fri, 20 May 2016 10:09:13 -0000

Gracefuly handle the odd case when a desired file name used to build a package
or used as path for files in a package has spaces or single quotes.

In that case, this patch ensures that do_split_packages adds files, even with
spaces, to the package.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/classes/package.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ffd4eff7b140..b1140de43454 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -69,7 +69,7 @@ def legitimize_package_name(s):
     s = re.sub('<U([0-9A-Fa-f]{1,4})>', fixutf, s)
 
     # Remaining package name validity fixes
-    return s.lower().replace('_', '-').replace('@', '+').replace(',', '+').replace('/', '-')
+    return s.lower().replace(' ', '-').replace('\'', '-').replace('_', '-').replace('@', '+').replace(',', '+').replace('/', '-')
 
 def do_split_packages(d, root, file_regex, output_pattern, description, postinst=None, recursive=False, hook=None, extra_depends=None, aux_files_pattern=None, postrm=None, allow_dirs=False, prepend=False, match_path=False, aux_files_pattern_verbatim=None, allow_links=False, summary=None):
     """
@@ -119,6 +119,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
                       defaults to description if not set.
 
     """
+    import re
 
     dvar = d.getVar('PKGD', True)
     root = d.expand(root)
@@ -193,8 +194,11 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
         newfile = os.path.join(root, o)
         # These names will be passed through glob() so if the filename actually
         # contains * or ? (rare, but possible) we need to handle that specially
+        # Also, in order to support filename with spaces, we have to replace it
+        # with * wildcard character
         newfile = newfile.replace('*', '[*]')
         newfile = newfile.replace('?', '[?]')
+        newfile = re.sub(' +', '*', newfile) # Support spaces in packages
         if not oldfiles:
             the_files = [newfile]
             if aux_files_pattern:
-- 
2.8.2


