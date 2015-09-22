Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 45DEB73243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 09:36:39 +0000 (UTC)
Received: by qgx61 with SMTP id 61so111358098qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 02:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jGKCBU+A6+twI0XL/h7g828/HeW5elQ5+dCtG0R5YY4=;
	b=FRaPAD1/6WeokUx/XKaewso3w/BzZVqfPaXKqelVNykc0IjWtEJ561nD8gqL2XXHnQ
	1/pHvPd4Hf4jBkN6sfVmonzqOTc9dQQ/d2wyQ4izgwHttUTwPqOyc8vgxxiV6wflHpc9
	wv472uGbk86PwZ9qzqOWUGfPG0hS7dAilyaq55ziDwHvOwaeNd8/qszDX9cKeSUCdluJ
	cMbsegQYpk4lTvQ1OSHnYnN/1eO6Tl95iYrjtQJYulaguKLbC1ZdBEhPoe8nVHyKpiuc
	wVQv5QqJcVFgIiozAGA4WMXgEi9XHgmxQ9DlvRJ+2dCUE2WKHWfZ6geuB+UJ8IzqtE4o
	Rygw==
X-Gm-Message-State: ALoCoQltjDPkvvt4a2twW+dC9IjDPNW9hNmAPLBFbOLjQrP/vbsOkXNLcMCSfqnqtOaA0SGBukTk
X-Received: by 10.140.132.71 with SMTP id 68mr30191061qhe.64.1442914599793;
	Tue, 22 Sep 2015 02:36:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 22 Sep 2015 02:36:20 -0700 (PDT)
In-Reply-To: <1442909434.12435.242.camel@linuxfoundation.org>
References: <20150921190422.GA28765@jama>
	<1442867607-8913-1-git-send-email-Martin.Jansa@gmail.com>
	<1442909434.12435.242.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Sep 2015 10:36:20 +0100
Message-ID: <CAJTo0LbSDPUYAQ-DZe5HoBzKCobA7ZK92A8yRs0EbUtUpCX-7A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Tue, 22 Sep 2015 09:36:40 -0000
Content-Type: multipart/alternative; boundary=001a113510d429c432052052bc9e

--001a113510d429c432052052bc9e
Content-Type: text/plain; charset=UTF-8

On 22 September 2015 at 09:10, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The longer stack trace is actually really helpful. I believe the code
> here should inherit the working directory of the current task rather
> than rely on the default of ${B} which bitbake assigns if there is
> nothing else.
>
> The trouble is that if the function does specify a dirs flag, it should
> really use that instead of a supplied parameter and if we use the
> parameter to exec_func(), it won't do that.
>
> There aren't that many uses of SSTATEPOSTINSTFUNCS in our metadata so
> the easiest way to fix this short term is probably to go through them
> and add specific [dirs] options to the functions.
>

There's enough instances of SSTATEPOSTINSTFUNCS dotted around even just
oe-core, but they're all going to be using SSTATE_INSTDIR as the working
directory.  Whilst you have a valid point that the functions should respect
[dirs] if set, for the case of sstate post-install hooks I think we should
just force the right path so the recipe creators don't have to worry about
this.

Ross

--001a113510d429c432052052bc9e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 September 2015 at 09:10, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":14z" class=3D"a3s" style=3D"overflow:hidden">The longer s=
tack trace is actually really helpful. I believe the code<br>
here should inherit the working directory of the current task rather<br>
than rely on the default of ${B} which bitbake assigns if there is<br>
nothing else.<br>
<br>
The trouble is that if the function does specify a dirs flag, it should<br>
really use that instead of a supplied parameter and if we use the<br>
parameter to exec_func(), it won&#39;t do that.<br>
<br>
There aren&#39;t that many uses of SSTATEPOSTINSTFUNCS in our metadata so<b=
r>
the easiest way to fix this short term is probably to go through them<br>
and add specific [dirs] options to the functions.</div></blockquote></div><=
br>There&#39;s enough instances of SSTATEPOSTINSTFUNCS dotted around even j=
ust oe-core, but they&#39;re all going to be using SSTATE_INSTDIR as the wo=
rking directory.=C2=A0 Whilst you have a valid point that the functions sho=
uld respect [dirs] if set, for the case of sstate post-install hooks I thin=
k we should just force the right path so the recipe creators don&#39;t have=
 to worry about this.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113510d429c432052052bc9e--
