Received: from [69.18.222.101] (helo=smtp20.4emm.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QqyG8-0002o0-6d
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 04:11:04 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB20.4emm.local ([fe80::b039:47b9:6dd0:b630%19]) with mapi id
	14.01.0289.001; Tue, 9 Aug 2011 22:02:20 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] bitbake.conf: Changed PSEUDO_LOCALSTATEDIR
	assignment to unconditional.
Thread-Index: AQHMVjnZX+Jvlt+5PkG8wRgqH9pj0pUVgK2AgAAW+YD//78+cA==
Date: Wed, 10 Aug 2011 02:06:32 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF183852@MBX20.4emm.local>
References: <1312855453-23258-1-git-send-email-james@digitalmatter.com.au>
	<4E41D1B3.4090703@intel.com> <4E41E4F9.60404@windriver.com>
In-Reply-To: <4E41E4F9.60404@windriver.com>
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
X-List-Received-Date: Wed, 10 Aug 2011 02:11:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Wednesday, 10 August 2011 9:55 AM, Mark Hatle wrote:
> On 8/9/11 7:32 PM, Scott Garman wrote:
> > On 08/08/2011 07:04 PM, James Limbouris wrote:
> >> The pseudo executable sets the PSEUDO_LOCALSTATEDIR environment
> >> variable to point to a sysroot location. During an initial cache
> >> build, in which pseudo is not used as it is being built, the
> >> PSEUDO_LOCALSTATEDIR is set to a per-package location by bitbake.conf,
> and baked into the cache.
> >> If the cache is subsequently invalidated, bitbake may run under
> >> pseudo, and rebuild it with the sysroot location baked into the
> >> cache. This results in all packages using the same, persistent db,
> >> even on package rebuild, which leads to permissions errors. Making
> >> the assignment unconditional corrects this problem.
> >
> > I can't tell if this change would impact the use of useradd.bbclass,
> > which also sets PSEUDO_LOCALSTATEDIR in certain circumstances. Mark,
> > can you comment on whether this is a valid concern?
>=20
> I've been trying to figure that out as well.  From what I can tell, as lo=
ng as the
> value is "${WORKDIR}/pseudo", and it's evaluated at use time -- vs
> immediately.. we should be good, even with the useradd.bbclass.
>=20
> (If I remember correctly, the workdir for the useradd still should either=
 be
> the package itself, or the sysroot directory.  That should be changing du=
ring
> the various steps, as necessary.)
>=20
> Frankly I'm still a little confused as to what is happening differently f=
rom the
> "=3D" to the "?=3D" case.  My understanding is that one should indicate "=
it's
> always this value", and the other is "use this value if one has not alrea=
dy
> been set."
>  Either way we should get the same result, and the same result should end
> up in any caches.  If it's not the same, this might be pointing to a diff=
erent
> bug -- or my understanding of the processing of the variables is wrong.
>=20
> So for the purposes of useradd, I don't see a problem here.. I also don't=
 see
> any issues with the general case.. but I do wonder why it's needed for th=
e
> cache to work properly.
>=20

Hi,

The problem is that the pseudo executable sets the environment variable
before starting its argument (bitbake) up, but we do not always use pseudo
to start bitbake. So sometimes the variable is set to the sysroot, and some=
times
it is set (by the conditional assignment in bitbake.conf) to the workdir.

Usually it is set to the workdir while building the cache, but when the cac=
he is
invalidated, the wrapper script most often uses pseudo, setting it to the s=
ysroot.

James




