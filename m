Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C35CD342C
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 02:38:07 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30765.1777948678815460909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 19:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=Aw/W1Rhr;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152, mailfrom: marek.vasut@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g8jNg09fzz9v7B;
	Tue,  5 May 2026 04:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777948675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=grZttmnSS4kF5U4t3arihZHAST+S42Y39ROsP/AsOq8=;
	b=Aw/W1RhrctXM7VI7YC4UTTHQGM0dGqJgoOEgegUP6CodA1pyTA+w37UKla8w8nEuYHAAG+
	nyV5kO0WRyhIZdAFWr5q8HmRJ8Y2loaWclxypoqfZS8mOMYD9Tgeddkx1nrfxvXJqfiQpa
	UchUdaQfY7N3mMdoC0QTUTCzzbJt5P05oirHKuXlxaVBWs3rQkzqskPULm7zkknKx+FGRC
	uysDpPgGN+C1h4EP0pnppvQse/2XO+zkejcheKleQbHjO/klMQcHQOk1qjwVoTBlPuDepR
	zTx3wCmK9nAnr8v6XDlUdmXsTk1XqyIVS1BRtTz066JyMiAehnpcwltvOXevjw==
Message-ID: <a4490d5a-87e8-47c1-bc44-02c675336f40@mailbox.org>
Date: Tue, 5 May 2026 04:37:51 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] populate_sdk: Execute populate_sdk before rm_work if
 rm_work.bbclass active
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Adam Nilsson <Adam.X.Nilsson@axis.com>,
 Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Patrick Ohly <patrick.ohly@intel.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Philip Lorenz <philip.lorenz@bmw.de>
References: <20260429233224.562584-1-marek.vasut@mailbox.org>
 <e1a87043b8d16e9d2d49d5b0a2ac6ca48a023644.camel@linuxfoundation.org>
 <a8d75cfc-a4db-4c5c-b50e-1bc5f5df4511@mailbox.org>
 <be574cf23e4adf794471c99899db4a862d87c370.camel@linuxfoundation.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <be574cf23e4adf794471c99899db4a862d87c370.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-MBO-RS-ID: e44ca310cd3017d78a7
X-MBO-RS-META: iuoyfuf4jehyg1hs3oqbwpuiy8cnrd6k
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 02:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236461

On 5/3/26 12:07 AM, Richard Purdie wrote:

Hello Richard,

>>>> +addhandler inject_sdk_rm_work
>>>> +inject_sdk_rm_work[eventmask] =3D "bb.event.RecipeTaskPreProcess"
>>>> +python inject_sdk_rm_work() {
>>>> +=C2=A0=C2=A0=C2=A0 if d.getVar('RM_WORK_BUILD_WITHOUT'):
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask('do_pop=
ulate_sdk', 'do_rm_work', ' ', d)
>>>> +}
>>>
>>> The solution is creative but I suspect it will cause problems with
>>> populate_sdk being injected into builds where it otherwise wasn't goi=
ng
>>> to run.
>>
>> Currently, both populate_sdk.bbclass and populate_sdk_base.bbclass
>> already contain "addtask populate_sdk", so aren't those tasks already
>> injected into all such builds?
>>
>> My understanding is, that bb.build.addtask() only extends that addtask
>> with optional " ... before rm_work" in case the rm_work bbclass is
>> inherited in the build, so it shouldn't change the current behavior of
>> these bbclasses, except for the rm_work case.
>=20
> When you run "bitbake XXX", it executes the default task, which is do_b=
uild.
>=20
> If you add:
>=20
> addtask do_populate_sdk before do_build
>=20
> it will always run do_populate_sdk when you run "bitbake XXX", which is
> a change of behaviour to what currently happens.
Ahh, I understand, thank you for clarifying, it wasn't immediately=20
obvious to me.

Would it be acceptable to remove rm_work from image recipes to mitigate=20
this issue , or maybe image recipes which also inherit populate_sdk ? I=20
know this does reduce the usefulness of rm_work bbclass by keeping the=20
image recipe content around. Something like this is what I have in mind:

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 52ecfafb72d..0d31c7da55d 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -166,6 +166,8 @@ inject_rm_work[eventmask] =3D=20
"bb.event.RecipeTaskPreProcess"
  python inject_rm_work() {
      if bb.data.inherits_class('kernel', d):
          d.appendVar("RM_WORK_EXCLUDE", ' ' + d.getVar("PN"))
+    if bb.data.inherits_class('image', d):
+        d.appendVar("RM_WORK_EXCLUDE", ' ' + d.getVar("PN"))
      # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
      excludes =3D (d.getVar("RM_WORK_EXCLUDE") or "").split()
      pn =3D d.getVar("PN")


