Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SEGsv-0000tf-Hv
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 11:15:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3196XB9017821
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 1 Apr 2012 02:06:33 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 1 Apr 2012 02:06:34 -0700
Message-ID: <e11db9a3b517ea65859f33364dadc86f3d602fd4.1333270818.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1333270818.git.xiaofeng.yan@windriver.com>
References: <cover.1333270818.git.xiaofeng.yan@windriver.com>
Old-Date: Sun, 1 Apr 2012 16:25:50 +0800
Date: Sun, 1 Apr 2012 17:08:46 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver.bbclass: enhance code readability
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Apr 2012 09:15:42 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The modification is as follow:

- Modify some codes with more preferable readability and vague description.
- Use existed functions instead of custom functions.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/archiver.bbclass |  227 +++++++++++++++++++---------------------
 1 files changed, 108 insertions(+), 119 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 471430e..4e4e964 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -2,28 +2,11 @@
 # It also output building environment to xxx.dump.data and create xxx.diff.gz to record 
 # all content in ${S} to a diff file. 
 
-EXCLUDE_FROM ?= ".pc autom4te.cache"
+ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
 ARCHIVE_TYPE ?= "TAR SRPM"
 DISTRO ?= "poky"
 PATCHES_ARCHIVE_WITH_SERIES = 'TRUE'
 
-def parse_var(d,var):
-	''' parse variable like ${PV}  in "require xxx_${PV}.inc"  to a real value. for example, change "require xxx_${PV}.inc" to "require xxx_1.2.inc" '''
-	import re 
-	pat = re.compile('.*\$({(.*)}).*')
-	if '$' not in var and '/' not in var:
-		return var
-	else:
-		if '/' in var:
-			return [i for i in var.split('/') if i.endswith('.inc')][0]
-		elif '$' in  var:
-			m = pat.match(var)
-			patstr = '\$' + m.group(1)
-			var_str = m.group(2)
-			return re.sub(patstr,d.getVar(var_str,True),var)
-		else:
-			return var
-		
 def get_bb_inc(d):
 	'''create a directory "script-logs" including .bb and .inc file in ${WORKDIR}'''
 	import re
@@ -32,14 +15,18 @@ def get_bb_inc(d):
 	
 	bbinc = []
 	pat=re.compile('require\s*([^\s]*\.*)(.*)')
-	file_dir = d.getVar('FILE', True)
-	bbdir = os.path.dirname(file_dir)
 	work_dir = d.getVar('WORKDIR', True)
-	os.chdir(work_dir)
-	bb.mkdirhier("script-logs")
-	os.chdir(bbdir)
-	bbfile = os.path.basename(file_dir)
-	bbinc.append(bbfile)
+	bbfile = d.getVar('FILE', True)
+	bbdir = os.path.dirname(bbfile)
+	script_logs = os.path.join(work_dir,'script-logs')
+	bb_inc = os.path.join(script_logs,'bb_inc')
+	bb.mkdirhier(script_logs)
+	bb.mkdirhier(bb_inc)
+	
+	def find_file(dir,file):
+		for root, dirs, files in os.walk(dir):
+				if file in files:
+					return os.path.join(root,file) 
 	
 	def get_inc (file):
 		f = open(file,'r')
@@ -49,21 +36,26 @@ def get_bb_inc(d):
 			else:
 				try:
 					incfile = pat.match(line).group(1)
-					incfile = parse_var(d,incfile)
-					bbinc.append(incfile)
-					get_inc(incfile)
-				except (IOError,AttributeError):
+					incfile = bb.data.expand(os.path.basename(incfile),d)
+					abs_incfile = find_file(bbdir,incfile)
+					if abs_incfile:
+						bbinc.append(abs_incfile)
+						get_inc(abs_incfile)
+				except AttributeError:
 					pass
 	get_inc(bbfile)
-	os.chdir(work_dir)
-	for root, dirs, files in os.walk(bbdir):
-		for file in bbinc:
-			if file in files:
-				shutil.copy(root + '/' + file,'script-logs')
-	oe.path.copytree('temp', 'script-logs')
-	return work_dir + '/script-logs'
-
-def get_all_patches(d):
+	bbinc = list(set(bbinc))
+	for bbincfile in bbinc:
+		shutil.copy(bbincfile,bb_inc)
+
+	try:
+		bb.mkdirhier(os.path.join(script_logs,'temp'))
+		oe.path.copytree(os.path.join(work_dir,'temp'), os.path.join(script_logs,'temp'))
+	except (IOError,AttributeError):
+		pass
+	return script_logs
+
+def get_series(d):
 	'''copy patches and series file to a pointed directory which will be archived to tarball in ${WORKDIR}'''
 	import shutil
 	
@@ -71,11 +63,11 @@ def get_all_patches(d):
 	pf = d.getVar('PF', True)
 	work_dir = d.getVar('WORKDIR', True)
 	s = d.getVar('S',True)
-	dest = os.path.join(work_dir, pf + '-patches') 
+	dest = os.path.join(work_dir, pf + '-series') 
 	shutil.rmtree(dest, ignore_errors=True)
 	bb.mkdirhier(dest)
 	
-	src_uri = d.getVar('SRC_URI', 1).split()
+	src_uri = d.getVar('SRC_URI', True).split()
 	fetch = bb.fetch2.Fetch(src_uri, d)
 	locals = (fetch.localpath(url) for url in fetch.urls)
 	for local in locals:
@@ -90,7 +82,8 @@ def get_all_patches(d):
 			shutil.copy(patch,dest)
 		except IOError:
 			if os.path.isdir(patch):
-				oe.path.copytree(patch,dest)	
+				bb.mkdirhier(os.path.join(dest,patch))
+				oe.path.copytree(patch, os.path.join(dest,patch))
 	return dest
 
 def get_applying_patches(d):
@@ -124,92 +117,85 @@ def not_tarball(d):
 	else:
 		return False
 
-def get_source_from_downloads(d,middle_name):
+def get_source_from_downloads(d,stage_name):
 	'''copy tarball of $P to $WORKDIR when this tarball exists in $DL_DIR'''
-	if middle_name in 'patched' 'configured':
+	if stage_name in 'patched' 'configured':
 		return
 	pf = d.getVar('PF', True)
 	dl_dir = d.getVar('DL_DIR',True)
 	try:
-		source = os.path.basename(d.getVar('SRC_URI', 1).split()[0])
-		os.chdir(dl_dir)
+		source = os.path.join(dl_dir,os.path.basename(d.getVar('SRC_URI', True).split()[0]))
 		if os.path.exists(source) and not os.path.isdir(source):
 			return source
 	except (IndexError, OSError):
 		pass
+	return ''
+
+def do_tarball(workdir,srcdir,tarname):
+	'''tar "srcdir" under "workdir" to "tarname"'''
+	import tarfile
 	
-def archive_sources_from_directory(d,middle_name): 
+	sav_dir = os.getcwd()
+	os.chdir(workdir)
+	if (len(os.listdir(srcdir))) != 0:
+		tar = tarfile.open(tarname, "w:gz")
+		tar.add(srcdir)
+		tar.close()
+	else:
+		tarname = ''
+	os.chdir(sav_dir)
+	return tarname
+
+def archive_sources_from_directory(d,stage_name): 
 	'''archive sources codes tree to tarball when tarball of $P doesn't exist in $DL_DIR'''
-	import tarfile
 	import shutil
 	
 	s = d.getVar('S',True)
-	workdir=d.getVar('WORKDIR', True)
+	work_dir=d.getVar('WORKDIR', True)
 	PF = d.getVar('PF',True)
-	tarname = PF + '-' + middle_name + ".tar.gz"
-
-	if os.path.exists(s) and s is not workdir:
-		sourcedir = os.path.basename(s)
-		tarbase = os.path.dirname(s)
-		if not sourcedir or os.path.dirname(tarbase) == workdir:
-			sourcedir = os.path.basename(os.path.dirname(s))
-			tarbase = os.path.dirname(os.path.dirname(s))
-		os.chdir(tarbase)
-	else:
-		sourcedir = os.path.basename(s)
-		if not os.path.exists(sourcedir):
-			os.mkdir(sourcedir)
+	tarname = PF + '-' + stage_name + ".tar.gz"
+
+	if os.path.exists(s) and work_dir in s:
 		try:
-			for file in os.listdir(s):
-				if file is not 'temp' and file is not sourcedir:
-					shutil.copy(file,sourcedir)
-		except (IOError,OSError):
-			pass
-
-	if (len(os.listdir(sourcedir))) != 0:
-		tar = tarfile.open( tarname, "w:gz")
-		tar.add(sourcedir)
-		tar.close()
-		if cmp(workdir,os.path.dirname(s)) and not os.path.exists(workdir + '/' + tarname):
-			shutil.move(os.path.dirname(s) + '/' + tarname,workdir)
+			source_dir = os.path.join(work_dir,[ i for i in s.replace(work_dir,'').split('/') if i][0])
+		except IndexError:
+			if not cmp(s,work_dir):
+				return ''
 	else:
-		return
-	return tarname
+		return ''
+	source = os.path.basename(source_dir)
+	return do_tarball(work_dir,source,tarname)
 
-def archive_sources(d,middle_name):
+def archive_sources(d,stage_name):
 	'''copy tarball from $DL_DIR to $WORKDIR if have tarball, archive source codes tree in $WORKDIR if $P is directory instead of tarball'''
 	import shutil
 	work_dir = d.getVar('WORKDIR',True)
-	file = get_source_from_downloads(d,middle_name)
+	file = get_source_from_downloads(d,stage_name)
 	if file:
 		shutil.copy(file,work_dir)
 	else:
-		file = archive_sources_from_directory(d,middle_name)
+		file = archive_sources_from_directory(d,stage_name)
 	return file
 
 
 def archive_patches(d,patchdir,series):
 	'''archive patches to tarball and also include series files if 'series' is True'''
-	import tarfile
 	import shutil
 
 	s = d.getVar('S',True)
 	work_dir = d.getVar('WORKDIR', True)
-	os.chdir(work_dir)
 	patch_dir = os.path.basename(patchdir)
 	tarname = patch_dir + ".tar.gz"
-	if series  == 'all' and os.path.exists(s + '/patches/series'):
-			shutil.copy(s + '/patches/series',patch_dir)
-	tar = tarfile.open(tarname, "w:gz")
-	tar.add(patch_dir)
-	tar.close()
-	shutil.rmtree(patch_dir, ignore_errors=True)
+	if series  == 'all' and os.path.exists(os.path.join(s,'patches/series')):
+			shutil.copy(os.path.join(s,'patches/series'),patchdir)
+	tarname = do_tarball(work_dir,patch_dir,tarname)
+	shutil.rmtree(patchdir, ignore_errors=True)
 	return tarname
 
 def select_archive_patches(d,option):
 	'''select to archive all patches including non-applying and series or applying patches '''
 	if option == "all":
-		patchdir = get_all_patches(d)
+		patchdir = get_series(d)
 	elif option == "applying":
 		patchdir = get_applying_patches(d)
 	try:
@@ -221,17 +207,15 @@ def select_archive_patches(d,option):
 
 def archive_logs(d,logdir,bbinc=False):
 	'''archive logs in temp to tarball and .bb and .inc files if bbinc is True '''
-	import tarfile
 	import shutil
 
-	log_dir = os.path.basename(logdir)
 	pf = d.getVar('PF',True)
+	work_dir = d.getVar('WORKDIR',True)
+	log_dir =  os.path.basename(logdir)
 	tarname = pf + '-' + log_dir + ".tar.gz"
-	tar = tarfile.open(tarname, "w:gz")
-	tar.add(log_dir)
-	tar.close()
+	tarname = do_tarball(work_dir,log_dir,tarname)
 	if bbinc:
-		shutil.rmtree(log_dir, ignore_errors=True)
+		shutil.rmtree(logdir, ignore_errors=True)
 	return tarname 
 
 def get_licenses(d):
@@ -258,16 +242,17 @@ def move_tarball_deploy(d,tarball_list):
 	target_sys = d.getVar('TARGET_SYS', True)
 	pf = d.getVar('PF', True)
 	licenses = get_licenses(d)
+	work_dir = d.getVar('WORKDIR',True)
 	tar_sources = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + '/' + licenses + '/' + pf
 	if not os.path.exists(tar_sources):
 		bb.mkdirhier(tar_sources)
 	for source in tarball_list:
 		if source:
-			if os.path.exists(tar_sources + '/' + source):
-				os.remove(tar_sources + '/' + source)
-			shutil.move(source,tar_sources)
+			if os.path.exists(os.path.join(tar_sources, source)):
+				os.remove(os.path.join(tar_sources,source))
+			shutil.move(os.path.join(work_dir,source),tar_sources)
 
-def verify_var(d):
+def check_archiving_type(d):
 	'''check the type for archiving package('tar' or 'srpm')'''
 	try:
 		if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in d.getVar('ARCHIVE_TYPE', True).split():
@@ -278,7 +263,7 @@ def verify_var(d):
 def store_package(d,package_name):
 	'''store tarbablls name to file "tar-package"'''
 	try:
-		f = open(d.getVar('WORKDIR',True )+ '/tar-package','a')
+		f = open(os.path.join(d.getVar('WORKDIR',True),'tar-package'),'a')
 		f.write(package_name + ' ')
 		f.close()
 	except IOError:
@@ -286,25 +271,27 @@ def store_package(d,package_name):
 
 def get_package(d):
 	'''get tarballs name from "tar-package"'''
+	work_dir = (d.getVar('WORKDIR', True))
+	tarpackage = os.path.join(work_dir,'tar-package')
 	try:
-		os.chdir(d.getVar('WORKDIR', True))
-		f = open('tar-package','r')
+		f = open(tarpackage,'r')
 		line = list(set(f.readline().replace('\n','').split()))
-		f.close()
-		return line
 	except IOError:
 		pass
+	f.close()
+	return line
 
 
-def archive_sources_patches(d,middle_name):
-	'''archive sources and patches to tarball. middle_name will append strings ${middle_name} to ${PR} as middle name. for example, zlib-1.4.6-prepatch(middle_name).tar.gz '''
+def archive_sources_patches(d,stage_name):
+	'''archive sources and patches to tarball. stage_name will append strings ${stage_name} to ${PR} as middle name. for example, zlib-1.4.6-prepatch(stage_name).tar.gz '''
 	import shutil
-	verify_var(d)	
+
+	check_archiving_type(d)	
 	if not_tarball(d):
 		return
 	
-	source_tar_name = archive_sources(d,middle_name)
-	if middle_name == "prepatch":
+	source_tar_name = archive_sources(d,stage_name)
+	if stage_name == "prepatch":
 		if d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper() == 'TRUE':
 			patch_tar_name = select_archive_patches(d,"all")
 		elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper() == 'FALSE':
@@ -313,14 +300,14 @@ def archive_sources_patches(d,middle_name):
 			bb.fatal("Please define 'PATCHES_ARCHIVE_WITH_SERIES' is strings 'True' or 'False' ")
 	else:
 		patch_tar_name = ''
-
+	
 	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
 		move_tarball_deploy(d,[source_tar_name,patch_tar_name])
 	else:
-		tarpackage = d.getVar('WORKDIR', True) + '/tar-package'
+		tarpackage = os.path.join(d.getVar('WORKDIR', True),'tar-package')
 		if os.path.exists(tarpackage):
 			os.remove(tarpackage)
-		for package in source_tar_name, patch_tar_name:
+		for package in os.path.basename(source_tar_name), patch_tar_name:
 			if package:
 				store_package(d,str(package) + ' ')
 
@@ -328,14 +315,14 @@ def archive_scripts_logs(d):
 	'''archive scripts and logs. scripts include .bb and .inc files and logs include stuff in "temp".'''
 
 	work_dir = d.getVar('WORKDIR', True)
-	os.chdir(work_dir)
+	temp_dir = os.path.join(work_dir,'temp')
 	source_archive_log_with_scripts = d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True)
 	if source_archive_log_with_scripts == 'logs_with_scripts':
 		logdir = get_bb_inc(d)
 		tarlog = archive_logs(d,logdir,True)
 	elif source_archive_log_with_scripts == 'logs':
-		if os.path.exists('temp'):
-			tarlog = archive_logs(d,'temp',False)
+		if os.path.exists(temp_dir):
+			tarlog = archive_logs(d,temp_dir,False)
 	else:
 		return
 		
@@ -374,14 +361,14 @@ def create_diff_gz(d):
 	import shutil
 
 	work_dir = d.getVar('WORKDIR', True)
-	exclude_from = d.getVar('EXCLUDE_FROM', True).split()
+	exclude_from = d.getVar('ARCHIVE_EXCLUDE_FROM', True).split()
 	pf = d.getVar('PF', True)
 	licenses = get_licenses(d)
 	target_sys = d.getVar('TARGET_SYS', True)
 	diff_dir = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + '/' + licenses + '/' + pf
 	diff_file = os.path.join(diff_dir, bb.data.expand("${P}-${PR}.diff.gz",d))
-	os.chdir(work_dir)
-	f = open('temp/exclude-from-file', 'a')
+
+	f = open(os.path.join(work_dir,'temp/exclude-from-file'), 'a')
 	for i in exclude_from:
 		f.write(i)
 		f.write("\n")
@@ -394,7 +381,10 @@ def create_diff_gz(d):
 		bb.mkdirhier(dest)
 	for i in os.listdir(os.getcwd()):
 		if os.path.isfile(i):
-			shutil.copy(i, dest)
+			try:
+				shutil.copy(i, dest)
+			except IOError:
+				os.system('fakeroot cp -rf ' + i + " " + dest )
 	
 	bb.note("Creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz")
 	cmd = "LC_ALL=C TZ=UTC0 diff --exclude-from=" + work_dir + "/temp/exclude-from-file -Naur " + s + '.org' + ' ' +  s + " | gzip -c > " + diff_file
@@ -445,12 +435,11 @@ do_kernel_checkout[postfuncs] += "do_archive_linux_yocto "
 python do_remove_tarball(){
 	if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
 		work_dir = d.getVar('WORKDIR', True)
-		os.chdir(work_dir)
 		try:
 			for file in os.listdir(os.getcwd()):
 				if file in get_package(d):
 					os.remove(file)
-			os.remove('tar-package')
+			os.remove(os.path.join(work_dir,'tar-package'))
 		except (TypeError,OSError):
 				pass
 }
-- 
1.7.0.4



