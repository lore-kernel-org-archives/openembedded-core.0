Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635CAD32D95
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 11:25:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.84476.1731410754360712757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 03:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iW4jGpMc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-381ee2e10dfso3215991f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 03:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731410753; x=1732015553; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EnZb57+Ng8gOcS8ktt2TwrsD5BHEEU+MNelM1wwfeM=;
        b=iW4jGpMcwvREffvSq6myuyGs9jFfv01r/HXMJzWttF6QDPB79GTLNzTNFjLmUrOzus
         qaIez649/MLHmcxx+SBYk8RxvzXGSPFqdzaC/vAzz6HX3eKnJsCgTMeWsE9QhnA7haBT
         8CoTKdQG9RDDD+ew8KPmFXE6hBozFbIRaTW30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731410753; x=1732015553;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+EnZb57+Ng8gOcS8ktt2TwrsD5BHEEU+MNelM1wwfeM=;
        b=fZlGFuKsv1Jh5e7GQgiVwP55xRzypuAzRKm3wqe20nj6u5vbtbp6v+XALGV9dqRkwJ
         CjE0uWkhDWNdKtWXUBd2DeniPmuEoz+OyBwrEhM9nL4BkBK2UkB7FTsoleO+6J1ImdKd
         Q2J6Kp9Zx8AnbURBg61U1HfqBEcd71srEVQfji5D/ZXIabBGt+XJCMpss31nne6JNytU
         f0iqHOvMlJjj3phG1W/RvDp3Bl/7uj/ngUzMbIIXC58tc/aSS/tVyNVx0bY3dfavvF2Z
         /EiHJ1wnnTc14qFI2HJt4oMTn68xlz0+OBH8K7ZfapHOPUQOzeJ//GWvqs2jT+1XnRjD
         NNNA==
X-Forwarded-Encrypted: i=1; AJvYcCUPbTpEkzAYeUgjmbSlXeu/6y6NVucM8r63YHfJNgI6byKdO0z7nOSU1fVmN1YgeD2ck8k6AUPVmD1iwfLjfa73eQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz0CgXqFFRp9PlzZuqyNoWaje+oExknCdwBDdTN7iFiu+aEUaJs
	a/wezgdQx8bF1h5ffc4fHEhqpps2+Q6e4MUPodEmKWuZ9XcTfx/1jDYMHh5L8NA=
X-Google-Smtp-Source: AGHT+IEjc6Wemqu9zCaT3EQqMjRXgeCo4je0GnyRngSyi0qbHZtzzDizyjH5047BS/sFLuSQeOabeA==
X-Received: by 2002:a5d:6c63:0:b0:37c:c842:a16e with SMTP id ffacd0b85a97d-381f1862da0mr12800671f8f.5.1731410752744;
        Tue, 12 Nov 2024 03:25:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeea:2252:f7a4:6a05? ([2001:8b0:aba:5f3c:aeea:2252:f7a4:6a05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97fe6csm15049602f8f.31.2024.11.12.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 03:25:52 -0800 (PST)
Message-ID: <10810101792ffe49440847764ed2e4c620e67fe9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] testimage.bbclass: capture RuntimeError
 too
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2024 11:25:51 +0000
In-Reply-To: <20241111131604.364308-3-mikko.rapeli@linaro.org>
References: <20241111131604.364308-1-mikko.rapeli@linaro.org>
	 <20241111131604.364308-3-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 11:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207045

On Mon, 2024-11-11 at 13:16 +0000, Mikko Rapeli via lists.openembedded.org =
wrote:
> runqemu can fail with RuntimeError exception. Non-cought exception
> causes cooker process leaks which bind to successive bitbake command
> line calls and that can cause really odd errors to users, e.g. when
> build/tmp is wiped and cooker processes expect files to be there.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/classes-recipe/testimage.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
> index 19075ce1f3..a9b031093a 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -371,7 +371,7 @@ def testimage_main(d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 complete =3D True
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if results.hasAnyFailing=
Test():
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
run_failed_tests_post_actions(d, tc)
> -=C2=A0=C2=A0=C2=A0 except (KeyboardInterrupt, BlockingIOError) as err:
> +=C2=A0=C2=A0=C2=A0 except (KeyboardInterrupt, BlockingIOError, RuntimeEr=
ror) as err:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if isinstance(err, Keybo=
ardInterrupt):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bb.error('testimage interrupted, shutting down...')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>=20

During review it is hard to understand what the real issue is from this
description. I don't like the sound of processes leaking and if that is
happening, adding another exception to this list doesn't feel correct.
I was going to ask for a better explanation but looking at the code,
perhaps this error handling path just needs rewriting/improving with
more of the code in the finally, conditionally?

I just want to make sure we fix the real bug here.

Cheers,

Richard=20


