Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244B0D6EC0E
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:02:55 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.115535.1732888965136792946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 06:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Az2rRLzr;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: colinmca242@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5f1d3e74ea4so772160eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 06:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732888964; x=1733493764; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2kN4JJRz9YLFWoh2GYhRuv6Ma6NuMl0FArqgmTrFWmo=;
        b=Az2rRLzriMYppujVfYBelxMxblPS7VsRsuiJNs9oOxV9NCm2BgbUkXCsBc9QG0SCWo
         Ym7pJtXnyLJm+7dvtQd7WpiKKZLvbZU56iwJeaa1BpL0SWcJranJ3cO1k2O+Gb8UTnuG
         nrDVt790Je3iJSyHCu2ktJrDwppGfC+LZtRu7P5YK18+JDx96MwmA9izKZAa+q5ice9O
         y7YO31uCxVVvm4lKtm9jqN0lvIWLbnHXwcyrJuew+/DWFwadCo7IENVrxt5bfXLOnF7V
         +rcNMVv/bNMJgMhC0tAiUZP5QWILFM5ne6Y2YQtR5cHdSMbFTTlTHjmxYLPuAZGBBy/S
         JFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732888964; x=1733493764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kN4JJRz9YLFWoh2GYhRuv6Ma6NuMl0FArqgmTrFWmo=;
        b=XIXrLqrOZLE4K/jKfKA61ro+nw0TlCFlMaEqa9FiQKmO7cv0UE05CYV7Rx9zC2ql7x
         LtyZf/7xF3jfItHBh0eijPObz7gerKVwHgMDQAdyjQCF0O516SxpcsfrTZtcG+p7FQqU
         1jR1ytpaA8ZZ6xd9kcBxbq4mqpn2sOwzpDgYE7dfTdK1nslztSz47xpEK8OlWtB/ndrD
         sf7A/8U2MBpWZaZKfYVxpJ/TvAOxgewTQoDUKM0Nvh6dR1bBC7sBi+Zy13OLSlSeI2hQ
         j8AzuYf9Biy2MlAG36fzQrsUH3pIl9doXni8oRZAZ/oZ3JWkPuiioabXlmX0G5W09afj
         N/uQ==
X-Gm-Message-State: AOJu0YwxIHFE+2TUa84cJ8u93TwSCkLjfmy9k1ZmbB0/rEv3mGw4QoKL
	+/Ksaw9/BrTTLwNj4R4bBrpUegEpsb8yWlAnmBHscqAKgeF5NindmWsb2DmqhP3Hu6Lk0NUfEPN
	3M6utHnDRMkFEZrMWbVe0NAAvQ24=
X-Gm-Gg: ASbGncspNY96OU8Ady0Xs4IcOnqSlrvnwi1OS9XasR08X4UAXsNSPPGZIogU/HM2852
	Sr1RCsCDt1QPI1610NwQkDpFQA/dUfh3JGKiM0FJowyMCJ0o=
X-Google-Smtp-Source: AGHT+IE7pAbhmLJ7E1gtRumjqBHeS1llukcvEC1ViDIuHJchiOUplFgcGB7Y5xmXeHkPPgEBGbTC+7ogg5WdToIBFaU=
X-Received: by 2002:a05:6358:5bc5:b0:1be:de52:97b9 with SMTP id
 e5c5f4694b2df-1cab15a5ecdmr560200255d.2.1732888964074; Fri, 29 Nov 2024
 06:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20241127125945.3211089-1-colinmca242@gmail.com> <CAApg2=QjL7XBPbBU0tP7T_hO2OVTudzDf3u+2zJh9GVS3gXKoQ@mail.gmail.com>
In-Reply-To: <CAApg2=QjL7XBPbBU0tP7T_hO2OVTudzDf3u+2zJh9GVS3gXKoQ@mail.gmail.com>
From: Colin <colinmca242@gmail.com>
Date: Fri, 29 Nov 2024 08:02:31 -0600
Message-ID: <CAAyLwgTtg4ykNN9sY91P-CfX2=BeXiXevHu_TyzFaT5=SUbt8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: Update vector logic
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000023986406280da790"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 14:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208017

--00000000000023986406280da790
Content-Type: text/plain; charset="UTF-8"

Hi,


I would like to use the vector string to do some analysis
and prioritization of CVEs and have
found that the vector string is better than using the CVSS score. I would
argue that in
embedded contexts, the environment that a device is used in will result in
a different scoring
of the vector. The most easy example is a standalone device that does not
have any network
connections will likely prioritize physical over network attacks, which I
believe is opposite to
how the CVSS score is determined.

I would like for the vector string to be included in the outputs so it is
also cached. Post-build
tooling could use the NIST API to pull down the vector string, but I would
like to avoid hitting
the API for what I imagine are the same reasons caching is already done for
cve-check.

As others have noted in this thread, the NIST API has been rather
unreliable lately. I agree
that the fetch is likely what is failing the build, since I had to bump the
database filename to
refresh the contents with the correct vector string. I didn't
test_image_json locally, but I did
run builds that included fetching the nvd database and everything seemed to
have been
working.

Thanks,
Colin

--00000000000023986406280da790
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,</div><div><p style=3D"margin:0px;font-stretc=
h:normal;font-size:11px;line-height:normal;font-family:Menlo;font-size-adju=
st:none;font-kerning:auto;font-variant-alternates:normal;font-variant-ligat=
ures:normal;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-feature-settings:normal;color:rgb(0,0,0)"><br></p></div><div>I would like =
to use the=C2=A0vector string to do some analysis and=C2=A0prioritization o=
f CVEs and have</div><div>found that the vector string is better than using=
 the CVSS score. I would argue that in</div><div>embedded contexts, the env=
ironment that a device is used in will result in a different scoring</div><=
div>of the vector. The most easy example is a standalone device that does n=
ot have any network</div><div>connections will likely=C2=A0prioritize physi=
cal over network attacks, which I believe is opposite to</div><div>how the =
CVSS score is determined.</div><div><br></div><div><div>I would like for th=
e vector string to be included in the outputs so it is also cached. Post-bu=
ild</div><div>tooling could use the NIST API to pull down the vector string=
, but I would like to avoid hitting</div><div>the API for what=C2=A0I=C2=A0=
imagine are the same reasons caching is already done for cve-check.</div></=
div><div><br></div><div>As others have noted in this thread, the NIST API h=
as been rather unreliable lately. I agree</div><div>that the fetch is likel=
y what is failing the build, since I had to bump the database filename to</=
div><div>refresh the=C2=A0contents with the=C2=A0correct vector string. I d=
idn&#39;t test_image_json locally, but I did</div><div>run builds that incl=
uded fetching the nvd database and everything seemed to have been</div><div=
>working.</div></div><div><br></div><div>Thanks,</div><div>Colin</div></div=
>

--00000000000023986406280da790--

