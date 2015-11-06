Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94F6E73D46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 20:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A764C180AC;
	Fri,  6 Nov 2015 21:09:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id MybZJMWv2mOT; Fri,  6 Nov 2015 21:09:41 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 8AB1118091;
	Fri,  6 Nov 2015 21:09:41 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6BEE61466;
	Fri,  6 Nov 2015 21:09:41 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 608A6624;
	Fri,  6 Nov 2015 21:09:41 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 5E62E342B4;
	Fri,  6 Nov 2015 21:09:41 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail2.se.axis.com
	([10.0.5.74]) with mapi; Fri, 6 Nov 2015 21:09:41 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 6 Nov 2015 21:09:36 +0100
Thread-Topic: [PATCH 5/5] useradd-staticids.bbclass: Read passwd/group files
	before parsing
Thread-Index: AdEWtv1WZDFoQjbAS/anblFB6XcbXwARCnKQ
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7C6F013F187@xmail3.se.axis.com>
References: <cover.1446595453.git.pkj@axis.com>
	<d2e824d17dae9f9583a11ee2165096e7cff533b0.1446595453.git.pkj@axis.com>
	<5639522B.5050604@windriver.com>
In-Reply-To: <5639522B.5050604@windriver.com>
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
X-List-Received-Date: Fri, 06 Nov 2015 20:09:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> Sent: den 4 november 2015 01:33
> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> Subject: Re: [PATCH 5/5] useradd-staticids.bbclass: Read passwd/group
> files before parsing
>=20
> On 11/3/15 6:06 PM, Peter Kjellerstedt wrote:
> > Read and merge the passwd/group files before parsing the user and
> > group definitions. This means they will only be read once per
> > recipe. This solves a problem where if a user was definied in multiple
> > files, it could generate group definitions for groups that should not
> > be created. E.g., if the first passwd file read defines a user as:
> >
> > foobar::1234::::
> >
> > and the second passwd file defines it as:
> >
> > foobar:::nogroup:The foobar user:/:/bin/sh
> >
> > then a foobar group would be created even if the user will use the
> > nogroup as its primary group.
>=20
> One minor thing
>=20
> > @@ -251,7 +269,7 @@ def update_useradd_static_config(d):
> >
> >              newparams.append(newparam)
> >
> > -        return " ;".join(newparams).strip()
> > +        return ";".join(newparams).strip()
> >
> >      # Load and process the users and groups, rewriting the adduser/add=
group params
> >      useradd_packages =3D d.getVar('USERADD_PACKAGES', True)
> >
>=20
> The space was required because you could generate a user/group add=20
> line that ended with a string.  Without the space, you could end up=20
> merging two sets of arguments causing a failure condition.
>=20
> So I think that it should be retained unless there is a specific=20
> reason you believe it should be removed.

I cannot see how that space can make any difference. Each set of=20
useradd/grouppadd options added to newparams has the user/group=20
name at the end of the string. And if that somehow interferes with=20
the semicolon, then the code in useradd.bbclass which simply does=20
"cut -d ';'" to split the useradd/groupadd line would break already.

Actually, now that I think about it, I do wonder why=20
useradd-staticids.bbclass use this advanced variant to split the=20
useradd/groupadd lines:

        for param in re.split('''[ \t]*;[ \t]*(?=3D(?:[^'"]|'[^']*'|"[^"]*"=
)*$)''', params):

when this would do the job just as well:

        for param in params.split(';'):

given that that is what useradd.bbclass does. It looks as if tries=20
to support something like --comment "something with a ; in it", but=20
using that would break in useradd.bbclass anyway...

//Peter


