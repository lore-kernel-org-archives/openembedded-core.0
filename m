Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id B50F2770FB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 10:47:29 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id g73so50671995ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 02:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+WMxITAE8SKnDsWq4OqRsW9qZ7PatIx7NcviIjzCDHQ=;
	b=hjzabjDiJiVsYU47CHvdWr+3tfvYGhAxYnjysohzB9JKwaCXRxHJ4mlEhFKtWutxmK
	FX2bTJRgMpzX9yP9nM05/YLVj7wcmXDO51bM1/zvXEqnzub/NlLx7avIQxibybTBs6u5
	VZzTr+9zX0YW3BpASg4ZBC4zvm47ZbwlF6yXRvWRhaFGngR7WysRRg7UclEgHtXR9WmS
	eKlxlKQJqGImZRE0VIbso0x037fH6jB0RH2ibaKBmzpXVqYIRhdU+iTv87UNYMfTqktH
	Ub/U35qM37KWkZKrHWWFphqM7Kvfmc1o/rtWCh9G3cNJEq40lQqVmPukZ2WPNv7tXQlv
	QybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+WMxITAE8SKnDsWq4OqRsW9qZ7PatIx7NcviIjzCDHQ=;
	b=kKI+7tmhlPEDGUBjkGqQt5yplJYBPNBbPZGasXB2K0ZYR3XtETp1wyCkr063288LV+
	2JQBSk1KHdOQhN8vbM81KsDSo28OLI2vmEvZFJjQrUsWmjlkWgjD7qEtA6gQyfHg8LiM
	Jp+MgktXPzalS18NBLAIhCw84TcR/A+OSWx2RQyG7je+kTHrH1Da1wT3GTDGMME5OKoQ
	nxhvgNjW6wSiogGJkWt8UMdfPJj5IO0Pt3BS8sg6fy/KqKQGj8Kx5FkizAT7x39m0DXm
	uG7WbbR2/BQeY/3wGmEOHU9vG+webQ80FeUdqrzZJ18W8ibckCR/DYxK/nR1indZbhnS
	hCWQ==
X-Gm-Message-State: AG10YOT/LSR9599k4AtMsaNJSpKWkkuVoKB8FB2ZtJEDVojswneIRj5AHjRqvagGZAUtI5TOP9nqdssia2vLKh5G
X-Received: by 10.107.10.157 with SMTP id 29mr3082169iok.133.1454496449988;
	Wed, 03 Feb 2016 02:47:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 3 Feb 2016 02:47:10 -0800 (PST)
In-Reply-To: <1454480342-5598-1-git-send-email-Yuanjie.Huang@windriver.com>
References: <1454480342-5598-1-git-send-email-Yuanjie.Huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Feb 2016 10:47:10 +0000
Message-ID: <CAJTo0LbaUh-0DTUGf2-kvJiF5seaOE-XqWh382YVSwPFhpzuuA@mail.gmail.com>
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: fix CVE-2015-8777 and CVE-2015-8779
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
X-List-Received-Date: Wed, 03 Feb 2016 10:47:30 -0000
Content-Type: multipart/alternative; boundary=001a113f8df83ab82b052adb5864

--001a113f8df83ab82b052adb5864
Content-Type: text/plain; charset=UTF-8

On 3 February 2016 at 06:19, Yuanjie Huang <Yuanjie.Huang@windriver.com>
wrote:

> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>
> According to http://seclists.org/oss-sec/2016/q1/153
>
> CVE-2015-8777
>
> LD_POINTER_GUARD was an environment variable which controls
> security-related behavior, but was not ignored for privileged binaries
> (in AT_SECURE mode).  This might allow local attackers (who can supply
> the environment variable) to bypass intended security restriction.
> Ref: https://sourceware.org/bugzilla/show_bug.cgi?id=18928
>
> CVE-2015-8779
>
> A stack overflow (unbounded alloca) in the catopen function can cause
> applications which pass long strings to the catopen function to crash
> or, potentially execute arbitrary code.
> Ref: https://sourceware.org/bugzilla/show_bug.cgi?id=17905
>

We're trying to annotate patches that fix CVEs now, so can you add eg CVE:
CVE-2015-8777 tag alongside the signed-off-by and upstream-status?

Cheers,
Ross

--001a113f8df83ab82b052adb5864
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2016 at 06:19, Yuanjie Huang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:Yuanjie.Huang@windriver.com" target=3D"_blank">Yuanjie.Huang@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:5t9" class=3D"a3s" style=3D"overflow:hidden">From: Yuanjie Huang &lt;<a hr=
ef=3D"mailto:yuanjie.huang@windriver.com">yuanjie.huang@windriver.com</a>&g=
t;<br>
<br>
According to <a href=3D"http://seclists.org/oss-sec/2016/q1/153" rel=3D"nor=
eferrer" target=3D"_blank">http://seclists.org/oss-sec/2016/q1/153</a><br>
<br>
CVE-2015-8777<br>
<br>
LD_POINTER_GUARD was an environment variable which controls<br>
security-related behavior, but was not ignored for privileged binaries<br>
(in AT_SECURE mode).=C2=A0 This might allow local attackers (who can supply=
<br>
the environment variable) to bypass intended security restriction.<br>
Ref: <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D18928" re=
l=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_bug=
.cgi?id=3D18928</a><br>
<br>
CVE-2015-8779<br>
<br>
A stack overflow (unbounded alloca) in the catopen function can cause<br>
applications which pass long strings to the catopen function to crash<br>
or, potentially execute arbitrary code.<br>
Ref: <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D17905" re=
l=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_bug=
.cgi?id=3D17905</a></div></blockquote></div><br>We&#39;re trying to annotat=
e patches that fix CVEs now, so can you add eg CVE: CVE-2015-8777 tag along=
side the signed-off-by and upstream-status?</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a113f8df83ab82b052adb5864--
