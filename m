Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61F7CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 14:15:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13090.1778163299060810353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 07:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Fk2epX5V;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so10685715e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778163297; x=1778768097; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6efthW9MQISpC7YjXio7QhPLzpBTfrWC+PyZ1GTzus=;
        b=Fk2epX5VevvPuU05gP2oP9N+jeKY+dJ7Ywmn93+wBIhGGSrluqJlj03oOyTPkzU1nW
         fIrjaDHW7bTPa7eS/LhzHMSIQaMDrfEtVuWEbNOXM5ApGN7y+FCcEzjw9ir3PARi92qn
         79NyWIonOzK+CuiD8IlLJzO1zQvMszXOsqWAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163297; x=1778768097;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6efthW9MQISpC7YjXio7QhPLzpBTfrWC+PyZ1GTzus=;
        b=W+KjBWbP5FGOt2/501hAB/K8+Ellu0jr8wDQxbys+qDP4bC1p+7+J/5GZ+jUAcYwDb
         YyGzAizmjt821GVlUIwhFRadJ17P9sRGV+6ud7bmberoPhrjNDJsyWUFosfytzS6Kfiy
         ZKXj/3jpLxxa5l1JoIWnELVRjGiTgcjgUkUH+abxminJxt9k/ivyDBlBMiMKVMDBmV9N
         z9HDgwb444X+oDnE/vgJPklYrKbAOL6Clh6C+qVaJgS26q6lHnwfkuTY0qA2jPnib8cX
         DpiJvUfZEPuG8M5fQayAh3OuHaFmFjuGxJjGL6VtbPlXTqezBSENytq6t4IGe39ysUza
         p0qw==
X-Forwarded-Encrypted: i=1; AFNElJ+uCCGCYjqNtJg5YPHlljf1fYHoV+wJLN2igfCeS6WZACmOl9nPgFSPk3chBlhJA+d+pvTVSX8NJPWKk+G/EYAP+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRoIfP239lu99lsE/KBdbbqIQN5ypvtwBFpOaqXAAFkyyehTNq
	bXZfPUgFTpY0mypmTnAQfTRYsrT5US3s62GNVWT3kxvDkYbSSC0E91zlOaotedCr2jk=
X-Gm-Gg: AeBDiesf+JWHzTkzajcZKw7i3SWuxt6vjpNwj6TKXTVSrrU5CdhOSlXE0cWStQWd16V
	xly9+MATzlZ4PPrSANNtDNeIxWm2Bk0Q6B2FJ+8iPlpaXVrNecEUyLVeqbVGoo3SwCmKQ1hfMep
	C/7pVmLOI+Ys4zoDpkJ3qfj6LCUSFOVDo+oEXq7ao9qw9xaWCTBIvopM85sm93nz0Tc+NGUoe8j
	fuyqEZRZNMaF/D+6+JmrQuD+SIkteGQrtZMHGwwJcvVQOi6HQaXItt3eibbB/WHtyMpohO4JvIg
	DUAOKId3LhdfA1mWrsxVnxMQJv0UvuOuMflxZnZIM2qyEZp7CIry6mefXFsGVl6OLlhZOADiQy0
	UaEIMWR6WrnmwMxvSeMza5p4GJ5+l+WDiAIYVfG9/VtgzZ67VphPRbQ/AJDIhYt4TYzApqOMK96
	QeSpoziHgx/+XM4skm8wn4B2Gcprar2jkM0aPIkVj1aDjZjwvcAaswIlZohjNyLP5YcpWRRUsGn
	dQMBcQaoiBG9umE0GcJx7Y08AkryTZXNnnKshkU7QemYNs=
X-Received: by 2002:a05:600c:3e8d:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-48e51f40b12mr141848925e9.22.1778163297090;
        Thu, 07 May 2026 07:14:57 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538aaa0fsm155762585e9.7.2026.05.07.07.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:14:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 16:14:56 +0200
Message-Id: <DICIA54NRGQA.3213X4EU8EMW5@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 3/3] libexif: upgrade 0.6.25 ->
 0.6.26
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260504063159.30681-1-hprajapati@mvista.com>
 <20260504063159.30681-3-hprajapati@mvista.com>
In-Reply-To: <20260504063159.30681-3-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 14:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236591

On Mon May 4, 2026 at 8:31 AM CEST, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Release notes [1]:
>
> libexif-0.6.26 (2026-04-14):
>
> * Security issues fixed:
>   * CVE-2026-40386: An unsigned integer underflow in Fuji and Olympus mak=
ernote handling
>   * CVE-2026-40385: An unsigned integer overflow on 32bit systems in Niko=
n makernote handling
>   * CVE-2026-32775: A buffer overwrite via integer underflow in makernote=
 handling
>
> * handle JPEG APP3 marker
>
> * added EXIF_TAG_IMAGE_DEPTH tag
>
> * translations updated: Arabic, German, Spanish, Polish, Romanian,
> * Serbian, Swedish, Ukrainian, Chinese
>
> [1] https://github.com/libexif/libexif/releases/tag/v0.6.26
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---

Hello,

I've tested this series but got a ptest failure:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/3632
https://valkyrie.yocto.io/pub/non-release/20260507-71/testresults/qemux86-6=
4-ptest/core-image-ptest-libexif/log.do_testimage.1906144.20260507125409
| DEBUG: Command: ptest-runner -t 450 -d "/usr/lib"
| Status: 0 Output:  START: ptest-runner
| 2026-05-07T12:58
| BEGIN: /usr/lib/libexif/ptest
| All 0 tests passed (0 skipped)
| DURATION: 0
| END: /usr/lib/libexif/ptest
| 2026-05-07T12:58
| STOP: ptest-runner
| TOTAL: 1 FAIL: 0
[...]
| WARNING: There were failing ptests.
| NOTE:  ... expected failure
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
|     return func(*args, **kwargs)
|            ^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
|     return func(*args, **kwargs)
|            ^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
|     return func(*args, **kwargs)
|            ^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/=
runtime/cases/ptest.py", line 27, in test_ptestrunner_expectfail
|     self.do_ptestrunner()
|   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/=
runtime/cases/ptest.py", line 120, in do_ptestrunner
|     self.fail(failmsg)
| AssertionError:=20
| ptests which had no test results:
| ['libexif']


Looks like no tests actually run...

Can you look into it?

Thanks!

>  .../libexif/{libexif_0.6.25.bb =3D> libexif_0.6.26.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/libexif/{libexif_0.6.25.bb =3D> libexif_0.6.=
26.bb} (93%)
>
> diff --git a/meta/recipes-support/libexif/libexif_0.6.25.bb b/meta/recipe=
s-support/libexif/libexif_0.6.26.bb
> similarity index 93%
> rename from meta/recipes-support/libexif/libexif_0.6.25.bb
> rename to meta/recipes-support/libexif/libexif_0.6.26.bb
> index c57855303f..56b2e1e168 100644
> --- a/meta/recipes-support/libexif/libexif_0.6.25.bb
> +++ b/meta/recipes-support/libexif/libexif_0.6.26.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libexif=
-${PV}.tar.bz2 \
>             file://run-ptest \
>             "
> =20
> -SRC_URI[sha256sum] =3D "7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528b=
c989d3b3e7a26307"
> +SRC_URI[sha256sum] =3D "0830ed253fceeb60444fb309598bc8a9491d3007dc054aad=
3a50a347c5597c57"
> =20
>  inherit autotools gettext github-releases ptest
> =20


--=20
Yoann Congal
Smile ECS


