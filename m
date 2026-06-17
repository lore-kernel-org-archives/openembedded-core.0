Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15DBCD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 16:34:45 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20029.1781714084770629702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 09:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bjwnlvGz;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ce9df4732cso68493826d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 09:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781714084; cv=none;
        d=google.com; s=arc-20240605;
        b=HXeVLgb0b8BGjDj4YlRvMAAhHlGYQ68b+plnhgChndcFqVYJ996jsi45byyn6a19a4
         v2EfldI0f2g2QlxNTME1CUkFQXXXXkgN1PM4WuNYNFxe+un/DPPE2hfl9H/SFxq2gvlI
         XUXifkl1QG10akWmFwh3jRd0/8FuLDZi1HvnZUj0WCY1N25Yuv2/6Y7XdkGWcYaVmoCT
         hhQ2njxEz9bFyZfDwYa+i1ZEOA5BzUK81yq9DuqMbpslWCcOjATih3nJyvZZrn1femv2
         5O5l05AOe89RarrojXdPUuCvxqUVcGkgEa1QEPhlDjnzANGGOapXm0RqoXUJBFxpPPiR
         311A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CMvVTI7oSkFtdlts1YCWltrt4O6O4sPn2PQByqvQRzU=;
        fh=YRJc2tTl+vbDg29/kAI/g/0iUutlAMxIfM7pIu1fCGo=;
        b=g2YrPgO1bqgWLA/kVA2HCBSfq+4vLU6R5/U6n3N1qxwZNdcQVIjayBiK3BbbV+9W3D
         hJVm9aSNupWYqjv+0V9U7Zx5zQoKCot5n7q1gZe4W3zY+bo7N+20zGgC+G2dkh/j7trN
         5GN12N1Q4GMAFc5vjRIzA8UtHBmFD/UD636BS0EeIRilOg7yPLEzty9cUgFfb8mTZtxJ
         N3J0ZeaYnX+VV7eQZRGBrlPMS90VBKi2zB9s+p+MXdwDqiHEnyhUx79P1B0K1/UjhJN4
         chp6/6tZ3CZC1DNapkDCTfgPIQcmdTRlW42/gT0hZxBKdabkOWJ2Djr+jg/4yMjsIWhj
         5Tzg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781714084; x=1782318884; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CMvVTI7oSkFtdlts1YCWltrt4O6O4sPn2PQByqvQRzU=;
        b=bjwnlvGzpSYf8DdPQJ3LSKiYN0EDr7G5rpZW2L3sYTwWzbUlo43rmE+CJQwdFE8A1x
         aiTdNswGQ2ZYDA40xYAgYkDMn94RTaSctBPm+Nw8O1CTzrFvBconz70GD6EdTmEfqpPp
         UXY2eY5vuj4r2X+cD58aQJgriuYe/A1lFGdoirkFrkTxRPtCUe5Z71rTY+vJ8zKsEv5a
         uM1eywF/bYyHtkAcSFcBh1XU8/QvOyg/xKS+wd6Fmd5zeEdgSYGe2s2be0yKVVRpN121
         vNrIM8FUZN6r8paF1Aq03Zspag4B1PaUvHINKEveCZNXqUkQJd3YWa99T3oBtEVOTg5a
         Y2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781714084; x=1782318884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMvVTI7oSkFtdlts1YCWltrt4O6O4sPn2PQByqvQRzU=;
        b=ENgtMmP3kR7Re81R4JCU0LzvqpnJ1v8JoS1ou0kmZXKLnHJ/YctecGpcHoh3hUEOcW
         XeMKUNsvgKJ6v6Bw0oiGXHoGmX9N75fWNmdlIF9aQLnWQ6QpDNb2z1hyWnsE2igBIRVC
         TPswN3s4kNILva6X9T/XNJbxM+TiKKZq9s29e0xIyPyg9S/JFN+KE0H7ZGpiRsDNIdHK
         2mSXtptDDKGe9GbKKaHXs4lqQ5kTrGdw52/9GeOnWoRbwykOQETjHYyYoe5VDxKt9gKI
         hsDOvqnNUXjp+gmJJnknJ0Fzc50NehduHwYmHfvVU0/Q+iadEH7N8cZU6WRXR/1idzAX
         yj9A==
X-Forwarded-Encrypted: i=1; AFNElJ8lJ82/ffjpxNAkQuI4BSftppqpxTDb5NnSMVp7tpWqPMOvmFIMREHZFCfIE9Gm3+n1iKQHmWw84uLaPGl4O0L9NQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YztV2N8USLfE9J8r+mh9jrD5HzCmcLuOsEPijpJPNr4HDazHgnh
	yx6EKgukTmgz4QOjQPkoAOM2+HSnBMEfawG3VPp+obXn8JH9R4SAy56zB6yV3Qpf5wkDZtfp6kn
	YabUNjCEJ4IzEhH62/k0C4i39yAn+yfI=
X-Gm-Gg: AfdE7ck9xs54vhtdk1a77cRvYbl8ZtSu9zEGk0AoqRkxPXkVGVTgmn40SfxxkR+C6xF
	FqT4puftgzXpOAyEG/xLi5auu3YqxF3qcrEBnU8flXy74XsG+VIqSzlOBgcoKaETQ75y/Ka/QNZ
	/Gcv6EQk/KUKT3ynOnR0p2c55g0xlby4JqHCXUOt+6lcI3oGGd8Tlcp4SKWit4phFBcpKHfJMZo
	TlbQM1yq3DuqY22fGdgUAhcEw/B8XOIszAJOnnusBRxwlLpi5yptrFLmwwRwb/t2tf3XBU7X9Hi
	Dp4AU/7OEhAJI21gV6hbjs8mRaExkA==
X-Received: by 2002:a05:6214:2f8c:b0:8ce:aace:eaf8 with SMTP id
 6a1803df08f44-8db84789759mr81653256d6.43.1781714083029; Wed, 17 Jun 2026
 09:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260616194959.3748347-1-peter.marko@siemens.com>
 <20260616194959.3748347-2-peter.marko@siemens.com> <DJB9ANBS943K.UFIZ5E6NY3GB@bootlin.com>
 <AS8PR10MB50732FFF648B29B3D26E23F8FDE42@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50732FFF648B29B3D26E23F8FDE42@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Jun 2026 18:34:32 +0200
X-Gm-Features: AVVi8CeX11ItoqQYR7mREL_vo_3u34tW-qWIvDTTfndMvnM-LoRnbcDhkZHOV-k
Message-ID: <CANNYZj9i2uZ+VrVrcPr8c-dXxKXEGvUe0Z1f9JOV4cnf4=on_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] libpcre: remove recipe
To: peter.marko@siemens.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000002a5e5065475a33c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 16:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239037

--00000000000002a5e5065475a33c
Content-Type: text/plain; charset="UTF-8"

You need to find out what slang is used for and whether disabling pcre
affects that. Or find out if slang itself can be dropped.

Alex

On Wed 17. Jun 2026 at 18.10, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:

> Unfortunately, I didn't notice statement PROVIDES += "pcre".
> After modifying my grep to "pcre" instead of "libpcre" slang suddenly
> appeared (luckily nothing more).
>
> Possibly I tried to do this cleanup too early, since slang doesn't support
> pcre2 yet.
> Or would it be acceptable to disable pcre package config by default?
>
> Peter
>
> > -----Original Message-----
> > From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> > Sent: Wednesday, June 17, 2026 12:36 PM
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 2/3] libpcre: remove recipe
> >
> > On Tue Jun 16, 2026 at 9:49 PM CEST, Peter Marko via
> lists.openembedded.org
> > wrote:
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> >
> > Hi Peter,
> >
> > Thanks for your patch.
> >
> > > libpcre is obsolete project replaced by libpcre2.
> > > It was not updated for last 5 years.
> > > There is no consumer of this recipe in oe-core anymore.
> > >
> >
> > Or maybe there is one :)
> >
> > ERROR: Nothing PROVIDES 'pcre' (but
> /srv/pokybuild/yocto-worker/qemuriscv64-
> > ptest/build/layers/openembedded-core/meta/recipes-extended/slang/
> slang_2.3.3.bb
> > DEPENDS on or otherwise requires it). Close matches:
> >   pcre2
> > NOTE: Runtime target 'slang-ptest' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['slang-ptest', 'pcre']
> > NOTE: Runtime target 'core-image-ptest-all-dev' is unbuildable,
> removing...
> > Missing or unbuildable dependency chain was:
> ['core-image-ptest-all-dev', 'core-
> > image-ptest-slang', 'slang-ptest', 'pcre']
> > NOTE: Runtime target 'core-image-ptest-all' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['core-image-ptest-all',
> 'core-image-
> > ptest-slang', 'slang-ptest', 'pcre']
> > NOTE: Runtime target 'core-image-ptest-slang' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['core-image-ptest-slang',
> 'slang-
> > ptest', 'pcre']
> > ERROR: Nothing RPROVIDES 'slang' (but /srv/pokybuild/yocto-
> > worker/qemuriscv64-ptest/build/layers/openembedded-core/meta/recipes-
> > extended/slang/slang_2.3.3.bb RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'slang'
> > NOTE: Runtime target 'slang' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['slang']
> > ERROR: Nothing RPROVIDES 'slang-dev' (but /srv/pokybuild/yocto-
> > worker/qemuriscv64-ptest/build/layers/openembedded-core/meta/recipes-
> > extended/slang/slang_2.3.3.bb RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'slang-dev'
> > NOTE: Runtime target 'slang-dev' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['slang-dev']
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1764
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3838
> >
> > This is because of a PACKAGECONFIG, if there is no way to use libpcre2,
> > maybe it can be disabled by default?
> >
> > Thanks,
> > Mathieu
> >
> > --
> > Mathieu Dubois-Briand, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239036):
> https://lists.openembedded.org/g/openembedded-core/message/239036
> Mute This Topic: https://lists.openembedded.org/mt/119839709/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000002a5e5065475a33c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">You need to find out what slang is used for and whether d=
isabling pcre affects that. Or find out if slang itself can be dropped.=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed 17. Jun 2026 at 18.10, Peter Marko via <a href=3D"http://=
lists.openembedded.org">lists.openembedded.org</a> &lt;peter.marko=3D<a hre=
f=3D"mailto:siemens.com@lists.openembedded.org">siemens.com@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Unfortunately, I didn&#39;t notice statement PROVIDES +=3D &quot;pcr=
e&quot;.<br>
After modifying my grep to &quot;pcre&quot; instead of &quot;libpcre&quot; =
slang suddenly appeared (luckily nothing more).<br>
<br>
Possibly I tried to do this cleanup too early, since slang doesn&#39;t supp=
ort pcre2 yet.<br>
Or would it be acceptable to disable pcre package config by default?<br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-brian=
d@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt;<=
br>
&gt; Sent: Wednesday, June 17, 2026 12:36 PM<br>
&gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko@s=
iemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;;<br>
&gt; <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"=
_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH 2/3] libpcre: remove recipe<br>
&gt; <br>
&gt; On Tue Jun 16, 2026 at 9:49 PM CEST, Peter Marko via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a><br>
&gt; wrote:<br>
&gt; &gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; Hi Peter,<br>
&gt; <br>
&gt; Thanks for your patch.<br>
&gt; <br>
&gt; &gt; libpcre is obsolete project replaced by libpcre2.<br>
&gt; &gt; It was not updated for last 5 years.<br>
&gt; &gt; There is no consumer of this recipe in oe-core anymore.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Or maybe there is one :)<br>
&gt; <br>
&gt; ERROR: Nothing PROVIDES &#39;pcre&#39; (but /srv/pokybuild/yocto-worke=
r/qemuriscv64-<br>
&gt; ptest/build/layers/openembedded-core/meta/recipes-extended/slang/<a hr=
ef=3D"http://slang_2.3.3.bb" rel=3D"noreferrer" target=3D"_blank">slang_2.3=
.3.bb</a><br>
&gt; DEPENDS on or otherwise requires it). Close matches:<br>
&gt;=C2=A0 =C2=A0pcre2<br>
&gt; NOTE: Runtime target &#39;slang-ptest&#39; is unbuildable, removing...=
<br>
&gt; Missing or unbuildable dependency chain was: [&#39;slang-ptest&#39;, &=
#39;pcre&#39;]<br>
&gt; NOTE: Runtime target &#39;core-image-ptest-all-dev&#39; is unbuildable=
, removing...<br>
&gt; Missing or unbuildable dependency chain was: [&#39;core-image-ptest-al=
l-dev&#39;, &#39;core-<br>
&gt; image-ptest-slang&#39;, &#39;slang-ptest&#39;, &#39;pcre&#39;]<br>
&gt; NOTE: Runtime target &#39;core-image-ptest-all&#39; is unbuildable, re=
moving...<br>
&gt; Missing or unbuildable dependency chain was: [&#39;core-image-ptest-al=
l&#39;, &#39;core-image-<br>
&gt; ptest-slang&#39;, &#39;slang-ptest&#39;, &#39;pcre&#39;]<br>
&gt; NOTE: Runtime target &#39;core-image-ptest-slang&#39; is unbuildable, =
removing...<br>
&gt; Missing or unbuildable dependency chain was: [&#39;core-image-ptest-sl=
ang&#39;, &#39;slang-<br>
&gt; ptest&#39;, &#39;pcre&#39;]<br>
&gt; ERROR: Nothing RPROVIDES &#39;slang&#39; (but /srv/pokybuild/yocto-<br=
>
&gt; worker/qemuriscv64-ptest/build/layers/openembedded-core/meta/recipes-<=
br>
&gt; extended/slang/<a href=3D"http://slang_2.3.3.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">slang_2.3.3.bb</a> RDEPENDS on or otherwise requires it)<br=
>
&gt; No eligible RPROVIDERs exist for &#39;slang&#39;<br>
&gt; NOTE: Runtime target &#39;slang&#39; is unbuildable, removing...<br>
&gt; Missing or unbuildable dependency chain was: [&#39;slang&#39;]<br>
&gt; ERROR: Nothing RPROVIDES &#39;slang-dev&#39; (but /srv/pokybuild/yocto=
-<br>
&gt; worker/qemuriscv64-ptest/build/layers/openembedded-core/meta/recipes-<=
br>
&gt; extended/slang/<a href=3D"http://slang_2.3.3.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">slang_2.3.3.bb</a> RDEPENDS on or otherwise requires it)<br=
>
&gt; No eligible RPROVIDERs exist for &#39;slang-dev&#39;<br>
&gt; NOTE: Runtime target &#39;slang-dev&#39; is unbuildable, removing...<b=
r>
&gt; Missing or unbuildable dependency chain was: [&#39;slang-dev&#39;]<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/56=
/builds/1764" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/56/builds/1764</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61=
/builds/3838" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/61/builds/3838</a><br>
&gt; <br>
&gt; This is because of a PACKAGECONFIG, if there is no way to use libpcre2=
,<br>
&gt; maybe it can be disabled by default?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Mathieu<br>
&gt; <br>
&gt; --<br>
&gt; Mathieu Dubois-Briand, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239036): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239036" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239036</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119839709/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119839709/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000002a5e5065475a33c--

