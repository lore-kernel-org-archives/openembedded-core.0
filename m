Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 446D775E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 09:16:49 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u219GnpV001975; Tue, 1 Mar 2016 03:16:49 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016030103165005-868983 ;
	Tue, 1 Mar 2016 03:16:50 -0600 
Date: Tue, 1 Mar 2016 11:16:21 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160301111621.39d15dcc@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <1456777067.11498.180.camel@linuxfoundation.org>
References: <1456757580-31669-1-git-send-email-adrian.ratiu@ni.com>
	<1456777067.11498.180.camel@linuxfoundation.org>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/01/2016 03:16:50 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/01/2016 03:16:50 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-01_06:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] site: enable pthread support for x86_64 APR builds
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
X-List-Received-Date: Tue, 01 Mar 2016 09:16:51 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Feb 2016 20:17:47 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2016-02-29 at 16:53 +0200, Ioan-Adrian Ratiu wrote:
> > The apache2 package is missing key pieces of pthread support (notably
> > pthread=5Fkill) on x86=5F64 platforms. Fix this by setting cached
> > variable
> > apr=5Fcv=5Fpthreads=5Fcflags=3D-pthread which will trickle down into ap=
ache2
> > as
> > well. powerpc32-linux currently sets this option.
> >=20
> > Suggested-by: Jacob Champion <jacob.champion@ni.com>
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  meta/site/x86=5F64-linux | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/site/x86=5F64-linux b/meta/site/x86=5F64-linux
> > index 573a907..5b37211 100644
> > --- a/meta/site/x86=5F64-linux
> > +++ b/meta/site/x86=5F64-linux
> > @@ -104,6 +104,7 @@
> > nfsd=5Fcv=5Ffunc=5Fstatfs=3D${nfsd=5Fcv=5Ffunc=5Fstatfs=3Dstatfs2=5Fbsi=
ze}
> >  nfsd=5Fcv=5Fbsd=5Fsignals=3D${nfsd=5Fcv=5Fbsd=5Fsignals=3Dyes}
> > =20
> >  #apr
> > +apr=5Fcv=5Fpthreads=5Fcflags=3D${apr=5Fcv=5Fpthreads=5Fcflags=3D-pthre=
ad}
> >  apr=5Fcv=5Ftcp=5Fnodelay=5Fwith=5Fcork=3D${apr=5Fcv=5Ftcp=5Fnodelay=5F=
with=5Fcork=3Dyes} =20
>=20
> Autobuilder doesn't look happy after this change:
>=20
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/buil
> ds/662/steps/BuildImages=5F1/logs/stdio
>=20
> This was the only change to apr in there so its looking like the most
> likely suspect...

Yes, it definitely is, a line was removed in v2 after review which seems to=
 trigger it.
I'll try to find a better solution.

>=20
> Cheers,
>=20
> Richard


