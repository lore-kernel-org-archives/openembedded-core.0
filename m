Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA9B73B90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 09:45:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96067414"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 May 2015 17:50:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t4T9iQsU028481
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 17:44:26 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 29 May 2015 17:45:54 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 May 2015 17:45:11 +0800
Message-ID: <1432892712-25356-2-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1432892712-25356-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1432892712-25356-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH v2 1/2] spdx.bbclass: Create the spdx file which is compliant with SPDX 1.2 Specification
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
X-List-Received-Date: Fri, 29 May 2015 09:45:56 -0000
Content-Type: text/plain

The main changes are:
1. use "curl" command instead of "wget" when get spdx file from FOSSologySPDX instance server.

   Before apply these patches, the command is :
   wget -qO - --no-check-certificate --timeout=0 --post-file=xxx/yyy/zzz.tar.gz http://localhost//?mod=spdx_license_once&noCopyright=${FOSS_COPYRIGHT}&recursiveUnpack=${FOSS_RECURSIVE_UNPACK}

   After apply these patches, the command is :
   curl http://127.0.0.1/repo/ --noproxy 127.0.0.1 -k -F "mod=spdx_license_once" -F "noCopyright=false" -F "jsonOutput=false" -F "fullSPDXFlag=true" -F "file=@ xxx/yyy/zzz.tar.gz" -o xxx/yyy/zzz.spdx

   Because if use "wget" command,the Mandatory fields of the SPDX Specification such as the following can't be obtained.
   1) PackageLicenseInfoFromFiles(Package Information)
   2) PackageLicenseDeclared(Package Information)
   3) LicenseID(License Information)
   4) ExtractedText(License Information)
   5) LicenseName(License Information)

2. In order to avoid the SPDX_S be polluted in the rebuild, create ${WORKDIR}/${SPDX_TEMP_DIR} to save the source.

3. Add mandatory field to be compliant with the SPDX 1.2 Specification.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/classes/spdx.bbclass | 425 +++++++++++++++++-----------------------------
 1 file changed, 155 insertions(+), 270 deletions(-)

diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index 454c53e..09584af 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -15,178 +15,191 @@
 # SPDX file will be output to the path which is defined as[SPDX_MANIFEST_DIR] 
 # in ./meta/conf/licenses.conf.
 
+SPDXOUTPUTDIR = "${WORKDIR}/spdx_output_dir"
 SPDXSSTATEDIR = "${WORKDIR}/spdx_sstate_dir"
 
 # If ${S} isn't actually the top-level source directory, set SPDX_S to point at
 # the real top-level directory.
+
 SPDX_S ?= "${S}"
 
 python do_spdx () {
     import os, sys
-    import json, shutil
+    import json
+
+    #The source of gcc is too large to get it's spdx.So,give up.
+    bpn = d.getVar('BPN', True)
+    if ((bpn == "gcc") or (bpn == "libgcc")):
+        return None
 
     info = {} 
     info['workdir'] = d.getVar('WORKDIR', True)
-    info['sourcedir'] = d.getVar('SPDX_S', True)
     info['pn'] = d.getVar('PN', True)
     info['pv'] = d.getVar('PV', True)
+    info['package_download_location'] = d.getVar('SRC_URI', True)
+    if info['package_download_location'] != "":
+        info['package_download_location'] = info['package_download_location'].split()[0]
     info['spdx_version'] = d.getVar('SPDX_VERSION', True)
     info['data_license'] = d.getVar('DATA_LICENSE', True)
+    info['creator'] = {}
+    info['creator']['Tool'] = d.getVar('CREATOR_TOOL', True)
+    info['license_list_version'] = d.getVar('LICENSELISTVERSION', True)
+    info['package_homepage'] = d.getVar('HOMEPAGE', True)
+    info['package_summary'] = d.getVar('SUMMARY', True)
 
-    sstatedir = d.getVar('SPDXSSTATEDIR', True)
-    sstatefile = os.path.join(sstatedir, info['pn'] + info['pv'] + ".spdx")
-
+    spdx_sstate_dir = d.getVar('SPDXSSTATEDIR', True)
     manifest_dir = d.getVar('SPDX_MANIFEST_DIR', True)
-    info['outfile'] = os.path.join(manifest_dir, info['pn'] + ".spdx" )
-
-    info['spdx_temp_dir'] = d.getVar('SPDX_TEMP_DIR', True)
-    info['tar_file'] = os.path.join(info['workdir'], info['pn'] + ".tar.gz" )
-
+    info['outfile'] = os.path.join(manifest_dir, info['pn'] + "-" + info['pv'] + ".spdx")
+    sstatefile = os.path.join(spdx_sstate_dir, 
+        info['pn'] + "-" + info['pv'] + ".spdx" )
+    info['tar_file'] = os.path.join(info['workdir'], info['pn'] + ".tar.gz")
+    
     # Make sure important dirs exist
     try:
         bb.utils.mkdirhier(manifest_dir)
-        bb.utils.mkdirhier(sstatedir)
-        bb.utils.mkdirhier(info['spdx_temp_dir'])
+        bb.utils.mkdirhier(spdx_sstate_dir)
     except OSError as e:
         bb.error("SPDX: Could not set up required directories: " + str(e))
         return
 
     ## get everything from cache.  use it to decide if 
-    ## something needs to be rerun 
-    cur_ver_code = get_ver_code(info['sourcedir'])
+    ## something needs to be rerun
+    d.setVar('WORKDIR', d.getVar('SPDX_TEMP_DIR', True))
+    info['sourcedir'] = d.getVar('SPDX_S', True)
+    cur_ver_code = get_ver_code(info['sourcedir']).split()[0]
     cache_cur = False
     if os.path.exists(sstatefile):
         ## cache for this package exists. read it in
         cached_spdx = get_cached_spdx(sstatefile)
-
-        if cached_spdx['PackageVerificationCode'] == cur_ver_code:
-            bb.warn("SPDX: Verification code for " + info['pn']
-                  + "is same as cache's. do nothing")
+        if cached_spdx:
+            cached_spdx = cached_spdx.split()[0]
+        if (cached_spdx == cur_ver_code):
+            bb.warn(info['pn'] + "'s ver code same as cache's. do nothing")
             cache_cur = True
-        else:
-            local_file_info = setup_foss_scan(info, True, cached_spdx['Files'])
-    else:
-        local_file_info = setup_foss_scan(info, False, None)
-
-    if cache_cur:
-        spdx_file_info = cached_spdx['Files']
-        foss_package_info = cached_spdx['Package']
-        foss_license_info = cached_spdx['Licenses']
-    else:
+            create_manifest(info,sstatefile)
+    if not cache_cur:
         ## setup fossology command
         foss_server = d.getVar('FOSS_SERVER', True)
-        foss_flags = d.getVar('FOSS_WGET_FLAGS', True)
-        foss_full_spdx = d.getVar('FOSS_FULL_SPDX', True) == "true" or False
-        foss_command = "wget %s --post-file=%s %s"\
-            % (foss_flags, info['tar_file'], foss_server)
-        
-        foss_result = run_fossology(foss_command, foss_full_spdx)
-        if foss_result is not None:
-            (foss_package_info, foss_file_info, foss_license_info) = foss_result
-            spdx_file_info = create_spdx_doc(local_file_info, foss_file_info)
-            ## write to cache
-            write_cached_spdx(sstatefile, cur_ver_code, foss_package_info,
-                              spdx_file_info, foss_license_info)
+        foss_flags = d.getVar('FOSS_CURL_FLAGS', True)
+        foss_command = "curl %s -k %s -F \"file=@%s\" -o %s"\
+            % (foss_server,foss_flags,info['tar_file'],sstatefile)
+
+        #get the source tarball for fossy_scan
+        setup_foss_scan(info)
+        #get spdx file from fossylogy server
+        run_fossology(foss_command)
+        if get_cached_spdx(sstatefile) != None:
+            write_cached_spdx(info,sstatefile,cur_ver_code)
+            ## CREATE MANIFEST(write to outfile )
+            create_manifest(info,sstatefile)
         else:
-            bb.error("SPDX: Could not communicate with FOSSology server. Command was: " + foss_command)
-            return
-    
-    ## Get document and package level information
-    spdx_header_info = get_header_info(info, cur_ver_code, foss_package_info)
-    
-    ## CREATE MANIFEST
-    create_manifest(info, spdx_header_info, spdx_file_info, foss_license_info)
-
-    ## clean up the temp stuff
-    shutil.rmtree(info['spdx_temp_dir'], ignore_errors=True)
+            bb.warn('Can\'t get the spdx file' + info['pn'] + '. Please check your fossylogy server.')
     if os.path.exists(info['tar_file']):
         remove_file(info['tar_file'])
+    d.setVar('WORKDIR', info['workdir'])
+}
+#Get the src after do_patch.
+python do_get_spdx_s() {
+    import shutil
+    #The source of gcc is too large to get it's spdx.So,give up.
+    bpn = d.getVar('BPN', True)
+    if ((bpn == "gcc") or (bpn == "libgcc")):
+        return None
+    # Change the WORKDIR to make do_unpack do_patch run in another dir.
+    d.setVar('WORKDIR', d.getVar('SPDX_TEMP_DIR', True))
+    # The changed 'WORKDIR' also casued 'B' changed, create dir 'B' for the
+    # possibly requiring of the following tasks (such as some recipes's
+    # do_patch required 'B' existed).
+    bb.utils.mkdirhier(d.getVar('B', True))
+
+    # The kernel source is ready after do_validate_branches
+    if bb.data.inherits_class('kernel-yocto', d):
+        shutil.copytree(d.getVar('S', True), d.getVar('WORKDIR', True) + "/kernel-source") 
+        return None
+    else:
+        bb.build.exec_func('do_unpack', d)
+    # The S of the gcc source is work-share
+    if ((bpn == "gcc") or (bpn == "libgcc")):
+        d.setVar('S', d.getVar('WORKDIR', True) + "/gcc-" + d.getVar('PV', True))
+    bb.build.exec_func('do_patch', d)
 }
-addtask spdx after do_patch before do_configure
-
-def create_manifest(info, header, files, licenses):
-    import codecs
-    with codecs.open(info['outfile'], mode='w', encoding='utf-8') as f:
-        # Write header
-        f.write(header + '\n')
 
-        # Write file data
-        for chksum, block in files.iteritems():
-            f.write("FileName: " + block['FileName'] + '\n')
-            for key, value in block.iteritems():
-                if not key == 'FileName':
-                    f.write(key + ": " + value + '\n')
-            f.write('\n')
+addtask get_spdx_s after do_patch before do_configure
+addtask spdx after do_get_spdx_s before do_configure
 
-        # Write license data
-        for id, block in licenses.iteritems():
-            f.write("LicenseID: " + id + '\n')
-            for key, value in block.iteritems():
-                f.write(key + ": " + value + '\n')
-            f.write('\n')
+def create_manifest(info,sstatefile):
+    import shutil
+    shutil.copyfile(sstatefile,info['outfile'])
 
 def get_cached_spdx(sstatefile):
-    import json
-    import codecs
-    cached_spdx_info = {}
-    with codecs.open(sstatefile, mode='r', encoding='utf-8') as f:
-        try:
-            cached_spdx_info = json.load(f)
-        except ValueError as e:
-            cached_spdx_info = None
-    return cached_spdx_info
+    import subprocess
+    if not os.path.exists(sstatefile):
+        return None
+    
+    try:
+        output = subprocess.check_output(['grep', "PackageVerificationCode", sstatefile])
+    except subprocess.CalledProcessError as e:
+        return None
+    cached_spdx_info=output.split(': ')
+    return cached_spdx_info[1]
 
-def write_cached_spdx(sstatefile, ver_code, package_info, files, license_info):
-    import json
-    import codecs
-    spdx_doc = {}
-    spdx_doc['PackageVerificationCode'] = ver_code
-    spdx_doc['Files'] = {}
-    spdx_doc['Files'] = files
-    spdx_doc['Package'] = {}
-    spdx_doc['Package'] = package_info
-    spdx_doc['Licenses'] = {}
-    spdx_doc['Licenses'] = license_info
-    with codecs.open(sstatefile, mode='w', encoding='utf-8') as f:
-        f.write(json.dumps(spdx_doc))
+#add necessary information into spdx file
+def write_cached_spdx(info,sstatefile, ver_code):
+    import subprocess
 
-def setup_foss_scan(info, cache, cached_files):
-    import errno, shutil
-    import tarfile
-    file_info = {}
-    cache_dict = {}
+    def sed_replace(dest_sed_cmd,key_word,replace_info):
+        dest_sed_cmd = dest_sed_cmd + "-e 's#^" + key_word + ".*#" + \
+            key_word + replace_info + "#' "
+        return dest_sed_cmd
 
-    for f_dir, f in list_files(info['sourcedir']):
-        full_path = os.path.join(f_dir, f)
-        abs_path = os.path.join(info['sourcedir'], full_path)
-        dest_dir = os.path.join(info['spdx_temp_dir'], f_dir)
-        dest_path = os.path.join(info['spdx_temp_dir'], full_path)
+    def sed_insert(dest_sed_cmd,key_word,new_line):
+        dest_sed_cmd = dest_sed_cmd + "-e '/^" + key_word \
+            + r"/a\\" + new_line + "' "
+        return dest_sed_cmd
 
-        checksum = hash_file(abs_path)
-        if not checksum is None:
-            file_info[checksum] = {}
-            ## retain cache information if it exists
-            if cache and checksum in cached_files:
-                file_info[checksum] = cached_files[checksum]
-            ## have the file included in what's sent to the FOSSology server
-            else:
-                file_info[checksum]['FileName'] = full_path
-                try:
-                    bb.utils.mkdirhier(dest_dir)
-                    shutil.copyfile(abs_path, dest_path)
-                except OSError as e:
-                    bb.warn("SPDX: mkdirhier failed: " + str(e))
-                except shutil.Error as e:
-                    bb.warn("SPDX: copyfile failed: " + str(e))
-                except IOError as e:
-                    bb.warn("SPDX: copyfile failed: " + str(e))
-        else:
-            bb.warn("SPDX: Could not get checksum for file: " + f)
+    ## document level information
+    sed_cmd = r"sed -i -e 's#\r$##g' " 
+    sed_cmd = sed_replace(sed_cmd,"SPDXVersion: ",info['spdx_version'])
+    spdx_DocumentComment = "<text>SPDX for " + info['pn'] + " version " \ 
+        + info['pv'] + "</text>"
+    sed_cmd = sed_replace(sed_cmd,"DocumentComment",spdx_DocumentComment)
     
-    with tarfile.open(info['tar_file'], "w:gz") as tar:
-        tar.add(info['spdx_temp_dir'], arcname=os.path.basename(info['spdx_temp_dir']))
+    ## Creator information
+    sed_cmd = sed_replace(sed_cmd,"Creator: Tool: ",info['creator']['Tool'])
+    sed_cmd = sed_insert(sed_cmd,"CreatorComment: ","LicenseListVersion: " + info['license_list_version'])
+
+    ## package level information
+    sed_cmd = sed_replace(sed_cmd,"PackageName: ",info['pn'])
+    sed_cmd = sed_replace(sed_cmd,"PackageVersion: ",info['pv'])
+    sed_cmd = sed_replace(sed_cmd,"PackageDownloadLocation: ",info['package_download_location'])
+    sed_cmd = sed_insert(sed_cmd,"PackageChecksum: ","PackageHomePage: " + info['package_homepage'])
+    sed_cmd = sed_replace(sed_cmd,"PackageSummary: ","<text>" + info['package_summary'] + "</text>")
+    sed_cmd = sed_replace(sed_cmd,"PackageFileName: ",os.path.basename(info['tar_file']))
+    sed_cmd = sed_replace(sed_cmd,"PackageVerificationCode: ",ver_code)
+    sed_cmd = sed_replace(sed_cmd,"PackageDescription: ", 
+        "<text>" + info['pn'] + " version " + info['pv'] + "</text>")
+    sed_cmd = sed_cmd + sstatefile
+
+    subprocess.call("%s" % sed_cmd, shell=True)
+
+#archive the SPDX_S for get spdx file from fossylogy server
+def setup_foss_scan(info):
+    import tarfile,os
+    srcdir = info['sourcedir'].rstrip('/')
+    dirname = os.path.dirname(srcdir)
+    basename = os.path.basename(srcdir)
+    os.chdir(dirname)
+    tar = tarfile.open(info['tar_file'], 'w:gz')
+    tar.add(basename)
+    tar.close()
+
     
-    return file_info
+def remove_dir_tree(dir_name):
+    import shutil
+    try:
+        shutil.rmtree(dir_name)
+    except:
+        pass
 
 def remove_file(file_name):
     try:
@@ -203,12 +216,14 @@ def list_files(dir):
 
 def hash_file(file_name):
     try:
-        with open(file_name, 'rb') as f:
-            data_string = f.read()
-            sha1 = hash_string(data_string)
-            return sha1
+        f = open(file_name, 'rb')
+        data_string = f.read()
     except:
-        return None
+       return None
+    finally:
+        f.close()
+    sha1 = hash_string(data_string)
+    return sha1
 
 def hash_string(data):
     import hashlib
@@ -216,150 +231,20 @@ def hash_string(data):
     sha1.update(data)
     return sha1.hexdigest()
 
-def run_fossology(foss_command, full_spdx):
-    import string, re
-    import subprocess
-    
-    p = subprocess.Popen(foss_command.split(),
-        stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-    foss_output, foss_error = p.communicate()
-    if p.returncode != 0:
-        return None
-
-    foss_output = unicode(foss_output, "utf-8")
-    foss_output = string.replace(foss_output, '\r', '')
-
-    # Package info
-    package_info = {}
-    if full_spdx:
-        # All mandatory, only one occurance
-        package_info['PackageCopyrightText'] = re.findall('PackageCopyrightText: (.*?</text>)', foss_output, re.S)[0]
-        package_info['PackageLicenseDeclared'] = re.findall('PackageLicenseDeclared: (.*)', foss_output)[0]
-        package_info['PackageLicenseConcluded'] = re.findall('PackageLicenseConcluded: (.*)', foss_output)[0]
-        # These may be more than one
-        package_info['PackageLicenseInfoFromFiles'] = re.findall('PackageLicenseInfoFromFiles: (.*)', foss_output)
-    else:
-        DEFAULT = "NOASSERTION"
-        package_info['PackageCopyrightText'] = "<text>" + DEFAULT + "</text>"
-        package_info['PackageLicenseDeclared'] = DEFAULT
-        package_info['PackageLicenseConcluded'] = DEFAULT
-        package_info['PackageLicenseInfoFromFiles'] = []
-
-    # File info
-    file_info = {}
-    records = []
-    # FileName is also in PackageFileName, so we match on FileType as well.
-    records = re.findall('FileName:.*?FileType:.*?</text>', foss_output, re.S)
-    for rec in records:
-        chksum = re.findall('FileChecksum: SHA1: (.*)\n', rec)[0]
-        file_info[chksum] = {}
-        file_info[chksum]['FileCopyrightText'] = re.findall('FileCopyrightText: '
-            + '(.*?</text>)', rec, re.S )[0]
-        fields = ['FileName', 'FileType', 'LicenseConcluded', 'LicenseInfoInFile']
-        for field in fields:
-            file_info[chksum][field] = re.findall(field + ': (.*)', rec)[0]
-
-    # Licenses
-    license_info = {}
-    licenses = []
-    licenses = re.findall('LicenseID:.*?LicenseName:.*?\n', foss_output, re.S)
-    for lic in licenses:
-        license_id = re.findall('LicenseID: (.*)\n', lic)[0]
-        license_info[license_id] = {}
-        license_info[license_id]['ExtractedText'] = re.findall('ExtractedText: (.*?</text>)', lic, re.S)[0]
-        license_info[license_id]['LicenseName'] = re.findall('LicenseName: (.*)', lic)[0]
-
-    return (package_info, file_info, license_info)
-
-def create_spdx_doc(file_info, scanned_files):
-    import json
-    ## push foss changes back into cache
-    for chksum, lic_info in scanned_files.iteritems():
-        if chksum in file_info:
-            file_info[chksum]['FileType'] = lic_info['FileType']
-            file_info[chksum]['FileChecksum: SHA1'] = chksum
-            file_info[chksum]['LicenseInfoInFile'] = lic_info['LicenseInfoInFile']
-            file_info[chksum]['LicenseConcluded'] = lic_info['LicenseConcluded']
-            file_info[chksum]['FileCopyrightText'] = lic_info['FileCopyrightText']
-        else:
-            bb.warn("SPDX: " + lic_info['FileName'] + " : " + chksum
-                + " : is not in the local file info: "
-                + json.dumps(lic_info, indent=1))
-    return file_info
+def run_fossology(foss_command):
+    import subprocess 
+    subprocess.call(foss_command, shell=True)
 
 def get_ver_code(dirname):
     chksums = []
     for f_dir, f in list_files(dirname):
-        hash = hash_file(os.path.join(dirname, f_dir, f))
-        if not hash is None:
-            chksums.append(hash)
-        else:
-            bb.warn("SPDX: Could not hash file: " + path)
+        try:
+            stats = os.stat(os.path.join(dirname,f_dir,f))
+        except OSError as e:
+            bb.warn("Stat failed" + str(e) + "\n")
+            continue
+        chksums.append(hash_file(os.path.join(dirname,f_dir,f)))
     ver_code_string = ''.join(chksums).lower()
     ver_code = hash_string(ver_code_string)
     return ver_code
 
-def get_header_info(info, spdx_verification_code, package_info):
-    """
-        Put together the header SPDX information.
-        Eventually this needs to become a lot less
-        of a hardcoded thing.
-    """
-    from datetime import datetime
-    import os
-    head = []
-    DEFAULT = "NOASSERTION"
-
-    package_checksum = hash_file(info['tar_file'])
-    if package_checksum is None:
-        package_checksum = DEFAULT
-
-    ## document level information
-    head.append("## SPDX Document Information")
-    head.append("SPDXVersion: " + info['spdx_version'])
-    head.append("DataLicense: " + info['data_license'])
-    head.append("DocumentComment: <text>SPDX for "
-        + info['pn'] + " version " + info['pv'] + "</text>")
-    head.append("")
-
-    ## Creator information
-    ## Note that this does not give time in UTC.
-    now = datetime.now().strftime('%Y-%m-%dT%H:%M:%SZ')
-    head.append("## Creation Information")
-    ## Tools are supposed to have a version, but FOSSology+SPDX provides none.
-    head.append("Creator: Tool: FOSSology+SPDX")
-    head.append("Created: " + now)
-    head.append("CreatorComment: <text>UNO</text>")
-    head.append("")
-
-    ## package level information
-    head.append("## Package Information")
-    head.append("PackageName: " + info['pn'])
-    head.append("PackageVersion: " + info['pv'])
-    head.append("PackageFileName: " + os.path.basename(info['tar_file']))
-    head.append("PackageSupplier: Person:" + DEFAULT)
-    head.append("PackageDownloadLocation: " + DEFAULT)
-    head.append("PackageSummary: <text></text>")
-    head.append("PackageOriginator: Person:" + DEFAULT)
-    head.append("PackageChecksum: SHA1: " + package_checksum)
-    head.append("PackageVerificationCode: " + spdx_verification_code)
-    head.append("PackageDescription: <text>" + info['pn']
-        + " version " + info['pv'] + "</text>")
-    head.append("")
-    head.append("PackageCopyrightText: "
-        + package_info['PackageCopyrightText'])
-    head.append("")
-    head.append("PackageLicenseDeclared: "
-        + package_info['PackageLicenseDeclared'])
-    head.append("PackageLicenseConcluded: "
-        + package_info['PackageLicenseConcluded'])
-
-    for licref in package_info['PackageLicenseInfoFromFiles']:
-        head.append("PackageLicenseInfoFromFiles: " + licref)
-    head.append("")
-    
-    ## header for file level
-    head.append("## File Information")
-    head.append("")
-
-    return '\n'.join(head)
-- 
1.8.4.2


