Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1E672F19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:17:40 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id s67so7731722pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=7jcplehtL9Db8rYkBSEq5TdnePuHAxMQpMvnRtE8wEM=;
	b=hSuzahYbGPMrP+PFBhZO2XdpmtC4dFiWlLlNMsQBKolYSq25W+N3+V9mqHZV67Wn7k
	RgN4e5e6mst6CpzHG884Bd+J7OoyNxX9P4xzQvfHbPfuZWwSSZ2MQWWjpVk2EZfa7Py8
	YVwRTzRsfM+Vr1E0KhWIHxN0YC4Q/FjHfdqNPTvAT+rvy2xyvvkqfWx7oIrclOpCILjK
	uqNRdMlsGzCge10gJi9R5Db0I+sICTlfynBhqMpSe3gqpCZAZXF5pWAQN/5LxSwTNkru
	jJ74t2GjwHfl7IdeMmjyrURDDTOSeWRj25EpsYD6zGHgTyoLhyAYLdRKSVbLN49d+B/2
	ySjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=7jcplehtL9Db8rYkBSEq5TdnePuHAxMQpMvnRtE8wEM=;
	b=PcQ3PlqCpGwuGIny4JXDoBglcG2XNfnheNXJ0wYnoNBujs3qhRGgb8NpyqI1vm5AKn
	DrJ4R+dIAf3kpvqtDYYGggraI1dc0RBZFRuR8Lr/7GKDxCOKYdtlzemuXcZcRYt/UiT3
	nqg8P1EgWpOIMvLQ8GrQejbTYo9/+H1RWJPg8LOict+HaSVYt9thYPku+a3FdnZaYx9D
	nZsjRi7p6KSS/uAG8JFCR2HN/vTUxW2K5+oQUvAyBANAB+h3sXpXvf3M3hT1KF1jj7zZ
	FPwx1DxW/O6rF0zMZ3HSYdcWMR4JgzdHFUe8nxDQCub/ZSF2w4eTnmfXj9yBjcHZ9hFe
	3WEA==
X-Gm-Message-State: AMke39mLA5UIrny8qE3l2dzCJZXhV5xt+doSD2JWcXrFxgjer61aZowRL08d8lrBl5BZmg==
X-Received: by 10.98.157.12 with SMTP id i12mr20053309pfd.166.1487683062158;
	Tue, 21 Feb 2017 05:17:42 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	u82sm41278670pfd.7.2017.02.21.05.17.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 05:17:41 -0800 (PST)
Date: Tue, 21 Feb 2017 23:17:28 +1000
Message-Id: <20170221131728.21595-2-nathan@nathanrossi.com>
In-Reply-To: <20170221131728.21595-0-nathan@nathanrossi.com>
References: <20170221131728.21595-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 2/3] package.bbclass: Add SHLIB detection support for mingw targets
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
X-List-Received-Date: Tue, 21 Feb 2017 13:17:41 -0000
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


