Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2C8C0219B
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 00:33:43 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.40850.1739147617179322056
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 16:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PzZjcf7u;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso5903937a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 16:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739147616; x=1739752416; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WEktOFvEOvntgni5A3/bOXnaX0ZrTi8SACoqOwBnLjo=;
        b=PzZjcf7uqokY1FZA0kZx3pHbep8x9bPkVoVRVYLWuBZieug+ZY+UdmqhDpAousEf3/
         6QhQO60VXaNYJQ1TIKQZ/rAufEoNpj4cz9Vr2Fs/2lELU87IJBBPndNQO4vVGgD9mjoW
         WrhdsKnJ44ebi16ldGbCfC+grK0NCfgKLxSgJtfEinkVBwnEXd4EcpXYyOpIAmHdqJ7n
         +phhdW69IrqUBB1DsfdHhuJLxd8jE5g6ewjBEeMQYyp1C+7DtLY4VSHmSzE5xAcGZjSd
         OlOjXT5Rmq5xKTm/m/zoV/O1mcb7zeEvKWq8MY0ZkmWSDa/WhUnoQru8vRDwYHH7JB0o
         dE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739147616; x=1739752416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEktOFvEOvntgni5A3/bOXnaX0ZrTi8SACoqOwBnLjo=;
        b=Wz14bpWvtBbyet792O+yEGqNnrhbhTpsH8wP0Pqiocvnh36wMT2qNZlhYk3lkshuaW
         hHU+lKjlFR5AiGOCPNiuH4GMG7CleGLYGLidyIH3UBQ1FBhm0bU+TaRWc1alrzVmSD0v
         dsV7oIkE8RrIobJGxK1Sm7G+0UWiKnjyVH7SKu2ZDpK0muziXDA0OiCRyzTGdSbBCd4j
         D6FtSGlMEtH5p+H2eTpT5GOq77W/Q+uFpVG9i3nBA24XpMlOStamAgI1N3NkYZk0a/Ew
         eYOqDLsiS/mD9K52weSoQpOnMnjNxrJT6KU74HJar9tGtQurFtXD88jHXrJgeOkjKjGV
         Y24Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHuYd8xYs32Bev1K3mMSIFDajSP/IqeSLh5jV2F2C7oJ5TvngpyflFJTxYJuXUD6yp+OUinQBk5OCeMdPlvQVtzw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxqdunS8ak6RepZY3G7ng+i2lC4OFovBiQP9JcX9UlTjFTpy+uA
	VnFCgu/hwrmK39BstxQ2GqhT3fjZ17pHCxQz7vMPCrkIsT7RYRuothWoiGF2h2qQ80oLdb8vbiB
	BMAjmSn4vzAMciuDXJiWO2OviYzQ=
X-Gm-Gg: ASbGncv3hkT2S5c2iJN38uzfDzFCZIMpeneQdOWo8/2qkG1XGcBCpVRH/0nipejiGsL
	bLRfyigS3rmGhJ5vqeZNcf1r6Iyk8UXkyOzDWOFN9ScYWI4POShf5yQSdxTa5MRTFTOL0+O614Q
	==
X-Google-Smtp-Source: AGHT+IFLnABcLRBT/mUQgxcD2E719mpYfaO+fknndqvrAE5IR1yL5kJm4vojp3v17ntK91oi3r2H1ok7XvzUqLNTW9E=
X-Received: by 2002:a17:90a:d2c3:b0:2fa:1c09:3cee with SMTP id
 98e67ed59e1d1-2fa1c093d7emr19332771a91.9.1739147616465; Sun, 09 Feb 2025
 16:33:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1739145061.git.bruce.ashfield@gmail.com>
 <dbc453ced8c538af94f7ab658b64dc071e1173a2.1739145061.git.bruce.ashfield@gmail.com>
 <3a2b8b2b-c198-46a3-962d-073c5cf30057@smile.fr>
In-Reply-To: <3a2b8b2b-c198-46a3-962d-073c5cf30057@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 9 Feb 2025 19:33:25 -0500
X-Gm-Features: AWEUYZkmhlDny8HpnDvBZVNnV7iI_pwgkmgaRVB-8OVMCK8HgZRqXGCm8sCzhr0
Message-ID: <CADkTA4OFd0SDyM+H7YkWQcVB6XufadtVh8hBtfweFkm2iZ3+HQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] poky-alt: switch preferred kernel to 6.12
To: Yoann Congal <yoann.congal@smile.fr>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e439be062dbedb21"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 00:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211072

--000000000000e439be062dbedb21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 7:32=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:

> Hi Bruce,
>
> Le 10/02/2025 =C3=A0 00:56, Bruce Ashfield via lists.openembedded.org a =
=C3=A9crit :
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > 6.6 is being removed from the upcoming LTS release, so we
> > adjust the alt config to use the 6.12 reference.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta-poky/conf/distro/include/poky-distro-alt-test-config.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git
> a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
> b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
> > index 3e10251e8b..a24d5e15ab 100644
> > --- a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
> > +++ b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
> > @@ -2,7 +2,7 @@
> >  DISTRO_FEATURES:append =3D " pam usrmerge"
> >
> >  # Use our alternate kernel version
> > -PREFERRED_VERSION_linux-yocto =3D "6.6%"
> > +PREFERRED_VERSION_linux-yocto =3D "6.1%"
>
> Shouldn't this read
> PREFERRED_VERSION_linux-yocto =3D "6.12%"
> (a missing "2") ?
>

It is!!!

I'll re-send that now.

Bruce



>
> >
> >  # Ensure the kernel nfs server is enabled
> >  KERNEL_FEATURES:append:pn-linux-yocto =3D " features/nfsd/nfsd-enable.=
scc"
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#211061):
> https://lists.openembedded.org/g/openembedded-core/message/211061
> > Mute This Topic: https://lists.openembedded.org/mt/111094343/4316185
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Yoann Congal
> Smile ECS - Tech Expert
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e439be062dbedb21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 9, 2025 at 7:32=
=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann=
.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi Bruce,<br>
<br>
Le 10/02/2025 =C3=A0 00:56, Bruce Ashfield via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> a =C3=A9crit=C2=A0:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; <br>
&gt; 6.6 is being removed from the upcoming LTS release, so we<br>
&gt; adjust the alt config to use the 6.12 reference.<br>
&gt; <br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-poky/conf/distro/include/poky-distro-alt-test-config.inc | =
2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-poky/conf/distro/include/poky-distro-alt-test-config=
.inc b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc<br>
&gt; index 3e10251e8b..a24d5e15ab 100644<br>
&gt; --- a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc<br=
>
&gt; +++ b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc<br=
>
&gt; @@ -2,7 +2,7 @@<br>
&gt;=C2=A0 DISTRO_FEATURES:append =3D &quot; pam usrmerge&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Use our alternate kernel version<br>
&gt; -PREFERRED_VERSION_linux-yocto =3D &quot;6.6%&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto =3D &quot;6.1%&quot;<br>
<br>
Shouldn&#39;t this read<br>
PREFERRED_VERSION_linux-yocto =3D &quot;6.12%&quot;<br>
(a missing &quot;2&quot;) ?<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">It is!!!</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">I&#39;ll re-send that now.</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Ensure the kernel nfs server is enabled<br>
&gt;=C2=A0 KERNEL_FEATURES:append:pn-linux-yocto =3D &quot; features/nfsd/n=
fsd-enable.scc&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#211061): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/211061" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/211061</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11109434=
3/4316185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/111094343/4316185</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr=
" target=3D"_blank">yoann.congal@smile.fr</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS - Tech Expert<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000e439be062dbedb21--

