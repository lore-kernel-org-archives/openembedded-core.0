Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9B74E73CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 20:12:22 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so6688170qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kTcv18P3bbzL1qtAkEO3fPk175k3lHIhFOkzNlrFOZI=;
	b=cOeqdQfiQIxzK0lRiN9Zbsncizk7MCf5T9hOFE8JN4G8wBu9Cqxq2S8zgc1dUkrwyO
	2GHmrbUKtDvzTIQW6DhEYfv7IaBZPAZRrFogSr+Jr4FduggzYqX+KPaeij3iMyFDSSU7
	OtmIQa/w5yRDqe82hu3LJI94hkXUwLrNGQj3TtBrvYdgkiCIxKXHVxb0XvTQ7OQOkzyS
	GOw8diVefBYBut7u4s77O/0JSjU05+UFAYriyrAGScMXR5u7PHoXVXhI3/dK8J1J5Tdy
	Q2suSmN/dtLpLn0useUm1AHzytB27CJD66CUPvmwcgwze6qaz150SiFbcaKkqB3aZclF
	Br8Q==
X-Gm-Message-State: ALoCoQmgWLrlrVpNfnOvX30qSp/LkaNrwNYGfw3D/fASDc8OILpMvV4jgM3ndIKzCPeFtn+qOkrH
X-Received: by 10.55.53.193 with SMTP id c184mr25515222qka.62.1440015142494;
	Wed, 19 Aug 2015 13:12:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 19 Aug 2015 13:12:03 -0700 (PDT)
In-Reply-To: <55D4E00C.9060601@mentor.com>
References: <1440006296-15277-1-git-send-email-raj.khem@gmail.com>
	<55D4E00C.9060601@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Aug 2015 21:12:03 +0100
Message-ID: <CAJTo0LasGyh_erWWWPPKWtOwbBi0tWVXudxKgXnZhL42SL3WWQ@mail.gmail.com>
To: Nathan Lynch <Nathan_Lynch@mentor.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch: Force BFD kernel when using gcc for linking
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
X-List-Received-Date: Wed, 19 Aug 2015 20:12:28 -0000
Content-Type: multipart/alternative; boundary=001a11476f140a6f47051dafa71d

--001a11476f140a6f47051dafa71d
Content-Type: text/plain; charset=UTF-8

On 19 August 2015 at 20:59, Nathan Lynch <Nathan_Lynch@mentor.com> wrote:

> On 08/19/2015 12:44 PM, Khem Raj wrote:
> > We redefine LD to point to ld.bfd when building kernel, which works in
> > most cases since kbuild system calls out for bare LD most of the time,
> > however some of newer kernels e.g. 4.1+ have some code added which can
> > call gcc directly to do the linking job e.g. arm vdso code
> >
> > This causes build failures when we have configured the default cross
> > toolchain to use gold linker as default. Errors like
> >
> > BFD: arch/arm/vdso/vdso.so: Not enough room for program headers, try
> > linking with -N
> > | arm-angstrom-linux-gnueabi-objcopy:arch/arm/vdso/vdso.so[.hash]: Bad
> > value
> >
> > start happening.
> >
> > With this patch we force gcc to choose bfd linker as well
>
>
> This is fixed upstream as of:
>
> commit d2b30cd4b7223a96e606dfc8120626f66d81e091
> Author: Nathan Lynch <nathan_lynch@mentor.com>
> Date:   Wed Jun 3 00:41:15 2015 +0100
>
>     ARM: 8384/1: VDSO: force use of BFD linker
>
> which should make it to 4.1-stable soon.


 CC'ing Bruce.

I'll stage the fix from Khem in my master-unde-test branch.  Bruce: if you
end up merging this fix into the oe-core kernels, please remind me to
revert Khem's patch. :)

Ross

--001a11476f140a6f47051dafa71d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 August 2015 at 20:59, Nathan Lynch <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:Nathan_Lynch@mentor.com" target=3D"_blank">Nathan_Ly=
nch@mentor.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 08/19=
/2015 12:44 PM, Khem Raj wrote:<br>
&gt; We redefine LD to point to ld.bfd when building kernel, which works in=
<br>
&gt; most cases since kbuild system calls out for bare LD most of the time,=
<br>
&gt; however some of newer kernels e.g. 4.1+ have some code added which can=
<br>
&gt; call gcc directly to do the linking job e.g. arm vdso code<br>
&gt;<br>
&gt; This causes build failures when we have configured the default cross<b=
r>
&gt; toolchain to use gold linker as default. Errors like<br>
&gt;<br>
&gt; BFD: arch/arm/vdso/vdso.so: Not enough room for program headers, try<b=
r>
&gt; linking with -N<br>
&gt; | arm-angstrom-linux-gnueabi-objcopy:arch/arm/vdso/vdso.so[.hash]: Bad=
<br>
&gt; value<br>
&gt;<br>
&gt; start happening.<br>
&gt;<br>
&gt; With this patch we force gcc to choose bfd linker as well<br>
<br>
<br>
</span>This is fixed upstream as of:<br>
<br>
commit d2b30cd4b7223a96e606dfc8120626f66d81e091<br>
Author: Nathan Lynch &lt;<a href=3D"mailto:nathan_lynch@mentor.com">nathan_=
lynch@mentor.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Wed Jun 3 00:41:15 2015 +0100<br>
<br>
=C2=A0 =C2=A0 ARM: 8384/1: VDSO: force use of BFD linker<br>
<br>
which should make it to 4.1-stable soon.</blockquote><div><br></div><div>=
=C2=A0CC&#39;ing Bruce.</div><div><br></div><div>I&#39;ll stage the fix fro=
m Khem in my master-unde-test branch.=C2=A0 Bruce: if you end up merging th=
is fix into the oe-core kernels, please remind me to revert Khem&#39;s patc=
h. :)</div><div><br></div><div>Ross</div></div></div></div>

--001a11476f140a6f47051dafa71d--
