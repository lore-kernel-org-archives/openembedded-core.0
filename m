Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC80CCAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:43:19 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.10692.1758804194475137020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=scjVGp4q;
 spf=pass (domain: smile.fr, ip: 209.85.167.50, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57992ba129eso1050647e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 05:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758804192; x=1759408992; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cdobeS+8RaPzFstTmnZ+f8/hT95IzZYeXsvcu+t5Jf8=;
        b=scjVGp4q5zxv6sSGF4pny8FaM4RTK+9y6y6RcCZrFm4RW3+jL5Jgn5fIVBDDryXkPN
         dxNZedW8tOAjcoIkLR54XxNcag9cXU/q9eCfo8XuBUCi3XAZJzCYCzdQY6IWP3CfmKBp
         Y3HhKbCcyuiC9zaYZURbxLZokSixpfp6ryyes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758804192; x=1759408992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdobeS+8RaPzFstTmnZ+f8/hT95IzZYeXsvcu+t5Jf8=;
        b=s9fX5sOiUxsbklF+46ii4CnPSffmOn7YrxfX3n90xb5Y3DRE037mcN0qiwYhpW2fZO
         Gyc6T5AY8vI2dAzDWTgth3ZZHRbdHp80Ch8DSDeWU8Se5eZa+3R0WmbiKrKEtZITJ+vO
         QahzC1V/k88EK6NrgjyAw6rlxL5i0jDYi4KyZ7B0q/NZWjo6MrxRPzGnzDkX+E2HWwsv
         JvVN5cLXKPz9iDmp118jot3ke8/uXX8l0zfoeKvRuUfY5zMBrLJ+WvMwwipQaMMkI7/C
         PnxTPa1/Se8kIKrk9sXLwoC0R+chg7LYsCMXeAzh2uAHRCKxl8tRkeaKcdAy73231snQ
         aS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+87ee+55l7xJMyTfkW249rjUrJPzRFOG7/vqyWfSYfHAlsernk7eKwt7X7Jtq/WF4E/4rIiF5xXEShO0xEcmJUA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGtwinFgEu2dO3QRs+0mieeVO0d2UOveydtgW8h0QJoAAmB/eP
	O9XYKuUB8sKOym9W1s7T1Fo9PHJWHUN7n7sFydNJ971atyHG6zebUNEDJel/9Edr9+4PDh8PXKG
	mHIJPR2gO011Xp/P3pwTyDP2+5Kb/FzznyQ6fuAsP3A==
X-Gm-Gg: ASbGnctWClpVlsPmZfiWBbPRVJDz9mztcJndgWNH+ehz2CFjDUwm/FrIwNSlIAnc1Rp
	RNIoE1NPdFfGbwvJGJdwWrcVpCPRt+tfsMjUOy5nn7rltwlB30/PQV9Sh0rzCpnxwmNkGqXWvHv
	fXcC6ZGrn62j9G4oAo5pyj6a5IwE+H0icx8yIiqD8HVOlBsSp20xPZ97XG0BYmI2VOvDrBf9f3P
	VTvMm4=
X-Google-Smtp-Source: AGHT+IFnR0b9bw4I+L0lf7uZ3ta5eec/Y+VE3GEq6CSHq+uwIwmXY8G85ULp4gFDOFHbojch+g4oSInY4pj4nn2IGiA=
X-Received: by 2002:a2e:a99c:0:b0:337:e697:c9aa with SMTP id
 38308e7fff4ca-36f7d0c529amr9403871fa.15.1758804192426; Thu, 25 Sep 2025
 05:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250925072203.3490596-1-pierre-loup.gosse@smile.fr>
 <20250925072203.3490596-2-pierre-loup.gosse@smile.fr> <CAMSfU+4LjK0K9Mh20oJxhTvW8Dw87nriJakCwQiFfr_T6TSLOg@mail.gmail.com>
 <CANNYZj9PfFUcESHwT_6-CzDw8QB30hva_o5V2gVX5uB+LjaOng@mail.gmail.com>
 <CAHT-cZtsPnCk3_6-48D3uRJbVxmexjeSayhphzCWm_OTraQR4A@mail.gmail.com> <6371e7d1-1d57-4b6a-bb6d-eb3ce0f0ba9d@berginkonsult.se>
In-Reply-To: <6371e7d1-1d57-4b6a-bb6d-eb3ce0f0ba9d@berginkonsult.se>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Thu, 25 Sep 2025 14:43:00 +0200
X-Gm-Features: AS18NWCkTJ5VhNRLBNsGNU4PcSIBiKMRIW6eOXunteCpl83hzwM0VXvJwFlAZzs
Message-ID: <CAHT-cZtr-en6sc7JaPfN9s7BFbwiV+iGrv9rQDKjr8rcXSpWFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] wic: extra partition plugin
To: Peter Bergin <peter@berginkonsult.se>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001e8e8d063f9f838d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 12:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224017

--0000000000001e8e8d063f9f838d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> in the past I have used to rootfs plugin with '--exclude-path' [1] and
> '--change-directory' [2] assuming that I have isolated all files going in
> to the extra partition in to one directory of rootfs.

This is a solution when files are installed in the rootfs but need to be
split across multiple partitions.

However, some files aren't or shouldn=E2=80=99t be in the rootfs. For insta=
nce,
I=E2=80=99ve worked on boards requiring a dedicated VFAT partition just for=
 the
U-Boot script. Other use cases include keeping business software separate
from the rootfs, especially when they are installed and updated
independently (with a SWU package).
Pierre-Loup,

On Thu, Sep 25, 2025 at 12:58=E2=80=AFPM Peter Bergin <peter@berginkonsult.=
se>
wrote:

> Hi,
> On 9/25/25 11:13, Pierre-loup GOSSE via lists.openembedded.org wrote:
>
> Maybe these 'extra' partitions are populated at runtime (first boot) from
> the rootfs?
> I wrote this plugin for a project because I couldn=E2=80=99t find an easy=
 way like
> bootimg_partition to install 'extra' files at build time.
> If a similar solution already exists in Yocto, I=E2=80=99d be interested =
to know.
>
> in the past I have used to rootfs plugin with '--exclude-path' [1] and
> '--change-directory' [2] assuming that I have isolated all files going in
> to the extra partition in to one directory of rootfs.
>
>   part / --source rootfs --exclude-path=3Dconfig/ ...
>   part /config --source rootfs --change-directory=3Dconfig
>
> [1] https://git.yoctoproject.org/poky/tree/scripts/lib/wic/help.py#n987
>
> [2] https://git.yoctoproject.org/poky/tree/scripts/lib/wic/help.py#n1007
> Best regards,
> /Peter
>

--0000000000001e8e8d063f9f838d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">in the p=
ast I have used to rootfs plugin with &#39;--exclude-path&#39;
      [1] and &#39;--change-directory&#39; [2] assuming that I have isolate=
d all
      files going in to the extra partition in to one directory of
      rootfs.</blockquote><div></div><p class=3D"gmail-whitespace-break-spa=
ces">This is a solution when files are installed in the rootfs but need to =
be split across multiple partitions.</p>
<p class=3D"gmail-whitespace-break-spaces">However, some files aren&#39;t o=
r shouldn=E2=80=99t be in the rootfs. For instance, I=E2=80=99ve worked on =
boards requiring a dedicated VFAT partition just for the U-Boot script. Oth=
er use cases include keeping business software separate from the rootfs, es=
pecially when they are installed and updated independently (with a SWU pack=
age).</p><div>Pierre-Loup,</div></div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 25, 2025 =
at 12:58=E2=80=AFPM Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.=
se">peter@berginkonsult.se</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <p>Hi,</p>
    <div>On 9/25/25 11:13, Pierre-loup GOSSE via
      <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>Maybe these &#39;extra&#39; partitions are populated at runtim=
e
          (first boot) from the rootfs?</div>
        <div>I wrote this plugin for a project because I couldn=E2=80=99t f=
ind
          an easy way like <code>bootimg_partition<font face=3D"arial,sans-=
serif">=C2=A0to install &#39;extra&#39; files at build
              time.</font></code></div>
        <div>If a similar solution already exists in Yocto, I=E2=80=99d be
          interested to know.</div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <p>in the past I have used to rootfs plugin with &#39;--exclude-path&#3=
9;
      [1] and &#39;--change-directory&#39; [2] assuming that I have isolate=
d all
      files going in to the extra partition in to one directory of
      rootfs.</p>
    <p>=C2=A0 part / --source rootfs --exclude-path=3Dconfig/ ...<br>
      =C2=A0 part /config --source rootfs --change-directory=3Dconfig</p>
    <p>[1]
      <a href=3D"https://git.yoctoproject.org/poky/tree/scripts/lib/wic/hel=
p.py#n987" target=3D"_blank">https://git.yoctoproject.org/poky/tree/scripts=
/lib/wic/help.py#n987</a></p>
    <p>[2]
      <a href=3D"https://git.yoctoproject.org/poky/tree/scripts/lib/wic/hel=
p.py#n1007" target=3D"_blank">https://git.yoctoproject.org/poky/tree/script=
s/lib/wic/help.py#n1007</a></p>
    Best regards,<br>
    /Peter
  </div>

</blockquote></div>

--0000000000001e8e8d063f9f838d--

