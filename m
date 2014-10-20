Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 75A3D60671
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 13:36:31 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id f73so3138659yha.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=uEp/5ffoYFZVOIATEco8a8pXQq3bVK7coI2On5tv1Dg=;
	b=VzIt1l2px+eW2z7y7P/EVct0OZ6XKo7fIidJjzIrIsHxhTewsqF2mvmY+WObMiZWHt
	jAsw0QS0N5BSW5Ql2IOj28QlAV/OqRF9zTtaAiZB5hnf7YdgNqfDKLXOjYOxZX0PQTXo
	9OhZXqC8414SZUko8XzMo4BxkfMHJftHRXz9N4TmC+Ek7+V/DP1W2eB0ymVQcc0JbQcp
	NcyntDqRjsdhGSbWUKf1flH9iQVBsje9UojtyMdI7+YCUldS/+MY0RlVYVtKk68XgSfD
	LQdz9SkYlv8BfmJtKiwnulAUkAigsa4BomwsLp3ZVtiCm2MTTGHUALjBmSsmUKZ7RmBr
	xiIg==
MIME-Version: 1.0
X-Received: by 10.236.30.65 with SMTP id j41mr20373921yha.105.1413812192326;
	Mon, 20 Oct 2014 06:36:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Mon, 20 Oct 2014 06:36:32 -0700 (PDT)
In-Reply-To: <544502B6.5040808@topic.nl>
References: <5444F848.3040307@topic.nl> <1413806657.17752.154.camel@ted>
	<544502B6.5040808@topic.nl>
Date: Mon, 20 Oct 2014 11:36:32 -0200
X-Google-Sender-Auth: pLlRzkebIJl65T-kyyQg2piLR6I
Message-ID: <CAP9ODKoALXOnHWeAPH3FYU6=dyFDvjYrsbOD9cXJyzKD+ayKAQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Going beyond MACHINE?
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
X-List-Received-Date: Mon, 20 Oct 2014 13:36:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2014 at 10:40 AM, Mike Looijmans
<mike.looijmans@topic.nl> wrote:
> On 10/20/2014 02:04 PM, Richard Purdie wrote:
>>
>> On Mon, 2014-10-20 at 13:55 +0200, Mike Looijmans wrote:
>>>
>>> =EF=BB=BFThe short version of my question: Can I define a "level" that =
goes
>>> beyond MACHINE?
>>>
>>> My problem in detail (and I suspect there are more systems with similar
>>> problems):
>>>
>>> I have an SOC called "topic-miami". There are currently two variants: T=
he
>>> 7015
>>> and 7030. They are identical but for one component: They have a differe=
nt
>>> FPGA
>>> part (the 7030 is bigger and faster).
>>> Both run exactly the same kernel and bootloader, and all other software
>>> and
>>> libraries are exactly the same.
>>>
>>> Currently I have MACHINE=3D"topic-miami-7015" and then
>>> SOC_FAMILY=3D"topic-miami"
>>> so I can use "topic-miami" as override word for all packages.
>>>
>>> However, this means I get two kernels, two bootloaders, etc. even thoug=
h
>>> they
>>> are exactly the same.
>>>
>>> The only package that currently differs is the one that delivers the
>>> bitstream(s) for the FPGA. These are big, too big to fit bitstreams for
>>> both
>>> models into flash and leave room for applications, so just installing
>>> both
>>> into the rootfs and pick the correct one at boot time is not really an
>>> option.
>>>
>>> Maybe I could define some extra PACKAGE_ARCH for the bitstreams (which
>>> make
>>> sense, as this is sort of firmware for a different platform). But how
>>> would a
>>> user then pick the right value for this variable, since MACHINE seems t=
o
>>> be
>>> the only thing he can really choose?
>>>
>>> Any thoughts and ideas are welcome...
>>
>>
>> One possible solution would be to inject another PACKAGE_ARCH (as the
>> intel gmgd graphics does for example), then mark the MACHINE specific
>> packages as being that package architecture. They'd then only get built
>> once per package architecture yet your bitstreams would still be machine
>> specific. You could probably do the "remarking" using anonymous python
>> injected at the machine level.
>
>
> Sounds doable, but I can't find anything about "intel gmgd" in any layer.
> Which machine are you referring to here?

We did something similar in meta-fsl-arm, check:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/classes/fsl-dyn=
amic-packagearch.bbclass
http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/conf/machine/in=
clude/imx-base.inc#n41

This should be easy to adapt for your specific case.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

