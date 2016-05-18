Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DE8E577042
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 07:39:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w143so10437403wmw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 00:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=LztLvMAFJ3T5k+3DXGfMjQ7tPR0Pt4DVsOtMHM/MF/4=;
	b=qwS4A/XiqHQjcCIuZMyC3ehdJ/hA6oFhl0qvZmAeb8fov1R3wFSQLlp8X8uNZ737b/
	3/rj58U19QhogR0nR5ISGAbKc9BP3VfQchAPNfwErRtm0VIXJqqJZNRu1h8o+oEHfUJK
	OFJWF/g1yZ+z5VgheQhDJ1XL4twv/dRSxyFf9bGZ1XlMyeAWiW8IreDVVgqxkmO1qjX0
	Tx1E4bHo9GFJyG/eFLBzkTYeYJMKPfU+ZiAkdmMNzeX5gRjU5cgHIXSrmZlUiGxsG7KZ
	l5vsNAJAAhtTFymh2Lk9sMzfzCi8BbgLegMumKr+rqxFK9zsLUWtPrSVM1/n7wmCgoEr
	g/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=LztLvMAFJ3T5k+3DXGfMjQ7tPR0Pt4DVsOtMHM/MF/4=;
	b=TtIvwt/LZ9VX29Mb64RJL2zjg9Wv1LX6U69DZznoJytJWRwSTAim9EpoKo6xY+mMAg
	Oo4iONNluyNRXcpaGqBakos/2S8ZSq7IReO99UPolERf/IzIjK/a73o3X+SQqzCN+s/U
	hcazX+iZxpY/p67PLMCvDcvjEWB0GOph6kWSnOBvJX0MxYOjljlC5VbOZ3SHcMTIEVy9
	Il2oNWAQy4WaQBL3fffJ57BotE6gre4TEi25onl3q0E2DyWhR7z5B6SXYKADa1EIy3mY
	8Ykymh5C6Pn2CEDBniG5vkE/vwACuX1i83G6TQuptOUy4F0gfuHQv3B8ikF0xX8e8Zws
	P1bA==
X-Gm-Message-State: AOPr4FVLfEgRpTHSoBcdhTvzssLhpgoTJ8VqJOpMgIG2wGkLRBDuR/W/HLz3BM9r6ZBRYU/TsDOMlpfp0h6z9w==
MIME-Version: 1.0
X-Received: by 10.194.246.138 with SMTP id xw10mr5190858wjc.99.1463557195479; 
	Wed, 18 May 2016 00:39:55 -0700 (PDT)
Received: by 10.194.30.229 with HTTP; Wed, 18 May 2016 00:39:55 -0700 (PDT)
In-Reply-To: <573C0726.3040402@windriver.com>
References: <573C0726.3040402@windriver.com>
Date: Wed, 18 May 2016 09:39:55 +0200
Message-ID: <CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Wed, 18 May 2016 07:39:58 -0000
Content-Type: multipart/alternative; boundary=089e01227bc4becd17053318f6be

--089e01227bc4becd17053318f6be
Content-Type: text/plain; charset=UTF-8

See:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5970

Just using recipe checksum wont work, because the main reason for PR bumps
is to automatically upgrade the packages when one of the dependencies
changes .so version, which you won't detect from recipe checksum of the app
which is just using the library.

On Wed, May 18, 2016 at 8:09 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The PRServer bumps PR according to do_package's task hash, that
> causes it bumps *all* packages' PR when recipes like pseudo-native
> and rpm-native is changed. It is a very bad user experience when we
> run "smart/opkg upgrade" on running target, for example, when we apply
> a CVE patch to pseudo-native or rpm-native, or do some slight changes
> in their do_compile, "smart/opkg upgrade" will download/install *all*
> the packages since all of the packages' PR are bumped.
>
> Here are some rough suggestions to fix this problem, and please feel
> free to give your suggestions.
> 1) Do not use do_package's task for bumping PR, the easiest way
>    is simulate manually bump PR -- only bump PR when the recipe
>    itself's checksum is changed.
>
> 2) Add a new task for PRServer, redefine its task hash for bumping
>    PR, for example, this task hash only considers RDEPENDS (no
>    DEPENDS), and drop any native dependencies.
>
> I prefer the first way, and an alternative way maybe add a var so that
> the user can configure it:
> PR_CHECKSUM = "${BB_TASKHASH}" (current way)
> Or
> PR_CHECKSUM = "<recipe checksum>"
>
> --
> Thanks
>
> Robert
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e01227bc4becd17053318f6be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">See:<div><a href=3D"https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D5970">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D597=
0</a><br></div><div><br></div><div>Just using recipe checksum wont work, be=
cause the main reason for PR bumps is to automatically upgrade the packages=
 when one of the dependencies changes .so version, which you won&#39;t dete=
ct from recipe checksum of the app which is just using the library.</div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 1=
8, 2016 at 8:09 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:lie=
zhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">The PRServer bumps PR acco=
rding to do_package&#39;s task hash, that<br>
causes it bumps *all* packages&#39; PR when recipes like pseudo-native<br>
and rpm-native is changed. It is a very bad user experience when we<br>
run &quot;smart/opkg upgrade&quot; on running target, for example, when we =
apply<br>
a CVE patch to pseudo-native or rpm-native, or do some slight changes<br>
in their do_compile, &quot;smart/opkg upgrade&quot; will download/install *=
all*<br>
the packages since all of the packages&#39; PR are bumped.<br>
<br>
Here are some rough suggestions to fix this problem, and please feel<br>
free to give your suggestions.<br>
1) Do not use do_package&#39;s task for bumping PR, the easiest way<br>
=C2=A0 =C2=A0is simulate manually bump PR -- only bump PR when the recipe<b=
r>
=C2=A0 =C2=A0itself&#39;s checksum is changed.<br>
<br>
2) Add a new task for PRServer, redefine its task hash for bumping<br>
=C2=A0 =C2=A0PR, for example, this task hash only considers RDEPENDS (no<br=
>
=C2=A0 =C2=A0DEPENDS), and drop any native dependencies.<br>
<br>
I prefer the first way, and an alternative way maybe add a var so that<br>
the user can configure it:<br>
PR_CHECKSUM =3D &quot;${BB_TASKHASH}&quot; (current way)<br>
Or<br>
PR_CHECKSUM =3D &quot;&lt;recipe checksum&gt;&quot;<span class=3D"HOEnZb"><=
font color=3D"#888888"><br>
<br>
-- <br>
Thanks<br>
<br>
Robert<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--089e01227bc4becd17053318f6be--
