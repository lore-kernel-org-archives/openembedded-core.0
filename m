Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.12185.1612884988551151259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ezhPr3BO;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id u8so19113608ior.13
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2+eNnGe/fpBmtBUFHii8yqrjPV/ijfHHbJliAwjy68=;
        b=ezhPr3BOoWYEdcrJH67Sy+YwZNtK6Lu1l0Pf9IzDW794gbPeXUeDMtuU8RKeV/eQSb
         Ts+ZV3TcMB+BBjeXnd6VeQlC+o2PSyATkozyPrAVGKS0vDGn0aIS7l0K0KXiCiIn/r30
         D3/xVDRwfQEUovbp+YW3Ul6vv/5xnC6Lu984ybr9sAuJT1Py9IUz4jXrZW0T1hWvwdX3
         T3t8aC2uF2ZSU2W4uib/JoE6jgETNqRZKXg7S+VPjxcBA2/6lAxwTGl+hLrPcyxUedud
         3nFauhF7iQxoMYs4QtKbVaFPtkOeGU1rYo5YaFAhQqhYz257jiMgzIArI+odQDATrmes
         as3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2+eNnGe/fpBmtBUFHii8yqrjPV/ijfHHbJliAwjy68=;
        b=UHKK2cfKGtrnwjldk/4Dp3PulIUIy8ewg37hc1AZTv0P1WsaximB4PljDbioBI0YQR
         pi/kEwm+LPSV8u69NzTiXE+Q/p045Q+e02azHtyO0QDT0ZBvW/jpAsWkEXNGgKS4KqkF
         iqKlGrz57KcKxqx4HvOo60ZSpVYZ+MhLtOMTRX9jH044vaKVPxvJZT5zTPyIxthXVpiA
         9ipLPqrGggBWetPSdg84yvvLVMoKLU7at0/ii4uww611wT9tAYmASKMXEci9dAVHhsDZ
         6LnwY5UDUyiXkwG6nt6xzctkc+wPVE/PSMal26DRcQ99OyQx3dQFrRiGmkhKlqDs/qaT
         USZg==
X-Gm-Message-State: AOAM531auQS74k/aqEKxVSE/vK37WwEdqBGGlmV26n94Cdy/xZ/KaXBv
	W4k8i1x+Ulnd25bGcS5ZwpiGv6ybH9QtQbKEy5c=
X-Google-Smtp-Source: ABdhPJxjLae1lpTxWctN4nYBquGTCZ+GyPZAQJ4HuztaCf01rE+f3Hb562VMoB4l1gQ+7Wdqsxl0CS4sDP2FdoNsMw0=
X-Received: by 2002:a5d:9418:: with SMTP id v24mr19538485ion.61.1612884987958;
 Tue, 09 Feb 2021 07:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20210204121323.1696-1-tomasz.dziendzielski@gmail.com> <f0c6dc4481894031536eda836d13510ae919935c.camel@linuxfoundation.org>
In-Reply-To: <f0c6dc4481894031536eda836d13510ae919935c.camel@linuxfoundation.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Tue, 9 Feb 2021 16:37:53 +0100
Message-ID: <CAJkqNs17+aUbbqg+Yw9HM0nKMXSPw_kri7Hho4eDeHOh1am8ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] license_image: Introduce SKIP_LICENSE_MANIFEST_RECIPES variable to prevent from trying to use license recipeinfo file from image recipes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c55f5c05bae90ce5"

--000000000000c55f5c05bae90ce5
Content-Type: text/plain; charset="UTF-8"

Thanks for the answer.

>I've been giving this some thought and I really don't like having to
>remember to manually add special cases like this, it sounds/looks like
>something we should really fix in a better way.

The other way that comes to my mind would be to loop over all dependencies
and check if they inherit image.bbclass which would increase build time.
Another problem is that we don't have direct access to other recipes'
metadata, so we would need to prepare such mechanism.

>Perhaps we should just skip license files if they don't exist? We could
>perhaps show a warning if the match isn't for a recipe called *-image?

There might be recipes inheriting image.bbclass that don't have "image" in
its name (which is also my case). I can prepare the change to just print a
warning instead of error if the recipe can't find a license manifest for
any recipe, not only the ones called *-image. Unfortunately that way we
could not catch missing manifests with recipes that should provide them.
Would such change be accepted?

Best regards,
Tomasz Dziendzielski

--000000000000c55f5c05bae90ce5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Thanks for the answer.</div><div><br><=
/div><div>&gt;I&#39;ve been giving this some thought and I really don&#39;t=
 like having to<br>
&gt;remember to manually add special cases like this, it sounds/looks like<=
br>
&gt;something we should really fix in a better way.</div><div><br></div><di=
v>The other way that comes to my mind would be to loop over all dependencie=
s and check if they inherit image.bbclass which would increase build time. =
Another problem is that we don&#39;t have direct access to other recipes&#3=
9; metadata, so we would need to prepare such mechanism.<br><br><div>
&gt;Perhaps we should just skip license files if they don&#39;t exist? We c=
ould<br>
&gt;perhaps show a warning if the match isn&#39;t for a recipe called *-ima=
ge?</div><div><br></div><div>There might be  recipes inheriting image.bbcla=
ss that don&#39;t have &quot;image&quot; in its name (which is also my case=
). I can prepare the change to just print a warning instead of error if the=
 recipe can&#39;t find a license manifest for any recipe, not only the ones=
 called *-image. Unfortunately that way we could not catch missing manifest=
s with recipes that should provide them. Would such change be accepted?</di=
v><div><br></div><div>Best regards,</div><div>Tomasz Dziendzielski<br></div=
></div><div><br></div></div>

--000000000000c55f5c05bae90ce5--
