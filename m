Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.103])
	by mail.openembedded.org (Postfix) with ESMTP id 5331D60169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 10:21:39 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to:references:mime-version:content-type;
	b=HBccxdjJtJ0WN43/DedifTCkudzrdfDwyIW4O+/Ercf/XMev1nKyI75PqFQUBImzCZQxbHgWMhpF
	RDUpmfhK3VzVBOXVK7p3AzrP7lGqSq+OpFhN+SiBBjuQcNp7s8nH  
Received: from localhost.localdomain
	(dynamic-adsl-78-13-166-113.clienti.tiscali.it [78.13.166.113])
	by mx.zohomail.com with SMTPS id 1417602091772705.0174761453197;
	Wed, 3 Dec 2014 02:21:31 -0800 (PST)
From: Diego <diego.ml@zoho.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 03 Dec 2014 11:21:27 +0100
Message-ID: <13901061.gWxNn8kp3O@localhost.localdomain>
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <547E5595.20807@linux.intel.com>
References: <2727351.QZhbar3BFX@localhost.localdomain>
	<547E5595.20807@linux.intel.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [BUG] Openssh not closing connections on service stop
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
X-List-Received-Date: Wed, 03 Dec 2014 10:21:44 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

In data marted=EC 2 dicembre 2014 16:13:09, Saul Wold ha scritto:
> <snip>
>
> > Isn't service termination supposed to stop all related connections =
at the
> > same time? Can anybody else reproduce (or not) this issue?
>=20
> It may actually be designed to work this way, since the daemon spawns=
 a
> process for each login the daemon can be restarted on a headless or
> server type machine and not loose the connection, based on googling, =
I
> could not find this outright on the Openssh.com site.
>=20
> It appears that the dropbear sshd also has the behavior.
>=20
> So I would not call this a bug.
>=20
> Sau!
>=20

Hi Saul,

I had a bit of a discussion with bluelightning and peteru in #oe. We ca=
me to=20
the conclusion that having ssh connections still up after service stop =
is=20
considered to be the correct behaviour.

On the other hand, not closing ssh connections on shutdown is generally=
=20
considered a bug by distros, although it is considered a minor one. Thi=
s=20
generally requires connections being killed before network is brought d=
own,=20
which might be complicated with sysvinit. These are the links from othe=
r=20
distros:
https://bugzilla.redhat.com/show_bug.cgi?id=3D626477
https://bugs.gentoo.org/show_bug.cgi?id=3D259183
https://bugs.archlinux.org/task/31250

Long story short: it would be nice to gracefully close ssh connections =
on=20
shutdown before terminating network connections, but it's a minor issue=
, and=20
probably not worth the effort of fixing.

Bests,
Diego


