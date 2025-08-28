Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD97CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 11:22:34 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.18394.1756380145768065702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 04:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jBWjM3F6;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3c6df24f128so525135f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756380144; x=1756984944; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Dbo9eD/7E04uGvh4kLoCXjtXKAhzlaa6Gp93iTbKJA=;
        b=jBWjM3F6HK/f60WtPX84+VkQQT/VEJJYF7ul3ppx+pzDZOZNH1VEDbSpPuYLL8wGuo
         Vdksv8az9rF1QSyjJK1SlJzzhUOwIQT9CAozIMjSWqCzgO5fDseBI3qy7B4LNBLdxmxV
         kN28tk7t3yBHQqe5suZjf6USPFsmwMgE7o+Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756380144; x=1756984944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Dbo9eD/7E04uGvh4kLoCXjtXKAhzlaa6Gp93iTbKJA=;
        b=aFkpACREjmt2KPXlx+iJgk5RshDkl9ENVy+n1RhvTgshmJhi1Y+0n4pD+MlgS65ux2
         KLul/OSGdz9sHxQAfYho0UlPG43nb8Ky4W/Wi7HFVnPYbUWypxrMK+elJY4dg/JTt79f
         pbwFckiVgipy7Jh01KG/CXzZkST6zFx0s81DR+GL0Aojf0wg9FPhoUVF3efO9gEmB6Pg
         dsGl/kAE+GhWCU2NEAn/cmJTCLKGjqxTgnDFVdqBOS/nE6eNYTVU8LVNFcmSwQnMi8dK
         xwBNSn3f1/PZt8PCRR0f6lj2PEhGkLG5WLFrRwXf4HlMeT6OwjPC8OvSRcgdyDW2jpNs
         0lzg==
X-Forwarded-Encrypted: i=1; AJvYcCXdx4apRsQHw/Q/rOjrTfWLBgQi4sSjLCsUwNJhlcv46PHUmHakxPcS4ptIZ7K4SOD7QBkpwQvRwnMO3Xmgoofe7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/PeNM/R6TXfxNw0u5u7plvkiq6SuxepKHe5zOB2s7W4CJo2bw
	zXk0pzrqsY5NDnHGL5AYn1zNLfZYlr+vYeIi/r4DZXkCVq4IHbJ5egk6DeaDBP5O29B9352lsmE
	z9WPA2sJ968i7SDk14MHZsJD7/uRYU9UJ5qyLbXvSlIPaIRiHi7QQMEg=
X-Gm-Gg: ASbGnctmtmTh699W3VyDMT9OOfk2O37JVfyoyNhOayxAe8OIuoafy3F71+7od4m5aLh
	9lrxmmf6loLbsC9M5hrBxNvXSjNtTp/GzXAdkwBKXfB+LJ/eyYs3Gm4iHt/yM1TK9O+GLJZlST4
	GbSxdTcYGaumdHHwJmcAxYXyNkRm71a/I/kzcfsY6+BErIVtIgXcWYjt9eS+OXvoDTfuuG3O/xd
	Jtur2rOXqo+qN0uKAGk
X-Google-Smtp-Source: AGHT+IFI+Oii6IHTZjxPAoDC+1BuYKdS+3ZpqVyJ5fIcAAVoDtiBEzlXePsb5MvyhFyIZvLb7gqqf8sIg29DLW8HmzI=
X-Received: by 2002:a05:6000:4308:b0:3cd:590c:61e0 with SMTP id
 ffacd0b85a97d-3cd590c6241mr4217536f8f.54.1756380143642; Thu, 28 Aug 2025
 04:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250828104332.75862-1-mhalstead@linuxfoundation.org> <DCE0QLXNCY9D.2R8F48WOAHJRW@bootlin.com>
In-Reply-To: <DCE0QLXNCY9D.2R8F48WOAHJRW@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 28 Aug 2025 13:21:56 +0200
X-Gm-Features: Ac12FXwotGq3XiIgtg2oOCATc6Orsx1BGZ-3KHZ2D4_i3WoRVt0yfhg0hoc1boE
Message-ID: <CAMSfU+416rkVhHAzZjTXLwODAUdp1yddoMmWoEDRqcz_OaCmBA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] default-distrovars.inc: Switch to the canonical
 website domain
To: mathieu.dubois-briand@bootlin.com
Cc: mhalstead@linuxfoundation.org, openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="0000000000008d7d3a063d6b1e6f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222564

--0000000000008d7d3a063d6b1e6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 28 ao=C3=BBt 2025 =C3=A0 13:20, Mathieu Dubois-Briand via
lists.openembedded.org <mathieu.dubois-briand=3D
bootlin.com@lists.openembedded.org> a =C3=A9crit :

> On Thu Aug 28, 2025 at 12:43 PM CEST, Michael Halstead via
> lists.openembedded.org wrote:
> > yoctoproject.org redirects to www.yoctoproject.org. Switching to the
> > true domain we avoid an unnessary redirect and avoid certifcate errors
> > on a default Debian 11 installation.
> >
> > Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> > ---
> >  meta/conf/distro/include/default-distrovars.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/default-distrovars.inc
> b/meta/conf/distro/include/default-distrovars.inc
> > index 9ea3b5414c..bbd936efa6 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -63,4 +63,4 @@ KERNEL_IMAGETYPES ??=3D "${KERNEL_IMAGETYPE}"
> >  # fetch from the network (and warn you if not). To disable the test se=
t
> >  # the variable to be empty.
> >  # Git example url: git://
> git.yoctoproject.org/yocto-firewall-test;protocol=3Dgit;rev=3Dmaster;bran=
ch=3Dmaster
> > -CONNECTIVITY_CHECK_URIS ?=3D "https://yoctoproject.org/connectivity.ht=
ml"
> > +CONNECTIVITY_CHECK_URIS ?=3D "
> https://www.yoctoproject.org/connectivity.html"
>
>
> Hi Michael,
>
> Thanks!
>
> Can I ask you to modify also the URLs in the test cases?
> We have two occurrences in meta/lib/oeqa/buildtools/cases/https.py.
>

Related: https://lists.openembedded.org/g/openembedded-core/message/222559
Same patch which does seem to do what Mathieu is asking for.


>
> Best regards,
> Mathieu
>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222563):
> https://lists.openembedded.org/g/openembedded-core/message/222563
> Mute This Topic: https://lists.openembedded.org/mt/114932649/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000008d7d3a063d6b1e6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28=
 ao=C3=BBt 2025 =C3=A0=C2=A013:20, Mathieu Dubois-Briand via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;mathieu.dubois-b=
riand=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@l=
ists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Thu Aug 28, 2025 at 12:43 PM CEST, Mic=
hael Halstead via <a href=3D"http://lists.openembedded.org" rel=3D"noreferr=
er" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; <a href=3D"http://yoctoproject.org" rel=3D"noreferrer" target=3D"_blan=
k">yoctoproject.org</a> redirects to <a href=3D"http://www.yoctoproject.org=
" rel=3D"noreferrer" target=3D"_blank">www.yoctoproject.org</a>. Switching =
to the<br>
&gt; true domain we avoid an unnessary redirect and avoid certifcate errors=
<br>
&gt; on a default Debian 11 installation.<br>
&gt;<br>
&gt; Signed-off-by: Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxf=
oundation.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/default-distrovars.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/co=
nf/distro/include/default-distrovars.inc<br>
&gt; index 9ea3b5414c..bbd936efa6 100644<br>
&gt; --- a/meta/conf/distro/include/default-distrovars.inc<br>
&gt; +++ b/meta/conf/distro/include/default-distrovars.inc<br>
&gt; @@ -63,4 +63,4 @@ KERNEL_IMAGETYPES ??=3D &quot;${KERNEL_IMAGETYPE}&qu=
ot;<br>
&gt;=C2=A0 # fetch from the network (and warn you if not). To disable the t=
est set<br>
&gt;=C2=A0 # the variable to be empty.<br>
&gt;=C2=A0 # Git example url: git://<a href=3D"http://git.yoctoproject.org/=
yocto-firewall-test;protocol=3Dgit;rev=3Dmaster;branch=3Dmaster" rel=3D"nor=
eferrer" target=3D"_blank">git.yoctoproject.org/yocto-firewall-test;protoco=
l=3Dgit;rev=3Dmaster;branch=3Dmaster</a><br>
&gt; -CONNECTIVITY_CHECK_URIS ?=3D &quot;<a href=3D"https://yoctoproject.or=
g/connectivity.html" rel=3D"noreferrer" target=3D"_blank">https://yoctoproj=
ect.org/connectivity.html</a>&quot;<br>
&gt; +CONNECTIVITY_CHECK_URIS ?=3D &quot;<a href=3D"https://www.yoctoprojec=
t.org/connectivity.html" rel=3D"noreferrer" target=3D"_blank">https://www.y=
octoproject.org/connectivity.html</a>&quot;<br>
<br>
<br>
Hi Michael,<br>
<br>
Thanks!<br>
<br>
Can I ask you to modify also the URLs in the test cases?<br>
We have two occurrences in meta/lib/oeqa/buildtools/cases/https.py.<br></bl=
ockquote><div><br></div><div>Related:=C2=A0<a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/222559">https://lists.openembedded.or=
g/g/openembedded-core/message/222559</a></div><div>Same patch which does se=
em to do what Mathieu is asking for.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
Mathieu<br>
<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#222563): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/222563" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/222563</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114932649/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114932649/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000008d7d3a063d6b1e6f--

