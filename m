Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CAFC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 20:10:17 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web09.14595.1647634214965560327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 13:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=bOLjDNDi;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151,
 mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4KKw9H5D04z9sSp
	for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 21:10:11 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------VLChfZrHHrVNkhoLYVacGjTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1647634209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Q2T+le+iJN29R7zgqIa5CGmT8UkB826MQ2UAsRVNtA=;
	b=bOLjDNDivIwzhUbJVVeDvPqKoXzjdIx6MKHpO07dL/CA/yCQj83Ts3m6Lpcvs9DEpqh1b0
	02ImV5HFIWqBYI2LQ9XhHsFa2Eqmm0wy0v05XlRPQEmkvN2+5gRqHVUGalTIvWEC2VnHjH
	N2FQIr1Yj3N3M4sO45QUsPQ4XQZVq8Vs2FTPvXF4zyRidayqueu/mp0LCgN964OsMw+GHb
	VoSiflBO4dy++i4cSqSyjSGm7ZX0S3/8ekpJKwvBUNDTDJD05EOcwg0Z724cO9p0r2HJat
	k2rJKF4QyCMXQLpdzPCS+2kDtRQ6WbQjSE8HfmOdFgzCOQdooyH3PZBEHO7JBQ==
Message-ID: <c9bc22ae-94d4-e41d-7a03-fdde6b379515@mailbox.org>
Date: Fri, 18 Mar 2022 21:10:07 +0100
MIME-Version: 1.0
From: Carlos Rafael Giani <crg7475@mailbox.org>
Subject: Re: [OE-core] [PATCH] libsdl2: Make libunwind dependency optional for
 native builds
To: openembedded-core@lists.openembedded.org
References: <20220307080750.489418-1-crg7475@mailbox.org>
 <16DA0F4A680FB7A0.15718@lists.openembedded.org>
 <CANNYZj8W_Zpae8GjiaJBasg8eQxsyZHDbtK7WFpNHLjZTrPCxQ@mail.gmail.com>
 <1c35c3cc1c02cff551da6b43e39a500ec36493bb.camel@linuxfoundation.org>
 <3565a11a-1343-caf8-df96-b2bcb02e9c01@mailbox.org>
 <0911125867a6623a06458da10cbc6ae911c04409.camel@linuxfoundation.org>
Content-Language: en-US
In-Reply-To: 
 <0911125867a6623a06458da10cbc6ae911c04409.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 20:10:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163452

This is a multi-part message in MIME format.
--------------VLChfZrHHrVNkhoLYVacGjTC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I can't do (a) at the moment since I do not have CentOS set up here. As 
for (b), I think that if disabling libunwind in the libsdl2-native build 
only, the impact is minimized, since libsdl2-native is used only for 
other native tools like QEMU.

On 18.03.22 12:35, Richard Purdie wrote:
> On Fri, 2022-03-18 at 12:08 +0100, Carlos Rafael Giani via
> lists.openembedded.org wrote:
>> I am preparing a patch for this. I am somewhat uncertain though if this is
>> considered an OK approach or a hack, since we could in theory add libunwind-
>> native as a libsdl2-native dependency, but libunwind-native itself has build
>> issues, as seen here:
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio
>> To me, it seems that the "clean" solution would be to fix libunwind-native
>> then. But that may take longer (just guessing here, I have no idea about
>> libunwind).
>> Thoughts?
> The key questions are:
>
> a) Can we fix unwind-native to work on centos7 where it breaks? If so, that is
> the best solution.
>
> b) What functionality do we lose if we disable unwind in libsdl? Is it minor
> debugging info or something we really do need?
>
> I'm afraid I don't know the answers to those questions so it makes the correct
> course of action hard to see.
>
> Cheers,
>
> Richard
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163447):https://lists.openembedded.org/g/openembedded-core/message/163447
> Mute This Topic:https://lists.openembedded.org/mt/89607589/3617253
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [crg7475@mailbox.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------VLChfZrHHrVNkhoLYVacGjTC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Helvetica, Arial, sans-serif">I can't do (a) at the
        moment since I do not have CentOS set up here. As for (b), I
        think that if disabling libunwind in the libsdl2-native build
        only, the impact is minimized, since libsdl2-native is used only
        for other native tools like QEMU.</font><br>
    </p>
    <div class="moz-cite-prefix">On 18.03.22 12:35, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:0911125867a6623a06458da10cbc6ae911c04409.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Fri, 2022-03-18 at 12:08 +0100, Carlos Rafael Giani via
lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I am preparing a patch for this. I am somewhat uncertain though if this is
considered an OK approach or a hack, since we could in theory add libunwind-
native as a libsdl2-native dependency, but libunwind-native itself has build
issues, as seen here:
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio</a>
To me, it seems that the "clean" solution would be to fix libunwind-native
then. But that may take longer (just guessing here, I have no idea about
libunwind).
Thoughts?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">The key questions are:

a) Can we fix unwind-native to work on centos7 where it breaks? If so, that is
the best solution.

b) What functionality do we lose if we disable unwind in libsdl? Is it minor
debugging info or something we really do need?

I'm afraid I don't know the answers to those questions so it makes the correct
course of action hard to see.

Cheers,

Richard


</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#163447): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/163447">https://lists.openembedded.org/g/openembedded-core/message/163447</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/89607589/3617253">https://lists.openembedded.org/mt/89607589/3617253</a>
Group Owner: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:crg7475@mailbox.org">crg7475@mailbox.org</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------VLChfZrHHrVNkhoLYVacGjTC--

