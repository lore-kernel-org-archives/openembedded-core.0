Received: from [69.18.222.101] (helo=smtp20.4emm.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QrN1Q-0003Y9-QR
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 06:37:33 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB20.4emm.local ([fe80::b039:47b9:6dd0:b630%19]) with mapi id
	14.01.0289.001; Thu, 11 Aug 2011 00:28:45 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] bitbake.conf: Changed PSEUDO_LOCALSTATEDIR
	assignment to unconditional.
Thread-Index: AQHMVjnZX+Jvlt+5PkG8wRgqH9pj0pUVgK2AgAAW+YD//78+cIAA634AgADPCRA=
Date: Thu, 11 Aug 2011 04:32:59 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF183CDB@MBX20.4emm.local>
References: <1312855453-23258-1-git-send-email-james@digitalmatter.com.au>
	<4E41D1B3.4090703@intel.com> <4E41E4F9.60404@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF183852@MBX20.4emm.local>
	<1312977970.14274.357.camel@rex>
In-Reply-To: <1312977970.14274.357.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: Changed PSEUDO_LOCALSTATEDIR assignment to unconditional.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 04:37:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Wed, 10 August 2011 8:06 PM, Richard Purdie wrote:
> On Wed, 2011-08-10 at 02:06 +0000, James Limbouris wrote:
> > On Wednesday, 10 August 2011 9:55 AM, Mark Hatle wrote:
> > > On 8/9/11 7:32 PM, Scott Garman wrote:
> > > > On 08/08/2011 07:04 PM, James Limbouris wrote:
> > > >> The pseudo executable sets the PSEUDO_LOCALSTATEDIR
> environment
> > > >> variable to point to a sysroot location. During an initial cache
> > > >> build, in which pseudo is not used as it is being built, the
> > > >> PSEUDO_LOCALSTATEDIR is set to a per-package location by
> > > >> bitbake.conf,
> > > and baked into the cache.
> > > >> If the cache is subsequently invalidated, bitbake may run under
> > > >> pseudo, and rebuild it with the sysroot location baked into the
> > > >> cache. This results in all packages using the same, persistent
> > > >> db, even on package rebuild, which leads to permissions errors.
> > > >> Making the assignment unconditional corrects this problem.
> > > >
> > > > I can't tell if this change would impact the use of
> > > > useradd.bbclass, which also sets PSEUDO_LOCALSTATEDIR in certain
> > > > circumstances. Mark, can you comment on whether this is a valid
> concern?
> > >
> > > I've been trying to figure that out as well.  From what I can tell,
> > > as long as the value is "${WORKDIR}/pseudo", and it's evaluated at
> > > use time -- vs immediately.. we should be good, even with the
> useradd.bbclass.
> > >
> > > (If I remember correctly, the workdir for the useradd still should
> > > either be the package itself, or the sysroot directory.  That should
> > > be changing during the various steps, as necessary.)
> > >
> > > Frankly I'm still a little confused as to what is happening
> > > differently from the "=3D" to the "?=3D" case.  My understanding is t=
hat
> > > one should indicate "it's always this value", and the other is "use
> > > this value if one has not already been set."
> > >  Either way we should get the same result, and the same result
> > > should end up in any caches.  If it's not the same, this might be
> > > pointing to a different bug -- or my understanding of the processing =
of
> the variables is wrong.
> > >
> > > So for the purposes of useradd, I don't see a problem here.. I also
> > > don't see any issues with the general case.. but I do wonder why
> > > it's needed for the cache to work properly.
> > >
> >
> > Hi,
> >
> > The problem is that the pseudo executable sets the environment
> > variable before starting its argument (bitbake) up, but we do not
> > always use pseudo to start bitbake. So sometimes the variable is set
> > to the sysroot, and sometimes it is set (by the conditional assignment =
in
> bitbake.conf) to the workdir.
>=20
> Something here isn't adding up correctly to me.
>=20
> bitbake should not be seeing any PSEUDO_LOCALSTATEDIR from the pseudo
> binary since its not a whitelisted environment variable. The ?=3D should
> therefore always being assigned as there wouldn't be a previous version o=
f
> the variable.
>=20
> I'd like to understand what value the variable is taking (which would sto=
p the
> ?=3D applying).
>=20
> Are you using BB_PRESERVE_ENV ?
>=20

Hi,

I had another go at debugging. What happens is bitbake/lib/bb/cooker.py:166=
 reimports the environment after it has been cleaned (!). It is then reclea=
ned at some time during the parsing of bitbake.conf, but after the conditio=
nal assignment of PSEUDO_LOCALSTATEDIR. I wasn't patient enough to find out=
 when exactly.

Worse, I don't think bitbake.conf is guaranteed to be in the same spot in e=
very layers.conf, so different layers will parse with different environment=
s.

James




