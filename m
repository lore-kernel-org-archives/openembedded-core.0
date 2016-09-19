Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 29C4760557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 10:57:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 19 Sep 2016 03:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,361,1470726000"; d="scan'208";a="763217974"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2016 03:57:12 -0700
Date: Mon, 19 Sep 2016 13:57:30 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Message-ID: <20160919105730.GC27969@mbabyjoh-desk.ger.corp.intel.com>
References: <1474274390-36100-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1474274390-36100-2-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1474274390-36100-2-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: jsmoeller@linuxfoundation.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] Make yocto-spdx support spdx2.0 SPEC
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
X-List-Received-Date: Mon, 19 Sep 2016 10:57:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please find my comments below:

On Mon, Sep 19, 2016 at 04:39:50PM +0800, Lei Maohui wrote:
> More:
> - change spdx tool from fossology to dosocs2

It would be nice to include the reason for change from fossology to dosocs2
in the commit message too (from cover letter)

> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta/classes/spdx.bbclass | 505 ++++++++++++++++++----------------------------
>  meta/conf/licenses.conf   |  67 +-----
>  2 files changed, 198 insertions(+), 374 deletions(-)
> 
> diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
> index 0c92765..27c0fa0 100644
> --- a/meta/classes/spdx.bbclass
> +++ b/meta/classes/spdx.bbclass
> @@ -1,365 +1,252 @@
>  # This class integrates real-time license scanning, generation of SPDX standard
>  # output and verifiying license info during the building process.
> -# It is a combination of efforts from the OE-Core, SPDX and Fossology projects.
> +# It is a combination of efforts from the OE-Core, SPDX and DoSOCSv2 projects.
>  #
> -# For more information on FOSSology:
> -#   http://www.fossology.org
> -#
> -# For more information on FOSSologySPDX commandline:
> -#   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-Web-API
> +# For more information on DoSOCSv2:
> +#   https://github.com/DoSOCSv2

Instead of requesting the user to install the DoSOCSv2 from github or other repos,
can we make the spdx.bbclass depend on "dosocs-native" or similar and make that
"DoSOCSv2" recipe available in oe-core ?

That might make it easy to use this class.

>  # For more information on SPDX:
>  #   http://www.spdx.org
>  #
> +# Note:
> +# 1) Make sure DoSOCSv2 has beed installed in your host
> +# 2) By default,spdx files will be output to the path which is defined as[SPDX_MANIFEST_DIR] 
> +#    in ./meta/conf/licenses.conf.
>  
> -# SPDX file will be output to the path which is defined as[SPDX_MANIFEST_DIR] 
> -# in ./meta/conf/licenses.conf.
> +SPDXOUTPUTDIR = "${WORKDIR}/spdx_output_dir"
>  SPDXSSTATEDIR = "${WORKDIR}/spdx_sstate_dir"
>  
>  # If ${S} isn't actually the top-level source directory, set SPDX_S to point at
>  # the real top-level directory.
> +
>  SPDX_S ?= "${S}"
>  
>  python do_spdx () {
>      import os, sys
> -    import json, shutil
> -
> -    info = {} 
> -    info['workdir'] = d.getVar('WORKDIR', True)
> -    info['sourcedir'] = d.getVar('SPDX_S', True)
> -    info['pn'] = d.getVar('PN', True)
> -    info['pv'] = d.getVar('PV', True)
> -    info['spdx_version'] = d.getVar('SPDX_VERSION', True)
> -    info['data_license'] = d.getVar('DATA_LICENSE', True)
> -
> -    sstatedir = d.getVar('SPDXSSTATEDIR', True)
> -    sstatefile = os.path.join(sstatedir, info['pn'] + info['pv'] + ".spdx")
> +    import json
>  
> -    manifest_dir = d.getVar('SPDX_MANIFEST_DIR', True)
> -    info['outfile'] = os.path.join(manifest_dir, info['pn'] + ".spdx" )
> +    ## It's no necessary  to get spdx files for *-native
> +    if d.getVar('PN', True) == d.getVar('BPN', True) + "-native": 
> +        return None
>  
> -    info['spdx_temp_dir'] = d.getVar('SPDX_TEMP_DIR', True)
> -    info['tar_file'] = os.path.join(info['workdir'], info['pn'] + ".tar.gz" )
> +    ## gcc is too big to get spdx file.
> +    if 'gcc' in d.getVar('PN', True):
> +        return None   
>  
> -    # Make sure important dirs exist
> -    try:
> -        bb.utils.mkdirhier(manifest_dir)
> -        bb.utils.mkdirhier(sstatedir)
> -        bb.utils.mkdirhier(info['spdx_temp_dir'])
> -    except OSError as e:
> -        bb.error("SPDX: Could not set up required directories: " + str(e))
> -        return
> +    info = {} 
> +    info['workdir'] = (d.getVar('WORKDIR', True) or "")
> +    info['pn'] = (d.getVar( 'PN', True ) or "")
> +    info['pv'] = (d.getVar( 'PV', True ) or "")
> +    info['package_download_location'] = (d.getVar( 'SRC_URI', True ) or "")
> +    if info['package_download_location'] != "":
> +        info['package_download_location'] = info['package_download_location'].split()[0]
> +    info['spdx_version'] = (d.getVar('SPDX_VERSION', True) or '')
> +    info['data_license'] = (d.getVar('DATA_LICENSE', True) or '')
> +    info['creator'] = {}
> +    info['creator']['Tool'] = (d.getVar('CREATOR_TOOL', True) or '')
> +    info['license_list_version'] = (d.getVar('LICENSELISTVERSION', True) or '')
> +    info['package_homepage'] = (d.getVar('HOMEPAGE', True) or "")
> +    info['package_summary'] = (d.getVar('SUMMARY', True) or "")
> +    info['package_summary'] = info['package_summary'].replace("\n","")
> +    info['package_summary'] = info['package_summary'].replace("'"," ")
> +
> +    spdx_sstate_dir = (d.getVar('SPDXSSTATEDIR', True) or "")
> +    manifest_dir = (d.getVar('SPDX_MANIFEST_DIR', True) or "")
> +    info['outfile'] = os.path.join(manifest_dir, info['pn'] + "-" + info['pv'] + ".spdx" )
> +    sstatefile = os.path.join(spdx_sstate_dir, 
> +        info['pn'] + "-" + info['pv'] + ".spdx" )
>  
>      ## get everything from cache.  use it to decide if 
> -    ## something needs to be rerun 
> -    cur_ver_code = get_ver_code(info['sourcedir'])
> +    ## something needs to be rerun
> +    if not os.path.exists( spdx_sstate_dir ):
> +        bb.utils.mkdirhier( spdx_sstate_dir )
> +    
> +    d.setVar('WORKDIR', d.getVar('SPDX_TEMP_DIR', True))
> +    info['sourcedir'] = (d.getVar('SPDX_S', True) or "")
> +    cur_ver_code = get_ver_code( info['sourcedir'] ).split()[0]
>      cache_cur = False
> -    if os.path.exists(sstatefile):
> +    if os.path.exists( sstatefile ):
>          ## cache for this package exists. read it in
> -        cached_spdx = get_cached_spdx(sstatefile)
> -
> -        if cached_spdx['PackageVerificationCode'] == cur_ver_code:
> -            bb.warn("SPDX: Verification code for " + info['pn']
> -                  + "is same as cache's. do nothing")
> +        cached_spdx = get_cached_spdx( sstatefile )
> +        if cached_spdx:
> +            cached_spdx = cached_spdx.split()[0]
> +        if (cached_spdx == cur_ver_code):
> +            bb.warn(info['pn'] + "'s ver code same as cache's. do nothing")
>              cache_cur = True
> +            create_manifest(info,sstatefile)
> +    if not cache_cur:
> +        ## setup dosocs2 command
> +        dosocs2_command = "dosocs2 oneshot %s" % info['sourcedir']
> +        ## no necessary to scan the git directory.
> +        git_path = "%s/.git" % info['sourcedir']
> +        if os.path.exists(git_path):
> +            remove_dir_tree(git_path)
> +
> +        ## Get spdx file
> +        run_dosocs2(dosocs2_command,sstatefile)
> +        if get_cached_spdx( sstatefile ) != None:
> +            write_cached_spdx( info,sstatefile,cur_ver_code )
> +            ## CREATE MANIFEST(write to outfile )
> +            create_manifest(info,sstatefile)
>          else:
> -            local_file_info = setup_foss_scan(info, True, cached_spdx['Files'])
> -    else:
> -        local_file_info = setup_foss_scan(info, False, None)
> -
> -    if cache_cur:
> -        spdx_file_info = cached_spdx['Files']
> -        foss_package_info = cached_spdx['Package']
> -        foss_license_info = cached_spdx['Licenses']
> -    else:
> -        ## setup fossology command
> -        foss_server = d.getVar('FOSS_SERVER', True)
> -        foss_flags = d.getVar('FOSS_WGET_FLAGS', True)
> -        foss_full_spdx = d.getVar('FOSS_FULL_SPDX', True) == "true" or False
> -        foss_command = "wget %s --post-file=%s %s"\
> -            % (foss_flags, info['tar_file'], foss_server)
> -        
> -        foss_result = run_fossology(foss_command, foss_full_spdx)
> -        if foss_result is not None:
> -            (foss_package_info, foss_file_info, foss_license_info) = foss_result
> -            spdx_file_info = create_spdx_doc(local_file_info, foss_file_info)
> -            ## write to cache
> -            write_cached_spdx(sstatefile, cur_ver_code, foss_package_info,
> -                              spdx_file_info, foss_license_info)
> -        else:
> -            bb.error("SPDX: Could not communicate with FOSSology server. Command was: " + foss_command)
> -            return
> -    
> -    ## Get document and package level information
> -    spdx_header_info = get_header_info(info, cur_ver_code, foss_package_info)
> +            bb.warn('Can\'t get the spdx file ' + info['pn'] + '. Please check your dosocs2.')
> +    d.setVar('WORKDIR', info['workdir'])
> +}
> +## Get the src after do_patch.
> +python do_get_spdx_s() {
>      
> -    ## CREATE MANIFEST
> -    create_manifest(info, spdx_header_info, spdx_file_info, foss_license_info)
> +    ## It's no necessary  to get spdx files for *-native
> +    if d.getVar('PN', True) == d.getVar('BPN', True) + "-native":
> +        return None
>  
> -    ## clean up the temp stuff
> -    shutil.rmtree(info['spdx_temp_dir'], ignore_errors=True)
> -    if os.path.exists(info['tar_file']):
> -        remove_file(info['tar_file'])
> +    ## gcc is too big to get spdx file.
> +    if 'gcc' in d.getVar('PN', True):
> +        return None
> +
> +    ## Change the WORKDIR to make do_unpack do_patch run in another dir.
> +    d.setVar('WORKDIR', d.getVar('SPDX_TEMP_DIR', True))
> +    ## The changed 'WORKDIR' also casued 'B' changed, create dir 'B' for the
> +    ## possibly requiring of the following tasks (such as some recipes's
> +    ## do_patch required 'B' existed).
> +    bb.utils.mkdirhier(d.getVar('B', True))
> +
> +    ## The kernel source is ready after do_validate_branches
> +    if bb.data.inherits_class('kernel-yocto', d):
> +        bb.build.exec_func('do_unpack', d)
> +        bb.build.exec_func('do_kernel_checkout', d)
> +        bb.build.exec_func('do_validate_branches', d)
> +    else:
> +        bb.build.exec_func('do_unpack', d)
> +    ## The S of the gcc source is work-share
> +    flag = d.getVarFlag('do_unpack', 'stamp-base', True)
> +    if flag:
> +        d.setVar('S', d.getVar('WORKDIR', True) + "/gcc-" + d.getVar('PV', True))
> +    bb.build.exec_func('do_patch', d)
>  }
> -addtask spdx after do_patch before do_configure
> -
> -def create_manifest(info, header, files, licenses):
> -    import codecs
> -    with codecs.open(info['outfile'], mode='w', encoding='utf-8') as f:
> -        # Write header
> -        f.write(header + '\n')
> -
> -        # Write file data
> -        for chksum, block in files.iteritems():
> -            f.write("FileName: " + block['FileName'] + '\n')
> -            for key, value in block.iteritems():
> -                if not key == 'FileName':
> -                    f.write(key + ": " + value + '\n')
> -            f.write('\n')
> -
> -        # Write license data
> -        for id, block in licenses.iteritems():
> -            f.write("LicenseID: " + id + '\n')
> -            for key, value in block.iteritems():
> -                f.write(key + ": " + value + '\n')
> -            f.write('\n')
> -
> -def get_cached_spdx(sstatefile):
> -    import json
> -    import codecs
> -    cached_spdx_info = {}
> -    with codecs.open(sstatefile, mode='r', encoding='utf-8') as f:
> -        try:
> -            cached_spdx_info = json.load(f)
> -        except ValueError as e:
> -            cached_spdx_info = None
> -    return cached_spdx_info
>  
> -def write_cached_spdx(sstatefile, ver_code, package_info, files, license_info):
> -    import json
> -    import codecs
> -    spdx_doc = {}
> -    spdx_doc['PackageVerificationCode'] = ver_code
> -    spdx_doc['Files'] = {}
> -    spdx_doc['Files'] = files
> -    spdx_doc['Package'] = {}
> -    spdx_doc['Package'] = package_info
> -    spdx_doc['Licenses'] = {}
> -    spdx_doc['Licenses'] = license_info
> -    with codecs.open(sstatefile, mode='w', encoding='utf-8') as f:
> -        f.write(json.dumps(spdx_doc))
> -
> -def setup_foss_scan(info, cache, cached_files):
> -    import errno, shutil
> -    import tarfile
> -    file_info = {}
> -    cache_dict = {}
> -
> -    for f_dir, f in list_files(info['sourcedir']):
> -        full_path = os.path.join(f_dir, f)
> -        abs_path = os.path.join(info['sourcedir'], full_path)
> -        dest_dir = os.path.join(info['spdx_temp_dir'], f_dir)
> -        dest_path = os.path.join(info['spdx_temp_dir'], full_path)
> -
> -        checksum = hash_file(abs_path)
> -        if not checksum is None:
> -            file_info[checksum] = {}
> -            ## retain cache information if it exists
> -            if cache and checksum in cached_files:
> -                file_info[checksum] = cached_files[checksum]
> -            ## have the file included in what's sent to the FOSSology server
> -            else:
> -                file_info[checksum]['FileName'] = full_path
> -                try:
> -                    bb.utils.mkdirhier(dest_dir)
> -                    shutil.copyfile(abs_path, dest_path)
> -                except OSError as e:
> -                    bb.warn("SPDX: mkdirhier failed: " + str(e))
> -                except shutil.Error as e:
> -                    bb.warn("SPDX: copyfile failed: " + str(e))
> -                except IOError as e:
> -                    bb.warn("SPDX: copyfile failed: " + str(e))
> -        else:
> -            bb.warn("SPDX: Could not get checksum for file: " + f)
> +addtask get_spdx_s after do_patch before do_configure
> +addtask spdx after do_get_spdx_s before do_configure
> +
> +def create_manifest(info,sstatefile):
> +    import shutil
> +    shutil.copyfile(sstatefile,info['outfile'])
> +
> +def get_cached_spdx( sstatefile ):
> +    import subprocess
> +
> +    if not os.path.exists( sstatefile ):
> +        return None
>      
> -    with tarfile.open(info['tar_file'], "w:gz") as tar:
> -        tar.add(info['spdx_temp_dir'], arcname=os.path.basename(info['spdx_temp_dir']))
> +    try:
> +        output = subprocess.check_output(['grep', "PackageVerificationCode", sstatefile])
> +    except subprocess.CalledProcessError as e:
> +        bb.error("Index creation command '%s' failed with return code %d:\n%s" % (e.cmd, e.returncode, e.output))
> +        return None
> +    cached_spdx_info=output.decode('utf-8').split(': ')
> +    return cached_spdx_info[1]
> +
> +## Add necessary information into spdx file
> +def write_cached_spdx( info,sstatefile, ver_code ):
> +    import subprocess
> +
> +    def sed_replace(dest_sed_cmd,key_word,replace_info):
> +        dest_sed_cmd = dest_sed_cmd + "-e 's#^" + key_word + ".*#" + \
> +            key_word + replace_info + "#' "
> +        return dest_sed_cmd
> +
> +    def sed_insert(dest_sed_cmd,key_word,new_line):
> +        dest_sed_cmd = dest_sed_cmd + "-e '/^" + key_word \
> +            + r"/a\\" + new_line + "' "
> +        return dest_sed_cmd
> +
> +    ## Document level information
> +    sed_cmd = r"sed -i -e 's#\r$##g' " 
> +    spdx_DocumentComment = "<text>SPDX for " + info['pn'] + " version " \ 
> +        + info['pv'] + "</text>"
> +    sed_cmd = sed_replace(sed_cmd,"DocumentComment",spdx_DocumentComment)
>      
> -    return file_info
> +    ## Creator information
> +    sed_cmd = sed_insert(sed_cmd,"CreatorComment: ","LicenseListVersion: " + info['license_list_version'])
> +
> +    ## Package level information
> +    sed_cmd = sed_replace(sed_cmd,"PackageName: ",info['pn'])
> +    sed_cmd = sed_replace(sed_cmd,"PackageVersion: ",info['pv'])
> +    sed_cmd = sed_replace(sed_cmd,"PackageDownloadLocation: ",info['package_download_location'])
> +    sed_cmd = sed_insert(sed_cmd,"PackageChecksum: ","PackageHomePage: " + info['package_homepage'])
> +    sed_cmd = sed_replace(sed_cmd,"PackageSummary: ","<text>" + info['package_summary'] + "</text>")
> +    sed_cmd = sed_replace(sed_cmd,"PackageVerificationCode: ",ver_code)
> +    sed_cmd = sed_replace(sed_cmd,"PackageDescription: ", 
> +        "<text>" + info['pn'] + " version " + info['pv'] + "</text>")
> +    sed_cmd = sed_cmd + sstatefile
> +
> +    subprocess.call("%s" % sed_cmd, shell=True)
> +
> +def remove_dir_tree( dir_name ):
> +    import shutil
> +    try:
> +        shutil.rmtree( dir_name )
> +    except:
> +        pass
>  
> -def remove_file(file_name):
> +def remove_file( file_name ):
>      try:
> -        os.remove(file_name)
> +        os.remove( file_name )
>      except OSError as e:
>          pass
>  
> -def list_files(dir):
> -    for root, subFolders, files in os.walk(dir):
> +def list_files( dir ):
> +    for root, subFolders, files in os.walk( dir ):
>          for f in files:
> -            rel_root = os.path.relpath(root, dir)
> +            rel_root = os.path.relpath( root, dir )
>              yield rel_root, f
>      return
>  
> -def hash_file(file_name):
> +def hash_file( file_name ):
> +    """
> +    Return the hex string representation of the SHA1 checksum of the filename
> +    """
>      try:
> -        with open(file_name, 'rb') as f:
> -            data_string = f.read()
> -            sha1 = hash_string(data_string)
> -            return sha1
> -    except:
> +        import hashlib
> +    except ImportError:
>          return None
> +    
> +    sha1 = hashlib.sha1()
> +    with open( file_name, "rb" ) as f:
> +        for line in f:
> +            sha1.update(line)
> +    return sha1.hexdigest()
>  
> -def hash_string(data):
> +def hash_string( data ):
>      import hashlib
>      sha1 = hashlib.sha1()
> -    sha1.update(data)
> +    sha1.update( data.encode('utf-8') )
>      return sha1.hexdigest()
>  
> -def run_fossology(foss_command, full_spdx):
> +def run_dosocs2( dosocs2_command,  spdx_file ):
> +    import subprocess, codecs 
>      import string, re
> -    import subprocess
> -    
> -    p = subprocess.Popen(foss_command.split(),
> +
> +    p = subprocess.Popen(dosocs2_command.split(),
>          stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> -    foss_output, foss_error = p.communicate()
> +    dosocs2_output, dosocs2_error = p.communicate()
>      if p.returncode != 0:
>          return None
>  
> -    foss_output = unicode(foss_output, "utf-8")
> -    foss_output = string.replace(foss_output, '\r', '')
> -
> -    # Package info
> -    package_info = {}
> -    if full_spdx:
> -        # All mandatory, only one occurrence
> -        package_info['PackageCopyrightText'] = re.findall('PackageCopyrightText: (.*?</text>)', foss_output, re.S)[0]
> -        package_info['PackageLicenseDeclared'] = re.findall('PackageLicenseDeclared: (.*)', foss_output)[0]
> -        package_info['PackageLicenseConcluded'] = re.findall('PackageLicenseConcluded: (.*)', foss_output)[0]
> -        # These may be more than one
> -        package_info['PackageLicenseInfoFromFiles'] = re.findall('PackageLicenseInfoFromFiles: (.*)', foss_output)
> -    else:
> -        DEFAULT = "NOASSERTION"
> -        package_info['PackageCopyrightText'] = "<text>" + DEFAULT + "</text>"
> -        package_info['PackageLicenseDeclared'] = DEFAULT
> -        package_info['PackageLicenseConcluded'] = DEFAULT
> -        package_info['PackageLicenseInfoFromFiles'] = []
> -
> -    # File info
> -    file_info = {}
> -    records = []
> -    # FileName is also in PackageFileName, so we match on FileType as well.
> -    records = re.findall('FileName:.*?FileType:.*?</text>', foss_output, re.S)
> -    for rec in records:
> -        chksum = re.findall('FileChecksum: SHA1: (.*)\n', rec)[0]
> -        file_info[chksum] = {}
> -        file_info[chksum]['FileCopyrightText'] = re.findall('FileCopyrightText: '
> -            + '(.*?</text>)', rec, re.S )[0]
> -        fields = ['FileName', 'FileType', 'LicenseConcluded', 'LicenseInfoInFile']
> -        for field in fields:
> -            file_info[chksum][field] = re.findall(field + ': (.*)', rec)[0]
> -
> -    # Licenses
> -    license_info = {}
> -    licenses = []
> -    licenses = re.findall('LicenseID:.*?LicenseName:.*?\n', foss_output, re.S)
> -    for lic in licenses:
> -        license_id = re.findall('LicenseID: (.*)\n', lic)[0]
> -        license_info[license_id] = {}
> -        license_info[license_id]['ExtractedText'] = re.findall('ExtractedText: (.*?</text>)', lic, re.S)[0]
> -        license_info[license_id]['LicenseName'] = re.findall('LicenseName: (.*)', lic)[0]
> -
> -    return (package_info, file_info, license_info)
> -
> -def create_spdx_doc(file_info, scanned_files):
> -    import json
> -    ## push foss changes back into cache
> -    for chksum, lic_info in scanned_files.iteritems():
> -        if chksum in file_info:
> -            file_info[chksum]['FileType'] = lic_info['FileType']
> -            file_info[chksum]['FileChecksum: SHA1'] = chksum
> -            file_info[chksum]['LicenseInfoInFile'] = lic_info['LicenseInfoInFile']
> -            file_info[chksum]['LicenseConcluded'] = lic_info['LicenseConcluded']
> -            file_info[chksum]['FileCopyrightText'] = lic_info['FileCopyrightText']
> -        else:
> -            bb.warn("SPDX: " + lic_info['FileName'] + " : " + chksum
> -                + " : is not in the local file info: "
> -                + json.dumps(lic_info, indent=1))
> -    return file_info
> +    dosocs2_output = dosocs2_output.decode('utf-8')
> +    
> +    f = codecs.open(spdx_file,'w','utf-8')
> +    f.write(dosocs2_output)
>  
> -def get_ver_code(dirname):
> +def get_ver_code( dirname ):
>      chksums = []
> -    for f_dir, f in list_files(dirname):
> -        hash = hash_file(os.path.join(dirname, f_dir, f))
> -        if not hash is None:
> -            chksums.append(hash)
> -        else:
> -            bb.warn("SPDX: Could not hash file: " + path)
> -    ver_code_string = ''.join(chksums).lower()
> -    ver_code = hash_string(ver_code_string)
> +    for f_dir, f in list_files( dirname ):
> +        try:
> +            stats = os.stat(os.path.join(dirname,f_dir,f))
> +        except OSError as e:
> +            bb.warn( "Stat failed" + str(e) + "\n")
> +            continue
> +        chksums.append(hash_file(os.path.join(dirname,f_dir,f)))
> +    ver_code_string = ''.join( chksums ).lower()
> +    ver_code = hash_string( ver_code_string )
>      return ver_code
>  
> -def get_header_info(info, spdx_verification_code, package_info):
> -    """
> -        Put together the header SPDX information.
> -        Eventually this needs to become a lot less
> -        of a hardcoded thing.
> -    """
> -    from datetime import datetime
> -    import os
> -    head = []
> -    DEFAULT = "NOASSERTION"
> -
> -    package_checksum = hash_file(info['tar_file'])
> -    if package_checksum is None:
> -        package_checksum = DEFAULT
> -
> -    ## document level information
> -    head.append("## SPDX Document Information")
> -    head.append("SPDXVersion: " + info['spdx_version'])
> -    head.append("DataLicense: " + info['data_license'])
> -    head.append("DocumentComment: <text>SPDX for "
> -        + info['pn'] + " version " + info['pv'] + "</text>")
> -    head.append("")
> -
> -    ## Creator information
> -    ## Note that this does not give time in UTC.
> -    now = datetime.now().strftime('%Y-%m-%dT%H:%M:%SZ')
> -    head.append("## Creation Information")
> -    ## Tools are supposed to have a version, but FOSSology+SPDX provides none.
> -    head.append("Creator: Tool: FOSSology+SPDX")
> -    head.append("Created: " + now)
> -    head.append("CreatorComment: <text>UNO</text>")
> -    head.append("")
> -
> -    ## package level information
> -    head.append("## Package Information")
> -    head.append("PackageName: " + info['pn'])
> -    head.append("PackageVersion: " + info['pv'])
> -    head.append("PackageFileName: " + os.path.basename(info['tar_file']))
> -    head.append("PackageSupplier: Person:" + DEFAULT)
> -    head.append("PackageDownloadLocation: " + DEFAULT)
> -    head.append("PackageSummary: <text></text>")
> -    head.append("PackageOriginator: Person:" + DEFAULT)
> -    head.append("PackageChecksum: SHA1: " + package_checksum)
> -    head.append("PackageVerificationCode: " + spdx_verification_code)
> -    head.append("PackageDescription: <text>" + info['pn']
> -        + " version " + info['pv'] + "</text>")
> -    head.append("")
> -    head.append("PackageCopyrightText: "
> -        + package_info['PackageCopyrightText'])
> -    head.append("")
> -    head.append("PackageLicenseDeclared: "
> -        + package_info['PackageLicenseDeclared'])
> -    head.append("PackageLicenseConcluded: "
> -        + package_info['PackageLicenseConcluded'])
> -
> -    for licref in package_info['PackageLicenseInfoFromFiles']:
> -        head.append("PackageLicenseInfoFromFiles: " + licref)
> -    head.append("")
> -    
> -    ## header for file level
> -    head.append("## File Information")
> -    head.append("")
> -
> -    return '\n'.join(head)
> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> index 9917c40..5963e2f 100644
> --- a/meta/conf/licenses.conf
> +++ b/meta/conf/licenses.conf
> @@ -122,68 +122,5 @@ SPDXLICENSEMAP[SGIv1] = "SGI-1"
>  #COPY_LIC_DIRS = "1"
>  
>  ## SPDX temporary directory
> -SPDX_TEMP_DIR = "${WORKDIR}/spdx_temp"
> -SPDX_MANIFEST_DIR = "/home/yocto/fossology_scans"
> -
> -## SPDX Format info
> -SPDX_VERSION = "SPDX-1.1"
> -DATA_LICENSE = "CC0-1.0"
> -
> -## Fossology scan information
> -# You can set option to control if the copyright information will be skipped
> -# during the identification process.
> -#
> -# It is defined as [FOSS_COPYRIGHT] in ./meta/conf/licenses.conf.
> -# FOSS_COPYRIGHT = "true"
> -#   NO copyright will be processed. That means only license information will be
> -#   identified and output to SPDX file
> -# FOSS_COPYRIGHT = "false"
> -#   Copyright will be identified and output to SPDX file along with license
> -#   information. The process will take more time than not processing copyright
> -#   information.
> -#
> -
> -FOSS_NO_COPYRIGHT = "true"
> -
> -# A option defined as[FOSS_RECURSIVE_UNPACK] in ./meta/conf/licenses.conf. is
> -# used to control if FOSSology server need recursively unpack tar.gz file which
> -# is sent from do_spdx task.
> -#
> -# FOSS_RECURSIVE_UNPACK = "false":
> -#    FOSSology server does NOT recursively unpack. In the current release, this
> -#    is the default choice because recursively unpack will not necessarily break
> -#    down original compressed files.
> -# FOSS_RECURSIVE_UNPACK = "true":
> -#    FOSSology server recursively unpack components.
> -#
> -
> -FOSS_RECURSIVE_UNPACK = "false"
> -
> -# An option defined as [FOSS_FULL_SPDX] in ./meta/conf/licenses.conf is used to
> -# control what kind of SPDX output to get from the FOSSology server.
> -#
> -# FOSS_FULL_SPDX = "true":
> -#   Tell FOSSology server to return full SPDX output, like if the program was
> -#   run from the command line. This is needed in order to get license refs for
> -#   the full package rather than individual files only.
> -#
> -# FOSS_FULL_SPDX = "false":
> -#   Tell FOSSology to only process license information for files. All package
> -#   license tags in the report will be "NOASSERTION"
> -#
> -
> -FOSS_FULL_SPDX = "true"
> -
> -# FOSSologySPDX instance server. http://localhost/repo is the default
> -# installation location for FOSSology.
> -#
> -# For more information on FOSSologySPDX commandline:
> -#   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-Web-API
> -#
> -
> -FOSS_BASE_URL = "http://localhost/repo/?mod=spdx_license_once"
> -FOSS_SERVER = "${FOSS_BASE_URL}&fullSPDXFlag=${FOSS_FULL_SPDX}&noCopyright=${FOSS_NO_COPYRIGHT}&recursiveUnpack=${FOSS_RECURSIVE_UNPACK}"
> -
> -FOSS_WGET_FLAGS = "-qO - --no-check-certificate --timeout=0"
> -
> -
> +SPDX_TEMP_DIR ?= "${WORKDIR}/spdx_temp"
> +SPDX_MANIFEST_DIR ?= "/home/yocto/spdx_scans"

Best Regards,
Maxin

