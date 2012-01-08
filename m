Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Rjnmq-00057g-7T
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jan 2012 09:07:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q087MPqh013072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 7 Jan 2012 23:22:25 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sat, 7 Jan 2012 23:22:25 -0800
Message-ID: <6161b957ee773a9a5b293ac9373ca0be07bb5665.1326003199.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1326003199.git.xiaofeng.yan@windriver.com>
References: <cover.1326003199.git.xiaofeng.yan@windriver.com>
Old-Date: Sun, 8 Jan 2012 13:46:14 +0800
Date: Sun, 8 Jan 2012 15:11:27 +0800
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tar_archive.bbclass: Package source codes and log files to tar package
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
X-List-Received-Date: Sun, 08 Jan 2012 08:07:28 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Source rpm package needs tar package as its source codes. log files \
are required as a part of source (description in bug 1655).
So log files need be packaged as tar package too.
User can select two types of package, the first is tar package and the second is src.rpm package.
The option item is defined in conf/local.conf.(ARCHIVE_TYPE ?= "SRPM"(default) or ARCHIVE_TYPE ?= "TARGZ")
if the option is the first type, then tar_archive.bbclass should be inherited in an suitable position.
The tar packages(sources.tar.gz and log.tar.gz) will be created in workdir.
if the option is the second type, then tar_archive.bbclass shoud be inherited in package_rpm.bbclass.
The sources rpm packages will be created in workdir/deploy-srpm when building.
The following command can ship all of source packages(src.rpm or tar.gz) to build/tmp/deploy/sources
$bitbake core-image-sato -c copysources

[YOCTO #1655]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/tar_archive.bbclass |  216 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 216 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/tar_archive.bbclass

diff --git a/meta/classes/tar_archive.bbclass b/meta/classes/tar_archive.bbclass
new file mode 100644
index 0000000..2651cbc
--- /dev/null
+++ b/meta/classes/tar_archive.bbclass
@@ -0,0 +1,216 @@
+# This file is used for packaging source codes tree to tar and \
+# source rpm package.
+
+# Some patches are not in WORKDIR but in its sub-directory.
+# Rpmbuild uses workdir as source directoty.
+# Copy pathes in sub-directory to workdir. these patches could exist \
+# in gentoo, debian and fedora
+python move_patches_toworkdir(){	
+	import os
+
+	patches = d.getVar('PLIST', True)
+	workdir = d.getVar('WORKDIR',True)
+	s = d.getVar('S',True)
+	
+	# The source tree of gcc is different from others, it is \
+	# in work-shard, not in work. so this needs a special treatment.
+	if 'work-shared' in s:
+		for patch in patches:
+			os.system('cp ' + os.path.dirname(s) + '/' + patch + ' ' + workdir)
+		return
+	platforms = ['debian','gentoo','fedora']
+	os.chdir(workdir)
+	for patch in patches:
+		if patch  not in os.listdir('.'):
+			for platform in platforms:
+				if os.path.exists(platform):
+					for root, dirs, files in os.walk(platform):
+						for file in files:
+							os.system('cp ' + root + '/' + file + ' ' + workdir)
+			return
+}
+
+# Spec file needs patches' name to build source packages  
+# Get patches' name and set them to 'd'
+python get_patches () {
+	import os
+	import re
+    
+	plist=[]
+	pat = re.compile('NOTE(.+)\'(.+)\'(.+)$')
+	workdir = d.getVar('WORKDIR',True)
+	s = d.getVar('S',True)
+	file_log = workdir + "/temp/log.do_patch"
+	if 'work-shared' in s:
+		file_log = os.path.dirname(s) + "/temp/log.do_patch"
+      	
+	if os.path.exists(file_log):
+		f = open(file_log,'r')
+		for line in f.readlines():
+			m = pat.match(line)
+			if m:
+				plist.append(m.group(2))
+		f.close()
+        
+	d.setVar('PLIST',plist)
+	bb.build.exec_func('move_patches_toworkdir', d)
+}
+
+ 
+# The following pkgs don't have source rpm and tar packages
+# 1 The pkg do nothing when unpack
+# 2 The pkg includes 'task-' or 'native' in the workdir 
+# 3 The ${S} is empty 
+python not_srpm() {
+	import os
+
+	workdir = d.getVar('WORKDIR',True)
+	s = d.getVar('S',True)
+	# The source tree of gcc is different from others, it is \
+	#in work-shard, not in work. So it needs a special treatment.
+	if 'work-shared' in s:
+		return
+	# Identify an empty directory, if having file after \
+	#the stage of do_unpack, this will look as invalid source codes directoty.
+	if len(os.listdir(s)) == 0:
+		open("emptyflag", 'w')
+	try:
+		if not os.path.exists(workdir + '/temp/' + 'log.do_unpack') or 'task-' in workdir or 'native' in workdir or os.path.exists(s + '/' + 'emptyflag'):
+			raise IOError
+	except IOError:
+		d.setVar('NOTSRPM', '1')
+}
+
+# Spec file needs source package's name to build a source package
+# Package source code patched to ${PF}.tar.gz
+do_tararchive[dirs] = "${WORKDIR}"
+fakeroot python do_tararchive() {
+	import tarfile
+	import os
+	if not d.getVar('ARCHIVE_TYPE', True):
+		return
+	
+	s = d.getVar('S',True)
+	workdir=d.getVar('WORKDIR', True)
+	PF = d.getVar('PF',True)
+	bb.build.exec_func('not_srpm', d)	
+	if d.getVar('NOTSRPM', True):
+		return
+	if os.path.exists(s) and s is not workdir:
+		sourcedir = os.path.basename(s)
+		tarbase = os.path.dirname(s)
+		if not sourcedir or os.path.dirname(tarbase) == workdir:
+			sourcedir = os.path.basename(os.path.dirname(s))
+			tarbase = os.path.dirname(os.path.dirname(s))
+		os.chdir(tarbase)
+	else:
+		sourcedir = os.path.basename(s)
+		if not os.path.exists(sourcedir):
+			os.mkdir(sourcedir)
+		for file in os.listdir(s):
+			if file is not 'temp' and file is not sourcedir:
+				os.system('cp ' + file + ' ' + sourcedir)
+
+	if (len(os.listdir(sourcedir))) != 0:
+		tar = tarfile.open( PF + ".tar.gz", "w:gz")
+		tar.add(sourcedir)
+		tar.close()
+		if os.path.dirname(s) is not workdir:
+			os.system('mv ' + os.path.dirname(s) + '/' + PF + '.tar.gz ' + workdir)
+}
+
+addtask do_tararchive after do_patch before do_configure
+
+# "log.tar.gz" which inculdes do_unpack and do_configure is \
+# a part of source package
+# Package log files to "log.tar.gz"
+do_logarchive[dirs] = "${WORKDIR}"
+fakeroot python do_logarchive(){
+	import tarfile
+	import os
+	
+	if not d.getVar('ARCHIVE_TYPE', True):
+		return
+	
+	bb.build.exec_func('not_srpm', d)	
+	if d.getVar('NOTSRPM', True):
+		return 
+	
+	log_list = ['log.do_patch','log.do_configure']
+	workdir=d.getVar('WORKDIR', True)
+	temp = workdir + "/" + "temp"
+	os.chdir(temp)
+	logtar = tarfile.open("log.tar.gz", "w:gz")
+	if os.path.exists(temp):
+		for link_log in log_list:
+			if os.path.islink(link_log):
+				real_log = os.path.basename(os.readlink(link_log))
+				logtar.add(real_log)
+	logtar.close()
+	os.system('mv log.tar.gz ../')
+}
+addtask do_logarchive after do_install before do_package
+
+# This is used for fixing the "Bad owner/group: ..." 
+# Set owner and group for patches, log.tar.gz and ${PF}.tar.gz to "root"
+do_setowngroup[dirs] = "${WORKDIR}"
+fakeroot python do_setowngroup(){
+	import os
+	
+	if not d.getVar('ARCHIVE_TYPE', True):
+		return
+	bb.build.exec_func('not_srpm', d)	
+	if d.getVar('NOTSRPM', True):
+		return
+	bb.build.exec_func('get_patches', d)
+        srcpatches = d.getVar('PLIST',True)
+	for patch in srcpatches:
+		os.system('chown root.root' + ' ' + patch)
+	os.system('chown root.root' + ' ' + "log.tar.gz")
+	os.system('chown root.root' + ' ' + d.getVar('PF', True) + ".tar.gz")
+}
+addtask do_setowngroup after do_logarchive before do_package
+
+# Copy source package to build/tmp/deploy/sources
+do_copysources[dirs] = "${PWD}/tmp/work"
+python do_copysources (){
+	import os
+	
+	archive_type = d.getVar('ARCHIVE_TYPE', True)
+	pwd = d.getVar('PWD', True)
+	machine = d.getVar('MACHINE', True)
+	target_sys = d.getVar('TARGET_SYS', True)
+	target_os = d.getVar('TARGET_OS', True)
+	target_vendor = d.getVar('TARGET_VENDOR', True)
+	tune_pkgarch = d.getVar('TUNE_PKGARCH', True)
+	multimach_host_sys = d.getVar('MULTIMACH_HOST_SYS', True)
+	all = 'all' + target_vendor + '-' + 'linux'
+	target = tune_pkgarch + target_vendor + '-' + target_os
+	srpmdir=pwd + '/tmp/deploy/' + 'sources' + '/' + machine
+	
+	if not os.path.exists(srpmdir):
+		os.makedirs(srpmdir)
+	global_work = pwd + '/tmp' + '/work'
+	os.chdir(global_work)
+	for dirs in multimach_host_sys, all, target:
+		localdir = srpmdir + '/' + dirs
+		if not os.path.exists(localdir):
+			os.mkdir(localdir)
+		os.chdir(dirs)
+		if archive_type == 'SRPM': 
+			os.system('cp */deploy-srpm/*/*.src.rpm ' + localdir)
+		elif archive_type == 'TARGZ':
+			for dir in os.listdir('.'):
+				if os.path.isdir(dir):
+					os.chdir(dir)
+					if not os.path.exists(dir):
+						os.mkdir(localdir + '/' + dir)
+					os.system('cp *.gz ' + localdir + '/' + dir)
+					os.chdir('../')
+		else:
+			return
+		os.chdir(global_work)
+}
+addtask do_copysources  after do_rootfs
+
+EXPORT_FUNCTIONS do_archive do_logarchive do_setowngroup do_copysources
-- 
1.7.7



