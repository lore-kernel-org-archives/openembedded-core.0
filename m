Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0216FC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 12:02:13 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.6272.1719489725245178890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 05:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T/vBRATa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so8244709e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 05:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719489723; x=1720094523; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0z/DG9LpB5MCaPzA22MI5hFHJN9+WdrlMhiajEYCz2Y=;
        b=T/vBRATaWw3W9sjXu9MKbKUtWORLRqicFSrcFU374LluKVdZleUV4PpGLW/pnJ884l
         3lzr11LSyVMnFb1Rj7NxSB7b2OwBZub+pF2du9q/79uwMmCuxBFOSv7TL47Un2bOC7Qu
         iAsJDG87iSF8Ij14PAreWtMnmQ/JojAXEazuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489723; x=1720094523;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0z/DG9LpB5MCaPzA22MI5hFHJN9+WdrlMhiajEYCz2Y=;
        b=IqqE4koxCKzsFUDOsgDmHDO9C+cZlR8+ZpuHG+9nvUBG4TAkCF/GTaPULXSXa/zNDR
         wzUiD6+UfYdmltN0e3gGCz0s+TNarsVbTa23s193V6XxeqA5ShUX+jo3seoFQUISHfcI
         WsDGOvUCtnEK1uo2KSn5l/tgUw0PcF6sImG/cfSlcCtHb9hmE/7u/6MmXq1Z2UUXpjUs
         89xrc2CIlFOfec4tfs3aWwf7GYn6qwtBRmyE6lx8xcDJ3acXrRIX80+MZsNnZeLiVAVk
         dCFgLkQsFekD1yjSBKQC8AZNQ0ZWwz0i8ubdwrP6ijKQdpTFCXNdK4D8tBl5+J+zKta+
         FyOw==
X-Forwarded-Encrypted: i=1; AJvYcCUaeuCLJ4NA4TRvbnff9iO17rBzF+y41dNiF144RItQxRFUxfYAqLT0O/qo17o8f8KeGBPUbiVvvmgMNG0p9q7/JXJoyK+C+Vftlv/b5zChDYc1R26Cu9AR
X-Gm-Message-State: AOJu0YzbGiGgemB2NdKNkzzVxP8FynZN87FP85bv7dh7vY+UiXMheG8K
	eTNvRdORMXmONgPZHzMMPt6vh5dNBi3XJ2k45if0SKks4TXzxTimPqtMjIqnXs0=
X-Google-Smtp-Source: AGHT+IECpw5ARoEzdL39i3lM2CJ8wYDl80PRtzmiWZk+lIMHjUFfi1nwaxFfh8M3T4IS+15H03UsuA==
X-Received: by 2002:a05:6512:449:b0:52c:9413:d02f with SMTP id 2adb3069b0e04-52ce06197c5mr10180807e87.17.1719489723321;
        Thu, 27 Jun 2024 05:02:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:edd1:8c91:3c15:8e70? ([2001:8b0:aba:5f3c:edd1:8c91:3c15:8e70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674357fe82sm1614007f8f.43.2024.06.27.05.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 05:02:02 -0700 (PDT)
Message-ID: <dc373ddf53eddf0ef3103d9f08a9bb72bbd00550.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] testimage: Gate artifact collection with
 variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.hoyes@arm.com, openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com
Date: Thu, 27 Jun 2024 13:02:02 +0100
In-Reply-To: <20240626094130.255905-1-peter.hoyes@arm.com>
References: <20240626094130.255905-1-peter.hoyes@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 12:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201200

On Wed, 2024-06-26 at 10:41 +0100, Peter Hoyes via lists.openembedded.org w=
rote:
> It does not always make sense to collect artifacts and data from the
> target on failure, e.g. if testing firmware or if the target is not
> running an SSH server.
>=20
> Introduce the variable TESTIMAGE_RUN_FAILURE_POST_ACTIONS, which
> defaults to "1". If this variable is not true, skip the failed test post
> actions.
>=20
> Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
> ---
> =C2=A0meta/classes-recipe/testimage.bbclass | 10 ++++++----
> =C2=A01 file changed, 6 insertions(+), 4 deletions(-)

Is there a reason you can't just set TESTIMAGE_FAILED_QA ARTIFACTS =3D ""
?

Cheers,

Richard

