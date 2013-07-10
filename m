Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id CA92661FE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 16:35:32 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id d10so5902806lbj.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 09:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vtZh6kwhuGUM39h1CBoubF8dijFv7JgsZBHJJ/UZSjk=;
	b=GlHYnObH+hF6ISnexAwqU23TB0MWHfU1bRQpPGqOu3hnldrpQE+DGIMZD7UCWIRQ2j
	UVNf7zIWcbDqBodbX6vyzP+jm6L7Gi1cFOeHOiKUTyjNN5kW0fctiVXyDcYhXFbp4RL/
	5FWGl4YEkKVsy7IjcX2EBijKDXzC9y4PbXCMYxXHiPhiVfmkizJUF01BfHg0s7C1IRfY
	TdfZp8JtdTiL6sp0OfP3XURldmudv6E4HXjMUW+28VZepFo0EFhzND35B18Oae8g3BTq
	U0iD/UYqndplt5FW7DTGpqGEmpxsEX4HzfWc6vqn+ojjFwqXHvVriHqCY6mAlIAcDUVG
	OkqQ==
MIME-Version: 1.0
X-Received: by 10.152.27.40 with SMTP id q8mr15272573lag.75.1373474132320;
	Wed, 10 Jul 2013 09:35:32 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Wed, 10 Jul 2013 09:35:32 -0700 (PDT)
In-Reply-To: <lywqoymqrk.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <ly8v1etzn5.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<ly4nc2twyk.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4OgktutnmLz87ps4paqanUZM1P4hYz-eu580-rWZBsZzg@mail.gmail.com>
	<lywqoymqrk.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Wed, 10 Jul 2013 13:35:32 -0300
Message-ID: <CADkTA4NYAWK0qVrr_yR-fydU-wndopJ9oSkiBku_HmK1nkX1+w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Bruce Ashfield <bruce.ashfield-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel miscompilation with gcc 4.8 for ARMv5
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
X-List-Received-Date: Wed, 10 Jul 2013 16:35:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 10, 2013 at 11:30 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Bruce Ashfield <bruce.ashfield-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> writes:
>
>>> Applying two upstream kernel commits
>>> 455bd4c430b0c0a361f38e8658a0d6cb469942b5 (ARM: 7668/1: fix
>>> memset-related crashes caused by recent GCC (4.7.2) optimizations) and
>>> 418df63adac56841ef6b0f1fcf435bc64d4ed177 (ARM: 7670/1: fix the memset
>>> fix) seem to fix the problem for me.
>>
>> Correct. Those are the same commits you'll see on linux-yocto-3.8,
>> we've been soaking them for a while. I was waiting for LTSI and -stable
>> to pick up the changes before updating linux-yocto-3.4, but that hasn't
>> happened yet.
>>
>> If you are using linux-yocto-3.4 and can confirm that it boots for you
>> with those patches,
>
> Sorry, I am using a more or less vanilla 3.4 kernel.  Patches fix
> the problem there (device boots) and (after knowing about them) the
> problematic code is easy to spot:

No worries. I can spot the fix, since we already did this for the 3.8 kernel. I
was just no where near my targets at the moment .. and if I had an independent
report that things boot, I'd go ahead and push my 3.8 fixes (ported to
3.4) .. which
I may do anyway, since I can drop them when they cycle through -stable and
LTSI.

Cheers,

Bruce

>
> $ arm-linux-gnueabi-objdump  -d mm/slub.o
>
> 000014c4 <init_object>:
>     ...
>     14fc:       e1a00001        mov     r0, r1
>     1500:       e3a0106b        mov     r1, #107        ; 0x6b
>     1504:       ebfffffe        bl      0 <memset>
>     1508:       e1a03000        mov     r3, r0          <<<<<<<
>     150c:       e5942010        ldr     r2, [r4, #16]
>     1510:       e3e0105a        mvn     r1, #90 ; 0x5a
>     1514:       e0832002        add     r2, r3, r2
>     1518:       e5421001        strb    r1, [r2, #-1]
>
> With unpatched memset, 'r0' points to end of buffer.
>
>
> Enrico
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

