Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC456011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:34:36 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g185so62769366ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rvkYf0zQ6S7vjpqi3bHeCyua7znHwCWMObf/+Yq1BPA=;
	b=v/9p6PwGjidn5g6LIy05FGtQHGzVqs/FVChkZ9LimINFS+Ptyanp/BXLc4Ueve2wSA
	mQqKLwfw3wbZ/szsJQMwynmGkhYvwbfYH4YLR8KhadGJV4XNeknLIbB/TerUbMOxHTsy
	2sk8UI2INIMyu7U5GLMs2YymR9Igp2G3Iu65sbubiZGDOD76/DMISU8VLUCTYD6jWFTD
	nzmi1t5xH6zntviFREcD+i0/EG5+R+Z4/7vykYMXO+HHIacjgMwWXR0SrS0FJldzEgta
	ET1f7xoP2zLBGqfYNFI77s5HOSPe6nLB4M2mSlOnG/FZtYEBXlwog+HSedrWAjEJu2G4
	WOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rvkYf0zQ6S7vjpqi3bHeCyua7znHwCWMObf/+Yq1BPA=;
	b=kh7/0TCXGrS0dkrNls/XCAYyRjhPKYCo4QsPjnakvCUMggyp4VqhdexWjVuGtaX8Yp
	D+9bKVhxkZgYDoD9tCpEnHzNA0gQPX8cp2yVapMuHr8lqQf+eZcrZiN0S8irIRXEMTFo
	XQRX1+4kNK7QXF8M75n1ni0Mlryk3rZLSuJ3xKDvh0WifbMUgP3z3MjLecHJ5XiqpU9O
	C1RXSBSYHxZul1XwMiNkOw/O+rpPt3gktpiPAC+k/ET4mPmibLhJciu1PRjS6iOiZwgy
	5PrGuvF6WV5Q7ZcUsO5zcVf4f3x7a2JjjsOhYqBbG5jv8X1GSi8JeZ13Pcx2vfWotZNx
	719Q==
X-Gm-Message-State: AOPr4FWHTAlXHxpE0461SIfl86cMglUbaq2NJTwOOBWq4mFN4JjOJpXrCyK3dIZSSQaG9VrcValHYMWgK1OZgWRp
X-Received: by 10.107.16.104 with SMTP id y101mr8228447ioi.148.1460540077643; 
	Wed, 13 Apr 2016 02:34:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Wed, 13 Apr 2016 02:34:18 -0700 (PDT)
In-Reply-To: <CAFkk2KSu80ndUE=KDJeVmU4_CLZTOpJXN7g9=-W=DEkn7Khs2g@mail.gmail.com>
References: <CAFkk2KSu80ndUE=KDJeVmU4_CLZTOpJXN7g9=-W=DEkn7Khs2g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Apr 2016 10:34:18 +0100
Message-ID: <CAJTo0LbAA06bkAEwFx9N6m15WdsjCSiaepejoB_swXo2oYNudQ@mail.gmail.com>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Build failures due to libtdb racing with libbsd
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
X-List-Received-Date: Wed, 13 Apr 2016 09:34:42 -0000
Content-Type: multipart/alternative; boundary=001a113ff020822e3a05305a7c83

--001a113ff020822e3a05305a7c83
Content-Type: text/plain; charset=UTF-8

On 13 April 2016 at 10:07, Ulf Magnusson <ulfalizer@gmail.com> wrote:

> The problem seems to be a race with building libbsd (and unlucky
> timing in my build). Adding libbsd to DEPENDS fixes the problem.
>
> For some added context, libtdb uses a nonstandard ./configure from the
> Samba project based on a configuration utility called Waf that I'm a
> complete noob on. Perhaps there is some way to disable libbsd support
> instead.
>

This recipe is in meta-oe so this should be on the oe-devel list, not
oe-core

And yes, it looks like tdb has a floating dependency on libbsd.  Someone
would need to determine if it's best to depend on libbsd always, or tell
tbd to not use libbsd even if it can find it at build time.

Ross

--001a113ff020822e3a05305a7c83
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 April 2016 at 10:07, Ulf Magnusson <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ulfalizer@gmail.com" target=3D"_blank">ulfalizer@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1mb" class=3D"a3s=
" style=3D"overflow:hidden">The problem seems to be a race with building li=
bbsd (and unlucky<br>
timing in my build). Adding libbsd to DEPENDS fixes the problem.<br>
<br>
For some added context, libtdb uses a nonstandard ./configure from the<br>
Samba project based on a configuration utility called Waf that I&#39;m a<br=
>
complete noob on. Perhaps there is some way to disable libbsd support<br>
instead.</div></blockquote></div><br>This recipe is in meta-oe so this shou=
ld be on the oe-devel list, not oe-core</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">And yes, it looks like tdb has a floating=
 dependency on libbsd.=C2=A0 Someone would need to determine if it&#39;s be=
st to depend on libbsd always, or tell tbd to not use libbsd even if it can=
 find it at build time.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a113ff020822e3a05305a7c83--
