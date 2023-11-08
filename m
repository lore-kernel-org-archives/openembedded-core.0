Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D30C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 10:34:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.10542.1699439659938194922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 02:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ks9+b11u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso46701965e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 02:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699439658; x=1700044458; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JjV4gTAzj5cZNVZdetmAWt5OFbnQyZiqIRxXJ35PC7A=;
        b=Ks9+b11uPAr38Ay8hA+HX3T/1UdT43LuTjNNpg6LKo+MOtcaxY5h7RWPPZ5zZRYsNS
         NeRZ5FZXeLlsX/hzbmV7CqH0XzUbMjJYlVULpT/cS9nmhrXxcgdiQY8PNROR/JsHB7wz
         GTNSFqPwzzkEeZB/scrjiJXb8CNgI8oj9A0jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699439658; x=1700044458;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JjV4gTAzj5cZNVZdetmAWt5OFbnQyZiqIRxXJ35PC7A=;
        b=biAMogOYjT/BsuB5coLCr1fOz9cfgtgylo71X3D7jcUF5dHJ8R11EH8vDy0k8bouir
         JAl1H0jR+SIOxyt50tasoF7Z3Vs0tzzk1vTAqSM8o6MAFg2fF4OJpTXqlREHcQ962qEv
         ZDsGuWB9Z2lmZwlrXHsHa5OQ5lo8iLex7R1gs9ffgUgPCtHIc2zkqGw+fo9dOsLfeRvc
         lddnoxLQeQAhMCAjbnJtKUaKi3bKxBn8p0IWcgweP+xbXh1D7UCKMJVjV6IwF9w6o/xC
         YF2DRD+J7VWrSAR6ycymzYziGH8GuyRvhoKgZ5wy401fHjRGubk6hQ/9YkFN5JYGc95V
         FI4A==
X-Gm-Message-State: AOJu0YyEmvJ8JYUbsQYFpWxmZggZy3wHIYKxkji0rEIdXCA5NmoB5lU3
	bpaaUbJFrnj/SZC52v28y5xRm6LQhF+Ksg22M88=
X-Google-Smtp-Source: AGHT+IFjkM2Hn2NlqC+CZw5GM1t17wxDeE3vOjJiGYS5Ty4cf0O/dBjEyaPO16CM7Wiklgqi0+sqlQ==
X-Received: by 2002:a05:600c:3107:b0:408:3975:e225 with SMTP id g7-20020a05600c310700b004083975e225mr1309848wmo.40.1699439657901;
        Wed, 08 Nov 2023 02:34:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a4af:177d:488a:aeb7? ([2001:8b0:aba:5f3c:a4af:177d:488a:aeb7])
        by smtp.gmail.com with ESMTPSA id a1-20020adfe5c1000000b0032f7cfac0fesm4592229wrn.51.2023.11.08.02.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:34:17 -0800 (PST)
Message-ID: <42b2bd6a298183d94db370e38fb0548a7d5cdd7d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/sstatetests: Fix intermitttent
 errors and improve performance
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 08 Nov 2023 10:34:16 +0000
In-Reply-To: <1795558BCB8BF07B.20624@lists.openembedded.org>
References: <1795558BCB8BF07B.20624@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 10:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190312

On Tue, 2023-11-07 at 12:01 +0000, Richard Purdie via
lists.openembedded.org wrote:
> You could reproduce an error in this test with:
>=20
> bitbake core-image-minimal
> bitbake tzcode-native -c cleansstate
> oe-selftest -r sstatetests.SStatePrintdiff.test_image_minimal_vs_base_do_=
configure
>=20
> since tzcode-native isn't needed once tzdata is available and isn't rebui=
lt
> by "bitbake core-image-minimal" if it is missig. tzdata is allarch so if =
tzdata is
> built on an x86 host, a aarch64 build machine would never build tzcode-na=
tive with
> this set of calls.
>=20
> Add a --runall option to the initial bitbake invocation to force these th=
ings to be
> created if they're missing.
>=20
> This explains why some failures were occurring on the infrastructure. Wit=
h that issue
> fixed, drop the hash mode change since I believe this fixes that issue. T=
hat
> restriction was hurting performance, this should allow sstate reuse for t=
he test
> and improve the speed of it.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/sstatetests.py | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/=
selftest/cases/sstatetests.py
> index a6865a5ba7b..24c96ace08c 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -776,16 +776,15 @@ addtask tmptask2 before do_tmptask1
>                  self.assertEqual(recursecb_count,1)
> =20
>  class SStatePrintdiff(SStateBase):
> -    # FIXME: OEBasicHash setting is necessary for now as otherwise the f=
ollowing error can occur:
> -    # ERROR: Can't find a task we're supposed to have written out? (hash=
: e79d70b9c2cc72030c1ce822525510699a1eeb1ddf5986271d3217422244366a)?
> -    # The underlying issue should be investigated and addressed.
>      def run_test_printdiff_changerecipe(self, target, change_recipe, cha=
nge_bbtask, change_content, expected_sametmp_output, expected_difftmp_outpu=
t):
>          self.write_config("""
>  TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> -BB_SIGNATURE_HANDLER =3D "OEBasicHash"
>  """)
>          self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
> -        bitbake(target)
> +        # Use runall do_build to ensure any indirect sstate is created, =
e.g. tzcode-native on both x86 and
> +        # aarch64 hosts since only allarch target recipes depend upon it=
 and it may not be built otherwise.
> +        # A bitbake -c cleansstate tzcode-native would cause some of the=
se tests to error for example.
> +        bitbake("--runall build {}".format(target))
>          bitbake("-S none {}".format(target))
>          bitbake(change_bbtask)
>          self.write_recipeinc(change_recipe, change_content)
> @@ -793,7 +792,6 @@ BB_SIGNATURE_HANDLER =3D "OEBasicHash"
> =20
>          self.write_config("""
>  TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> -BB_SIGNATURE_HANDLER =3D "OEBasicHash"
>  """)
>          self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
>          result_difftmp =3D bitbake("-S printdiff {}".format(target))
> @@ -807,17 +805,15 @@ BB_SIGNATURE_HANDLER =3D "OEBasicHash"
>      def run_test_printdiff_changeconfig(self, target, change_content, ex=
pected_sametmp_output, expected_difftmp_output):
>          self.write_config("""
>  TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> -BB_SIGNATURE_HANDLER =3D "OEBasicHash"
>  """)
>          self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
> -        bitbake(target)
> +        bitbake("--runall build {}".format(target))
>          bitbake("-S none {}".format(target))
>          self.append_config(change_content)
>          result_sametmp =3D bitbake("-S printdiff {}".format(target))
> =20
>          self.write_config("""
>  TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> -BB_SIGNATURE_HANDLER =3D "OEBasicHash"
>  """)
>          self.append_config(change_content)
>          self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")

Whilst this worked in local testing and at last part of it fixes
issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2382/ste=
ps/15/logs/stdio

:(

Might need to try again leaving the sig handler bits for now as there
must be some further issue there.

Cheers,

Richard


