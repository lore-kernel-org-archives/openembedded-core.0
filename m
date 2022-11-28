Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB85C4708B
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 13:13:50 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.117359.1669641229496032253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 05:13:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nTNM26Uk;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id n1so8397937ljg.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 05:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8UPEMIcRi4miBcwye+iAfRhCB4FnetFnbCAr61ojldI=;
        b=nTNM26UkZbYCuwFnTjC5X5VEAHLnGWP8x7WA/nj44oi4mhErBPMfKxLTeUxB3C1EOX
         36ffY5HJLeVQgkc5AMuQWCUejvPyUt4JcVP0hJAREYbSIHg9ysAOYEv5sSXmbgw3HTvU
         Hk7b5xXkHgCSVr4lkxssik8k6p0xTBVv8zZjk3LMPYEM3Tpfaq+dAstde03eyWeFR9qV
         2ck051W1rlI8eZSK4tq45HC5FbfuOQeUfIWnDhwK2G8XMgagfcKkdTzDTWJ0NNaLsvN5
         yE2DFiOMzeUDHUTZTCtgBzhQ3fpaU7nFTznclB+LlNFHgultRP9j6vQHKcOse8l/xG64
         YbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UPEMIcRi4miBcwye+iAfRhCB4FnetFnbCAr61ojldI=;
        b=e/dHiV1k1unz30puJVva7k51a2SxlngiSJeeG5CabjMw9Cc2i5JAFWIquvhbbkTMEK
         HUxzZgu3Y3N5LDsnCXGJo6G+aDPXiGMwAnJ8ss6v1DfLLAYu0O5rzn7rKD5ypGBTbXWp
         geV5r67NOoWTampH6tYdj3gf7p9xs/kDGG9rWKHJ6JEg/rlGQPN6B1Y3fYjzPToQN8eE
         alpys9mlHuqirBxUeSUkZ3vT2U/Z/zgNSjfQJs+vTdWr/rLY1SeIyWLRnev+yJbAZuwl
         6LyEppZ2XQNIhdKsq0mxsn9Dcz0tzU5P0qQ2ctvdDlHmhAiG6jiljmVw+l0iSESo648C
         JvfQ==
X-Gm-Message-State: ANoB5pmxq80rQLh2BXrGnSNXRH5hfO1ft4Gn1cEIscC+BBWv1fhq2DNm
	urnUsoUjHCTlhsYJ3DQ9XeWDeP1neCLMfuJMvos=
X-Google-Smtp-Source: AA0mqf44aibn+uVBY7Ki+ZYuGPdo7D5VCmhczah3WUw0SNdbtayl0zMsTIWct7KSlEwkRh06f+lTedgaz2h2Qpe+xh0=
X-Received: by 2002:a2e:3a07:0:b0:279:43be:97d6 with SMTP id
 h7-20020a2e3a07000000b0027943be97d6mr14139846lja.33.1669641227309; Mon, 28
 Nov 2022 05:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20221128112232.123025-1-f_l_k@t-online.de> <CANNYZj9OzcCqoC9=cDcMVPDc85KZbuWuksekUgg0YhDWsG+TrQ@mail.gmail.com>
 <2732MR.ANT1XFWZ05B13@t-online.de> <CANNYZj9nZc6U8ojtShu7DO8qBfzF0a15qUEHBQ1VmZDhe335_w@mail.gmail.com>
 <ZB42MR.U9I5BNKLFJN32@t-online.de>
In-Reply-To: <ZB42MR.U9I5BNKLFJN32@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 14:13:36 +0100
Message-ID: <CANNYZj_PxabL7ZKO8cu8UBGgV7MA9c0q4jvKiRS2pKtQYuqWvA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004199a005ee87a491"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 13:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173914

--0000000000004199a005ee87a491
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It won=E2=80=99t if you add the patch. I have tested that:
https://git.yoctoproject.org/poky-contrib/commit/?h=3Dakanavin/package-vers=
ion-updates-later
(That=E2=80=99s a wip commit just to be aware of issues)

We have plenty of options everywhere that are disabled specifically because
there is no easy way to activate them. There is no promise to fulfil
requirements for every upstream option out there.

If you feel that this one in particular fulfills an important use case then
you need to add a patch that allows setting the location of ssh items with
meson options and submit it upstream.

Alex

On Mon 28. Nov 2022 at 13.07, Markus Volk <f_l_k@t-online.de> wrote:

> Am Mo, 28. Nov 2022 um 12:45:54 +0100 schrieb Alexander Kanavin <
> alex.kanavin@gmail.com>:
>
> For gcr I suppose we can just disable the ssh stuff if it's not strictly
> required.
>
>
> I've noticed that you sent a patch to gcr that would fix it but 4.0.0 wil=
l
> presumably still search for the external ssh programs even if ssh_agent i=
s
> disabled.
>
> It's an optional feature, but not being able to activate it feels like a
> hack as well to me.
>

--0000000000004199a005ee87a491
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"color:rgb(0,0,0)">It won=E2=80=99t if you =
add the patch. I have tested that:</span></div><div dir=3D"auto"><span styl=
e=3D"color:rgb(0,0,0)"><div><a href=3D"https://git.yoctoproject.org/poky-co=
ntrib/commit/?h=3Dakanavin/package-version-updates-later">https://git.yocto=
project.org/poky-contrib/commit/?h=3Dakanavin/package-version-updates-later=
</a></div><div dir=3D"auto">(That=E2=80=99s a wip commit just to be aware o=
f issues)</div></span></div><div dir=3D"auto"><span style=3D"color:rgb(0,0,=
0)"><br></span></div><div dir=3D"auto"><span style=3D"color:rgb(0,0,0)">We =
have plenty of options everywhere that are disabled specifically because th=
ere is no easy way to activate them. There is no promise to fulfil requirem=
ents for every upstream option out there.</span></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">If you feel that this one in particular fulfills a=
n important use case then you need to add a patch that allows setting the l=
ocation of ssh items with meson options and submit it upstream.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 28. Nov 2022 at 13.=
07, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)"><div id=3D"m_7036332824962974081ge=
ary-body" dir=3D"auto">Am Mo, 28. Nov 2022 um 12:45:54 +0100 schrieb Alexan=
der Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank"=
>alex.kanavin@gmail.com</a>&gt;:<br><blockquote type=3D"cite"><div style=3D=
"white-space:break-spaces" dir=3D"auto">For gcr I suppose we can just disab=
le the ssh stuff if it&#39;s not
strictly required.</div></blockquote><span style=3D"white-space:break-space=
s"><br></span><div><div>I&#39;ve noticed that you sent a patch to gcr that =
would fix it but 4.0.0 will presumably still search for the external ssh pr=
ograms even if ssh_agent is disabled.</div></div><div><br></div><div>It&#39=
;s an optional feature, but not being able to activate it feels like a hack=
 as well to me.</div></div></blockquote></div></div>

--0000000000004199a005ee87a491--

