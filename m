Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 79DCD6E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:12:39 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so23859390qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 03:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tC1DP76alIu5HjYL2YuELbdbuTOVeCyaIJun69G79cU=;
	b=fka4LG1Z8lYhPcfCtMR38Q6c/Lfjl98Vd2PZELQwmQhEjszKZ6Y7+SdFtwXFJF7YiK
	IhVzSKO2llDwRFOG7YsZppxrY3usPMzIEvWBsupddBeWMKJLHKFa8GMgHoEz9vUBy2ly
	OHglitUveF8Re4ed4wZd1yEpJxahBv9PSgA+An4ayLRh3PJ3SQW0zvu6ZIZXDlCqTilS
	y72L3PwFiSDzuy/q5WDkJwAYOVNfV/VCRqW02czV8QBW0mfg7zx/ao9c4opT9pyWwGgR
	3/H7S4pZj1jt+daz/c+2U4f/i5Trlr8GLFhzwDfySaIWx5Rq/Npb4u1FCzFc40GfskwE
	mWkg==
X-Gm-Message-State: ALoCoQnvvOHIrEBYgF7oZ+UI3cAJqGjHicTUKqGKH92JXR5TUet+4lqBivY69om8IZ83vflRA8SC
X-Received: by 10.55.53.193 with SMTP id c184mr74962027qka.62.1439547159871;
	Fri, 14 Aug 2015 03:12:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 14 Aug 2015 03:12:20 -0700 (PDT)
In-Reply-To: <20150814062716.GA4893@ulm-bmuc496424.bmw-carit.de>
References: <1439456956-21602-1-git-send-email-clemens.lang@bmw-carit.de>
	<CAJTo0Lb+y8v4SKhgUrdonNivPeT77Lyxd5MFDDoS4T087Zwp8w@mail.gmail.com>
	<20150814062716.GA4893@ulm-bmuc496424.bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Aug 2015 11:12:20 +0100
Message-ID: <CAJTo0LZ4u-Q2nc+_phmq4NxR9o7Xyyij=tGmE-KxgsODhQdN5A@mail.gmail.com>
To: Clemens Lang <clemens.lang@bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Avoid race condition between do_unpack and do_deploy_archives in archiver.bbclass
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
X-List-Received-Date: Fri, 14 Aug 2015 10:12:44 -0000
Content-Type: multipart/alternative; boundary=001a11476f141a1711051d42b176

--001a11476f141a1711051d42b176
Content-Type: text/plain; charset=UTF-8

On 14 August 2015 at 07:27, Clemens Lang <clemens.lang@bmw-carit.de> wrote:

> I see this in the code, but my error messages speak a very different
> language. Maybe it's a race condition with do_unpack, which actually
> deletes and re-creates these directories again? In any case, there is a
> race condition that causes the directory to be missing when it should be
> there.
>
> For reference, here's one that fails to chdir in Python code:
>

Right, so it's probably racing with unpack which as you say is deleting $S
to recreate it from scratch.  Sounds like do_deploy_archives needs [dirs]
set to something other than $B.  The other archiver tasks use
ARCHIVER_OUTDIR as the cwd, or there's always WORKDIR as a good alternative.

Ross

--001a11476f141a1711051d42b176
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 August 2015 at 07:27, Clemens Lang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:clemens.lang@bmw-carit.de" target=3D"_blank">clemens.lang@bmw-carit.d=
e</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":lq" c=
lass=3D"a3s" style=3D"overflow:hidden">I see this in the code, but my error=
 messages speak a very different<br>
language. Maybe it&#39;s a race condition with do_unpack, which actually<br=
>
deletes and re-creates these directories again? In any case, there is a<br>
race condition that causes the directory to be missing when it should be<br=
>
there.<br>
<br>
For reference, here&#39;s one that fails to chdir in Python code:</div></bl=
ockquote></div><br>Right, so it&#39;s probably racing with unpack which as =
you say is deleting $S to recreate it from scratch.=C2=A0 Sounds like do_de=
ploy_archives needs [dirs] set to something other than $B.=C2=A0 The other =
archiver tasks use ARCHIVER_OUTDIR as the cwd, or there&#39;s always WORKDI=
R as a good alternative.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a11476f141a1711051d42b176--
