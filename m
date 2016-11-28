Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 29D9471A72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 20:28:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 28 Nov 2016 12:28:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,565,1473145200"; 
	d="asc'?scan'208";a="1065339732"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.5.155])
	([10.219.5.155])
	by orsmga001.jf.intel.com with ESMTP; 28 Nov 2016 12:28:18 -0800
To: Patrick Ohly <patrick.ohly@intel.com>
References: <1480105843-14729-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1480350180-9496-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1480362425.6873.209.camel@intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <967933e7-9f2e-a960-4699-e4e8f2d39e68@linux.intel.com>
Date: Mon, 28 Nov 2016 14:28:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480362425.6873.209.camel@intel.com>
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
X-List-Received-Date: Mon, 28 Nov 2016 20:28:26 -0000
X-Groupsio-MsgNum: 89956
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="9s864uBRbkxSTSb0t4AAR0DkeOMTD8evG"

--9s864uBRbkxSTSb0t4AAR0DkeOMTD8evG
Content-Type: multipart/mixed; boundary="4UEHiODnLR6dfKMxSgs5JQEFvKnWJN2qo";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <967933e7-9f2e-a960-4699-e4e8f2d39e68@linux.intel.com>
Subject: Re: [OE-core] [PATCH V2] scripts.send-pull-request: Avoid multiple
 chain headers
References: <1480105843-14729-1-git-send-email-jose.a.lamego@linux.intel.com>
 <1480350180-9496-1-git-send-email-jose.a.lamego@linux.intel.com>
 <1480362425.6873.209.camel@intel.com>
In-Reply-To: <1480362425.6873.209.camel@intel.com>

--4UEHiODnLR6dfKMxSgs5JQEFvKnWJN2qo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Agree. Please provide feedback about below comments and I will submit a
v3 patch.

On 11/28/2016 01:47 PM, Patrick Ohly wrote:
> On Mon, 2016-11-28 at 10:23 -0600, Jose Lamego wrote:
More than 1 "In-Reply-To" and "References" message headers are in
violation of rfc2822 [1] and may cause that some email-related
applications do not point to the appropriate root message in a
conversation/series.

>> When creating a patch set with cover letter using the
>> send-pull-request script, both the "In-Reply-To" and "References"
>> headers are appended twice in patch 2 and subsequent.
>=20
> The "why" part is missing in the commit header. "Why" is appending thos=
e
> twice a problem? Is it a bug in the script (because it violates some
> RFC) or is it merely a workaround for a problem in other software (mail=

> programs or Patchwork)?
>=20
> I know that this change is related to the issues that Patchwork has wit=
h
> identifying a patch series, but even with that background knowledge it
> is not clear why this fix is the right solution.
>=20
This change appends only one header pointing to very first patch
in series (patch #1) or to cover letter if available, which results in an=

appropriate message-chain.

[1] https://tools.ietf.org/html/rfc2822#section-3.6
>>
>> [YOCTO #10718]
>>
>> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
>> ---
>>  scripts/send-pull-request | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
>> index 575549d..a660c37 100755
>> --- a/scripts/send-pull-request
>> +++ b/scripts/send-pull-request
>> @@ -162,7 +162,7 @@ PATCHES=3D$(echo $PDIR/*.patch)
>>  if [ $AUTO_CL -eq 1 ]; then
>>  	# Send the cover letter to every recipient, both specified as well a=
s
>>  	# harvested. Then remove it from the patches list.
>> -	eval "git send-email $GIT_TO $GIT_CC $GIT_EXTRA_CC --confirm=3Dalway=
s --no-chain-reply-to --suppress-cc=3Dall $CL"
>> +	eval "git send-email $GIT_TO $GIT_CC $GIT_EXTRA_CC --confirm=3Dalway=
s --no-thread --suppress-cc=3Dall $CL"
>>  	if [ $? -eq 1 ]; then
>>  		echo "ERROR: failed to send cover-letter with automatic recipients.=
"
>>  		exit 1
>=20
>=20
> And I don't understand why this proposed change has the described
> effect. Does changing the threading parameters change the output of "gi=
t
> send-email" and thus indirectly the mail headers of the following
> patches?
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--4UEHiODnLR6dfKMxSgs5JQEFvKnWJN2qo--

--9s864uBRbkxSTSb0t4AAR0DkeOMTD8evG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYPJNjAAoJEFJAtowlSEbnpK8H+wVcA02sYM7PjdfBS3ntyLzH
xULkFL8eWDsOuZeKjCxUbzLbDTJAJOGknCtCwQYI5ZAaAe+nr9in7mBrnjHAL1LM
EHDUYRdo2Ryb0CRh5Xro+57jk8yMVP0zo93OXosZTM5WX93ZHWfL8xLmCWcZFZv2
w1NuAYieT2xFKioZoeDvsCnnQY4D/2xttqLoBmTcAC7Whg4sahs/5/+YOMePZU3V
ZNcnUMq/P299sDsHhpc+mKGgeF54EPrNuTD6HzRxA7qfgxG8OilCZ59/UTX3nyNb
vLV23uQPlmlq1TaIjoMSrecHWrkc6NRKI78nG7J2oH30wrC5Q8bQaX+CZzF+YNs=
=XkoY
-----END PGP SIGNATURE-----

--9s864uBRbkxSTSb0t4AAR0DkeOMTD8evG--
