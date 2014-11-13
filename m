Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id ECA2860167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 14:50:39 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bs8so8492786wib.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 06:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZpkMtODXdzcgwIrl2dLtMKm9Ap2HEgcVE7gadGtfIsg=;
	b=jC0jVFef5uBKRWFnNw0Rx21VFVh3kjMkW5lTjjQxI9mtQPOFoEYncSye7jpd33Q1Un
	/GGa30aktyJBk9E4QPzGuXV4lc7hOm8vVEQBqG1QIuCLQukjliPU70bnjc5YTQmklTv5
	m0JBhEyLvuwKtGT49FQS7TVikwaOgFP9uy3yuLl/tLlkkGaE3LwT/knPXX83Z+ukjX75
	vKVRg5Qpyp8CR3yKsZWNVFiLlK7pRN9oufj1F+vBsNYaM205vyy/QBufbl01TrASfGPE
	Iqqmwt2YwwIis+lOpLMkQ0vhYrMcKkRFKuq10uZU0Bg5siyY0MlAMA2fBO7JDSJJ4qQN
	eAZA==
X-Gm-Message-State: ALoCoQkTKOWyRgzLt0VWsHepdLqJSVRzSaaFG1wYqqDCxqToF3aWeUhr77odnMvHkPUdwt7HkJJu
X-Received: by 10.194.57.81 with SMTP id g17mr4995534wjq.12.1415890240021;
	Thu, 13 Nov 2014 06:50:40 -0800 (PST)
Received: from ursaminorbeta.office.pelagicore.net ([83.218.80.242])
	by mx.google.com with ESMTPSA id
	ny6sm25981035wic.22.2014.11.13.06.50.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Nov 2014 06:50:38 -0800 (PST)
From: Tobias Olausson <tobias.olausson@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Nov 2014 15:49:52 +0100
Message-Id: <1415890192-17087-1-git-send-email-tobias.olausson@pelagicore.com>
X-Mailer: git-send-email 2.1.1
Subject: [PATCH] spdx.bbclass: improved error handling and code cleanup
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
X-List-Received-Date: Thu, 13 Nov 2014 14:50:47 -0000

The spdx task now writes a meaningful error message in case of error in
communication with the FOSSology server. Also the coding style is now more
consistent and some unneccessary calls/functions are removed.

Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
---
 meta/classes/spdx.bbclass | 254 ++++++++++++++++++++++------------------------
 1 file changed, 119 insertions(+), 135 deletions(-)

diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index c0050f3..454c53e 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -15,7 +15,6 @@
 # SPDX file will be output to the path which is defined as[SPDX_MANIFEST_DIR] 
 # in ./meta/conf/licenses.conf.
 
-SPDXOUTPUTDIR = "${WORKDIR}/spdx_output_dir"
 SPDXSSTATEDIR = "${WORKDIR}/spdx_sstate_dir"
 
 # If ${S} isn't actually the top-level source directory, set SPDX_S to point at
@@ -24,49 +23,50 @@ SPDX_S ?= "${S}"
 
 python do_spdx () {
     import os, sys
-    import json
+    import json, shutil
 
     info = {} 
-    info['workdir'] = (d.getVar('WORKDIR', True) or "")
-    info['sourcedir'] = (d.getVar('SPDX_S', True) or "")
-    info['pn'] = (d.getVar( 'PN', True ) or "")
-    info['pv'] = (d.getVar( 'PV', True ) or "")
-    info['src_uri'] = (d.getVar( 'SRC_URI', True ) or "")
-    info['spdx_version'] = (d.getVar('SPDX_VERSION', True) or '')
-    info['data_license'] = (d.getVar('DATA_LICENSE', True) or '')
-
-    spdx_sstate_dir = (d.getVar('SPDXSSTATEDIR', True) or "")
-    manifest_dir = (d.getVar('SPDX_MANIFEST_DIR', True) or "")
+    info['workdir'] = d.getVar('WORKDIR', True)
+    info['sourcedir'] = d.getVar('SPDX_S', True)
+    info['pn'] = d.getVar('PN', True)
+    info['pv'] = d.getVar('PV', True)
+    info['spdx_version'] = d.getVar('SPDX_VERSION', True)
+    info['data_license'] = d.getVar('DATA_LICENSE', True)
+
+    sstatedir = d.getVar('SPDXSSTATEDIR', True)
+    sstatefile = os.path.join(sstatedir, info['pn'] + info['pv'] + ".spdx")
+
+    manifest_dir = d.getVar('SPDX_MANIFEST_DIR', True)
     info['outfile'] = os.path.join(manifest_dir, info['pn'] + ".spdx" )
-    sstatefile = os.path.join(spdx_sstate_dir, 
-        info['pn'] + info['pv'] + ".spdx" )
-    info['spdx_temp_dir'] = (d.getVar('SPDX_TEMP_DIR', True) or "")
-    info['tar_file'] = os.path.join( info['workdir'], info['pn'] + ".tar.gz" )
 
-    # Make sure manifest dir exists
-    if not os.path.exists( manifest_dir ):
-        bb.utils.mkdirhier( manifest_dir )
+    info['spdx_temp_dir'] = d.getVar('SPDX_TEMP_DIR', True)
+    info['tar_file'] = os.path.join(info['workdir'], info['pn'] + ".tar.gz" )
+
+    # Make sure important dirs exist
+    try:
+        bb.utils.mkdirhier(manifest_dir)
+        bb.utils.mkdirhier(sstatedir)
+        bb.utils.mkdirhier(info['spdx_temp_dir'])
+    except OSError as e:
+        bb.error("SPDX: Could not set up required directories: " + str(e))
+        return
 
     ## get everything from cache.  use it to decide if 
     ## something needs to be rerun 
-    cur_ver_code = get_ver_code( info['sourcedir'] ) 
+    cur_ver_code = get_ver_code(info['sourcedir'])
     cache_cur = False
-    if not os.path.exists( spdx_sstate_dir ):
-        bb.utils.mkdirhier( spdx_sstate_dir )
-    if not os.path.exists( info['spdx_temp_dir'] ):
-        bb.utils.mkdirhier( info['spdx_temp_dir'] )
-    if os.path.exists( sstatefile ):
+    if os.path.exists(sstatefile):
         ## cache for this package exists. read it in
-        cached_spdx = get_cached_spdx( sstatefile )
+        cached_spdx = get_cached_spdx(sstatefile)
 
         if cached_spdx['PackageVerificationCode'] == cur_ver_code:
-            bb.warn(info['pn'] + "'s ver code same as cache's. do nothing")
+            bb.warn("SPDX: Verification code for " + info['pn']
+                  + "is same as cache's. do nothing")
             cache_cur = True
         else:
-            local_file_info = setup_foss_scan( info, 
-                True, cached_spdx['Files'] )
+            local_file_info = setup_foss_scan(info, True, cached_spdx['Files'])
     else:
-        local_file_info = setup_foss_scan( info, False, None )
+        local_file_info = setup_foss_scan(info, False, None)
 
     if cache_cur:
         spdx_file_info = cached_spdx['Files']
@@ -74,28 +74,33 @@ python do_spdx () {
         foss_license_info = cached_spdx['Licenses']
     else:
         ## setup fossology command
-        foss_server = (d.getVar('FOSS_SERVER', True) or "")
-        foss_flags = (d.getVar('FOSS_WGET_FLAGS', True) or "")
-        foss_full_spdx = (d.getVar('FOSS_FULL_SPDX', True) == "true" or false)
+        foss_server = d.getVar('FOSS_SERVER', True)
+        foss_flags = d.getVar('FOSS_WGET_FLAGS', True)
+        foss_full_spdx = d.getVar('FOSS_FULL_SPDX', True) == "true" or False
         foss_command = "wget %s --post-file=%s %s"\
-            % (foss_flags,info['tar_file'],foss_server)
+            % (foss_flags, info['tar_file'], foss_server)
         
-        (foss_package_info, foss_file_info, foss_license_info) = run_fossology( foss_command, foss_full_spdx )
-        spdx_file_info = create_spdx_doc( local_file_info, foss_file_info )
-        ## write to cache
-        write_cached_spdx(sstatefile, cur_ver_code, foss_package_info,
-                          spdx_file_info, foss_license_info)
+        foss_result = run_fossology(foss_command, foss_full_spdx)
+        if foss_result is not None:
+            (foss_package_info, foss_file_info, foss_license_info) = foss_result
+            spdx_file_info = create_spdx_doc(local_file_info, foss_file_info)
+            ## write to cache
+            write_cached_spdx(sstatefile, cur_ver_code, foss_package_info,
+                              spdx_file_info, foss_license_info)
+        else:
+            bb.error("SPDX: Could not communicate with FOSSology server. Command was: " + foss_command)
+            return
     
     ## Get document and package level information
     spdx_header_info = get_header_info(info, cur_ver_code, foss_package_info)
     
     ## CREATE MANIFEST
-    create_manifest(info,spdx_header_info,spdx_file_info, foss_license_info)
+    create_manifest(info, spdx_header_info, spdx_file_info, foss_license_info)
 
     ## clean up the temp stuff
-    remove_dir_tree( info['spdx_temp_dir'] )
+    shutil.rmtree(info['spdx_temp_dir'], ignore_errors=True)
     if os.path.exists(info['tar_file']):
-        remove_file( info['tar_file'] )
+        remove_file(info['tar_file'])
 }
 addtask spdx after do_patch before do_configure
 
@@ -120,18 +125,18 @@ def create_manifest(info, header, files, licenses):
                 f.write(key + ": " + value + '\n')
             f.write('\n')
 
-def get_cached_spdx( sstatefile ):
+def get_cached_spdx(sstatefile):
     import json
     import codecs
     cached_spdx_info = {}
-    with codecs.open( sstatefile, mode='r', encoding='utf-8' ) as f:
+    with codecs.open(sstatefile, mode='r', encoding='utf-8') as f:
         try:
             cached_spdx_info = json.load(f)
         except ValueError as e:
             cached_spdx_info = None
     return cached_spdx_info
 
-def write_cached_spdx( sstatefile, ver_code, package_info, files, license_info):
+def write_cached_spdx(sstatefile, ver_code, package_info, files, license_info):
     import json
     import codecs
     spdx_doc = {}
@@ -142,105 +147,85 @@ def write_cached_spdx( sstatefile, ver_code, package_info, files, license_info):
     spdx_doc['Package'] = package_info
     spdx_doc['Licenses'] = {}
     spdx_doc['Licenses'] = license_info
-    with codecs.open( sstatefile, mode='w', encoding='utf-8' ) as f:
+    with codecs.open(sstatefile, mode='w', encoding='utf-8') as f:
         f.write(json.dumps(spdx_doc))
 
-def setup_foss_scan( info, cache, cached_files ):
+def setup_foss_scan(info, cache, cached_files):
     import errno, shutil
     import tarfile
     file_info = {}
     cache_dict = {}
 
-    for f_dir, f in list_files( info['sourcedir'] ):
-        full_path =  os.path.join( f_dir, f )
+    for f_dir, f in list_files(info['sourcedir']):
+        full_path = os.path.join(f_dir, f)
         abs_path = os.path.join(info['sourcedir'], full_path)
-        dest_dir = os.path.join( info['spdx_temp_dir'], f_dir )
-        dest_path = os.path.join( info['spdx_temp_dir'], full_path )
-        try:
-            stats = os.stat(abs_path)
-        except OSError as e:
-            bb.warn( "Stat failed" + str(e) + "\n")
-            continue
+        dest_dir = os.path.join(info['spdx_temp_dir'], f_dir)
+        dest_path = os.path.join(info['spdx_temp_dir'], full_path)
 
-        checksum = hash_file( abs_path )
+        checksum = hash_file(abs_path)
         if not checksum is None:
-            mtime = time.asctime(time.localtime(stats.st_mtime))
-        
-        ## retain cache information if it exists
-        file_info[checksum] = {}
-        if cache and checksum in cached_files:
-            file_info[checksum] = cached_files[checksum]
-        else:
-            file_info[checksum]['FileName'] = full_path
-            try:
-                os.makedirs(dest_dir)
-            except OSError as e:
-                if e.errno == errno.EEXIST and os.path.isdir(dest_dir):
-                    pass
-                else:
-                    bb.warn( "mkdir failed " + str(e) + "\n" )
-                    continue
-
-            if (cache and checksum not in cached_files) or not cache:
+            file_info[checksum] = {}
+            ## retain cache information if it exists
+            if cache and checksum in cached_files:
+                file_info[checksum] = cached_files[checksum]
+            ## have the file included in what's sent to the FOSSology server
+            else:
+                file_info[checksum]['FileName'] = full_path
                 try:
-                    shutil.copyfile( abs_path, dest_path )
+                    bb.utils.mkdirhier(dest_dir)
+                    shutil.copyfile(abs_path, dest_path)
+                except OSError as e:
+                    bb.warn("SPDX: mkdirhier failed: " + str(e))
                 except shutil.Error as e:
-                    bb.warn( str(e) + "\n" )
+                    bb.warn("SPDX: copyfile failed: " + str(e))
                 except IOError as e:
-                    bb.warn( str(e) + "\n" )
+                    bb.warn("SPDX: copyfile failed: " + str(e))
+        else:
+            bb.warn("SPDX: Could not get checksum for file: " + f)
     
-    with tarfile.open( info['tar_file'], "w:gz" ) as tar:
-        tar.add( info['spdx_temp_dir'], arcname=os.path.basename(info['spdx_temp_dir']) )
+    with tarfile.open(info['tar_file'], "w:gz") as tar:
+        tar.add(info['spdx_temp_dir'], arcname=os.path.basename(info['spdx_temp_dir']))
     
     return file_info
 
-
-def remove_dir_tree( dir_name ):
-    import shutil
+def remove_file(file_name):
     try:
-        shutil.rmtree( dir_name )
-    except:
-        pass
-
-def remove_file( file_name ):
-    try:
-        os.remove( file_name )
+        os.remove(file_name)
     except OSError as e:
         pass
 
-def list_files( dir ):
-    for root, subFolders, files in os.walk( dir ):
+def list_files(dir):
+    for root, subFolders, files in os.walk(dir):
         for f in files:
-            rel_root = os.path.relpath( root, dir )
+            rel_root = os.path.relpath(root, dir)
             yield rel_root, f
     return
 
-def hash_file( file_name ):
-    f = None
+def hash_file(file_name):
     try:
-        f = open( file_name, 'rb' )
-        data_string = f.read()
+        with open(file_name, 'rb') as f:
+            data_string = f.read()
+            sha1 = hash_string(data_string)
+            return sha1
     except:
-       return None
-    finally:
-        if not f is None:
-            f.close()
-    sha1 = hash_string( data_string )
-    return sha1
-
-def hash_string( data ):
+        return None
+
+def hash_string(data):
     import hashlib
     sha1 = hashlib.sha1()
-    sha1.update( data )
+    sha1.update(data)
     return sha1.hexdigest()
 
-def run_fossology( foss_command, full_spdx ):
+def run_fossology(foss_command, full_spdx):
     import string, re
     import subprocess
     
     p = subprocess.Popen(foss_command.split(),
         stdout=subprocess.PIPE, stderr=subprocess.PIPE)
     foss_output, foss_error = p.communicate()
+    if p.returncode != 0:
+        return None
+
     foss_output = unicode(foss_output, "utf-8")
     foss_output = string.replace(foss_output, '\r', '')
 
@@ -265,11 +250,10 @@ def run_fossology( foss_command, full_spdx ):
     records = []
     # FileName is also in PackageFileName, so we match on FileType as well.
     records = re.findall('FileName:.*?FileType:.*?</text>', foss_output, re.S)
-
     for rec in records:
-        chksum = re.findall( 'FileChecksum: SHA1: (.*)\n', rec)[0]
+        chksum = re.findall('FileChecksum: SHA1: (.*)\n', rec)[0]
         file_info[chksum] = {}
-        file_info[chksum]['FileCopyrightText'] = re.findall( 'FileCopyrightText: '
+        file_info[chksum]['FileCopyrightText'] = re.findall('FileCopyrightText: '
             + '(.*?</text>)', rec, re.S )[0]
         fields = ['FileName', 'FileType', 'LicenseConcluded', 'LicenseInfoInFile']
         for field in fields:
@@ -282,44 +266,40 @@ def run_fossology( foss_command, full_spdx ):
     for lic in licenses:
         license_id = re.findall('LicenseID: (.*)\n', lic)[0]
         license_info[license_id] = {}
-        license_info[license_id]['ExtractedText'] = re.findall('ExtractedText: (.*?</text>)',lic, re.S)[0]
+        license_info[license_id]['ExtractedText'] = re.findall('ExtractedText: (.*?</text>)', lic, re.S)[0]
         license_info[license_id]['LicenseName'] = re.findall('LicenseName: (.*)', lic)[0]
 
     return (package_info, file_info, license_info)
 
-def create_spdx_doc( file_info, scanned_files ):
+def create_spdx_doc(file_info, scanned_files):
     import json
     ## push foss changes back into cache
     for chksum, lic_info in scanned_files.iteritems():
         if chksum in file_info:
-            file_info[chksum]['FileName'] = file_info[chksum]['FileName']
             file_info[chksum]['FileType'] = lic_info['FileType']
             file_info[chksum]['FileChecksum: SHA1'] = chksum
             file_info[chksum]['LicenseInfoInFile'] = lic_info['LicenseInfoInFile']
             file_info[chksum]['LicenseConcluded'] = lic_info['LicenseConcluded']
             file_info[chksum]['FileCopyrightText'] = lic_info['FileCopyrightText']
         else:
-            bb.warn(lic_info['FileName'] + " : " + chksum
+            bb.warn("SPDX: " + lic_info['FileName'] + " : " + chksum
                 + " : is not in the local file info: "
-                + json.dumps(lic_info,indent=1))
+                + json.dumps(lic_info, indent=1))
     return file_info
 
-def get_ver_code( dirname ):
+def get_ver_code(dirname):
     chksums = []
-    for f_dir, f in list_files( dirname ):
-        try:
-            stats = os.stat(os.path.join(dirname,f_dir,f))
-        except OSError as e:
-            bb.warn( "Stat failed" + str(e) + "\n")
-            continue
-        hash = hash_file(os.path.join(dirname,f_dir,f))
+    for f_dir, f in list_files(dirname):
+        hash = hash_file(os.path.join(dirname, f_dir, f))
         if not hash is None:
             chksums.append(hash)
-    ver_code_string = ''.join( chksums ).lower()
-    ver_code = hash_string( ver_code_string )
+        else:
+            bb.warn("SPDX: Could not hash file: " + path)
+    ver_code_string = ''.join(chksums).lower()
+    ver_code = hash_string(ver_code_string)
     return ver_code
 
-def get_header_info( info, spdx_verification_code, package_info):
+def get_header_info(info, spdx_verification_code, package_info):
     """
         Put together the header SPDX information.
         Eventually this needs to become a lot less
@@ -330,14 +310,12 @@ def get_header_info( info, spdx_verification_code, package_info):
     head = []
     DEFAULT = "NOASSERTION"
 
-    #spdx_verification_code = get_ver_code( info['sourcedir'] )
-    package_checksum = ''
-    if os.path.exists(info['tar_file']):
-        package_checksum = hash_file( info['tar_file'] )
-    else:
+    package_checksum = hash_file(info['tar_file'])
+    if package_checksum is None:
         package_checksum = DEFAULT
 
     ## document level information
+    head.append("## SPDX Document Information")
     head.append("SPDXVersion: " + info['spdx_version'])
     head.append("DataLicense: " + info['data_license'])
     head.append("DocumentComment: <text>SPDX for "
@@ -345,9 +323,11 @@ def get_header_info( info, spdx_verification_code, package_info):
     head.append("")
 
     ## Creator information
+    ## Note that this does not give time in UTC.
     now = datetime.now().strftime('%Y-%m-%dT%H:%M:%SZ')
     head.append("## Creation Information")
-    head.append("Creator: Tool: fossology-spdx")
+    ## Tools are supposed to have a version, but FOSSology+SPDX provides none.
+    head.append("Creator: Tool: FOSSology+SPDX")
     head.append("Created: " + now)
     head.append("CreatorComment: <text>UNO</text>")
     head.append("")
@@ -366,10 +346,14 @@ def get_header_info( info, spdx_verification_code, package_info):
     head.append("PackageDescription: <text>" + info['pn']
         + " version " + info['pv'] + "</text>")
     head.append("")
-    head.append("PackageCopyrightText: " + package_info['PackageCopyrightText'])
+    head.append("PackageCopyrightText: "
+        + package_info['PackageCopyrightText'])
     head.append("")
-    head.append("PackageLicenseDeclared: " + package_info['PackageLicenseDeclared'])
-    head.append("PackageLicenseConcluded: " + package_info['PackageLicenseConcluded'])
+    head.append("PackageLicenseDeclared: "
+        + package_info['PackageLicenseDeclared'])
+    head.append("PackageLicenseConcluded: "
+        + package_info['PackageLicenseConcluded'])
+
     for licref in package_info['PackageLicenseInfoFromFiles']:
         head.append("PackageLicenseInfoFromFiles: " + licref)
     head.append("")
-- 
2.1.1


