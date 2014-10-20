Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA9E6AC20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 14:09:53 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id pv20so3959274lab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 07:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6UqjwhIMWNNzVq6+KBMd0rcgSuSwTHZxmfGCPD31gi0=;
	b=RscxK7NV2Y/aW0WurhNAagzNnAsMXYYhvAf866NYzaPED1c9inKglQkUbbBWlRhX9y
	Anoqy/9NPiyq89NR0dkunNPr//kQJ2NHN9NXpZB5wIYGLjPvZ1wYp096kO3He7koOqYw
	5827o7uyUGtXvWYDupDvvGdfsE0e/hLdeSklLJCEEMOwuHUZ2qdEfKHOoPlxF23OS1IK
	ms8UXrn7qgO8oN9TWJKtilOv35yn/o+4oDZ2H8vgQ9b3ZQWi+PfPGmQQkKyPI4KsKCp2
	zx8yKmGz2fZMIIAO8WcFWR+jopdnYBh5xvpYwvSW7F7dKKjq0On2YMKkCA3BjdZQf51o
	+JlA==
X-Gm-Message-State: ALoCoQl9EKobocdLcW7LDL2PhKK260StDGoHa67Oup/qHSmd/p+U3qSqNMF/emHNPx12fn9S2BH+
X-Received: by 10.152.198.166 with SMTP id jd6mr9463667lac.81.1413814192827;
	Mon, 20 Oct 2014 07:09:52 -0700 (PDT)
Received: from ursaminorbeta.office.pelagicore.net ([83.218.80.242])
	by mx.google.com with ESMTPSA id v1sm3346071lae.19.2014.10.20.07.09.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Oct 2014 07:09:51 -0700 (PDT)
From: Tobias Olausson <tobias.olausson@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Oct 2014 16:09:15 +0200
Message-Id: <1413814155-20317-1-git-send-email-tobias.olausson@pelagicore.com>
X-Mailer: git-send-email 2.1.1
Subject: [PATCH] spdx.bbclass: improved stability, fixed SPDX compliance issues. Changes are reflected in licenses.conf.
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
X-List-Received-Date: Mon, 20 Oct 2014 14:09:56 -0000

The previous version could crash on dead links in the rootfs, or if the manifest directory did not
exist. The generated files were also not compliant with the SPDX specification, for example file
entries did not always start with the FileName tag, time stamps were incorrectly formatted etc.

Stability issues are addressed by added checks, originally written by Johan Thelin
<johan.thelin@pelagicore.com>, who never upstreamed them. I've also added an option for getting full
SPDX output from FOSSology, i.e. not only for all files, but for the package as well, including
license references. License refs are required in order to process the output by SPDXTools. For that
reason, this option defaults to true.

Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
---
 meta/classes/spdx.bbclass | 154 +++++++++++++++++++++++++++++++---------------
 meta/conf/licenses.conf   |  24 +++++++-
 2 files changed, 126 insertions(+), 52 deletions(-)

diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index bccc230..c0050f3 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -43,6 +43,9 @@ python do_spdx () {
     info['spdx_temp_dir'] = (d.getVar('SPDX_TEMP_DIR', True) or "")
     info['tar_file'] = os.path.join( info['workdir'], info['pn'] + ".tar.gz" )
 
+    # Make sure manifest dir exists
+    if not os.path.exists( manifest_dir ):
+        bb.utils.mkdirhier( manifest_dir )
 
     ## get everything from cache.  use it to decide if 
     ## something needs to be rerun 
@@ -67,24 +70,27 @@ python do_spdx () {
 
     if cache_cur:
         spdx_file_info = cached_spdx['Files']
+        foss_package_info = cached_spdx['Package']
+        foss_license_info = cached_spdx['Licenses']
     else:
         ## setup fossology command
         foss_server = (d.getVar('FOSS_SERVER', True) or "")
         foss_flags = (d.getVar('FOSS_WGET_FLAGS', True) or "")
+        foss_full_spdx = (d.getVar('FOSS_FULL_SPDX', True) == "true" or false)
         foss_command = "wget %s --post-file=%s %s"\
             % (foss_flags,info['tar_file'],foss_server)
         
-        #bb.warn(info['pn'] + json.dumps(local_file_info))
-        foss_file_info = run_fossology( foss_command )
+        (foss_package_info, foss_file_info, foss_license_info) = run_fossology( foss_command, foss_full_spdx )
         spdx_file_info = create_spdx_doc( local_file_info, foss_file_info )
         ## write to cache
-        write_cached_spdx(sstatefile,cur_ver_code,spdx_file_info)
+        write_cached_spdx(sstatefile, cur_ver_code, foss_package_info,
+                          spdx_file_info, foss_license_info)
     
     ## Get document and package level information
-    spdx_header_info = get_header_info(info, cur_ver_code, spdx_file_info)
+    spdx_header_info = get_header_info(info, cur_ver_code, foss_package_info)
     
     ## CREATE MANIFEST
-    create_manifest(info,spdx_header_info,spdx_file_info)
+    create_manifest(info,spdx_header_info,spdx_file_info, foss_license_info)
 
     ## clean up the temp stuff
     remove_dir_tree( info['spdx_temp_dir'] )
@@ -93,32 +99,50 @@ python do_spdx () {
 }
 addtask spdx after do_patch before do_configure
 
-def create_manifest(info,header,files):
-    with open(info['outfile'], 'w') as f:
+def create_manifest(info, header, files, licenses):
+    import codecs
+    with codecs.open(info['outfile'], mode='w', encoding='utf-8') as f:
+        # Write header
         f.write(header + '\n')
+
+        # Write file data
         for chksum, block in files.iteritems():
+            f.write("FileName: " + block['FileName'] + '\n')
             for key, value in block.iteritems():
-                f.write(key + ": " + value)
-                f.write('\n')
+                if not key == 'FileName':
+                    f.write(key + ": " + value + '\n')
+            f.write('\n')
+
+        # Write license data
+        for id, block in licenses.iteritems():
+            f.write("LicenseID: " + id + '\n')
+            for key, value in block.iteritems():
+                f.write(key + ": " + value + '\n')
             f.write('\n')
 
 def get_cached_spdx( sstatefile ):
     import json
+    import codecs
     cached_spdx_info = {}
-    with open( sstatefile, 'r' ) as f:
+    with codecs.open( sstatefile, mode='r', encoding='utf-8' ) as f:
         try:
             cached_spdx_info = json.load(f)
         except ValueError as e:
             cached_spdx_info = None
     return cached_spdx_info
 
-def write_cached_spdx( sstatefile, ver_code, files ):
+def write_cached_spdx( sstatefile, ver_code, package_info, files, license_info):
     import json
+    import codecs
     spdx_doc = {}
     spdx_doc['PackageVerificationCode'] = ver_code
     spdx_doc['Files'] = {}
     spdx_doc['Files'] = files
-    with open( sstatefile, 'w' ) as f:
+    spdx_doc['Package'] = {}
+    spdx_doc['Package'] = package_info
+    spdx_doc['Licenses'] = {}
+    spdx_doc['Licenses'] = license_info
+    with codecs.open( sstatefile, mode='w', encoding='utf-8' ) as f:
         f.write(json.dumps(spdx_doc))
 
 def setup_foss_scan( info, cache, cached_files ):
@@ -139,7 +163,8 @@ def setup_foss_scan( info, cache, cached_files ):
             continue
 
         checksum = hash_file( abs_path )
-        mtime = time.asctime(time.localtime(stats.st_mtime))
+        if not checksum is None:
+            mtime = time.asctime(time.localtime(stats.st_mtime))
         
         ## retain cache information if it exists
         file_info[checksum] = {}
@@ -147,27 +172,25 @@ def setup_foss_scan( info, cache, cached_files ):
             file_info[checksum] = cached_files[checksum]
         else:
             file_info[checksum]['FileName'] = full_path
-
-        try:
-            os.makedirs( dest_dir )
-        except OSError as e:
-            if e.errno == errno.EEXIST and os.path.isdir(dest_dir):
-                pass
-            else:
-                bb.warn( "mkdir failed " + str(e) + "\n" )
-                continue
-
-        if(cache and checksum not in cached_files) or not cache:
             try:
-                shutil.copyfile( abs_path, dest_path )
-            except shutil.Error as e:
-                bb.warn( str(e) + "\n" )
-            except IOError as e:
-                bb.warn( str(e) + "\n" )
+                os.makedirs(dest_dir)
+            except OSError as e:
+                if e.errno == errno.EEXIST and os.path.isdir(dest_dir):
+                    pass
+                else:
+                    bb.warn( "mkdir failed " + str(e) + "\n" )
+                    continue
+
+            if (cache and checksum not in cached_files) or not cache:
+                try:
+                    shutil.copyfile( abs_path, dest_path )
+                except shutil.Error as e:
+                    bb.warn( str(e) + "\n" )
+                except IOError as e:
+                    bb.warn( str(e) + "\n" )
     
     with tarfile.open( info['tar_file'], "w:gz" ) as tar:
         tar.add( info['spdx_temp_dir'], arcname=os.path.basename(info['spdx_temp_dir']) )
-    tar.close()
     
     return file_info
 
@@ -193,13 +216,15 @@ def list_files( dir ):
     return
 
 def hash_file( file_name ):
+    f = None
     try:
         f = open( file_name, 'rb' )
         data_string = f.read()
     except:
        return None
     finally:
-        f.close()
+        if not f is None:
+            f.close()
     sha1 = hash_string( data_string )
     return sha1
 
@@ -209,30 +234,58 @@ def hash_string( data ):
     sha1.update( data )
     return sha1.hexdigest()
 
-def run_fossology( foss_command ):
+def run_fossology( foss_command, full_spdx ):
     import string, re
     import subprocess
     
     p = subprocess.Popen(foss_command.split(),
         stdout=subprocess.PIPE, stderr=subprocess.PIPE)
     foss_output, foss_error = p.communicate()
-    
-    records = []
-    records = re.findall('FileName:.*?</text>', foss_output, re.S)
+    foss_output = unicode(foss_output, "utf-8")
+    foss_output = string.replace(foss_output, '\r', '')
+
+    # Package info
+    package_info = {}
+    if full_spdx:
+        # All mandatory, only one occurance
+        package_info['PackageCopyrightText'] = re.findall('PackageCopyrightText: (.*?</text>)', foss_output, re.S)[0]
+        package_info['PackageLicenseDeclared'] = re.findall('PackageLicenseDeclared: (.*)', foss_output)[0]
+        package_info['PackageLicenseConcluded'] = re.findall('PackageLicenseConcluded: (.*)', foss_output)[0]
+        # These may be more than one
+        package_info['PackageLicenseInfoFromFiles'] = re.findall('PackageLicenseInfoFromFiles: (.*)', foss_output)
+    else:
+        DEFAULT = "NOASSERTION"
+        package_info['PackageCopyrightText'] = "<text>" + DEFAULT + "</text>"
+        package_info['PackageLicenseDeclared'] = DEFAULT
+        package_info['PackageLicenseConcluded'] = DEFAULT
+        package_info['PackageLicenseInfoFromFiles'] = []
 
+    # File info
     file_info = {}
+    records = []
+    # FileName is also in PackageFileName, so we match on FileType as well.
+    records = re.findall('FileName:.*?FileType:.*?</text>', foss_output, re.S)
+
     for rec in records:
-        rec = string.replace( rec, '\r', '' )
         chksum = re.findall( 'FileChecksum: SHA1: (.*)\n', rec)[0]
         file_info[chksum] = {}
         file_info[chksum]['FileCopyrightText'] = re.findall( 'FileCopyrightText: '
             + '(.*?</text>)', rec, re.S )[0]
-        fields = ['FileType','LicenseConcluded',
-            'LicenseInfoInFile','FileName']
+        fields = ['FileName', 'FileType', 'LicenseConcluded', 'LicenseInfoInFile']
         for field in fields:
             file_info[chksum][field] = re.findall(field + ': (.*)', rec)[0]
 
-    return file_info
+    # Licenses
+    license_info = {}
+    licenses = []
+    licenses = re.findall('LicenseID:.*?LicenseName:.*?\n', foss_output, re.S)
+    for lic in licenses:
+        license_id = re.findall('LicenseID: (.*)\n', lic)[0]
+        license_info[license_id] = {}
+        license_info[license_id]['ExtractedText'] = re.findall('ExtractedText: (.*?</text>)',lic, re.S)[0]
+        license_info[license_id]['LicenseName'] = re.findall('LicenseName: (.*)', lic)[0]
+
+    return (package_info, file_info, license_info)
 
 def create_spdx_doc( file_info, scanned_files ):
     import json
@@ -259,12 +312,14 @@ def get_ver_code( dirname ):
         except OSError as e:
             bb.warn( "Stat failed" + str(e) + "\n")
             continue
-        chksums.append(hash_file(os.path.join(dirname,f_dir,f)))
+        hash = hash_file(os.path.join(dirname,f_dir,f))
+        if not hash is None:
+            chksums.append(hash)
     ver_code_string = ''.join( chksums ).lower()
     ver_code = hash_string( ver_code_string )
     return ver_code
 
-def get_header_info( info, spdx_verification_code, spdx_files ):
+def get_header_info( info, spdx_verification_code, package_info):
     """
         Put together the header SPDX information.
         Eventually this needs to become a lot less
@@ -290,9 +345,9 @@ def get_header_info( info, spdx_verification_code, spdx_files ):
     head.append("")
 
     ## Creator information
-    now = datetime.now().strftime('%Y-%m-%dT%H:%M:%S')
+    now = datetime.now().strftime('%Y-%m-%dT%H:%M:%SZ')
     head.append("## Creation Information")
-    head.append("Creator: fossology-spdx")
+    head.append("Creator: Tool: fossology-spdx")
     head.append("Created: " + now)
     head.append("CreatorComment: <text>UNO</text>")
     head.append("")
@@ -301,21 +356,22 @@ def get_header_info( info, spdx_verification_code, spdx_files ):
     head.append("## Package Information")
     head.append("PackageName: " + info['pn'])
     head.append("PackageVersion: " + info['pv'])
-    head.append("PackageDownloadLocation: " + DEFAULT)
-    head.append("PackageSummary: <text></text>")
     head.append("PackageFileName: " + os.path.basename(info['tar_file']))
     head.append("PackageSupplier: Person:" + DEFAULT)
+    head.append("PackageDownloadLocation: " + DEFAULT)
+    head.append("PackageSummary: <text></text>")
     head.append("PackageOriginator: Person:" + DEFAULT)
     head.append("PackageChecksum: SHA1: " + package_checksum)
     head.append("PackageVerificationCode: " + spdx_verification_code)
     head.append("PackageDescription: <text>" + info['pn']
         + " version " + info['pv'] + "</text>")
     head.append("")
-    head.append("PackageCopyrightText: <text>" + DEFAULT + "</text>")
+    head.append("PackageCopyrightText: " + package_info['PackageCopyrightText'])
     head.append("")
-    head.append("PackageLicenseDeclared: " + DEFAULT)
-    head.append("PackageLicenseConcluded: " + DEFAULT)
-    head.append("PackageLicenseInfoFromFiles: " + DEFAULT)
+    head.append("PackageLicenseDeclared: " + package_info['PackageLicenseDeclared'])
+    head.append("PackageLicenseConcluded: " + package_info['PackageLicenseConcluded'])
+    for licref in package_info['PackageLicenseInfoFromFiles']:
+        head.append("PackageLicenseInfoFromFiles: " + licref)
     head.append("")
     
     ## header for file level
diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index fe96066..629916b 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -143,7 +143,7 @@ DATA_LICENSE = "CC0-1.0"
 #   information.
 #
 
-FOSS_COPYRIGHT = "true"
+FOSS_NO_COPYRIGHT = "true"
 
 # A option defined as[FOSS_RECURSIVE_UNPACK] in ./meta/conf/licenses.conf. is
 # used to control if FOSSology server need recursively unpack tar.gz file which
@@ -159,12 +159,30 @@ FOSS_COPYRIGHT = "true"
 
 FOSS_RECURSIVE_UNPACK = "false"
 
-# FOSSologySPDX instance server.
+# An option defined as [FOSS_FULL_SPDX] in ./meta/conf/licenses.conf is used to
+# control what kind of SPDX output to get from the FOSSology server.
+#
+# FOSS_FULL_SPDX = "true":
+#   Tell FOSSology server to return full SPDX output, like if the program was
+#   run from the command line. This is needed in order to get license refs for
+#   the full package rather than individual files only.
+#
+# FOSS_FULL_SPDX = "false":
+#   Tell FOSSology to only process license information for files. All package
+#   license tags in the report will be "NOASSERTION"
+#
+
+FOSS_FULL_SPDX = "true"
+
+# FOSSologySPDX instance server. http://localhost/repo is the default
+# installation location for FOSSology.
+#
 # For more information on FOSSologySPDX commandline:
 #   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-Web-API
 #
 
-FOSS_SERVER = "http://localhost//?mod=spdx_license_once&noCopyright=${FOSS_COPYRIGHT}&recursiveUnpack=${FOSS_RECURSIVE_UNPACK}"
+FOSS_BASE_URL = "http://localhost/repo/?mod=spdx_license_once"
+FOSS_SERVER = "${FOSS_BASE_URL}&fullSPDXFlag=${FOSS_FULL_SPDX}&noCopyright=${FOSS_NO_COPYRIGHT}&recursiveUnpack=${FOSS_RECURSIVE_UNPACK}"
 
 FOSS_WGET_FLAGS = "-qO - --no-check-certificate --timeout=0"
 
-- 
2.1.1


