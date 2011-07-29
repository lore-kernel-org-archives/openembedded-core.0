Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19mWV7+/babus5U7RqU4A5od0WLxeSiMPE=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmcO9-0001v8-Bn
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 04:01:21 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6T1v2qY020357;
	Thu, 28 Jul 2011 20:57:03 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E3201B7.9040607@linux.intel.com>
Date: Thu, 28 Jul 2011 20:57:03 -0500
Message-Id: <C6AB40FE-3132-4788-A038-A7D877D52DE6@kernel.crashing.org>
References: <1311898077-13062-1-git-send-email-galak@kernel.crashing.org>
	<4E3201B7.9040607@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity.bbclass: Add sanity check that	TUNE_PKGARCH appears in PACKAGE_ARCHS
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
X-List-Received-Date: Fri, 29 Jul 2011 02:01:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 28, 2011, at 7:41 PM, Saul Wold wrote:

> On 07/28/2011 05:07 PM, Kumar Gala wrote:
>> Its possible we get duplications if we explicity add TUNE_PKGARCH to
>> PACKAGE_ARCHS so instead just add a sanity check to verify it.
>>=20
>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
>> ---
>>  meta/classes/sanity.bbclass |   10 +++++++++-
>>  1 files changed, 9 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/classes/sanity.bbclass =
b/meta/classes/sanity.bbclass
>> index b054146..999e15d 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -375,8 +375,10 @@ def check_sanity(e):
>>      elif oeroot.find (' ') !=3D -1:
>>          messages =3D messages + "Error, you have a space in your =
COREBASE directory path. Please move the installation to a directory =
which doesn't include a space."
>>=20
>> -    # Check that we don't have duplicate entries in PACKAGE_ARCHS
>> +    # Check that we don't have duplicate entries in PACKAGE_ARCHS&  =
that TUNE_PKGARCH is in PACKAGE_ARCHS
>>      pkgarchs =3D data.getVar('PACKAGE_ARCHS', e.data, True)
>> +    tunepkg =3D data.getVar('TUNE_PKGARCH', e.data, True)
>> +    tunefound =3D False
>>      seen =3D {}
>>      dups =3D []
>>=20
>> @@ -385,9 +387,15 @@ def check_sanity(e):
>>  	    dups.append(pa)
>>  	else:
>>  	    seen[pa] =3D 1
>> +	if pa =3D=3D tunepkg:
>> +	    tunefound =3D True
>> +
>>      if len(dups):
>>         messages =3D messages + "Error, the PACKAGE_ARCHS variable =
contains duplicates. The following archs are listed more than once: %s" =
% " ".join(dups)
>>=20
> Kumar,
>=20
> Thanks for the patch, some questions.
>=20
> Is this correct, do you still want to report the error, if there is a =
dup?
>=20
> Would it not just be better to just drop the dup if it is the =
TUNE_PKGARCH?

I wasn't sure how to drop the dup. :)

If there is a way to uniq PACKAGE_ARCHS that would be fine=20

- k=


