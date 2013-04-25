Received: from [8.20.30.154] (helo=mx1.devonhealth.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <igeiser@devonit.com>) id 1UVTJ5-0001He-Rx
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 23:02:20 +0200
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.213.0;
	Thu, 25 Apr 2013 16:43:22 -0400
Received: from [10.0.2.240] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Thu, 25 Apr 2013 16:43:19 -0400
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from SOUTHSIDE.devonintlgroup.com ([10.0.2.2]) by
	kingston.devonintlgroup.com ([10.0.2.240]) with mapi; Thu, 25 Apr 2013
	16:43:00 -0400
From: Ian Geiser <igeiser@devonit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2013 16:43:23 -0400
Thread-Topic: [OE-core] debugedit: canonicalization unexpectedly shrank
	by one character
Thread-Index: Ac5AvDubr4hnLwldS8mA7BiDXosq3wBNV/AA
Message-ID: <B57A220D1EE1644685BA9AD5C790D20526BE5531DF@SOUTHSIDE.devonintlgroup.com>
References: <20130424072004.GE3217@jama>
In-Reply-To: <20130424072004.GE3217@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-WSS-ID: 7D674AED4CW1188446-01-01
Subject: Re: debugedit: canonicalization unexpectedly shrank by one character
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 21:02:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Wednesday, April 24, 2013 3:20 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] debugedit: canonicalization unexpectedly shrank by
> one character
>=20
> Hi,
>=20
> with debugedit errors now catched and shown after:
> commit 262a69ffd33e9d001a7a15fc73671a015e3b5dd1
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Mon Mar 25 16:52:07 2013 +0000
>=20
>     package.bbclass: Handle subprocess errors correctly
>=20
>     If an error occurs in subprocess.call() we currently don't catch
> it. In particular
>     we have issues where debugedit is segfaulting unnoticed. This fixes
> up
>     various code paths to catch the errors.
>=20
> I get couple of recipes failing with errors like:
[...]
> This leads to
> https://bugzilla.redhat.com/show_bug.cgi?id=3D304121
> https://bugs.launchpad.net/rpm/+bug/638633
> https://qa.mandriva.com/show_bug.cgi?id=3D62391
>=20
> but no clear solution (it would be nice to show which path triggered
> that message as suggested in redhat bugzilla)
>=20
> I can INHIBIT_PACKAGE_DEBUG_SPLIT in failing recipes or adding slash to
> -d '/usr/src/debug/' works in this case too..
I tried set PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src" in the packag=
e and that seemed to work around the problem.  In my package that was offen=
ding was because there was an -rpath that had a trailing /.  It seems debug=
edit is very sensitive to rogue path separators. Are there ways to make thi=
s more robust?




