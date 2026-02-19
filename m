Return-Path: <tonyb@cybernetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AF0E9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 15:25:15 +0000 (UTC)
Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16037.1771514708634526966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 07:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cybernetics.com header.s=mail header.b=MftnSyIQ;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: tonyb@cybernetics.com)
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id gfSm5OkWoe1Dx1Gn; Thu, 19 Feb 2026 10:25:07 -0500 (EST)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=xgFyPcWQQ/leM5lI8o3uzGPOA1JhQRY8Ws/FD4JNw7w=;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:
	References:To:Subject:MIME-Version:Date:Message-ID; b=MftnSyIQZsvPVLy5R4HKlNw
	erR07LyqHMLHArg8kC9nn29jrx/PYfEL9/jcaGZHiLbTWcChJrl5sQz6NumPB4SjiV1oVmFRtRYlF
	V4XTKQRofB3J8UntvhkXn7ZqA3BMiot1Ey2L3de6CmTWHiVD1HbP4nmR1Wkmu/VAjyiEQWY=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate SPEC SMTP 8.0.5)
  with ESMTPS id 14413125; Thu, 19 Feb 2026 10:25:07 -0500
Message-ID: <37d9c1ba-dd3e-4563-a60c-a057d6af563f@cybernetics.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
Date: Thu, 19 Feb 2026 10:25:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] texinfo: Fix gcc 15 compile errors
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
X-ASG-Orig-Subj: Re: [OE-core] [PATCH v2] texinfo: Fix gcc 15 compile errors
References: <cd8dabb4-fc3b-426e-8dea-c8c83e87f3f4@cybernetics.com>
 <63299bf7a75a50a7b9c7a669a83a117fd014dae3.camel@pbarker.dev>
Content-Language: en-US
From: Tony Battersby <tonyb@cybernetics.com>
In-Reply-To: <63299bf7a75a50a7b9c7a669a83a117fd014dae3.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1771514707
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 1252
X-ASG-Debug-ID: 1771514707-1cf43940a60c940001-7zcVdP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 15:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231431

On 2/19/26 10:13, Paul Barker wrote:
> On Mon, 2026-02-16 at 11:40 -0500, Tony Battersby via
> lists.openembedded.org wrote:
>> gcc 15 switches the default from -std=3Dgnu17 to -std=3Dgnu23, which c=
auses
>> multiple errors compiling texinfo:
>>
>> texinfo-7.2/info/terminal.c:164:7:
>>   error: too many arguments to function 'tputs'; expected 0, have 3
>> etc.
>>
>> My patch to fix the issue has been accepted upstream; backport it sinc=
e
>> texinfo 7.2 is still the latest release.
>>
>> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> I wonder why you're seeing this error and we're not seeing it on the
> autobuilder... termcap.h is provided by ncurses, which is listed in bot=
h
> DEPENDS and DEPENDS:class-native in the recipe, so in theory you
> shouldn't see the case where that file is not available during the
> texinfo build.
>
> Is the error seen when building texinfo for the target or
> texinfo-native? And is there anything unique in terms of host distro,
> local.conf, layers, etc that you think might be triggering this?

Upon further investigation, it looks like the problem is triggered by
changes made in our custom layers.=C2=A0 So upstream probably does not ne=
ed
this patch after all.

Tony Battersby


