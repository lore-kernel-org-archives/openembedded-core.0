Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1310DC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 11:08:39 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web12.8244.1647601717699300114
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 04:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=Fjwz2m0J;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151,
 mailfrom: crg7475@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4KKh8K724Xz9sQc
	for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 12:08:33 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------0OHVAOrU8tIjjyLCcyr5nx4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1647601711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lk6SMqNBJ5EE4C1xbVxZQt3BNSMQLOsuq0chcnI3d60=;
	b=Fjwz2m0JXryboTiASOHJmwbNWRUmO9EQVQAIcExopvAzHb1/ZDVNKQ7f2PNS8+vxAGoeUk
	Uc08uUsorHH45tQAh9jQOEF5jfmVUOwuY0hSnWok6ETbtZ/MERwqq+AyvqQCNvoDKx4mCP
	vogVA3FerGihtRvgTtWLJoRwrbJUvC7ogr+fxPhbL34z+M2q3bY7am3yMGoLfpuxtVXlKB
	GoXPSxpWogntTYdkpTxArgqpP9vuPtuEsJnbC6NBaD3Pr4lyklUjYDABGkVppmAp3OPj5M
	df9FcHmKCaDcQCslwYQ56+5rFiqqt8HonG+FpW7qRCWP+hx4JpyIX+aCRf4Otg==
Message-ID: <3565a11a-1343-caf8-df96-b2bcb02e9c01@mailbox.org>
Date: Fri, 18 Mar 2022 12:08:29 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] libsdl2: Make libunwind dependency optional for
 native builds
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220307080750.489418-1-crg7475@mailbox.org>
 <16DA0F4A680FB7A0.15718@lists.openembedded.org>
 <CANNYZj8W_Zpae8GjiaJBasg8eQxsyZHDbtK7WFpNHLjZTrPCxQ@mail.gmail.com>
 <1c35c3cc1c02cff551da6b43e39a500ec36493bb.camel@linuxfoundation.org>
From: Carlos Rafael Giani <crg7475@mailbox.org>
In-Reply-To: 
 <1c35c3cc1c02cff551da6b43e39a500ec36493bb.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 11:08:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163446

This is a multi-part message in MIME format.
--------------0OHVAOrU8tIjjyLCcyr5nx4c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I am preparing a patch for this. I am somewhat uncertain though if this 
is considered an OK approach or a hack, since we could in theory add 
libunwind-native as a libsdl2-native dependency, but libunwind-native 
itself has build issues, as seen here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio

To me, it seems that the "clean" solution would be to fix 
libunwind-native then. But that may take longer (just guessing here, I 
have no idea about libunwind).

Thoughts?

On 07.03.22 23:39, Richard Purdie wrote:
> On Mon, 2022-03-07 at 10:31 +0100, Alexander Kanavin wrote:
>> Also, is this going to cause non-deterministic builds?
> Yes, it would break if sstate is reused from a system with to a system without
> libunwind.
>
> Can we just disable libunwind for native?
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162869):https://lists.openembedded.org/g/openembedded-core/message/162869
> Mute This Topic:https://lists.openembedded.org/mt/89607589/3617253
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [crg7475@mailbox.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------0OHVAOrU8tIjjyLCcyr5nx4c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Helvetica, Arial, sans-serif">I am preparing a patch
        for this. I am somewhat uncertain though if this is considered
        an OK approach or a hack, since we could in theory add
        libunwind-native as a libsdl2-native dependency, but
        libunwind-native itself has build issues, as seen here:</font></p>
    <p><font face="Helvetica, Arial, sans-serif"><a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio</a></font></p>
    <p><font face="Helvetica, Arial, sans-serif">To me, it seems that
        the "clean" solution would be to fix libunwind-native then. But
        that may take longer (just guessing here, I have no idea about
        libunwind).</font></p>
    <p><font face="Helvetica, Arial, sans-serif">Thoughts?</font><br>
    </p>
    <div class="moz-cite-prefix">On 07.03.22 23:39, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:1c35c3cc1c02cff551da6b43e39a500ec36493bb.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Mon, 2022-03-07 at 10:31 +0100, Alexander Kanavin wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Also, is this going to cause non-deterministic builds?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes, it would break if sstate is reused from a system with to a system without
libunwind.

Can we just disable libunwind for native?

Cheers,

Richard

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#162869): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/162869">https://lists.openembedded.org/g/openembedded-core/message/162869</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/89607589/3617253">https://lists.openembedded.org/mt/89607589/3617253</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:crg7475@mailbox.org">crg7475@mailbox.org</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------0OHVAOrU8tIjjyLCcyr5nx4c--

