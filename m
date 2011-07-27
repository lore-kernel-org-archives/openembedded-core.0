Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+vo8S/e7cWgmdqkyfAau1HC+5CNFYBzRI=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qlunv-0006yB-2Q
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 05:29:03 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6R3NmaM014678
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 22:23:49 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1311720776.2344.319.camel@rex>
Date: Tue, 26 Jul 2011 22:23:54 -0500
Message-Id: <9A300C7A-E352-4566-AB92-88DF3CF743D7@kernel.crashing.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
	<1311697113.2344.268.camel@rex>
	<7B0836D8-31B6-407E-848E-FED9C5BFE78A@kernel.crashing.org>
	<1311720776.2344.319.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Wed, 27 Jul 2011 03:29:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 26, 2011, at 5:52 PM, Richard Purdie wrote:

> On Tue, 2011-07-26 at 17:02 -0500, Kumar Gala wrote:
>> On Jul 26, 2011, at 11:18 AM, Richard Purdie wrote:
>>=20
>>>>> You're already found the way to pass configuration to *libc using =
values
>>>>> in TARGET_FPU to pickup the right configuration.
>>>>>=20
>>>>> Is there a use case we're missing?
>>>>=20
>>>> Yes, for [e]glibc we have optimized libc functions for a given /
>>>> specific PPC processor.  So we need someway to tell configure this.
>>>=20
>>> I'd do this by looking for flags in TUNE_FEATURES as Mark has also
>>> mentioned.
>>>=20
>>> Cheers,
>>>=20
>>> Richard
>>=20
>> Are we thinking something like the following in e[glibc] recipes:
>>=20
>> EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", =
"-with-cpu=3De500mc", "", d)}"
>=20
> Could we glean this information from the TUNE_CCARGS variable and do
> this automatically?

For PPC we'd have:

405
440
464
476
603e
e500
e500mc
e5500
970
a2
cell
power4
power5
power5+
power6
power6x
power7

There isn't always a clean mapping.  For example ppce500 & ppce500v2 =
would want --with-cpu=3De500.  I believe ppc603e, ppce300c2 would want =
--with-cpu=3D603e.

If we want to just do it as a python function w/a mapping table we could =
easily handle it that way.

- k



