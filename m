Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2963A71C72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 22:34:44 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id h123so45302041qke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 15:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uh62Az4510GcOTHvCqHC/6CzEOpRMrODrkPivIPNiTw=;
	b=Fe6OEq4N6frj23FgVK9D9N3+cQbSl5tfPhBXbnsnHr4kPg6bxEF97MXtPXTogBmYUs
	Cm4EjbzFxDqnecBRf1NHNEZtGSd4vcTnqYM4EoXb8wTqf1Rq5Vk1TxXXdzvLl1U6KSbg
	zWZIvdGUMdwPiwKU+ciHEPURsQEYPaMT2Gu40mXU82xW9KB+zgANDwa1tVg9sHMgxb5Z
	Cm7qLqcshwvj83O8/zy/WxbiTs057FDBUm7IFPKF/LDMmqNssAH6tM7JdR6FEqO8qRYJ
	SnaTzsKPs2MOVtwM8JypvGpMmeQ2wQ3xV9Z1mSfQUu+8qFepgiPoqVeDqd+tYnjdjVPe
	rEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uh62Az4510GcOTHvCqHC/6CzEOpRMrODrkPivIPNiTw=;
	b=AcvTWYk8QdWoNpWSQDXKD9rGds6Czm2GKcYJ+JYv7kojr/28oUkmemBPR5/80PK+ro
	ruX6INcofHoNk5Hx4TOIK+KYqj8YdbPp3f53gffoWiYVVHEfaJAMHBaPG4ZL0JgNZeDj
	6rWXtqzT+GUN5XjBxQhgeC0WSnGFl58wwKmL3JXz70w50rIhWTs6e5+B/37A9C8vevfQ
	vPxMFEW6/E/xXtGoG08iBKX3940NDpM2K1lYoWnJWpsuueUKdU4ueXY36d3vUOtaDONj
	EjK1UMxkaIWuIYptJTBU0aL+phZ984DlLd3Xf6mF0jsEQ0FHjwaJvz+HXqxpw808HsNx
	YhAw==
X-Gm-Message-State: AN3rC/5tD4Z+D1xuitN2CoWu3MJVoo9zrBkdt456S1aDJQKik1P1M/+X
	7JKzWrVRC4fr/5MXgtwOslRkDvXxWzP6VOQ=
X-Received: by 10.55.17.224 with SMTP id 93mr25263110qkr.244.1493073286105;
	Mon, 24 Apr 2017 15:34:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 15:34:25 -0700 (PDT)
In-Reply-To: <20170421210948.2656-1-raj.khem@gmail.com>
References: <20170421210948.2656-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 23:34:25 +0100
Message-ID: <CAJTo0LYL1QxkdLi6y=DKe7mMoHF8U34ZDzNbUKY1+or1xxrWyw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] grub: Fix build with gcc7
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
X-List-Received-Date: Mon, 24 Apr 2017 22:34:46 -0000
Content-Type: multipart/alternative; boundary=001a1135cbccd7bcf6054df1367d

--001a1135cbccd7bcf6054df1367d
Content-Type: text/plain; charset=UTF-8

On 21 April 2017 at 22:09, Khem Raj <raj.khem@gmail.com> wrote:

> backport patches from upsteam and adapt them to 2.0 codebase
>

This fails for me (and the autobuilders) in grub-core/video/i386/pc/vbe.c
which was fixed upstream in 2015 and the file hasn't been touched since.

This makes me wonder why are we building code that was released before
then, and is VBE still a thing?  Last time I remember seeing those letters
was around 2000 on my new Pentium...

Fix those and now it fails for me in:

 ../../grub-2.00/grub-core/loader/i386/pc/linux.c: In function
'grub_cmd_linux':
| ../../grub-2.00/grub-core/loader/i386/pc/linux.c:254:9: error: this
statement may fall through [-Werror=implicit-fallthrough=]
|    shift += 10;
|    ~~~~~~^~~~~
| ../../grub-2.00/grub-core/loader/i386/pc/linux.c:255:8: note: here
|         case 'm':
|         ^~~~
| ../../grub-2.00/grub-core/loader/i386/pc/linux.c:256:9: error: this
statement may fall through [-Werror=implicit-fallthrough=]
|    shift += 10;
|    ~~~~~~^~~~~
| ../../grub-2.00/grub-core/loader/i386/pc/linux.c:257:8: note: here
|         case 'k':
|         ^~~~

Clearly there's some build difference between our configurations. Are you
building grub-git instead of grub_2.00?  Should we delete grub_2.00 if its
that old?  I'd say that it looks good for a new upstream 2.02 release as
there is a 2.02-rc2 tagged just six weeks ago, but 2.02-beta1 was tagged
three years ago...

Ross

--001a1135cbccd7bcf6054df1367d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 April 2017 at 22:09, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,20=
4,204);padding-left:1ex"><div id=3D"gmail-:235" class=3D"gmail-a3s gmail-aX=
jCH gmail-m15b925a4c4ccc42a">backport patches from upsteam and adapt them t=
o 2.0 codebase<br></div></blockquote></div><br>This fails for me (and the a=
utobuilders) in grub-core/video/i386/pc/vbe.c which was fixed upstream in 2=
015 and the file hasn&#39;t been touched since.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">This makes me wonder why are we b=
uilding code that was released before then, and is VBE still a thing?=C2=A0=
 Last time I remember seeing those letters was around 2000 on my new Pentiu=
m...</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">F=
ix those and now it fails for me in:</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra"><div class=3D"gmail_extra">=C2=A0../../grub-=
2.00/grub-core/loader/i386/pc/linux.c: In function &#39;grub_cmd_linux&#39;=
:</div><div class=3D"gmail_extra">| ../../grub-2.00/grub-core/loader/i386/p=
c/linux.c:254:9: error: this statement may fall through [-Werror=3Dimplicit=
-fallthrough=3D]</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0shift +=3D =
10;</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0~~~~~~^~~~~</div><div cl=
ass=3D"gmail_extra">| ../../grub-2.00/grub-core/loader/i386/pc/linux.c:255:=
8: note: here</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 case &#39;m&#39;:</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^~~~</div><div class=3D"gmail_extra">| ../../grub-2.00/grub-core/loa=
der/i386/pc/linux.c:256:9: error: this statement may fall through [-Werror=
=3Dimplicit-fallthrough=3D]</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0=
shift +=3D 10;</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0~~~~~~^~~~~</=
div><div class=3D"gmail_extra">| ../../grub-2.00/grub-core/loader/i386/pc/l=
inux.c:257:8: note: here</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 case &#39;k&#39;:</div><div class=3D"gmail_extra">| =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^~~~</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Clearly there&#39;s some build difference between our c=
onfigurations. Are you building grub-git instead of grub_2.00?=C2=A0 Should=
 we delete grub_2.00 if its that old?=C2=A0 I&#39;d say that it looks good =
for a new upstream 2.02 release as there is a 2.02-rc2 tagged just six week=
s ago, but 2.02-beta1 was tagged three years ago...</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a1135cbccd7bcf6054df1367d--
