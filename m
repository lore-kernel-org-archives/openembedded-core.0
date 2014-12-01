Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id F200265D53
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 01:37:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44232802"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Dec 2014 09:33:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB11asvZ015643
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Dec 2014 09:36:54 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 1 Dec 2014 09:37:13 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core][PATCH 1/2] spdx: Provide spdx file that meet SPDX
	1.2 Version Specification
Thread-Index: AdANB0iH2ts/0IwJQjiqofr+zd8AGA==
Date: Mon, 1 Dec 2014 01:37:16 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDADA6F7@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.59]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] spdx: Provide spdx file that meet SPDX 1.2 Version Specification
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
X-List-Received-Date: Mon, 01 Dec 2014 01:37:27 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

ping



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Le=
i,
> Maohui
> Sent: Tuesday, November 25, 2014 9:32 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [oe-core][PATCH 1/2] spdx: Provide spdx file that =
meet
> SPDX 1.2 Version Specification
>=20
> Hi all
>=20
> Sorry, commit log is too simple.
>=20
> These two patches aim to make the spdx file meet the SPDX 1.2 Version
> Specification. The main changes are:
>=20
> 1. use "curl" command instead of "wget" when get spdx file from FOSSology=
SPDX
> instance server.
>=20
>    Before apply these patches, the command is :
>    wget -qO - --no-check-certificate --timeout=3D0
> --post-file=3Dxxx/yyy/zzz.tar.gz
> http://localhost//?mod=3Dspdx_license_once&noCopyright=3D${FOSS_COPYRIGHT=
}&rec
> ursiveUnpack=3D${FOSS_RECURSIVE_UNPACK}
>=20
>    After apply these patches, the command is :
>    curl http://127.0.0.1/repo/ --noproxy 127.0.0.1 -k -F
> "mod=3Dspdx_license_once" -F "noCopyright=3Dfalse" -F "jsonOutput=3Dfalse=
" -F
> "fullSPDXFlag=3Dtrue" -F "file=3D@ xxx/yyy/zzz.tar.gz" -o xxx/yyy/zzz.spd=
x
>=20
>    Because if use "wget" command,the Mandatory fields of the SPDX Specifi=
cation
> such as the following can't be obtained.
>    1) PackageLicenseInfoFromFiles(Package Information)
>    2) PackageLicenseDeclared(Package Information)
>    3) LicenseID(License Information)
>    4) ExtractedText(License Information)
>    5) LicenseName(License Information)
>=20
> 2. In order to avoid the SPDX_S be polluted in the rebuild, I make
> ${WORKDIR}/${SPDX_TEMP_DIR} to save the source after do_patch.
>=20
> 3. In addition, this patch add some more info that meet the SPDX 1.2 Vers=
ion
> Specification.
>=20
> After apply this patch, users only have to add " INHERIT +=3D "spdx" in t=
he
> local.conf file, they can get spdx file that meet the SPDX 1.2 Version
> Specification.
>=20
>=20
> Cheers
>=20
> Lei Maohui
>=20
>=20
>=20
> > -----Original Message-----
> > From: Lei, Maohui/=1B$BMk=1B(B =1B$BLP7E=1B(B
> > Sent: Monday, November 24, 2014 9:49 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Lei, Maohui/=1B$BMk=1B(B =1B$BLP7E=1B(B
> > Subject: [oe-core][PATCH 1/2] spdx: Provide spdx file that meet SPDX
> > 1.2 Version Specification
> >
> > Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
> > ---
> >  meta/classes/spdx.bbclass | 427
> > ++++++++++++++++------------------------------
> >  1 file changed, 150 insertions(+), 277 deletions(-)
> >
> > diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
> > index
> > 454c53e..9f0f120 100644
> > --- a/meta/classes/spdx.bbclass
> > +++ b/meta/classes/spdx.bbclass
> > @@ -15,178 +15,179 @@
> >  # SPDX file will be output to the path which is defined
> > as[SPDX_MANIFEST_DIR] # in ./meta/conf/licenses.conf.
> >
> > +SPDXOUTPUTDIR =3D "${WORKDIR}/spdx_output_dir"
> >  SPDXSSTATEDIR =3D "${WORKDIR}/spdx_sstate_dir"
> >
> >  # If ${S} isn't actually the top-level source directory, set SPDX_S
> > to point at  # the real top-level directory.
> > +
> >  SPDX_S ?=3D "${S}"
> >
> >  python do_spdx () {
> >      import os, sys
> > -    import json, shutil
> > +    import json
> >
> >      info =3D {}
> >      info['workdir'] =3D d.getVar('WORKDIR', True)
> > -    info['sourcedir'] =3D d.getVar('SPDX_S', True)
> > -    info['pn'] =3D d.getVar('PN', True)
> > -    info['pv'] =3D d.getVar('PV', True)
> > +    info['pn'] =3D d.getVar( 'PN', True )
> > +    info['pv'] =3D d.getVar( 'PV', True )
> > +    info['package_download_location'] =3D d.getVar( 'SRC_URI', True
> > + ).split()[0]
> >      info['spdx_version'] =3D d.getVar('SPDX_VERSION', True)
> >      info['data_license'] =3D d.getVar('DATA_LICENSE', True)
> > +    info['creator'] =3D {}
> > +    info['creator']['Tool'] =3D d.getVar('CREATOR_TOOL', True)
> > +    info['license_list_version'] =3D d.getVar('LICENSELISTVERSION', Tr=
ue)
> > +    info['package_homepage'] =3D d.getVar('HOMEPAGE', True)
> > +    info['package_summary'] =3D d.getVar('SUMMARY', True)
> >
> > -    sstatedir =3D d.getVar('SPDXSSTATEDIR', True)
> > -    sstatefile =3D os.path.join(sstatedir, info['pn'] + info['pv'] + "=
.spdx")
> > -
> > +    spdx_sstate_dir =3D d.getVar('SPDXSSTATEDIR', True)
> >      manifest_dir =3D d.getVar('SPDX_MANIFEST_DIR', True)
> >      info['outfile'] =3D os.path.join(manifest_dir, info['pn'] + ".spdx=
"
> > )
> > -
> > -    info['spdx_temp_dir'] =3D d.getVar('SPDX_TEMP_DIR', True)
> > -    info['tar_file'] =3D os.path.join(info['workdir'], info['pn'] +
> > ".tar.gz" )
> > -
> > +    sstatefile =3D os.path.join(spdx_sstate_dir,
> > +        info['pn'] + info['pv'] + ".spdx" )
> > +    info['tar_file'] =3D os.path.join( info['workdir'], info['pn'] +
> > + ".tar.gz" )
> > +
> >      # Make sure important dirs exist
> >      try:
> >          bb.utils.mkdirhier(manifest_dir)
> > -        bb.utils.mkdirhier(sstatedir)
> > -        bb.utils.mkdirhier(info['spdx_temp_dir'])
> > +        bb.utils.mkdirhier(spdx_sstate_dir)
> >      except OSError as e:
> >          bb.error("SPDX: Could not set up required directories: " + str=
(e))
> >          return
> >
> >      ## get everything from cache.  use it to decide if
> > -    ## something needs to be rerun
> > -    cur_ver_code =3D get_ver_code(info['sourcedir'])
> > +    ## something needs to be rerun
> > +    d.setVar('WORKDIR', d.getVar('SPDX_TEMP_DIR', True))
> > +    info['sourcedir'] =3D (d.getVar('SPDX_S', True) or "")
> > +    cur_ver_code =3D get_ver_code(info['sourcedir']).split()[0]
> >      cache_cur =3D False
> > -    if os.path.exists(sstatefile):
> > +    if os.path.exists( sstatefile ):
> >          ## cache for this package exists. read it in
> > -        cached_spdx =3D get_cached_spdx(sstatefile)
> > -
> > -        if cached_spdx['PackageVerificationCode'] =3D=3D cur_ver_code:
> > +        cached_spdx =3D get_cached_spdx(sstatefile).split()[0]
> > +        bb.warn("cached_spdx =3D " + cached_spdx.split()[0])
> > +        bb.warn("cur_ver_code =3D " + cur_ver_code.split()[0])
> > +        if (cached_spdx =3D=3D cur_ver_code):
> >              bb.warn("SPDX: Verification code for " + info['pn']
> > -                  + "is same as cache's. do nothing")
> > +                + "is same as cache's. do nothing")
> >              cache_cur =3D True
> > -        else:
> > -            local_file_info =3D setup_foss_scan(info, True,
> > cached_spdx['Files'])
> > -    else:
> > -        local_file_info =3D setup_foss_scan(info, False, None)
> > -
> > -    if cache_cur:
> > -        spdx_file_info =3D cached_spdx['Files']
> > -        foss_package_info =3D cached_spdx['Package']
> > -        foss_license_info =3D cached_spdx['Licenses']
> > -    else:
> > +    if not cache_cur:
> >          ## setup fossology command
> >          foss_server =3D d.getVar('FOSS_SERVER', True)
> > -        foss_flags =3D d.getVar('FOSS_WGET_FLAGS', True)
> > -        foss_full_spdx =3D d.getVar('FOSS_FULL_SPDX', True) =3D=3D "tr=
ue" or
> False
> > -        foss_command =3D "wget %s --post-file=3D%s %s"\
> > -            % (foss_flags, info['tar_file'], foss_server)
> > -
> > -        foss_result =3D run_fossology(foss_command, foss_full_spdx)
> > -        if foss_result is not None:
> > -            (foss_package_info, foss_file_info, foss_license_info) =3D
> > foss_result
> > -            spdx_file_info =3D create_spdx_doc(local_file_info,
> > foss_file_info)
> > -            ## write to cache
> > -            write_cached_spdx(sstatefile, cur_ver_code,
> foss_package_info,
> > -                              spdx_file_info, foss_license_info)
> > +        foss_flags =3D d.getVar('FOSS_CURL_FLAGS', True)
> > +        foss_command =3D "curl %s -k %s -F \"file=3D@%s\" -o %s"\
> > +            % (foss_server,foss_flags,info['tar_file'],sstatefile)
> > +
> > +        #get the source tarball for fossy_scan
> > +        setup_foss_scan(info)
> > +        #get spdx file from fossylogy server
> > +        run_fossology(foss_command)
> > +        if get_cached_spdx(sstatefile) !=3D None:
> > +            write_cached_spdx(info,sstatefile,cur_ver_code)
> > +            ## CREATE MANIFEST(write to outfile )
> > +            create_manifest(info,sstatefile)
> >          else:
> > -            bb.error("SPDX: Could not communicate with FOSSology serve=
r.
> > Command was: " + foss_command)
> > -            return
> > -
> > -    ## Get document and package level information
> > -    spdx_header_info =3D get_header_info(info, cur_ver_code,
> > foss_package_info)
> > -
> > -    ## CREATE MANIFEST
> > -    create_manifest(info, spdx_header_info, spdx_file_info,
> > foss_license_info)
> > -
> > -    ## clean up the temp stuff
> > -    shutil.rmtree(info['spdx_temp_dir'], ignore_errors=3DTrue)
> > +            bb.warn('Can\'t get the spdx file . Please check your
> > + fossylogy server.')
> >      if os.path.exists(info['tar_file']):
> >          remove_file(info['tar_file'])
> > +    d.setVar('WORKDIR', info['workdir']) } #Get the src after do_patch=
.
> > +python do_get_spdx_s() {
> > +    # Change the WORKDIR to make do_unpack do_patch run in another dir=
.
> > +    d.setVar('WORKDIR', d.getVar('SPDX_TEMP_DIR', True))
> > +    # The changed 'WORKDIR' also casued 'B' changed, create dir 'B' fo=
r the
> > +    # possibly requiring of the following tasks (such as some recipes'=
s
> > +    # do_patch required 'B' existed).
> > +    bb.utils.mkdirhier(d.getVar('B', True))
> > +
> > +    # The kernel source is ready after do_validate_branches
> > +    if bb.data.inherits_class('kernel-yocto', d):
> > +        bb.build.exec_func('do_unpack', d)
> > +        bb.build.exec_func('do_kernel_checkout', d)
> > +        bb.build.exec_func('do_validate_branches', d)
> > +    else:
> > +        bb.build.exec_func('do_unpack', d)
> > +    bb.build.exec_func('do_patch', d)
> >  }
> > -addtask spdx after do_patch before do_configure
> > -
> > -def create_manifest(info, header, files, licenses):
> > -    import codecs
> > -    with codecs.open(info['outfile'], mode=3D'w', encoding=3D'utf-8') =
as f:
> > -        # Write header
> > -        f.write(header + '\n')
> >
> > -        # Write file data
> > -        for chksum, block in files.iteritems():
> > -            f.write("FileName: " + block['FileName'] + '\n')
> > -            for key, value in block.iteritems():
> > -                if not key =3D=3D 'FileName':
> > -                    f.write(key + ": " + value + '\n')
> > -            f.write('\n')
> > +addtask get_spdx_s after do_patch before do_configure addtask spdx
> > +after do_get_spdx_s before do_configure
> >
> > -        # Write license data
> > -        for id, block in licenses.iteritems():
> > -            f.write("LicenseID: " + id + '\n')
> > -            for key, value in block.iteritems():
> > -                f.write(key + ": " + value + '\n')
> > -            f.write('\n')
> > +def create_manifest(info,sstatefile):
> > +    import shutil
> > +    shutil.copyfile(sstatefile,info['outfile'])
> >
> >  def get_cached_spdx(sstatefile):
> > -    import json
> > -    import codecs
> > -    cached_spdx_info =3D {}
> > -    with codecs.open(sstatefile, mode=3D'r', encoding=3D'utf-8') as f:
> > -        try:
> > -            cached_spdx_info =3D json.load(f)
> > -        except ValueError as e:
> > -            cached_spdx_info =3D None
> > -    return cached_spdx_info
> > +    import subprocess
> > +    if not os.path.exists(sstatefile):
> > +        return None
> > +
> > +    try:
> > +        output =3D subprocess.check_output(['grep',
> > + "PackageVerificationCode",
> > sstatefile])
> > +    except subprocess.CalledProcessError as e:
> > +        bb.error("Index creation command '%s' failed with return
> > code %d:\n%s" %
> > +                                                   (e.cmd,
> > + e.returncode,
> > e.output))
> > +        return None
> > +    cached_spdx_info=3Doutput.split(': ')
> > +    return cached_spdx_info[1]
> >
> > -def write_cached_spdx(sstatefile, ver_code, package_info, files,
> > license_info):
> > -    import json
> > -    import codecs
> > -    spdx_doc =3D {}
> > -    spdx_doc['PackageVerificationCode'] =3D ver_code
> > -    spdx_doc['Files'] =3D {}
> > -    spdx_doc['Files'] =3D files
> > -    spdx_doc['Package'] =3D {}
> > -    spdx_doc['Package'] =3D package_info
> > -    spdx_doc['Licenses'] =3D {}
> > -    spdx_doc['Licenses'] =3D license_info
> > -    with codecs.open(sstatefile, mode=3D'w', encoding=3D'utf-8') as f:
> > -        f.write(json.dumps(spdx_doc))
> > +#add necessary information into spdx file def
> > +write_cached_spdx(info,sstatefile, ver_code):
> > +    import subprocess
> >
> > -def setup_foss_scan(info, cache, cached_files):
> > -    import errno, shutil
> > -    import tarfile
> > -    file_info =3D {}
> > -    cache_dict =3D {}
> > +    def sed_replace(dest_sed_cmd,key_word,replace_info):
> > +        dest_sed_cmd =3D dest_sed_cmd + "-e 's#^" + key_word + ".*#" +=
 \
> > +            key_word + replace_info + "#' "
> > +        return dest_sed_cmd
> >
> > -    for f_dir, f in list_files(info['sourcedir']):
> > -        full_path =3D os.path.join(f_dir, f)
> > -        abs_path =3D os.path.join(info['sourcedir'], full_path)
> > -        dest_dir =3D os.path.join(info['spdx_temp_dir'], f_dir)
> > -        dest_path =3D os.path.join(info['spdx_temp_dir'], full_path)
> > +    def sed_insert(dest_sed_cmd,key_word,new_line):
> > +        dest_sed_cmd =3D dest_sed_cmd + "-e '/^" + key_word \
> > +            + r"/a\\" + new_line + "' "
> > +        return dest_sed_cmd
> >
> > -        checksum =3D hash_file(abs_path)
> > -        if not checksum is None:
> > -            file_info[checksum] =3D {}
> > -            ## retain cache information if it exists
> > -            if cache and checksum in cached_files:
> > -                file_info[checksum] =3D cached_files[checksum]
> > -            ## have the file included in what's sent to the FOSSology =
server
> > -            else:
> > -                file_info[checksum]['FileName'] =3D full_path
> > -                try:
> > -                    bb.utils.mkdirhier(dest_dir)
> > -                    shutil.copyfile(abs_path, dest_path)
> > -                except OSError as e:
> > -                    bb.warn("SPDX: mkdirhier failed: " + str(e))
> > -                except shutil.Error as e:
> > -                    bb.warn("SPDX: copyfile failed: " + str(e))
> > -                except IOError as e:
> > -                    bb.warn("SPDX: copyfile failed: " + str(e))
> > -        else:
> > -            bb.warn("SPDX: Could not get checksum for file: " + f)
> > +    ## document level information
> > +    sed_cmd =3D r"sed -i -e 's#\r$##g' "
> > +    sed_cmd =3D sed_replace(sed_cmd,"SPDXVersion: ",info['spdx_version=
'])
> > +    spdx_DocumentComment =3D "<text>SPDX for " + info['pn'] + " versio=
n " \
> > +        + info['pv'] + "</text>"
> > +    sed_cmd =3D
> > + sed_replace(sed_cmd,"DocumentComment",spdx_DocumentComment)
> >
> > -    with tarfile.open(info['tar_file'], "w:gz") as tar:
> > -        tar.add(info['spdx_temp_dir'],
> > arcname=3Dos.path.basename(info['spdx_temp_dir']))
> > +    ## Creator information
> > +    sed_cmd =3D sed_replace(sed_cmd,"Creator: ",info['creator']['Tool'=
])
> > +    sed_cmd =3D sed_insert(sed_cmd,"CreatorComment:
> > + ","LicenseListVersion: " + info['license_list_version'])
> > +
> > +    ## package level information
> > +    sed_cmd =3D sed_replace(sed_cmd,"PackageName: ",info['pn'])
> > +    sed_cmd =3D sed_replace(sed_cmd,"PackageVersion: ",info['pv'])
> > +    sed_cmd =3D sed_replace(sed_cmd,"PackageDownloadLocation:
> > ",info['package_download_location'])
> > +    sed_cmd =3D sed_insert(sed_cmd,"PackageChecksum:
> > + ","PackageHomePage: " +
> > info['package_homepage'])
> > +    sed_cmd =3D sed_replace(sed_cmd,"PackageSummary: ","<text>" +
> > info['package_summary'] + "</text>")
> > +    sed_cmd =3D sed_replace(sed_cmd,"PackageFileName:
> > ",os.path.basename(info['tar_file']))
> > +    sed_cmd =3D sed_replace(sed_cmd,"PackageVerificationCode: ",ver_co=
de)
> > +    sed_cmd =3D sed_replace(sed_cmd,"PackageDescription: ",
> > +        "<text>" + info['pn'] + " version " + info['pv'] + "</text>")
> > +    sed_cmd =3D sed_cmd + sstatefile
> > +
> > +    subprocess.call("%s" % sed_cmd, shell=3DTrue)
> > +
> > +#archive the SPDX_S for get spdx file from fossylogy server def
> > +setup_foss_scan(info):
> > +    import tarfile
> > +    srcdir =3D info['sourcedir'].rstrip('/')
> > +    dirname =3D os.path.dirname(srcdir)
> > +    basename =3D os.path.basename(srcdir)
> > +    os.chdir(dirname)
> > +    tar =3D tarfile.open(info['tar_file'], 'w:gz')
> > +    tar.add(basename)
> > +    tar.close()
> > +
> >
> > -    return file_info
> > +def remove_dir_tree(dir_name):
> > +    import shutil
> > +    try:
> > +        shutil.rmtree(dir_name)
> > +    except:
> > +        pass
> >
> >  def remove_file(file_name):
> >      try:
> > @@ -195,20 +196,22 @@ def remove_file(file_name):
> >          pass
> >
> >  def list_files(dir):
> > -    for root, subFolders, files in os.walk(dir):
> > +    for root, subFolders, files in os.walk( dir ):
> >          for f in files:
> > -            rel_root =3D os.path.relpath(root, dir)
> > +            rel_root =3D os.path.relpath( root, dir )
> >              yield rel_root, f
> >      return
> >
> >  def hash_file(file_name):
> >      try:
> > -        with open(file_name, 'rb') as f:
> > -            data_string =3D f.read()
> > -            sha1 =3D hash_string(data_string)
> > -            return sha1
> > +        f =3D open( file_name, 'rb' )
> > +        data_string =3D f.read()
> >      except:
> > -        return None
> > +       return None
> > +    finally:
> > +        f.close()
> > +    sha1 =3D hash_string( data_string )
> > +    return sha1
> >
> >  def hash_string(data):
> >      import hashlib
> > @@ -216,150 +219,20 @@ def hash_string(data):
> >      sha1.update(data)
> >      return sha1.hexdigest()
> >
> > -def run_fossology(foss_command, full_spdx):
> > -    import string, re
> > -    import subprocess
> > -
> > -    p =3D subprocess.Popen(foss_command.split(),
> > -        stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE)
> > -    foss_output, foss_error =3D p.communicate()
> > -    if p.returncode !=3D 0:
> > -        return None
> > -
> > -    foss_output =3D unicode(foss_output, "utf-8")
> > -    foss_output =3D string.replace(foss_output, '\r', '')
> > -
> > -    # Package info
> > -    package_info =3D {}
> > -    if full_spdx:
> > -        # All mandatory, only one occurance
> > -        package_info['PackageCopyrightText'] =3D
> > re.findall('PackageCopyrightText: (.*?</text>)', foss_output, re.S)[0]
> > -        package_info['PackageLicenseDeclared'] =3D
> > re.findall('PackageLicenseDeclared: (.*)', foss_output)[0]
> > -        package_info['PackageLicenseConcluded'] =3D
> > re.findall('PackageLicenseConcluded: (.*)', foss_output)[0]
> > -        # These may be more than one
> > -        package_info['PackageLicenseInfoFromFiles'] =3D
> > re.findall('PackageLicenseInfoFromFiles: (.*)', foss_output)
> > -    else:
> > -        DEFAULT =3D "NOASSERTION"
> > -        package_info['PackageCopyrightText'] =3D "<text>" + DEFAULT +
> > "</text>"
> > -        package_info['PackageLicenseDeclared'] =3D DEFAULT
> > -        package_info['PackageLicenseConcluded'] =3D DEFAULT
> > -        package_info['PackageLicenseInfoFromFiles'] =3D []
> > -
> > -    # File info
> > -    file_info =3D {}
> > -    records =3D []
> > -    # FileName is also in PackageFileName, so we match on FileType as =
well.
> > -    records =3D re.findall('FileName:.*?FileType:.*?</text>', foss_out=
put,
> > re.S)
> > -    for rec in records:
> > -        chksum =3D re.findall('FileChecksum: SHA1: (.*)\n', rec)[0]
> > -        file_info[chksum] =3D {}
> > -        file_info[chksum]['FileCopyrightText'] =3D
> > re.findall('FileCopyrightText: '
> > -            + '(.*?</text>)', rec, re.S )[0]
> > -        fields =3D ['FileName', 'FileType', 'LicenseConcluded',
> > 'LicenseInfoInFile']
> > -        for field in fields:
> > -            file_info[chksum][field] =3D re.findall(field + ': (.*)', =
rec)[0]
> > -
> > -    # Licenses
> > -    license_info =3D {}
> > -    licenses =3D []
> > -    licenses =3D re.findall('LicenseID:.*?LicenseName:.*?\n', foss_out=
put,
> > re.S)
> > -    for lic in licenses:
> > -        license_id =3D re.findall('LicenseID: (.*)\n', lic)[0]
> > -        license_info[license_id] =3D {}
> > -        license_info[license_id]['ExtractedText'] =3D
> > re.findall('ExtractedText: (.*?</text>)', lic, re.S)[0]
> > -        license_info[license_id]['LicenseName'] =3D
> re.findall('LicenseName:
> > (.*)', lic)[0]
> > -
> > -    return (package_info, file_info, license_info)
> > -
> > -def create_spdx_doc(file_info, scanned_files):
> > -    import json
> > -    ## push foss changes back into cache
> > -    for chksum, lic_info in scanned_files.iteritems():
> > -        if chksum in file_info:
> > -            file_info[chksum]['FileType'] =3D lic_info['FileType']
> > -            file_info[chksum]['FileChecksum: SHA1'] =3D chksum
> > -            file_info[chksum]['LicenseInfoInFile'] =3D
> > lic_info['LicenseInfoInFile']
> > -            file_info[chksum]['LicenseConcluded'] =3D
> > lic_info['LicenseConcluded']
> > -            file_info[chksum]['FileCopyrightText'] =3D
> > lic_info['FileCopyrightText']
> > -        else:
> > -            bb.warn("SPDX: " + lic_info['FileName'] + " : " + chksum
> > -                + " : is not in the local file info: "
> > -                + json.dumps(lic_info, indent=3D1))
> > -    return file_info
> > +def run_fossology(foss_command):
> > +    import subprocess
> > +    subprocess.call(foss_command, shell=3DTrue)
> >
> >  def get_ver_code(dirname):
> >      chksums =3D []
> > -    for f_dir, f in list_files(dirname):
> > -        hash =3D hash_file(os.path.join(dirname, f_dir, f))
> > -        if not hash is None:
> > -            chksums.append(hash)
> > -        else:
> > -            bb.warn("SPDX: Could not hash file: " + path)
> > -    ver_code_string =3D ''.join(chksums).lower()
> > -    ver_code =3D hash_string(ver_code_string)
> > +    for f_dir, f in list_files( dirname ):
> > +        try:
> > +            stats =3D os.stat(os.path.join(dirname,f_dir,f))
> > +        except OSError as e:
> > +            bb.warn( "Stat failed" + str(e) + "\n")
> > +            continue
> > +        chksums.append(hash_file(os.path.join(dirname,f_dir,f)))
> > +    ver_code_string =3D ''.join( chksums ).lower()
> > +    ver_code =3D hash_string( ver_code_string )
> >      return ver_code
> >
> > -def get_header_info(info, spdx_verification_code, package_info):
> > -    """
> > -        Put together the header SPDX information.
> > -        Eventually this needs to become a lot less
> > -        of a hardcoded thing.
> > -    """
> > -    from datetime import datetime
> > -    import os
> > -    head =3D []
> > -    DEFAULT =3D "NOASSERTION"
> > -
> > -    package_checksum =3D hash_file(info['tar_file'])
> > -    if package_checksum is None:
> > -        package_checksum =3D DEFAULT
> > -
> > -    ## document level information
> > -    head.append("## SPDX Document Information")
> > -    head.append("SPDXVersion: " + info['spdx_version'])
> > -    head.append("DataLicense: " + info['data_license'])
> > -    head.append("DocumentComment: <text>SPDX for "
> > -        + info['pn'] + " version " + info['pv'] + "</text>")
> > -    head.append("")
> > -
> > -    ## Creator information
> > -    ## Note that this does not give time in UTC.
> > -    now =3D datetime.now().strftime('%Y-%m-%dT%H:%M:%SZ')
> > -    head.append("## Creation Information")
> > -    ## Tools are supposed to have a version, but FOSSology+SPDX provid=
es
> none.
> > -    head.append("Creator: Tool: FOSSology+SPDX")
> > -    head.append("Created: " + now)
> > -    head.append("CreatorComment: <text>UNO</text>")
> > -    head.append("")
> > -
> > -    ## package level information
> > -    head.append("## Package Information")
> > -    head.append("PackageName: " + info['pn'])
> > -    head.append("PackageVersion: " + info['pv'])
> > -    head.append("PackageFileName: " + os.path.basename(info['tar_file'=
]))
> > -    head.append("PackageSupplier: Person:" + DEFAULT)
> > -    head.append("PackageDownloadLocation: " + DEFAULT)
> > -    head.append("PackageSummary: <text></text>")
> > -    head.append("PackageOriginator: Person:" + DEFAULT)
> > -    head.append("PackageChecksum: SHA1: " + package_checksum)
> > -    head.append("PackageVerificationCode: " + spdx_verification_code)
> > -    head.append("PackageDescription: <text>" + info['pn']
> > -        + " version " + info['pv'] + "</text>")
> > -    head.append("")
> > -    head.append("PackageCopyrightText: "
> > -        + package_info['PackageCopyrightText'])
> > -    head.append("")
> > -    head.append("PackageLicenseDeclared: "
> > -        + package_info['PackageLicenseDeclared'])
> > -    head.append("PackageLicenseConcluded: "
> > -        + package_info['PackageLicenseConcluded'])
> > -
> > -    for licref in package_info['PackageLicenseInfoFromFiles']:
> > -        head.append("PackageLicenseInfoFromFiles: " + licref)
> > -    head.append("")
> > -
> > -    ## header for file level
> > -    head.append("## File Information")
> > -    head.append("")
> > -
> > -    return '\n'.join(head)
> > --
> > 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

