Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41010CE8D5C
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 07:42:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.14324.1726731730731288836
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 00:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ck3hSmra;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so3873735e9.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 00:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726731729; x=1727336529; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YnQyBueQXNEfIfGcHjUWm+gOoR+uW6bAHFfBrPmg/XU=;
        b=Ck3hSmra55JP+IyFsy3q3OG5RXcUJfhKioXOW88kYiHFTmKuSY/dhkIamJDkdo3fqD
         yNWbqlrGMlJfOoAarf7/UIPwZ97Leb/dG2Vqph21QNtTFzY4r1mFA2L/0OcK9OsPkxkM
         ZgGj3mhaHKgJr4VaDfApcvgLU1DzfPVmhxiYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726731729; x=1727336529;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnQyBueQXNEfIfGcHjUWm+gOoR+uW6bAHFfBrPmg/XU=;
        b=PviPOgs0Gw3zyDFtc9AZ0cwQXRvJouNYDQFOSfeBx6gSZ4Y3Krrqqg+IoJ8McL8zyu
         BnVfbBWLOWxv8Ty7owOfAnEaV3LoXm/DudkS2Qq7eEG0PVkW+GxEqfHiwYobLNLvg4ZN
         3A2onokOMPM8oMhnHUYNkSk6ITOCmsMHlxBq1uXeVJTZafeA0OXOqPjpPMSBOKHuu6ND
         vXGJze3R9r3Y5DPYZKYB0CRV/rfE4P+FGvjH5S+iGrQ2A4+EUmvFCvtyl3gWwRmsZmQj
         65HrNho6obhvjZ9dTgqqlcxbU0tqHaY3OdEacp1paR9qrjngzXra1Z3on6GptgJBXgVb
         +LnA==
X-Forwarded-Encrypted: i=1; AJvYcCU8sfbKPD1D7XzKUibjuEUIPNnZv2OQ+rUyIMAztRsVOQeHn8lZBjNazte6zpmggppMSNHOO9+FzIjjZ0U2FORl2g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzU1Gp+ySkbAbwVXE6rl7ARbDTrO0giKFIDzu1gApVbCIDVTumW
	4v43kVxYeXgu6DFGiqClqsf/MLn2Ym/e4jdV7iUaRwTDrBfG6jSmOQz6KcynvtA=
X-Google-Smtp-Source: AGHT+IEouCqrNiWOjmn4PImttjnTuTJoA4NV19XkgPlxzNLkAlmST6+ueGZjwRJPvChZ76jV18LZzg==
X-Received: by 2002:a05:600c:46cc:b0:42b:af5a:109 with SMTP id 5b1f17b1804b1-42d964d9243mr141358085e9.24.1726731728984;
        Thu, 19 Sep 2024 00:42:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f722:770d:8a57:e159? ([2001:8b0:aba:5f3c:f722:770d:8a57:e159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754c5404sm14453055e9.39.2024.09.19.00.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 00:42:07 -0700 (PDT)
Message-ID: <97f1e136536099d06bf21ebec1adbcce9e4f51df.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/postactions: do not uncompress
 retrieved archive on host
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Thu, 19 Sep 2024 08:42:06 +0100
In-Reply-To: <20240812151404.134030-3-alexis.lothore@bootlin.com>
References: <20240812151404.134030-1-alexis.lothore@bootlin.com>
	 <20240812151404.134030-3-alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204657

On Mon, 2024-08-12 at 17:14 +0200, Alexis Lothor=C3=A9 via lists.openembedd=
ed.org wrote:
> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>=20
> Current postaction module executes a remote tar command, pipe it in a SSH
> connection, and uncompress the raw stream with another tar command. With
> this command, the whole artifacts tree is directly available on the host
> executing the test, but it is not very convenient if we want to download
> the whole retrieved ptests directory.
>=20
> Stop uncompressing the retrieved ptests archive onto host, just save the
> archive as it is. The new output then looks like the following:
>=20
> tmp/log/oeqa-artefacts
> =E2=94=94=E2=94=80=E2=94=80 oeqa-target-artefacts-20240812-juzqdb80
> =C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 host_disk_usage.txt
> =C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 target_disk_usage.txt
> =C2=A0=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 tests_artifacts.tar.gz
>=20
> Suggested-By: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> ---
> =C2=A0meta/lib/oeqa/utils/postactions.py | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/pos=
tactions.py
> index 3b537146c50a..d5080523aa83 100644
> --- a/meta/lib/oeqa/utils/postactions.py
> +++ b/meta/lib/oeqa/utils/postactions.py
> @@ -68,7 +68,8 @@ def list_and_fetch_failed_tests_artifacts(d, tc, artifa=
cts_list, outputdir):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D tc.=
target.run(cmd, raw =3D True)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if status !=3D 0 or not =
output:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
raise Exception("Error while fetching compressed artifacts")
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =3D subprocess.run(["tar", =
"zxf", "-", "-C", outputdir], input=3Doutput)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with open(archive_name, "wb")=
 as f:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f.wri=
te(output)
> =C2=A0=C2=A0=C2=A0=C2=A0 except Exception as e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn(f"Can not retrie=
ve artifacts from test target: {e}")


This change is causing failures since archive_name isn't defined anywhere :=
/

Cheers,

Richard


