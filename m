Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id C81AA60609
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 21:41:17 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so1168151pde.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RKP31LbN/n81ss20bavVKHB2RJgbh/IAVPGCoBm+n5M=;
	b=Je0Nn9SY/vh8EB+yPMZaVvpjdfdJNUHPCJmcba+JYD1vJu1Bmnf814lq9lGKGzwC5L
	HNGoFN+Uw2rlQ1TJmNGpl9g+vt6P63vkBxbDbwlY5XLRuk8yJm6GUxwGHmBGnmwpQr+o
	nlqzAQ6E2dkfShGQ9MEKUUwQpbxynv9pdjekmdTtr1Q6GnrcYxWaKGhCID66Yq8v4rSZ
	B7pBeBgiKm0a8zT/aaRwZt9UbbmzzjmqZFjpSD9bkuUuOK79BZ0Zj6GoQC1wFl8neerS
	g3hYElFWP2LFgOr+W1EfdY4Sz8eqSY1YQYLLYwZcaBEIxNMX5pnA6xMKfrcaprjZvYTJ
	jyJA==
X-Gm-Message-State: ALoCoQkH6GM6gudBSkAWAumXO3MeUlvQqt3sWJhSALqtz0R/SntTHPfsrjdbgifSvGMtr2IIPsuN
X-Received: by 10.66.146.199 with SMTP id te7mr1072003pab.106.1377294078426;
	Fri, 23 Aug 2013 14:41:18 -0700 (PDT)
Received: from avartita.hsd1.or.comcast.net.
	(c-24-21-207-18.hsd1.or.comcast.net. [24.21.207.18])
	by mx.google.com with ESMTPSA id vz4sm3227425pab.11.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 14:41:17 -0700 (PDT)
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 14:40:35 -0700
Message-Id: <1377294035-10694-1-git-send-email-elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] SPDX:real-time license scanning and SPDX output.
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
X-List-Received-Date: Fri, 23 Aug 2013 21:41:17 -0000

From: liangcao <liangcao@unomaha.edu>

SPDX integrates real-time license scanning, generates
SPDX standard output and license verification
information during the OE-Core build process. The
existing module includes scanning patched packages
and creating package and file level SPDX documents.

Signed-off-by: liangcao <liangcao@unomaha.edu>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/spdx.bbclass |  321 +++++++++++++++++++++++++++++++++++++++++++++
 meta/conf/licenses.conf   |   51 ++++++-
 2 files changed, 371 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/spdx.bbclass

diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
new file mode 100644
index 0000000..bde6e49
--- /dev/null
+++ b/meta/classes/spdx.bbclass
@@ -0,0 +1,321 @@
+# This class integrates real-time license scanning, generation of SPDX standard
+# output and verifiying license info during the building process.
+# It is a combination of efforts from the OE-Core, SPDX and Fossology projects.
+#
+# For more information on FOSSology:
+#   http://www.fossology.org
+#
+# For more information on FOSSologySPDX commandline:
+#   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-Web-API
+#
+# For more information on SPDX:
+#   http://www.spdx.org
+#
+
+# SPDX file will be output to the path which is defined as[SPDX_MANIFEST_DIR] 
+# in ./meta/conf/licenses.conf.
+
+SPDXOUTPUTDIR = "${WORKDIR}/spdx_output_dir"
+SPDXSSTATEDIR = "${WORKDIR}/spdx_sstate_dir"
+
+python do_spdx () {
+    import os, sys
+    import json
+
+    info = {} 
+    info['workdir'] = (d.getVar('WORKDIR', True) or "")
+    info['sourcedir'] = (d.getVar('S', True) or "")
+    info['pn'] = (d.getVar( 'PN', True ) or "")
+    info['pv'] = (d.getVar( 'PV', True ) or "")
+    info['src_uri'] = (d.getVar( 'SRC_URI', True ) or "")
+    info['spdx_version'] = (d.getVar('SPDX_VERSION', True) or '')
+    info['data_license'] = (d.getVar('DATA_LICENSE', True) or '')
+
+    spdx_sstate_dir = (d.getVar('SPDXSSTATEDIR', True) or "")
+    manifest_dir = (d.getVar('SPDX_MANIFEST_DIR', True) or "")
+    info['outfile'] = os.path.join(manifest_dir, info['pn'] + ".spdx" )
+    sstatefile = os.path.join(spdx_sstate_dir, 
+        info['pn'] + info['pv'] + ".spdx" )
+    info['spdx_temp_dir'] = (d.getVar('SPDX_TEMP_DIR', True) or "")
+    info['tar_file'] = os.path.join( info['workdir'], info['pn'] + ".tar.gz" )
+
+
+    ## get everything from cache.  use it to decide if 
+    ## something needs to be rerun 
+    cur_ver_code = get_ver_code( info['sourcedir'] ) 
+    cache_cur = False
+    if not os.path.exists( spdx_sstate_dir ):
+        bb.mkdirhier( spdx_sstate_dir )
+    if not os.path.exists( info['spdx_temp_dir'] ):
+        bb.mkdirhier( info['spdx_temp_dir'] )
+    if os.path.exists( sstatefile ):
+        ## cache for this package exists. read it in
+        cached_spdx = get_cached_spdx( sstatefile )
+
+        if cached_spdx['PackageVerificationCode'] == cur_ver_code:
+            bb.warn(info['pn'] + "'s ver code same as cache's. do nothing")
+            cache_cur = True
+        else:
+            local_file_info = setup_foss_scan( info, 
+                True, cached_spdx['Files'] )
+    else:
+        local_file_info = setup_foss_scan( info, False, None )
+
+    if cache_cur:
+        spdx_file_info = cached_spdx['Files']
+    else:
+        ## setup fossology command
+        foss_server = (d.getVar('FOSS_SERVER', True) or "")
+        foss_flags = (d.getVar('FOSS_WGET_FLAGS', True) or "")
+        foss_command = "wget %s --post-file=%s %s"\
+            % (foss_flags,info['tar_file'],foss_server)
+        
+        #bb.warn(info['pn'] + json.dumps(local_file_info))
+        foss_file_info = run_fossology( foss_command )
+        spdx_file_info = create_spdx_doc( local_file_info, foss_file_info )
+        ## write to cache
+        write_cached_spdx(sstatefile,cur_ver_code,spdx_file_info)
+    
+    ## Get document and package level information
+    spdx_header_info = get_header_info(info, cur_ver_code, spdx_file_info)
+    
+    ## CREATE MANIFEST
+    create_manifest(info,spdx_header_info,spdx_file_info)
+
+    ## clean up the temp stuff
+    remove_dir_tree( info['spdx_temp_dir'] )
+    if os.path.exists(info['tar_file']):
+        remove_file( info['tar_file'] )
+}
+addtask spdx after do_patch before do_configure
+
+def create_manifest(info,header,files):
+    with open(info['outfile'], 'w') as f:
+        f.write(header + '\n')
+        for chksum, block in files.iteritems():
+            for key, value in block.iteritems():
+                f.write(key + ": " + value)
+                f.write('\n')
+            f.write('\n')
+
+def get_cached_spdx( sstatefile ):
+    import json
+    cached_spdx_info = {}
+    with open( sstatefile, 'r' ) as f:
+        try:
+            cached_spdx_info = json.load(f)
+        except ValueError as e:
+            cached_spdx_info = None
+    return cached_spdx_info
+
+def write_cached_spdx( sstatefile, ver_code, files ):
+    import json
+    spdx_doc = {}
+    spdx_doc['PackageVerificationCode'] = ver_code
+    spdx_doc['Files'] = {}
+    spdx_doc['Files'] = files
+    with open( sstatefile, 'w' ) as f:
+        f.write(json.dumps(spdx_doc))
+
+def setup_foss_scan( info, cache, cached_files ):
+    import errno, shutil
+    import tarfile
+    file_info = {}
+    cache_dict = {}
+
+    for f_dir, f in list_files( info['sourcedir'] ):
+        full_path =  os.path.join( f_dir, f )
+        abs_path = os.path.join(info['sourcedir'], full_path)
+        dest_dir = os.path.join( info['spdx_temp_dir'], f_dir )
+        dest_path = os.path.join( info['spdx_temp_dir'], full_path )
+        try:
+            stats = os.stat(abs_path)
+        except OSError as e:
+            bb.warn( "Stat failed" + str(e) + "\n")
+            continue
+
+        checksum = hash_file( abs_path )
+        mtime = time.asctime(time.localtime(stats.st_mtime))
+        
+        ## retain cache information if it exists
+        file_info[checksum] = {}
+        if cache and checksum in cached_files:
+            file_info[checksum] = cached_files[checksum]
+        else:
+            file_info[checksum]['FileName'] = full_path
+
+        try:
+            os.makedirs( dest_dir )
+        except OSError as e:
+            if e.errno == errno.EEXIST and os.path.isdir(dest_dir):
+                pass
+            else:
+                bb.warn( "mkdir failed " + str(e) + "\n" )
+                continue
+
+        if(cache and checksum not in cached_files) or not cache:
+            try:
+                shutil.copyfile( abs_path, dest_path )
+            except shutil.Error as e:
+                bb.warn( str(e) + "\n" )
+            except IOError as e:
+                bb.warn( str(e) + "\n" )
+    
+    with tarfile.open( info['tar_file'], "w:gz" ) as tar:
+        tar.add( info['spdx_temp_dir'], arcname=os.path.basename(info['spdx_temp_dir']) )
+    tar.close()
+    
+    return file_info
+
+
+def remove_dir_tree( dir_name ):
+    import shutil
+    try:
+        shutil.rmtree( dir_name )
+    except:
+        pass
+
+def remove_file( file_name ):
+    try:
+        os.remove( file_name )
+    except OSError as e:
+        pass
+
+def list_files( dir ):
+    for root, subFolders, files in os.walk( dir ):
+        for f in files:
+            rel_root = os.path.relpath( root, dir )
+            yield rel_root, f
+    return
+
+def hash_file( file_name ):
+    try:
+        f = open( file_name, 'rb' )
+        data_string = f.read()
+    except:
+       return None
+    finally:
+        f.close()
+    sha1 = hash_string( data_string )
+    return sha1
+
+def hash_string( data ):
+    import hashlib
+    sha1 = hashlib.sha1()
+    sha1.update( data )
+    return sha1.hexdigest()
+
+def run_fossology( foss_command ):
+    import string, re
+    import subprocess
+    
+    p = subprocess.Popen(foss_command.split(),
+        stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+    foss_output, foss_error = p.communicate()
+    
+    records = []
+    records = re.findall('FileName:.*?</text>', foss_output, re.S)
+
+    file_info = {}
+    for rec in records:
+        rec = string.replace( rec, '\r', '' )
+        chksum = re.findall( 'FileChecksum: SHA1: (.*)\n', rec)[0]
+        file_info[chksum] = {}
+        file_info[chksum]['FileCopyrightText'] = re.findall( 'FileCopyrightText: '
+            + '(.*?</text>)', rec, re.S )[0]
+        fields = ['FileType','LicenseConcluded',
+            'LicenseInfoInFile','FileName']
+        for field in fields:
+            file_info[chksum][field] = re.findall(field + ': (.*)', rec)[0]
+
+    return file_info
+
+def create_spdx_doc( file_info, scanned_files ):
+    import json
+    ## push foss changes back into cache
+    for chksum, lic_info in scanned_files.iteritems():
+        if chksum in file_info:
+            file_info[chksum]['FileName'] = file_info[chksum]['FileName']
+            file_info[chksum]['FileType'] = lic_info['FileType']
+            file_info[chksum]['FileChecksum: SHA1'] = chksum
+            file_info[chksum]['LicenseInfoInFile'] = lic_info['LicenseInfoInFile']
+            file_info[chksum]['LicenseConcluded'] = lic_info['LicenseConcluded']
+            file_info[chksum]['FileCopyrightText'] = lic_info['FileCopyrightText']
+        else:
+            bb.warn(lic_info['FileName'] + " : " + chksum
+                + " : is not in the local file info: "
+                + json.dumps(lic_info,indent=1))
+    return file_info
+
+def get_ver_code( dirname ):
+    chksums = []
+    for f_dir, f in list_files( dirname ):
+        try:
+            stats = os.stat(os.path.join(dirname,f_dir,f))
+        except OSError as e:
+            bb.warn( "Stat failed" + str(e) + "\n")
+            continue
+        chksums.append(hash_file(os.path.join(dirname,f_dir,f)))
+    ver_code_string = ''.join( chksums ).lower()
+    ver_code = hash_string( ver_code_string )
+    return ver_code
+
+def get_header_info( info, spdx_verification_code, spdx_files ):
+    """
+        Put together the header SPDX information.
+        Eventually this needs to become a lot less
+        of a hardcoded thing.
+    """
+    from datetime import datetime
+    import os
+    head = []
+    DEFAULT = "NOASSERTION"
+
+    #spdx_verification_code = get_ver_code( info['sourcedir'] )
+    package_checksum = ''
+    if os.path.exists(info['tar_file']):
+        package_checksum = hash_file( info['tar_file'] )
+    else:
+        package_checksum = DEFAULT
+
+    ## document level information
+    head.append("SPDXVersion: " + info['spdx_version'])
+    head.append("DataLicense: " + info['data_license'])
+    head.append("DocumentComment: <text>SPDX for "
+        + info['pn'] + " version " + info['pv'] + "</text>")
+    head.append("")
+
+    ## Creator information
+    now = datetime.now().strftime('%Y-%m-%dT%H:%M:%S')
+    head.append("## Creation Information")
+    head.append("Creator: fossology-spdx")
+    head.append("Created: " + now)
+    head.append("CreatorComment: <text>UNO</text>")
+    head.append("")
+
+    ## package level information
+    head.append("## Package Information")
+    head.append("PackageName: " + info['pn'])
+    head.append("PackageVersion: " + info['pv'])
+    head.append("PackageDownloadLocation: " + DEFAULT)
+    head.append("PackageSummary: <text></text>")
+    head.append("PackageFileName: " + os.path.basename(info['tar_file']))
+    head.append("PackageSupplier: Person:" + DEFAULT)
+    head.append("PackageOriginator: Person:" + DEFAULT)
+    head.append("PackageChecksum: SHA1: " + package_checksum)
+    head.append("PackageVerificationCode: " + spdx_verification_code)
+    head.append("PackageDescription: <text>" + info['pn']
+        + " version " + info['pv'] + "</text>")
+    head.append("")
+    head.append("PackageCopyrightText: <text>" + DEFAULT + "</text>")
+    head.append("")
+    head.append("PackageLicenseDeclared: " + DEFAULT)
+    head.append("PackageLicenseConcluded: " + DEFAULT)
+    head.append("PackageLicenseInfoFromFiles: " + DEFAULT)
+    head.append("")
+    
+    ## header for file level
+    head.append("## File Information")
+    head.append("")
+
+    return '\n'.join(head)
diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 922b84c..b41d0a8 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -113,6 +113,55 @@ SPDXLICENSEMAP[SGIv1] = "SGI-1"
 # Set if you want the license.manifest copied to the image
 #COPY_LIC_MANIFEST = "1"
 
-# If you want the pkg licenses copied over as well you must set 
+# If you want the pkg licenses copied over as well you must set
 # both COPY_LIC_MANIFEST and COPY_LIC_DIRS
 #COPY_LIC_DIRS = "1"
+
+## SPDX temporary directory
+SPDX_TEMP_DIR = "${WORKDIR}/spdx_temp"
+SPDX_MANIFEST_DIR = "/home/yocto/fossology_scans"
+
+## SPDX Format info
+SPDX_VERSION = "SPDX-1.1"
+DATA_LICENSE = "CC0-1.0"
+
+## Fossology scan information
+# You can set option to control if the copyright information will be skipped
+# during the identification process.
+#
+# It is defined as [FOSS_COPYRIGHT] in ./meta/conf/licenses.conf.
+# FOSS_COPYRIGHT = "true"
+#   NO copyright will be processed. That means only license information will be
+#   identified and output to SPDX file
+# FOSS_COPYRIGHT = "false"
+#   Copyright will be identified and output to SPDX file along with license
+#   information. The process will take more time than not processing copyright
+#   information.
+#
+
+FOSS_COPYRIGHT = "true"
+
+# A option defined as[FOSS_RECURSIVE_UNPACK] in ./meta/conf/licenses.conf. is
+# used to control if FOSSology server need recursively unpack tar.gz file which
+# is sent from do_spdx task.
+#
+# FOSS_RECURSIVE_UNPACK = "false":
+#    FOSSology server does NOT recursively unpack. In the current release, this
+#    is the default choice because recursively unpack will not necessarily break
+#    down original compressed files.
+# FOSS_RECURSIVE_UNPACK = "true":
+#    FOSSology server recursively unpack components.
+#
+
+FOSS_RECURSIVE_UNPACK = "false"
+
+# FOSSologySPDX instance server.
+# For more information on FOSSologySPDX commandline:
+#   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-Web-API
+#
+
+FOSS_SERVER = "http://localhost//?mod=spdx_license_once&noCopyright=${FOSS_COPYRIGHT}&recursiveUnpack=${FOSS_RECURSIVE_UNPACK}"
+
+FOSS_WGET_FLAGS = "-qO - --no-check-certificate --timeout=0"
+
+
-- 
1.7.9.5


