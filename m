Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0211575D4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 15:40:51 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Zr6Ml-0001BZ-5u from Noor_Ahsan@mentor.com ;
	Tue, 27 Oct 2015 08:40:51 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.245]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.03.0224.002; Tue, 27 Oct 2015 15:40:50 +0000
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "ed.bartosh@linux.intel.com" <ed.bartosh@linux.intel.com>
Thread-Topic: U-boot file is being removed when image-recipe is rebuild
	which uses wic.bz2
Thread-Index: AQHREL0SeK+5Z1memUCtZHGQFzlVr55/ZTtQgAARRoCAAAMMUA==
Date: Tue, 27 Oct 2015 15:40:49 +0000
Message-ID: <365E1805BC95084CBE82381A0B8699940121B4E51B@EU-MBX-03.mgc.mentorg.com>
References: <20151027134031.GA12305@linux.intel.com>
	<365E1805BC95084CBE82381A0B8699940121B4E446@EU-MBX-03.mgc.mentorg.com>
	<20151027152729.GA14663@linux.intel.com>
In-Reply-To: <20151027152729.GA14663@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: U-boot file is being removed when image-recipe is rebuild which uses wic.bz2
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
X-List-Received-Date: Tue, 27 Oct 2015 15:40:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is my wks file=20

part u-boot --source rawcopy --sourceparams=3D"file=3Du-boot-mx6-solox.imx"=
 --ondisk mmcblk --no-table --align 1
part /boot --source bootimg-partition --ondisk mmcblk --fstype=3Dvfat --lab=
el boot --active --align 4096 --size 8M --extra-space 0
part / --source rootfs --ondisk mmcblk --fstype=3Dext4 --label root --align=
 4096

u-boot-mx6-solox.imx gets removed after wic is called.

It is in fsimage.py. see os.rename(source, image_file + '.p%d' % part['num'=
]).


def assemble(self, image_file):
        msger.debug("Installing partitions")

        for part in self.partitions:
            source =3D part['source_file']
            if source:
                # install source_file contents into a partition
                cmd =3D "dd if=3D%s of=3D%s bs=3D%d seek=3D%d count=3D%d co=
nv=3Dnotrunc" % \
                      (source, image_file, self.sector_size,
                       part['start'], part['size'])
                exec_cmd(cmd)

                msger.debug("Installed %s in partition %d, sectors %d-%d, "
                            "size %d sectors" % \
                            (source, part['num'], part['start'],
                             part['start'] + part['size'] - 1, part['size']=
))

                os.rename(source, image_file + '.p%d' % part['num'])

-----Original Message-----
From: Ed Bartosh [mailto:ed.bartosh@linux.intel.com]=20
Sent: Tuesday, October 27, 2015 8:27 PM
To: Ahsan, Noor
Cc: openembedded-core@lists.openembedded.org
Subject: Re: U-boot file is being removed when image-recipe is rebuild whic=
h uses wic.bz2

On Tue, Oct 27, 2015 at 02:28:02PM +0000, Ahsan, Noor wrote:
> Hello,
>=20
> I have identified the issue and sent and RFC on mailing list. One feedbac=
k I received was replace dd_cmd =3D "cp src dst" with dd_cmd =3D "cp %s %s"=
 % (src, dst) which was and off sight from me. I need more detailed review =
of it.

Can you point me out where the renaming you've mentioned is happening?

Anyway it would be good if I could reproduce the issue to better understand=
 it. Can you provide more details about your configuration?

Regards,
Ed


>=20
> Noor
>=20
> -----Original Message-----
> From: Ed Bartosh [mailto:ed.bartosh@linux.intel.com]
> Sent: Tuesday, October 27, 2015 6:41 PM
> To: Ahsan, Noor
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: U-boot file is being removed when image-recipe is rebuild=20
> which uses wic.bz2
>=20
> Hi Noor,
>=20
> Sorry for delay. I missed your e-mail somehow.
>=20
> Can you please show your recipe, wks file and the details of your build c=
onfiguration(MACHINE, bblayers, etc) ?
>=20
> ---
> Regards,
> Ed

> Date: Thu, 22 Oct 2015 10:14:02 +0000
> From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
> To: "openembedded-core@lists.openembedded.org"
>  <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [RFC] rawcopy.py: Copy source file in image=20
> creation  build folder
>=20
>=20
>=20
> -----Original Message-----
> From: Ahsan, Noor
> Sent: Wednesday, October 21, 2015 9:04 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Ahsan, Noor
> Subject: [RFC] rawcopy.py: Copy source file in image creation build=20
> folder
>=20
> From: Noor <noor_ahsan@mentor.com>
>=20
> * When a file is given using --sourceparams then wic directly use that fi=
le
>   instead of copying them to build folder. At time of assmebling it os.re=
name
>   is called which rename all the files to name. In that process the origi=
nal
>   file get renamed. When image recipe is rebuilt then wic complains about
>   missing file which renamed in previous build.
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  scripts/lib/wic/plugins/source/rawcopy.py |    4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/scripts/lib/wic/plugins/source/rawcopy.py=20
> b/scripts/lib/wic/plugins/source/rawcopy.py
> index f0691ba..f17da27 100644
> --- a/scripts/lib/wic/plugins/source/rawcopy.py
> +++ b/scripts/lib/wic/plugins/source/rawcopy.py
> @@ -74,6 +74,10 @@ class RawCopyPlugin(SourcePlugin):
>              dd_cmd =3D "dd if=3D%s of=3D%s ibs=3D%s skip=3D1 conv=3Dnotr=
unc" % \
>                      (src, dst, source_params['skip'])
>              exec_cmd(dd_cmd)
> +        else:
> +            dst =3D os.path.join(cr_workdir, source_params['file'])
> +            dd_cmd =3D "cp src dst"
> +            exec_cmd(dd_cmd)
>=20
>=20
> dd_cmd will be replaced by cp_cmd but I need review of all impact of this=
 so that I can send proper patch.
>=20
>=20
>          # get the size in the right units for kickstart (kB)
>          du_cmd =3D "du -Lbks %s" % dst
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--
--
Regards,
Ed

