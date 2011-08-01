Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QnscJ-00022t-Lk
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 15:33:11 +0200
Received: by wyg30 with SMTP id 30so1698031wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 06:28:51 -0700 (PDT)
Received: by 10.227.3.2 with SMTP id 2mr6398341wbl.4.1312205331537;
	Mon, 01 Aug 2011 06:28:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fn12sm4180024wbb.38.2011.08.01.06.28.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 06:28:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1312203836.2344.431.camel@rex>
Date: Mon, 1 Aug 2011 15:28:47 +0200
Message-Id: <F39391A7-A197-4BFD-8EAB-CC03B10EE71B@dominion.thruhere.net>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<d16f8ea81d614e2dd5608cbf8b773de9764b8d56.1312182844.git.sgw@linux.intel.com>
	<1312203836.2344.431.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
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
X-List-Received-Date: Mon, 01 Aug 2011 13:33:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 aug. 2011, om 15:03 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>> meta/classes/sanity.bbclass |    8 +++++---
>> 1 files changed, 5 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/classes/sanity.bbclass =
b/meta/classes/sanity.bbclass
>> index 999e15d..dc11c9e 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -383,12 +383,14 @@ def check_sanity(e):
>>     dups =3D []
>>=20
>>     for pa in pkgarchs.split():
>> -    	if seen.get(pa, 0) =3D=3D 1:
>> +	if pa =3D=3D tunepkg:
>> +	    tunefound =3D True
>> +            if seen.get(pa, 0) =3D=3D 1:
>> +               pkgarchs.remove(pa)
>> +    	elif seen.get(pa, 0) =3D=3D 1:
>> 	    dups.append(pa)
>> 	else:
>> 	    seen[pa] =3D 1
>> -	if pa =3D=3D tunepkg:
>> -	    tunefound =3D True
>>=20
>>     if len(dups):
>>        messages =3D messages + "Error, the PACKAGE_ARCHS variable =
contains duplicates. The following archs are listed more than once: %s" =
% " ".join(dups)
>=20
> How about we don't put duplicates in there in the first place?

AIUI this is fatal in OE classic as well, so there really shouldn't be =
any duplicates in PACKAGE_(EXTRA_)ARCHS=


