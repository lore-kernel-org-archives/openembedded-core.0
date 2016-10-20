Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id B63E8600EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 10:25:23 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id q7so47693535qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 03:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O5dQ/5rQ2noYwGV+C4GJe7Lod0xHkg3lVelyCwSZ7TE=;
	b=e8mISVId4uVZBe2Qy7a+R6DGW9+u2GdSwY1ocjDUKxcTKFzGwSxpNdd/M73h1xP1nj
	GV07h+zTVj+5+pq5637xjZ4O0m6UnaRnwrOhRx6TZd+pbRFWxEOVvfq59LnAZl59ZcKb
	0gCyRM311Uvd4EzXeu5Mwll0c/QHDHEbKcU3TMuf3dFPrDuDBlMC3XFlTdxYohrs5LWg
	2d+h74+af9YkwBdK1/EcfynctI29v6F03A2EgxvPWvpitLX65wXSTKnaMkzwaUMrqk/t
	Hoazm7riurPmKBN8OvDM0bpy1qSX+u1jcV52XlMERwDS4UXK7LkIAQ9vNnDRzoH+SSle
	eODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O5dQ/5rQ2noYwGV+C4GJe7Lod0xHkg3lVelyCwSZ7TE=;
	b=A2rjwa7enXs5NzeAcNJAzilbsliBf0vVl7Cb/4q5DZ7WZNv3JUJVTb/jjJPLL0ntoc
	KejWCrcCflmjltpa0s/8yjJSZDgFHIbBxl+R/gTvneDIEx3IeJmKf9YZxKxOWwPrQrQy
	h7sxuCfIOfnULzwG2sxvn2sL/k8SeMElpkixDgK5ygFyM8iar6Dt9vATmzIphymCzOsm
	bvfZmvL3zhYGwJ+uP8gJFJ7LV5G9vlC/wOkC8JP2a3akAFMbYU9/y7j4oj2T7TkvTGq5
	hzSXZ9MZ4KE1PQwKgn59aXPWusFep0p74CsQnh5Sv39RL5DL36RZfbAIpiVs6owooJgP
	Pm3A==
X-Gm-Message-State: AA6/9RkBQBZ25U8YtjC7RGMBGfYaRlkPuoYLTPmTtOxACjgChW45s5WwC+BmnQri7IYFqXmrkiCpNqIvmqF3WxDk
X-Received: by 10.200.33.201 with SMTP id 9mr11019151qtz.141.1476959124640;
	Thu, 20 Oct 2016 03:25:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 20 Oct 2016 03:25:04 -0700 (PDT)
In-Reply-To: <20161018011619.31677-1-raj.khem@gmail.com>
References: <20161018011619.31677-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Oct 2016 11:25:04 +0100
Message-ID: <CAJTo0LYRSTcdNKyj6oq=r0+a6ivSqWpsJaJ=zPHVGQ7DTChdnw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnutls_3.5.3.bb: Fix native build on distro with kernel < 3.4.17
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
X-List-Received-Date: Thu, 20 Oct 2016 10:25:23 -0000
Content-Type: multipart/alternative; boundary=001a11403834f8fee8053f495769

--001a11403834f8fee8053f495769
Content-Type: text/plain; charset=UTF-8

On 18 October 2016 at 02:16, Khem Raj <raj.khem@gmail.com> wrote:

> When using distros which use old kernels gnutls fails to build
> due to missing SYS_getrandom, therefore we need to check for this
> before using it.
> Fixes errorr e.g.
>
> | ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c: In function
> 'have_getrandom':
> | ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c:59:42: error:
> 'SYS_getrandom' undeclared (first use in this function)
> |  #  define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst,
> (size_t)s, (unsigned int)flags)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Alex's upgrade makes this redundant for master, but I suspect you'll want
to re-send it when we have a Morty maintainer.

Ross

--001a11403834f8fee8053f495769
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 October 2016 at 02:16, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":206" class=3D"a3s aXjC=
H m157d55d0e605dfe5">When using distros which use old kernels <span class=
=3D"il">gnutls</span> fails to build<br>
due to missing SYS_getrandom, therefore we need to check for this<br>
before using it.<br>
Fixes errorr e.g.<br>
<br>
| ../../../<span class=3D"il">gnutls</span>-3.5.3/lib/<wbr>nettle/rnd-linux=
.c: In function &#39;have_getrandom&#39;:<br>
| ../../../<span class=3D"il">gnutls</span>-3.5.3/lib/<wbr>nettle/rnd-linux=
.c:59:42: error: &#39;SYS_getrandom&#39; undeclared (first use in this func=
tion)<br>
|=C2=A0 #=C2=A0 define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*=
)dst, (size_t)s, (unsigned int)flags)<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;</div></blockquote></div><br>Alex&#39;s upgrade makes this=
 redundant for master, but I suspect you&#39;ll want to re-send it when we =
have a Morty maintainer.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a11403834f8fee8053f495769--
