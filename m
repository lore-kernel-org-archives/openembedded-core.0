Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 282E173167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 12:04:49 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id n129so134714299wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=F1YVIDHQZUG4bCspUt6wN1aKzLeOjRXnCr8CfdCYHp4=;
	b=kGm8ecJhGgyz0lwZ4/P0qHAn4lyZPh5WFLk0OyqrGg+5LRUFl6WpI/dC7phjC1Yq6A
	TaibMRrU6MN5twPfbkhVXw8vbNs4zUuZPcJRHsTe2UnuJqAltDoKFarI6XK7IuEgKPq2
	cZPmUWZc7TVHpk3GbplqdkTK1o34WzDKjaeKyxUv90K223njAmtx4oFZ1xPKotM7PP2L
	AU63nmqu2iBsGj+Q/GYlx5VYyv8H1da0s4rlNJsrS3fuXOBJJhNwjkr8mYsg2Ad1rTLi
	Kh6j5gBvjliYqeeZd21BCCqUqlPDBQ1TAnWAV3bcUL2OQ75eOSGWbS0uDk7K6JJ1E+/K
	KGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=F1YVIDHQZUG4bCspUt6wN1aKzLeOjRXnCr8CfdCYHp4=;
	b=FvoGmTepZ0KCe8t0K56TVAANSfxxkH5nSVwi1wAK91hnFCd9iWUepSy6lZ360ZhN8y
	/BGG8+a3L/yzJSMsR+cUzmYlEv5ScllZ2P7foKB+lMaXeaTegroQOcgP4d1bAI/3OqxN
	qJK3sglzHuWmR/29SDX8BH3PD/pk8Wg+N7rTBo25yJZLOMjWhhiltoW818WD2ucSwcQS
	4qd+GCUWdoOOWkY0sqvqr4vBm/rdJB+lm7ow0R9A4BwEgGfrERBD7FmLUEOmABlHP1Hd
	hwz19l379skSiY47iIADsjg5peHSF6WRaed3mXs80hR+GK2OKyAeFe8J43TiqhVfkLl1
	SECw==
X-Gm-Message-State: AOPr4FVch0xA9SjcVBZXH51w3HuqLkJTjH8lI6rgY4I6kx+BzjgF/oJaAALq8dhsl2XZcg==
X-Received: by 10.194.139.104 with SMTP id qx8mr32234725wjb.14.1462795489974; 
	Mon, 09 May 2016 05:04:49 -0700 (PDT)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id
	u6sm24238499wmd.21.2016.05.09.05.04.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 May 2016 05:04:48 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 13:08:33 +0100
Message-Id: <1462795713-8951-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.8.2
Subject: [PATCH] package: handle package name with spaces
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
X-List-Received-Date: Mon, 09 May 2016 12:04:51 -0000

Gracefuly handle the odd case when a desired file name used to build a package
or used as path for files in a package has spaces.

In that case, this patch ensures that do_split_packages adds files, even with
spaces, to the package.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/classes/package.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ffd4eff7b140..98206e4ce859 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -69,7 +69,7 @@ def legitimize_package_name(s):
     s = re.sub('<U([0-9A-Fa-f]{1,4})>', fixutf, s)
 
     # Remaining package name validity fixes
-    return s.lower().replace('_', '-').replace('@', '+').replace(',', '+').replace('/', '-')
+    return s.lower().replace(' ', '-').replace('_', '-').replace('@', '+').replace(',', '+').replace('/', '-')
 
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


