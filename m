Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BF2CE8D67
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 17:38:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4010.1763141935141932690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 09:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=R2sXCQyj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B79471A1AAB
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 17:38:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DFAF6060E;
	Fri, 14 Nov 2025 17:38:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CB0B10371750;
	Fri, 14 Nov 2025 18:38:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763141933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GosLZbV5uSzJ/7D2qDwHQewovJ8QYwRRY0MNM8Z3LE4=;
	b=R2sXCQyjXuV9coWDMxInH9122vo7DM7WYLnpHH86R8hyl6VmfFWw8rrb4UHo8jAEGMlPfj
	gKtx4+a5sdU5c/101ccKvscIX8ueZvwO5P4Zn4A8Gq43fRjiq7kJ9Z4TCQG4znU9ti1+sn
	y5/t20b+RFfmWmrM2A9aRbTve0GMVyUIHtEBPDgCGJJHH5OL8kUD/MVHoLp7UKvegviGNZ
	8bu2AVvIrOLBaukFHscWaYSUWT7O8es/HIFa0AuCEA/faS5/qAVVFSQrqvbxqc2aF7GYRt
	LQji6fDqjTJ9f0Fvu3vmZwQo4EPBq4qrXFS4Y9qwyfisoDpiqAzlelkU1rrajA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 18:38:51 +0100
Message-Id: <DE8LNHFXEU6J.1IQJCFFCUST4P@bootlin.com>
Subject: Re: [OE-core] [PATCH] terminal: Show a warning when launched
 terminal quickly exits
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251114-mathieu-too_quick_devshell-v1-1-02b6c6ed9ed6@bootlin.com> <DB5PR02MB10213A5531507F123469BD174EFCAA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213A5531507F123469BD174EFCAA@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 17:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226300

On Fri Nov 14, 2025 at 4:31 PM CET, Peter Kjellerstedt via lists.openembedd=
ed.org wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org> On Behalf Of Mathieu Dubois-Briand via lists.openembedded=
.org
>> Sent: den 14 november 2025 14:30
>> To: openembedded-core@lists.openembedded.org
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Mathieu Dubois-Bria=
nd <mathieu.dubois-briand@bootlin.com>
>> Subject: [OE-core] [PATCH] terminal: Show a warning when launched termin=
al quickly exits
>>=20
> ...
>> @@ -262,7 +264,10 @@ def spawn(name, sh_cmd, title=3DNone, env=3DNone, d=
=3DNone):
>>              os.kill(pid, 0)
>>              time.sleep(0.1)
>>          except OSError:
>> -           return
>> +            if start_time and (time.time() - start_time < 1):
>> +                bb.warn("Terminal \"%s\" started but stopped only after=
 %.2fs while running \"%s\""
>
> "only after" -> "after only"
>

Thanks, I will fix it for next version!

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


