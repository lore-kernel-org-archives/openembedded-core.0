Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 869E1606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 14:20:55 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id f6so143636454ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=St72+QtTpLWbszdPW3COLH+RNxIF3Ev9nFivGDOQEV8=;
	b=Dwdqf5ZDac0+Fdd8jk/252jDF+rxHs4C0M6HHkTU50gcA0Z4lYssc6D/WeUdV+1/c0
	X88aknDLe9mR3QFDZnK9i3LzzJryglFvnXUxkN9qolVNE7El3X/nH3I4uOwVR6JmpfrX
	FNdpWjYiDXibpTDnV3186qlgnTb+ClOPU4jCw+jNtyil9zkz7Rl8ECGWkxHfZKLuYr/r
	koDbFseJTKZ9DCI2YC9um5wcYEhTJsPowKLo5TQHcizyo4hcV72B+2f+7H6y+EYy9EhA
	alXMHrvLYA5laUluw2sJRJHEKBUXJlrytCQfRL0xtX+3QnioHqlpvZPsVu8Aui2IHmeB
	LdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=St72+QtTpLWbszdPW3COLH+RNxIF3Ev9nFivGDOQEV8=;
	b=a7Khy6QD1Jszt/RyvIBx8sMg9pUNWnk1VCZkIPejqfHzEcTLsT3uYBtWuok4BAprIe
	V6m4zGPEtR5kaUJPsPsYR78ckGs0iL9PDfgNRvkXVr6oLNRI0BL5GskA73X2aZl9x6Zi
	4ztCU0OsAEqUgIvHAdy33XB/65/0s89rwCZWMCKKIBTik2qYeRfEzhneV1/CO1Guwdl6
	Y3xPZ/C/jz0hIFTlEgrah1z/jIoarYGBRxUO+5vFoI5sPS8grO0lEjDXwVOMf3q4tg73
	5F/CpnTxG7QJADLYuZ54M+Fu6Gb9+xxFrZu4X2dB9qW2FuTZls011J6UIcGWaxy96dIw
	lhFQ==
X-Gm-Message-State: AEkooutB3MuLFvRjYE7fjnNTakYNTgkQ7WXSp3b1Sfz4p/yy+vj7L6BGJ4PamZHorK7+duywseQWBETwr2JENzsS
X-Received: by 10.36.19.75 with SMTP id 72mr32274020itz.83.1469629255672; Wed,
	27 Jul 2016 07:20:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 27 Jul 2016 07:20:36 -0700 (PDT)
In-Reply-To: <0afb5f75385876d2ecbca040449289bb39fae4d7.1469598081.git.Qi.Chen@windriver.com>
References: <cover.1469598081.git.Qi.Chen@windriver.com>
	<0afb5f75385876d2ecbca040449289bb39fae4d7.1469598081.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Jul 2016 15:20:36 +0100
Message-ID: <CAJTo0LYjJ_grNCYtHBvFE=8pU+TDQtr_+JQc6b+yyz=wY6q35A@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] distutils: fix to avoid file-rdeps QA issue
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
X-List-Received-Date: Wed, 27 Jul 2016 14:20:57 -0000
Content-Type: multipart/alternative; boundary=001a1145180abc8c6d05389eb9a7

--001a1145180abc8c6d05389eb9a7
Content-Type: text/plain; charset=UTF-8

On 27 July 2016 at 06:52, Chen Qi <Qi.Chen@windriver.com> wrote:

> Fix this problem by hardcoding '/usr/bin/env'.
>
> Usually, we don't like hardcoding. But as far as I can see, /usr/bin/env is
> a little special. We skip the 'file-rdeps' QA checking for '/usr/bin/env'
> dependency. Besides, scripts in many packages do use '/usr/bin/env'. So we
> should assume it's there in our system.
>

I think we should be replacing with ${bindir} for target binaries (so the
right paths are used, no matter what bindir is set to) and hard-coding
/usr/bin for native and nativesdk.

If the sanity test is hardcoding /usr/bin/env then that likely should
change to respect ${bindir} too.

Ross

--001a1145180abc8c6d05389eb9a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 27 July 2016 at 06:52, Chen =
Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D=
"_blank">Qi.Chen@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":4az" class=3D"a3s aXjCH =
m1562ae92f8ccc7fc">Fix this problem by hardcoding &#39;/usr/bin/env&#39;.<b=
r>
<br>
Usually, we don&#39;t like hardcoding. But as far as I can see, /usr/bin/en=
v is<br>
a little special. We skip the &#39;file-rdeps&#39; QA checking for &#39;/us=
r/bin/env&#39;<br>
dependency. Besides, scripts in many packages do use &#39;/usr/bin/env&#39;=
. So we<br>
should assume it&#39;s there in our system.<br></div></blockquote></div><br=
>I think we should be replacing with ${bindir} for target binaries (so the =
right paths are used, no matter what bindir is set to) and hard-coding /usr=
/bin for native and nativesdk.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">If the sanity test is hardcoding /usr/bin/env then=
 that likely should change to respect ${bindir} too.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1145180abc8c6d05389eb9a7--
