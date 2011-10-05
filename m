Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBX7w-00070K-Rs
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 21:27:37 +0200
Received: by qyk4 with SMTP id 4so2224510qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 12:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=P7c/ErrADfI06Bf8KmrnAlhnZQ4et3tsgCx/4+HbHaM=;
	b=gVmGrkqNqcbzRUV0Fufisg3Db2S78DohD7gLOpK1yA+o2i/iMKLBFun6zWLyewblPg
	V98Sy47SSavEkbRUh3J6UYkO4ikxMrdmqce+kpO9eZppJiIzj3eZmjDrENgC/jemf5v2
	KRrQoCnkdQQRD294QgcuXjZEUV+wKUFpWVvm4=
Received: by 10.68.32.73 with SMTP id g9mr21085817pbi.56.1317842521227; Wed,
	05 Oct 2011 12:22:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Wed, 5 Oct 2011 12:21:31 -0700 (PDT)
In-Reply-To: <1317814486.14671.136.camel@ted>
References: <1317322353-30258-1-git-send-email-msm@freescale.com>
	<4E8A0B81.1080507@gmail.com>
	<CAEsOVNcvCgboed7tx68aT_CemeN_pVd_k0JM_cWVDiMtRrCG0w@mail.gmail.com>
	<4E8A2667.4090700@gmail.com>
	<CAEsOVNdahRcHTCfVhaqFZiVaKhAtM2a6L6GTm61RtsGoJxjB6A@mail.gmail.com>
	<1317814486.14671.136.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2011 12:21:31 -0700
Message-ID: <CAMKF1sqwRyc3M53NNjk+usgwtWWcz=gcV9rxqdQCAiRqcMiq7Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH v2 10/16] Fix mdadm for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 19:27:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 4:34 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-10-04 at 21:52 +0000, McClintock Matthew-B29882 wrote:
>> On Mon, Oct 3, 2011 at 4:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >> I can't find a log of this anywhere, it's probably the default
>> >> compiler warnings for our platform are different?
>> >
>> > It would be handy to understand them since I dont see gcc differentiat=
ing
>> > formats between ppc64 and x86_64 which both are 64bit hosts. But obvio=
usly
>> > there is something missing.
>>
>> I finally got around to rerunning this without my patch and the errors
>> are below.
>
> I dug into this a bit. To quote asm/types.h:
>
> /*
> =C2=A0* This is here because we used to use l64 for 64bit powerpc
> =C2=A0* and we don't want to impact user mode with our change to ll64
> =C2=A0* in the kernel.
> =C2=A0*/
> #if defined(__powerpc64__) && !defined(__KERNEL__)
> # include <asm-generic/int-l64.h>
> #else
> # include <asm-generic/int-ll64.h>
> #endif
>
> So ppc64 kernel space uses ll64 and userspace uses l64.
>

thanks this is what I was interested in.

> This means __u64 is a long for ppc64 but a long long for x86_64. The
> format errors occurs rightly because a ull is being printed from a ul
> variable. This will happen to work but its messy.

havent seen the code but  if its printf like then PRIu64 macro could help.

>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


