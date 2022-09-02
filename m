Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F47C38145
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 10:57:39 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.5070.1662116252313480803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 03:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RMLESgKu;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id bt10so2773593lfb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 03:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tmKC1nZ+S5kdpGs5ZdVWTP+wb8WethhS/OjbVn+iXTE=;
        b=RMLESgKuAGHUkV1K8oQyketBk5rWgk+MkCUAvumfWK06L4djyEzac+AB5O1CWG5xNs
         lvQ05qOTgzylqFAhDAweQjVM8W8jQ3nkAN38whYNXRTwtLnEDFG5eSdhtuZsaHTzwlbX
         +RoBIgoBQEzMrVDTpQsTeS846+ASw83HOyZmvFRH3s6sNC0+lnIihwVN1ooXvg1q0McC
         OdsFWllBM3RZXygybke5tsFOPy4r7DIPY9GBBbY4WUKzyWOBhH+17lPSm23gJlWxiNbh
         KG4xz4jscC/+8Nlb9gIPRwquQ/1PJrbrlUyC2Up2M7+lJ4aXuEWmpKIvbolWfnur+sfl
         2nDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tmKC1nZ+S5kdpGs5ZdVWTP+wb8WethhS/OjbVn+iXTE=;
        b=6AMEmmfcB3x70NOgDiOURW1C3+lJrbYBxtKFy33aPY6eNE59JcSkHIl1qX/c9OCdvy
         kX3GgMjqoKDbdcAQLkGkKRniHsRCHslsBmWdfzBQuHpISdz8LO6LGR0geSQ+LJs3jENS
         5y1g6lA7kd1VQUbzhDc+DnGeXQaLGkOQjnCq8Vh54cCT9PDkjO9mfAc2h4BSNvQILKoV
         PV1ah2ryn8Ef3EO/GXWUKPdw1S78n70GIgiHAAmTwVGUnT+GC3Pr7SgA9Qu4/8gtlJy3
         oXdZJH+g+xtwHJaFyBno3Pex4/TKp+lYnj+zkMIVXL46rwoBJzOnEagg65L6yT4GwBF6
         1dGw==
X-Gm-Message-State: ACgBeo3bUYp11XhWm144FzIQUFeTBnOU8oqDgzJzrbnSQxszyygL75Lc
	zn86+mPimUeNdvz1aX0/W2Ck1LhX+IzbWYecXUA=
X-Google-Smtp-Source: 
 AA6agR4tnlHdz8zGwjt6R2tI+f5UGvV/iDLPWx7NZo7HUx0ntwNRgxxQwapvcKHUd9vbR+gOZvUMXzBpMusaxw5e0OE=
X-Received: by 2002:a05:6512:33c9:b0:494:79c1:8ea1 with SMTP id
 d9-20020a05651233c900b0049479c18ea1mr5005839lfg.26.1662116250364; Fri, 02 Sep
 2022 03:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220901142328.268769-1-alex@linutronix.de>
 <d9ec6fa663d94bcc9229066100a140fc@axis.com>
 <1710F0E3F6A43399.12033@lists.openembedded.org>
 <CANNYZj-YxzNONuKM5UVsvW7aS+k+aDTUw4GeK=MkMgGCdygxFg@mail.gmail.com>
 <eca823296bc1d5163f549ab1cbfc9408a2cbcca8.camel@linuxfoundation.org>
 <1710FB3AA9843A6F.13805@lists.openembedded.org>
In-Reply-To: <1710FB3AA9843A6F.13805@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Sep 2022 12:57:19 +0200
Message-ID: 
 <CANNYZj_PPktM1LzEBvYAd4GOPNfAnW5K8sUU-JSd_-E2WSniyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
To: alex.kanavin@gmail.com
Cc: Alexander Kanavin <alex@linutronix.de>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000adaf4205e7af986b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 10:57:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170242

--000000000000adaf4205e7af986b
Content-Type: text/plain; charset="UTF-8"

Ok, I think I overstated things :) a couple of small targeted fixes
incoming, no python rewrite.

Alex


On Fri 2. Sep 2022 at 9.41, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Fri, 2 Sept 2022 at 09:37, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > > We can however add a hint to check what is in
> > > > build/conf/templateconf.cfg if the test fails, as it is not obvious
> > > > that TEMPLATECONF obtained from there takes priority over other
> > > > sources (which are, in order, TEMPLATECONF passed via environment,
> > > > then .templateconf next to oe-init-build-env).
> > >
> > > Ok, the more I think about this, the more I'm convinced that
> > > oe-setup-builddir needs a complete refactor.
> >
> > That script is meant to be really really simple and push any heavy
> > lifting off to bitbake or other tools. Ideally we were never even meant
> > to need such a script and the tools would "just work". I'd prefer it
> > went away, not rewrite and grow it.
>
> Rewriting it in python will make it twice (or more) shorter, and the
> order of templateconfs does need clarity and logic. We can leave the
> 'config fragments' or anything more advanced out.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170238):
> https://lists.openembedded.org/g/openembedded-core/message/170238
> Mute This Topic: https://lists.openembedded.org/mt/93396426/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000adaf4205e7af986b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">Ok, I think I overstated things :) a coupl=
e of small targeted fixes incoming, no python rewrite.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Alex</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri 2. Sep 2022 at 9.41, Alexander Kanavin via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a hre=
f=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)">On Fri, 2 Sept 2022 at 09:37, =
Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; We can however add a hint to check what is in<br>
&gt; &gt; &gt; build/conf/templateconf.cfg if the test fails, as it is not =
obvious<br>
&gt; &gt; &gt; that TEMPLATECONF obtained from there takes priority over ot=
her<br>
&gt; &gt; &gt; sources (which are, in order, TEMPLATECONF passed via enviro=
nment,<br>
&gt; &gt; &gt; then .templateconf next to oe-init-build-env).<br>
&gt; &gt;<br>
&gt; &gt; Ok, the more I think about this, the more I&#39;m convinced that<=
br>
&gt; &gt; oe-setup-builddir needs a complete refactor.<br>
&gt;<br>
&gt; That script is meant to be really really simple and push any heavy<br>
&gt; lifting off to bitbake or other tools. Ideally we were never even mean=
t<br>
&gt; to need such a script and the tools would &quot;just work&quot;. I&#39=
;d prefer it<br>
&gt; went away, not rewrite and grow it.<br>
<br>
Rewriting it in python will make it twice (or more) shorter, and the<br>
order of templateconfs does need clarity and logic. We can leave the<br>
&#39;config fragments&#39; or anything more advanced out.<br>
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#170238): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/170238" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/170238</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93396426/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93396426/1686489</a><br>
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

--000000000000adaf4205e7af986b--

