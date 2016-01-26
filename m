Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id EDAE773216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 12:46:09 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0QCk9JI009707; Tue, 26 Jan 2016 06:46:09 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012606460984-294363 ;
	Tue, 26 Jan 2016 06:46:09 -0600 
Date: Tue, 26 Jan 2016 14:45:57 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160126144557.250200d4@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <CAJTo0LZqhHhX2dPGW5DGeKxavFTgn=9=51U=mrjExx0VOYis0w@mail.gmail.com>
References: <1453807516-2205-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LZqhHhX2dPGW5DGeKxavFTgn=9=51U=mrjExx0VOYis0w@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/26/2016 06:46:10 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/26/2016 06:46:10 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-26_05:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc: libgcc-common.inc: symlink gthr-posix -> gthr-default.h
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
X-List-Received-Date: Tue, 26 Jan 2016 12:46:11 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Jan 2016 12:20:43 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 26 January 2016 at 11:25, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrot=
e:
>=20
> > libgfortran needs gthr-default.h to exist (included by libgcc/gthr.h),
> > but for some reason it is not symlinked in configure as defined by
> > AC=5FCONFIG=5FLINKS. This patch creates it at the end of do=5Fconfigure=
; thus
> > allowing libgfortran to build without erros.
> >
>=20
> Are you sure?  libgfortran builds here and gthr-default.h is in the build
> tree:
>=20
> In
> .../work/corei7-64-poky-linux/libgcc/5.3.0-r0/gcc-5.3.0/build.x86=5F64-po=
ky-linux.x86=5F64-poky-linux/libgcc
> $ ls -l gthr-default.h
> lrwxrwxrwx 1 ross ross 76 Jan 25 16:20 gthr-default.h ->
> /data/poky-master/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/libgcc/gthr-posi=
x.h
>=20
> I'll note that libgfortran actually then errors out in package QA:
>=20
> ERROR: QA Issue: libgfortran: Files/directories were installed but not
> shipped in any package:
>   /usr/lib/gcc/x86=5F64-poky-linux/5.3.0/finclude
>   /usr/lib/gcc/x86=5F64-poky-linux/5.3.0/finclude/ieee=5Ffeatures.mod
>   /usr/lib/gcc/x86=5F64-poky-linux/5.3.0/finclude/ieee=5Farithmetic.mod
>   /usr/lib/gcc/x86=5F64-poky-linux/5.3.0/finclude/ieee=5Fexceptions.mod
>=20
> If you actually use fortran would you be able to submit the right fix?  I=
'd
> guess at adding those to FILES=5FPN would be right, but that's a guess.

I'm using fortran to build a recipe for python-scipy on the fido branch. Th=
e header symlink is definitely not created in fido.
Also I'm not getting any QA errors; I don't see why the symlink gets create=
d on master while not in fido.

I'll try to test more extensively on the master branch and then cherry-pick=
 if there are any fixes there to fido.

Thanks,
Adrian

>=20
> Ross


