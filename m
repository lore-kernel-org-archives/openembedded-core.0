Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9146DC05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 15:05:29 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.34025.1676819123850000189
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 07:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=al33Vuam;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id g7so424758wrd.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 07:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xtTxd3V+GhC4rMB5+mmW1mXaFEisnf979n5p4XxuJaE=;
        b=al33Vuam952X+bGKzsYT39itGFyzLSbvFLUWPmEVThp6qxLgBXgdAwpomP2Smkhogm
         l6Gsrlb60rJG7cDZ7lmZYINvbKUG+pHqH/PphcU6Wm0R8/JpOJOkYe4D/qAkWuhcr85i
         GFw8KnXIeqii2B1b1mc+hYCQei/2JoBnWsgWEwXqiKfNVOgR3CPOZRtxzkQAUmB8/Hsp
         SwzE/Ot1WBwRITl4ZdKtC2vSW8AWn5AL+A8qBiwIM7oovsA72lYoYcnyt71wzUGgvJqK
         db4Fa3Bw5YajCDU6qnFBbRS72NX1mXniXuIdb6XcXa1VS3mesf68GcWIuo2suyoO8u/T
         Z5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtTxd3V+GhC4rMB5+mmW1mXaFEisnf979n5p4XxuJaE=;
        b=WP8JGKykMR+sCd0xxI/6fc2Bp16rWc3CzQd9EAaucqg99vxsthwSBlEvU59BocbEq2
         dyfS8q/UQB4O51NDum8Hj426FVI09Rf0XQKMcOaLVWVCrVWELaKQSrwjPE3JZi//Iibd
         3Y1pt+wEl3Nyc0Mls8SxNZpQJdjGNr0Gt/tOrNR2pi5S/vWpAADTujK89dakc4pJFZJB
         awoI+Mq36QcP9LWJXEzAZ9AEVyL9AP+XTn9VEjLP6uO76r8xfA9Uc5k1YiXEEzsq2VBO
         P9ZdKQAFv1AN3thPgfhoBbU8mgacUVQbI4phDNkCje9/PdvI23oN5Doh6d1xcJBkLoP1
         OC5g==
X-Gm-Message-State: AO0yUKUSJgosoqcS0t1uys6M5vhoG91QInG31PJMJffm9pVNocpt6Htq
	Y2Kh5NdLlDZOII+ndCCHg8ve8uBTW+Q81OXOWK8=
X-Google-Smtp-Source: AK7set/pGUqWTxiqlq7Jp0X+sWgtKMnOSFSjW469usegVviE70zI9dgwveRBw55nJCuPCnUTxDUK4xVf3SCulxWvzag=
X-Received: by 2002:adf:e909:0:b0:2c5:96a5:5b94 with SMTP id
 f9-20020adfe909000000b002c596a55b94mr74698wrm.1.1676819122101; Sun, 19 Feb
 2023 07:05:22 -0800 (PST)
MIME-Version: 1.0
References: <20230209080022.147333-1-sdoshi@mvista.com> <CA+chaQfPjoRQfsYrnqDwMq6OiE5JtR0mFMXQsrHOOuA-0CSgyA@mail.gmail.com>
 <CAOSpxdbUkXEn0uEfzN21jncJ_n8Ur66uskWZ4b7KGKN+1w3_MQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbUkXEn0uEfzN21jncJ_n8Ur66uskWZ4b7KGKN+1w3_MQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 19 Feb 2023 16:05:11 +0100
Message-ID: <CA+chaQeL3aRd4tB7t5Eh4rQ-Nxe8QwO+OM8kO1h4t-XYVweP2w@mail.gmail.com>
Subject: Re: [OE-core] [[kirkstone][PATCH] openssl : Upgrade OpenSSL 3.0.7 ->
 3.0.8] openssl: Upgrade 3.0.7 -> 3.0.8
To: Steve Sakoman <steve@sakoman.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: mv <sdoshi@mvista.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002021e205f50ee04f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 15:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177333

--0000000000002021e205f50ee04f
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 19, 2023 at 3:13 PM Steve Sakoman <steve@sakoman.com> wrote:

> On Sun, Feb 19, 2023 at 2:36 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > Hello Steve, Siddharth,
> >
> > are you waiting for PATCHv3 with commit summary update requested in
> corresponding langdale review:
> >
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230209143708.20705-1-sdoshi@mvista.com/
> ?
> >
> > or is something else blocking this upgrade?
> >
> > I'm a bit surprised that this high security issue wasn't yet merged even
> in oe-core/master-next and I don't see it in
> oe-core-contrib/stable/kirkstone-nut nor
> oe-core-contrib/stable/langdale-nut.
>
> If a patch is intended for multiple branches I typically wait until
> master has merged the patch before taking it into the other branches.
>
> So that is why it isn't yet in langdale/kirkstone.
>

Thanks Steve!

So I guess it's now question for Alexandre or RP as it isn't in:
https://git.openembedded.org/openembedded-core-contrib/log/?h=abelloni/master-next
https://git.openembedded.org/openembedded-core/log/?h=master-next

FWIW: I've this commit included with the updated commit message my builds
for master, langdale, kirkstone since it was sent to ML (e.g.
https://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/kirkstone&id=e761db1cdef7fe62503b899a7762a8eb030e566f
) and haven't seen any issues related to it.

Cheers,

--0000000000002021e205f50ee04f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Feb 19, 2023 at 3:13 PM Steve Sak=
oman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wro=
te:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Sun, Feb 19, 2023 at 2:36 AM Martin Jansa &lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; Hello Steve, Siddharth,<br>
&gt;<br>
&gt; are you waiting for PATCHv3 with commit summary update requested in co=
rresponding langdale review:<br>
&gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/20=
230209143708.20705-1-sdoshi@mvista.com/" rel=3D"noreferrer" target=3D"_blan=
k">https://patchwork.yoctoproject.org/project/oe-core/patch/20230209143708.=
20705-1-sdoshi@mvista.com/</a>?<br>
&gt;<br>
&gt; or is something else blocking this upgrade?<br>
&gt;<br>
&gt; I&#39;m a bit surprised that this high security issue wasn&#39;t yet m=
erged even in oe-core/master-next and I don&#39;t see it in oe-core-contrib=
/stable/kirkstone-nut nor oe-core-contrib/stable/langdale-nut.<br>
<br>
If a patch is intended for multiple branches I typically wait until<br>
master has merged the patch before taking it into the other branches.<br>
<br>
So that is why it isn&#39;t yet in langdale/kirkstone.<br></blockquote><div=
><br></div><div>Thanks Steve!</div><div><br></div><div>So I guess it&#39;s =
now question for Alexandre or RP as it isn&#39;t in:<br></div><div><a href=
=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dabellon=
i/master-next">https://git.openembedded.org/openembedded-core-contrib/log/?=
h=3Dabelloni/master-next</a><br></div><div><a href=3D"https://git.openembed=
ded.org/openembedded-core/log/?h=3Dmaster-next">https://git.openembedded.or=
g/openembedded-core/log/?h=3Dmaster-next</a><br></div><div><br></div><div>F=
WIW: I&#39;ve this commit included with the updated commit message my build=
s for master, langdale, kirkstone since it was sent to ML (e.g.=C2=A0<a hre=
f=3D"https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djan=
sa/kirkstone&amp;id=3De761db1cdef7fe62503b899a7762a8eb030e566f">https://git=
.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/kirkstone&amp=
;id=3De761db1cdef7fe62503b899a7762a8eb030e566f</a> ) and haven&#39;t seen a=
ny issues related to it.</div><div><br></div><div>Cheers,</div></div></div>

--0000000000002021e205f50ee04f--

