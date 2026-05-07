Return-Path: <frezidok1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6273CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 11:47:39 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9787.1778154437999594430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 04:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m8aDXi0c;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: frezidok1@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7b4ee3a88e1so6940137b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 04:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778154437; cv=none;
        d=google.com; s=arc-20240605;
        b=R92MzFsAi+QWiDTmnPL6FzuZ0o4kHUKwdIhDL2JfNh6WvyB7hHn+kjus6uKS052yRr
         38DloE2I6KSD6WVbUNMlNbQ1r93kA4H5gQNxvV5d0YPtMz+3hg3a4/dpn/djO0pHZPXB
         Zi4GB8oGvAktOqLGimkmDyAvk/2B/mZx/zGjciSnVHskVqfSHkGhapT7HvF5C9rNeI0B
         VPRmw60J1RE5NUo1bSxPfbnUtnUaRISJ9E+etU3DxRvInSwimAFE0cu384sWf4wJpA0S
         6JusNr+u97SaOa/hsUBAQoBgLeRwCfN3fF5E0eFXqF6/BUJWGnAtqK4b/FP0NdAALz+L
         Ashw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=THndn4Mxv8Kfre76KHxTYKLa9dmDSeWUEpXqTVt07u8=;
        fh=toEqJZwqRVBtWFdjvbnHcK/jgjDz0NeahqiJS/bEzeo=;
        b=P3UHMp3TGT/eD5qO2tScnNnFdjfbmd/+4ZrItQSGCO0YxTB9IYpbYGQ+N+kqPsS290
         2FhZA0phvCtQcIqt6Gg+WJb8k33vpW7cQ7u22QdJmJ//txxADkc82sEjOgrO/6ilG3M6
         Ru5/i2XfQ4b0qlADCx+TUCyFBCLtUi+vkzJFaG5MjdBVHAHzvrNjy44lqLgeKJWzB5ki
         8vjBQtGX26/9BlJTET6YC4kQs4g0EK8v9oDnGNAf6DehwD+J0eiVSSI8iexEH4ZNdh78
         2aKrGwYc7I9UCXWe2qgiZqmibaldEQDXJ9rxxDwhRJ7mzxZRGdrxE8CCBV8aNzMy4AhY
         hM+Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778154437; x=1778759237; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=THndn4Mxv8Kfre76KHxTYKLa9dmDSeWUEpXqTVt07u8=;
        b=m8aDXi0csNPh7xmNYRnFO7+QO0g5RectSfCSZvBNjEH4JoDGsQzomShjm5Cc+Nu13x
         CzvUDoX2FcQSHqm/zEmpqedkcH3pLDxc+3ZtyZVrI3nGKerhHsUsTCnoNi0tTDgt1zvJ
         ZykehlC8gkqUI0iaAEN3Z4hJ+70pWU+VybUyd1eButNgjBCfPBvf9DgtQiO7+BK7MIuY
         SMTJ+HtO1YuPSaF+65v9lUwXmXgXZYIDF7i7ScGGQNoXtecYPIYCr5rX7vdDpJTkNVtD
         naroE4QeCgh4QRpSmzL+COLPIWdRhJKHJGZswrgiUVKaxW77tA71717z0sRYaK3hzCMD
         XwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154437; x=1778759237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THndn4Mxv8Kfre76KHxTYKLa9dmDSeWUEpXqTVt07u8=;
        b=dAdQ1W1fGrFW19BK2zOsIpt/J2QOq6CMcZH9fSD2GemNIRzzEQBQ8OsNQQ7ci3hwWr
         EGpuxEyV+7T/IdbR3JaV3GYfElTpGlfiho5iu2lfXb/MNzaNPPYZ7qZ4s843ZEWMW10O
         f6UxQBE9UMAj2C+U14hSe726HjILIxo37dDLZQYI1LYmFECmze/C8qE/eqdKTQrGgNgs
         hvRrt9nPxYnE5m1/OAPc8iLOC54D2V74KVu8tNG+wWNl5QAw9nSB13yv+Ua4HuDTjZK6
         8ImehzlQEM21iGcs33/pgsPPPT6JdRtAjRac/YC+nkJplWuOs4AxeUpU+b2qIHfUuCkm
         lH0w==
X-Gm-Message-State: AOJu0YzDP5D5kcSBp7nAnOPFt7PG6N4sM0M0qQYmOHBkdJnzPocHwBzp
	xr3q3a5xSvdcscFbhx2z4psR3M5LrwVTW0ImE+D0HiFgjjdYn4aM53nE5HYu57P32MKr1qh/g1T
	s/A6HEyLPt4WLMK4Z65+9BfGBGtdDA+s=
X-Gm-Gg: Acq92OGwLLqnsBe5ICdqBq5tGS1Vqd0gFAnYgCEq3VSH7S3DPAg7+NyEo+vUqMZZ/4l
	RYq4Wkifc+4W9qRlLU8gSP4rY8OyDwcaci6EqjdCJ0s9iXib+Q0NjRedD5y6L1aKYZ85VZ0IV+N
	DQMxTdiDw8lXg/fsv88nYfogFt5gVXMuYz/nqijBQY4H7Qu7iJeBqYPhT7PPWbWn/4QkrUArO7/
	EIvRBMpZEZOjAiCo3RoFh1QzFl6xgAXk/9gLQc0RvZPcnb3+KB+4Py8SmTG4+G2z90wd1W7QX5X
	7AV7wr3uXt6eX2lcn4R/yIw4V3i9
X-Received: by 2002:a05:690c:c4d3:b0:7b8:c19c:ee89 with SMTP id
 00721157ae682-7bdf5efccdcmr79043697b3.42.1778154436930; Thu, 07 May 2026
 04:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260507102353.43585-1-frezidok1@gmail.com> <CANNYZj_49KqbtAbzWvZ=2Y=qQGroFftdjp1wbAzD0bq14aOOnA@mail.gmail.com>
In-Reply-To: <CANNYZj_49KqbtAbzWvZ=2Y=qQGroFftdjp1wbAzD0bq14aOOnA@mail.gmail.com>
From: Dmitry Sakhonchik <frezidok1@gmail.com>
Date: Thu, 7 May 2026 14:47:06 +0300
X-Gm-Features: AVHnY4Lv2J90Gk4AeEBtU6jz48VzF43rBgwGLfwksbQM4ku6dvasu60ahxUo0go
Message-ID: <CAP4GjN67agViKaMrxbrzxtbmGCSM5hXAvNzNC9tqUEa0HsQtBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow-native: Change upstream status of disable_syslog.patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000091bb2f065138d76a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 11:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236582

--00000000000091bb2f065138d76a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You can replace the patch below with a backport of what was accepted

No, I can't do that because the current shadow's master and v4.19.4 (last
release) are quite different. I cannot simply cherry-pick my commit and
apply it as a patch, the only way to backport is to manually completely
recreate these changes for v4.19.4. I have already discussed this topic
with Randy (randy.macleod@windriver.com), and he advised me that waiting
for a stable release (they are promising late June 2026) is better than
doing this complex backport.

Though, if required, I don't mind creating a different patch special for
v4.19.4 so we can use the new configure option ASAP. But since the shadow
recipe will have to be rewritten anyway after v4.20 release, should I? I
don't really know what would be better, so I appreciate any opinion.

=D1=87=D1=82, 7 =D0=BC=D0=B0=D1=8F 2026=E2=80=AF=D0=B3. =D0=B2 14:18, Alexa=
nder Kanavin <alex.kanavin@gmail.com>:

> On Thu, 7 May 2026 at 12:24, frezidok1 via lists.openembedded.org
> <frezidok1=3Dgmail.com@lists.openembedded.org> wrote:
> > After they release v4.20 we can remove the patch and rewrite recipe wit=
h
> the configure option.
>
> We don't need to wait for 4.20 to do that. You can replace the patch
> below with a backport of what was accepted, and then tweak the recipe
> to use the newly added option.
>
> > -Upstream-Status: Inappropriate [Would upstream accept a configure
> option?]
> > +Upstream-Status: Submitted [Merged to upstream's master, waiting for
> release]
>
> Also this change isn't accurate: the patch that was submitted and
> merged is not the same as this one. If this patch is kept, then the
> accurate status would be:
>
> Inappropriate [upstream has accepted a better patch at $link]
>
> Alex
>

--00000000000091bb2f065138d76a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;=C2=A0You can replace the patch below with a back=
port of what was accepted</div><div><br></div><div>No, I can&#39;t do that =
because the current shadow&#39;s master and v4.19.4 (last release) are quit=
e different. I cannot simply cherry-pick my commit and apply it as a patch,=
 the only way to backport is to manually completely recreate these changes =
for v4.19.4. I have already discussed this topic with Randy (<a href=3D"mai=
lto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>), and he a=
dvised=C2=A0me that waiting for a stable release (they are promising late J=
une 2026) is better than doing this complex backport.</div><div><br></div><=
div>Though, if required, I don&#39;t mind creating a different patch specia=
l for v4.19.4 so we can use the new configure option ASAP. But since the sh=
adow recipe will have to be rewritten anyway after v4.20 release, should I?=
 I don&#39;t really know what would be better, so I appreciate any opinion.=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">=D1=87=D1=82, 7 =D0=BC=D0=B0=D1=8F 2026=E2=80=
=AF=D0=B3. =D0=B2 14:18, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a>&gt;:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Thu, 7 May 2026 at 12:24, frezidok1 via <a=
 href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank=
">lists.openembedded.org</a><br>
&lt;frezidok1=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; After they release v4.20 we can remove the patch and rewrite recipe wi=
th the configure option.<br>
<br>
We don&#39;t need to wait for 4.20 to do that. You can replace the patch<br=
>
below with a backport of what was accepted, and then tweak the recipe<br>
to use the newly added option.<br>
<br>
&gt; -Upstream-Status: Inappropriate [Would upstream accept a configure opt=
ion?]<br>
&gt; +Upstream-Status: Submitted [Merged to upstream&#39;s master, waiting =
for release]<br>
<br>
Also this change isn&#39;t accurate: the patch that was submitted and<br>
merged is not the same as this one. If this patch is kept, then the<br>
accurate status would be:<br>
<br>
Inappropriate [upstream has accepted a better patch at $link]<br>
<br>
Alex<br>
</blockquote></div>

--00000000000091bb2f065138d76a--

