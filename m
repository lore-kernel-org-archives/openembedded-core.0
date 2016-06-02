Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3DF773D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:13:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 02 Jun 2016 03:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="712733347"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2016 03:13:50 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 1C66A6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:16 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:12:48 +0300
Message-Id: <737c99c5758c71ee4709220f9b0183bbfa211704.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 02/16] scripts: python3: use new style except statement
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
X-List-Received-Date: Thu, 02 Jun 2016 10:13:49 -0000

Changed old syle except statements 'except <exception>, var'
to new style 'except <exception> as var' as old style is not
supported in python3.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/combo-layer       |  4 ++--
 scripts/contrib/bbvars.py | 14 +++++++-------
 scripts/cp-noerror        |  8 ++++----
 scripts/tiny/ksize.py     |  2 +-
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 7c41f92..0644cdc 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -190,7 +190,7 @@ def runcmd(cmd,destdir=None,printerr=True,out=None,env=None):
         err = os.tmpfile()
     try:
         subprocess.check_call(cmd, stdout=out, stderr=err, cwd=destdir, shell=isinstance(cmd, str), env=env or os.environ)
-    except subprocess.CalledProcessError,e:
+    except subprocess.CalledProcessError as e:
         err.seek(0)
         if printerr:
             logger.error("%s" % err.read())
@@ -429,7 +429,7 @@ file_exclude = %s''' % (name, file_filter or '<empty>', repo.get('file_exclude',
                     runcmd('git replace --graft %s %s' % (start, startrev))
             try:
                 runcmd(merge)
-            except Exception, error:
+            except Exception as error:
                 logger.info('''Merging component repository history failed, perhaps because of merge conflicts.
 It may be possible to commit anyway after resolving these conflicts.
 
diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
index 6f47935..b865dd1 100755
--- a/scripts/contrib/bbvars.py
+++ b/scripts/contrib/bbvars.py
@@ -37,9 +37,9 @@ def recipe_bbvars(recipe):
     vset = set()
     try:
         r = open(recipe)
-    except IOError as (errno, strerror):
+    except IOError as err:
         print('WARNING: Failed to open recipe ', recipe)
-        print(strerror)
+        print(err.args[1])
 
     for line in r:
         # Strip any comments from the line
@@ -71,9 +71,9 @@ def bbvar_is_documented(var, docfiles):
     for doc in docfiles:
         try:
             f = open(doc)
-        except IOError as (errno, strerror):
+        except IOError as err:
             print('WARNING: Failed to open doc ', doc)
-            print(strerror)
+            print(err.args[1])
         for line in f:
             if prog.match(line):
                 return True
@@ -87,8 +87,8 @@ def bbvar_doctag(var, docconf):
 
     try:
         f = open(docconf)
-    except IOError as (errno, strerror):
-        return strerror
+    except IOError as err:
+        return err.args[1]
 
     for line in f:
         m = prog.search(line)
@@ -109,7 +109,7 @@ def main():
     # Collect and validate input
     try:
         opts, args = getopt.getopt(sys.argv[1:], "d:hm:t:T", ["help"])
-    except getopt.GetoptError, err:
+    except getopt.GetoptError as err:
         print('%s' % str(err))
         usage()
         sys.exit(2)
diff --git a/scripts/cp-noerror b/scripts/cp-noerror
index 28eb90d..d8be677 100755
--- a/scripts/cp-noerror
+++ b/scripts/cp-noerror
@@ -33,16 +33,16 @@ def copytree(src, dst, symlinks=False, ignore=None):
                 shutil.copy2(srcname, dstname)
         # catch the Error from the recursive copytree so that we can
         # continue with other files
-        except shutil.Error, err:
+        except shutil.Error as err:
             errors.extend(err.args[0])
-        except EnvironmentError, why:
+        except EnvironmentError as why:
             errors.append((srcname, dstname, str(why)))
     try:
         shutil.copystat(src, dst)
-    except OSError, why:
+    except OSError as why:
         errors.extend((src, dst, str(why)))
     if errors:
-        raise shutil.Error, errors
+        raise shutil.Error(errors)
 
 try:
     copytree(sys.argv[1], sys.argv[2])
diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index 275c983..54b71f8 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -133,7 +133,7 @@ class Report:
 def main():
     try:
         opts, args = getopt.getopt(sys.argv[1:], "dh", ["help"])
-    except getopt.GetoptError, err:
+    except getopt.GetoptError as err:
         print('%s' % str(err))
         usage()
         sys.exit(2)
-- 
2.1.4


