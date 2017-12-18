Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 654306093E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 11:29:01 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id f190so27181882ita.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 03:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=vMduyrKXBou4dfLyiMs068o5yG+O/IG6GJfKjOpzJWc=;
	b=JZCTSlvrE3fKYHVpXI4cnWMw93/ZS7fRxbuWSDPoUJyEjAYlMwFnYzNSKQSVMfXMH/
	Q8z++jGouqVzfS+NXRlJTgdr+ip7AJ78klt7S4cmQ67tINknKvb8aEP3cKzualsWDizv
	5xyVGkgJRryV9u1Yqv3s2df/Q3y40ISmZjxbsCbn44qiLcg/yQ5WqaKkOqgzPasJ+J2o
	pcDVBb+gdu63iqbksqjMQAzRCemLiIkbpnV1vVdKfLXx5ZBz4OCQQt9EQvlPAIfONdY1
	deVxSXd2Jx/OJAoS9HZZJwN6rG6a7+nQHlT8s3ZRAZoMKbKmuMgvmikc8X7cEfZeAQtj
	H39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=vMduyrKXBou4dfLyiMs068o5yG+O/IG6GJfKjOpzJWc=;
	b=USvn+RotlhLAnbO71h7C7pmlGy0VxM500XQ1cJcveDq6YLBKdgEcI6NrcyTUsk2Q6T
	E91Hu0A7Nq4pA0nMY+BojMjNMEnNjRxc2z/zTBvnos4kTj8fu8dhvJ7cqlLnb+4sXCBj
	ylISmVo4w5VNlmZoymrWzz5w1APHmurGNLyNkHTwILssJquABeGWsWyofxguTE2Vf7eK
	cPtKazuhjsm1tZ6QXZ/tbQdk36wrz+9Rd6+xidPBF4R6w6Niknh5UmG3BDizhIfdRKM5
	zXbC++d0HdW8Nih+e7yKRJ59JV+H0cMrYiFj2gQFFx4Dpni26j0JdW2tEh/yfYa6LJZE
	0qFw==
X-Gm-Message-State: AKGB3mKRll5FRg760Awk/5sog7Wf6dwmzrxIoOufbKILBRyl4x7koIMN
	tAdxQBbjHjVM7zKaFRb0s8IAmyt0BvLb14qLVH35wA==
X-Google-Smtp-Source: ACJfBotcIJU7+gvu2O4yUGh3dxvNqDACkfa4CoXEZJuVXcYsYbNoLixd4MxGJ66M7S2YalyKaNmg/P74MgOrheFPVqA=
X-Received: by 10.36.93.5 with SMTP id w5mr19216843ita.124.1513596542729; Mon,
	18 Dec 2017 03:29:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Mon, 18 Dec 2017 03:28:42 -0800 (PST)
In-Reply-To: <20171218110602.ppicezmskdv5emkq@axis.com>
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-6-olofjn@axis.com>
	<CAJTo0LbrTAEyXgB=RxQNcjUObG-cEMfwMxdPXW22GZuc3YTCOQ@mail.gmail.com>
	<20171204153001.enqgfe27iapaoftl@axis.com>
	<CAJTo0LamaocQdf-kAKHw-0OZs7ZZ4uMfV598cJiJxFV+R=PaBA@mail.gmail.com>
	<CAJTo0LYemQ16EavmwCLa4PYZQHbg12BSDgiCEZomx1YSRV7Rwg@mail.gmail.com>
	<20171218110602.ppicezmskdv5emkq@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Dec 2017 11:28:42 +0000
Message-ID: <CAJTo0LaHRrqqXp6S5oni-mGVnBZvUYX68VUQd8EsemyLV3rM9g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 18 Dec 2017 11:29:01 -0000
Content-Type: multipart/alternative; boundary="001a1143f14c43603605609ba859"

--001a1143f14c43603605609ba859
Content-Type: text/plain; charset="UTF-8"

On 18 December 2017 at 11:06, Olof Johansson <olof.johansson@axis.com>
wrote:

> I'm so sorry, I missed your email; I am, but maybe not as quickly
> as you are able to(?). My is_stripped looks kind of like yours,
> but without the ShType.progbits. Thanks for the suggestion! I
> were able to hackishly integrate the Elf class it with
> staging.bbclass and package.bbclass.
>
> I did have a couple of questions; if I were to add an is_stripped
> method, would that fit best in the Elf class itself or in some
> wrapper?  Would renaming the elf class to "ElfParser" class make
> more sense, and have an ELF class that wraps it? I can publish a
> draft somewhere later today.
>

The Elf class is generated with kaitai struct so I'm trying to reduce the
number of changes to it, but we can definitely move it into a subpackage
like oe.parsers.elf and then have oe.elf for just the utility method.

Ross

--001a1143f14c43603605609ba859
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 December 2017 at 11:06, Olof Johansson <span dir=3D"=
ltr">&lt;<a href=3D"mailto:olof.johansson@axis.com" target=3D"_blank">olof.=
johansson@axis.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I&#39;m so sorry, I m=
issed your email; I am, but maybe not as quickly<br>
as you are able to(?). My is_stripped looks kind of like yours,<br>
but without the ShType.progbits. Thanks for the suggestion! I<br>
were able to hackishly integrate the Elf class it with<br>
staging.bbclass and package.bbclass.<br>
<br>
I did have a couple of questions; if I were to add an is_stripped<br>
method, would that fit best in the Elf class itself or in some<br>
wrapper?=C2=A0 Would renaming the elf class to &quot;ElfParser&quot; class =
make<br>
more sense, and have an ELF class that wraps it? I can publish a<br>
draft somewhere later today.<br></blockquote><div><br></div><div>The Elf cl=
ass is generated with kaitai struct so I&#39;m trying to reduce the number =
of changes to it, but we can definitely move it into a subpackage like oe.p=
arsers.elf and then have oe.elf for just the utility method.</div><div><br>=
</div><div>Ross=C2=A0</div></div></div></div>

--001a1143f14c43603605609ba859--
