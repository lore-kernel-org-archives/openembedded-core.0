Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730C9FD530C
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 07:44:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90440.1772178277119886514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 23:44:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PRH9Q7t3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F2C871A199B;
	Fri, 27 Feb 2026 07:44:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4C415FE46;
	Fri, 27 Feb 2026 07:44:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B14EC1036921D;
	Fri, 27 Feb 2026 08:44:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772178273; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N5y+3fFcSgdaBQiY4PaLRe3wOsmW27LNLsE2TMBJ91U=;
	b=PRH9Q7t3DqUtoRp4zYtOzM0qWkrnrAcPsfRlyop7l67gS0YHOJYu+X6xYX5LiNzWA9Aswu
	EzzHe396j5RfQ+qVktIXDQBXe3Axz59cEc1hyJL7ixPQf3H31B0hLJUjezlubz7D9T7ZYd
	OGU7nqc6E7Ir9Ioou1NNCPbqltIyemCBec/zJ8f4in1DSVccxzirgqKCt0XuE9a5Lo/lSs
	4YYIWvvHeYY6RfqAw1UVAbv89MZQ52l4Doien2UsfTUbfQ1jrIL4b4sPJHQTzv/Ro3jF0q
	2WKTyOTwEcy+N3itcPSK1Ai76PNJAse/imah79oZXJM+CRa5mt4wzj91Bn+5kw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 08:44:28 +0100
Message-Id: <DGPKRLLSHG5W.1KG0652WTNI6H@bootlin.com>
Subject: Re: [oe-core][PATCHv15 1/6] emptty: add version 0.15.0
Cc: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Randolph Sapp" <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
 <alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260203012028.4008229-1-rs@ti.com>
 <20260203012028.4008229-2-rs@ti.com>
 <DGD4VEZTM65I.2V08DA6RR8L95@bootlin.com> <DGP3FIMYUJ4C.GDARTKLCQ59E@ti.com>
 <DGP3JP9X4ICJ.CFLI2RD62CME@bootlin.com>
In-Reply-To: <DGP3JP9X4ICJ.CFLI2RD62CME@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 07:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232083

On Thu Feb 26, 2026 at 7:14 PM CET, Mathieu Dubois-Briand wrote:
> On Thu Feb 26, 2026 at 7:09 PM CET, Randolph Sapp wrote:
>> On Thu Feb 12, 2026 at 10:45 AM CST, Mathieu Dubois-Briand wrote:
>>> On Tue Feb 3, 2026 at 2:20 AM CET, Randolph Sapp via lists.openembedded=
.org wrote:
>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
>>>> relatively lightweight display manager that supports x11 as well as
>>>> wayland through both a CLI and an automatic login mechanism.
>>>>
>>>> This can effectively replace the custom init scripts for both x11
>>>> (xserver-nodm-init) and wayland (weston-init) with a single tool with
>>>> more verbose logging capabilities.
>>>>
>>>> This is split into two recipes. The emptty package provides the binary
>>>> and various agnostic configs while the emptty-conf package provides th=
e
>>>> default configuration for the application itself. This RPROVIDES
>>>> virtual-emptty-conf, allowing other recipes to provide their own
>>>> configurations to override the default behavior.
>>>>
>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>> ---
>>>
>>> Hi Randolph,
>>>
>>> This patch has been in my branch for a week now, but we are seeing some
>>> intermittent reproducibility issues.
>>>
>>> I opened a bugzilla entry by error, as for a second I thought this patc=
h
>>> was merged, so details can be found here:
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16171
>>>
>>> Diffoscope output is here:
>>> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260212-ssslv=
z6_/packages/diff-html/
>>>
>>> Can you have a look at what is going wrong please?
>>>
>>> Thanks,
>>> Mathieu
>>
>> Now that the source epoch has been addressed [1] should I resubmit this =
version
>> of the series? I won't be changing anything since the RFC [2] for the ot=
her
>> issue reported on this series didn't get any comments.
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/meta?id=3D70a7=
4fa2bd9c374bd07b89b426a86991b1d93a5f
>> [2] https://lists.openembedded.org/g/openembedded-core/topic/117730556
>>
>> - Randolph
>
> Hi Randolph,
>
> No the action is on my side, I just forgot to take back your series when
> I took the source epoch fix.
>
> It will be part of my next build, thanks for the ping.
>
> Thanks,
> Mathieu

Hi Randolph,

Sorry, I come with bad news again:

AssertionError: The following rpm packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/emptty-conf-1.0-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/emptty-conf-dbg-1.0-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/emptty-conf-dev-1.0-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3463
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260226-7ma9odle/=
packages/diff-html/

So it looks like the same error as previously.

Now, a first idea: is the version on the right side of diffoscope the
correct one after your SOURCE_DATE_EPOCH fix? It looks like it is.

If that's the case, maybe the left side comes out of sstate from before
your SOURCE_DATE_EPOCH patch was applied, and so the test failure is a
false positive. Incrementing PR might help to fix this.

Any opinion?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


