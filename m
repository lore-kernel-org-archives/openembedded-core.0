Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0413783D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4D6151834E;
	Thu, 15 Jun 2017 16:19:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id qAtqU-phWJdg; Thu, 15 Jun 2017 16:19:15 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0120E18507;
	Thu, 15 Jun 2017 16:19:14 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8BD41A07E;
	Thu, 15 Jun 2017 16:19:14 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC78E1A07D;
	Thu, 15 Jun 2017 16:19:14 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 15 Jun 2017 16:19:14 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id A0A255F2;
	Thu, 15 Jun 2017 16:19:14 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 15 Jun 2017 16:19:14 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Thu, 15 Jun 2017 16:19:14 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 11/11] package.bbclass: Restore functionality
	to detect RPM dependencies
Thread-Index: AQHS5eAFKyMCpLuHqUy52uQ+78US1KIl9x6g
Date: Thu, 15 Jun 2017 14:19:14 +0000
Message-ID: <8dac07a1a0784c3380de49c17aee97fa@XBOX02.axis.com>
References: <cover.1497534748.git.pkj@axis.com>
	<8066cc468e1880f07dfeafe5fdcab2e5516792f8.1497534748.git.pkj@axis.com>
	<485ef905-084f-6485-c45e-238177e72402@linux.intel.com>
In-Reply-To: <485ef905-084f-6485-c45e-238177e72402@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 11/11] package.bbclass: Restore functionality to detect RPM dependencies
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
X-List-Received-Date: Thu, 15 Jun 2017 14:19:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]
> Sent: den 15 juni 2017 16:03
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 11/11] package.bbclass: Restore
> functionality to detect RPM dependencies
>=20
> On 06/15/2017 04:53 PM, Peter Kjellerstedt wrote:
> > During the transition to dnf and rpm4, the functionality to
> > automatically make RPM determine dependencies was lost.
> >
> > Before the transition, an OE specific tool called rpmdeps-oecore had
> > been added to the rpm suit. It was based on the rpmdeps tool that is
> > part of rpm. For each file specified on its command line, it would
> > output the provides and requires that RPM could determine.
> >
> > During the transition to rpm4, rpmdeps-oecore was replaced with the
> > standard rpmdeps. However, what no one noticed was that unless
> rpmdeps
> > is given options, e.g., -P or -R, to tell it what it should output,
> it
> > will not output anything. Thus, it would do all the work to determine
> > the requirements, but would keep silent about it. And since no output
> > from rpmdeps is expected unless there are requirements, there were no
> > warnings indicating that everything was not working as expected.
> >
> > Porting the old rpmdeps-oecore to work with rpm4 is not really
> > possible since it relied on being able to access internals of RPM
> that
> > are no longer available. However, it turned out that rpmdeps had a
> > debug option, --rpmfcdebug, that would output exactly the information
> > that we need, albeit in a different format and to stderr. To make
> this
> > usable, rpmdeps has now received a new option, --alldeps, which sends
> > the information we need to stdout.
>=20
> I'd like you to address my previous comment: how do you ensure this will
> continue to work going forward? Is it taken into use by default, and if
> it breaks, will we notice?
>=20
> Alex

Yes, once the last commit that changes package.bbclass is integrated, it=20
will be activated for all builds that use RPM. And given how red the=20
autobuilders got when RP did it the first time, I do not think there is=20
any chance we will miss problems due to it...

I do agree that some kind of tests for this would probably be good.=20
However, I do not have any experience with the oe-selftests, and how to=20
implement some tests for this, and I am pressed for time as I go on=20
summer vacation next Friday and would very much like for this to be=20
fixed before then. Especially as we need these changes to make it into=20
Pyro as well...

//Peter


