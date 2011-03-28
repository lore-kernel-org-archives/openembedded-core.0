Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q4Iop-0007ZU-M9
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 22:13:51 +0200
Received: by fxm19 with SMTP id 19so3261934fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2011 13:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=xHqtC396copyfLqO12RQxjI3ArgjXGp/AHzjPYeH+Qw=;
	b=OJ+xqahOnBnU8UVLRtjAks/se1+7iFdoPwZuPYbSA1RD2JJ2mroWRxlbel050TnxD/
	9+eXae7F69t94kJg1kztj4rhoVrV9vz4XgqyWBjIL1UsP/QvmYa+1Y0sGlBUEftiMqlJ
	tbexJrfq1ZqJCU39iEpjegbcQVJVZ7Ds+g8eE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=N1ddK0AUVsDAIPQEX50hgmsKdBvhlIlRr0gyBard22RKjeL4qvAcQXtchccZ0JHTKI
	kUU+VcIogi5oH1goaXeTpfPiqb3jrpsXe/Fxk84/jp1aK7CUXxfK9yoN6Vfbg/wHwsLM
	2YvhfXv6f7T7HpX2v8hqUGs6erV2zLLcEhiSk=
Received: by 10.223.26.205 with SMTP id f13mr785765fac.49.1301343103884; Mon,
	28 Mar 2011 13:11:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Mon, 28 Mar 2011 13:11:13 -0700 (PDT)
In-Reply-To: <4D90EA4E.8070105@mentor.com>
References: <20110327200802.GA23980@sakrah.homelinux.org>
	<AANLkTi=NeEXCqdyiQWaxA=aU96-Osuj+gE-zGRwkPH6-@mail.gmail.com>
	<4D90DB8A.3010609@mentor.com>
	<AANLkTi=Fc8N4ikQvH_6gA-1NkgjXiSmjwc9sn5m4G0Dm@mail.gmail.com>
	<4D90EA4E.8070105@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Mar 2011 13:11:13 -0700
Message-ID: <AANLkTimU7e58ygQxXVjCPFFGxNAbaW7LgKQjnFm1+u+V@mail.gmail.com>
To: Tom Rini <tom_rini@mentor.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 28 Mar 2011 20:13:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2011 at 1:06 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/28/2011 12:48 PM, Khem Raj wrote:
>> On Mon, Mar 28, 2011 at 12:03 PM, Tom Rini <tom_rini@mentor.com> wrote:
>>> On 03/27/2011 04:03 PM, Chris Larson wrote:
>>>> On Sun, Mar 27, 2011 at 1:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> I observed that if I have
>>>>> DEPENDS =3D "a b" in recipe.bb which has BBCLASSEXTEND =3D "native"
>>>>> then dependecies for recipe-native shows a-native b-native so far so
>>>>> good
>>>>>
>>>>> Now if I want to add a dependency which only is needed for native rec=
ipe
>>>>> I do
>>>>>
>>>>> DEPENDS_virtclass-native +=3D "c-native"
>>>>>
>>>>> what this does is it will ignore a-native and b-native dependencies a=
nd
>>>>> only adds "c-native" to depends of native recipe
>>>>>
>>>>> DEPENDS_virtclass-native_append =3D " c-native"
>>>>>
>>>>> This does what I wanted i.e. have deps on a-native b-native c-native
>>>>>
>>>>> I think behavior of +=3D or _append should be similar. Is my understa=
nding
>>>>> correct ?
>>>>
>>>> They've never been the same. =C2=A0+=3D is immediate, _append is delay=
ed. =C2=A0If
>>>> a class, say, native.bbclass, defines the variable with ?=3D, and you
>>>> used +=3D before the inherit, then it will have a value, and the ?=3D
>>>> won't assign. =C2=A0I assume native.bbclass does it this way today so =
you
>>>> can override the automatic behavior by defining the variable yourself,
>>>> but I'll let Richard speak to that decision.
>>>
>>> As Richard said, this is a good summary. =C2=A0And a shorter still summ=
ary
>>> (as Chris reminds me everytime I forget) is that since BBCLASSEXTENDS
>>> makes use of an override already (virtclass-native/cross/etc) you must
>>> keep that in mind when further modifying it as you get not what you
>>> expected but what you asked for.
>>>
>>
>> Yes no doubt on how it works and can be coded to likings of what we
>> have but I think
>> that having +=3D and friends as well as _append and _prepend could be
>> combined into one logic
>> immediate appending/prepending operation may be confusing IMO while
>> immediate assignments
>> I think still are ok. We have more than one directives doing very
>> similar yet semantically different operations
>> It becomes hard for recipe writers. May be I am over simplifying
>
> The problem is that we have different operators for different things.
> Usually +=3D/=3D+ are what you want in a recipe for variables and append =
/
> prepend are for classes that do tricky things.

well can you generalize like this for languages ? I am thinking of say
in C you cant
restrict usage to abstractions like this this only can be used in
header and this in C files

Even if we do then we should make
bitbake refuse do _append/_prepend operations in .bb files.

=C2=A0The problem, as Richard
> explains is that BBCLASSEXTEND makes things special and we need to deal
> with that better.
>
> --
> Tom Rini
> Mentor Graphics Corporation
>


