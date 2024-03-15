Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDF8C54E67
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 16:08:31 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.26322.1710518910124021004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 09:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ai0HMvM3;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-221ffba5c8bso1562316fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710518909; x=1711123709; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cNA/4sHVqUAmC5lL92hXV/sDBESkuJCVvZ7fIT73M4=;
        b=ai0HMvM3bC1ec6F04sG847l90sezkFQU7giiAKpDSSt8srQyYYSzMLz+hAgqr5revl
         ZxcCeqp3kuj4cLs9Wvba5HQkUJniP1qZEttPkyjIehBdDwLdft8qCC5g/7/j5siBqIIo
         v0ZJKSAJr5dLUrnLID7+AEASsJlANpmcKXfQ27YQWs22b17Oh4tWboY33eRez6RPdqv8
         2yQSdhaURRTyNwwkbr8sf8HDEFfH3oSnQqaxSqH7Qb5c0J5OHmMaR28PpT6GEoBqsiwl
         5qjES7Ts2vMfhMkve3e+F9RCrwlJexF3otN3gVF3yJ2V0naxG7FYzzURzoACWxsvqw0y
         GsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710518909; x=1711123709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cNA/4sHVqUAmC5lL92hXV/sDBESkuJCVvZ7fIT73M4=;
        b=AAeIkc/fEh39HukIrNygOv+2+I/nQawEWgtii51bUsJpommuRNaWWv36z3KiTFdKHW
         Ta0qBIcsbf+1MfLl3RKNbd0yocAPeqb2cfh0E2ZwqRxv7OMjX3abHZZgeOUis2KUILgW
         58wLwzwxK3L9JpplYAGIQBTJL1TFCScQ6TCX7dYNF4G5m8J1zM1k4083r47MxvkdsQ3P
         HcDzXb7U6SizO3I7xolE1XdOtdmjadOK7SRrMPq3AUaMnjlB77Fkp1VMBwhnwK4S/xEw
         6MCHWI7I9fLr4of41x+fKmC7hSdG3uFcU55coie5MjtQyEFvymzbos7Rb8O1+Zs2dAmg
         3bmg==
X-Gm-Message-State: AOJu0Yx2fcngz1CsWAud/Q2Z25hUgnW9WDFA8Z34jX0XOfPlfw+SOExb
	UoDxK4kWfFPYynSswHVVdl6Ix2Hh9guyi9tPDtU8Jju1d50N3uh7udIJoqKhUutR8GRA5ieQwoD
	kDUw3FIuMBi2fR4eRy9Rp1/hnq7FC+BvBF6o=
X-Google-Smtp-Source: AGHT+IH6FzRDnNlYe4pe17BEE+je/GXdlWgPXBvNkqv1ccjOL28kOm3bwQGd4af3T9Mr5QPacEUFJeAvaQnzWDYfS64=
X-Received: by 2002:a05:6870:9113:b0:221:7970:737b with SMTP id
 o19-20020a056870911300b002217970737bmr4935571oae.48.1710518909391; Fri, 15
 Mar 2024 09:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240315143738.1234858-1-ross.burton@arm.com>
In-Reply-To: <20240315143738.1234858-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Mar 2024 09:08:03 -0700
Message-ID: <CAMKF1sonOZZrSpy9kLf1LYstGRAiOe1AHL3uVJH8w9D=6Z5qhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] curl: improve run-ptest
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 16:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197142

On Fri, Mar 15, 2024 at 7:37=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> There's no need to run the output of runtests.pl through a sed to get
> automake-style output, as you can pass -am to get this formatting.
>
> Don't run timing dependent tests, as the ptests can run on loaded
> systems.
>
> Add a dependency on the en_US locale because some of the tests require
> this.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-support/curl/curl/run-ptest | 13 +++++++++----
>  meta/recipes-support/curl/curl_8.6.0.bb  |  1 +
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-supp=
ort/curl/curl/run-ptest
> index 8f9c20f34df..acd2892f80e 100644
> --- a/meta/recipes-support/curl/curl/run-ptest
> +++ b/meta/recipes-support/curl/curl/run-ptest
> @@ -1,6 +1,11 @@
>  #!/bin/sh
> +
>  cd tests
> -{ ./runtests.pl -a -n -s -j4 !flaky || echo "FAIL: curl" ; } | sed \
> -     -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
> -     -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
> -     -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc=
//'
> +
> +# Run all tests, don't stop on first failure
> +# Don't use valgrind if it is found
> +# Use automake-style output
> +# Run four tests in parallel
> +# Print log output on failure
> +# Don't run the flaky or timing dependent tests
> +./runtests.pl -a -n -am -j4 -p '!flaky !timing-dependent'
> diff --git a/meta/recipes-support/curl/curl_8.6.0.bb b/meta/recipes-suppo=
rt/curl/curl_8.6.0.bb
> index b01f4542a22..d4473d868e2 100644
> --- a/meta/recipes-support/curl/curl_8.6.0.bb
> +++ b/meta/recipes-support/curl/curl_8.6.0.bb
> @@ -125,6 +125,7 @@ RDEPENDS:${PN}-ptest +=3D " \
>         perl-module-storable \
>         perl-module-time-hires \
>  "
> +RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-en-us"

musl-locales does provide a subset of locales and locale-base-en-us is
one of them
so you don't have to make it conditional.

>
>  PACKAGES =3D+ "lib${BPN}"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197133): https://lists.openembedded.org/g/openembedde=
d-core/message/197133
> Mute This Topic: https://lists.openembedded.org/mt/104948640/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

