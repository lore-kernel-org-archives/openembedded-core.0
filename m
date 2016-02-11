Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 279A1731D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 16:00:22 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id l127so58675354iof.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=htn31M0cISSleVNLhdvid0ASkpkIrFjVp97HxUSwEQU=;
	b=Ggw8z+IxsTXOBw3j9vi04Q5yYVBXvSImBck04ikQvcvgCns6fPRCk8IkpGWWUwZwy7
	obcqRT3OSPO+9Fqdq7wkbP9H97SZ/34nqil5wiA62nOH9kioRGQ8xOFWHIcGg2mZ7nae
	7Hi1YaAlk3pKch/cXI+HXFgCL1Zl+27jQP+tl0gjTXxsAGRAYL5LibY1wc1fSlWR1Isy
	XhmTwQNAq1zDCBa3njjcjE7By9GSofrEUL8i1F4S0ZLt74KPbLkQlTJ8JiV79R8LH81p
	UKjLDHUov0oLRGozduRR7Pk+TUtL/H7yEpHTCj0QuMWhweT38Id/1WOG3xLU0JBOLNqc
	e71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=htn31M0cISSleVNLhdvid0ASkpkIrFjVp97HxUSwEQU=;
	b=k3u8U95jgxuKZpx6w/bAkgAEh4FyowxbLlKk1tnJGv+MBQN1ExbD96zTHJWYTrRpEo
	kvFEu6XebT4loLK5hSX4bBS5FPRM1Ncf9wbHG05bA3PTMzYFL9zyqpTen1qigKWSTkyW
	SpewIGJxwFlR7wKWFQVWej1iZVcFBHKSyjyz2f2fWrK76/vJdSysayOlFD7GxMn/GT8H
	HV7tL8lK3zHeKq9mZPIO+AI7LbeeYOLpwmPqVGcUQiww7t0Jo0bqtLK435Dc2eXG4RMh
	krF/SaPcUiU+YfRCS79x2mAr2EJ9c8lqB2V0od/qmeNVUusKkFc2xiv4Q2ezsECmN+cM
	7UYA==
X-Gm-Message-State: AG10YOS8gV8F0yylLZdLbmTS+Q/zsmSmmSaj/UXGdzO5aRRvOltioAr5mxYrinP7WaZ4MkG+UnbVke44hqIs3w==
X-Received: by 10.107.34.133 with SMTP id i127mr47426345ioi.150.1455206422912; 
	Thu, 11 Feb 2016 08:00:22 -0800 (PST)
MIME-Version: 1.0
References: <1455032462-124215-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1455032462-124215-1-git-send-email-mark.hatle@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 11 Feb 2016 16:00:13 +0000
Message-ID: <CABcZANnW1dPoe0YboXQ_0G728AF9Hrd-YTFJkvtUyBfni+vB4Q@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] Resolve an issue when using pipes to process data
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
X-List-Received-Date: Thu, 11 Feb 2016 16:00:24 -0000
Content-Type: multipart/alternative; boundary=001a1140ef84e9c0a3052b80a58e

--001a1140ef84e9c0a3052b80a58e
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 9, 2016 at 8:41 AM Mark Hatle <mark.hatle@windriver.com> wrote:

> I'm sending this as an RFC.  I know the patch works, but I think it
> highlights
> a potentially larger issue in the system.
>
> If we're processing data using shell pipes, the return code of a failed
> process may end up being lost -- avoiding the regular error capture when
> bitbake runs a task.
>
> In this particular case, while working to fix a bug in pseudo we made an
> error condition fatal (triggered an abort()), but buildhistory kept on
> processing ignoring any issues had occurred.
>
> Breaking up the processing into steps, things that 'could fail', and later
> processing steps that shouldn't fail will give us more of an opportunity to
> identify failures in the future and deal with them in a quicker manner,
> then having to investigate log files for messages.
>
> I'm suspecting we should run a janitor exercise against oe-core looking for
> similar situations where we might be piping the data and potentially losing
> return codes in the process.
>
> Comments?
>

Hmm, wonder if it'd be worth adding the ability to inject extra 'set'
options to the start of all emitted shell tasks, and make it obey SHELL, so
you could set SHELL=bash and set -o pipefail.

--001a1140ef84e9c0a3052b80a58e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, Feb 9, 2016 at 8:41 AM Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windri=
ver.com">mark.hatle@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">I&#39;m sending this as an RFC.=C2=A0 I know the patch works,=
 but I think it highlights<br>
a potentially larger issue in the system.<br>
<br>
If we&#39;re processing data using shell pipes, the return code of a failed=
<br>
process may end up being lost -- avoiding the regular error capture when<br=
>
bitbake runs a task.<br>
<br>
In this particular case, while working to fix a bug in pseudo we made an<br=
>
error condition fatal (triggered an abort()), but buildhistory kept on<br>
processing ignoring any issues had occurred.<br>
<br>
Breaking up the processing into steps, things that &#39;could fail&#39;, an=
d later<br>
processing steps that shouldn&#39;t fail will give us more of an opportunit=
y to<br>
identify failures in the future and deal with them in a quicker manner,<br>
then having to investigate log files for messages.<br>
<br>
I&#39;m suspecting we should run a janitor exercise against oe-core looking=
 for<br>
similar situations where we might be piping the data and potentially losing=
<br>
return codes in the process.<br>
<br>
Comments?<br></blockquote><div><br></div><div>Hmm, wonder if it&#39;d be wo=
rth adding the ability to inject extra &#39;set&#39; options to the start o=
f all emitted shell tasks, and make it obey SHELL, so you could set SHELL=
=3Dbash and set -o pipefail.</div></div></div>

--001a1140ef84e9c0a3052b80a58e--
