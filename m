Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F24D735EB
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 02:23:59 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.127287.1732933436268015679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 18:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FfIPyxWS;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71d554dedc6so942708a34.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 18:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732933435; x=1733538235; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wnBMcxuhOpD4BgQglT547hiWgLn9x/aR64OXu3C8jv8=;
        b=FfIPyxWSj/qFZ6xPqbaf/oxhafQmdY9k09qvncLvqpYentttYIv1Ix4VKwQh8AFGAp
         ol7PbpJDKBHXXTKEVrIOvxDIsqFWTZ8KFc24S8Zi/TupMY1ZLXE/H9m6X9i/d071F7kL
         A9zu4bZfHM6CHaoLZA2fpcFDrtbiuRexhJvtdyzrUnVv03CPnpeFLYAcVA4x7qZ+Rpou
         ki1Gb9z6ftM+NF1G810QgllMoQjr7kdfF3QGdUBDQ/djFMIs4EioCU5x54DDVJlOkqZP
         mcv0LUByTpbJ2lOUdMoqxgb34iQ7/u16qP7Awk94pfWKC7CCsgGQlQCLjyJA17iUeqZz
         SqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732933435; x=1733538235;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnBMcxuhOpD4BgQglT547hiWgLn9x/aR64OXu3C8jv8=;
        b=wmeHm0LfcF8NotCH2o1OmJWDUJzm29ryXHgR9LZbSQFSN5AKjRc0yo1HZGrHAwExE3
         L07G/BO06+3Tvy8uHYybLOnIBHtQIMNBboY/4UCBRGty3D6RSYCbm/NqfwtWh9P3ryh/
         M7Y//hVBl0NRwUsQmIUquIaiNr0sPoH5GTCG0v5/btBZPgGYA1UZ36WUX+io0MoOlsMk
         P7/1qXvyBfwWCGRIEzZ++HHqcWCoF8LQl+kj+uFcsDfvLipvYXYbc7znZoTb3njrOLgl
         v4PSQ5W8fhfgiPwvaeQe7Q8nbFp/2hbklftg5xB29UVbt9azzJc1A1CoLprboQLERlKg
         cfSw==
X-Forwarded-Encrypted: i=1; AJvYcCXOQwB6+J7GGD43fiF6xPyLjgm/737RRM+1XivQFU+SlnOn3lDT5PjkYtdlKwNYicMZwqs7DxceGgXoNUF8CW9liQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxzmb0hQLP6oAFz46xDoyXm/tD7gQiiYfqHYOwtTCbcPxpdnK3l
	mqBPSuMpjB5i5SO7ZP0KQX7N55+e16uT4b6IczyCixwVbXJ51DT6LqXihtE/vGz82HFl3C2pBnN
	nM+0NjNtIPiOnYiYt//Bl/ekA/pQ=
X-Gm-Gg: ASbGnctyl2rLHtwyaK0kvYMu3T+Y8jvt9zWRJoazx45h/xNBRFQS+sxhGx+Q9m8BshF
	JT+kPGWczUQhmvKrFbHNAki/DwCHLoyg3uPWpZAGIvO3QTBWENtdFkQKJYW1nSrDf
X-Google-Smtp-Source: AGHT+IGbuelUdiuS8oGILQySnrIWgX05OlhiwsEkVNq9B9Y9mk5jNrcwVMjL7TwOHn+sZp9BNImbcOlW4fg7dhwqzlY=
X-Received: by 2002:a05:6830:4427:b0:718:1150:a02b with SMTP id
 46e09a7af769-71d65c755acmr10976642a34.1.1732933435359; Fri, 29 Nov 2024
 18:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20241129033654.1275825-2-ricardo.salveti@oss.qualcomm.com>
 <01010193760741f1-9fbe5e5d-8d96-4d65-8dbf-e5163559acdc-000000@us-west-2.amazonses.com>
 <CAA_5yov2dE2SukEA2ipVThDmMv=vFQKVPBhn=fN36nUOb-NUUA@mail.gmail.com>
In-Reply-To: <CAA_5yov2dE2SukEA2ipVThDmMv=vFQKVPBhn=fN36nUOb-NUUA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Nov 2024 18:23:44 -0800
Message-ID: <CAMKF1sqAQb37_SggTcKqij7Bj8NgXra_kYB4ttb5DXL3fA_szw@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH 2/2] systemd: remove
 custom rootlibexecdir and replace with nonarch_base_libdir
To: ricardo.salveti@oss.qualcomm.com
Cc: patchtest@automation.yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d58aaf06281801ce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 02:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208035

--000000000000d58aaf06281801ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2024 at 10:58=E2=80=AFAM Ricardo Salveti via lists.openembe=
dded.org
<ricardo.salveti=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> On Fri, Nov 29, 2024 at 12:46=E2=80=AFAM <patchtest@automation.yoctoproje=
ct.org>
> wrote:
> >
> > Thank you for your submission. Patchtest identified one
> > or more issues with the patch. Please see the log below for
> > more information:
> >
> > ---
> > Testing patch
> /home/patchtest/share/mboxes/2-2-systemd-remove-custom-rootlibexecdir-and=
-replace-with-nonarch_base_libdir.patch
> >
> > FAIL: test max line length: Patch line too long (current length 224,
> maximum is 200) (test_metadata.TestMetadata.test_max_line_length)
>
> Caused by:
>
> -               $INTERCEPT_DIR/postinst_intercept update_udev_hwdb
> ${PKG} mlprefix=3D${MLPREFIX} binprefix=3D${MLPREFIX}
> rootlibexecdir=3D"${rootlibexecdir}"
> PREFERRED_PROVIDER_udev=3D"${PREFERRED_PROVIDER_udev}"
> base_bindir=3D"${base_bindir}"
> +               $INTERCEPT_DIR/postinst_intercept update_udev_hwdb
> ${PKG} mlprefix=3D${MLPREFIX} binprefix=3D${MLPREFIX}
> rootlibexecdir=3D"${nonarch_base_libdir}"
> PREFERRED_PROVIDER_udev=3D"${PREFERRED_PROVIDER_udev}"
> base_bindir=3D"${base_bindir}"
>
> Didn't want to break that line as part of the change as this is basically
> a sed.
>
> Can break and send a v2 if needed.


Perhaps send a separate patch since it=E2=80=99s a formatting improvement

>
>
> Cheers,
>
> Ricardo
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208032):
> https://lists.openembedded.org/g/openembedded-core/message/208032
> Mute This Topic: https://lists.openembedded.org/mt/109830002/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d58aaf06281801ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 29, 2024 at 10:58=E2=80=AFAM Ricardo Salveti vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
ricardo.salveti=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedded.org=
">oss.qualcomm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)">On Fri, Nov 29, 2024 at 12:46=E2=80=AFAM &lt;<a href=3D"mailto:patc=
htest@automation.yoctoproject.org" target=3D"_blank">patchtest@automation.y=
octoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Thank you for your submission. Patchtest identified one<br>
&gt; or more issues with the patch. Please see the log below for<br>
&gt; more information:<br>
&gt;<br>
&gt; ---<br>
&gt; Testing patch /home/patchtest/share/mboxes/2-2-systemd-remove-custom-r=
ootlibexecdir-and-replace-with-nonarch_base_libdir.patch<br>
&gt;<br>
&gt; FAIL: test max line length: Patch line too long (current length 224, m=
aximum is 200) (test_metadata.TestMetadata.test_max_line_length)<br>
<br>
Caused by:<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$INTERCEPT_DIR/post=
inst_intercept update_udev_hwdb<br>
${PKG} mlprefix=3D${MLPREFIX} binprefix=3D${MLPREFIX}<br>
rootlibexecdir=3D&quot;${rootlibexecdir}&quot;<br>
PREFERRED_PROVIDER_udev=3D&quot;${PREFERRED_PROVIDER_udev}&quot;<br>
base_bindir=3D&quot;${base_bindir}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$INTERCEPT_DIR/post=
inst_intercept update_udev_hwdb<br>
${PKG} mlprefix=3D${MLPREFIX} binprefix=3D${MLPREFIX}<br>
rootlibexecdir=3D&quot;${nonarch_base_libdir}&quot;<br>
PREFERRED_PROVIDER_udev=3D&quot;${PREFERRED_PROVIDER_udev}&quot;<br>
base_bindir=3D&quot;${base_bindir}&quot;<br>
<br>
Didn&#39;t want to break that line as part of the change as this is basical=
ly a sed.<br>
<br>
Can break and send a v2 if needed.</blockquote><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Perhaps send a separate patch since it=E2=80=99s a format=
ting improvement=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Ricardo<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#208032): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/208032" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/208032</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109830002/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109830002/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d58aaf06281801ce--

