Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA35FC9ED7
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 06:42:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4525.1772865740259366958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 22:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vH6GRlUs;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 56105C42849;
	Sat,  7 Mar 2026 06:42:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C01615FF9B;
	Sat,  7 Mar 2026 06:42:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2270103693BC;
	Sat,  7 Mar 2026 07:42:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772865736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tBPQDbHt1KbogHFnazHmTMnwghBJNe5LwoUUENBKqVE=;
	b=vH6GRlUsi40NYbSH9tXx0O2ipTMl1Lpzb87+XN3JptK9mJ+HGqYS2Sh/No4I9za346DL5Q
	ZzigtuZFImZqAppAoQYOsfF3RORhCHEbxurHl4126uzIUfHZ18tZkKGX/xeGrx1pZsKd4z
	RLLvFbmHiIseeEBfNplzkNxptajN13YvWudt1RS9aaxZ2ZGjfQRStWY6spl9PNDtkpvLPS
	WvM9mXcaQjkp/3Sjw5JUSYX6ZvVKzgDxdY7uqzegtvxfGPpRzowgn5xheGVRJ64SRxF0VM
	6KLp1eLP/auV1dqQaMxLoW/U5JhGksSVdaZN6KVwrccvL9v1qtyF41uftloKHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Mar 2026 07:42:12 +0100
Message-Id: <DGWCGA4WR8ZH.17KQOSZOR7JSA@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] go 1.22.12: Fix CVE-2025-61726.patch
 variable ordering
Cc: "Eduardo Ferreira" <eduardo.barbosa@toradex.com>, "Michael Pratt"
 <mpratt@google.com>, "Deepak Rathore" <deeratho@cisco.com>, "Yoann Congal"
 <yoann.congal@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <eduardo.f120@yahoo.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260306-fix-cve-61726-patch-ordering-v2-1-410fea740c2a.ref@toradex.com> <20260306-fix-cve-61726-patch-ordering-v2-1-410fea740c2a@toradex.com>
In-Reply-To: <20260306-fix-cve-61726-patch-ordering-v2-1-410fea740c2a@toradex.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 06:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232603

On Fri Mar 6, 2026 at 8:55 PM CET, Eduardo Ferreira via lists.openembedded.=
org wrote:
> From: Eduardo Ferreira <eduardo.barbosa@toradex.com>
>
> Commit 6a1ae4e79252f9a896faa702e4a8b3e27529a474 introduced a patch
> backporting a fix for CVE-2025-61726, but this patch also introduced
> a bug.
>
> From Go's source code[1], they say that the 'All' table from 'godebugs'
> should be populated alphabetically by Name. And 'Lookup'[2] function uses
> binary search to try and find the variable.
>
> Here's the trace:
> Mar 06 11:33:33 toradex-smarc-imx95-12594035 systemd[1]: Started Docker A=
pplication Container Engine.
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: 2026/03/06 11:=
34:53 http: panic serving @: godebug: Value of name not listed in godeb
> ugs.All: urlmaxqueryparams
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: goroutine 78 [=
running]:
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*con=
n).serve.func1()
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/ht=
tp/server.go:1903 +0xb0
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743=
e8740?, 0x4000b526c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         runtim=
e/panic.go:770 +0x124
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         go.ope=
ntelemetry.io/otel/sdk@v1.19.0/trace/span.go:383 +0x2c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemet=
ry.io/otel/sdk/trace.(*recordingSpan).End(0x40011b4a80, {0x0, 0x0, 0x40
> 006441c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         go.ope=
ntelemetry.io/otel/sdk@v1.19.0/trace/span.go:421 +0x898
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743=
e8740?, 0x4000b526c0?})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         runtim=
e/panic.go:770 +0x124
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug.(*Setting).Value.func1()
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         intern=
al/godebug/godebug.go:141 +0xd8
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).d=
oSlow(0x22?, 0x55748a9b60?)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         sync/o=
nce.go:74 +0x100
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).D=
o(...)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         sync/o=
nce.go:65
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godeb=
ug.(*Setting).Value(0x5575b21be0)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         intern=
al/godebug/godebug.go:138 +0x50
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.urlPar=
amsWithinMax(0x1)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/ur=
l/url.go:968 +0x3c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.parseQ=
uery(0x400069a630, {0x0, 0x0})
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/ur=
l/url.go:985 +0xdc
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.ParseQ=
uery(...)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/ur=
l/url.go:958
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*Req=
uest).ParseForm(0x4000bdab40)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/ht=
tp/request.go:1317 +0x33c
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: github.com/doc=
ker/docker/api/server/httputils.ParseForm(0x0?)
> Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         github=
.com/docker/docker/api/server/httputils/httputils.go:104 +0x20
>
> The 'Lookup' function was failing due to the wrong ordering and returning=
 'nil',
> which was not being checked properly and caused this issue.
>
> The fix was to just reorder the line where 'urlmaxqueryparams' is being
> added to respect the alphabetical ordering. And for that the whole CVE
> patch was generated again.
>
> This change was validated with docker-moby (original issue), where a cont=
ainer
> run successfully and no traces in the logs.
>
> Fixes: 6a1ae4e792 ("go 1.22.12: Fix CVE-2025-61726.patch variable orderin=
g")
>
> [1] https://github.com/golang/go/blob/master/src/internal/godebugs/table.=
go#L20
> [2] https://github.com/golang/go/blob/master/src/internal/godebugs/table.=
go#L100
>
> Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> ---

Hi Eduardo,

I suspect this commit is not for master but for the scarthgap branch, is
that right?

In such cases, please remember to add the [scarthgap] tag in mail
subject, you can find help about it here:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#sub=
mitting-changes-to-stable-release-branches

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


