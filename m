Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5A59E61132
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 20:32:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g4so5652114wro.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 12:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OnFADKLuRJkPY00njV5W6lsWycED1a+c+NBKxqwAi+M=;
	b=PUG7Q86wWZjy+EbxIXUTbsUc7cCQKZrOXCIIMsakZxdIoncZT061GbYLRP0NDK1Rcm
	a7cFrynJ3DnSFyYMG8frYWQ16KlFF/cSp7+vFMDMPyOfCtLxLSx5PAN0hGh0D60/lhKB
	PfD5fLO0F4z2a6vOaySxqKG6ndYQHaJYiKld8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OnFADKLuRJkPY00njV5W6lsWycED1a+c+NBKxqwAi+M=;
	b=DQnChcEqaehMDlTKRCo9yoE1eKdR9xw0s7zz762G5dPNm6t5vWoUGzBG1bkyX+nWJO
	9kSalfy5Tdar1DHUOSDJKkqra1nuQpUXTjIZ39hA57Bplfdi54N3gfaAqGeDN+8vZ5tb
	ky+3pixbQSyFopkjCUKle7YhRK+1MtEShhTkFl1ssEp+M8exq7KLhQd3lcAD0dbTehop
	/Z8cokgjYWfkbiE8Iel+lJMWrc/EPd5C00nKCmMDY+OvYhUJldsg8Ww+IpyC241nkcZq
	LXnOmP9bFfjGCV7B4ih/xWZud7NkZTCJbUBfquzQYSnO1i6sysN5AzXoQh2S8Kgz3fBM
	ww3g==
X-Gm-Message-State: APjAAAVh5iKRMBpFXdo39YgK2DSULa6YMie66fmHfopGzYWXfrBu4Pci
	Duo/1qgmeHkPCTKKb+V8KUd+CFI5f2KDlw==
X-Google-Smtp-Source: APXvYqzPIP1I+jHZ8lE8Sus4py+hbZfPogPWK0evw7BoNZju/vj+9TL+tYyY3Lp2GTpia1EkESCc0g==
X-Received: by 2002:a5d:4651:: with SMTP id j17mr69551530wrs.237.1582576338680;
	Mon, 24 Feb 2020 12:32:18 -0800 (PST)
Received: from ub1910.Hitronhub.home ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	r3sm20743762wrn.34.2020.02.24.12.32.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 12:32:18 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2020 20:32:10 +0000
Message-Id: <20200224203210.14297-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] archiver.bbclass: Handle gitsm URLs in the mirror archiver
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
X-List-Received-Date: Mon, 24 Feb 2020 20:32:18 -0000
Content-Transfer-Encoding: 8bit

To fully archive a `gitsm://` entry in SRC_URI we need to also capture
the submodules recursively.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/archiver.bbclass | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 013195df7d..a823708771 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -337,12 +337,10 @@ python do_ar_mirror() {
 
     bb.utils.mkdirhier(destdir)
 
-    fetcher = bb.fetch2.Fetch(src_uri, d)
-
-    for url in fetcher.urls:
+    def archive_url(fetcher, url):
         if is_excluded(url):
             bb.note('Skipping excluded url: %s' % (url))
-            continue
+            return
 
         bb.note('Archiving url: %s' % (url))
         ud = fetcher.ud[url]
@@ -376,6 +374,21 @@ python do_ar_mirror() {
         bb.note('Copying source mirror')
         cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
         subprocess.check_call(cmd, shell=True)
+
+        if url.startswith('gitsm://'):
+            def archive_submodule(ud, url, module, modpath, d):
+                url += ";bareclone=1;nobranch=1"
+                newfetch = bb.fetch2.Fetch([url], d, cache=False)
+
+                for url in newfetch.urls:
+                    archive_url(newfetch, url)
+
+            ud.method.process_submodules(ud, ud.clonedir, archive_submodule, d)
+
+    fetcher = bb.fetch2.Fetch(src_uri, d, cache=False)
+
+    for url in fetcher.urls:
+        archive_url(fetcher, url)
 }
 
 def exclude_useless_paths(tarinfo):
-- 
2.20.1


