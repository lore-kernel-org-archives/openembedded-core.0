Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2E65F6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:39:53 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id h20-v6so9248533wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QRcgOr/IzavONk45jt1DtJh/qdIXw2mePSu0wHSQKYA=;
	b=EQzg1yUIo8hiM9ObqMmDDlJ/b1sd1ZFwFIsn9NGykwfmsTENXWLOO0EAAffN9UIrHF
	HYqguHMKB9l/jFDSYJuklafztSoLvLI61DtZ2HEbfvsGoDYqmIG3LAuS9iQ5YpN3x9SY
	v3ZOX+ElSyQ3ZKK909QsDjb6d2xGVrCHldOKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QRcgOr/IzavONk45jt1DtJh/qdIXw2mePSu0wHSQKYA=;
	b=pVBsIfJtdlb0Gzq4h/y0qXiUQZ1EY2rj4nZJS+oUKAGeQGuUGrA5h5PVyR9aMyIJLl
	2ENd+ZihEbZATVw69WcC2HcI/MHz/ET9WwYZoko/CgnLAwxQZbABuxxiSepHUZYCib9n
	4K/maU5yoqDJokdiqRIAMnZcmVZakslKtSRictYFLYTAQw+MJLdvexRSyE5q1yMoHu/h
	J77TgSH0xTsEG/CP51RhUrHNt9LBLKkK5dwpE/Q28a9oy1pApT6NyIGF4K6KUbEQNnzO
	H2VP9DAiMBYxFssVesiROD3FV55Bj97OzEPrGq5WCklPSXV9ntvxvKaQvvtZSK7DS5nQ
	g3sg==
X-Gm-Message-State: AOUpUlGiWNaIoapo7LLs5466RyopSewBGNYYp9lRzD0ivuQGAuJLnZh5
	076fb6h9Grv58jU7dW23EoQO5knihELVAQ==
X-Google-Smtp-Source: AAOMgpdw02SKL+1x+zNC6kW0x6Agv7ARTjIrYMYKOoQmYciuAeMheKT/8KVfZvhBX4cAEoDdJ1U9VA==
X-Received: by 2002:a1c:d946:: with SMTP id
	q67-v6mr1180406wmg.156.1532083193661; 
	Fri, 20 Jul 2018 03:39:53 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t184-v6sm1204848wmf.18.2018.07.20.03.39.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 03:39:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:39:41 +0100
Message-Id: <20180720103948.30044-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
References: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/10] package_ipk|deb: Use oe.utils.multiprocess_launch
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
X-List-Received-Date: Fri, 20 Jul 2018 10:39:53 -0000

The current code had broken exception handling due to the use of a
"traceback" variable as well as an import. Use the new library code
for this instead which reduces code duplication and has fixed/improved
exception handling.

The chdir code can be dropped since any directory changes are in other
processes now so there is no need for it here and the code no longer
changes directory.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_deb.bbclass | 51 +-------------------------------
 meta/classes/package_ipk.bbclass | 51 +-------------------------------
 2 files changed, 2 insertions(+), 100 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 2e8d17d3c71..6f815916531 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -41,32 +41,6 @@ def debian_arch_map(arch, tune):
     return arch
 
 python do_package_deb () {
-
-    import multiprocessing
-    import traceback
-
-    class DebianWritePkgProcess(multiprocessing.Process):
-        def __init__(self, *args, **kwargs):
-            multiprocessing.Process.__init__(self, *args, **kwargs)
-            self._pconn, self._cconn = multiprocessing.Pipe()
-            self._exception = None
-
-        def run(self):
-            try:
-                multiprocessing.Process.run(self)
-                self._cconn.send(None)
-            except Exception as e:
-                tb = traceback.format_exc()
-                self._cconn.send((e, tb))
-
-        @property
-        def exception(self):
-            if self._pconn.poll():
-                self._exception = self._pconn.recv()
-            return self._exception
-
-    oldcwd = os.getcwd()
-
     packages = d.getVar('PACKAGES')
     if not packages:
         bb.debug(1, "PACKAGES not defined, nothing to package")
@@ -76,30 +50,7 @@ python do_package_deb () {
     if os.access(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN"),os.R_OK):
         os.unlink(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN"))
 
-    max_process = int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
-    launched = []
-    error = None
-    pkgs = packages.split()
-    while not error and pkgs:
-        if len(launched) < max_process:
-            p = DebianWritePkgProcess(target=deb_write_pkg, args=(pkgs.pop(), d))
-            p.start()
-            launched.append(p)
-        for q in launched:
-            # The finished processes are joined when calling is_alive()
-            if not q.is_alive():
-                launched.remove(q)
-            if q.exception:
-                error, traceback = q.exception
-                break
-
-    for p in launched:
-        p.join()
-
-    os.chdir(oldcwd)
-
-    if error:
-        raise error
+    oe.utils.multiprocess_launch(deb_write_pkg, packages.split(), d, extraargs=(d,))
 }
 do_package_deb[vardeps] += "deb_write_pkg"
 do_package_deb[vardepsexclude] = "BB_NUMBER_THREADS"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index a0b34fa7a5d..5eb910ca318 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -17,32 +17,6 @@ OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKA
 OPKGLIBDIR = "${localstatedir}/lib"
 
 python do_package_ipk () {
-    import multiprocessing
-    import traceback
-
-    class IPKWritePkgProcess(multiprocessing.Process):
-        def __init__(self, *args, **kwargs):
-            multiprocessing.Process.__init__(self, *args, **kwargs)
-            self._pconn, self._cconn = multiprocessing.Pipe()
-            self._exception = None
-
-        def run(self):
-            try:
-                multiprocessing.Process.run(self)
-                self._cconn.send(None)
-            except Exception as e:
-                tb = traceback.format_exc()
-                self._cconn.send((e, tb))
-
-        @property
-        def exception(self):
-            if self._pconn.poll():
-                self._exception = self._pconn.recv()
-            return self._exception
-
-
-    oldcwd = os.getcwd()
-
     workdir = d.getVar('WORKDIR')
     outdir = d.getVar('PKGWRITEDIRIPK')
     tmpdir = d.getVar('TMPDIR')
@@ -61,30 +35,7 @@ python do_package_ipk () {
     if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os.R_OK):
         os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))
 
-    max_process = int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
-    launched = []
-    error = None
-    pkgs = packages.split()
-    while not error and pkgs:
-        if len(launched) < max_process:
-            p = IPKWritePkgProcess(target=ipk_write_pkg, args=(pkgs.pop(), d))
-            p.start()
-            launched.append(p)
-        for q in launched:
-            # The finished processes are joined when calling is_alive()
-            if not q.is_alive():
-                launched.remove(q)
-            if q.exception:
-                error, traceback = q.exception
-                break
-
-    for p in launched:
-        p.join()
-
-    os.chdir(oldcwd)
-
-    if error:
-        raise error
+    oe.utils.multiprocess_launch(ipk_write_pkg, packages.split(), d, extraargs=(d,))
 }
 do_package_ipk[vardeps] += "ipk_write_pkg"
 do_package_ipk[vardepsexclude] = "BB_NUMBER_THREADS"
-- 
2.17.1


