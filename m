Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id E1878601A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 13:14:56 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id x49so155768125qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 05:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hytuIMEujh//PSvKywDtyoQEFXDS63ziQhOFCpThNT4=;
	b=wLJXqSC3T9798mlnd20VmDDWfEmFgXcREm8BInfED0kFjZHTHb296+CL//BeGZP+5Z
	1UQvbUPeXssR6rggcKEkgwytvECrGoZEqhT4+DR94psowdDrucUH+G1Vb8UPa9Vz4U/j
	4adwlWVjQCdAD0qF4iH5bWtRUo9/dA9TvaHbQzp01xK2RcB0DCWUDQSFZe0ze+PEBH3e
	q9lmN8eZ+t3qJ2YJYzfpHvXr0UrKvwYDgWbX/bkHsPTiuxvk/u4Esmj1J+FapxfXAlR4
	Rc/fRKcH5eN6C88gDWddjrtg1ZWoDQLZN6sTk5szTcHIQXaF+xs618K2Sn5JNfp/kUqa
	0J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hytuIMEujh//PSvKywDtyoQEFXDS63ziQhOFCpThNT4=;
	b=om6nwlCMYTIjH6hH+mkmI4NAOqJjvO7i4x4pscYEWv46gQkNOhfDnmHk8j9P1b9O1u
	tvxx6dyXDT9yq9guk3pcKZaLbU+53PQEAa7EFhs5AbRi90FydYenjqvw5AUv+RRaYi7M
	FerqigwdqZXU3Zx4Syd4Gbshuqgflogofh2wpt02EAkisDtfS3RiecbBdQaSlPhQah/m
	Xdv/7PrzcaR1ODoHfE6ftIZtv0AKfu1VG73PdmF50a0agBXaXbBiLN/B74BVkR6OWS/V
	e0hgGlTnb1+wEOSoSPlbhbtODkLFnpGfDRlTMJe1tU2Vve0C6PRsKmczXaC+mgoVwW/L
	c+mg==
X-Gm-Message-State: AIkVDXIWvKFM6+Cm4zFJc9OzkuRUJek7uSfZ9pH0Y4JSLPRd+5N41eae2fXgUUGH9fZ98/fFlBqx4E3oeV4dDGPB
X-Received: by 10.55.176.194 with SMTP id z185mr34852149qke.26.1484658897085; 
	Tue, 17 Jan 2017 05:14:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 17 Jan 2017 05:14:36 -0800 (PST)
In-Reply-To: <91ce45c8-3887-70f5-2b6f-b6cc1c1ce43c@windriver.com>
References: <cover.1481014270.git.liezhi.yang@windriver.com>
	<85bd069e-f17f-fc71-d5e0-28d775df5c2c@windriver.com>
	<91ce45c8-3887-70f5-2b6f-b6cc1c1ce43c@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jan 2017 13:14:36 +0000
Message-ID: <CAJTo0LYZoAa4mHVBh45L6Fpniwt-E67ykV_5M11-cV1gF-ZR0w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/6] runqemu: fix for slirp, network device and hostfwd
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
X-List-Received-Date: Tue, 17 Jan 2017 13:14:58 -0000
Content-Type: multipart/alternative; boundary=94eb2c060ce62c8b4b05464a1642

--94eb2c060ce62c8b4b05464a1642
Content-Type: text/plain; charset=UTF-8

Hi Robert,

I merged these into my staging branch but then the autobuilder failed in an
interesting way:

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/1053/steps/Running%20Sanity%20Tests/logs/stdio

Would that be related to your series, or is it a coincidence?

Ross

On 11 January 2017 at 01:47, Robert Yang <liezhi.yang@windriver.com> wrote:

> ping.
>
> // Robert
>
>
> On 12/21/2016 02:24 PM, Robert Yang wrote:
>
>> Hi Ross,
>>
>> I rebased in the repo:
>>
>>  git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-cont
>> rib/log/?h=rbt/runqemu
>>
>> Robert Yang (6):
>>   scripts/runqemu: fix checking for <file>.cpio.gz
>>   qemuboot.bbclass: use IMGDEPLOYDIR
>>   runqemu-export-rootfs: fix inconsistent var names
>>   runqemu: support mutiple qemus running when nfs
>>   runqemu: fixes for slirp, network device and hostfwd
>>   qemuboot.bbclass: add blank lines in comments
>>
>>
>> // Robert
>>
>> On 12/06/2016 04:55 PM, Robert Yang wrote:
>>
>>> * V2
>>>   - Add QB_NETWORK_DEVICE to set network device for both slirp and tap,
>>>     the idea is from Randy and Nathan.
>>>   - Use different mac sections for slirp and tap to fix conflicts when
>>>     running both of them on the same host.
>>>
>>> * V1
>>>   - Initial version
>>>
>>> The following changes since commit 11063a01d4511b2688ea7ba2d7359e
>>> 4e07328c66:
>>>
>>>   ruby: upgrade to 2.3.1 (2016-11-30 15:47:17 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-cont
>>> rib/log/?h=rbt/runqemu
>>>
>>>
>>> Robert Yang (6):
>>>   scripts/runqemu: fix checking for <file>.cpio.gz
>>>   qemuboot.bbclass: use IMGDEPLOYDIR
>>>   runqemu-export-rootfs: fix inconsistent var names
>>>   runqemu: support mutiple qemus running when nfs
>>>   runqemu: fixes for slirp, network device and hostfwd
>>>   qemuboot.bbclass: add blank lines in comments
>>>
>>>  meta/classes/qemuboot.bbclass              |  34 ++++++--
>>>  meta/conf/machine/include/qemuboot-x86.inc |   1 -
>>>  meta/conf/machine/qemuarm64.conf           |   1 -
>>>  scripts/runqemu                            | 133
>>> ++++++++++++++++++++++-------
>>>  scripts/runqemu-export-rootfs              |  21 ++---
>>>  5 files changed, 140 insertions(+), 50 deletions(-)
>>>
>>>

--94eb2c060ce62c8b4b05464a1642
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Robert,<div><br></div><div>I merged these into my stagi=
ng branch but then the autobuilder failed in an interesting way:</div><div>=
<br></div><div><a href=3D"https://autobuilder.yoctoproject.org/main/builder=
s/nightly-ppc/builds/1053/steps/Running%20Sanity%20Tests/logs/stdio">https:=
//autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/1053/steps/=
Running%20Sanity%20Tests/logs/stdio</a><br></div><div><br></div><div>Would =
that be related to your series, or is it a coincidence?</div><div><br></div=
><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On 11 January 2017 at 01:47, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">ping.<span c=
lass=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
// Robert</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 12/21/2016 02:24 PM, Robert Yang wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Ross,<br>
<br>
I rebased in the repo:<br>
<br>
=C2=A0git://<a href=3D"http://git.openembedded.org/openembedded-core-contri=
b" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/op<wbr>enembed=
ded-core-contrib</a> rbt/runqemu<br>
<br>
<a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/=
log/?h=3Drbt/runqemu" rel=3D"noreferrer" target=3D"_blank">http://cgit.open=
embedded.org/c<wbr>git.cgi/openembedded-core-cont<wbr>rib/log/?h=3Drbt/runq=
emu</a><br>
<br>
Robert Yang (6):<br>
=C2=A0 scripts/runqemu: fix checking for &lt;file&gt;.cpio.gz<br>
=C2=A0 qemuboot.bbclass: use IMGDEPLOYDIR<br>
=C2=A0 runqemu-export-rootfs: fix inconsistent var names<br>
=C2=A0 runqemu: support mutiple qemus running when nfs<br>
=C2=A0 runqemu: fixes for slirp, network device and hostfwd<br>
=C2=A0 qemuboot.bbclass: add blank lines in comments<br>
<br>
<br>
// Robert<br>
<br>
On 12/06/2016 04:55 PM, Robert Yang wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
* V2<br>
=C2=A0 - Add QB_NETWORK_DEVICE to set network device for both slirp and tap=
,<br>
=C2=A0 =C2=A0 the idea is from Randy and Nathan.<br>
=C2=A0 - Use different mac sections for slirp and tap to fix conflicts when=
<br>
=C2=A0 =C2=A0 running both of them on the same host.<br>
<br>
* V1<br>
=C2=A0 - Initial version<br>
<br>
The following changes since commit 11063a01d4511b2688ea7ba2d7359e<wbr>4e073=
28c66:<br>
<br>
=C2=A0 ruby: upgrade to 2.3.1 (2016-11-30 15:47:17 +0000)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/ope<wbr>nembe=
dded-core-contrib</a> rbt/runqemu<br>
<br>
<a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/=
log/?h=3Drbt/runqemu" rel=3D"noreferrer" target=3D"_blank">http://cgit.open=
embedded.org/c<wbr>git.cgi/openembedded-core-cont<wbr>rib/log/?h=3Drbt/runq=
emu</a><br>
<br>
<br>
Robert Yang (6):<br>
=C2=A0 scripts/runqemu: fix checking for &lt;file&gt;.cpio.gz<br>
=C2=A0 qemuboot.bbclass: use IMGDEPLOYDIR<br>
=C2=A0 runqemu-export-rootfs: fix inconsistent var names<br>
=C2=A0 runqemu: support mutiple qemus running when nfs<br>
=C2=A0 runqemu: fixes for slirp, network device and hostfwd<br>
=C2=A0 qemuboot.bbclass: add blank lines in comments<br>
<br>
=C2=A0meta/classes/qemuboot.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 34 ++++++--<br>
=C2=A0meta/conf/machine/include/qem<wbr>uboot-x86.inc |=C2=A0 =C2=A01 -<br>
=C2=A0meta/conf/machine/qemuarm64.c<wbr>onf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 133 ++++++++++++++++++++++-=
------<br>
=C2=A0scripts/runqemu-export-<wbr>rootfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 21 ++---<br>
=C2=A05 files changed, 140 insertions(+), 50 deletions(-)<br>
<br>
</blockquote></blockquote>
</div></div></blockquote></div><br></div>

--94eb2c060ce62c8b4b05464a1642--
