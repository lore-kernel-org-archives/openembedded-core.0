Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web08.5005.1613644131055994623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 02:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m4KuTzWy;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id s24so1449676iob.6
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 02:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=79g5efiMkVlmlE1bZiCEZdQnf4n0Igp7pm8azB2pPrU=;
        b=m4KuTzWypXta1utu96z5mFLonlVUjURvTEPkLfT9wsdYX4eyEfNugDC0l/eD/EDBow
         WMMbfDfDmBxRDfjSQ2pHHk3iu8Nny7QX/U6ZtKh+A8psMwaM0+q/Sp+LVzUNzMEKDtEg
         yo9zCdN7HgZfRi19h+BjGH1kApDVAmwHsHzdnjjSmMCDkf49M3ZREZpQ0YmyLVh0cSpw
         zcXpWMfzNtV8DcKuLG9i5ZArWI0nEaIcTqYSYSWQQ4JNqSN8YDqyaHev6EghM5AXI1V2
         18DEgbNgriCDnk/jiGPGLgAcqLVyuBblP/GSudI72AWF50mUTQSbZXusuJRM1Utxm+io
         gDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=79g5efiMkVlmlE1bZiCEZdQnf4n0Igp7pm8azB2pPrU=;
        b=VXq2eTtGT0bTfX4YDi3i3pgHU4pJuKOpsW2J9Ds0V8x4UIRYgoAyvO+/INyWmvygBW
         clPPj5AgzUVrEf6tlbu5bwjZo79DjcQjuCGag0uNTQE26W44ECvhr+ubhRPk2Fyx2wlK
         doXd6U52O4tofzC7raeYe84s78QIQTjfJIv3JGc3km9fzKhPoHXkmX2l0dPdEK9QDx0T
         82bNMwYEWjrDup9T4/AcZgy1vaSzNAKaXr6JzwRH1oDtDV2pYKfnHPT3skICZKZTM24O
         5GxK0VpSPvFJMoO9H/c5twsPgD7mGdAYms/CPUvaILvfrI/52iOfwHY7CKSjcA/D/+0Z
         ER5w==
X-Gm-Message-State: AOAM532OooHmTSGx6RHchjEWCaxQuOe2c3/6pvGYGGVsvxdk6HqDf5v6
	HQtf35RVAz6UwsRexWP0sSu8DoT5QpgnD56FhjU=
X-Google-Smtp-Source: ABdhPJyM4GoaB+tHrtm3mdW6JpLy6Eag9yG39ybe6Sim9IahtUCxosSCTLrx11q4awYX7MmaP6Hy5H7hv3gjYxobhCE=
X-Received: by 2002:a05:6638:35a3:: with SMTP id v35mr3832938jal.36.1613644130321;
 Thu, 18 Feb 2021 02:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20210217224915.23546-1-tomasz.dziendzielski@gmail.com> <075c7fbe4df698d6919b3c6bebbb43d83fa1c861.camel@linuxfoundation.org>
In-Reply-To: <075c7fbe4df698d6919b3c6bebbb43d83fa1c861.camel@linuxfoundation.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Thu, 18 Feb 2021 11:30:22 +0100
Message-ID: <CAJkqNs1L+J1e1WVLwO46VB-PfpRgaM+aA3D1mC68ryHg86gcGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add sstate-build-populate_sdk and intercept_scripts- to PSEUDO_IGNORE_PATHS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002e876305bb99cdb2"

--0000000000002e876305bb99cdb2
Content-Type: text/plain; charset="UTF-8"

 >> Recipes using populate_sdk.bbclass are failing with pseudo abort due to
>> path mismatch on these paths.
>>
>> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
>> ---
>>  meta/conf/bitbake.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>We build SDKs on the autobuilder and don't see this. Any idea what you
>need to do to trigger it?

I was able to reproduce abort on sstate-build-populate_sdk on the latest
master without any old build/ directory.
$ . ./oe-init-build-env
$ bitbake meta-go-toolchain
$ bitbake meta-go-toolchain -c populate_sdk -f

Please note that above commands might not fail every time, it seems to be a
bit random. It occurs not only on rebuilds but also on the first run. If we
build multiple SDKs at one bitbake execution the build is unlikely to
finish successfully, because each time different (or the same) SDKs will
fail.

In our environment I also had to add ${WORKDIR}/oe-sdk-repo,${SDK_OUTPUT}
to PSEUDO_IGNORE_PATHS to make SDKs work but I'm not sure if failures on
these two are not related to some of our custom mechanisms.

Best regards,
Tomasz Dziendzielski

--0000000000002e876305bb99cdb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-im">
&gt;&gt; Recipes using populate_sdk.bbclass are failing with pseudo abort d=
ue to<br>
&gt;&gt; path mismatch on these paths.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.d=
ziendzielski@gmail.com" target=3D"_blank">tomasz.dziendzielski@gmail.com</a=
>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0meta/conf/bitbake.conf | 2 +-<br>
&gt;&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br></span>
&gt;We build SDKs on the autobuilder and don&#39;t see this. Any idea what =
you=C2=A0<br><div>&gt;need to do to trigger it?</div><div><br></div><div>I =
was able to reproduce abort on sstate-build-populate_sdk on the latest mast=
er without any old build/ directory.<br></div><div>$ . ./oe-init-build-env<=
/div><div>$ bitbake meta-go-toolchain</div><div>$ bitbake meta-go-toolchain=
 -c populate_sdk -f</div><div><br></div><div>Please note that above command=
s might not fail every time, it seems to be a bit random. It  occurs not on=
ly on rebuilds but also on the first run. If we build multiple SDKs at one =
bitbake execution the build is unlikely to finish successfully, because eac=
h time different (or the same) SDKs will fail.<br></div><div><br></div><div=
>In our environment I also had to add ${WORKDIR}/oe-sdk-repo,${SDK_OUTPUT} =
to PSEUDO_IGNORE_PATHS to make SDKs work but I&#39;m not sure if failures o=
n these two are not related to some of our custom mechanisms.</div><div><br=
></div><div>Best regards,</div><div>Tomasz Dziendzielski<br></div></div>

--0000000000002e876305bb99cdb2--
