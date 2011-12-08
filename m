Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYkmE-0007B2-OD
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 21:41:10 +0100
Received: by lahd3 with SMTP id d3so854237lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 12:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=P2eTf3GO7F0HiVNeHCi2PU+VwBU3cYoTzFNAAYbCDtI=;
	b=qhxEhdMFLFWvnpllHineSdLtYX240m5KSM30lkLFhCvP0xXPgpaV5XYdOPKmYl6vl+
	j3lK5q8N7jMuaaZjJ03RXeqwahde8KfdtqYzp7xGrKbcJnNIfxtKGLSf769FgvG8ujwP
	CbGLsSsX7dzQsVGzPtvkD69VwAX+F4UDQ7ug8=
Received: by 10.152.128.103 with SMTP id nn7mr639106lab.48.1323376460334; Thu,
	08 Dec 2011 12:34:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Thu, 8 Dec 2011 12:33:49 -0800 (PST)
In-Reply-To: <4EE10BFD.9000405@windriver.com>
References: <4EDF12D3.4060306@gmail.com>
	<CA+M6bXk22TQ8jowRyjTyyJzRhUbE7fhvcf1YH_AS9EYn=sX+WA@mail.gmail.com>
	<79A60C08-1C6C-48A6-8CAF-F40C6562B755@gmail.com>
	<4EE10BFD.9000405@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Dec 2011 12:33:49 -0800
Message-ID: <CAMKF1sohiooO=RgmCqzzQcet5+Vw7FwadvBnWJAXKLb=WZG48Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC fails when SDK is not extracted to /usr/local
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
X-List-Received-Date: Thu, 08 Dec 2011 20:41:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 8, 2011 at 11:11 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 12/8/11 1:04 PM, Tasslehoff Kjappfot wrote:
>>
>>
>> On Dec 8, 2011, at 3:56 PM, Tom Rini wrote:
>>
>>> On Wed, Dec 7, 2011 at 12:16 AM, Tasslehoff Kjappfot
>>> <tasskjapp@gmail.com> =C2=A0wrote:
>>>>
>>>> gcc fails when I extract my SDK to another place than /usr/local.
>>>>
>>>> Output when it fails:
>>>>
>>>> $ ./arm-angstrom-linux-gnueabi-gcc
>>>> bash: ./arm-angstrom-linux-gnueabi-gcc: No such file or directory
>>>>
>>>> Readelf output:
>>>>
>>>> $ readelf -d arm-angstrom-linux-gnueabi-gcc
>>>>
>>>> Dynamic section at offset 0x34394 contains 21 entries:
>>>> =C2=A0Tag =C2=A0 =C2=A0 =C2=A0 =C2=A0Type =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name/Value
>>>> =C2=A00x00000001 (NEEDED) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Shared library: [libc.so.6]
>>>> =C2=A00x0000000f (RPATH) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Library rpath:
>>>>
>>>> [/usr/local/angstrom-eglibc-i686-armv7a/sysroots/i686-angstromsdk-linu=
x/usr/lib/armv7a-angstrom-linux-gnueabi:/usr/local/angstrom-eglibc-i686-arm=
v7a/sysroots/i686-angstromsdk-linux/lib]
>>>>
>>>> Is it the RPATH here that's making trouble for me?
>>>
>>>
>>> Not exactly. =C2=A0And RPATH is needed to find some of the shared libra=
ries
>>> that are needed. =C2=A0I thought we had been running chrpath over these=
 to
>>> make them relocatable, however.
>>>
>>> --
>>> Tom
>>>
>>
>> Does this RPATH indicate that its not relocatable? Anything else I can
>> check?
>
>
> It should be using RUN_PATH =C2=A0$ORIGIN to relocate itself based on the=
 initial
> run-time location.
>
> It sounds like something is not being run as it should for the SDK
> component(s).

it should come by inheriting relocatable class I think and this class is be=
ing
inherited in cross|native|nativesdk classes.


