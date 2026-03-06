Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C191F51406
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:28:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70106.1772807315738130694
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 06:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hfnfa0B/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6D9484E4258D
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Mar 2026 14:28:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B8F45FF92;
	Fri,  6 Mar 2026 14:28:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 956C1103699EC;
	Fri,  6 Mar 2026 15:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772807312; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VtQnP2XZzavrjmz5eXDe4KzU239u9RRdYtcex2tWtgA=;
	b=hfnfa0B/wNy7rrTeN9oCcV+Bpr0WnE5BYf7lLjvYUtS6Kk9b6Ke1YqqbdWSVrodHeftM0M
	RWjziYWG2v4L9MVVwGYvSpqTYb/1MsMERNuNYQW9Wn3mZGn8DFdB50gVmf5rWF598P2PF5
	J8qbpIr2Gn0JgOJa8DpAOH1l9abUX6zy0UHERbLXy9OKbj2A3KVRULkoR3C9s7cIQPWq0+
	PfXxISZlQnDgghKj+sosXghXYPai/csboQu3OYBoQgmxKT+RNyzRNFlulyLqQxEBraXlYk
	/e4EbJn9Ic2Pj76gZED305GJg4xmZU8dthWwoPlf5bAvHas39OR1ueMqaV/P+w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 15:28:30 +0100
Message-Id: <DGVRQRFYS4K1.2U0TY96UT9IO6@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] oeqa/runtime/ptest: Use a timeout with
 command, remove disabling
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260304184156.2025539-1-richard.purdie@linuxfoundation.org>
 <DGVOBJODEHCK.15P1KY3F0CAFC@bootlin.com>
In-Reply-To: <DGVOBJODEHCK.15P1KY3F0CAFC@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 14:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232577

On Fri Mar 6, 2026 at 12:47 PM CET, Mathieu Dubois-Briand wrote:
> On Wed Mar 4, 2026 at 7:41 PM CET, Richard Purdie via lists.openembedded.=
org wrote:
>> A simple 'which' call doesn't need the timeout disabling. This was likel=
y
>> a copy and paste error and can be removed.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/lib/oeqa/runtime/cases/ptest.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtim=
e/cases/ptest.py
>> index 1a0782374d0..2887e136719 100644
>> --- a/meta/lib/oeqa/runtime/cases/ptest.py
>> +++ b/meta/lib/oeqa/runtime/cases/ptest.py
>> @@ -35,7 +35,7 @@ class PtestRunnerTest(OERuntimeTestCase):
>>          self.do_ptestrunner()
>> =20
>>      def do_ptestrunner(self):
>> -        status, output =3D self.target.run('which ptest-runner', 0)
>> +        status, output =3D self.target.run('which ptest-runner')
>>          if status !=3D 0:
>>              self.skipTest("No -ptest packages are installed in the imag=
e")
>> =20
>

So, a bit more details. I had 4 builds with this patch, because it was
in two branches and tried some rebuilds. All 4 builds failed, but the
failing packages were not always the same:

WARNING: core-image-ptest-openssh-1.0-r0 do_testimage: Can not retrieve art=
ifacts from test target: Error while fetching compressed artifacts
WARNING: core-image-ptest-dpkg-1.0-r0 do_testimage: Can not retrieve artifa=
cts from test target: Error while fetching compressed artifacts
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1186

WARNING: core-image-ptest-openssh-1.0-r0 do_testimage: Can not retrieve art=
ifacts from test target: Error while fetching compressed artifacts
WARNING: core-image-ptest-coreutils-1.0-r0 do_testimage: Can not retrieve a=
rtifacts from test target: Error while fetching compressed artifacts
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1184

WARNING: core-image-ptest-dpkg-1.0-r0 do_testimage: Can not retrieve artifa=
cts from test target: Error while fetching compressed artifacts
WARNING: core-image-ptest-coreutils-1.0-r0 do_testimage: Can not retrieve a=
rtifacts from test target: Error while fetching compressed artifacts
WARNING: core-image-ptest-gettext-1.0-r0 do_testimage: Can not retrieve art=
ifacts from test target: Error while fetching compressed artifacts
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1182

WARNING: core-image-ptest-dpkg-1.0-r0 do_testimage: Can not retrieve artifa=
cts from test target: Error while fetching compressed artifacts
WARNING: core-image-ptest-coreutils-1.0-r0 do_testimage: Can not retrieve a=
rtifacts from test target: Error while fetching compressed artifacts
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1178


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


