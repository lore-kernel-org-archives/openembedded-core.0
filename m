Return-Path: <sheng.tan@9elements.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D76C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 12:30:20 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.15658.1714048211196297808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Apr 2024 05:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=ddgdHt6K;
 spf=pass (domain: 9elements.com, ip: 209.85.208.50, mailfrom: sheng.tan@9elements.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-571c22d9de4so1293712a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1714048209; x=1714653009; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/74TKP/lk3pyWWbAEsj4ueYpSdLnLO/4p3/GQOFHr0=;
        b=ddgdHt6KTkLs+8NZP/M79uly7ny5oFvT/DAkJxbUVL2XmhnxpM5BKI5kkEP+XSZIrB
         E7eY5iM0hN8Ydhp7yNhXCv4nuv6Gltvgl7/o/PYPPPosUc/dt+KFwmXa5LdybrcmHaJL
         mwpHWRlid1PLZtWU9vwGxTsk/UXnph+1SDY0Y4kHG3/PfKBi5q6FGXgXnLCVTuDrAfXG
         5D0YnHo5BZB4HE99nptTGcN9jMb3E3Y9agfHP/d0pxErLF+hWWw5UxJWLchuGeD3Ckez
         wzUHjSjWHEEs0DqiQbZ4UL2W7MG4b/GF4I/PIwJuTKCRPeylhImWsW1krrFfs4a9Nrpz
         iTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714048209; x=1714653009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/74TKP/lk3pyWWbAEsj4ueYpSdLnLO/4p3/GQOFHr0=;
        b=BQ2cLevR2lZ3LBB9rjHcf7vJfWe5rnjEVYMch5HwTqLDdXR7BVilfxDjknS5XZ2uvI
         cXsitnsPbI4lxLxHwkMa82sXsQcwxVp28LG/e1PdP++n0lXCoG8Ja05KQMheP2/VVgMj
         7i88igmXuo+XcZdjXdkfisTdmpPcr4Jkci0pCbC//qXO1QkGp16Csmohq997H7+RrrqS
         ot8TQWrB11E1GD/Ez7QsxJobHWsUSPlWcrIvK/IpGOr4tPW+pi8eoLK9LP/7n1H3c84q
         +aYJU5Q5mTKHwyasLhrrISz3CB1RhfN2i9kdtJ8RkyGRwrJeIWVZgc7r7sB2UvAjendQ
         VTjA==
X-Gm-Message-State: AOJu0Ywwuae9Vg2YA6bWNkLBid6WcPbd5LzQ+7Lz6p5TfqgamDQdjK0r
	iFvgXj5qw7prinizffBFhtpnPEgF0YicsmiNfSEzBbAtbvH0uc8Jjx7TNhUQ25Kiz0SmTH/m+aE
	tFJ66TNpCCLZGsdJYLi2gi+kYmUUoa8m/dPGi8y5k+kllgLYLNSI=
X-Google-Smtp-Source: AGHT+IHa1iYgkwgt61sOVcs4sXrk2dBAAOJa9bV5Vkv89x7g3nyNmLTQT+QqWJCh65Pi5O22PSKonWcuMoG+U6lYpB0=
X-Received: by 2002:a17:906:4a53:b0:a55:b11d:ccbb with SMTP id
 a19-20020a1709064a5300b00a55b11dccbbmr3599392ejv.74.1714048208996; Thu, 25
 Apr 2024 05:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
In-Reply-To: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
From: Lean Sheng Tan <sheng.tan@9elements.com>
Date: Thu, 25 Apr 2024 14:29:33 +0200
Message-ID: <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
Subject: btrfs-tools-native build python error
To: openembedded-core@lists.openembedded.org
Cc: "Hansen, Alexander" <alexander.hansen@9elements.com>, John Chung <john.chung@arm.com>
Content-Type: multipart/alternative; boundary="000000000000a027170616eaf246"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 12:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198702

--000000000000a027170616eaf246
Content-Type: text/plain; charset="UTF-8"

Hi,
Good day to openembedded community!

This is my first post - hope this is the right place to ask for help
regarding a build issue, as refer from here:
https://gerrit.openbmc.org/c/openbmc/openbmc/+/71017/comment/195b742f_6cf8da09/

Currently, we saw this issue when building this on openBMC which is based
on Yocto:-
The error found when manually run bitbake btrfs-tools-native is as follows:

>  checking for a Python interpreter with version >= 3.4... python3
>  checking for python3...
> /home/apwillia/local/builds/lf-build-yosemite4/tmp/hosttools/python3
>  checking for python3 version... 3.11
>  checking for python3 platform... linux
>  checking for GNU default python3 prefix... ${prefix}
>  checking for GNU default python3 exec_prefix... ${exec_prefix}
>  checking for python3 script directory (pythondir)...
> ${libdir}/python3.11/site-packages
>  checking for python3 extension module directory (pyexecdir)...
> ${libdir}/python3.11/site-packages
>  checking for python-3.11... no
>  configure: error: Package requirements (python-3.11) were not met:
>
>  No package 'python-3.11' found


To bypass this, we have to manually remove in OpenBMC with this tweak:

> PACKAGECONFIG:remove:pn-btrfs-tools-native = "python"


May I know if this is a real bug, or if we did miss something from our
configuration?

Thank you again for the help!

Best Regards,
Sheng

--000000000000a027170616eaf246
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Hi,<br></div><div dir=3D"ltr"><div><span style=3D"color:rgb(51,51,51=
);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-si=
ze:14px">Good day to openembedded community!</span><br></div><div><br></div=
><div>This is my first post - hope this is the right place to ask for help =
regarding a build issue, as refer from here:<br><a href=3D"https://gerrit.o=
penbmc.org/c/openbmc/openbmc/+/71017/comment/195b742f_6cf8da09/" target=3D"=
_blank">https://gerrit.openbmc.org/c/openbmc/openbmc/+/71017/comment/195b74=
2f_6cf8da09/</a><br></div><div><br></div><div>Currently, we saw this issue =
when building this on openBMC which is based on Yocto:-</div><div>The error=
 found when manually run bitbake btrfs-tools-native is as follows:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0checking for a Pyt=
hon interpreter with version &gt;=3D 3.4... python3<br>=C2=A0checking for p=
ython3... /home/apwillia/local/builds/lf-build-yosemite4/tmp/hosttools/pyth=
on3<br>=C2=A0checking for python3 version... 3.11<br>=C2=A0checking for pyt=
hon3 platform... linux<br>=C2=A0checking for GNU default python3 prefix... =
${prefix}<br>=C2=A0checking for GNU default python3 exec_prefix... ${exec_p=
refix}<br>=C2=A0checking for python3 script directory (pythondir)... ${libd=
ir}/python3.11/site-packages<br>=C2=A0checking for python3 extension module=
 directory (pyexecdir)... ${libdir}/python3.11/site-packages<br>=C2=A0check=
ing for python-3.11... no<br>=C2=A0configure: error: Package requirements (=
python-3.11) were not met:<br><br>=C2=A0No package &#39;python-3.11&#39; fo=
und</blockquote><div><br></div><div>To bypass this, we have to manually rem=
ove in OpenBMC with this tweak:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">PACKAGECONFIG:remove:pn-btrfs-tools-native =3D &quot;python&quot=
;</blockquote></div><div><br></div><div>May I know if this is a real bug, o=
r if we did miss something from our configuration?</div><div><br></div><div=
>Thank you again for the help!</div><div><br clear=3D"all"><div><div dir=3D=
"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div><font color=3D"#000000" face=3D"Helvetica">Best Regards,=
</font></div></div><div><font color=3D"#000000" face=3D"Helvetica">Sheng</f=
ont></div><div style=3D"font-size:medium;color:rgb(34,34,34);font-family:He=
lvetica;line-height:11px"><br></div></div></div></div></div></div>
</div></div>

--000000000000a027170616eaf246--

