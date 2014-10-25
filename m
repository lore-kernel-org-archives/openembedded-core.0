Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 2BDDD65C75
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Oct 2014 00:57:01 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Sat, 25 Oct 2014 02:56:55 +0200
From: Tudor Florea <Tudor.Florea@enea.com>
To: Markus Boos <Markus.Boos@kistler.com>,
	"'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Discussion about architecure of ptest-runner patch
Thread-Index: Ac/vbDp/PFRk3LIhTGWd4Cah5c52dwAezSPg
Date: Sat, 25 Oct 2014 00:56:55 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A428ACB8AF@SESTOEX04.enea.se>
References: <345DD4F0215D4B4CB8356943BA192C9913CF0BD0@kihagwinex02.int.kistler.com>
In-Reply-To: <345DD4F0215D4B4CB8356943BA192C9913CF0BD0@kihagwinex02.int.kistler.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.1.188]
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
X-List-Received-Date: Sat, 25 Oct 2014 00:57:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Markus Boos
> Sent: Friday, October 24, 2014 12:37
> To: 'openembedded-core@lists.openembedded.org'
> Subject: [OE-core] Discussion about architecure of ptest-runner patch
>=20
> Hi
>=20
> We patched the ptest-runner script to deliver a xUnit file as a rough
> overview/indicator over the package tests.
> Having such a report allows us to use the file in Jenkins and in our ALM =
tool to
> display the results of the ptest run.
>=20
> Before we send the patch upstream I like to start the discussion about th=
e
> architecture of the patch because I think it's worth to extend the ptest-
> runner to deliver the results in readable text format (xUnit, JSON, html =
table,
> csv,  whateverformat).
> I think of something similar like the automated deployment mechanism
> where yocto delivers the base class and you can write your own extension
> with this class.

The concept of ptest is to run the tests using the minimum possible appropr=
iate resource of a target to be tested.
As per wiki page (https://wiki.yoctoproject.org/wiki/Ptest):
"One major point of ptest is to consolidate the output format of all tests =
into a single common format. The format selected is the automake "simple te=
st" format
result: testname"
As per automake manual (http://www.gnu.org/software/automake/manual/automak=
e.html#Simple-Tests).
"The possible results (whose meanings should be clear from the previous Gen=
eralities about Testing) are PASS, FAIL, SKIP, XFAIL, XPASS and ERROR"
While I acknowledge that an automated mechanism to process and display the =
test results would be a nice piece of work for an automated testing framewo=
rk,  I don't think that this belongs to ptest (ptest-runner).
The processing of the test results of an embedded tested device should not =
be done by the embedded device itself (inside ptest-runner in particular) b=
ut rather by the testing infrastructure (Jenkins? autobuild?) that eventual=
ly spawn ptest-runner.

The next steps to improve ptest is to provide parallelism (that is to run p=
arallel-tests for each feature tested and  to run ptest for many feature in=
 parallel). The work to be done to process the results (e.g. for a readable=
 text format)  should take into consideration this aspect.

Regards,
  Tudor.

>=20
> What is the best way to add such a feature?
>=20
> Simply extend the ptest-runner script with the preferred output formatter=
?
>=20
> Or
>=20
> Write a bitbake class with an interface where you can attach your own
> preferred output formatter?
>=20
> I'm sure there are other solutions possible as well. If you have one in m=
ind,
> please share it.
>=20
> Thank you.
>=20
> Best regards
> Markus
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

