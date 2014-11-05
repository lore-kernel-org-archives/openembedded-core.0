Return-Path: <markus.boos@kistler.com>
Received: from mx1.kistler.com (mx1.kistler.com [195.49.77.148])
	by mail.openembedded.org (Postfix) with ESMTP id 3460365CED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 07:07:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.07,317,1413237600"; d="scan'208";a="12938154"
Received: from unknown (HELO kihagsepp01.int.kistler.com) ([192.168.52.67])
	by mx1.kistler.com with ESMTP/TLS/ADH-AES256-SHA;
	05 Nov 2014 08:07:08 +0100
Received: from mx2.kistler.com (unknown [192.168.52.58])
	by kihagsepp01.int.kistler.com (Postfix) with ESMTPS;
	Wed,  5 Nov 2014 08:07:05 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.07,317,1413237600"; 
   d="scan'208";a="2118942"
Received: from kihagwinex01.int.kistler.com ([192.168.100.23])
	by mx2.kistler.com with ESMTP/TLS/AES128-SHA; 05 Nov 2014 08:07:05 +0100
Received: from kihagwinex02.int.kistler.com ([fe80::10cf:df86:bb65:2502]) by
	kihagwinex01.int.kistler.com ([fe80::d70:7df0:c903:4e43%16]) with mapi
	id 14.03.0181.006; Wed, 5 Nov 2014 08:06:32 +0100
From: Markus Boos <Markus.Boos@kistler.com>
To: 'Tudor Florea' <Tudor.Florea@enea.com>,
	"'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Discussion about architecure of ptest-runner patch
Thread-Index: Ac/vbDp/PFRk3LIhTGWd4Cah5c52dwAezSPgAjbPQRA=
Date: Wed, 5 Nov 2014 07:06:31 +0000
Message-ID: <345DD4F0215D4B4CB8356943BA192C9913DA650F@kihagwinex02.int.kistler.com>
References: <345DD4F0215D4B4CB8356943BA192C9913CF0BD0@kihagwinex02.int.kistler.com>
	<26724FB0BFCB3D4C91BDE184751AA3A428ACB8AF@SESTOEX04.enea.se>
In-Reply-To: <26724FB0BFCB3D4C91BDE184751AA3A428ACB8AF@SESTOEX04.enea.se>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.116]
MIME-Version: 1.0
Subject: Re: Discussion about architecure of ptest-runner patch
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
X-List-Received-Date: Wed, 05 Nov 2014 07:07:23 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Tudor

Thank you for your explanation.

We made a small sed/awk script to format the googletest output to the ptest=
 format.
We published it on the yocto automated-testing list: https://lists.yoctopro=
ject.org/pipermail/automated-testing/2014-November/000091.html

BR
Markus




> -----Urspr=FCngliche Nachricht-----
> Von: Tudor Florea [mailto:Tudor.Florea@enea.com]
> Gesendet: Samstag, 25. Oktober 2014 02:57
> An: Boos Markus; 'openembedded-core@lists.openembedded.org'
> Betreff: RE: Discussion about architecure of ptest-runner patch
>=20
> Hi,
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Markus Boos
> > Sent: Friday, October 24, 2014 12:37
> > To: 'openembedded-core@lists.openembedded.org'
> > Subject: [OE-core] Discussion about architecure of ptest-runner patch
> >
> > Hi
> >
> > We patched the ptest-runner script to deliver a xUnit file as a rough
> > overview/indicator over the package tests.
> > Having such a report allows us to use the file in Jenkins and in our
> > ALM tool to display the results of the ptest run.
> >
> > Before we send the patch upstream I like to start the discussion about
> > the architecture of the patch because I think it's worth to extend the
> > ptest- runner to deliver the results in readable text format (xUnit,
> > JSON, html table, csv,  whateverformat).
> > I think of something similar like the automated deployment mechanism
> > where yocto delivers the base class and you can write your own
> > extension with this class.
>=20
> The concept of ptest is to run the tests using the minimum possible appro=
priate
> resource of a target to be tested.
> As per wiki page (https://wiki.yoctoproject.org/wiki/Ptest):
> "One major point of ptest is to consolidate the output format of all test=
s into a single
> common format. The format selected is the automake "simple test" format
> result: testname"
> As per automake manual
> (http://www.gnu.org/software/automake/manual/automake.html#Simple-Tests).
> "The possible results (whose meanings should be clear from the previous
> Generalities about Testing) are PASS, FAIL, SKIP, XFAIL, XPASS and ERROR"
> While I acknowledge that an automated mechanism to process and display th=
e test
> results would be a nice piece of work for an automated testing framework,=
  I don't
> think that this belongs to ptest (ptest-runner).
> The processing of the test results of an embedded tested device should no=
t be done
> by the embedded device itself (inside ptest-runner in particular) but rat=
her by the
> testing infrastructure (Jenkins? autobuild?) that eventually spawn ptest-=
runner.
>=20
> The next steps to improve ptest is to provide parallelism (that is to run=
 parallel-tests
> for each feature tested and  to run ptest for many feature in parallel). =
The work to be
> done to process the results (e.g. for a readable text format)  should tak=
e into
> consideration this aspect.
>=20
> Regards,
>   Tudor.
>=20
> >
> > What is the best way to add such a feature?
> >
> > Simply extend the ptest-runner script with the preferred output formatt=
er?
> >
> > Or
> >
> > Write a bitbake class with an interface where you can attach your own
> > preferred output formatter?
> >
> > I'm sure there are other solutions possible as well. If you have one
> > in mind, please share it.
> >
> > Thank you.
> >
> > Best regards
> > Markus
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

