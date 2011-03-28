Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q4ITG-0006tQ-Rf
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 21:51:26 +0200
Received: by fxm19 with SMTP id 19so3242201fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2011 12:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=VGxSeqta8y85BXL+h3UuZd9Qaklibiv4YHcYXQ/vjtc=;
	b=A6zYkRcAh/BhYugJW6GO2tyehwFdL+/Lz20Bmy8aZBr4GyVtgvIJIUN56Z4f2bYSIp
	yGvCES3WnTgL3UBMPKKHSgSntEz2SfcT3Lveav0dcxfAk4XE3CCW9C+4fGcKxAOqRKUU
	R3wrVuM0a+7YTlFZiebb0e24s2BkXHiPZ2rkQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=b+p9CRKPWmChVAQNmvB18DOs/4Sh2NzWRqa56hW6DaXIZJ7ZC2JwIvJFtUh9PlCRHj
	bxy2rUwTiYrf0AGibrCHEBHzyHleI2u1P52US5agpQqH6ltYx1BJual26ViWrws7lrsP
	8tuXmGoM7Q3uiTM/0rPqh3AzRT8uHrB+I1EyY=
Received: by 10.223.5.26 with SMTP id 26mr2385537fat.68.1301341758195; Mon, 28
	Mar 2011 12:49:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Mon, 28 Mar 2011 12:48:48 -0700 (PDT)
In-Reply-To: <4D90DB8A.3010609@mentor.com>
References: <20110327200802.GA23980@sakrah.homelinux.org>
	<AANLkTi=NeEXCqdyiQWaxA=aU96-Osuj+gE-zGRwkPH6-@mail.gmail.com>
	<4D90DB8A.3010609@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Mar 2011 12:48:48 -0700
Message-ID: <AANLkTi=Fc8N4ikQvH_6gA-1NkgjXiSmjwc9sn5m4G0Dm@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: DEPENDS tranlation with BBCLASSEXTEND
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
X-List-Received-Date: Mon, 28 Mar 2011 19:51:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2011 at 12:03 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/27/2011 04:03 PM, Chris Larson wrote:
>> On Sun, Mar 27, 2011 at 1:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> I observed that if I have
>>> DEPENDS =3D "a b" in recipe.bb which has BBCLASSEXTEND =3D "native"
>>> then dependecies for recipe-native shows a-native b-native so far so
>>> good
>>>
>>> Now if I want to add a dependency which only is needed for native recip=
e
>>> I do
>>>
>>> DEPENDS_virtclass-native +=3D "c-native"
>>>
>>> what this does is it will ignore a-native and b-native dependencies and
>>> only adds "c-native" to depends of native recipe
>>>
>>> DEPENDS_virtclass-native_append =3D " c-native"
>>>
>>> This does what I wanted i.e. have deps on a-native b-native c-native
>>>
>>> I think behavior of +=3D or _append should be similar. Is my understand=
ing
>>> correct ?
>>
>> They've never been the same. =C2=A0+=3D is immediate, _append is delayed=
. =C2=A0If
>> a class, say, native.bbclass, defines the variable with ?=3D, and you
>> used +=3D before the inherit, then it will have a value, and the ?=3D
>> won't assign. =C2=A0I assume native.bbclass does it this way today so yo=
u
>> can override the automatic behavior by defining the variable yourself,
>> but I'll let Richard speak to that decision.
>
> As Richard said, this is a good summary. =C2=A0And a shorter still summar=
y
> (as Chris reminds me everytime I forget) is that since BBCLASSEXTENDS
> makes use of an override already (virtclass-native/cross/etc) you must
> keep that in mind when further modifying it as you get not what you
> expected but what you asked for.
>

Yes no doubt on how it works and can be coded to likings of what we
have but I think
that having +=3D and friends as well as _append and _prepend could be
combined into one logic
immediate appending/prepending operation may be confusing IMO while
immediate assignments
I think still are ok. We have more than one directives doing very
similar yet semantically different operations
It becomes hard for recipe writers. May be I am over simplifying

> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


