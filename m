Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 43128600BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 21:51:45 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id u12so22554312qth.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V+1w/NdzpLZvB4sWUDtm4oO4MbLoIPQiK6KNQX2jIZ8=;
	b=aS7qsvVrjgih9Zmn1NBgVSrDA4VDNyK4fSTU6mlsnyDVvKj73ZVKy4WygHEej7T5Zd
	iJ33q7oETZLMuwfyWSNl/wTN/+YtTSIrcaQGugsr+x5wbrdRNGQAwkbvWthLmZYkdzi6
	iav+591v4kcyiaaJp0h6/tFBdlnI3D7dMlqUIKmiuBseikOtb3YRtC7Fto/KOUwFNJJw
	iAIyWGrvRqTwd+mycxL0w54ynu4tf8rKp3SPUytPZ0eWjY1Dhk3qFA9trJr+cCbQXvFT
	AW/6Z+7t3izdY2y1jy4A27MHeEf6b2IWfiozWhwM7DSqB4PfsE03KV2QpnhBp80hMNFS
	dfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V+1w/NdzpLZvB4sWUDtm4oO4MbLoIPQiK6KNQX2jIZ8=;
	b=btFNNDD72m1Zh0G7dXeeEkynyvL0FM/WHivVTu4x+JMzOa0Gb1lRZbKV2azvx+HGrW
	0mdQLBGPkuJWwh1k5rG++FJjjZiZqo8rdIb9Sz/V23xFunpU4KrAI2lJ0Ku/oMyOuVoz
	bmFL3Y4YjUMh4u2xVs3ldvz9kIUsmiXNggb+XPUDe1GqONkjgnAfenZarev3H7gK+llV
	euV/X/RMsIR1hfayldiI3KvTI35gsmRs4uBAKzUNZ7mUbWrl4T+yLVtY0IOyrhvU3dYl
	seH2z3bDtXEEJbW0o4zuW8HnF/KylE4X3CMZlBBviofE5gHrVETLDpZyZjEgkGqXBvwz
	MhXg==
X-Gm-Message-State: AKS2vOw5snKYZy+2rwv6a1WSntbpl1I8vOmb3aHj46opksdInwhdbGwk
	66eSW62v6+0fiVyfQw3UOdbOLIh6aG1p
X-Received: by 10.200.45.221 with SMTP id q29mr5873831qta.177.1498168306798;
	Thu, 22 Jun 2017 14:51:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 22 Jun 2017 14:51:26 -0700 (PDT)
In-Reply-To: <20170622104209.260f4563@loki02>
References: <20170622104209.260f4563@loki02>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jun 2017 22:51:26 +0100
Message-ID: <CAJTo0LbmHft+JXd7ce7r3JCza4G182D4Hnt78hU89DO+TYCNDQ@mail.gmail.com>
To: Adam Trhon <adam.trhon@tbs-biometrics.com>
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: how to load cmake args from git?
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
X-List-Received-Date: Thu, 22 Jun 2017 21:51:53 -0000
Content-Type: multipart/alternative; boundary="001a114516d0bde4af0552937da9"

--001a114516d0bde4af0552937da9
Content-Type: text/plain; charset="UTF-8"

On 22 June 2017 at 09:42, Adam Trhon <adam.trhon@tbs-biometrics.com> wrote:

> but I am not very happy about using PACKAGECONFIG_CONFARGS - it feels
> hacky, the
> arguments are not shown in cmake fail log and it cannot handle argumetns
> containing
> spaces. Is there a cleaner way to achieve this?
>

Definitely don't use PACKAGECONFIG_CONFARGS: that has a well defined
meaning and use, and that isn't it.

I don't see why as you control the repository why can't you just set the
arguments in cmakelists, or the recipe itself?  Either they're useful
everywhere (cmakelists) or in OE builds (recipe).

Anyway, you could do something like this:

python() {
  d.appendVar("EXTRA_OECMAKE", " " +
open(d.expand("${S}/oe_arguments.txt")).read()
}

Ross

--001a114516d0bde4af0552937da9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 June 2017 at 09:42, Adam Trhon <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:adam.trhon@tbs-biometrics.com" target=3D"_blank">adam.trhon@tbs-biometric=
s.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3=
pe" class=3D"a3s aXjCH m15cd172facb50c68">but I am not very happy about usi=
ng PACKAGECONFIG_CONFARGS - it feels hacky, the<br>
arguments are not shown in cmake fail log and it cannot handle argumetns co=
ntaining<br>
spaces. Is there a cleaner way to achieve this?<br></div></blockquote></div=
><br>Definitely don&#39;t use PACKAGECONFIG_CONFARGS: that has a well defin=
ed meaning and use, and that isn&#39;t it.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">I don&#39;t see why as you control the=
 repository why can&#39;t you just set the arguments in cmakelists, or the =
recipe itself?=C2=A0 Either they&#39;re useful everywhere (cmakelists) or i=
n OE builds (recipe).</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Anyway, you could do something like this:</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">python() {</div><div =
class=3D"gmail_extra">=C2=A0 d.appendVar(&quot;EXTRA_OECMAKE&quot;, &quot; =
&quot; + open(d.expand(&quot;${S}/oe_arguments.txt&quot;)).read()</div><div=
 class=3D"gmail_extra">}</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a114516d0bde4af0552937da9--
