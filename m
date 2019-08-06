Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 96CF07D28D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 17:55:31 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id e83so17474375vke.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 10:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pQ/d+VFqy2UpWHAYaZspB4DfHEdFdGaFKx46dyBd0Lg=;
	b=RzBCvTgoOqBRTbFHWwdn9LAazSiRqgpbL3mowc0eYtvw9ZiNdQx30O1wZ6x8iZGYmA
	O8cgxN+va8vqxoEvbDmfPZRfTfA7NF11YLNrzQS0OoX92GqJL8+tc4wHkrYPo/Y8m0g+
	REzr7XTZH6le1hSbAtQO4i0+hKTnFr1O3XzmkEWk7ivQOGriaNsRThgiKcSiCsswp7QI
	tXgnaPyDu4ubRIgyJLakt7Mr4VPlnMbU/725c5JwmvGdahVNHZIVRjhQEa5E+cWJWaMq
	iCkKz0RGl5rlvNCn+qYbXLPLoOdxCQn9RHFwKSErlkToAXOwIu8dZvIIDGeb+l4yb380
	tiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pQ/d+VFqy2UpWHAYaZspB4DfHEdFdGaFKx46dyBd0Lg=;
	b=QsQKPqB7/rG3WJZKg/rdrkwpAHuVBnY1LtB7YzaCHV+KmBw68ZK2kICJXyPkTcRHQv
	KhvQ+RR1bUwDClK7o0JP+5qPgoF63Cwaan18+io/5DzvRIukTxiG0psM6FmfgYWA2sOA
	A6u8z90pW3kI6E3ggTSmXtvmvM8oQxFG9aMomuqjEhnXEhFh949BiBmjz3sTPbfSGye4
	1Nd4WfDK/ccA6JsEW3rGM6/5zEYN2QnWt9deM0yFzG4j34N2V2SgAwCNfm6E7D0kFrS1
	isXNiU94VOqfzP8jv/+5S+f4sff1R4uGukXSt4VeHx7JJDC/2dkPvoNFh+kK4ejFhx+r
	35wg==
X-Gm-Message-State: APjAAAV7z1U7UHCy3nIWdzp9DFH6HUfDFJ7en+/kXO+AXwEz7od60Sc+
	5yOxW7XMxoUJWgEJspzpn/Bzv1ag3t+QeJACvxMfIw==
X-Google-Smtp-Source: APXvYqxNXltgVgCP9hIp9fAUC3BxdXkWIajHwJoSM3/tj05V4Ef6+HnoTAw8/O92xYIAJy2fYPawjQQLNsIq8l/fX6s=
X-Received: by 2002:a1f:1288:: with SMTP id 130mr1809915vks.12.1565114132526; 
	Tue, 06 Aug 2019 10:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190806173101.28671-1-jason.wessel@windriver.com>
In-Reply-To: <20190806173101.28671-1-jason.wessel@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 19:55:21 +0200
Message-ID: <CANNYZj96=yCYWO_UG9MkUx2HvwG00v0n3dTK5aMdhqb3BHhFjw@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3: Always build sqlite3-native with zlib
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
X-List-Received-Date: Tue, 06 Aug 2019 17:55:31 -0000
Content-Type: multipart/alternative; boundary="000000000000e6f9e4058f768789"

--000000000000e6f9e4058f768789
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2019 at 19:31, Jason Wessel <jason.wessel@windriver.com>
wrote:

> The build of sqlite3-native is not fully deterministic.  There is some
> corner case as shown with the recent pseudo commit where the sqlite3
> will sometimes link against zlib.  It is possible that in a build with
> sstate that since the zlib is not listed, that pseudo-native will fail
> to build because it calls the pkg-config to get the link arguments for
> sqlite3 and will ultimately try to link against zlib.
>

It would be good to dig a little deeper and get to the root cause of why
sqlite *sometimes* does it. The fix provided below seems like fixing the
symptom, not the problem.

Alex

--000000000000e6f9e4058f768789
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 6 Aug 2019 at 19:31, Jason We=
ssel &lt;<a href=3D"mailto:jason.wessel@windriver.com">jason.wessel@windriv=
er.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The build of sqlite3-native is not fully deterministic.=C2=A0 There i=
s some<br>
corner case as shown with the recent pseudo commit where the sqlite3<br>
will sometimes link against zlib.=C2=A0 It is possible that in a build with=
<br>
sstate that since the zlib is not listed, that pseudo-native will fail<br>
to build because it calls the pkg-config to get the link arguments for<br>
sqlite3 and will ultimately try to link against zlib.<br></blockquote><div>=
<br></div><div>It would be good to dig a little deeper and get to the root =
cause of why sqlite *sometimes* does it. The fix provided below seems like =
fixing the symptom, not the problem.</div></div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000e6f9e4058f768789--
