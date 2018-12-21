Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD5B36C4D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 06:54:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBL6saAt005311
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Dec 2018 22:54:36 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.138]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0415.000;
	Thu, 20 Dec 2018 22:54:36 -0800
From: "Yang, Liezhi" <Liezhi.Yang@windriver.com>
To: "Hatle, Mark" <mark.hatle@windriver.com>
Thread-Topic: [OE-core] [PATCH 1/4] glibc: Remove site_config and glibc-initial
Thread-Index: AQHUmGRSgrVBDMl6EUeghnwaKYxbXqWIcW4AgAAeTgCAAG2fgP//xe0s
Date: Fri, 21 Dec 2018 06:54:35 +0000
Message-ID: <87A7668A-2E55-4ED4-8805-195FDA88336B@windriver.com>
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
	<CAJTo0LZ=Q8EuXqh0s79poWhw0gcrVRouJLyaF0OxgadWqFejMA@mail.gmail.com>
	<d796d8b521000f3fce1b514cedebe1476c57df1c.camel@linuxfoundation.org>
	<CAJTo0LYTwZ-srE+zO-Y2vnW_FhhoH-kPMDSLP78zkd=qbSHGNw@mail.gmail.com>
	<d9129255-2d1d-3b13-de3f-6dd0f299448b@windriver.com>
	<CAJTo0La6d5HX0dZUUs38t2WZcvr3WFFxnzQPOHa9Avy_2mw0nQ@mail.gmail.com>,
	<b4f41ae2-eafa-de74-06c6-6b870f2c2707@windriver.com>
In-Reply-To: <b4f41ae2-eafa-de74-06c6-6b870f2c2707@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] glibc: Remove site_config and	glibc-initial
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
X-List-Received-Date: Fri, 21 Dec 2018 06:54:41 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

Sorry, I am OOO today, will do it next week.
BTW, I have looked into siteconfig and siteinfo recently, and have some cra=
zy ideas on them, which seems can save a lot of configure time, I will try =
to send them out next week.

// Robert

Sent from mobile phone

> =1B$B:_=1B(B 2018=1B$BG/=1B(B12=1B$B7n=1B(B21=1B$BF|!$=1B(B10:22=1B$B!$=
=1B(BMark Hatle <mark.hatle@windriver.com> =1B$B<LF;!'=1B(B
>=20
>> On 12/20/18 1:50 PM, Burton, Ross wrote:
>>> On Thu, 20 Dec 2018 at 18:02, Mark Hatle <mark.hatle@windriver.com> wro=
te:
>>> As far as zlib/ncurses being the only things that augmented them, when =
this was
>>> originally implemented many years ago -- those items were the most comm=
only used
>>> by other configure scripts.  So adding those defaults when zlib and/or =
ncurses
>>> was provided by the system offered a measurable difference in the perfo=
rmance of
>>> configure.
>>=20
>> Do you know what the zlib and ncurses siteconfig files were doing?
>> Just short-circuiting the AC_CHECK_HEADER call, which is basically
>> stat(includedir + header.h).  I'd call that the definition of
>> premature optimisation. :)
>=20
> In the original AC_CHECK_HEADER stuff, it was more then just a simple sta=
t.  The
> system would compile a small executable that included the header and then
> attempted to execute a pass/fail -- or in the cross compile case would do
> something with the output binary.
>=20
> This very well may have changed from a compilation step to a simple stat =
in
> configure in the the last 4 or 5 years.  It's that compilation/execution =
step
> (both that and the various sizeof) that were hideously slow in the origin=
al
> implementation and being avoided by the special contents.
>=20
> The assumption we were making of course was that zlib, ncurses (or anythi=
ng
> else) actually worked with those headers.. so we skipped the compilation =
and
> just did a stat based on the headers to fill things out.
>=20
> The systems that did the sizeof and header identification in the site-con=
fig
> bbclass were written to do things in a dynamic way so that if the system
> behavior changed we wouldn't have incorrect defaults "until someone notic=
ed".
>=20
> The behavior of using the compiler to identify a sizeof and using tools t=
o
> return the result is actually very efficient -- but does require a functi=
oning
> compiler (and headers).  If I remember correctly, we're not fully compili=
ng, but
> putting out an intermediate object which we can then query for the values=
 of the
> various pieces.  (In one iteration at least, we processed all of the size=
of in a
> single pass making it even more efficient.)
>=20
> --Mark
>=20
>> Ross
>>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

