Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rqv9J-0001yn-Fi
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 00:24:05 +0100
Received: by lahc1 with SMTP id c1so1205276lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 15:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=wGNzeudDkHH1hbmHEsBS8RM/pYp3330rhAM4DVW3YRs=;
	b=BCy6nnH96Ou0LuX5B0flB1KR4eQZAsfVIUV9RmStQmGdj7ovrrZgm7/dcs7fl0QnY1
	48nbeTeu0VG12/7B7biXQei3UBnnC+lmAZPO+V7hkdlbUXMrcucJ5dfuVsZkYimx68Uc
	Biw+CBmTLqT2KCcFx9YlJy/z9JK7PSiKC57L4=
MIME-Version: 1.0
Received: by 10.152.131.40 with SMTP id oj8mr4611365lab.24.1327706175847; Fri,
	27 Jan 2012 15:16:15 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Fri, 27 Jan 2012 15:16:15 -0800 (PST)
In-Reply-To: <4F22C122.9030206@linux.intel.com>
References: <CALbNGRS-WsE45UakTV5VE2T5bAxb1C2iWgPeN+Ys+OTx-i48Rw@mail.gmail.com>
	<4F21FDA2.5070803@linux.intel.com>
	<CALbNGRQ0+FDE7QisckBOCXBUspQiumZFLjPJYgRf87a1mqtHaw@mail.gmail.com>
	<CALbNGRTqHJYvSzbman=ZPQ4D=Cyu8oX0F4JdTA7hrH4oMW_wbA@mail.gmail.com>
	<4F22C122.9030206@linux.intel.com>
Date: Sat, 28 Jan 2012 00:16:15 +0100
Message-ID: <CALbNGRR8cJJfDcHm1hX8cRf7JOKwkoU-sySx1mYujMgXJYHBdA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [oe] evince: who is responsible to pack all within usr/lib/evince/3/backends to ${PN}?
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
X-List-Received-Date: Fri, 27 Jan 2012 23:24:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2012 at 4:22 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/27/2012 04:48 AM, Andreas M=FCller wrote:
>>
>> On Fri, Jan 27, 2012 at 9:43 AM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> =A0wrote:
>>>
>>> On Fri, Jan 27, 2012 at 2:28 AM, Saul Wold<sgw@linux.intel.com> =A0wrot=
e:
>>>>
>>>> On 01/26/2012 05:16 PM, Andreas M=FCller wrote:
>>>>>
>>>>>
>>>>> I checked: the complete contents of /usr/lib/evince/3/backends go to
>>>>> evince package and I would like to move *.a to ${PN}-staticdev and
>>>>> *.la to ${PN}-dev but I don't understand: who is responsible for
>>>>> adding all this to ${PN}?
>>>>>
>>>> bitbake.conf defines where most files should go, but when you get file=
s
>>>> in
>>>> sub-directories, such as /usr/lib/evince/..., then the recipe needs to
>>>> do a
>>>> little more work. If you look at the evince_2.32.0.bb, there already i=
s
>>>> a
>>>> FILES_${PN}-staticdev that adds some extensions, you need to add this
>>>> set of
>>>> backends to that list, probably same with the .la to the -dev package.
>>>>
>>> Why I asked this: Maybe there is a chance to fix this more globally
>>> instead of one by one in each recipe. But therefore I need to know
>>> where the path is packed.
>>>
>> I looked around for this a bit: As Saul pointed out, in bitbake.conf we
>> have
>> FILES_${PN} =3D ... ${libdir}/${BPN}/* ...
>>
>> This
>> * drags in all below this directory ( e.g *.la / *.a )
>> * Forces me to rewrite FILES_${PN} in evince ( e.g just adding
>> ${libdir}/${BPN}/*/backends/*.a to FILES_${PN}-staticdev fixes nothing
>> ). This is something I would like to avoid.
>>
>> Suggestions?
>>
>> I guess others but evince are also affected.
>>
> Actually the ordering of PACKAGES matters here and since bitbake.conf lis=
ts
> the ${PN}-dev and ${PN}-staticdev package before ${PN}, you can append th=
e
> ${libdir}/${BPN}/3/backends/*.a to FILES_${PN}-staticdev and it will pull
> those first before doing the FILES_${PN}. does that make sense? =A0You do=
n't
> have to re-write FILES_${PN}.
>
Sorry - but In oe-core's bitbake.conf I see

PACKAGES =3D "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-loc=
ale"

this might explain why I can append whatever I want to -dev /
-staticdev - or do I miss something?

Andreas


