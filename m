Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F61C87FD2
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 10:25:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.58666.1753957507417342908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 03:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=e5KVXCtq;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b7746135acso153629f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753957506; x=1754562306; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yBd1dP8Xnhu7Yoi5YiTHT7V4d2LUyAdWRP4sg5DC3QU=;
        b=e5KVXCtqR+4L5SwFgTJKXGMyiNj0g1afV76fcG7qFLKhOH1eMZByXzzDSqY8Jp6avP
         mCE0RAGJpI6ZnsiD1p7f7aThNX0xmd2eO3UzS5tEWPg+pI34g8f3MBhEuW+RIPOUtce2
         8vxY3SPBI18kXyjlMu534TDvwf0ezSn++Y0xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957506; x=1754562306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBd1dP8Xnhu7Yoi5YiTHT7V4d2LUyAdWRP4sg5DC3QU=;
        b=p2y9HvKk6q4FsUi4028B7GNo+xBdx2bRLB1D5LtHxp/xNYTaLNYFv99rw3SQVjYFTy
         nl7pIyP18Gaw9TxnYuSVLshnV8jEJ3MhuEEnlM8yqL4u80/GNEGndz8qhMxgvDZvCInz
         zljsaphFvjOoTYkzFO3HeVziCxlWKzzn+/TBqZ1Q/V+hd7XvbWxOkrJEFFTEyrVBEn76
         TvjW1ydxGLssll6Eti6WL7bKxbLSeViNankMo/DwxCGzdskC6/KBzGcVFP8UmzsLeQLA
         g+9XwGfqa62KVwv2PqK9i+Hxr4xqfIfilfJO1CnJ7VSGPMUQPal8XG4MbVgSg9r+xNOG
         FNig==
X-Gm-Message-State: AOJu0YwtMfTT83WBrmQFwUBAmpZkP7NHBNgUVG7vJO4+4KbcVwUDtZ7o
	YCIVxeLQFBO+1Dsc7Jt48p5Zo4E1OPcjJPBWmr2ZzkFC0P+uQwZe9ftilPmBda6BcU/iOqqiM1W
	cunoTnUjKp+vIjJsyq6BdSydtwfJxQzAx0jpjTqiWtw==
X-Gm-Gg: ASbGncvPhGz0Zj8AtFCaNGk2rIZfM9INtM4ggsi5zX6BXt8zUVQDQvnFzqF9zDWSjof
	xhw5uoD/cK8roPkC+xGil+qgwI6w4UOL+Qbk79IO3MMTyvAfqINLJGRBhoRiCiQHp+MKB2vxYP3
	zN3FsDVLr/VXRQRo8SHDDKpCF7sf8vt2ztKti+/P++AkMMD1tZahv1Ii3miLtXdWqC5rho5c1ai
	07gX7MgFw==
X-Google-Smtp-Source: AGHT+IFUM58KMdqqJDaZ+osiwMsn//DJ9G6gAQ4d5lH43JjhC+zgYlxNrmUWOKZO9lCU7yl0tLg96SQz41iUuX3F8DI=
X-Received: by 2002:a5d:64e8:0:b0:3b6:1e6:c9fb with SMTP id
 ffacd0b85a97d-3b794fb57cdmr5248168f8f.11.1753957505736; Thu, 31 Jul 2025
 03:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250731082707.3481718-1-yoann.congal@smile.fr>
 <20250731082707.3481718-4-yoann.congal@smile.fr> <CANNYZj_a6qhBpGMXjUsmvZOb8W8JNu-yhdbhJT2Yg-yC_iyJmQ@mail.gmail.com>
In-Reply-To: <CANNYZj_a6qhBpGMXjUsmvZOb8W8JNu-yhdbhJT2Yg-yC_iyJmQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 31 Jul 2025 12:24:39 +0200
X-Gm-Features: Ac12FXwz0YL20P7gUu8jJ60azmzM7ywOGyiFHt7Uu4jiTzEln_OSzQiszYfBjaM
Message-ID: <CAMSfU+6uQ9FYoggDhwPd7vZUi-7Nbw6QQ=hn_5brT9AWfHRwGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 4/4] runqemu: print snapshot mode state in console
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000014c331063b370ef6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 10:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221190

--00000000000014c331063b370ef6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 31 juil. 2025 =C3=A0 10:55, Alexander Kanavin <alex.kanavin@gmail.c=
om> a
=C3=A9crit :

> On Thu, 31 Jul 2025 at 10:27, Yoann Congal via lists.openembedded.org
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
> > +        if self.snapshot:
> > +            msg =3D "Enabled. Changes on rootfs won't be kept after QE=
MU
> shutdown."
> > +        else:
> > +            msg =3D "Disabled. Changes on rootfs will be kept after QE=
MU
> shutdown."
> > +        logoutput.append('SNAPSHOT: [%s]' % msg)
>
> msg is not a good name, snapshot_msg is better. I would also avoid the
> if-else block altogether, and just use a conditional expression after
> %:
>
> 'Enabled. ...' if self.snapshot else 'Disabled. ...'
>

Thanks! I used that in v4.


>
> Alex
>


--=20
Yoann Congal
Smile ECS

--00000000000014c331063b370ef6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 31=
 juil. 2025 =C3=A0=C2=A010:55, Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 31 Jul 2025 =
at 10:27, Yoann Congal via <a href=3D"http://lists.openembedded.org" rel=3D=
"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" targe=
t=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.snapshot:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &quot;Enabled. Chan=
ges on rootfs won&#39;t be kept after QEMU shutdown.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &quot;Disabled. Cha=
nges on rootfs will be kept after QEMU shutdown.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logoutput.append(&#39;SNAPSHOT: [%s]&#39;=
 % msg)<br>
<br>
msg is not a good name, snapshot_msg is better. I would also avoid the<br>
if-else block altogether, and just use a conditional expression after<br>
%:<br>
<br>
&#39;Enabled. ...&#39; if self.snapshot else &#39;Disabled. ...&#39;<br></b=
lockquote><div><br></div><div>Thanks! I used that in v4.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000014c331063b370ef6--

