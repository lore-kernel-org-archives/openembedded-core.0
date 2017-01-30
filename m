Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7710C71AC5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:52:22 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 75so30903365pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=7jcplehtL9Db8rYkBSEq5TdnePuHAxMQpMvnRtE8wEM=;
	b=DrT7bztEEz4hB1TeudCwF6rSnimVjiMB3YbYYEDhfcXe7xK7IH46Zm30fpC5aJbKHE
	PnjjkcGpgoV9k7/h3QSg/aCDqIZZHyewvq3bMIkwpO+w/fOFvXOkxGaR7kYQt0UkKFgr
	Fw3ElQzSgGYDpO8k3QiGVUztpgV/xB8xa/rAcrOHW3RaZ/XslhbyRQDibntpmsL5yitO
	8ihb+Wo79VxEFfrqr5LDkORyzq+NUd9QqK4ZMQUE1PjW7y02GSx6un1BYRrb/9PPMQHr
	gPI3YNmPPMwhJOPUS1eDpvj0QRYnVHpDPziKwCBZ9K0ip7Fuxg4i77mfo7GtE+XLQK08
	ZF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=7jcplehtL9Db8rYkBSEq5TdnePuHAxMQpMvnRtE8wEM=;
	b=TCuDH4p6wo+ZnwGc7XxFCi4GfCFHPMYzdSQjyVZaiAOiDZPGRsPofvRvmMDnGjHMEw
	OX460oYp9sI9RpBVQczZdaTY4dQogx+3bmc9CSgp3VQ3G5NcpVqOmXGrphAe2jsqBfbX
	FJo4ozVtWPi0ObK+pcOc/n0CMhTMlXC9zsD29qJ2bI9U+/YRMvS7HQhd/KNIgNe9PvSg
	xtwuPPKuXne+hUDVaQT9D3zSMy76ZT6+uNz8lLulXijbhPJjhiAbM0fmoIqXOAZrp/w9
	4nUfDYJy6OriK9k3s9t9nKiV41pdJfooMB3HNnJ7a3cRc6aJFoHx7B2/7dgHwKV8qnBM
	Hh0g==
X-Gm-Message-State: AIkVDXIGz3eBF/4Nv+LD42+sMzFUZi/CeYlhs7h1xpqup/VNDcTlq0wNpz2rtTIOVaisRg==
X-Received: by 10.98.44.10 with SMTP id s10mr21983353pfs.161.1485762743004;
	Sun, 29 Jan 2017 23:52:23 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	c204sm29672263pfb.51.2017.01.29.23.52.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:52:22 -0800 (PST)
Date: Mon, 30 Jan 2017 17:52:07 +1000
Message-Id: <20170130075207.2639-2-nathan@nathanrossi.com>
In-Reply-To: <20170130075207.2639-0-nathan@nathanrossi.com>
References: <20170130075207.2639-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 2/3] package.bbclass: Add SHLIB detection support for mingw targets
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
X-List-Received-Date: Mon, 30 Jan 2017 07:52:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add support to detect dll files as shared objects as well as process
Windows .dll and .exe files to determine the runtime libraries
dependencies.

This implementation is sufficient to detect and map runtime library
dependencies between packages. And does not implement any version naming
conventions that might apply for .dll files (e.g. lib*-x.dll).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/package.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ac2d71cfa4..fe9f7f2eaf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1613,6 +1613,25 @@ python package_do_shlibs() {
                 if name and name not in needed[pkg]:
                      needed[pkg].append((name, file, []))
 
+    def mingw_dll(file, needed, sonames, renames, pkgver):
+        if not os.path.exists(file):
+            return
+
+        if file.endswith(".dll"):
+            # assume all dlls are shared objects provided by the package
+            sonames.append((os.path.basename(file), os.path.dirname(file).replace(pkgdest + "/" + pkg, ''), pkgver))
+
+        if (file.endswith(".dll") or file.endswith(".exe")):
+            # use objdump to search for "DLL Name: .*\.dll"
+            p = sub.Popen([d.expand("${HOST_PREFIX}objdump"), "-p", file], stdout = sub.PIPE, stderr= sub.PIPE)
+            out, err = p.communicate()
+            # process the output, grabbing all .dll names
+            if p.returncode == 0:
+                for m in re.finditer("DLL Name: (.*?\.dll)$", out.decode(), re.MULTILINE | re.IGNORECASE):
+                    dllname = m.group(1)
+                    if dllname:
+                        needed[pkg].append((dllname, file, []))
+
     if d.getVar('PACKAGE_SNAP_LIB_SYMLINKS') == "1":
         snap_symlinks = True
     else:
@@ -1647,6 +1666,8 @@ python package_do_shlibs() {
                     continue
                 if targetos == "darwin" or targetos == "darwin8":
                     darwin_so(file, needed, sonames, renames, pkgver)
+                elif targetos.startswith("mingw"):
+                    mingw_dll(file, needed, sonames, renames, pkgver)
                 elif os.access(file, os.X_OK) or lib_re.match(file):
                     ldconfig = linux_so(file, needed, sonames, renames, pkgver)
                     needs_ldconfig = needs_ldconfig or ldconfig
-- 
2.11.0


