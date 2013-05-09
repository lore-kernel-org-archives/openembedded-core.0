Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UaTqK-0004EM-KW
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 18:37:29 +0200
Received: by mail-ee0-f45.google.com with SMTP id b45so270228eek.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 09:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=LmS3w/IoRDlAdiIfo/0kz1cup/liXfHGt6md3v+Mppc=;
	b=ZTAnPzrQCP3Gk6DNYIVOt3/EZl0SqqHEZYIrnuIL25k5R6YKQzZ4/LIscAD06IF4WP
	U+EpY7tfSmKzbExujdGufXIKnqvgF9i7nBuWF+eaye2ckz25bL2ABFx6Aedq8691HuaB
	dtGMnqFES0QyZTtpQs0jMb1OBSDAXdQNvEAvz8wcn44Nnb3KdBr4BaSKeL9V8GBCfQCW
	rnvibptL+GOLXfOI8hNXjBkDS8JR6hn+A/Mo7uiGIUx2PSAZc7ej3qFvjScgk0w7ZT8O
	iTB/a3oGp2jnKmohX+VRbuc6AaCWcaB3yb1ncK+K7tX8wp2LD5MN0mH3nCzqe422Wpfd
	9zew==
X-Received: by 10.15.44.10 with SMTP id y10mr30679933eev.5.1368116356615;
	Thu, 09 May 2013 09:19:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c44sm5149733eeb.4.2013.05.09.09.19.15 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 09 May 2013 09:19:15 -0700 (PDT)
Date: Thu, 9 May 2013 18:19:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130509161916.GF3188@jama>
References: <1368115558.27116.102.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1368115558.27116.102.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] class/lib: Fix up various file access methods
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
X-List-Received-Date: Thu, 09 May 2013 16:37:34 -0000
X-Groupsio-MsgNum: 38970
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RE3pQJLXZi4fr8Xo"
Content-Disposition: inline

--RE3pQJLXZi4fr8Xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2013 at 05:05:58PM +0100, Richard Purdie wrote:
> There are various bits of cruft that have built up around our file access=
es. This patch
> cleans some of them up, specifically:
>=20
>  * Remove pointless "from __builtin__ import file"
>  * Use open(), not file()
>  * Wrap file usage in a with container to ensure files are closed
>  * Add missing .close() calls in some cases
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest=
-qemu.bbclass
> index 63ba087..c30d1cb 100644
> --- a/meta/classes/imagetest-qemu.bbclass
> +++ b/meta/classes/imagetest-qemu.bbclass
> @@ -146,6 +146,7 @@ def qemuimagetest_main(d):
>                         if not os.path.isfile(fulltestcase):
>                              raise bb.build.FuncFailed("Testcase %s not f=
ound" % fulltestcase)
>                         list.append((item, casefile, fulltestcase))
> +                    f.close()

indentation looks wrong and the same a line above "raise.."

>          final_list =3D check_list(list)
>          return final_list
> =20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 809aa45..4d2392e 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -518,9 +518,10 @@ def package_qa_check_buildpaths(path, name, d, elf, =
messages):
>          return
> =20
>      tmpdir =3D d.getVar('TMPDIR', True)
> -    file_content =3D open(path).read()
> -    if tmpdir in file_content:
> -        messages.append("File %s in package contained reference to tmpdi=
r" % package_qa_clean_path(path,d))
> +    with open(path) as f:
> +        file_content =3D f.read()
> +        if tmpdir in file_content:
> +            messages.append("File %s in package contained reference to t=
mpdir" % package_qa_clean_path(path,d))
> =20
> =20
>  QAPATHTEST[xorg-driver-abi] =3D "package_qa_check_xorg_driver_abi"
> @@ -634,15 +635,17 @@ def package_qa_check_staged(path,d):
>          for file in files:
>              path =3D os.path.join(root,file)
>              if file.endswith(".la"):
> -                file_content =3D open(path).read()
> -                if workdir in file_content:
> -                    error_msg =3D "%s failed sanity test (workdir) in pa=
th %s" % (file,root)
> -                    sane =3D package_qa_handle_error("la", error_msg, d)
> +                with open(path) as f:
> +                    file_content =3D f.read()
> +                    if workdir in file_content:
> +                        error_msg =3D "%s failed sanity test (workdir) i=
n path %s" % (file,root)
> +                        sane =3D package_qa_handle_error("la", error_msg=
, d)
>              elif file.endswith(".pc"):
> -                file_content =3D open(path).read()
> -                if pkgconfigcheck in file_content:
> -                    error_msg =3D "%s failed sanity test (tmpdir) in pat=
h %s" % (file,root)
> -                    sane =3D package_qa_handle_error("pkgconfig", error_=
msg, d)
> +                with open(path) as f:
> +                    file_content =3D f.read()
> +                    if pkgconfigcheck in file_content:
> +                        error_msg =3D "%s failed sanity test (tmpdir) in=
 path %s" % (file,root)
> +                        sane =3D package_qa_handle_error("pkgconfig", er=
ror_msg, d)
> =20
>      return sane
> =20
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-packag=
e.bbclass
> index 3a13154..74e2078 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -146,7 +146,7 @@ python package_do_split_gconvs () {
> =20
>      def calc_gconv_deps(fn, pkg, file_regex, output_pattern, group):
>          deps =3D []
> -        f =3D open(fn, "r")
> +        f =3D open(fn, "rb")
>          c_re =3D re.compile('^copy "(.*)"')
>          i_re =3D re.compile('^include "(\w+)".*')
>          for l in f.readlines():
> @@ -167,7 +167,7 @@ python package_do_split_gconvs () {
> =20
>      def calc_charmap_deps(fn, pkg, file_regex, output_pattern, group):
>          deps =3D []
> -        f =3D open(fn, "r")
> +        f =3D open(fn, "rb")
>          c_re =3D re.compile('^copy "(.*)"')
>          i_re =3D re.compile('^include "(\w+)".*')
>          for l in f.readlines():
> @@ -187,7 +187,7 @@ python package_do_split_gconvs () {
> =20
>      def calc_locale_deps(fn, pkg, file_regex, output_pattern, group):
>          deps =3D []
> -        f =3D open(fn, "r")
> +        f =3D open(fn, "rb")
>          c_re =3D re.compile('^copy "(.*)"')
>          i_re =3D re.compile('^include "(\w+)".*')
>          for l in f.readlines():
> diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_sc=
m.bbclass
> index e9b207c..8d3988a 100644
> --- a/meta/classes/metadata_scm.bbclass
> +++ b/meta/classes/metadata_scm.bbclass
> @@ -32,10 +32,11 @@ def base_get_scmbasepath(d):
>  def base_get_metadata_monotone_branch(path, d):
>      monotone_branch =3D "<unknown>"
>      try:
> -        monotone_branch =3D file( "%s/_MTN/options" % path ).read().stri=
p()
> -        if monotone_branch.startswith( "database" ):
> -            monotone_branch_words =3D monotone_branch.split()
> -            monotone_branch =3D monotone_branch_words[ monotone_branch_w=
ords.index( "branch" )+1][1:-1]
> +        with open("%s/_MTN/options" % path) as f:
> +            monotone_branch =3D f.read().strip()
> +            if monotone_branch.startswith( "database" ):
> +                monotone_branch_words =3D monotone_branch.split()
> +                monotone_branch =3D monotone_branch_words[ monotone_bran=
ch_words.index( "branch" )+1][1:-1]
>      except:
>          pass
>      return monotone_branch
> @@ -43,10 +44,11 @@ def base_get_metadata_monotone_branch(path, d):
>  def base_get_metadata_monotone_revision(path, d):
>      monotone_revision =3D "<unknown>"
>      try:
> -        monotone_revision =3D file( "%s/_MTN/revision" % path ).read().s=
trip()
> -        if monotone_revision.startswith( "format_version" ):
> -            monotone_revision_words =3D monotone_revision.split()
> -            monotone_revision =3D monotone_revision_words[ monotone_revi=
sion_words.index( "old_revision" )+1][1:-1]
> +        with open("%s/_MTN/revision" % path) as f:
> +            monotone_revision =3D f.read().strip()
> +            if monotone_revision.startswith( "format_version" ):
> +                monotone_revision_words =3D monotone_revision.split()
> +                monotone_revision =3D monotone_revision_words[ monotone_=
revision_words.index( "old_revision" )+1][1:-1]
>      except IOError:
>          pass
>      return monotone_revision
> @@ -54,7 +56,8 @@ def base_get_metadata_monotone_revision(path, d):
>  def base_get_metadata_svn_revision(path, d):
>      revision =3D "<unknown>"
>      try:
> -        revision =3D file( "%s/.svn/entries" % path ).readlines()[3].str=
ip()
> +        with open("%s/.svn/entries" % path) as f:
> +            revision =3D f.readlines()[3].strip()
>      except IOError:
>          pass
>      return revision
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 7d0684c..36b3ae5 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1096,7 +1096,8 @@ python emit_pkgdata() {
> =20
>      def get_directory_size(dir):
>          if os.listdir(dir):
> -            size =3D int(os.popen('du -sk %s' % dir).readlines()[0].spli=
t('\t')[0])
> +            with os.popen('du -sk %s' % dir) as f:
> +                size =3D int(f.readlines()[0].split('\t')[0])
>          else:
>              size =3D 0
>          return size
> @@ -1203,7 +1204,7 @@ python emit_pkgdata() {
>          g =3D glob('*')
>          if g or allow_empty =3D=3D "1":
>              packagedfile =3D pkgdatadir + '/runtime/%s.packaged' % pkg
> -            file(packagedfile, 'w').close()
> +            open(packagedfile, 'w').close()
> =20
>      if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('mo=
dule-base', d):
>          write_extra_runtime_pkgs(variants, packages, pkgdatadir)
> @@ -1633,7 +1634,7 @@ def read_libdep_files(d):
>          for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
>              depsfile =3D d.expand("${PKGDEST}/" + pkg + extension)
>              if os.access(depsfile, os.R_OK):
> -                fd =3D file(depsfile)
> +                fd =3D open(depsfile)
>                  lines =3D fd.readlines()
>                  fd.close()
>                  for l in lines:
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.=
bbclass
> index 853b5ea..313758f 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -227,7 +227,7 @@ python do_package_deb () {
>          bb.mkdirhier(controldir)
>          os.chmod(controldir, 0755)
>          try:
> -            ctrlfile =3D file(os.path.join(controldir, 'control'), 'wb')
> +            ctrlfile =3D open(os.path.join(controldir, 'control'), 'w')
>              # import codecs
>              # ctrlfile =3D codecs.open("someFile", "w", "utf-8")
>          except OSError:
> @@ -355,7 +355,7 @@ python do_package_deb () {
>              if not scriptvar:
>                  continue
>              try:
> -                scriptfile =3D file(os.path.join(controldir, script), 'w=
')
> +                scriptfile =3D open(os.path.join(controldir, script), 'w=
')
>              except OSError:
>                  bb.utils.unlockfile(lf)
>                  raise bb.build.FuncFailed("unable to open %s script file=
 for writing." % script)
> @@ -367,7 +367,7 @@ python do_package_deb () {
>          conffiles_str =3D localdata.getVar("CONFFILES", True)
>          if conffiles_str:
>              try:
> -                conffiles =3D file(os.path.join(controldir, 'conffiles')=
, 'w')
> +                conffiles =3D open(os.path.join(controldir, 'conffiles')=
, 'w')
>              except OSError:
>                  bb.utils.unlockfile(lf)
>                  raise bb.build.FuncFailed("unable to open conffiles for =
writing.")
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.=
bbclass
> index 5873f71..f6797ad 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -268,7 +268,7 @@ python do_package_ipk () {
>          controldir =3D os.path.join(root, 'CONTROL')
>          bb.mkdirhier(controldir)
>          try:
> -            ctrlfile =3D file(os.path.join(controldir, 'control'), 'w')
> +            ctrlfile =3D open(os.path.join(controldir, 'control'), 'w')
>          except OSError:
>              bb.utils.unlockfile(lf)
>              raise bb.build.FuncFailed("unable to open control file for w=
riting.")
> @@ -369,7 +369,7 @@ python do_package_ipk () {
>              if not scriptvar:
>                  continue
>              try:
> -                scriptfile =3D file(os.path.join(controldir, script), 'w=
')
> +                scriptfile =3D open(os.path.join(controldir, script), 'w=
')
>              except OSError:
>                  bb.utils.unlockfile(lf)
>                  raise bb.build.FuncFailed("unable to open %s script file=
 for writing." % script)
> @@ -380,7 +380,7 @@ python do_package_ipk () {
>          conffiles_str =3D localdata.getVar("CONFFILES", True)
>          if conffiles_str:
>              try:
> -                conffiles =3D file(os.path.join(controldir, 'conffiles')=
, 'w')
> +                conffiles =3D open(os.path.join(controldir, 'conffiles')=
, 'w')
>              except OSError:
>                  bb.utils.unlockfile(lf)
>                  raise bb.build.FuncFailed("unable to open conffiles for =
writing.")
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.=
bbclass
> index 58739da..d9892b3 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -504,8 +504,7 @@ def write_rpm_perfiledata(srcname, d):
>      outdepends =3D workdir + "/" + srcname + ".requires"
> =20
>      try:
> -        from __builtin__ import file
> -        dependsfile =3D file(outdepends, 'w')
> +        dependsfile =3D open(outdepends, 'w')
>      except OSError:
>          raise bb.build.FuncFailed("unable to open spec file for writing.=
")
> =20
> @@ -518,8 +517,7 @@ def write_rpm_perfiledata(srcname, d):
>      outprovides =3D workdir + "/" + srcname + ".provides"
> =20
>      try:
> -        from __builtin__ import file
> -        providesfile =3D file(outprovides, 'w')
> +        providesfile =3D open(outprovides, 'w')
>      except OSError:
>          raise bb.build.FuncFailed("unable to open spec file for writing.=
")
> =20
> @@ -1005,8 +1003,7 @@ python write_specfile () {
> =20
>      # Write the SPEC file
>      try:
> -        from __builtin__ import file
> -        specfile =3D file(outspecfile, 'w')
> +        specfile =3D open(outspecfile, 'w')
>      except OSError:
>          raise bb.build.FuncFailed("unable to open spec file for writing.=
")
> =20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index e8a0c5f..0fd9ce6 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -561,14 +561,14 @@ def check_sanity(sanity_data):
>      last_sstate_dir =3D ""
>      sanityverfile =3D 'conf/sanity_info'
>      if os.path.exists(sanityverfile):
> -        f =3D open(sanityverfile, 'r')
> -        for line in f:
> -            if line.startswith('SANITY_VERSION'):
> -                last_sanity_version =3D int(line.split()[1])
> -            if line.startswith('TMPDIR'):
> -                last_tmpdir =3D line.split()[1]
> -            if line.startswith('SSTATE_DIR'):
> -                last_sstate_dir =3D line.split()[1]
> +        with open(sanityverfile, 'r') as f:
> +            for line in f:
> +                if line.startswith('SANITY_VERSION'):
> +                    last_sanity_version =3D int(line.split()[1])
> +                if line.startswith('TMPDIR'):
> +                    last_tmpdir =3D line.split()[1]
> +                if line.startswith('SSTATE_DIR'):
> +                    last_sstate_dir =3D line.split()[1]
>     =20
>      sanity_version =3D int(sanity_data.getVar('SANITY_VERSION', True) or=
 1)
>      network_error =3D False
> @@ -584,25 +584,24 @@ def check_sanity(sanity_data):
>          if last_sstate_dir !=3D sstate_dir:
>              messages =3D messages + check_sanity_sstate_dir_change(sstat=
e_dir, sanity_data)
>      if os.path.exists("conf") and not messages:
> -        f =3D open(sanityverfile, 'w')
> -        f.write("SANITY_VERSION %s\n" % sanity_version)=20
> -        f.write("TMPDIR %s\n" % tmpdir)=20
> -        f.write("SSTATE_DIR %s\n" % sstate_dir)=20
> +        with open(sanityverfile, 'w') as f:
> +            f.write("SANITY_VERSION %s\n" % sanity_version)=20
> +            f.write("TMPDIR %s\n" % tmpdir)=20
> +            f.write("SSTATE_DIR %s\n" % sstate_dir)=20
> =20
>      #
>      # Check that TMPDIR hasn't changed location since the last time we w=
ere run
>      #
>      checkfile =3D os.path.join(tmpdir, "saved_tmpdir")
>      if os.path.exists(checkfile):
> -        f =3D open(checkfile, "r")
> -        saved_tmpdir =3D f.read().strip()
> -        if (saved_tmpdir !=3D tmpdir):
> -            messages =3D messages + "Error, TMPDIR has changed location.=
 You need to either move it back to %s or rebuild\n" % saved_tmpdir
> +        with open(checkfile, "r") as f:
> +            saved_tmpdir =3D f.read().strip()
> +            if (saved_tmpdir !=3D tmpdir):
> +                messages =3D messages + "Error, TMPDIR has changed locat=
ion. You need to either move it back to %s or rebuild\n" % saved_tmpdir
>      else:
>          bb.utils.mkdirhier(tmpdir)
> -        f =3D open(checkfile, "w")
> -        f.write(tmpdir)
> -    f.close()
> +        with open(checkfile, "w") as f:
> +            f.write(tmpdir)
> =20
>      #
>      # Check the 'ABI' of TMPDIR
> @@ -610,33 +609,32 @@ def check_sanity(sanity_data):
>      current_abi =3D sanity_data.getVar('OELAYOUT_ABI', True)
>      abifile =3D sanity_data.getVar('SANITY_ABIFILE', True)
>      if os.path.exists(abifile):
> -        f =3D open(abifile, "r")
> -        abi =3D f.read().strip()
> +        with open(abifile, "r") as f:
> +            abi =3D f.read().strip()
>          if not abi.isdigit():
> -            f =3D open(abifile, "w")
> -            f.write(current_abi)
> +            with open(abifile, "w") as f:
> +                f.write(current_abi)
>          elif abi =3D=3D "2" and current_abi =3D=3D "3":
>              bb.note("Converting staging from layout version 2 to layout =
version 3")
>              subprocess.call(sanity_data.expand("mv ${TMPDIR}/staging ${T=
MPDIR}/sysroots"), shell=3DTrue)
>              subprocess.call(sanity_data.expand("ln -s sysroots ${TMPDIR}=
/staging"), shell=3DTrue)
>              subprocess.call(sanity_data.expand("cd ${TMPDIR}/stamps; for=
 i in */*do_populate_staging; do new=3D`echo $i | sed -e 's/do_populate_sta=
ging/do_populate_sysroot/'`; mv $i $new; done"), shell=3DTrue)
> -            f =3D open(abifile, "w")
> -            f.write(current_abi)
> +            with open(abifile, "w") as f:
> +                f.write(current_abi)
>          elif abi =3D=3D "3" and current_abi =3D=3D "4":
>              bb.note("Converting staging layout from version 3 to layout =
version 4")
>              if os.path.exists(sanity_data.expand("${STAGING_DIR_NATIVE}$=
{bindir_native}/${MULTIMACH_HOST_SYS}")):
>                  subprocess.call(sanity_data.expand("mv ${STAGING_DIR_NAT=
IVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}"), shell=
=3DTrue)
>                  subprocess.call(sanity_data.expand("ln -s ${STAGING_BIND=
IR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"), sh=
ell=3DTrue)
> -
> -            f =3D open(abifile, "w")
> -            f.write(current_abi)
> +            with open(abifile, "w") as f:
> +                f.write(current_abi)
>          elif abi =3D=3D "4":
>              messages =3D messages + "Staging layout has changed. The cro=
ss directory has been deprecated and cross packages are now built under the=
 native sysroot.\nThis requires a rebuild.\n"
>          elif abi =3D=3D "5" and current_abi =3D=3D "6":
>              bb.note("Converting staging layout from version 5 to layout =
version 6")
>              subprocess.call(sanity_data.expand("mv ${TMPDIR}/pstagelogs =
${SSTATE_MANIFESTS}"), shell=3DTrue)
> -            f =3D open(abifile, "w")
> -            f.write(current_abi)
> +            with open(abifile, "w") as f:
> +                f.write(current_abi)
>          elif abi =3D=3D "7" and current_abi =3D=3D "8":
>              messages =3D messages + "Your configuration is using stamp f=
iles including the sstate hash but your build directory was built with stam=
p files that do not include this.\nTo continue, either rebuild or switch ba=
ck to the OEBasic signature handler with BB_SIGNATURE_HANDLER =3D 'OEBasic'=
=2E\n"
>          elif (abi !=3D current_abi and current_abi =3D=3D "9"):
> @@ -645,9 +643,8 @@ def check_sanity(sanity_data):
>              # Code to convert from one ABI to another could go here if p=
ossible.
>              messages =3D messages + "Error, TMPDIR has changed its layou=
t version number (%s to %s) and you need to either rebuild, revert or adjus=
t it at your own risk.\n" % (abi, current_abi)
>      else:
> -        f =3D open(abifile, "w")
> -        f.write(current_abi)
> -    f.close()
> +        with open(abifile, "w") as f:
> +            f.write(current_abi)
> =20
>      oeroot =3D sanity_data.getVar('COREBASE')
>      if oeroot.find ('+') !=3D -1:
> diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> index 62fd718..14c38bd 100644
> --- a/meta/lib/oe/packagedata.py
> +++ b/meta/lib/oe/packagedata.py
> @@ -12,7 +12,7 @@ def read_pkgdatafile(fn):
> =20
>      if os.access(fn, os.R_OK):
>          import re
> -        f =3D file(fn, 'r')
> +        f =3D open(fn, 'r')
>          lines =3D f.readlines()
>          f.close()
>          r =3D re.compile("([^:]+):\s*(.*)")
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index ec8260d..0a2092b 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -7,11 +7,13 @@ except ImportError:
> =20
>  def read_file(filename):
>      try:
> -        f =3D file( filename, "r" )
> +        f =3D open( filename, "r" )
>      except IOError as reason:
>          return "" # WARNING: can't raise an error now because of the new=
 RDEPENDS handling. This is a bit ugly. :M:
>      else:
> -        return f.read().strip()
> +        data =3D f.read().strip()
> +        f.close()
> +        return data
>      return None
> =20
>  def ifelse(condition, iftrue =3D True, iffalse =3D False):
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index 59e0141..00c88ab 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -262,6 +262,7 @@ python do_package_prepend () {
> =20
>          d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
>          d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
> +    f.close()
>  }
> =20
>  pkg_postinst_${PN} () {
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RE3pQJLXZi4fr8Xo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGLzIQACgkQN1Ujt2V2gBzLkACeM9azZgMCyMvoGsSiEYs5atvc
evcAoKHxKzJxVD4eNwnPTMGbqIua/37i
=H5wi
-----END PGP SIGNATURE-----

--RE3pQJLXZi4fr8Xo--
