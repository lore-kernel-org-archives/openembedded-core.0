Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id B5F6971A21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:37:43 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id r142so34902543qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CMvK6OdUyf9sgeNPEHA+ZSdDrrL3ONVvvw9AoC16R5A=;
	b=B0eylJf48Le7RP3dombOC6FlEolakAIJJ/ncBXuWibUKApTs4u7Dfej/QLryofP7wY
	EfnlMPOvv6bxuD2aNEMPfEjuHY79HG+qy+N3/R5axtaNfuIl2UOYIywNS6PSlRFzfo0J
	TS4vDcZQcGC3BAomb8KviCTfftXYs7WuXVCKgk6TzFkfST/6ovZGljYjBYmEaSjlDkmU
	rpx1QI5BFiW87q0w4a9NEUspRbdEnvtYBr9dYNCUHDouwkogdIzGZyWsPYTv+fiS+i9Q
	zzWoo+QWOE2PgBhoZUmamFYexAPHve/mK29ChglqLWyxPpL3b45SYUos+AymDa01Ieq5
	xwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CMvK6OdUyf9sgeNPEHA+ZSdDrrL3ONVvvw9AoC16R5A=;
	b=iMLnorZGUfzNg/0eR09qqY/mZARhSrhuSaMP3pQpX0wPpQmBYo2EmXS3Gk5Y1aOy6H
	9m/k0wA1h6BvC8Jf/uFKQ3lbnpb8ZfVYYCN8VJxfUekj+lmaxaYhqsVFBHQ4ctcYWfNe
	z1EJrWwJS9O15jDqeJnd9plw92mV5D8n7gjCeG1dfgBlRsSrt4hIknJteRN0slJx9BfV
	8CEksG7oqaid1HwgTil8OXMb89AVzFRgEEnCFIxdC5+/+jPVNFQcNAcYiYxBBZccmI0k
	Wgd+szIAX1wAN8m+53wdJHf6/si29TvE/rkLYNmgPPRe8Nlu1wRZ3AnBQiRQbghOlGrp
	vqjw==
X-Gm-Message-State: AFeK/H1aZWyFDuIpVOWPZqz+R58AVy/H8aAE0rFnpIxAxw0oo7wI8FQPAw6mQv8tjOmW6avxlrKNAHZgCCTX1E1B
X-Received: by 10.55.47.4 with SMTP id v4mr24727063qkh.77.1490704662902; Tue,
	28 Mar 2017 05:37:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 28 Mar 2017 05:37:22 -0700 (PDT)
In-Reply-To: <c03b3d4d91d37d2b620230fe29158478fe985afe.1490704144.git.pkj@axis.com>
References: <cover.1490704144.git.pkj@axis.com>
	<c03b3d4d91d37d2b620230fe29158478fe985afe.1490704144.git.pkj@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Mar 2017 13:37:22 +0100
Message-ID: <CAJTo0LZJDf=UUAcx6nixT6r0gKKFDxaXkUc+8LnWiQ3r2Px+mw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] fetch2: Create/replace symbolic links atomically
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
X-List-Received-Date: Tue, 28 Mar 2017 12:37:44 -0000
Content-Type: multipart/alternative; boundary=001a114f4108e5e8be054bc9b979

--001a114f4108e5e8be054bc9b979
Content-Type: text/plain; charset=UTF-8

On 28 March 2017 at 13:30, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> Under rare circumstances, creating symbolic links could fail because
> the link already exists. At first glance the code seemed to protect
> against this, but there was a small window where two separate tasks
> could decide that a symbolic link needed to be created and then the
> first task would create it and the second task would fail.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>

Bitbake has its own list, can you resend to
bitbake-devel@lists.openembedded.org?

Cheers,
Ross

--001a114f4108e5e8be054bc9b979
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 March 2017 at 13:30, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellersted=
t@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:4cq"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m15b14e630fb8b9ab">Under rare circums=
tances, creating symbolic links could fail because<br>
the link already exists. At first glance the code seemed to protect<br>
against this, but there was a small window where two separate tasks<br>
could decide that a symbolic link needed to be created and then the<br>
first task would create it and the second task would fail.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com">peter.kjellerstedt@axis.com</a>&gt;</div></blockquote></div><br>B=
itbake has its own list, can you resend to=C2=A0<a href=3D"mailto:bitbake-d=
evel@lists.openembedded.org">bitbake-devel@lists.openembedded.org</a>?</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cheers,</d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a114f4108e5e8be054bc9b979--
