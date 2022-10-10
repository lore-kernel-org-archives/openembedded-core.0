Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF41C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 23:05:26 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.1184.1665443117275950425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 16:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=SMSOAfUZ;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.52,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1322d768ba7so14050099fac.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 16:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IWnsKJCEnz02iqz5aiKMCehctyYjfJGkDPHm7/NgqCE=;
        b=SMSOAfUZPd0UuHw31/oWdSHUiLgJBw85ZsWITM/mqVfJ71ygMNlSLf7vqSoYn+TnlC
         xDPNHFcII8jsjBb1Cf3QoZ+RyGi0gsabRJ+idN6+jmV5qZG38Ve/X6MTrJPoZ38x1VFg
         aWAiGnXHXmIawftOpXIHdroFYeRMJ7GmSo05gBGDKn7DZKpPIjQuzq1ExowF1u+MoZ1v
         nwG/aEFUDYxVEf0sPcehTezPDZZKNbzdayLQC9KW3hbYwFJTXORvFmnp12iAhNx9FG1C
         P8vA3p7iJZq2Lg9PkNITwULJ+F4HwVia0dwlmHs5+bxPERHmys6H9uwPFDh61b1PIwG1
         UjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IWnsKJCEnz02iqz5aiKMCehctyYjfJGkDPHm7/NgqCE=;
        b=PYnDEroDQj7QFjujYoKj8s3zWVDLrXix2eqN5MICptVGqS8iX8QwKmoDxbSiBfT4hK
         ED/kH2iD7oq9xZ8Y5fDFpHf+xRLhccSZ8UrhGV2JXq9+HNFwAehIK9RTVVlmE7p+nX1u
         MvFzid814MHCnMNzGNtnCvGdbsFVBVebZ4VNflmqULfqRjK0o/14ORK9CZnEobQQsQJP
         1ws27ERmrm7M/AbVq0ESdwLSJjynGeZgoP39fL9RKBcGUVh1ij84V1dtQ5QSLli98J0C
         Lkz4gNfN4nb1jlMnGg5dGYWiKGLxQDwFGme12E+50smStmwkEkqUZfWx9qmNSjLwo9Mm
         HL3w==
X-Gm-Message-State: ACrzQf29iXh145RWT1n5dw6nIW5/1Xz6SaLpltlUNBCk49OYrhv+IwgO
	PCjSCMdwdBsznCAe8y7fIAe6J6yg+LaM8ZSU
X-Google-Smtp-Source: 
 AMsMyM5GC6fKpEOdGvRLHFuFylJb4oSdEstE+oXFniSxuzjT9NLswxv14vCHPJKVGLA/7NQuSJUbMQ==
X-Received: by 2002:a05:6870:fb93:b0:131:c354:b7d3 with SMTP id
 kv19-20020a056870fb9300b00131c354b7d3mr10914482oab.20.1665443115863;
        Mon, 10 Oct 2022 16:05:15 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com.
 [209.85.160.52])
        by smtp.gmail.com with ESMTPSA id
 b15-20020a056808010f00b00354932bae03sm1559520oie.10.2022.10.10.16.05.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 16:05:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso14037872fac.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 16:05:15 -0700 (PDT)
X-Received: by 2002:a05:6870:c094:b0:132:dedc:bdb with SMTP id
 c20-20020a056870c09400b00132dedc0bdbmr14886639oad.252.1665443114780; Mon, 10
 Oct 2022 16:05:14 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAP9ODKqkPRSzkGFCb1Yyt9U1Ut+nOzyhPtb19HgrN4p5AXun1g@mail.gmail.com>
 <B4C207D2-A37B-4CA5-A418-DD1387741263@arm.com>
In-Reply-To: <B4C207D2-A37B-4CA5-A418-DD1387741263@arm.com>
Date: Mon, 10 Oct 2022 20:05:03 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKpw=Vk=2ndaxVcAUAp7QM=ADsQPWUhyjWwO7VFwT1zo6w@mail.gmail.com>
Message-ID: 
 <CAP9ODKpw=Vk=2ndaxVcAUAp7QM=ADsQPWUhyjWwO7VFwT1zo6w@mail.gmail.com>
Subject: Re: [OE-core] How is 'devtool sdk-install' supposed to work?
To: Ross Burton <ross.burton@arm.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Daiane Angolini <angolini@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	"paul.eggleton@linux.microsoft.com" <paul.eggleton@linux.microsoft.com>
Content-Type: multipart/alternative; boundary="00000000000040101b05eab631bb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 23:05:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171588

--00000000000040101b05eab631bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 10 de out. de 2022 =C3=A0s 07:35, Ross Burton <ross.burton@arm.com=
>
escreveu:

> Copying in Paul as he was involved in this code so might have some
> thoughts=E2=80=A6
>
> On 9 Oct 2022, at 20:57, Otavio Salvador via lists.openembedded.org
> <otavio.salvador=3Dossystems.com.br@lists.openembedded.org> wrote:
> >
> > Hello all,
> >
> > Daiane and I are working on the 3rd edition of our Yocto Project book
> and now working on the chapter where we'd like to cover the eSDK use
> better. We are likely missing something obvious, but it is better to ask =
if
> we can't figure it out.
> >
> > How is 'devtool sdk-install' supposed to work?
> >
> > We used the 'devtool sdk-install -s libpng' command, and the build
> succeeded, but the package didn't install. The error is:
> >
> > ERROR: Failed to install libpng - unavailable
>
> Yeah, I just hit that too.
>
> I wonder if the hash equiv broke something=E2=80=A6
>

It does; setting it to use OEBasicHash did the trick.


> Interestingly, the eSDK tests use that, so either they=E2=80=99re doing s=
omething
> special, or they=E2=80=99re not actually running.  It may be the latter.
>

Or it doesn't use same schema.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000040101b05eab631bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em seg., 10 de out. de 2022 =C3=A0s 0=
7:35, Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@ar=
m.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Copying in Paul as he was involved in this code so might have some =
thoughts=E2=80=A6<br>
<br>
On 9 Oct 2022, at 20:57, Otavio Salvador via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a>=
 &lt;otavio.salvador=3D<a href=3D"mailto:ossystems.com.br@lists.openembedde=
d.org" target=3D"_blank">ossystems.com.br@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt; <br>
&gt; Hello all,<br>
&gt; <br>
&gt; Daiane and I are working on the 3rd edition of our Yocto Project book =
and now working on the chapter where we&#39;d like to cover the eSDK use be=
tter. We are likely missing something obvious, but it is better to ask if w=
e can&#39;t figure it out.<br>
&gt; <br>
&gt; How is &#39;devtool sdk-install&#39; supposed to work?<br>
&gt; <br>
&gt; We used the &#39;devtool sdk-install -s libpng&#39; command, and the b=
uild succeeded, but the package didn&#39;t install. The error is:<br>
&gt; <br>
&gt; ERROR: Failed to install libpng - unavailable<br>
<br>
Yeah, I just hit that too.<br>
<br>
I wonder if the hash equiv broke something=E2=80=A6<br></blockquote><div><b=
r></div><div>It does; setting it to use OEBasicHash did the trick.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Interesting=
ly, the eSDK tests use that, so either they=E2=80=99re doing something spec=
ial, or they=E2=80=99re not actually running.=C2=A0 It may be the latter.<b=
r></blockquote><div><br></div><div>Or it doesn&#39;t use same schema.=C2=A0=
</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature=
">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http:/=
/www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=
=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-785=
4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--00000000000040101b05eab631bb--

