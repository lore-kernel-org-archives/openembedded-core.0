Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SCe4C-0000Ei-KI
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 23:36:36 +0200
Received: by qafl39 with SMTP id l39so3384573qaf.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=rf7O3q9j8+IioO1EYPrVGRayHiA0aZborFVEXSkvqXE=;
	b=HonZKXO/XdzBLKxUwxHmaZ4U47uK4NR/VidnapR5UriDbJbdOLDKxz2Vo7HFkhWtKU
	kZutMKODIeUIG0/mzpmRgDtv5D4VkPowaBN7F8SiXCHLxTy70rStKdBztouw2kSgEkkG
	zDfsuF8S9ZNPbu37N3NG94CivyQBn8RmaQT2a1cA5hIV+s79LUh92E047hWxi7KnF5oJ
	3z/4kBqYqbTyg9SNb9HuD7XeXZuhbDK5K/Vr77DM0oTSzwv5tRUaTkn9VokuBHX6zsOv
	iINpq7lni5qoN/nv76wBO1u+PhN7xFBb57MriGxDuWv6dNCSTS2mAZx4j1lkBFieAiaa
	igug==
Received: by 10.224.182.201 with SMTP id cd9mr35029334qab.92.1332883654982;
	Tue, 27 Mar 2012 14:27:34 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Tue, 27 Mar 2012 14:27:14 -0700 (PDT)
In-Reply-To: <3af1340dbc4b0d234532a63de88aed8e203bc09a.1332814325.git.xiaofeng.yan@windriver.com>
References: <cover.1332814325.git.xiaofeng.yan@windriver.com>
	<3af1340dbc4b0d234532a63de88aed8e203bc09a.1332814325.git.xiaofeng.yan@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 27 Mar 2012 14:27:14 -0700
X-Google-Sender-Auth: QHux65wAhkGCcnOfXRNS0MDIIZw
Message-ID: <CABcZANkC-_qmJB9G47EeU5o3FKCM2+=B+h054Pb9M2cvwtWmsw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] archiver.bbclass: New bbclass for archiving sources, patches, logs and scripts
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
X-List-Received-Date: Tue, 27 Mar 2012 21:36:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 26, 2012 at 7:24 PM, Xiaofeng Yan
<xiaofeng.yan@windriver.com> wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>
> 1 Archive sources in ${S} in the different stage
> =C2=A0(do_unpack,do_patch,do_configure).
> 2 Archive patches including series
> 3 Archive logs including scripts (.bb and .inc files)
> 4 dump environment resources which show all variable and functions
> =C2=A0used to xxx.showdata.dump when running a task
> 5 dump all content in 's' including patches to file xxx.diff.gz
>
> All archiving packages =C2=A0will be deployed to ${DEPLOY_DIR}/sources/
>
> [YOCTO #1977]
>
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> =C2=A0meta/classes/archiver.bbclass | =C2=A0460 +++++++++++++++++++++++++=
++++++++++++++++
> =C2=A01 files changed, 460 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/classes/archiver.bbclass
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
> new file mode 100644
> index 0000000..471430e
> --- /dev/null
> +++ b/meta/classes/archiver.bbclass
> @@ -0,0 +1,460 @@
> +# This file is used for archiving sources ,patches,and logs to tarball.
> +# It also output building environment to xxx.dump.data and create xxx.di=
ff.gz to record
> +# all content in ${S} to a diff file.
> +
> +EXCLUDE_FROM ?=3D ".pc autom4te.cache"
> +ARCHIVE_TYPE ?=3D "TAR SRPM"
> +DISTRO ?=3D "poky"
> +PATCHES_ARCHIVE_WITH_SERIES =3D 'TRUE'

I'm a bit concerned about the variable names here. Perhaps we should
prefix them with ARCHIVER_? "EXCLUDE_FROM" is a bit generic.

> +def parse_var(d,var):
> + =C2=A0 =C2=A0 =C2=A0 ''' parse variable like ${PV} =C2=A0in "require xx=
x_${PV}.inc" =C2=A0to a real value. for example, change "require xxx_${PV}.=
inc" to "require xxx_1.2.inc" '''
> + =C2=A0 =C2=A0 =C2=A0 import re
> + =C2=A0 =C2=A0 =C2=A0 pat =3D re.compile('.*\$({(.*)}).*')
> + =C2=A0 =C2=A0 =C2=A0 if '$' not in var and '/' not in var:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return var
> + =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if '/' in var:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return [i for i in var.split('/') if i.endswith('.inc')][0]
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif '$' in =C2=A0var:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 m =3D pat.match(var)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 patstr =3D '\$' + m.group(1)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 var_str =3D m.group(2)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return re.sub(patstr,d.getVar(var_str,True),var)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return var

Why not using bb.data.expand(), which is designed for this? I see one
usage of parse_var here which has access to 'd', so I see no reason
not to use the standard mechanisms.

> +def get_bb_inc(d):
> + =C2=A0 =C2=A0 =C2=A0 '''create a directory "script-logs" including .bb =
and .inc file in ${WORKDIR}'''
> + =C2=A0 =C2=A0 =C2=A0 import re
> + =C2=A0 =C2=A0 =C2=A0 import os
> + =C2=A0 =C2=A0 =C2=A0 import shutil
> +
> + =C2=A0 =C2=A0 =C2=A0 bbinc =3D []
> + =C2=A0 =C2=A0 =C2=A0 pat=3Dre.compile('require\s*([^\s]*\.*)(.*)')
> + =C2=A0 =C2=A0 =C2=A0 file_dir =3D d.getVar('FILE', True)
> + =C2=A0 =C2=A0 =C2=A0 bbdir =3D os.path.dirname(file_dir)
> + =C2=A0 =C2=A0 =C2=A0 work_dir =3D d.getVar('WORKDIR', True)
> + =C2=A0 =C2=A0 =C2=A0 os.chdir(work_dir)

I'd recommend against using chdir() unless there's no way around it.
I'd suggest working with the absolute paths instead.

> + =C2=A0 =C2=A0 =C2=A0 bb.mkdirhier("script-logs")
> + =C2=A0 =C2=A0 =C2=A0 os.chdir(bbdir)
> + =C2=A0 =C2=A0 =C2=A0 bbfile =3D os.path.basename(file_dir)
> + =C2=A0 =C2=A0 =C2=A0 bbinc.append(bbfile)
> +
> + =C2=A0 =C2=A0 =C2=A0 def get_inc (file):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D open(file,'r')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f.readline=
s():
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if 'require' not =C2=A0in line:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbinc.append(file)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 incfile =3D =
pat.match(line).group(1)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 incfile =3D =
parse_var(d,incfile)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbinc.append=
(incfile)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_inc(incf=
ile)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (IOError,AttributeError):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass
> + =C2=A0 =C2=A0 =C2=A0 get_inc(bbfile)
> + =C2=A0 =C2=A0 =C2=A0 os.chdir(work_dir)
> + =C2=A0 =C2=A0 =C2=A0 for root, dirs, files in os.walk(bbdir):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for file in bbinc:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if file in files:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy(root + '/' + file,'script-lo=
gs')
> + =C2=A0 =C2=A0 =C2=A0 oe.path.copytree('temp', 'script-logs')
> + =C2=A0 =C2=A0 =C2=A0 return work_dir + '/script-logs'
> +
> +def get_all_patches(d):
> + =C2=A0 =C2=A0 =C2=A0 '''copy patches and series file to a pointed direc=
tory which will be archived to tarball in ${WORKDIR}'''

This claims to be working with a series file, but I don't see anything
here which does anything of the sort. Further, as you aren't
determining what is and is not a patch, this will capture more than
just patches, also config files, etc, which makes either the function
name or its implementation wrong, depending on which is correct.

> + =C2=A0 =C2=A0 =C2=A0 import shutil
> +
> + =C2=A0 =C2=A0 =C2=A0 src_patches=3D[]
> + =C2=A0 =C2=A0 =C2=A0 pf =3D d.getVar('PF', True)
> + =C2=A0 =C2=A0 =C2=A0 work_dir =3D d.getVar('WORKDIR', True)
> + =C2=A0 =C2=A0 =C2=A0 s =3D d.getVar('S',True)
> + =C2=A0 =C2=A0 =C2=A0 dest =3D os.path.join(work_dir, pf + '-patches')
> + =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(dest, ignore_errors=3DTrue)
> + =C2=A0 =C2=A0 =C2=A0 bb.mkdirhier(dest)
> +
> + =C2=A0 =C2=A0 =C2=A0 src_uri =3D d.getVar('SRC_URI', 1).split()
> + =C2=A0 =C2=A0 =C2=A0 fetch =3D bb.fetch2.Fetch(src_uri, d)
> + =C2=A0 =C2=A0 =C2=A0 locals =3D (fetch.localpath(url) for url in fetch.=
urls)
> + =C2=A0 =C2=A0 =C2=A0 for local in locals:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_patches.append(loc=
al)
> + =C2=A0 =C2=A0 =C2=A0 if not cmp(work_dir,s):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_list =3D src_patch=
es
> + =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_list =3D src_patch=
es[1:]
> +
> + =C2=A0 =C2=A0 =C2=A0 for patch in tmp_list:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 shutil.copy(patch,dest)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if os.path.isdir(patch):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.copytree(patch,dest)
> + =C2=A0 =C2=A0 =C2=A0 return dest
> +
> +def get_applying_patches(d):
> + =C2=A0 =C2=A0 =C2=A0 """only copy applying patches to a pointed directo=
ry which will be archived to tarball"""
> + =C2=A0 =C2=A0 =C2=A0 import os
> + =C2=A0 =C2=A0 =C2=A0 import shutil
> +
> +
> + =C2=A0 =C2=A0 =C2=A0 pf =3D d.getVar('PF', True)
> + =C2=A0 =C2=A0 =C2=A0 work_dir =3D d.getVar('WORKDIR', True)
> + =C2=A0 =C2=A0 =C2=A0 dest =3D os.path.join(work_dir, pf + '-patches')
> + =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(dest, ignore_errors=3DTrue)
> + =C2=A0 =C2=A0 =C2=A0 bb.mkdirhier(dest)
> +
> +
> + =C2=A0 =C2=A0 =C2=A0 patches =3D src_patches(d)
> + =C2=A0 =C2=A0 =C2=A0 for patch in patches:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _, _, local, _, _, par=
m =3D bb.decodeurl(patch)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if local:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0shutil.copy(local,dest)
> + =C2=A0 =C2=A0 =C2=A0 return dest
> +
> +def not_tarball(d):
> + =C2=A0 =C2=A0 =C2=A0 '''packages including key words 'work-shared','nat=
ive', 'task-' will be passed'''
> + =C2=A0 =C2=A0 =C2=A0 import os
> +
> + =C2=A0 =C2=A0 =C2=A0 workdir =3D d.getVar('WORKDIR',True)
> + =C2=A0 =C2=A0 =C2=A0 s =3D d.getVar('S',True)
> + =C2=A0 =C2=A0 =C2=A0 if 'work-shared' in s or 'task-' in workdir or 'na=
tive' in workdir:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return True
> + =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False
> +
> +def get_source_from_downloads(d,middle_name):

I'd encourage you to find a better variable name than "middle_name".
It's vague at best, confusing at worst.

> + =C2=A0 =C2=A0 =C2=A0 '''copy tarball of $P to $WORKDIR when this tarbal=
l exists in $DL_DIR'''
> + =C2=A0 =C2=A0 =C2=A0 if middle_name in 'patched' 'configured':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
> + =C2=A0 =C2=A0 =C2=A0 pf =3D d.getVar('PF', True)
> + =C2=A0 =C2=A0 =C2=A0 dl_dir =3D d.getVar('DL_DIR',True)
> + =C2=A0 =C2=A0 =C2=A0 try:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 source =3D os.path.bas=
ename(d.getVar('SRC_URI', 1).split()[0])

Incorrect getVar call, use True.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(dl_dir)

You do a chdir here, but don't return it to the previous path afterwards.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(sour=
ce) and not os.path.isdir(source):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return source
> + =C2=A0 =C2=A0 =C2=A0 except (IndexError, OSError):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass
> +
> +def archive_sources_from_directory(d,middle_name):
> + =C2=A0 =C2=A0 =C2=A0 '''archive sources codes tree to tarball when tarb=
all of $P doesn't exist in $DL_DIR'''
> + =C2=A0 =C2=A0 =C2=A0 import tarfile
> + =C2=A0 =C2=A0 =C2=A0 import shutil
> +
> + =C2=A0 =C2=A0 =C2=A0 s =3D d.getVar('S',True)
> + =C2=A0 =C2=A0 =C2=A0 workdir=3Dd.getVar('WORKDIR', True)
> + =C2=A0 =C2=A0 =C2=A0 PF =3D d.getVar('PF',True)
> + =C2=A0 =C2=A0 =C2=A0 tarname =3D PF + '-' + middle_name + ".tar.gz"
> +
> + =C2=A0 =C2=A0 =C2=A0 if os.path.exists(s) and s is not workdir:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sourcedir =3D os.path.=
basename(s)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tarbase =3D os.path.di=
rname(s)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not sourcedir or os=
.path.dirname(tarbase) =3D=3D workdir:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sourcedir =3D os.path.basename(os.path.dirname(s))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tarbase =3D os.path.dirname(os.path.dirname(s))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(tarbase)
> + =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sourcedir =3D os.path.=
basename(s)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(=
sourcedir):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 os.mkdir(sourcedir)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for file in os.listdir(s):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if file is not 'temp' and file is not so=
urcedir:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy(=
file,sourcedir)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (IOError,OSErro=
r):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pass
> +
> + =C2=A0 =C2=A0 =C2=A0 if (len(os.listdir(sourcedir))) !=3D 0:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tar =3D tarfile.open( =
tarname, "w:gz")
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tar.add(sourcedir)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tar.close()
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cmp(workdir,os.path=
.dirname(s)) and not os.path.exists(workdir + '/' + tarname):

Use os.path.join, not + '/'.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 shutil.move(os.path.dirname(s) + '/' + tarname,workdir)

Same as above.

> + =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
> + =C2=A0 =C2=A0 =C2=A0 return tarname
> +
> +def archive_sources(d,middle_name):
> + =C2=A0 =C2=A0 =C2=A0 '''copy tarball from $DL_DIR to $WORKDIR if have t=
arball, archive source codes tree in $WORKDIR if $P is directory instead of=
 tarball'''
> + =C2=A0 =C2=A0 =C2=A0 import shutil
> + =C2=A0 =C2=A0 =C2=A0 work_dir =3D d.getVar('WORKDIR',True)
> + =C2=A0 =C2=A0 =C2=A0 file =3D get_source_from_downloads(d,middle_name)
> + =C2=A0 =C2=A0 =C2=A0 if file:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy(file,work_=
dir)
> + =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file =3D archive_sourc=
es_from_directory(d,middle_name)
> + =C2=A0 =C2=A0 =C2=A0 return file
> +
> +
> +def archive_patches(d,patchdir,series):
> + =C2=A0 =C2=A0 =C2=A0 '''archive patches to tarball and also include ser=
ies files if 'series' is True'''
> + =C2=A0 =C2=A0 =C2=A0 import tarfile
> + =C2=A0 =C2=A0 =C2=A0 import shutil
> +
> + =C2=A0 =C2=A0 =C2=A0 s =3D d.getVar('S',True)
> + =C2=A0 =C2=A0 =C2=A0 work_dir =3D d.getVar('WORKDIR', True)
> + =C2=A0 =C2=A0 =C2=A0 os.chdir(work_dir)
> + =C2=A0 =C2=A0 =C2=A0 patch_dir =3D os.path.basename(patchdir)
> + =C2=A0 =C2=A0 =C2=A0 tarname =3D patch_dir + ".tar.gz"
> + =C2=A0 =C2=A0 =C2=A0 if series =C2=A0=3D=3D 'all' and os.path.exists(s =
+ '/patches/series'):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 shutil.copy(s + '/patches/series',patch_dir)
> + =C2=A0 =C2=A0 =C2=A0 tar =3D tarfile.open(tarname, "w:gz")
> + =C2=A0 =C2=A0 =C2=A0 tar.add(patch_dir)
> + =C2=A0 =C2=A0 =C2=A0 tar.close()
> + =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(patch_dir, ignore_errors=3DTrue)
> + =C2=A0 =C2=A0 =C2=A0 return tarname
> +
> +def select_archive_patches(d,option):
> + =C2=A0 =C2=A0 =C2=A0 '''select to archive all patches including non-app=
lying and series or applying patches '''
> + =C2=A0 =C2=A0 =C2=A0 if option =3D=3D "all":
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patchdir =3D get_all_p=
atches(d)
> + =C2=A0 =C2=A0 =C2=A0 elif option =3D=3D "applying":
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patchdir =3D get_apply=
ing_patches(d)
> + =C2=A0 =C2=A0 =C2=A0 try:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.rmdir(patchdir)
> + =C2=A0 =C2=A0 =C2=A0 except OSError:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tarpatch =3D archive_patches(d,patchdir,option)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return tarpatch
> + =C2=A0 =C2=A0 =C2=A0 return
> +
> +def archive_logs(d,logdir,bbinc=3DFalse):
> + =C2=A0 =C2=A0 =C2=A0 '''archive logs in temp to tarball and .bb and .in=
c files if bbinc is True '''
> + =C2=A0 =C2=A0 =C2=A0 import tarfile
> + =C2=A0 =C2=A0 =C2=A0 import shutil
> +
> + =C2=A0 =C2=A0 =C2=A0 log_dir =3D os.path.basename(logdir)
> + =C2=A0 =C2=A0 =C2=A0 pf =3D d.getVar('PF',True)
> + =C2=A0 =C2=A0 =C2=A0 tarname =3D pf + '-' + log_dir + ".tar.gz"
> + =C2=A0 =C2=A0 =C2=A0 tar =3D tarfile.open(tarname, "w:gz")
> + =C2=A0 =C2=A0 =C2=A0 tar.add(log_dir)
> + =C2=A0 =C2=A0 =C2=A0 tar.close()
> + =C2=A0 =C2=A0 =C2=A0 if bbinc:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(log_dir,=
 ignore_errors=3DTrue)
> + =C2=A0 =C2=A0 =C2=A0 return tarname
> +
> +def get_licenses(d):
> + =C2=A0 =C2=A0 =C2=A0 '''get licenses for running .bb file'''
> + =C2=A0 =C2=A0 =C2=A0 licenses =3D d.getVar('LICENSE', 1).replace('&', '=
|')
> + =C2=A0 =C2=A0 =C2=A0 licenses =3D licenses.replace('(', '').replace(')'=
, '')
> + =C2=A0 =C2=A0 =C2=A0 clean_licenses =3D ""
> + =C2=A0 =C2=A0 =C2=A0 for x in licenses.split():
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if x.strip() =3D=3D ''=
 or x =3D=3D 'CLOSED':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if x !=3D "|":
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 clean_licenses +=3D x
> + =C2=A0 =C2=A0 =C2=A0 if '|' in clean_licenses:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clean_licenses =3D cle=
an_licenses.replace('|','')
> + =C2=A0 =C2=A0 =C2=A0 return clean_licenses

We have a license parser for a reason, is there a reason behind not
using it here? If it's potential performance benefit, I'd encourage
you to do the right thing, profile, *then* optimize.

> +def move_tarball_deploy(d,tarball_list):
> + =C2=A0 =C2=A0 =C2=A0 '''move tarball in location to ${DEPLOY_DIR}/sourc=
es'''

"in location" is extremely vague here. Please improve the function
documentation.

> + =C2=A0 =C2=A0 =C2=A0 import shutil
> +
> + =C2=A0 =C2=A0 =C2=A0 if tarball_list is []:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
> + =C2=A0 =C2=A0 =C2=A0 target_sys =3D d.getVar('TARGET_SYS', True)
> + =C2=A0 =C2=A0 =C2=A0 pf =3D d.getVar('PF', True)
> + =C2=A0 =C2=A0 =C2=A0 licenses =3D get_licenses(d)
> + =C2=A0 =C2=A0 =C2=A0 tar_sources =3D d.getVar('DEPLOY_DIR', True) + '/s=
ources/' + target_sys + '/' + licenses + '/' + pf
> + =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(tar_sources):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.mkdirhier(tar_sourc=
es)
> + =C2=A0 =C2=A0 =C2=A0 for source in tarball_list:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if source:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if os.path.exists(tar_sources + '/' + source):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(tar_sources + '/' + source)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 shutil.move(source,tar_sources)
> +
> +def verify_var(d):

This function name doesn't correspond to what it does. Please make it
more clear.

> + =C2=A0 =C2=A0 =C2=A0 '''check the type for archiving package('tar' or '=
srpm')'''
> + =C2=A0 =C2=A0 =C2=A0 try:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar('SOURCE_AR=
CHIVE_PACKAGE_TYPE', True).upper() not in d.getVar('ARCHIVE_TYPE', True).sp=
lit():
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 raise AttributeError
> + =C2=A0 =C2=A0 =C2=A0 except AttributeError:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" is \'tar\' or \'srpm\', no=
 other types")
> +
> +def store_package(d,package_name):
> + =C2=A0 =C2=A0 =C2=A0 '''store tarbablls name to file "tar-package"'''

Typo in docstring.

> + =C2=A0 =C2=A0 =C2=A0 try:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D open(d.getVar('W=
ORKDIR',True )+ '/tar-package','a')

More use of string concatenation rather than os.path.join.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(package_name +=
 ' ')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.close()
> + =C2=A0 =C2=A0 =C2=A0 except IOError:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass
> +
> +def get_package(d):
> + =C2=A0 =C2=A0 =C2=A0 '''get tarballs name from "tar-package"'''
> + =C2=A0 =C2=A0 =C2=A0 try:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(d.getVar('WOR=
KDIR', True))

Another chdir without returning to the previous path. Functions
shouldn't have process-wide side effects like this, in my opinion.
Either work with the absolute paths (preferred) or return to the old
path.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D open('tar-packag=
e','r')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D list(set(f.re=
adline().replace('\n','').split()))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.close()
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return line
> + =C2=A0 =C2=A0 =C2=A0 except IOError:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass
> +
> +
> +def archive_sources_patches(d,middle_name):
> + =C2=A0 =C2=A0 =C2=A0 '''archive sources and patches to tarball. middle_=
name will append strings ${middle_name} to ${PR} as middle name. for exampl=
e, zlib-1.4.6-prepatch(middle_name).tar.gz '''
> + =C2=A0 =C2=A0 =C2=A0 import shutil
> + =C2=A0 =C2=A0 =C2=A0 verify_var(d)
> + =C2=A0 =C2=A0 =C2=A0 if not_tarball(d):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
> +
> + =C2=A0 =C2=A0 =C2=A0 source_tar_name =3D archive_sources(d,middle_name)
> + =C2=A0 =C2=A0 =C2=A0 if middle_name =3D=3D "prepatch":
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar('PATCHES_A=
RCHIVE_WITH_SERIES',True).upper() =3D=3D 'TRUE':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 patch_tar_name =3D select_archive_patches(d,"all")
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif d.getVar('PATCHES=
_ARCHIVE_WITH_SERIES',True).upper() =3D=3D 'FALSE':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 patch_tar_name =3D select_archive_patches(d,"applying")
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 bb.fatal("Please define 'PATCHES_ARCHIVE_WITH_SERIES' is strings 'Tr=
ue' or 'False' ")
> + =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_tar_name =3D ''
> +
> + =C2=A0 =C2=A0 =C2=A0 if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).u=
pper() not in 'SRPM':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 move_tarball_deploy(d,=
[source_tar_name,patch_tar_name])
> + =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tarpackage =3D d.getVa=
r('WORKDIR', True) + '/tar-package'
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(tarp=
ackage):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 os.remove(tarpackage)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for package in source_=
tar_name, patch_tar_name:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if package:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 store_package(d,str(package) + ' ')
> +
> +def archive_scripts_logs(d):
> + =C2=A0 =C2=A0 =C2=A0 '''archive scripts and logs. scripts include .bb a=
nd .inc files and logs include stuff in "temp".'''
> +
> + =C2=A0 =C2=A0 =C2=A0 work_dir =3D d.getVar('WORKDIR', True)
> + =C2=A0 =C2=A0 =C2=A0 os.chdir(work_dir)
> + =C2=A0 =C2=A0 =C2=A0 source_archive_log_with_scripts =3D d.getVar('SOUR=
CE_ARCHIVE_LOG_WITH_SCRIPTS', True)
> + =C2=A0 =C2=A0 =C2=A0 if source_archive_log_with_scripts =3D=3D 'logs_wi=
th_scripts':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logdir =3D get_bb_inc(=
d)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tarlog =3D archive_log=
s(d,logdir,True)
> + =C2=A0 =C2=A0 =C2=A0 elif source_archive_log_with_scripts =3D=3D 'logs'=
:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists('tem=
p'):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tarlog =3D archive_logs(d,'temp',False)
> + =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
> +
> + =C2=A0 =C2=A0 =C2=A0 if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).u=
pper() not in 'SRPM':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 move_tarball_deploy(d,=
[tarlog])
> +
> + =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 store_package(d,tarlog=
)
> +
> +def dumpdata(d):
> + =C2=A0 =C2=A0 =C2=A0 '''dump environment to "${P}-${PR}.showdata.dump" =
including all kinds of variables and functions when running a task'''
> + =C2=A0 =C2=A0 =C2=A0 workdir =3D bb.data.getVar('WORKDIR', d, 1)
> + =C2=A0 =C2=A0 =C2=A0 distro =3D bb.data.getVar('DISTRO', d, 1)
> + =C2=A0 =C2=A0 =C2=A0 s =3D d.getVar('S', True)
> + =C2=A0 =C2=A0 =C2=A0 pf =3D d.getVar('PF', True)
> + =C2=A0 =C2=A0 =C2=A0 target_sys =3D d.getVar('TARGET_SYS', True)
> + =C2=A0 =C2=A0 =C2=A0 licenses =3D get_licenses(d)
> + =C2=A0 =C2=A0 =C2=A0 dumpdir =3D d.getVar('DEPLOY_DIR', True) + '/sourc=
es/' + target_sys + '/' + licenses + '/' + pf
> + =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(dumpdir):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.mkdirhier(dumpdir)
> +
> + =C2=A0 =C2=A0 =C2=A0 dumpfile =3D os.path.join(dumpdir, bb.data.expand(=
"${P}-${PR}.showdata.dump",d))
> +
> + =C2=A0 =C2=A0 =C2=A0 bb.note("Dumping metadata into '%s'" % dumpfile)
> + =C2=A0 =C2=A0 =C2=A0 f =3D open(dumpfile, "w")
> + =C2=A0 =C2=A0 =C2=A0 # emit variables and shell functions
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.emit_env(f, d, True)
> + =C2=A0 =C2=A0 =C2=A0 # emit the metadata which isnt valid shell
> + =C2=A0 =C2=A0 =C2=A0 for e in d.keys():
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.getVarFlag(=
e, 'python', d):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 f.write("\npython %s () {\n%s}\n" % (e, bb.data.getVar(e, d, 1)))
> + =C2=A0 =C2=A0 =C2=A0 f.close()
> +
> +def create_diff_gz(d):
> + =C2=A0 =C2=A0 =C2=A0 '''creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${P=
R}.diff.g gz for mapping all content in 's' including patches to =C2=A0xxx.=
diff.gz'''
> + =C2=A0 =C2=A0 =C2=A0 import shutil
> +
> + =C2=A0 =C2=A0 =C2=A0 work_dir =3D d.getVar('WORKDIR', True)
> + =C2=A0 =C2=A0 =C2=A0 exclude_from =3D d.getVar('EXCLUDE_FROM', True).sp=
lit()
> + =C2=A0 =C2=A0 =C2=A0 pf =3D d.getVar('PF', True)
> + =C2=A0 =C2=A0 =C2=A0 licenses =3D get_licenses(d)
> + =C2=A0 =C2=A0 =C2=A0 target_sys =3D d.getVar('TARGET_SYS', True)
> + =C2=A0 =C2=A0 =C2=A0 diff_dir =3D d.getVar('DEPLOY_DIR', True) + '/sour=
ces/' + target_sys + '/' + licenses + '/' + pf
> + =C2=A0 =C2=A0 =C2=A0 diff_file =3D os.path.join(diff_dir, bb.data.expan=
d("${P}-${PR}.diff.gz",d))
> + =C2=A0 =C2=A0 =C2=A0 os.chdir(work_dir)
> + =C2=A0 =C2=A0 =C2=A0 f =3D open('temp/exclude-from-file', 'a')
> + =C2=A0 =C2=A0 =C2=A0 for i in exclude_from:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(i)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write("\n")
> + =C2=A0 =C2=A0 =C2=A0 f.close()
> +
> + =C2=A0 =C2=A0 =C2=A0 s=3Dd.getVar('S', True)
> + =C2=A0 =C2=A0 =C2=A0 distro =3D d.getVar('DISTRO',True)
> + =C2=A0 =C2=A0 =C2=A0 dest =3D s + '/' + distro + '/files'
> + =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(dest):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.mkdirhier(dest)
> + =C2=A0 =C2=A0 =C2=A0 for i in os.listdir(os.getcwd()):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(i):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 shutil.copy(i, dest)
> +
> + =C2=A0 =C2=A0 =C2=A0 bb.note("Creating .diff.gz in ${DEPLOY_DIR_SRC}/${=
P}-${PR}.diff.gz")
> + =C2=A0 =C2=A0 =C2=A0 cmd =3D "LC_ALL=3DC TZ=3DUTC0 diff --exclude-from=
=3D" + work_dir + "/temp/exclude-from-file -Naur " + s + '.org' + ' ' + =C2=
=A0s + " | gzip -c > " + diff_file
> + =C2=A0 =C2=A0 =C2=A0 d.setVar('DIFF', cmd + "\n")
> + =C2=A0 =C2=A0 =C2=A0 d.setVarFlag('DIFF', 'func', '1')
> + =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func('DIFF', d)
> + =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(s + '.org', ignore_errors=3DTrue)
> +
> +# This function will run when user want to get tarball for sources and p=
atches after do_unpack
> +python do_archive_original_sources_patches(){
> + =C2=A0 =C2=A0 =C2=A0 archive_sources_patches(d,'prepatch')
> +}
> +
> +# This function will run when user want to get tarball for patched sourc=
es after do_patch
> +python do_archive_patched_sources(){
> + =C2=A0 =C2=A0 =C2=A0 archive_sources_patches(d,'patched')
> +}
> +
> +# This function will run when user want to get tarball for configured so=
urces after do_configure
> +python do_archive_configured_sources(){
> + =C2=A0 =C2=A0 =C2=A0 archive_sources_patches(d,'configured')
> +}
> +
> +# This function will run when user want to get tarball for logs or both =
logs and scripts(.bb and .inc files)
> +python do_archive_scripts_logs(){
> + =C2=A0 =C2=A0 =C2=A0 archive_scripts_logs(d)
> +}
> +
> +# This function will run when user want to know what variable and functi=
ons in a running task are and also can get a diff file including
> +# all content a package should include.
> +python do_dumpdata_create_diff_gz(){
> + =C2=A0 =C2=A0 =C2=A0 dumpdata(d)
> + =C2=A0 =C2=A0 =C2=A0 create_diff_gz(d)
> +}
> +
> +# This functions prepare for archiving "linux-yocto" because this packag=
e create directory 's' before do_patch instead of after do_unpack.
> +# This is special control for archiving linux-yocto only.
> +python do_archive_linux_yocto(){
> + =C2=A0 =C2=A0 =C2=A0 s =3D d.getVar('S', True)
> + =C2=A0 =C2=A0 =C2=A0 if 'linux-yocto' in s:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 source_tar_name =3D ar=
chive_sources(d,'')
> + =C2=A0 =C2=A0 =C2=A0 if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).u=
pper() not in 'SRPM':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 move_tarball_deploy(d,=
[source_tar_name,''])
> +}
> +do_kernel_checkout[postfuncs] +=3D "do_archive_linux_yocto "
> +
> +# remove tarball for sources, patches and logs after creating srpm.
> +python do_remove_tarball(){
> + =C2=A0 =C2=A0 =C2=A0 if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).u=
pper() =3D=3D 'SRPM':
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 work_dir =3D d.getVar(=
'WORKDIR', True)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(work_dir)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for file in os.listdir(os.getcwd()):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if file in get_package(d):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(fi=
le)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 os.remove('tar-package')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except (TypeError,OSEr=
ror):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass
> +}
> +do_remove_taball[deptask] =3D "do_archive_scripts_logs"
> +do_package_write_rpm[postfuncs] +=3D "do_remove_tarball "
> +export get_licenses
> +export get_package

export? This isn't making any sense to me. Why are you exporting these
functions to shell tasks?
--=20
Christopher Larson


