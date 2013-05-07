Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UZhiu-0007jt-7m
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:14:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47Cwfib005204; Tue, 7 May 2013 13:58:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LiWeKcrZS-za; Tue,  7 May 2013 13:58:41 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwcTq005184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 7 May 2013 13:58:39 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UZhRG-0005bj-1Z; Tue, 07 May 2013 13:56:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:55:55 +0100
Message-Id: <1367931368-21504-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/15] clases/lib: Use modern exception syntax
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 13:14:39 -0000

Update older code to use modern exception handling syntax which
is the form accepted by python 3.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass   |    4 ++--
 meta/classes/sanity.bbclass |    6 ++++--
 meta/lib/oe/cachedpath.py   |    4 ++--
 meta/lib/oe/patch.py        |    2 +-
 meta/lib/oe/path.py         |    6 +++---
 meta/lib/oe/utils.py        |    2 +-
 6 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 641316d..196acdb 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -108,7 +108,7 @@ python base_do_fetch() {
     try:
         fetcher = bb.fetch2.Fetch(src_uri, localdata)
         fetcher.download()
-    except bb.fetch2.BBFetchException, e:
+    except bb.fetch2.BBFetchException as e:
         raise bb.build.FuncFailed(e)
 }
 
@@ -128,7 +128,7 @@ python base_do_unpack() {
     try:
         fetcher = bb.fetch2.Fetch(src_uri, localdata)
         fetcher.unpack(rootdir)
-    except bb.fetch2.BBFetchException, e:
+    except bb.fetch2.BBFetchException as e:
         raise bb.build.FuncFailed(e)
 }
 
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ac2314f..766e97e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -235,12 +235,14 @@ def check_create_long_filename(filepath, pathname):
         f = file(testfile, "w")
         f.close()
         os.remove(testfile)
-    except IOError as (errno, strerror):
+    except IOError as e:
+        errno, strerror = e.args
         if errno == 36: # ENAMETOOLONG
             return "Failed to create a file with a long name in %s. Please use a filesystem that does not unreasonably limit filename length.\n" % pathname
         else:
             return "Failed to create a file in %s: %s.\n" % (pathname, strerror)
-    except OSError as (errno, strerror):
+    except OSError as e:
+        errno, strerror = e.args
         return "Failed to create %s directory in which to run long name sanity check: %s.\n" % (pathname, strerror)
     return ""
 
diff --git a/meta/lib/oe/cachedpath.py b/meta/lib/oe/cachedpath.py
index e350c8a..c7860ef 100644
--- a/meta/lib/oe/cachedpath.py
+++ b/meta/lib/oe/cachedpath.py
@@ -125,7 +125,7 @@ class CachedPath(object):
             # Note that listdir and error are globals in this module due
             # to earlier import-*.
             names = os.listdir(top)
-        except error, err:
+        except error as err:
             if onerror is not None:
                 onerror(err)
             return
@@ -221,7 +221,7 @@ class CachedPath(object):
                 file = self.__realpath_rel(root, file[(len(root) - 1):], root, loop_cnt, assume_dir)
             else:
                 file = self.__realpath(file, root, loop_cnt, assume_dir)[0]
-        except OSError, e:
+        except OSError as e:
             if e.errno == errno.ELOOP:
                 # make ELOOP more readable; without catching it, there will
                 # be printed a backtrace with 100s of OSError exceptions
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 7ab74fa..cbc5cd9 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -392,7 +392,7 @@ class UserResolver(Resolver):
         os.chdir(self.patchset.dir)
         try:
             self.patchset.Push(False)
-        except CmdError, v:
+        except CmdError as v:
             # Patch application failed
             patchcmd = self.patchset.Push(True, False, False)
 
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 76a6ed8..d8eb802 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -107,7 +107,7 @@ def remove(path, recurse=True):
     for name in glob.glob(path):
         try:
             os.unlink(name)
-        except OSError, exc:
+        except OSError as exc:
             if recurse and exc.errno == errno.EISDIR:
                 shutil.rmtree(name)
             elif exc.errno != errno.ENOENT:
@@ -119,7 +119,7 @@ def symlink(source, destination, force=False):
         if force:
             remove(destination)
         os.symlink(source, destination)
-    except OSError, e:
+    except OSError as e:
         if e.errno != errno.EEXIST or os.readlink(destination) != source:
             raise
 
@@ -247,7 +247,7 @@ def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False)
             file = __realpath_rel(root, file[(len(root) - 1):], root, loop_cnt, assume_dir)
         else:
             file = __realpath(file, root, loop_cnt, assume_dir)[0]
-    except OSError, e:
+    except OSError as e:
         if e.errno == errno.ELOOP:
             # make ELOOP more readable; without catching it, there will
             # be printed a backtrace with 100s of OSError exceptions
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index acd3969..ed94096 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -1,7 +1,7 @@
 def read_file(filename):
     try:
         f = file( filename, "r" )
-    except IOError, reason:
+    except IOError as reason:
         return "" # WARNING: can't raise an error now because of the new RDEPENDS handling. This is a bit ugly. :M:
     else:
         return f.read().strip()
-- 
1.7.10.4



