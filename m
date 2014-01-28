Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id DD4616E9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 17:32:01 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id y10so1406378wgg.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 09:32:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qM76ua8FN5FPYt8NRzPZwnXH7b4flCe8b2zqOKGj4Jg=;
	b=PWYS3/sKM4ZF5lb6Yv4+EA1S+aDpfhpTnoEfIovhF1psAGQND1+Ni/hmuTCHkZK/4i
	m1DYYBkCRIRoork1dCt3R8iyjOLEGWpcOFygvucVWsZM2pGqJvHT/XmQooP4U5gelLWE
	HEz9dWGa2rqVRgY38hz25icrAUIw36qrAMH+OA1cHXl4rk2HBlwCxF5VE/NBdrbeYwBT
	+6H8g2paWPexnUgvR7WqdwCZHMPdcHv/rCkQHl+3EjKUAOZohZdyz0hzH/V5Lc+AziM9
	uwPr6y6I37xxgTEm/Y1FFe4/t4mnIVeGgeN5LKOwgxsIUOXRP45rjcbRJKZXivUx4bYf
	Orjw==
X-Gm-Message-State: ALoCoQmBNARmuLsB2v4A4B34j6dy9zyLdLzey5j7MOwFOF2zUwJ2IPEM+NjZtArck6U56ROjAmlQ
X-Received: by 10.180.80.103 with SMTP id q7mr16676563wix.14.1390930321888;
	Tue, 28 Jan 2014 09:32:01 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fo6sm35483123wib.7.2014.01.28.09.32.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jan 2014 09:32:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 17:31:55 +0000
Message-Id: <1390930315-30693-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] python-numpy: don't search host directories for libraries
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
X-List-Received-Date: Tue, 28 Jan 2014 17:32:03 -0000

The build process hard-codes searches of various directories in /usr when
looking for libraries, delete this to avoid host contamination.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python-numpy/no-host-paths.patch        |   57 ++++++++++++++++++++
 meta/recipes-devtools/python/python-numpy_1.7.0.bb |    1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-numpy/no-host-paths.patch

diff --git a/meta/recipes-devtools/python/python-numpy/no-host-paths.patch b/meta/recipes-devtools/python/python-numpy/no-host-paths.patch
new file mode 100644
index 0000000..0b992c3
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/no-host-paths.patch
@@ -0,0 +1,57 @@
+Don't search /usr and so on for libraries by default to avoid host contamination.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
+index bac90fb..a63d796 100644
+--- a/numpy/distutils/system_info.py
++++ b/numpy/distutils/system_info.py
+@@ -191,41 +191,12 @@ if sys.platform == 'win32':
+     default_x11_lib_dirs = []
+     default_x11_include_dirs = []
+ else:
+-    default_lib_dirs = libpaths(['/usr/local/lib', '/opt/lib', '/usr/lib',
+-                                 '/opt/local/lib', '/sw/lib'], platform_bits)
+-    default_include_dirs = ['/usr/local/include',
+-                            '/opt/include', '/usr/include',
+-                            # path of umfpack under macports
+-                            '/opt/local/include/ufsparse',
+-                            '/opt/local/include', '/sw/include',
+-                            '/usr/include/suitesparse']
+-    default_src_dirs = ['.', '/usr/local/src', '/opt/src', '/sw/src']
+-
+-    default_x11_lib_dirs = libpaths(['/usr/X11R6/lib', '/usr/X11/lib',
+-                                     '/usr/lib'], platform_bits)
+-    default_x11_include_dirs = ['/usr/X11R6/include', '/usr/X11/include',
+-                                '/usr/include']
+-
+-    if os.path.exists('/usr/lib/X11'):
+-        globbed_x11_dir = glob('/usr/lib/*/libX11.so')
+-        if globbed_x11_dir:
+-            x11_so_dir = os.path.split(globbed_x11_dir[0])[0]
+-            default_x11_lib_dirs.extend([x11_so_dir, '/usr/lib/X11'])
+-            default_x11_include_dirs.extend(['/usr/lib/X11/include',
+-                                             '/usr/include/X11'])
+-
+-    import subprocess as sp
+-    try:
+-        p = sp.Popen(["gcc", "-print-multiarch"], stdout=sp.PIPE,
+-                stderr=open(os.devnull, 'w'))
+-    except OSError:
+-        pass # gcc is not installed
+-    else:
+-        triplet = str(p.communicate()[0].decode().strip())
+-        if p.returncode == 0:
+-            # gcc supports the "-print-multiarch" option
+-            default_x11_lib_dirs += [os.path.join("/usr/lib/", triplet)]
+-            default_lib_dirs += [os.path.join("/usr/lib/", triplet)]
++    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
++    default_include_dirs = ['/deaddir/include']
++    default_src_dirs = ['.', '/deaddir/src']
++
++    default_x11_lib_dirs = libpaths(['/deaddir/lib'], platform_bits)
++    default_x11_include_dirs = ['/deaddir/include']
+ 
+ if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
+     default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
diff --git a/meta/recipes-devtools/python/python-numpy_1.7.0.bb b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
index 04cb2f1..c91cdf6 100644
--- a/meta/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f87832d854acbade6e9f5c601c8b30b1"
 PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
+           file://no-host-paths.patch \
            ${CONFIGFILESURI} "
 
 CONFIGFILESURI ?= ""
-- 
1.7.10.4


