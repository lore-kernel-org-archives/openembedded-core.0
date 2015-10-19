Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.phytec.eu [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5E577070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 09:21:10 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id D1B6CA0017E;
	Mon, 19 Oct 2015 11:21:26 +0200 (CEST)
Received: from lws-christ ([172.16.11.80])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015101911211035-42304 ;
	Mon, 19 Oct 2015 11:21:10 +0200 
Date: Mon, 19 Oct 2015 11:21:10 +0200
From: Stefan Christ <s.christ@phytec.de>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20151019092110.GE3869@lws-christ>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
	<1445242541-41638-2-git-send-email-s.christ@phytec.de>
	<CAP71Wjz2YEuj8qLEw63027bGcYKNAPOazv-8Rd+J5RQ2C50UKA@mail.gmail.com>
	<20151019090300.GC3869@lws-christ>
	<CAP71Wjzhq_UVTb0cZHWLs=FPp0YRseXb-Q0RyAQXjDAuKFFLuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjzhq_UVTb0cZHWLs=FPp0YRseXb-Q0RyAQXjDAuKFFLuQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 19.10.2015 11:21:10,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 19.10.2015 11:21:10
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] linux-dtb.inc: fix detection of ending '.dts'
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
X-List-Received-Date: Mon, 19 Oct 2015 09:21:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 19, 2015 at 11:05:58AM +0200, Nicolas Dechesne wrote:
> On Mon, Oct 19, 2015 at 11:03 AM, Stefan Christ <s.christ@phytec.de> wrot=
e:
> > Hmm, the meaning of the code seems to be non obvious. I just looked at =
sed
> > replacement and concluded that it's about the file name ending.
> >
> > Using the full path to the dtb file is not supported by the code anyway=
, e.g.
> >
> >    DTB=5FPATH=3D"${B}/arch/${ARCH}/boot/dts/${DTB}"
> >
> > would be wrong.
> >
> > So the correct solution would check both cases
> >
> >    - full path or only filename and
> >    - ending is dts or dtb
> >
> > Correct?
>=20
>=20
> If you look at the commit that introduced this code, e.g. 72980d5b,
> you can see that this code was added to support the 'legacy' case
> which was the absolute path of the .dts file, or the new case which is
> the .dtb file name. e.g.:
>=20
> =3D=3D
>     ,----[ Original definition ]
>     | KERNEL=5FDEVICETREE =3D "${S}/arch/arm/boot/dts/imx6q-sabresd.dts"
>     `----
>=20
>     Becomes:
>=20
>     ,----[ New definition ]
>     | KERNEL=5FDEVICETREE =3D "imx6q-sabresd.dtb"
>     `----
> =3D=3D
>=20
> so the '/dts/' was used to detect the legacy case, and print a warning
> in that condition.
>=20

Yeah. Your right. The code is correct. The line

    DTB=3D`basename ${DTB} | sed 's,\.dts$,.dtb,g'`

will strip off the directories and replaces the ending. I overlooked that
somehow.  So drop my 'fixes', please.

What about my rework patches? I will resend them if they are ok.

Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards,
	Stefan Christ

