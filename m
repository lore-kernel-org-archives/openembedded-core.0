Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E14CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 08:26:42 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.33255.1712219194985037257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 01:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GcCu4HH3;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-479cd22b586so86599137.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 01:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712219194; x=1712823994; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9rBpB9wRtTjRGKAOJ9OmhnkZWerxrjFEUdHKymhsiD4=;
        b=GcCu4HH3Jwp0N9Yuex+yFQKbNW8H/OoqhH7NuXqNU0WYMRq+c+jjXC+yC2uhnqggCX
         LLKRdfxTJCoAuvkc7cnKl1Kf6oRYkBE/PtvJJ9LBeNg+3YwmDkuONVbRiq4r6lrPLHvx
         /x6q/Mif/V8eMc4E12gDUwWMGH7BBjUUSuskypbdnxD14VybN8kBcegh7BOWnnoBQgn+
         vxQlO7BCNOwVzCsQc7gl8oPVTrjMn/aHjXy0bQNIciAm3jNS8FPnq3K84Pd9biYxZoPL
         oY4wSYpN7mHN9dq//5lyuE2b5OcAI0vpE3hirFGBFAeFhncpEkvkRC1/YrHX2TGS+HnB
         updQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712219194; x=1712823994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rBpB9wRtTjRGKAOJ9OmhnkZWerxrjFEUdHKymhsiD4=;
        b=nPRjRlI+rXsoUnUSvs2WqdnhpWBfh+7+bmxa5ctGQKca6nvAt/iexb2z2wowpYOSkt
         Nj8Dr9KLl/HgPqBtMogMRTa+ATxkilQxc2JA7zauJZhXbnbv8MwLNyRINFuMDR2ZknFB
         s3DPT3aa9HBM8ikBPnM79j6947u+jmoZcfsxSQQjMEC9JB50aJik8kexCHn7sFQ7ZTY3
         EAOD6YkzUwQmOLjJ0Kpz4BR2i8xJ6G3e+HTIBft8tm+xLlnWFfmiiDaMA/f/WfqW2NCp
         klaYaGdiTMhYE6hHLCSQfekdvfgt2MUeLAwbrT3jblY9tPs3xW63uUY3uvJt5QLOnzfI
         1REg==
X-Forwarded-Encrypted: i=1; AJvYcCV+zd2KGhaM0UY9+LT2CUH7ax1X9f755abhWFoCNTBW1a4zjqxdlMbox8XIElQW7IusDVyR8A02k7XqufZsheHEv5wIDLI2ARFTYWBjIfXfO6s8EU8pDB4r
X-Gm-Message-State: AOJu0Yw53Qjka+5bfDP+567PVf+vepZsLRyCPYx6GMCe6wHqOKVHAPLZ
	41suFMdC7jDMsnALO8y83cP1I+xuKEAv9Sy/CC6bLeC1YGY/TLEeMujA8xrwiP+NfUIu1BcO6VI
	pUxKsHF4Gymv/6Hv/fA4uCD6BrBs=
X-Google-Smtp-Source: AGHT+IHn6+kyntLnbjjkU4PSFb/3hUxHqGUxrqE6V5UxvLpzOU9si1VtX4Vf7Wtm7W1mAWTqsPj3F8CYD/6G4FMsA6I=
X-Received: by 2002:a67:eb8d:0:b0:478:9112:60a with SMTP id
 e13-20020a67eb8d000000b004789112060amr1568278vso.16.1712219193561; Thu, 04
 Apr 2024 01:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=TS-3GUT5AEgf17rJjk-xP7YxBC+efqgEZhwHWaQR17_g@mail.gmail.com>
In-Reply-To: <CAApg2=TS-3GUT5AEgf17rJjk-xP7YxBC+efqgEZhwHWaQR17_g@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 4 Apr 2024 09:26:22 +0100
Message-ID: <CANPvuRmKPVZBed4Qn4nrbQyXJKMjLR==afvr5TOh5fFPhNhE3w@mail.gmail.com>
Subject: Re: [OE-core] OE-core and meta-openembedded: a vulnerability in HTTP servers
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000cf5e0f0615411885"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 08:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197949

--000000000000cf5e0f0615411885
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marta,

I will take care of updating the golang to 1.22.2 witch include a fix for
the CVE-2023-45288
https://github.com/golang/go/commit/e55d7cf8435ba4e58d4a5694e63b391821d4ee9=
b

Jose

Marta Rybczynska <rybczynska@gmail.com> escreveu (quarta, 3/04/2024 =C3=A0(=
s)
21:46):

> Details: https://kb.cert.org/vuls/id/421644
>
> Affected (amongst others): nodejs, oghttp, nghttp2, Apache httpd, go
>
> Multiple CVEs have been issued.
>
> Quoting from the description:
>
> HTTP allows messages to include named fields in both header and
> trailer sections. These header and trailer fields are serialised as
> field blocks in HTTP/2, so that they can be transmitted in multiple
> fragments to the target implementation. Many HTTP/2 implementations do
> not properly limit or sanitize the amount of CONTINUATION frames sent
> within a single stream. An attacker that can send packets to a target
> server can send a stream of CONTINUATION frames that will not be
> appended to the header list in memory but will still be processed and
> decoded by the server or will be appended to the header list, causing
> an out of memory (OOM) crash.
>
> Marta
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197943):
> https://lists.openembedded.org/g/openembedded-core/message/197943
> Mute This Topic: https://lists.openembedded.org/mt/105317551/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000cf5e0f0615411885
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Marta,<br><br>I will take care of updating the golang t=
o 1.22.2 witch=C2=A0include=C2=A0a fix for the=C2=A0CVE-2023-45288<br><a hr=
ef=3D"https://github.com/golang/go/commit/e55d7cf8435ba4e58d4a5694e63b39182=
1d4ee9b">https://github.com/golang/go/commit/e55d7cf8435ba4e58d4a5694e63b39=
1821d4ee9b</a><br><br>Jose</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">Marta Rybczynska &lt;<a href=3D"mailto:rybczynska=
@gmail.com">rybczynska@gmail.com</a>&gt; escreveu (quarta, 3/04/2024 =C3=A0=
(s) 21:46):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Deta=
ils: <a href=3D"https://kb.cert.org/vuls/id/421644" rel=3D"noreferrer" targ=
et=3D"_blank">https://kb.cert.org/vuls/id/421644</a><br>
<br>
Affected (amongst others): nodejs, oghttp, nghttp2, Apache httpd, go<br>
<br>
Multiple CVEs have been issued.<br>
<br>
Quoting from the description:<br>
<br>
HTTP allows messages to include named fields in both header and<br>
trailer sections. These header and trailer fields are serialised as<br>
field blocks in HTTP/2, so that they can be transmitted in multiple<br>
fragments to the target implementation. Many HTTP/2 implementations do<br>
not properly limit or sanitize the amount of CONTINUATION frames sent<br>
within a single stream. An attacker that can send packets to a target<br>
server can send a stream of CONTINUATION frames that will not be<br>
appended to the header list in memory but will still be processed and<br>
decoded by the server or will be appended to the header list, causing<br>
an out of memory (OOM) crash.<br>
<br>
Marta<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197943): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197943" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197943</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105317551/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105317551/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--000000000000cf5e0f0615411885--

