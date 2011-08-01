Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+tBCPWqeBwafHytBbaowZK3QAbupwnRd4=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QnxeO-0002Vd-B4
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 20:55:41 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p71IpJYk028710
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 13:51:20 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <20110801173429.GC7798@sakrah.homelinux.org>
Date: Mon, 1 Aug 2011 13:51:22 -0500
Message-Id: <917D82F8-94FC-4311-A7D3-5B07589ED4B5@kernel.crashing.org>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<d16f8ea81d614e2dd5608cbf8b773de9764b8d56.1312182844.git.sgw@linux.intel.com>
	<1312203836.2344.431.camel@rex>
	<BD97115A-63EB-467F-AA18-3ECAEBA017E3@kernel.crashing.org>
	<20110801173429.GC7798@sakrah.homelinux.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 13/22] sanity: Dont throw a warning if TUNE_PKGARCH is in PACKAGE_ARCHS twice
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
X-List-Received-Date: Mon, 01 Aug 2011 18:55:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 1, 2011, at 12:34 PM, Khem Raj wrote:

> On (01/08/11 09:11), Kumar Gala wrote:
>>=20
>> On Aug 1, 2011, at 8:03 AM, Richard Purdie wrote:
>>=20
>>> On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>> ---
>>>> meta/classes/sanity.bbclass |    8 +++++---
>>>> 1 files changed, 5 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/meta/classes/sanity.bbclass =
b/meta/classes/sanity.bbclass
>>>> index 999e15d..dc11c9e 100644
>>>> --- a/meta/classes/sanity.bbclass
>>>> +++ b/meta/classes/sanity.bbclass
>>>> @@ -383,12 +383,14 @@ def check_sanity(e):
>>>>    dups =3D []
>>>>=20
>>>>    for pa in pkgarchs.split():
>>>> -    	if seen.get(pa, 0) =3D=3D 1:
>>>> +	if pa =3D=3D tunepkg:
>>>> +	    tunefound =3D True
>>>> +            if seen.get(pa, 0) =3D=3D 1:
>>>> +               pkgarchs.remove(pa)
>>>> +    	elif seen.get(pa, 0) =3D=3D 1:
>>>> 	    dups.append(pa)
>>>> 	else:
>>>> 	    seen[pa] =3D 1
>>>> -	if pa =3D=3D tunepkg:
>>>> -	    tunefound =3D True
>>>>=20
>>>>    if len(dups):
>>>>       messages =3D messages + "Error, the PACKAGE_ARCHS variable =
contains duplicates. The following archs are listed more than once: %s" =
% " ".join(dups)
>>>=20
>>> How about we don't put duplicates in there in the first place?
>>>=20
>>> Which board/tune files is this occurring with?
>>=20
>> Yeah, not sure about this one, I added the sanity check to find this =
early.  Ran into issues with my PPC patch set and took a while to find =
(thus figured a sanity check made sense to check early on).
>=20
> I think the issue is when TUNE_PKGARCH does not end up in the
> PACKAGE_ARCHS and then package managers dont pick the ipks/rpms/debs
> which are under that dir in deploy/ipk.
> Usually we have been doing +=3D to PACKAGE_EXTRA_ARCH
> variable in layers but with latest tune overhaul +=3D does not work
> and we have to do _append/_prepend. I dont know if that is Kumar's
> original problem=20

Yeah, its why I added the sanity check to make sure TUNE_PKGARCH was in =
the PACKAGE_ARCHS list.

- k=


