Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWbPK-00040u-3t
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 23:44:22 +0200
Received: by wye20 with SMTP id 20so4840012wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=6MmKQhkGbVvWZQaKqtG5k9KK40XXKNEiyoFchIllKtg=;
	b=gQ+pDVEBQcIt4mcg+4er8jE4G5QKpzfLXIESIabmIx3bEnPqySF/46vhFTRM9G4Mls
	CEk7M1JtlCHzPnjLJGzssiaR1TwxMMkXmfs7sAcvL6d5hqLTgGFVCyaji9KS8eKhGVR5
	REGOa+fP56oqIj7MzezYz+ziDfaI/4utGG2h4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gK4aMB/E4XAAcXRnffrlq0j0wC82Nwgn0XVM92Fey893fUG+UrxkopKsxd9hoLAPNO
	No/8yliKyTE6MAwdqp2TQA6R3xCh5gDd5MNFgyP2GNzn9kqeM7CF2Mfso7iOK7v+NpGL
	Uv51SkS3/TEm0cwRczMuHvHmWlcp+xL7QsycE=
Received: by 10.216.230.105 with SMTP id i83mr1312591weq.43.1308087656095;
	Tue, 14 Jun 2011 14:40:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.37.197 with HTTP; Tue, 14 Jun 2011 14:40:25 -0700 (PDT)
In-Reply-To: <CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Jun 2011 14:40:25 -0700
Message-ID: <BANLkTi=Kk7J-ZAQuPkC5LNAnxZSAzwtvOg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Tue, 14 Jun 2011 21:44:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2011 at 2:32 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 14 jun 2011, om 23:24 heeft Richard Purdie het volgende geschreven:
>
>> On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> meta/classes/allarch.bbclass | =C2=A0 =C2=A05 +++--
>>> 1 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclas=
s
>>> index e3ac392..b9ba28b 100644
>>> --- a/meta/classes/allarch.bbclass
>>> +++ b/meta/classes/allarch.bbclass
>>> @@ -2,9 +2,10 @@
>>> # This class is used for architecture independent recipes/data files (u=
sally scripts)
>>> #
>>>
>>> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
>>> +# before we reset it
>>> +FEED_ARCH :=3D ${BASE_PACKAGE_ARCH}
>>> BASE_PACKAGE_ARCH =3D "all"
>>> -PACKAGE_ARCH =3D "all"
>>> -
>>> # No need for virtual/libc or a cross compiler
>>> INHIBIT_DEFAULT_DEPS =3D "1"
>>
>> This is a *really* bad idea. An "all" package should have no need to set
>> architecture specific values into FEED_ARCH.
>>
>> Just for those not following IRC, the problem is Angstrom adds FEED_ARCH
>> to OVERRIDES. Adding "all" to overrides turns out to do nasty things to
>> classes like rm_work with "_all" in the function names.
>
> So why don't we just set PACKAGE_ARCH =3D all in allarch.bbclass and not =
touch BASE_PACKAGE_ARCH and FEED_ARCH?
>

because there are some machines conf files which use BASE_PACKAGE_ARCH e.g.
tune-xscale.inc

BASE_PACKAGE_ARCH =3D "${@['armv5teb',
'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) =3D=3D 'le']}"

PACKAGE_EXTRA_ARCHS =3D "${@['armeb armv4b armv4tb armv5teb', 'arm armv4
armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) =3D=3D 'le']}"

and this does not get evaluated properly then

>> I'd suggest that various machines should start adding things like armv7a
>> to ${MACHINEOVERRIDES} which has a much more clearly defined scope and
>> that FEED_ARCH should quietly die ;-).
>
> And that's what I've start calling a 'yocto' type of solution. That just =
doesn't scale since it relies on fixing all the machines out there instead =
of levering the knowledge provided by OE already. I'd appreciate a solution=
 is better thought out.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


