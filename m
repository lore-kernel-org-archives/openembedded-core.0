Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id A107360762
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 10:57:43 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id f89so18096495ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 03:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zS0yLf1uxc9OlaXZ1xSa66vbi04SkMldX5VHPsN63S8=;
	b=NjM3UdHaU11zGXUMffKAfKHDVANivxKboe7sxQvFMUfioXld7J+qoHZYaE6ljnWVyA
	UGRcrba/R6/DoR3RheWdd7Wmh23Ilnqp1l2TF4RpHiaSJRHRKM/6AYnYEHRFtyQdvi7c
	GZlDya7KBOUCEgdRQX+m0rXuEu7Ej/DQnU4J9hGs4hj/jq6JaaVMuaAaDd+ElcKUCyET
	wXcMlfadvyqP0Jl80LUxz1YxzIYIExGh9ladB1Ql6RlIxGe1kdBO6vRLPXzYBS55jLow
	gCHUk52cGTuKHQHA3XkBCvxE1K+vgqxryASX4BsiS5xm1Rbbxqp96gyHGKiwqZmtwAo+
	QYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zS0yLf1uxc9OlaXZ1xSa66vbi04SkMldX5VHPsN63S8=;
	b=AA2ETEz4w7eLcWWm9fHK0v+0kqS29TmC9CeI0Gubm76lY2MFszWhULf/T4UCfUi+el
	ZbiDLLtlegi4pKoTKoFh/KvCnpYd4skKLqRlg/4OXe/M3FDpfYpCqZruqQhWINnu2Bg5
	eN/Ct9jO2rtIQgOhcKvouCzY8UvOeaGVbHWApTBlYuea/vB/DDUautYBf18eB8I+XKtJ
	6oqsHg6bEG5Z2dTVcRTiquqSZ/lPHrmkXzISsU7axPL6fIKJdIblHMy3RZf6E0WJTkrU
	9pVd5mpD6guzYUtu9QHdDDJc9mfrGnMLXU3YJoY1m2StbhocrTjHsVIXptfaoXS7ZqR6
	peaA==
X-Gm-Message-State: AOPr4FU1/tl5u2Pj6GZ++bsEfdXLBLblH42kdOIW6TzsMQZ9oDaiEvkpakAHKd60Go/bdQBOiGWGf+ztrtwVej72
X-Received: by 10.36.57.211 with SMTP id l202mr412816ita.22.1463482663586;
	Tue, 17 May 2016 03:57:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 17 May 2016 03:57:24 -0700 (PDT)
In-Reply-To: <1462841284-7345-3-git-send-email-ruslan@babayev.com>
References: <1462841284-7345-1-git-send-email-ruslan@babayev.com>
	<1462841284-7345-3-git-send-email-ruslan@babayev.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 May 2016 11:57:24 +0100
Message-ID: <CAJTo0LYFUgs=ngGZOKRCW-98+1=Tggt3ucjX1xOqfNbT7mKd4A@mail.gmail.com>
To: Ruslan Babayev <ruslan@babayev.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] edgerouter: libffi: fix build with soft-float tune
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
X-List-Received-Date: Tue, 17 May 2016 10:57:43 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca4c898f0533079cdf

--001a114ab3ca4c898f0533079cdf
Content-Type: text/plain; charset=UTF-8

On 10 May 2016 at 01:48, Ruslan Babayev <ruslan@babayev.com> wrote:

> +Index: libffi-3.2.1/src/mips/n32.S
> +===================================================================
> +--- libffi-3.2.1.orig/src/mips/n32.S
> ++++ libffi-3.2.1/src/mips/n32.S
> +@@ -30,7 +30,7 @@
> +
> + /* Only build this code if we are compiling for n32 */
> +
> +-#if defined(FFI_MIPS_N32)
> ++#if defined(FFI_MIPS_N32) && !defined(__mips_soft_float)
> +
> + #define callback a0
> + #define bytes  a2
>

This patch needs a header saying what it does, your Signed-off-by, and an
Upstream-Status.

Also these patches are for meta-yocto-bsp, so should be sent to
poky@yoctoproject.org.

Ross

--001a114ab3ca4c898f0533079cdf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 May 2016 at 01:48, Ruslan Babayev <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ruslan@babayev.com" target=3D"_blank">ruslan@babayev.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":8mv" class=3D"a3s aX=
jCH">+Index: libffi-3.2.1/src/mips/n32.S<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- libffi-3.2.1.orig/src/mips/n32.S<br>
++++ libffi-3.2.1/src/mips/n32.S<br>
+@@ -30,7 +30,7 @@<br>
+<br>
+ /* Only build this code if we are compiling for n32 */<br>
+<br>
+-#if defined(FFI_MIPS_N32)<br>
++#if defined(FFI_MIPS_N32) &amp;&amp; !defined(__mips_soft_float)<br>
+<br>
+ #define callback a0<br>
+ #define bytes=C2=A0 a2</div></blockquote></div><br>This patch needs a hea=
der saying what it does, your Signed-off-by, and an Upstream-Status.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also these p=
atches are for meta-yocto-bsp, so should be sent to <a href=3D"mailto:poky@=
yoctoproject.org">poky@yoctoproject.org</a>.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114ab3ca4c898f0533079cdf--
