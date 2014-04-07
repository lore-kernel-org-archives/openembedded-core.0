Return-Path: <kergoth@gmail.com>
Received: from mail-bk0-f43.google.com (mail-bk0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 50D6965DA8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 14:19:35 +0000 (UTC)
Received: by mail-bk0-f43.google.com with SMTP id v15so380618bkz.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=HZW1jFR+a/WVREzf6PZtlS9EH6aumlZ0/9lW+ifWq3Q=;
	b=yhMVFF4Qvwhs+KuieevcHzu5IzonrPV17e3lVNxxl3tUNTZ//gkBCz63+yjn+oxwZ6
	fY3ZMBWYX4hG9MPevdaMFjwZh23soqQbdqjMEqtJ/t1sErbEH2OFa6e0o3yMhurQklAi
	/m0AemcVAIDlRVRoIx/UPsFD6Fs6ZV1vOK6CbUXVEEvfRp7LayftC/czXyoT1vIDUm72
	1IU4Bm4oLb0BaO7/3zlamIGgrS2tA52k1CBvX0sLL5qdOz7nWQGqhxX9rrrfYEBN25V/
	JU9sp1cfux32puGhptYkFRG81A3igWJh/0ps/UEnnspIHtbHiwMeqPT4ExlSr3GzlGg4
	ED0A==
X-Received: by 10.112.221.227 with SMTP id qh3mr1509522lbc.55.1396887478896;
	Mon, 07 Apr 2014 09:17:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Mon, 7 Apr 2014 09:17:38 -0700 (PDT)
In-Reply-To: <20140407155333.GA19351@mcrowe.com>
References: <20140407155333.GA19351@mcrowe.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 7 Apr 2014 09:17:38 -0700
X-Google-Sender-Auth: Q6P3vaKCekHGcsFE-sxoLaRFtoA
Message-ID: <CABcZANkEyt9M=A0SEWBTGedh713vdYhgqJciKDvZeQ_f-NoLaw@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: export TARGET_LDFLAGS and native sstate
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
X-List-Received-Date: Tue, 08 Apr 2014 14:19:38 -0000
Content-Type: multipart/alternative; boundary=001a1135f56ef88d1204f6763548

--001a1135f56ef88d1204f6763548
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 7, 2014 at 8:53 AM, Mike Crowe <mac@mcrowe.com> wrote:

> We're building for both ARM and MIPS-based MACHINEs in a single source
> tree. This seems to result in us compiling (or luckily most of the time
> resurrecting from sstate-cache) two different versions of all -native
> packages due to different base hashes.
>
> It seems that this difference in base hashes is due to the exported
> variable TARGET_LDFLAGS being different between the two CPUs:
>
> < export TARGET_LDFLAGS="-Wl,-O1  -Wl,--as-needed"
> ---
> > export TARGET_LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"
>

Heh, this i another case of a likely completely unnecessary export.
Software we build expects LDFLAGS to be used, not TARGET_LDFLAGS, so I
can't imagine that anything is using this export. Of course, it's
non-trivial to confirm that this is the case :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1135f56ef88d1204f6763548
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Apr 7, 2014 at 8:53 AM, Mike Crowe <span dir=3D"ltr">&lt;<a href=3D=
"mailto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">

<div id=3D":10h" class=3D"a3s" style=3D"overflow:hidden">We&#39;re building=
 for both ARM and MIPS-based MACHINEs in a single source<br>
tree. This seems to result in us compiling (or luckily most of the time<br>
resurrecting from sstate-cache) two different versions of all -native<br>
packages due to different base hashes.<br>
<br>
It seems that this difference in base hashes is due to the exported<br>
variable TARGET_LDFLAGS being different between the two CPUs:<br>
<br>
&lt; export TARGET_LDFLAGS=3D&quot;-Wl,-O1 =C2=A0-Wl,--as-needed&quot;<br>
---<br>
&gt; export TARGET_LDFLAGS=3D&quot;-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-=
needed&quot;<br></div></blockquote></div><br>Heh, this i another case of a =
likely completely unnecessary export. Software we build expects LDFLAGS to =
be used, not TARGET_LDFLAGS, so I can&#39;t imagine that anything is using =
this export. Of course, it&#39;s non-trivial to confirm that this is the ca=
se :)<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a1135f56ef88d1204f6763548--
