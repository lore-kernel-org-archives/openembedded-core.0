Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 386D660588
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:33:12 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id q21so86638730iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 04:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rN9fL27MQAdOaBYaR447FSMy+YtTuaRPwxmcyh6fEwM=;
	b=Do6He7CNmv2NmmOZyAU0xr41Cop76QPhwd4790NqJCUW7IhAv6oyO1PG9k/pRIlnHa
	P1AiosJQeW0f98tJgBfgcFXLE0uvfSIPxOP7rNXu+VDiEaAGTdMTjpRbTEW9+GOUlU80
	5gpLejDvI7V5PcaDp0br3F/f2H4nZg5cn/fBLfy/aJMPzR/ZoQZGv3aeTakKafUbQBBV
	Lp7NQi6+Cl8/aYXB3zoW7LKtAgHJFzJT0cntLPkulbEtSQcQYRoZVy2oOOOM2bynXGvw
	UvH6X8CRE1yFISd0xxJj3j/48Vpuk+GzwIWZlJBpTtkxGnpZ4yIa9tDB7QSHh20nsPcH
	287w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rN9fL27MQAdOaBYaR447FSMy+YtTuaRPwxmcyh6fEwM=;
	b=ZuRgC2mdtoibQBxna+pyfQSeoNxxTZu2AhksLhjY/xoKBAN4LL7auYVd+EqOyuaa45
	dgRooIME/iJaXumEXBUuXkUpxhmfw/AJPLlnwTeGe6KjH0zXHFdC+KtsZbw+c+/fYsgy
	jDDmoeDLiQq41om3A3k7u+SQmonTHaIpn9ZvzhIB33z6jEQLcoa841sYsZZU+cxopZeQ
	D8M/qqY1vMoUd/IDIRZ9+c4ghXvHEAIku9haTa3YJg9GgS/8ORcfOjbpMhMGrIbJcTKj
	qUFh24dXCq68yb7HMGxA2BZ2hBnKv9tpC4viL0vxvWOMwtsm+J7ftA60RhAFJGZZssuO
	9EAg==
X-Gm-Message-State: AG10YOQZBmm1vJ5cWUtIakRXrvkoKTfs18D+lJJHYc50TLfldXnZWoEXpr6ntKzbmGU7dRrQazVNE0H6yAevVbZC
X-Received: by 10.107.3.154 with SMTP id e26mr3101555ioi.99.1453465993340;
	Fri, 22 Jan 2016 04:33:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 22 Jan 2016 04:32:53 -0800 (PST)
In-Reply-To: <521837682af1fee8a023a0fbb6ffa0f0761d041e.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<521837682af1fee8a023a0fbb6ffa0f0761d041e.1453029952.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jan 2016 12:32:53 +0000
Message-ID: <CAJTo0LaXAskV2-5VjnVosQXOZD=CCmOXX6K=vhHfT-oJFQoiAw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 65/73] grub: Backport fix for largefile detection/use
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
X-List-Received-Date: Fri, 22 Jan 2016 12:33:15 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a39fd8d0529eb6ccc

--001a113ec10a39fd8d0529eb6ccc
Content-Type: text/plain; charset=UTF-8

On 17 January 2016 at 11:36, Khem Raj <raj.khem@gmail.com> wrote:

> +++ b/meta/recipes-bsp/grub
> /files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch
> @@ -0,0 +1,80 @@
> +From 3bac4caa2bc64db313aaee54fffb90383e118517 Mon Sep 17 00:00:00 2001
> +From: Felix Janda <felix.janda@posteo.de>
> +Date: Thu, 22 Jan 2015 19:54:36 +0100
> +Subject: [PATCH] Remove direct _llseek code and require long filesystem
> libc.
> +
> +---
> +Upstream-Status: Backport
>

Missing Signed-off-by.

Ross

--001a113ec10a39fd8d0529eb6ccc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 January 2016 at 11:36, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":ucu" class=3D"a3s" sty=
le=3D"overflow:hidden">+++ b/meta/recipes-bsp/<span class=3D"il">grub</span=
>/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch<br>
@@ -0,0 +1,80 @@<br>
+From 3bac4caa2bc64db313aaee54fffb90383e118517 Mon Sep 17 00:00:00 2001<br>
+From: Felix Janda &lt;<a href=3D"mailto:felix.janda@posteo.de">felix.janda=
@posteo.de</a>&gt;<br>
+Date: Thu, 22 Jan 2015 19:54:36 +0100<br>
+Subject: [PATCH] Remove direct _llseek code and require long filesystem li=
bc.<br>
+<br>
+---<br>
+Upstream-Status: Backport</div></blockquote></div><br>Missing Signed-off-b=
y.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a113ec10a39fd8d0529eb6ccc--
