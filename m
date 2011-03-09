Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PxR9M-0007Ye-Kg
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 22:42:32 +0100
Received: by fxm8 with SMTP id 8so954808fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2011 13:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ta+4kE03J36VL6Lvb9rCMSc/FT15n8GNZ+TvDkYwjHA=;
	b=XynjQsl3Oy+qPTfEValWUNhUKKO4bt7avQfAOdJVRy+UtbNidP15bO89bsc2V6F104
	g9yCNL4r73+SngIRlhRACKSACBP6xxAYd3YExqkYEbotqZCIqGJyX9WTLFs7WVyf/aPt
	vrZkG2hLu44iw8SlCgHmlEA59BNXHE37j+yRE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=FcT3dokPK+eXyRV8p6EIBZ0reTmNgt+DfcbLhga65u/UAJJxepd36SlTZLZjt7LXqp
	CeSszH10vWCRtFRvA0fAVr82t5BpxfaRqnVdInErnXuaH3LZ+SA/3D4ZNUXQkFDiZPL+
	NVKENKozyyddJY2Q7cooZwFNT/x7ndLEVGZoQ=
Received: by 10.223.30.77 with SMTP id t13mr342035fac.112.1299705518402; Wed,
	09 Mar 2011 13:18:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 9 Mar 2011 13:18:08 -0800 (PST)
In-Reply-To: <1299700726.602.988.camel@rex>
References: <cover.1299633840.git.nitin.a.kamble@intel.com>
	<33b26ba051fa171e480bce3a1e4497a619241176.1299633840.git.nitin.a.kamble@intel.com>
	<4D7707E9.3080702@gmail.com> <1299700726.602.988.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Mar 2011 13:18:08 -0800
Message-ID: <AANLkTik5VmgWH92h0cpB-_MtQQPdJxn2E5LG-LXd=QPk@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: poky@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 1/1] gcc-runtime: fix LSB library checks for libstdc++.so.6
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
X-List-Received-Date: Wed, 09 Mar 2011 21:42:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 9, 2011 at 11:58 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-03-08 at 20:54 -0800, Khem Raj wrote:
>> On 3/8/2011 5:26 PM, Nitin A Kamble wrote:
>> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
>> >
>> > [YOCTO #795]
>> >
>> > When we run library check of LSB on qemux86 and qemuppc, we got some f=
ailures
>> > about 'libstdc++.so.6'.
>> >
>> > Test environment:
>> > Platform: Qemu-x86, Qemu-ppc
>> > lsb image: poky-image-lsb-qemux86-test.ext3(Feb 26th, auto-build serve=
r)
>> > Library check of LSB: 4.1.0-1
>> >
>> > The error log:
>> > Did not find _ZNKSt5ctypeIcE8do_widenEPKcS2_Pc (GLIBCXX_3.4) in libstd=
c++.so.6
>> > Unmangled symbol name: std::ctype<char>::do_widen(char const*, char co=
nst*,
>> > char*) const
>> > ...
>> >
>> > =C2=A0 found that some weak symbols ('W') change into local ('t') duri=
ng link time
>> > and be stripped. According to compiling log, the option
>> > "-fvisibility-inlines-hidden" is used for gcc. And this option caused =
some weak
>> > symbols change into local.
>> >
>> > see http://bugzilla.pokylinux.org/show_bug.cgi?id=3D795 for more infor=
mation on the bug.
>> >
>> > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
>> > Signed-off-by: Jingdong Lu<jingdong.lu@windriver.com>
>> > Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>
>> thank you. Applied it to openembedded-core
>
> This raises some questions about how the pull model works as I'd been
> holding off the python RDEPENDS change until I'd had time to check
> something out yet you've applied it. I haven't had the time to be able
> to make any informed feedback on the patch yet whether it was ok or not
> and being able to give any informed feedback takes time.
>
> My basic concern that that the RDEPENDS shouldn't be having that effect
> on native packages and it if it, we probably have a bug somewhere else
> that likely needs fixing.
>
> So the question is whether we are going truly for the pull model, who
> are the people top of tree, what code review applies to patches from
> those people, how absence might get handled and so forth.
>

> As an illustration, it would have been much more useful for me if
> someone had pulled the individual patches together into a single git
> branch and presented that.

Yes thats probably better

 This helps me as it highlights the
> outstanding patches and is what Saul does with many of the Yocto
> patches.
>
> I'm aware there are a few patches pending review and I'm thinking the
> best approach may be some kind of staging/-next type branch where we
> keep these as we review and then either accept, reject or ask for
> improvements.
>

usually if a patch has reviews that needs retouching it. It should go
back through the same cycle it went first time
which was my assumption here which obviously was not case here. the
patches to oe-core from yocto
I assumed were proposed through the branch to pull from and I think is
a good way to prune errors as patches move into
oe-core

> One other thing I noticed is that Khem merged a patch known to be broken
> and then a fixup for it several commits later. I don't like to do that
> for known breakage since it means things are not bisectable and in that
> case I'd have squashed the changes with an update to the commit message
> about the change. Its not a major issue but something to keep in mind
> going forwards.

Yes bisection is important. I guess I assumed too much even though I
was verifying
We need to have openembedded-core-contrib setup for people who do not
have possibility to use yocto-contrib


