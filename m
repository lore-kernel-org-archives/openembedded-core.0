Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCE1C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 13:31:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7354.1750512708168338124
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 06:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XgGT0HVY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d3f72391so25132475e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750512706; x=1751117506; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7VMasMRY6RoprPBTljgdY/ACisscCKBWb5cqPXN4MQU=;
        b=XgGT0HVYr9GZYq+9/gCKSqaCMSv2so9sr8dTkzybw1KvLlOQ4TLW5Wssl2SaF+Va1f
         vmW1+gC0xiJcNiLMje5ztekyXiPahdJxZidfM6fOZAUfrn04A0kBNy7ysbNTRyGZIfSE
         qJmeeULa5z4uGiMvb3NqRHfsgPYzGr8fiK39o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750512706; x=1751117506;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VMasMRY6RoprPBTljgdY/ACisscCKBWb5cqPXN4MQU=;
        b=sOGwabJIe5yTSLmnz1pvawfKnKDxEcnGFOgzrcQWAmNk3JUHfOyPWwQlXkjECuKwsD
         YD2Vz14mEaJkW5P/AtEtQVWrJARsG0H+lNAHkQHIYQrS52mH4h37Wm5q7Vl/TMKLFa7C
         JO8/bQGcIXHmo+B6Bj49hnBDXNOwI5O3MIKRQCyMzsMnQFVwiRYLM5gp+Jq0X3zOvADY
         J6BopAp7jufX0ByezuTMkXFgOfiOgGSHBzLhVn48b6OCsYYhV4rnIzqn5s+qJatMi+7N
         kE8s4KAH4M95WT6AOAQF3UMo9BcFy+f00CM9La7+0Rq3Kh7u1WTypeTCrJ4KBJIIoNJS
         uQ6A==
X-Forwarded-Encrypted: i=1; AJvYcCWTWR6OX6b6s0PHiN05qqjeD2oD7yPTvIbF+tG8evGJW569crZrSgICa8Yk1qnVTum+wN8RMeRy+GX7TUdXK9oMDw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxsEN9HcfcGa8NMwSiiQZBqDaB1Mb7+rojomKmEAxUNfSVwoHVV
	MLzF5q9aloEiV53ZzKqgzD1GZpRhQdpSeEAds/DaxfGeo7+YRmX69NKReVansSMqEhU=
X-Gm-Gg: ASbGncuKZx+tKZCS53a7I2I1+wlbuykYN2VFbWLeqvBi9/nGKV87GJhH0PDQ8i7ZHtr
	fDllbtVrEU7PTR6pDatTFZU+0//roCtqkRk2L4lL0yw7EeQIh8klziVIvd/AYkZCcqR4XcTTVkJ
	O/FMVVHlZEAwxxc2T6KiSzuqly/1lmMR22AlWUxXmRT43hhIlkzjoXE8BPOXUpCht1cHqeaRmNX
	74h5fbD9CUAN3bZYk2IbPqjuRhSrnDrm0m2l+O+tZUYeyHKebZDrkHmEnjm5lEyyKBAqyIKCeZc
	vf5U+4F8iWU8e9J2jneG7aGG/Gc8w5xagdEhCXsMsq7HRNDIbddTWkIQ0d/QU4xrzsvXafeW7iw
	boWVK9FM0+DHWVD/HwCf/5AT1trptM1ONyhpwebwEauRzAB4gLSrACUPatTM=
X-Google-Smtp-Source: AGHT+IEtLuAUGnKZPFYRBW57Kzx9wdn2SRtMHme2dYelVzvWXQUmqdWonQH4B+ps03qk9dK3BgtcaQ==
X-Received: by 2002:a05:600c:1f94:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-45365a05192mr63629605e9.30.1750512706001;
        Sat, 21 Jun 2025 06:31:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3287:1ee:865a:f13c? ([2001:8b0:aba:5f3c:3287:1ee:865a:f13c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d128c7d6sm4884737f8f.99.2025.06.21.06.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 06:31:45 -0700 (PDT)
Message-ID: <e268988dc4edde33df43944d75e64145b5c1b97a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/12] tinfoil: add wait_for decorator and
 build_file_sync() helper
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Cc: christian.lindeberg@axis.com
Date: Sat, 21 Jun 2025 14:31:44 +0100
In-Reply-To: <20250620151429.3210879-1-ross.burton@arm.com>
References: <20250620151429.3210879-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 13:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219155

On Fri, 2025-06-20 at 16:14 +0100, Ross Burton via lists.openembedded.org w=
rote:
> The bitbake worker/server IPC is asynchronous, but tinfoil only has
> functionality to wait for a response on the build_targets() call.
>=20
> Extract the bulk of the "wait for events and handle errors" logic to a
> standalone wait_for wrapper, which is the build_targets code without the
> extra_events or event_callback arguments (for now).
>=20
> Then use this to create a build_file_sync() helper that just wraps the
> existing build_file() with @wait_for.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0bitbake/lib/bb/tinfoil.py | 125 +++++++++++++++++++++++++++++++++++=
++-
> =C2=A01 file changed, 124 insertions(+), 1 deletion(-)

I love the idea of this series. There was one consistent failure in testing=
:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1812

2025-06-20 19:57:17,583 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
selftest/cases/recipetool.py", line 790, in test_recipetool_create_go
    self._test_recipe_contents(lics_require_file, checkvars, [])
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
selftest/cases/devtool.py", line 183, in _test_recipe_contents
    self.assertEqual(missingvars, {}, 'Some expected variables not found in=
 recipe: %s' % checkvars)
  File "/usr/lib/python3.11/unittest/case.py", line 873, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
  File "/usr/lib/python3.11/unittest/case.py", line 1172, in assertDictEqua=
l
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib/python3.11/unittest/case.py", line 703, in fail
    raise self.failureException(msg)
AssertionError: {'LIC_FILES_CHKSUM': {'file://pkg/mod/gith[89 chars]se'}} !=
=3D {}
- {'LIC_FILES_CHKSUM': {'file://pkg/mod/github.com/godbus/dbus/v5@v5.1.0/LI=
CENSE;md5=3D09042bd5c6c96a2b9e45ddf1bc517eed;spdx=3DBSD-2-Clause'}}
+ {} : Some expected variables not found in recipe: {'LIC_FILES_CHKSUM': {'=
file://pkg/mod/github.com/godbus/dbus/v5@v5.1.0/LICENSE;md5=3D09042bd5c6c96=
a2b9e45ddf1bc517eed;spdx=3DBSD-2-Clause'}}

Cheers,

Richard

