Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 401DD74197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 700D62E0A7;
	Tue, 10 Nov 2015 16:54:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id g-XKMeQtgXLI; Tue, 10 Nov 2015 16:54:24 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 941282E1A0;
	Tue, 10 Nov 2015 16:54:24 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 74042D45;
	Tue, 10 Nov 2015 16:54:24 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 68D109B;
	Tue, 10 Nov 2015 16:54:24 +0100 (CET)
Received: from xmail4.se.axis.com (xmail4.se.axis.com [10.0.5.46])
	by seth.se.axis.com (Postfix) with ESMTP id 6403F3E2ED;
	Tue, 10 Nov 2015 16:54:24 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail4.se.axis.com
	([fe80::2dfa:6a3a:302a:d4e8%14]) with mapi;
	Tue, 10 Nov 2015 16:54:24 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 10 Nov 2015 16:54:23 +0100
Thread-Topic: [PATCH 5/5] useradd-staticids.bbclass: Read passwd/group files
	before parsing
Thread-Index: AdEYz8Ao/XAKZDNfTKySC1tyy8SYVgCD9G1Q
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7C6F0358BFF@xmail3.se.axis.com>
References: <cover.1446595453.git.pkj@axis.com>
	<d2e824d17dae9f9583a11ee2165096e7cff533b0.1446595453.git.pkj@axis.com>
	<5639522B.5050604@windriver.com>
	<A612847CFE53224C91B23E3A5B48BAC7C6F013F187@xmail3.se.axis.com>
	<563D0A1E.9060601@windriver.com>
In-Reply-To: <563D0A1E.9060601@windriver.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] useradd-staticids.bbclass: Read passwd/group files before parsing
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
X-List-Received-Date: Tue, 10 Nov 2015 15:54:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> Sent: den 6 november 2015 21:14
> To: Peter Kjellerstedt
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [PATCH 5/5] useradd-staticids.bbclass: Read passwd/group
> files before parsing
>=20
> On 11/6/15 2:09 PM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> >> Sent: den 4 november 2015 01:33
> >> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> >> Subject: Re: [PATCH 5/5] useradd-staticids.bbclass: Read
> >> passwd/group files before parsing
> >>
> >> On 11/3/15 6:06 PM, Peter Kjellerstedt wrote:
> >>> Read and merge the passwd/group files before parsing the user and
> >>> group definitions. This means they will only be read once per
> >>> recipe. This solves a problem where if a user was definied in
> >>> multiple files, it could generate group definitions for groups=20
> >>> that should not be created. E.g., if the first passwd file read=20
> >>> defines a user as:
> >>>
> >>> foobar::1234::::
> >>>
> >>> and the second passwd file defines it as:
> >>>
> >>> foobar:::nogroup:The foobar user:/:/bin/sh
> >>>
> >>> then a foobar group would be created even if the user will use the
> >>> nogroup as its primary group.
> >>
> >> One minor thing
> >>
> >>> @@ -251,7 +269,7 @@ def update_useradd_static_config(d):
> >>>
> >>>              newparams.append(newparam)
> >>>
> >>> -        return " ;".join(newparams).strip()
> >>> +        return ";".join(newparams).strip()
> >>>
> >>>      # Load and process the users and groups, rewriting the adduser/a=
ddgroup params
> >>>      useradd_packages =3D d.getVar('USERADD_PACKAGES', True)
> >>>
> >>
> >> The space was required because you could generate a user/group add
> >> line that ended with a string.  Without the space, you could end up
> >> merging two sets of arguments causing a failure condition.
> >>
> >> So I think that it should be retained unless there is a specific
> >> reason you believe it should be removed.
> >
> > I cannot see how that space can make any difference. Each set of
> > useradd/grouppadd options added to newparams has the user/group
> > name at the end of the string. And if that somehow interferes with
> > the semicolon, then the code in useradd.bbclass which simply does
> > "cut -d ';'" to split the useradd/groupadd line would break already.
>=20
> The contents when originally parsed my be run as arguments to a shell
> script or as parameters to these functions.
>=20
> In the shell script world not have a space can confuse the argument
> parsing into thinking the ; is part of the argument.

No shell I have heard of (bash, zsh and dash comes to mind) would be=20
affected by the lack of a space before the semicolon. Moreover, this=20
is never actually parsed by a shell (except as part of a variable value).=20
The semicolon is used by useradd.bbclass to split the variables, after=20
which it lets the shell evaluate the part before the semicolon (which=20
will ignore any trailing whitespace).

> You don't have that in the python world with the split behavior.
>=20
> > Actually, now that I think about it, I do wonder why
> > useradd-staticids.bbclass use this advanced variant to split the
> > useradd/groupadd lines:
> >
> >         for param in re.split('''[ \t]*;[ \t]*(?=3D(?:[^'"]|'[^']*'|"[^=
"]*")*$)''', params):
>=20
> It is perfectly legal to allow a ';' in the middle of a parameter (that
> allows it), a parameter that is quoted.

Sure, and the code above handles some cases, but definitely not all.=20
E.g., this would not be parsed as intended by useradd-staticids.bbclass:

USERADD_PARAMS_${PN} +=3D "-c Comment\ with\ an\ \'\ in\ it oddcomment; \
                         -c Other\ odd \'\ comment otheruser"

but it would be handled correctly by useradd.bbclass...

> Something like:
>=20
> adduser -c "This user;that user;all users" -d /home/allusers alluser
>=20
> it's odd, but I've certainly seen people put ';' in the comment
> before.. and it is legal in other palces, like the home dir and=20
> such -- just not advised.

It may be legal, but it has never been supported by the adduser.bbclass.=20
And thus it has never worked in practice to take an existing passwd=20
file that contains a semicolon in the comment field and expect it to=20
work as input to adduser-staticids.bbclass.

Moreover, neither adduser.bbclass nor adduser-staticids.bbclass will=20
handle a semicolon correctly in any other field. And let's not get=20
started on other special characters like ", \, $ and > which could=20
wreak havoc on both classes in a correctly crafted passwd file.

> > when this would do the job just as well:
> >
> >         for param in params.split(';'):
> >
> > given that that is what useradd.bbclass does. It looks as if tries
> > to support something like --comment "something with a ; in it", but
> > using that would break in useradd.bbclass anyway...
>=20
> Then the useradd class is broken in this case.  The --comment
> processing needs to work, it's just rarely used in the normal=20
> case, but very much used in the "lets take a previously generated=20
> passwd file and reuse it" case of the adduser-static.
>=20
> > //Peter

So, from reading the code in both adduser.bbclass and=20
adduser-staticids.bbclass, having spaces or no spaces before the=20
semicolon in the USERADD_PARAM_${PN} variable cannot make any=20
difference to how the users are created in the end. Thus it should=20
be safe to remove them.

//Peter


