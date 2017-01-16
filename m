Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7681D700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:15:47 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 204so5486619pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=dvj5R2/X6kf7nt/QbOCK/R0LDE0FctJKga96xb3i+AU=;
	b=bn4SXct57jN0Ei0TuJYg+0Skd+2it8BlJm80bxUlOU0bgobgtC+4YcAQKV2y9nnTTh
	uPs5d87CEYLnmpdM2NLQIALJecRwAIz9tVbG1ipWf2scXNo2XffXdF4ycetgyHKsqxnp
	BWoxmig/lUa0TjIZ8XZfkX3FkSiJHwvuUf8PDR5dNYBgfZIrFfD/0z+pT9EhKcS7+1PX
	K7GuHcpJtv5WO+rv+yzZQkPuGMWQCq8l5QZ1gk0GyrQKgD0r+gd7hds3aYPN3smgEhRt
	axTiRhHRPsZKqfdDVq93BjDuGEKmNiJscsXB9DLraw9t2WlGGO7RrAj8YtU4tQZZX0fK
	TswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=dvj5R2/X6kf7nt/QbOCK/R0LDE0FctJKga96xb3i+AU=;
	b=UuEBX8nkivlIyoYk4RRZQdCbsgTLrZpb6+uxjK6En8IXfnUCn+ATK+Af71xHv18YJ2
	/8ipMTL/YiPei3vPBLzS9Hlt8VTyVI7eDYoAd9B2tiXWZX7dlFA3CKa5RH8FODBtnl0h
	fHMCH4TtswLtcXqk6JGd0v8vlq0Azodt3uPVOdN5XjkfCjJfqWZE54LicqMVGOhxdpQV
	WBHp+9Tqus+CiUT75RqR4RMELhZNxEWzPUJSLKn7yFzmELGKxxw26zQK08aDB7/+QC8/
	SavwKuHsR/ZzV23vOiThhTTGWE/KYes5aMhoFmi+pL2/xVtRL31ZI2b5T/9R9oshBBV2
	bJkQ==
X-Gm-Message-State: AIkVDXLwZ8VRrTI5hEs4D721BL3IpzZ5ub00Qp6xadjuLRxBodURswup6In531OzBsc4LQ==
X-Received: by 10.98.159.141 with SMTP id v13mr37689545pfk.50.1484576147669;
	Mon, 16 Jan 2017 06:15:47 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	d68sm16359780pfj.92.2017.01.16.06.15.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:15:46 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-3-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 3/30] package.bbclass: Add SHLIB detection support for mingw targets
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
X-List-Received-Date: Mon, 16 Jan 2017 14:15:47 -0000
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
index 568b85c12a..e3b609173a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1604,6 +1604,25 @@ python package_do_shlibs() {
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
@@ -1638,6 +1657,8 @@ python package_do_shlibs() {
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


