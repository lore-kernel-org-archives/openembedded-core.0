Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB33C30653
	for <webhook@archiver.kernel.org>; Sun,  7 Jul 2024 08:10:20 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.54521.1720339813761786825
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 07 Jul 2024 01:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dhyIoqX4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42561c16ffeso21127955e9.3
        for <Openembedded-core@lists.openembedded.org>; Sun, 07 Jul 2024 01:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720339812; x=1720944612; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5sZae+8m5mQqBm7xNI9/J28iMzYV2BIsxT1xXBVapWk=;
        b=dhyIoqX4iI7Q2oG+U4Jn5Wk+0TOeXSNgRyLO22sl48XKIK8TaYse8NgnxwgVWmTOhn
         nnKP0rC1+dug7W9TCYb3LXAWybcwUGXvQn9FZZaOoG5qU3+yIml5kiWjReP3hiLqqSIx
         tnIxTS8JzIN172TKew6+7ISQ60ue8uoEJzoLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720339812; x=1720944612;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5sZae+8m5mQqBm7xNI9/J28iMzYV2BIsxT1xXBVapWk=;
        b=SsbT6/L07OkLY7p/d4wd0CjFda3BudNW5M8g/oNmOjmXuvb6V9OgiM2yPjuDF1T8Wi
         1E1Ck5gH6is0i+4ghw3uNSbXjMhk7vht+CJG+JtIQ9SW6jhmR/9dqdo6fTe6oPSDs/8J
         EGbGfomkyNMfdGnbTJH6+yUTMZ4vMGMqR8Ga/yoa185AMAl5nXqbSsgv2Sy+R+Hw3JJc
         guS4A/bT2YK1cxgOLKymRTM4LhpEkNIgYWeDMuPYcqNI1zlnadagTe87uVO/LreQYCW+
         6tWlCbyN1tC90u0mhzJTNhM0uwwQGFKRqDDX7gIZBabgo70OhRTqQpMYxJeamXfvpMRR
         SK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4E4tsbk6yjWTObwsKWGMYnHV+yVRE9L9kMnZv3+DzdhfEE4zPCrL3vUmZN73OBgPdamamfAx7pRuJ2o6+9MOC5D7bGNjj+tWxUAx8IUfoh1kBxFAgp0t1
X-Gm-Message-State: AOJu0YzL9hn1fy1oVW2EmY/ldW1PEJW7rstT5A4rm477m3DqXv6nHWZl
	r1+rp2Ea3x11BOJzUo6B/mbw48czbWBEhHdMXH3Z1JQpeq6Fv+qn5xDdTEVCw24=
X-Google-Smtp-Source: AGHT+IEVILmS+53lGSthQizJLY9qg0BzZ8vI/gXJBDAfoO4Jw7I/JzxtQc7OIHhCpTkVm7mQpCHMDg==
X-Received: by 2002:a05:600c:4caa:b0:426:6171:6083 with SMTP id 5b1f17b1804b1-4266171610dmr17124455e9.13.1720339811791;
        Sun, 07 Jul 2024 01:10:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c07:df43:6337:8a2f? ([2001:8b0:aba:5f3c:5c07:df43:6337:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a21cf55sm121324945e9.27.2024.07.07.01.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 01:10:11 -0700 (PDT)
Message-ID: <dd50f7eea15a500e7f6334d043b0dfe9c4620675.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/utils/postactions: transfer whole
 archive over ssh instead of doing individual copies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Sun, 07 Jul 2024 09:10:10 +0100
In-Reply-To: <20240705144638.441976-3-alexis.lothore@bootlin.com>
References: <20240705144638.441976-1-alexis.lothore@bootlin.com>
	 <20240705144638.441976-3-alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jul 2024 08:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201618

On Fri, 2024-07-05 at 16:46 +0200, Alexis Lothor=C3=A9 via lists.openembedd=
ed.org wrote:
> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>=20
> Fixes [YOCTO 15536]
>=20
> The postactions retrieval actions currently rely on scp executed
> individually on any file or directory expanded from
> TESTIMAGE_FAILED_QA_ARTIFACTS. Unfortunately, symlinks are not preserved
> with this mechanism, which lead to big storage space consumption. Things
> may go even worse if those symlinks create some circular chains. This
> mechanism then needs to be updated to preserve symlinks instead of
> following them during copy. There are multiple ways to do it:
> - create a local archive on the target and execute scp on this file
> - use rsync instead of scp for all files
> - create an archive and pipe it to ssh instead of storing it onto the
> =C2=A0 target
>=20
> The first solution may create pressure on targets storage space, while th=
e
> second assumes that rsync is installed on the target, which may not be
> true. So the third one is a compromise: tar is very likely present, at
> least through busybox, and no disk space is used on the target.
>=20
> Replace the current per-file scp call by a single call to tar run on the
> target. Retrieve the generated compressed archive directly from SSH outpu=
t,
> and feed it to another tar process but on host, to uncompress and extract
> it at the same place as before.
>=20
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> ---
> =C2=A0meta/lib/oeqa/utils/postactions.py | 19 +++++++++----------
> =C2=A01 file changed, 9 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/pos=
tactions.py
> index ecdddd2d40e3..f7ce25f2af8e 100644
> --- a/meta/lib/oeqa/utils/postactions.py
> +++ b/meta/lib/oeqa/utils/postactions.py
> @@ -62,17 +62,16 @@ def get_artifacts_list(target, raw_list):
> =C2=A0=C2=A0=C2=A0=C2=A0 return result
> =C2=A0
> =C2=A0def retrieve_test_artifacts(target, artifacts_list, target_dir):
> +=C2=A0=C2=A0=C2=A0 import io, subprocess
> =C2=A0=C2=A0=C2=A0=C2=A0 local_artifacts_dir =3D os.path.join(target_dir,=
 "artifacts")
> -=C2=A0=C2=A0=C2=A0 for artifact_path in artifacts_list:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not os.path.isabs(artifact=
_path):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.wa=
rn(f"{artifact_path} is not an absolute path")
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conti=
nue
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest_=
dir =3D os.path.join(local_artifacts_dir, os.path.dirname(artifact_path[1:]=
))
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.ma=
kedirs(dest_dir, exist_ok=3DTrue)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 targe=
t.copyFrom(artifact_path, dest_dir)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except Exception as e:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.wa=
rn(f"Can not retrieve {artifact_path} from test target: {e}")
> +=C2=A0=C2=A0=C2=A0 try:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D f"tar zcf - {" ".join=
(artifacts_list)}"

Thanks for the patch. The syntax above causes failures:

https://valkyrie.yoctoproject.org/#/builders/95/builds/59/steps/14/logs/std=
io

I've put a fix on master-next which I can squash in but it does make me
wonder how it was tested.

Cheers,

Richard


> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D target.r=
un(cmd, raw =3D True)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if status !=3D 0 or not outpu=
t:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise=
 Exception("Error while fetching compressed artifacts")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =3D subprocess.run(["tar", =
"zxf", "-", "-C", local_artifacts_dir], input=3Doutput)
> +=C2=A0=C2=A0=C2=A0 except Exception as e:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn(f"Can not retrieve {a=
rtifact_path} from test target: {e}")
> =C2=A0
> =C2=A0def list_and_fetch_failed_tests_artifacts(d, tc):
> =C2=A0=C2=A0=C2=A0=C2=A0 artifacts_list =3D get_artifacts_list(tc.target,=
 d.getVar("TESTIMAGE_FAILED_QA_ARTIFACTS"))
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201610): https://lists.openembedded.org/g/openembedde=
d-core/message/201610
> Mute This Topic: https://lists.openembedded.org/mt/107054834/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=C2=
=A0[richard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


