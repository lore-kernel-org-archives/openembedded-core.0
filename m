Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.18654.1593600686445785286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 03:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OQFljQsK;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=4867; q=dns/txt; s=axis-central1;
  t=1593600686; x=1625136686;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fZZmz6m4YqlrWGnKaOPABO2SJHv7X6NCsUDTaAZEYoQ=;
  b=OQFljQsKF5OoLN43+vE7UfGcPwcHoPvuTl52C/x8f+nIh5N1V9RspJBr
   0FKgS46vCLjM52l/k8Xv9756fuN5zaWOFJwNIiTQW+93MCYgzYmHt2JgP
   4iruT8091oUO8ADWpE0vnTLpqKRqCFnN0ryFu5cP/2/pwI9gOp/IyK/gN
   M77LsB/Nj+AmGlTZOSxQWx/0wltoyLcJUHWiLz8kaCi6C9ij9dFGVjPub
   v8bd1J518a1wucWTFB60JAq5aq+VospbJJplsCd/SSyyFG8DkvGRR636o
   OtOXaXt17jNc/GcM0IWsC+Fluxev0cs6Jwi8BdqcFsU2m6mBwGxUAqEML
   A==;
IronPort-SDR: ceqXe6bZq0hDoMPACN9njvI3JVHxjz2FrI86rrfiLPt4r7VHGchZX+3crNs+c2GVLCKcRCaEEg
 K3nf3+8D71/WApZjYifD8Qsk+gT0fU74TcZ4Aa1GrrNNUZDUI8zzTvnK9cluB68+TVoc6W9GV4
 CaI0/S2+/67XgMYtvgWSipciY+6G8CZ77iOQksm4/39E9wzPA4thoCr50QvqcFohvebcUeH616
 CiWBul9kROnmMjjuQXpXFktanGwscNpbUIQJFYPiwSEHC8f+Sj6ao3kyassUhH05SWAgIVFjkO
 1Mk=
X-IronPort-AV: E=Sophos;i="5.75,299,1589234400"; 
   d="scan'208";a="10384410"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Paul Barker <pbarker@konsulko.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: openembedded-core <openembedded-core@lists.openembedded.org>,
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>
Subject: Re: [OE-core] [PATCH v3] nopackages.bbclass: Get tasks from variable
Thread-Topic: [OE-core] [PATCH v3] nopackages.bbclass: Get tasks from variable
Thread-Index: AQHWT5Ap/qyL/nKnXEmUjFPVItn4majyYngAgAAosZ0=
Date: Wed, 1 Jul 2020 10:51:24 +0000
Message-ID: <1593600684100.43870@axis.com>
References: <20200701084634.11428-1-fredrigu@axis.com>
 <20200701084634.11428-2-fredrigu@axis.com>
 <CAM9ZRVvdaVSghGzoFwy6vhHLhzHE-HatJpRwC6LxpuepO_pTxw@mail.gmail.com>
 <161D98456D41D2FE.27211@lists.openembedded.org>
 <161D992D91B5C0EE.29179@lists.openembedded.org>
 <9fb318a8e5cada4d7671af73bd5dd08e63b244a3.camel@linuxfoundation.org>,<CAM9ZRVvkcyYMxXEjZqjVBd=X-s7v_2YrY+GeJHgh3XhML0_Wng@mail.gmail.com>
In-Reply-To: <CAM9ZRVvkcyYMxXEjZqjVBd=X-s7v_2YrY+GeJHgh3XhML0_Wng@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Paul, it's only for adding tasks to do deltask on. Not preventing current d=
eltasks to be done.=0A=
=0A=
Richard, I tried your suggestion but couldn't understand/judge the implicat=
ions of changing=0A=
-__deltask_regexp__       =3D re.compile(r"deltask\s+(?P<func>\w+)(?P<ignor=
es>.*)")=0A=
+__deltask_regexp__       =3D re.compile(r"deltask\s+(.+)")=0A=
=0A=
If you're fine with that change. Your solution works fine for my usecase, E=
XCEPT that=0A=
+EXTRA_NOPACKAGE_DELTASKS =3D ""=0A=
needs to be=0A=
+EXTRA_NOPACKAGE_DELTASKS ?=3D ""=0A=
right? Otherwise that variable would always be empty. Or would something li=
ke=0A=
EXTRA_NOPACKAGE_DELTASKS_append(....) be used?=0A=
=0A=
/Fredrik=0A=
________________________________________=0A=
From: Paul Barker <pbarker@konsulko.com>=0A=
Sent: Wednesday, July 1, 2020 12:22 PM=0A=
To: Richard Purdie=0A=
Cc: Fredrik Gustafsson; openembedded-core; tools-cfpbuild-internal; Fredrik=
 Gustafsson=0A=
Subject: Re: [OE-core] [PATCH v3] nopackages.bbclass: Get tasks from variab=
le=0A=
=0A=
On Wed, 1 Jul 2020 at 11:12, Richard Purdie=0A=
<richard.purdie@linuxfoundation.org> wrote:=0A=
>=0A=
> On Wed, 2020-07-01 at 11:11 +0100, Richard Purdie via=0A=
> lists.openembedded.org wrote:=0A=
> > On Wed, 2020-07-01 at 10:54 +0100, Richard Purdie via=0A=
> > lists.openembedded.org wrote:=0A=
> > > On Wed, 2020-07-01 at 10:48 +0100, Paul Barker wrote:=0A=
> > > > On Wed, 1 Jul 2020 at 09:46, Fredrik Gustafsson=0A=
> > > > <fredrik.gustafsson@axis.com> wrote:=0A=
> > > > > Get tasks from a variable instead of having them hardcoded.=0A=
> > > > > This=0A=
> > > > > will=0A=
> > > > > enable other layers to add tasks that should be deleted when=0A=
> > > > > nopackages=0A=
> > > > > is used.=0A=
> > > > >=0A=
> > > > > Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>=0A=
> > > > > ---=0A=
> > > > >  meta/classes/nopackages.bbclass | 19 +++++++------------=0A=
> > > > >  1 file changed, 7 insertions(+), 12 deletions(-)=0A=
> > > > >=0A=
> > > > > diff --git a/meta/classes/nopackages.bbclass=0A=
> > > > > b/meta/classes/nopackages.bbclass=0A=
> > > > > index 559f5078bd..4c9fe510c5 100644=0A=
> > > > > --- a/meta/classes/nopackages.bbclass=0A=
> > > > > +++ b/meta/classes/nopackages.bbclass=0A=
> > > > > @@ -1,12 +1,7 @@=0A=
> > > > > -deltask do_package=0A=
> > > > > -deltask do_package_write_rpm=0A=
> > > > > -deltask do_package_write_ipk=0A=
> > > > > -deltask do_package_write_deb=0A=
> > > > > -deltask do_package_qa=0A=
> > > > > -deltask do_packagedata=0A=
> > > > > -deltask do_package_setscene=0A=
> > > > > -deltask do_package_write_rpm_setscene=0A=
> > > > > -deltask do_package_write_ipk_setscene=0A=
> > > > > -deltask do_package_write_deb_setscene=0A=
> > > > > -deltask do_package_qa_setscene=0A=
> > > > > -deltask do_packagedata_setscene=0A=
> > > > > +NO_PACKAGES_DELTASKS +=3D "do_package do_package_write_rpm=0A=
> > > > > do_package_write_ipk do_package_write_deb do_package_qa=0A=
> > > > > do_packagedata do_package_setscene=0A=
> > > > > do_package_write_rpm_setscene=0A=
> > > > > do_package_write_ipk_setscene do_package_write_deb_setscene=0A=
> > > > > do_package_qa_setscene do_packagedata_setscene"=0A=
> > > >=0A=
> > > > Not sure if `+=3D` was present in the previous versions, I only=0A=
> > > > just=0A=
> > > > noticed it now. I think `?=3D` is a better choice so it can be=0A=
> > > > overridden easily. Other than that, this looks good.=0A=
> > > >=0A=
> > > > > +=0A=
> > > > > +python () {=0A=
> > > > > +    list =3D d.getVar("NO_PACKAGES_DELTASKS").split()=0A=
> > > > > +    for task in list:=0A=
> > > > > +        bb.build.deltask(task, d)=0A=
> > > > > +}=0A=
> > >=0A=
> > > I'm just sad this is having to use anonymous python. Its slow and=0A=
> > > I'd=0A=
> > > like to see less of it, not more, given people's complaints about=0A=
> > > parsing speed.=0A=
> > >=0A=
> > > I did make a suggestion about how this could be done but that isn't=
=0A=
> > > an option. I might sort out such a patch.=0A=
> >=0A=
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t=
222&id=3D46a01aef15b19431bd9f2924537723481e0151e5=0A=
> >=0A=
> > is a patch which lets deltask become a bit more flexible. I've not=0A=
> > tested it much but see it if works/helps.=0A=
>=0A=
> Sorry:=0A=
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t22=
2&id=3Dfd24e59fc886e6642bc3c8fb2941a37a1cc4042a=0A=
>=0A=
> Cheers,=0A=
>=0A=
> Richard (in need of caffeine)=0A=
=0A=
I like this approach.=0A=
=0A=
Fredrik, what's the reason for using a variable here again? Is it just=0A=
to be able to add tasks to the list or do you also need the ability to=0A=
remove tasks from the list?=0A=
=0A=
Thanks,=0A=
=0A=
--=0A=
Paul Barker=0A=
Konsulko Group=0A=
