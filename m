Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id BA2FC7F298
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:32:46 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id r195so199828wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lvCbOSFjAScv3CjyvW5kdqFfVo4Kbjd9aReNQGTkpNQ=;
	b=BI1yusEkgg8FuqAkR/8dPGI9VJwDqQS0awogykkyMa1anMCiPi4gDSQK0stdLmVC2X
	GXB4QIJW2g+/2wIAG8Jvhqlpj7v2hUVIKJnQ2XERlxLY4zRU5lwB6RBY64EyIBJEHM1K
	Kxh4+4OQzX1/dsPF9aaXjSg5kZX7XkACkiqOk07RPV3NKuDcBdywqAgAcav8605MiUL4
	EKi2aeaZOT9OzPzeJMVTXGn6pK2ceQfMqixtKY52jEfcJ5IHbspy+i94t6tL0cpNkFbI
	SuFd54UHTG0sVG4ZpfyZcZxEBo3vVfC8d4ES6nhcW3P3RQY5jacjKiT2jZ3xZ6z3T8M3
	6WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lvCbOSFjAScv3CjyvW5kdqFfVo4Kbjd9aReNQGTkpNQ=;
	b=LRd+nCKwI6/cj7yYf1jzo9cWxzwUgKuAa81teCh8aRUXzPevZcKy57tFXqNJsYAIbs
	+KrytwSqTdZjZVWFcVbulMJQ/W+ia7hLNYECqH3wXoxFLhSmJTkxi2EVufNbtl9p+ZEJ
	MliEZTHMopRhtZt8wLq9Ez0FvMgtUe8Tzy0Ax9tQJf0LXSSBK+YXQ4FFHFoq5GKsxqtl
	fQpxCDIH4s6KRlqmGUwhfsWhkj1FdolLPPAlLPLVDYYbRwFLOAfT6Kf8eQupt+1MMjJQ
	TOX4xt+XO+2yU9afy3FKqSyPtc5jNaPF+SpJxuUCyNdfsgf3A0I/tQFA99kamrAZD0AM
	D0hA==
X-Gm-Message-State: APjAAAW/nbuBAoXH2XckamN59bDi4ieSn+B1wNmSqjLe54UMjDEgxAzo
	4GoVMG/olPzDUTB4rBbEIE273r3L
X-Google-Smtp-Source: APXvYqxn9q4/mZ68xteF5GO9xiEPKMcV8hX9/a+DBW5cX/RWSAgB/fe5Sai85jwAyhUhS6n44szUqw==
X-Received: by 2002:a7b:c922:: with SMTP id h2mr181887wml.63.1567528366899;
	Tue, 03 Sep 2019 09:32:46 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id c132sm74372wme.27.2019.09.03.09.32.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:32:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 18:32:41 +0200
Message-Id: <20190903163241.87739-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] package.bbclass: allow shell-style wildcards in PRIVATE_LIBS
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
X-List-Received-Date: Tue, 03 Sep 2019 16:32:47 -0000

PRIVATE_LIBS is used to exclude 'private' libraries from getting added to
automatic runtime dependency resolution. This variable currently has to list
all libraries by name, which becomes a maintenance issue if the list
of such libraries frequently changes, or is very large.

This change allows using shell-style wildcards in the variable, similar
to how FILES lists what gets packaged.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/package.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 114d6559f5e..aa8451ffe8b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1646,7 +1646,8 @@ python package_do_shlibs() {
                 prov = (this_soname, ldir, pkgver)
                 if not prov in sonames:
                     # if library is private (only used by package) then do not build shlib for it
-                    if not private_libs or this_soname not in private_libs:
+                    import fnmatch
+                    if not private_libs or len([i for i in private_libs if fnmatch.fnmatch(this_soname, i)]) == 0:
                         sonames.add(prov)
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
@@ -1829,7 +1830,8 @@ python package_do_shlibs() {
             # /opt/abc/lib/libfoo.so.1 and contains /usr/bin/abc depending on system library libfoo.so.1
             # but skipping it is still better alternative than providing own
             # version and then adding runtime dependency for the same system library
-            if private_libs and n[0] in private_libs:
+            import fnmatch
+            if private_libs and len([i for i in private_libs if fnmatch.fnmatch(n[0], i)]) > 0:
                 bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' % (pkg, n[0]))
                 continue
             if n[0] in shlib_provider.keys():
-- 
2.17.1


