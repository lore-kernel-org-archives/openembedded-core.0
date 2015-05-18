Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id E244260138
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 22:23:53 +0000 (UTC)
Received: by qgde91 with SMTP id e91so29928613qgd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 15:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=KcIovSs2JvVXTysbnGtjQYNbt7YxGcLaF6sxYMgOktA=;
	b=SbxEb0sPplD/eQ3zit5lQcpN3gb7r7DngBufC4VqJObWaKJIFNxg8FuDSs2Xvte1un
	PEuhuP4qb7Ic9FpS7c9SPKiW/8EoXfLaIHGWRuGZd0KhgLrCBK5QkLD4l97uMcuGe/kX
	kUkGkCdMrQ8KiislSYFRVuVHutWcE0PSskrYiM7pt5zUuyX2ZEd5xgpixSJOVMH3pK4i
	weiQxphLs7S2qoi/kjm1i+S6gy7iMV+4qqWcWo6kBlLbT/G5PjdkX0VmpfsJjJOZITGU
	ivU6LeAazr4EBYcLc7zsM0sMwNDRoQhcE107btIPBvSC9T+BfrKtjMIAaD6y9o3ynkYQ
	vj7Q==
X-Received: by 10.140.237.68 with SMTP id i65mr5177900qhc.42.1431987834139;
	Mon, 18 May 2015 15:23:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.117 with HTTP; Mon, 18 May 2015 15:23:33 -0700 (PDT)
In-Reply-To: <1431979698-29379-2-git-send-email-ldnunes@ossystems.com.br>
References: <1431979698-29379-1-git-send-email-ldnunes@ossystems.com.br>
	<1431979698-29379-2-git-send-email-ldnunes@ossystems.com.br>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 18 May 2015 15:23:33 -0700
X-Google-Sender-Auth: anDPk3oxz__kEhcRsAuFKoGFv_A
Message-ID: <CABcZANk3s=5CAK+qQ2JySrzXsy2na0SBQv8E3N_m2Ei1bcOk+Q@mail.gmail.com>
To: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cleanup-workdir: wait for bitbake instances to finish
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
X-List-Received-Date: Mon, 18 May 2015 22:23:55 -0000
Content-Type: multipart/alternative; boundary=001a1135d7462d39dc051662a618

--001a1135d7462d39dc051662a618
Content-Type: text/plain; charset=UTF-8

On Mon, May 18, 2015 at 1:08 PM, Lucas Dutra Nunes <ldnunes@ossystems.com.br
> wrote:

> bitbake uses a lock file on the build dir, "bitbake.lock", to prevent it
> from running before an instance has exited. And sometimes the
> cleanup-workdir script can call bibake too many times, too fast, before
> the lock has been released.
>
> By simply waiting that the lock has been released solves this problem.
>
> Signed-off-by: Lucas Dutra Nunes <ldnunes@ossystems.com.br>


The fact that the bitbake UI can exit before the lock has been released is
a bug. Not being able to assume bitbake is done by the time the bitbake
command exits is not ideal, no one should have to block directly o the lock
like this.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1135d7462d39dc051662a618
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, May 18, 2015 at 1:08 PM, Lucas Dutra Nunes <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:ldnunes@ossystems.com.br" target=3D"_blank">ldnunes@ossyste=
ms.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"il">bitbake</span> uses a lock file on the build dir, &quot;<span cl=
ass=3D"il">bitbake</span>.lock&quot;, to prevent it<br>
from running before an instance has exited. And sometimes the<br>
cleanup-workdir script can call bibake too many times, too fast, before<br>
the lock has been released.<br>
<br>
By simply waiting that the lock has been released solves this problem.<br>
<br>
Signed-off-by: Lucas Dutra Nunes &lt;<a href=3D"mailto:ldnunes@ossystems.co=
m.br">ldnunes@ossystems.com.br</a>&gt;</blockquote></div><br>The fact that =
the bitbake UI can exit before the lock has been released is a bug. Not bei=
ng able to assume bitbake is done by the time the bitbake command exits is =
not ideal, no one should have to block directly o the lock like this.<br>--=
 <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergot=
h dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Ts=
lib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1135d7462d39dc051662a618--
