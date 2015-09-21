Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 01EDD73CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 20:56:15 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so50614181qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 13:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DoiU8+jbY+cT/dlhIgGnDdRVofVaXmcBSoiKnMXhHfU=;
	b=c1YoMChvhQ9t5+SGfsHoJT+3U6IIXiAWV7hxoDHcVP9JGGKsDgSTmvZ8biwX7OiEnC
	lwHhX4rm8VBvIMVxk9Xyuu9zCzARXK00m5Y1K9HrIvbGlNEJwTEhIenO16ColzWk8G1j
	dAr5KyMb9PPP7zuMPtaB51mDr4xQ936EfwqqIlJcjL875KrLC1LtE7eS3AWdsheJzHYq
	SifH2TTkm7w4s+oA1f0EsvXHuP8NNQP0NJgDR4fYaeW9oGn5kvYDrxPB1dxp2Fx+9mBw
	LVXQRge1jksOZCLKKYrJfueY1b//kwdp/Y5mOHuWXHLT2WI+/C6JVRspmp+PmI5SDVXY
	sEoQ==
X-Gm-Message-State: ALoCoQndhrbPX5kNhvPYGex13rQYknvzPo8sipk2IJrs6wvPqGTdklSWr7b6IfEKumoexxRxSvG0
X-Received: by 10.55.221.199 with SMTP id u68mr24720702qku.83.1442868975615;
	Mon, 21 Sep 2015 13:56:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 21 Sep 2015 13:55:56 -0700 (PDT)
In-Reply-To: <1442867607-8913-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150921190422.GA28765@jama>
	<1442867607-8913-1-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Sep 2015 21:55:56 +0100
Message-ID: <CAJTo0La661H=yF-bsVZjBwhSeRCtjafK1EuvbTL41J4vcoBhDA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCHv2] cmake.bbclass, perf: don't re-create ${B}
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
X-List-Received-Date: Mon, 21 Sep 2015 20:56:17 -0000
Content-Type: multipart/alternative; boundary=001a11499758bfdeac0520481c53

--001a11499758bfdeac0520481c53
Content-Type: text/plain; charset=UTF-8

On 21 September 2015 at 21:33, Martin Jansa <martin.jansa@gmail.com> wrote:

> * otherwise there is race-condition between do_configure rm+mkdir and
>   bitbake trying to use it as CWD for do_populate_lic task, which
>   results in errors like this:
>

It took me a few minutes to understand this race:

Task A executing perf:do_configure and deleting ${B}
Task B finishing perf:do_populate_lic and so running the sstate generation
logic and the functions listed in SSTATEPOSTINSTFUNCS, which get executed
with the default cwd of ${B}.

I'll note that autotools.bbclass also does rmdir/mkdir ${B} so I'm curious
why you see it more in perf and cmake and not everything else.

Would a better long-term fix be to pass cwd=${WORKDIR} to exec_func in the
sstate code to stop the functions being executed in ${B} (after vetting the
functions, obviously).  FWIW I'm the owner of the bug to stop bitbake
knowing about ${B} which is leading to exactly this sort of problem.

Ross

--001a11499758bfdeac0520481c53
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 September 2015 at 21:33, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex"><div id=3D":5n5" class=3D"" styl=
e=3D"overflow:hidden">* otherwise there is race-condition between do_config=
ure rm+mkdir and<br>
=C2=A0 bitbake trying to use it as CWD for do_populate_lic task, which<br>
=C2=A0 results in errors like this:</div></blockquote><div><br></div><div>I=
t took me a few minutes to understand this race:</div><div><br></div><div>T=
ask A executing perf:do_configure and deleting ${B}</div><div>Task B finish=
ing perf:do_populate_lic and so running the sstate generation logic and the=
 functions listed in=C2=A0<span style=3D"font-size:13px">SSTATEPOSTINSTFUNC=
S, which get executed with the default cwd of ${B}.</span></div><div><span =
style=3D"font-size:13px"><br></span></div><div><span style=3D"font-size:13p=
x">I&#39;ll note that autotools.bbclass also does rmdir/mkdir ${B} so I&#39=
;m curious why you see it more in perf and cmake and not everything else.</=
span></div><div><br></div><div>Would a better long-term fix be to pass cwd=
=3D${WORKDIR} to exec_func in the sstate code to stop the functions being e=
xecuted in ${B} (after vetting the functions, obviously).=C2=A0 FWIW I&#39;=
m the owner of the bug to stop bitbake knowing about ${B} which is leading =
to exactly this sort of problem.</div><div><br></div><div>Ross</div></div><=
/div></div>

--001a11499758bfdeac0520481c53--
