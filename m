Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id D246878044
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 21:10:20 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id u75so46904233qka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 14:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e889JZ8ms2+44GPYMRCue+fgvl9E1MR6uiPxLtFBamg=;
	b=O/YYbmSjZqG0274i+TTLjxu/l05WMSBt2j01YK3gKSQzv8XLT7dGPwD7sO+IN33JxJ
	x3GBL9SDD5NhMHOYG5rIBXeGtUK4ZFeUAQzDp+vy1i28+1qGKKmhz7ZFCkOXCxBlryJS
	OXxZpGzU6licH1Ia5XSlROPd0Cs58avoOshp122g3ZKYcM26/REJlEkOR1IV+hM0Bepc
	5yQDz1zR2da7WjNfqdIJ6t/+i9zu1SAmDXRXrDsXOfxdZ8LWsYTVYdjZu1iBlyCsEN0m
	qRE8SZGeF3eQXg2mDgA/X0ZTKReNG79rCWkrq1ekVJ/tmUwibrc8YheVg6OtbEFRlVav
	uRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e889JZ8ms2+44GPYMRCue+fgvl9E1MR6uiPxLtFBamg=;
	b=LHMzDbeeNi04QTlJAlxt6jnP/rzggzByntP2BAJaqg0V7kzgmlzBzLvQ6t4NojcMDC
	TH5bXPTw1RWk58WEQJ4YSWKIZ7ZpEXyAEcvRyUUVlK1TXfsKm+u2CsP2yuQhIoPT5brS
	TkS7VG2xHEpAY9etaf266oqStnTPzv5eG0wRC0z26HGA24/15d6WVBvWTlEBu9c8imE3
	8OwHa6LFleqlRsOKqeXJbD84ifiBtW5+gJkX4cdXMPclikJWRIVbtR4meKpe5JFbwild
	w5ymvW4X/HErGbGJY8d5tz33gLQ3MmrA7H7RegbCaUBOLGqqQIAA+8Ki6j0uSPxz103L
	vuQg==
X-Gm-Message-State: AODbwcDJRBeTvcdnfDgn0aHA0Uw7nOtE5uFXZT8c6lBwke5HQT087VsC
	Ek7Qjx5p9Ud3JjCoW3s3BZ/RK4pRTG/V
X-Received: by 10.55.111.71 with SMTP id k68mr5868025qkc.26.1495141821920;
	Thu, 18 May 2017 14:10:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 18 May 2017 14:10:01 -0700 (PDT)
In-Reply-To: <1495141509-4582-1-git-send-email-juro.bystricky@intel.com>
References: <1495141509-4582-1-git-send-email-juro.bystricky@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 May 2017 22:10:01 +0100
Message-ID: <CAJTo0LbY5NPD8PY8dFiCvg8h47DCWYBgM6yEWLVDk3Vg-C-MUw@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: improve reproducibility
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
X-List-Received-Date: Thu, 18 May 2017 21:10:23 -0000
Content-Type: multipart/alternative; boundary="94eb2c05c2d82f4a47054fd2d5c5"

--94eb2c05c2d82f4a47054fd2d5c5
Content-Type: text/plain; charset="UTF-8"

On 18 May 2017 at 22:05, Juro Bystricky <juro.bystricky@intel.com> wrote:

> Kernel and kernel modules contain hard coded paths referencing the host
> build system. This is usually because the source code contains __FILE__
> at some place. This prevents binary reproducibility. However, some
> compilers
> allow remapping of the __FILE__ value. If we detect the compiler is capable
> of doing this, we replace the source path $(S) part of __FILE__ by a
> string "/kernel-source".
> For example:
>

Is this not something we should do globally?

Ross

--94eb2c05c2d82f4a47054fd2d5c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2017 at 22:05, Juro Bystricky <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1v4" cla=
ss=3D"a3s aXjCH m15c1d618d19a5dbb">Kernel and kernel modules contain hard c=
oded paths referencing the host<br>
build system. This is usually because the source code contains __FILE__<br>
at some place. This prevents binary reproducibility. However, some compiler=
s<br>
allow remapping of the __FILE__ value. If we detect the compiler is capable=
<br>
of doing this, we replace the source path $(S) part of __FILE__ by a string=
 &quot;/kernel-source&quot;.<br>
For example:<br></div></blockquote></div><br>Is this not something we shoul=
d do globally?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--94eb2c05c2d82f4a47054fd2d5c5--
