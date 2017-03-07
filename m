Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id B7DE377832
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 16:09:00 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id 1so10981799qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 08:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0I7rSDD1frf66SSbQTJHlahlTgDH7IU8Wt6jiGibs8o=;
	b=cVGOOs+5b7AlAKIN1cVWQ+g6IGNdNQLW9tiWNjd4Lx+RSMdoHAo5zkam3uE3bYhspR
	kwRaq9kn57vvojC6hCGEncgk6TPy5QX4jekLvLQ83jqvnTP/eBwZ12uvMF9dXSDwkgN4
	HdODczNPTwUj+nPsJQUW4BAQ/yCrrZL6S9YbmD25XfC+FEesrR+o51MByjPk81KbukLt
	qGX6PZTYKDa9YHLtfUsjoCM9eCUUI3oGFcXf+owHzT5snK94SodHH5nmJmgg3ThZSNiu
	/S1gzq0UQrbAAV4mMnAdbIBXftQomKB8GUay9jH7OErV5jGq2cvG/FLeEYVL77fdIfC6
	i4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0I7rSDD1frf66SSbQTJHlahlTgDH7IU8Wt6jiGibs8o=;
	b=sBapPsKSqpS1+aC4sb8XzieL+mlv/pDquLsq6iLumwl5hvxjiHvabgv3GqM6FZxm88
	8YZfqp6rCOGplyxmq4/M1cES1HIf3g2jsF7ypMUb14ki5po9+Lt1du8Nvd0J4wvjZUo5
	UPn9VZOXeG8kyoslBzq+E9naqhpiAH0B6Wj0VrVY7sxDVOfqastxN6hxvIcwGR/I3oIV
	Vrk4Bk9fxilShZzTuZXPQ1QVB7pDmMqEss+d/1jzpb/7aL4V62nRLLFKR1qsDhciLoBS
	PvBbtCScZZI+2JnoVJfwRa5jDd4VN2Hwo9TBmKORD4QGJJh879frmFBkXKBkRTy8f5Wz
	5O4w==
X-Gm-Message-State: AMke39kc22RnclddX/ujbgT+kuWPMm8AJUulXEitx48eaReM/J7QM7JLAyAQgxgRtjEO2aH5BB33eLNBY7b5fDJH
X-Received: by 10.237.43.69 with SMTP id p63mr1318811qtd.68.1488902941021;
	Tue, 07 Mar 2017 08:09:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 7 Mar 2017 08:08:40 -0800 (PST)
In-Reply-To: <1488902424-9496-2-git-send-email-mark.hatle@windriver.com>
References: <1488902424-9496-1-git-send-email-mark.hatle@windriver.com>
	<1488902424-9496-2-git-send-email-mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Mar 2017 16:08:40 +0000
Message-ID: <CAJTo0LYToEKk_wbP0ytvd+WRZbhLK21FU2zsYFjm00t2G=5D9g@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gpgme: Fix issue building for the target
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
X-List-Received-Date: Tue, 07 Mar 2017 16:09:01 -0000
Content-Type: multipart/alternative; boundary=94eb2c124cc4e7d541054a263a72

--94eb2c124cc4e7d541054a263a72
Content-Type: text/plain; charset=UTF-8

On 7 March 2017 at 16:00, Mark Hatle <mark.hatle@windriver.com> wrote:

> gpgme failed when configuring since you can only configure for one python
> system at a time (via the inherits).  So we need to have a PACKAGECONFIG
> that defines which one [or neither] you want to use.
>
> The prior pkgconfig patch introduced the usage of the variable PKG_CONFIG,
> which is not defined anywhere.  Define this.
>
> When building the python module, we can not call gpg-error-config, so we
> need to find an alternative way of finding the information the setup.py.in
> requires.  (In this case, it's easy to just use the environment
> STAGING_INCDIR.)


| checking for swig... no
| checking for swig2.0... no
| configure: error:
| ***
| *** You need SWIG to build the Python bindings.

It must be finding a swig binary on your host.

Ross

--94eb2c124cc4e7d541054a263a72
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 March 2017 at 16:00, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><span class=3D"gmail-il">gpgme</span>=
 failed when configuring since you can only configure for one python<br>
system at a time (via the inherits).=C2=A0 So we need to have a PACKAGECONF=
IG<br>
that defines which one [or neither] you want to use.<br>
<br>
The prior pkgconfig patch introduced the usage of the variable PKG_CONFIG,<=
br>
which is not defined anywhere.=C2=A0 Define this.<br>
<br>
When building the python module, we can not call gpg-error-config, so we<br=
>
need to find an alternative way of finding the information the <a href=3D"h=
ttp://setup.py.in" rel=3D"noreferrer" target=3D"_blank">setup.py.in</a><br>
requires.=C2=A0 (In this case, it&#39;s easy to just use the environment<br=
>
STAGING_INCDIR.)</blockquote></div><br><div class=3D"gmail_extra">| checkin=
g for swig... no</div><div class=3D"gmail_extra">| checking for swig2.0... =
no</div><div class=3D"gmail_extra">| configure: error:</div><div class=3D"g=
mail_extra">| ***</div><div class=3D"gmail_extra">| *** You need SWIG to bu=
ild the Python bindings.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">It must be finding a swig binary on your host.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
></div>

--94eb2c124cc4e7d541054a263a72--
