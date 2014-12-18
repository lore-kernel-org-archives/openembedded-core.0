Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id DF87E7289E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 17:13:48 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q108so1169859qgd.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 09:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vH4N/DAzxmCZtp6gQsxkhahv7H8e6cHAkxmfuUNGDcs=;
	b=C5grHrXTRbpDVJZsMQfMs7iy79IAqRz6XfTNK64ZiXQXPu202+oYA9uQXC6KBHIdho
	sqgloay4Rib4ZurhI/m+s5W8CyS+l6XqhuyZUVjgBn2pNKfLh4PTF+nsPWnM7ladH69T
	lB0Lm6CE/O7PXijF9A8D6br+Lwc8oLtrT8BrKg6MAdkFt6lGAPPzqcnyAhs8WXhP8/Dx
	L6AZi4uTpHgfw9t7V+PvnD0T1aJMVqSDaVDr0KCp0FUQK5N6O/WD4BSat1KBGhV2FH4G
	KAZ9arXPmDkwdnP5Bn8jybrr1nWxOENf5U/et63VzjrSTgn6K2LNRKrSnwhUW6dto8Oq
	vO+w==
X-Gm-Message-State: ALoCoQlxMv58pxsreyCHDQsryJA0Kwl+EDoMBlOnpckQC0s17S39kTE+KIfWuPNWuU9SfAPbAMFG
X-Received: by 10.140.102.144 with SMTP id w16mr5122647qge.59.1418922828634;
	Thu, 18 Dec 2014 09:13:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 18 Dec 2014 09:13:28 -0800 (PST)
In-Reply-To: <b18c4c9970004784d031a0776245fad792fc6a28.1418220684.git.bruce.ashfield@windriver.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
	<b18c4c9970004784d031a0776245fad792fc6a28.1418220684.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 17:13:28 +0000
Message-ID: <CAJTo0Lb3-sYAyMreFv2AFhEo4Ejzmg3eDYOs6avJMjVO5SVjOQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] linux-libc-headers: update to 3.17
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
X-List-Received-Date: Thu, 18 Dec 2014 17:13:53 -0000
Content-Type: multipart/alternative; boundary=001a11c16bc22a3c61050a80b72d

--001a11c16bc22a3c61050a80b72d
Content-Type: text/plain; charset=UTF-8

On 10 December 2014 at 14:16, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:
>
> -LINUXLIBCVERSION ?= "3.16"
> +LINUXLIBCVERSION ?= "3.17"
>

So this is causing (at least) socat to fail to build as the configure
script does a test for a working <linux/errqueue.h> but that is now failing:

/data/poky-master/tmp/sysroots/nuc/usr/include/linux/errqueue.h:33:18:
error: array type has incomplete element type

Line 33 is this member in a struct:

   struct timespec ts[3];

Presumably everything else that includes that header also includes
something that defines struct timespec.  Socat has a missing feature check
so whilst the configure test says that linux/errqueue.h isn't present and
continues, the build then fails.  Presumably the user-space
linux/errqueue.h needs another #include?

Ross

--001a11c16bc22a3c61050a80b72d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 December 2014 at 14:16, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@w=
indriver.com</a>&gt;</span> wrote:<blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div class=3D"">-LINUX=
LIBCVERSION ?=3D &quot;3.16&quot;<br>
+LINUXLIBCVERSION ?=3D &quot;3.17&quot;</div></blockquote></div><br>So this=
 is causing (at least) socat to fail to build as the configure script does =
a test for a working &lt;linux/errqueue.h&gt; but that is now failing:<br><=
br>/data/poky-master/tmp/sysroots/nuc/usr/include/linux/errqueue.h:33:18: e=
rror: array type has incomplete element type<br><br>Line 33 is this member =
in a struct:<br><br>=C2=A0 =C2=A0struct timespec ts[3];<br><br>Presumably e=
verything else that includes that header also includes something that defin=
es struct timespec.=C2=A0 Socat has a missing feature check so whilst the c=
onfigure test says that linux/errqueue.h isn&#39;t present and continues, t=
he build then fails.=C2=A0 Presumably the user-space linux/errqueue.h needs=
 another #include?<br><br>Ross<br></div></div>

--001a11c16bc22a3c61050a80b72d--
