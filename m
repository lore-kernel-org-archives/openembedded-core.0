Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C2B2871A6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 22:35:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 28 Nov 2016 14:35:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,565,1473145200"; 
	d="asc'?scan'208";a="1074738598"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.5.155])
	([10.219.5.155])
	by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2016 14:35:07 -0800
To: Patrick Ohly <patrick.ohly@intel.com>
References: <1480105843-14729-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1480350180-9496-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1480362425.6873.209.camel@intel.com>
	<967933e7-9f2e-a960-4699-e4e8f2d39e68@linux.intel.com>
	<1480368843.6873.215.camel@intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <e4228247-306f-2fd6-6ba8-1c4e01e11a28@linux.intel.com>
Date: Mon, 28 Nov 2016 16:35:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480368843.6873.215.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] scripts.send-pull-request: Avoid multiple chain headers
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
X-List-Received-Date: Mon, 28 Nov 2016 22:35:07 -0000
X-Groupsio-MsgNum: 89960
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="xXrMHiqKxd9dlocUBti3RsvVlwmMHjmX8"

--xXrMHiqKxd9dlocUBti3RsvVlwmMHjmX8
Content-Type: multipart/mixed; boundary="Q1Ws66GHE8j6Lb6p7S44qnH77BrsBX0RR";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <e4228247-306f-2fd6-6ba8-1c4e01e11a28@linux.intel.com>
Subject: Re: [OE-core] [PATCH V2] scripts.send-pull-request: Avoid multiple
 chain headers
References: <1480105843-14729-1-git-send-email-jose.a.lamego@linux.intel.com>
 <1480350180-9496-1-git-send-email-jose.a.lamego@linux.intel.com>
 <1480362425.6873.209.camel@intel.com>
 <967933e7-9f2e-a960-4699-e4e8f2d39e68@linux.intel.com>
 <1480368843.6873.215.camel@intel.com>
In-Reply-To: <1480368843.6873.215.camel@intel.com>

--Q1Ws66GHE8j6Lb6p7S44qnH77BrsBX0RR
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/28/2016 03:34 PM, Patrick Ohly wrote:
> On Mon, 2016-11-28 at 14:28 -0600, Jose Lamego wrote:
>> Agree. Please provide feedback about below comments and I will submit =
a
>> v3 patch.
>>
>> On 11/28/2016 01:47 PM, Patrick Ohly wrote:
>>> On Mon, 2016-11-28 at 10:23 -0600, Jose Lamego wrote:
>> More than 1 "In-Reply-To" and "References" message headers are in
>> violation of rfc2822 [1] and may cause that some email-related
>> applications do not point to the appropriate root message in a
>> conversation/series.
>=20
> Fixing that makes sense. Just add it as reason and the "why" part is
> covered.
>=20
>>> And I don't understand why this proposed change has the described
>>> effect. Does changing the threading parameters change the output of "=
git
>>> send-email" and thus indirectly the mail headers of the following
>>> patches?
>=20
> The "how" part still isn't clear to me. Perhaps I'm just dumb, but woul=
d
> you bear with me and explain a bit more how changing the sending of the=

> cover letter affects sending of the patches?
>=20
The script is duplicating the headers because it contains two individual
calls to git-send-email, one for the cover letter (when available) and
one for the rest of the series patches, both using the --no-chain-reply
option that includes a reference to the first message. What I'm doing
here is to include no reference to any root message at the first call,
then including a reference at the second call to the very first message
in the chain, which is either the cover letter or the patch #1.
This change is currently implemented/tested at [2] and complements a
change in patchwork [3] that handles messages including repeated headers
(created before this change gets implemented).

So the comment I would add to patch is:
    This change appends only one header pointing to very first patch
    in series or to cover letter if available by calling send-email
    with thread history option only once, instead of the original twice.

[2] patchwork-staging.openembedded.org
[3] https://lists.yoctoproject.org/pipermail/yocto/2016-November/033200.h=
tml
> As it isn't obvious, perhaps even add a comment to the script explainin=
g
> it.
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--Q1Ws66GHE8j6Lb6p7S44qnH77BrsBX0RR--

--xXrMHiqKxd9dlocUBti3RsvVlwmMHjmX8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYPLEcAAoJEFJAtowlSEbn5ZEH/0roW1hbKGuxiU3a6UNnKRmX
wJd5kwcVhReLfFeRIvHTvAqaQ41zQ948t8laO+lF2QzNFjNI1mtoDEhSYuD3r5dO
6NLBFWkywalcq4reyYebu3XwAGK2kpRskrzsSIW9LbxKxcwAwW5RUhpQZuCbsq3L
7F8epLTbh26mUJq/1mskvSLzmXE23IdOmGhmCz1d2QIiZ+VScPTU/iaYdBIv4tzG
JlA9eWUr2V1ppEOhSTNXHy2J2Q/rLM7oUa310eBzueVpDvvQCYVGFLs6ow48xxF9
ho4hE2eiYb0x8WJsPTBFdvMpDo+A0iynO5YgPuIj5swyYB95YruNWjH8HjXBmzw=
=HFeY
-----END PGP SIGNATURE-----

--xXrMHiqKxd9dlocUBti3RsvVlwmMHjmX8--
