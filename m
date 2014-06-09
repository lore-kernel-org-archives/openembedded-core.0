Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E30365E61
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 13:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6C264180A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:39:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id NBHzha+GkHKo
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:39:50 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id D236D180A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:39:49 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id B15C7C94
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:39:49 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id A2C24A31
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:39:49 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id A0F1A34005
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:39:49 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail2.se.axis.com
	([10.0.5.74]) with mapi; Mon, 9 Jun 2014 15:39:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jun 2014 15:39:46 +0200
Thread-Topic: [OE-core] Using users/groups from another recipe than the one
	creating them
Thread-Index: Ac92cxfFMHWSvh+eSJeWOV3pn8SnlgNYQMjQ
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7A7A2BE80C7@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7A7A21EFE0D@xmail3.se.axis.com>
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7A7A21EFE0D@xmail3.se.axis.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: Re: Using users/groups from another recipe than the one creating them
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
X-List-Received-Date: Mon, 09 Jun 2014 13:39:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 23 maj 2014 12:38
> To: OE Core (openembedded-core@lists.openembedded.org)
> Subject: Re: [OE-core] Using users/groups from another recipe than the
> one creating them
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Peter Kjellerstedt
> > Sent: den 19 maj 2014 10:15
> > To: OE Core (openembedded-core@lists.openembedded.org)
> > Subject: [OE-core] Using users/groups from another recipe than the
> > one creating them
> >
> > Which assumption is correct: "a recipe A that depends on another
> > recipe B can use users/groups that B creates" or "all recipes must
> > create the users/groups they require themselves"?
> >
> > The problem for us is that we have a lot of recipes that create
> > users and groups, and subsequently a number of other related recipes
> > that need to use those users and groups.
> >
> > If the first assumption is correct then the useradd.bbclass needs to
> > be corrected so that it adds a dependency from do_install to
> > base-passwd:do_populate_sysroot and
> > base-passwd:do_populate_sysroot_setscene, because if either of those
> > tasks execute they will overwrite /etc/passwd and /etc/group,
> > effectively removing any users/groups that were created earlier...
> >
> > On the other hand, if it is the second assumption that is correct,
> > then there should be QA tests in place to make sure all recipes
> > create the users/groups they use.
> >
> > //Peter
>=20
> *ping*
>=20
> Doesn't anyone know how users and groups are supposed to work?
>=20
> //Peter

*ping again*

Well, this is somewhat discouraging. Three weeks and not a single=20
response. Are we really the only ones that care about users and=20
groups and how they are created? Doesn't anyone know which of my=20
two assumptions above are correct?

Personally I would prefer that all recipes create the users and=20
groups they require themselves as this keeps them more self=20
contained. I have no idea how to write a QA test to verify this,=20
but I assume it should be possible...

//Peter


