Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB4266E40A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:15:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q9FiE7010242
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Mar 2014 02:15:44 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.80]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Wed, 26 Mar 2014 02:15:44 -0700
From: "Sarbu, Florin-Ionut (Florin)" <Florin.Sarbu@windriver.com>
To: "PALCU, LAURENTIU" <laurentiu.palcu@intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 2/3] buildhistory.bbclass: Fix dependency
	files creation
Thread-Index: AQHPOYcR7RtnC1OYGEec/QUCon6Z2ZrVsgyAgB2CiUI=
Date: Wed, 26 Mar 2014 09:15:43 +0000
Message-ID: <50D17BD22A23EE4A887974F6B5882038B5484ADC@ALA-MBB.corp.ad.wrs.com>
References: <cover.1394023121.git.laurentiu.palcu@intel.com>
	<9b59e3360cdf97a4bcde6bf979aa30dc56a84be4.1394023121.git.laurentiu.palcu@intel.com>
	<1394142938.12327.18.camel@ted>,<20140307063553.GA21125@lpalcu-linux>
In-Reply-To: <20140307063553.GA21125@lpalcu-linux>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.170.184]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] buildhistory.bbclass: Fix dependency files creation
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
X-List-Received-Date: Wed, 26 Mar 2014 09:15:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I get the same error on do_rootfs for a rpm based image:

Exception: UnboundLocalError: local variable 'new_arch' referenced before a=
ssignment

Florin
________________________________________
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Laurentiu Palcu [laurentiu.palc=
u@intel.com]
Sent: Friday, March 07, 2014 8:35 AM
To: Richard Purdie
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] buildhistory.bbclass: Fix dependency fil=
es creation

On Thu, Mar 06, 2014 at 09:55:38PM +0000, Richard Purdie wrote:
> On Wed, 2014-03-05 at 14:39 +0200, Laurentiu Palcu wrote:
> > Call the new python routines.
> >
> > [YOCTO #5904]
> >
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > ---
> >  meta/classes/buildhistory.bbclass |    9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhist=
ory.bbclass
> > index ef4135b..01b0082 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -319,6 +319,12 @@ python buildhistory_list_installed() {
> >
> >      with open(pkgs_list_file, 'w') as pkgs_list:
> >          pkgs_list.write(list_installed_packages(d, 'file'))
> > +
> > +    pkgs_deps_file =3D os.path.join(d.getVar('WORKDIR', True),
> > +                                  "bh_installed_pkgs_deps.txt")
> > +
> > +    with open(pkgs_deps_file, 'w') as pkgs_deps:
> > +        pkgs_deps.write(list_installed_packages(d, 'deps'))
> >  }
> >
> >
> > @@ -338,7 +344,8 @@ buildhistory_get_installed() {
> >
> >     # Produce dependency graph
> >     # First, quote each name to handle characters that cause issues for=
 dot
> > -   rootfs_list_installed_depends | sed 's:\([^| ]*\):"\1":g' > $1/depe=
nds.tmp
> > +   cat ${WORKDIR}/bh_installed_pkgs_deps.txt | sed 's:\([^| ]*\):"\1":=
g' > $1/depends.tmp && \
> > +           rm ${WORKDIR}/bh_installed_pkgs_deps.txt
> >     # Change delimiter from pipe to -> and set style for recommend line=
s
> >     sed -i -e 's:|: -> :' -e 's:"\[REC\]":[style=3Ddotted]:' -e 's:$:;:=
' $1/depends.tmp
> >     # Add header, sorted and de-duped contents and footer and then dele=
te the temp file
>
> With this patch, a bitbake core-image-minimal -c populate_sdk resulted
No, not quite. The bug appears to be in
RpmPM._pkg_translate_smart_to_oe(), which none of my patches touched.

CCing Hongxu.

laurentiu

> in:
>
> ERROR: Error executing a python function in /media/build1/poky/meta/recip=
es-core/images/core-image-minimal.bb:
>
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'buildhistory_list_installed', lineno: 18, function: <module>
>      0014:    with open(pkgs_deps_file, 'w') as pkgs_deps:
>      0015:        pkgs_deps.write(list_installed_packages(d, 'deps'))
>      0016:
>      0017:
>  *** 0018:buildhistory_list_installed(d)
>      0019:
> File: 'buildhistory_list_installed', lineno: 9, function: buildhistory_li=
st_installed
>      0005:    pkgs_list_file =3D os.path.join(d.getVar('WORKDIR', True),
>      0006:                                  "bh_installed_pkgs.txt")
>      0007:
>      0008:    with open(pkgs_list_file, 'w') as pkgs_list:
>  *** 0009:        pkgs_list.write(list_installed_packages(d, 'file'))
>      0010:
>      0011:    pkgs_deps_file =3D os.path.join(d.getVar('WORKDIR', True),
>      0012:                                  "bh_installed_pkgs_deps.txt")
>      0013:
> File: '/media/build1/poky/meta/lib/oe/rootfs.py', lineno: 721, function: =
list_installed_packages
>      0717:    if img_type =3D=3D "rpm":
>      0718:        return RpmPM(d,
>      0719:                     rootfs_dir,
>      0720:                     d.getVar('TARGET_VENDOR', True)
>  *** 0721:                     ).list_installed(format)
>      0722:    elif img_type =3D=3D "ipk":
>      0723:        return OpkgPM(d,
>      0724:                      rootfs_dir,
>      0725:                      d.getVar("IPKGCONF_TARGET", True),
> File: '/media/build1/poky/meta/lib/oe/package_manager.py', lineno: 854, f=
unction: list_installed
>      0850:            pkg =3D line.split()[0]
>      0851:            arch =3D line.split()[1]
>      0852:            ver =3D line.split()[2]
>      0853:            pkgorigin =3D line.split()[3]
>  *** 0854:            new_pkg, new_arch =3D self._pkg_translate_smart_to_=
oe(pkg, arch)
>      0855:
>      0856:            if format =3D=3D "arch":
>      0857:                output.append('%s %s' % (new_pkg, new_arch))
>      0858:            elif format =3D=3D "file":
> File: '/media/build1/poky/meta/lib/oe/package_manager.py', lineno: 476, f=
unction: _pkg_translate_smart_to_oe
>      0472:
>      0473:            if found =3D=3D 1 and fixed_arch =3D=3D fixed_cmp_a=
rch:
>      0474:                break
>      0475:        #bb.note('%s, %s -> %s, %s' % (pkg, arch, new_pkg, new_=
arch))
>  *** 0476:        return new_pkg, new_arch
>      0477:
>      0478:    def _search_pkg_name_in_feeds(self, pkg, feed_archs):
>      0479:        for arch in feed_archs:
>      0480:            arch =3D arch.replace('-', '_')
> Exception: UnboundLocalError: local variable 'new_arch' referenced before=
 assignment
>
> ERROR: Function failed: buildhistory_list_installed
> ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/work/qe=
mux86-poky-linux/core-image-minimal/1.0-r0/temp/log.d
>
>
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core=

