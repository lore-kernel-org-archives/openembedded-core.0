Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 76CCA718DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 09:47:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 27 Jan 2015 01:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="445718878"
Received: from krogon-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.16.44])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jan 2015 01:33:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Walter Giroir <walt@giroir.com>
Date: Tue, 27 Jan 2015 09:47:16 +0000
Message-ID: <3490468.1xbMJtenE6@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <8A09E79C-3AC7-4CA7-82D1-A2A907D04890@giroir.com>
References: <loom.20150124T182655-678@post.gmane.org>
	<3742973.ifrIKYg27M@peggleto-mobl5.ger.corp.intel.com>
	<8A09E79C-3AC7-4CA7-82D1-A2A907D04890@giroir.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: create_image() fails with cannot concatenate 'str' and 'NoneType'error
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
X-List-Received-Date: Tue, 27 Jan 2015 09:47:43 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday 26 January 2015 13:23:28 Walter Giroir wrote:
> On Jan 26, 2015, at 12:46 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Saturday 24 January 2015 17:30:08 Walt wrote:
> >> I have search the web and found a few references to this problem b=
ut I
> >> have
> >> not yet found a solution.
> >>=20
> >> This is the latest commit.
> >> --------
> >> commit 745cebd635002618d7edd0a109ff07dd2953621a
> >> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> Date:   Fri Jan 23 14:38:12 2015 +0000
> >>=20
> >>    bitbake: siggen: Ensure taskdata default functions exist in bas=
e class
> >>   =20
> >>    The get/set_taskdata functions are now part of the API of the c=
lass,
> >>    ensure they exist in the base class definition so the noop hand=
ler
> >>    works.
> >>   =20
> >>    [YOCTO #7233]
> >>   =20
> >>    (Bitbake rev: 9b5b1bd7d77e3f5886f6c557d3b750de1f6d6025)
> >>   =20
> >>    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.o=
rg>
> >>=20
> >> And here is the error
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image=
.py',
> >> lineno: 355, function: create_image
> >>=20
> >>     0351:        execute_pre_post_process(self.d, post_process_cmd=
s)
> >>     0352:
> >>     0353:
> >>=20
> >>     0354:def create_image(d):
> >> *** 0355:    Image(d).create()
> >>=20
> >>     0356:
> >>     0357:if __name__ =3D=3D "__main__":
> >>     0358:    """
> >>     0359:    Image creation can be called independent from bitbake=

> >>=20
> >> environment.
> >> File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image=
.py',
> >> lineno: 333, function: create
> >>=20
> >>     0329:        execute_pre_post_process(self.d, pre_process_cmds=
)
> >>     0330:
> >>     0331:        self._remove_old_symlinks()
> >>=20
> >>     0332:
> >> *** 0333:        image_cmd_groups =3D self._get_imagecmds()
> >>=20
> >>     0334:
> >>     0335:        for image_cmds in image_cmd_groups:
> >>     0336:            # create the images in parallel
> >>     0337:            nproc =3D multiprocessing.cpu_count()
> >>=20
> >> File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image=
.py',
> >> lineno: 303, function: _get_imagecmds
> >>=20
> >>     0299:                print "************************"
> >>     0300:                print localdata.getVar("IMAGE_CMD", True)=

> >>     0301:                print "************************"
> >>     0302:                print "************************"
> >>=20
> >> *** 0303:                cmds.append("\t" + localdata.getVar("IMAG=
E_CMD",
> >> True)) 0304:                cmds.append(localdata.expand("\tcd
> >> ${DEPLOY_DIR_IMAGE}"))
> >>=20
> >>     0305:
> >>     0306:                if type in cimages:
> >>=20
> >>     0307:                    for ctype in cimages[type]:
> >> Exception: TypeError: cannot concatenate 'str' and 'NoneType' obje=
cts
> >>=20
> >> ERROR: Function failed: do_rootfs
> >> ERROR: Logfile of failure stored in: /home/walt/workspace/wwrelay-=

> >> rootfs/yocto/build/tmp/work/cubietruck-poky-linux-gnueabi/wigwag-p=
rod-
> >> lsb/1.0-r0/temp/log.do_rootfs.13308
> >> ERROR: Task 6 (/home/walt/workspace/wwrelay-
> >> rootfs/yocto/build/recipes/images/wigwag-prod-lsb.bb, do_rootfs) f=
ailed
> >> with exit code '1'
> >> NOTE: Tasks Summary: Attempted 3977 tasks of which 3976 didn't nee=
d to be
> >> rerun and 1 failed.
> >=20
> > What have you got in your value of IMAGE_FSTYPES? It looks to me li=
ke
> > there is an invalid value in there. If you aren't sure what it's se=
t to,
> > this command>=20
> > should tell you:
> >  bitbake -e | grep ^IMAGE_FSTYPES=3D
>
> I have IMAGE_FSTYPES defined in build/conf/local.conf=E2=80=A6
>=20
> > grep IMAGE_FSTYPES build/conf/local.conf
>=20
> IMAGE_FSTYPES =3D "ext3 tar.gz sunxi-wigwag-sdimg"
>=20
>=20
> When pulling the IMAGE_FSTYPES from the environment with =E2=80=98bit=
bake -e=E2=80=99 I get
> an extended list
> > bitbake -e | grep ^IMAGE_FSTYPES
>=20
> IMAGE_FSTYPES=3D"ext3 tar.gz sunxi-wigwag-sdimg ext3 tar.gz sunxi-sdi=
mg"
>=20
> Not sure why there are duplicates here unless the definitions in the
> machines configuration is also added to this list.
>=20
> It all works with the exception of sunxi-wigwag-relay which is define=
d in
> the our own meta-wigwag layer in our layer,
> meta-wigwag/classes/sdcard_image-sunxi-wigwag.bbclass
>=20
> For some reason, I do not believe this bbclass is even being parsed a=
lthough
> this layer is defined in the bblayers file.
>=20
> I intentionally corrupted the bbclass file, reran bitbake and did not=

> receive any errors.
>=20
> With a few debug statements in image.py, it=E2=80=99s quite clear tha=
t
> sunxi-wigwag-sdimg does not have and IMAGE_CMD

Right. Clearly we should have better error checking here (and I'll look=
 into=20
adding that.) Regarding the class, I can only assume that that class is=
 not=20
being inherited anywhere - it needs to be explicitly inherited, it's no=
t going=20
to be picked up automatically unless the layer does it or you do it in =
your=20
configuration. Does the documentation for the layer in question not spe=
cify how=20
the class is to be used? At least one way would be:

  IMAGE_CLASSES +=3D "sdcard_image-sunxi-wigwag"

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

