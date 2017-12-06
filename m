Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 369F778416
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 21:38:46 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id b5so9890770itc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 13:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Mb30wXt0cB6zEGWCpluD04nvVcccdM4Xndfk0xqYeVQ=;
	b=yLDD+mDxe84GoIerUjeDmGAmkZ5eMT7g7sRprhaJEO8dwV2z/Z/RiNQnbu+KzB7huO
	xPODuo3t+E6CsrScrbJvTFVZY6KNG8U0rlmFUTtKcOUZXRsY3rlbEOcaMs+0fFqIw9Aq
	jsuJx94syckW8JePUxPFZvV+fIsesFcVbNPWDWl3cpJM3Ra6WGNnJkc//FEg9GT7eSFT
	nt4KR0bfrTZPseVP6hpXakLzyg5gNy4ZusWd9oWgqOGaFVrYo/jkvvHGgVnLqdqbPpV6
	HDZUGT9fvtBX66xXWfMItanZlNQlHoqjGGD1hImpEaPn4c/T4msV2x17fvJsQGwBrGOy
	A1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Mb30wXt0cB6zEGWCpluD04nvVcccdM4Xndfk0xqYeVQ=;
	b=R5DvxIkvD5yu8ZxtEIGWdXFf7/hbR/EHaLQz3zSifRLG2SWVhF0X4U9yir3C24sUbA
	9AaoO7+xNz5/bL4kKS1GLsZC02xEqQGuPbVlehfZhOUQcija7ZUtY8Ah2b5tZ5d425G4
	jObwvQZ2IeE9/BTrQtxF2diEDPBGZ1/bReILrFWxa1NU+zoeDdicMdERq7dAUWg0fG5Z
	wzOohM4EiB+VPYMVlnnIYKerLalM2+OyV6ySWrTqdNogJhbHYmcJvXPyyw9gsDexTUxh
	m3HQUk8D7NXccN0P/sXWs6Y5PNB6ufun6DUSIMfH7V6rZJHxE9ZqEUX0+HgtbShc/ehb
	Crtg==
X-Gm-Message-State: AKGB3mLZdpWYd+AFIQOl1WrBhsqqxU9YAEbQ8NgnILxghpoFmDYHjh9A
	sYJtga00jWKDhg/fDIrZH94HTBvO8ucr7kG2BmzUNxOH
X-Google-Smtp-Source: AGs4zMaBOemgPYTojGgzsvU6lpJxfZJbBdNN9mWsiUK2vYH1CVrN1hRRglAZ3lb6agdlW0LeZ1e6MD+ViGOU7R/yx+Y=
X-Received: by 10.36.162.65 with SMTP id o1mr24105216iti.85.1512596327875;
	Wed, 06 Dec 2017 13:38:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Wed, 6 Dec 2017 13:38:27 -0800 (PST)
In-Reply-To: <CAJTo0LamaocQdf-kAKHw-0OZs7ZZ4uMfV598cJiJxFV+R=PaBA@mail.gmail.com>
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-6-olofjn@axis.com>
	<CAJTo0LbrTAEyXgB=RxQNcjUObG-cEMfwMxdPXW22GZuc3YTCOQ@mail.gmail.com>
	<20171204153001.enqgfe27iapaoftl@axis.com>
	<CAJTo0LamaocQdf-kAKHw-0OZs7ZZ4uMfV598cJiJxFV+R=PaBA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Dec 2017 21:38:27 +0000
Message-ID: <CAJTo0LYemQ16EavmwCLa4PYZQHbg12BSDgiCEZomx1YSRV7Rwg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Olof Johansson <olof.johansson@axis.com>
Subject: Re: [PATCH 5/5] lib/oe/package.py: is_elf: Make it less prone to false positives
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
X-List-Received-Date: Wed, 06 Dec 2017 21:38:47 -0000
Content-Type: multipart/alternative; boundary="f403045fbd84cffab0055fb2c65f"

--f403045fbd84cffab0055fb2c65f
Content-Type: text/plain; charset="UTF-8"

If you are looking at this then you'll want to pull my branch again as I
just pushed a few fixes to make ARM binaries actually work.

Also, a prototype "is this binary stripped" function would be:

elf = oe.elf.Elf.from_file(sys.argv[1])
for h in elf.header.section_headers:
    if h.type == oe.elf.Elf.ShType.progbits and h.name == ".debug_info":
        return False
return True

If you're not working on this yet, please say, as I'll probably have a look
this week.

Ross


On 4 December 2017 at 15:33, Burton, Ross <ross.burton@intel.com> wrote:

> On 4 December 2017 at 15:30, Olof Johansson <olof.johansson@axis.com>
> wrote:
>
>> On 17-12-04 12:36 +0000, Burton, Ross wrote:
>> > You might be interested in some of the patches I've got sitting in
>> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=ross/mutb
>> > specifically around "Add new ELF parser".  This adds a fully-featured
>> > Python ELF parser to lib/oe which could be used to inspect the binaries
>> the
>> > way file does, but without having to call and parse the output of file.
>>
>> Oh, that's awesome. Please disregard v1 of my patch series, and
>> I'll try to adapt package.bbclass and lib/oe/package.py to make
>> use of your changes and see what happens. Thanks!
>>
>
> Hopefully to get what you want out of it doesn't involve too much pain...
>
> I still need to finish the series of to get it ready for merging, but I've
> just pushed a new branch ross/elf to poky-contrib which has just the
> patches.  As I clean it up I'll force push there, so feel free to
> track/rebase/send improvements.
>
> Ross
>

--f403045fbd84cffab0055fb2c65f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If you are looking at this then you&#39;ll want to pull my=
 branch again as I just pushed a few fixes to make ARM binaries actually wo=
rk.<div><br></div><div>Also, a prototype &quot;is this binary stripped&quot=
; function would be:</div><div><br></div><div><div>elf =3D oe.elf.Elf.from_=
file(sys.argv[1])<br></div><div>for h in elf.header.section_headers:</div><=
div>=C2=A0 =C2=A0 if h.type =3D=3D oe.elf.Elf.ShType.progbits and <a href=
=3D"http://h.name">h.name</a> =3D=3D &quot;.debug_info&quot;:</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return False</div><div>return True</div></div><div=
><br></div><div>If you&#39;re not working on this yet, please say, as I&#39=
;ll probably have a look this week.</div><div><br></div><div>Ross</div><div=
><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 December 2017 at 15:33, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span c=
lass=3D"">On 4 December 2017 at 15:30, Olof Johansson <span dir=3D"ltr">&lt=
;<a href=3D"mailto:olof.johansson@axis.com" target=3D"_blank">olof.johansso=
n@axis.com</a>&gt;</span> wrote:<br></span><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><span class=3D""><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span=
>On 17-12-04 12:36 +0000, Burton, Ross wrote:<br>
&gt; You might be interested in some of the patches I&#39;ve got sitting in=
<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/=
?h=3Dross/mutb" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoprojec=
t.org/cg<wbr>it/cgit.cgi/poky-contrib/log/?<wbr>h=3Dross/mutb</a><br>
&gt; specifically around &quot;Add new ELF parser&quot;.=C2=A0 This adds a =
fully-featured<br>
&gt; Python ELF parser to lib/oe which could be used to inspect the binarie=
s the<br>
&gt; way file does, but without having to call and parse the output of file=
.<br>
<br>
</span>Oh, that&#39;s awesome. Please disregard v1 of my patch series, and<=
br>
I&#39;ll try to adapt package.bbclass and lib/oe/package.py to make<br>
use of your changes and see what happens. Thanks!<br></blockquote><div><br>=
</div></span><div>Hopefully to get what you want out of it doesn&#39;t invo=
lve too much pain...</div><div><br></div><div>I still need to finish the se=
ries of to get it ready for merging, but I&#39;ve just pushed a new branch =
ross/elf to poky-contrib which has just the patches.=C2=A0 As I clean it up=
 I&#39;ll force push there, so feel free to track/rebase/send improvements.=
</div><span class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div>Ro=
ss=C2=A0</div></font></span></div></div></div>
</blockquote></div><br></div>

--f403045fbd84cffab0055fb2c65f--
