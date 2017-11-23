Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id BB33278590
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 11:58:59 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id i38so26418081iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 03:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9Ow3bqhnBe9pak7GjLPDvk0p+JZ9Qw168KJFN/+l/eE=;
	b=deV44xfJUDKIEO/3ep/a615P7bP7v8VKh6RbFsLmv8SP85VGaZMO53KMXWEp7P4dAC
	iXinvkWKTDG/wg51S+gy8G+3Q1wiDNBeuowkZG98WUvXW4NMypXHu1qV7gvENlgpXZqM
	yiydP66EXvGrJcIXosepXkB8k8V85VWgSwNZpNbbbKBvLlx+Y7YHpoZZ/EozYBrH/wLe
	RzQkQ87PfwjWMCVk8FlKHlwAvjV2j8BHzGsQkkjg+obVhk0OH2BtpOlCAuQjhxkZeP0X
	XBTyC/IxQGXHiLFpqvBI2EapPezle1xUt+Qw3CeD95Lfvbmy3FQuQOe4sZm0cUsPYYEu
	tW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9Ow3bqhnBe9pak7GjLPDvk0p+JZ9Qw168KJFN/+l/eE=;
	b=ULy6S75kt34ceNK7yXaJbSN0wE9Liqm0xX5m9+Q58RJGtXXn/py8eYGPxcG4Y7TjIt
	v1YtypuOEQUw7CyKQ+AQX02LNuQKXi0NypA6uGbmFjgqpOb9Ptp+M3BPGsXG7KyaqVLt
	06MlHWy5gT197OFNiIkDMX9JPzf6dtUL1uPMujTVNVVrl4qqpHSNhbV0ICw8AT/fbdK/
	U6tx6Lk53q9Ztb6qJnv3F/TQXS6xMqJfRozHKKbQ+8fizHLygAkBM3+cOdcXbC4QWf4/
	mXdLvhp6GDojfCbF470uJlsJ1/qJwoOUSMbtLull8roMzI3IYB3+OuIGykyas9WvLWqs
	k5xw==
X-Gm-Message-State: AJaThX5b4wd4mdQdtJUNyGSWuOH4qWV5MMwcTdL9k40wJIU/qG98Vx64
	jSCOMWcSUqOb5hKGk3AoBbBDPWxtWFhLYb8v8M+fRQ==
X-Google-Smtp-Source: AGs4zMbYFJZSaVTvahLk7mFU5OMJqZIJiglPpk0ctJHjQuozbcks0gT1hQ4MaTnRfzQyIgZw/v0PM3PMPZ7q+p9UrtM=
X-Received: by 10.107.133.94 with SMTP id h91mr26508123iod.208.1511438341187; 
	Thu, 23 Nov 2017 03:59:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Thu, 23 Nov 2017 03:58:40 -0800 (PST)
In-Reply-To: <CAJ86T=Wd0wCJbRAS+H3kDC2tg+51UsY_KwRjZKq46VEK+Y0NdA@mail.gmail.com>
References: <1511163855-163322-1-git-send-email-zhixiong.chi@windriver.com>
	<CAJTo0LY=Wii9Ys1R1Ny3U3X1T-J=MgVCXXDA7d4HH6n5vLtqcw@mail.gmail.com>
	<CAJ86T=Wd0wCJbRAS+H3kDC2tg+51UsY_KwRjZKq46VEK+Y0NdA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Nov 2017 11:58:40 +0000
Message-ID: <CAJTo0LbAMCEPOwE9SHNbtuGuO=63GHP8wYh3O9jG27U3xJKNAA@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: malloc: Add missing arena lock in malloc_info
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
X-List-Received-Date: Thu, 23 Nov 2017 11:59:00 -0000
Content-Type: multipart/alternative; boundary="001a113ffc906d3ff6055ea52939"

--001a113ffc906d3ff6055ea52939
Content-Type: text/plain; charset="UTF-8"

Thanks Andre.  There's a glibc 2.26 upgrade pending and this doesn't apply
on top of that, can you rebase?  poky-contrib:ross/mut2 is where I'm
staging the toolchain updates.

Ross

On 22 November 2017 at 00:50, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Nov 21, 2017 at 3:05 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > What glibc release is this in?  We've an upgrade patch pending that
> bumps it
> > to 77f921dac17c5fa99bd9e926d926c327982895f7.
>
> It's currently in the glibc master branch only (ie hasn't been
> backported to the 2.26 release branch).
>

--001a113ffc906d3ff6055ea52939
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Andre.=C2=A0 There&#39;s a glibc 2.26 upgrade pendi=
ng and this doesn&#39;t apply on top of that, can you rebase? =C2=A0poky-co=
ntrib:ross/mut2 is where I&#39;m staging the toolchain updates.<div><br></d=
iv><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On 22 November 2017 at 00:50, Andre McCurdy <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On=
 Tue, Nov 21, 2017 at 3:05 PM, Burton, Ross &lt;<a href=3D"mailto:ross.burt=
on@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; What glibc release is this in?=C2=A0 We&#39;ve an upgrade patch pendin=
g that bumps it<br>
&gt; to 77f921dac17c5fa99bd9e926d926c3<wbr>27982895f7.<br>
<br>
</span>It&#39;s currently in the glibc master branch only (ie hasn&#39;t be=
en<br>
backported to the 2.26 release branch).<br>
</blockquote></div><br></div>

--001a113ffc906d3ff6055ea52939--
