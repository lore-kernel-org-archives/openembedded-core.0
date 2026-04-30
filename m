Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2A4FF8873
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 18:00:18 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4909.1777572011013646465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 11:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o/LfiaIX;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: danismostlikely@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8eb5ad01402so128131485a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 11:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777572010; cv=none;
        d=google.com; s=arc-20240605;
        b=jpxwFnhIKsuLkJ4xULHfUuDMUG+kMX90CoPNtvZAqfNYbsE7ewJ+JLf3q2CvqdTcMi
         /I1TJMeOsgW0lMYGj2u1BejcXzORbYku6W3u56hVtThJjRGg/f+sYzoUq8vVg8oRbUph
         au2CnDQEVARfE85iyNE6GatOac9XK6LHuIH8eN/qBJRXsyW3pVnBULHYZE5wM46OplIP
         qqVE39GGOeobEgzSI3Ispg7X+zqLtHaqIwgthKlGPGGINF2ojfCHKE/LP+6cnT6JwJFC
         4AJdloyX6+lcK0DSBxqS0DmSC6HvnTbQL6sv4/kE+17w1Q7gPnJeVZMmH8AVn97l3TOT
         07eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUu7mQ1IZ0Q0xIYdFkBHILVbw44swnDWUbAxj0il5RQ=;
        fh=LJkDsFf8TwVmFpPcB0vbjP4lQ3z/GvvolOvjG9roKhU=;
        b=cQtH6ZyWYnUtdu8HVZlF9X4ggugg4vQ6dXIN3c8YXqw2z7f4ySSo0pXYC/s8oV6zJq
         JPsJhCIQVqfRPbLjAnENFZiLHW962pJJupH/NrHnf2cI2vQZv3t9kROfrmIlhNb7kRt+
         bpmgKxWDTfPKfgb2s8V8I7HYi6ug3FNXKV3EaX4i2jD76MZ5PQLS4JsRZ8hk+/t6zB/b
         u2j7Oe7Sw6rZPznyPXHL+THDIXj+2VsSlZCtDtBn0io9J9gwAh9hma/99iwmf8Z5cGnU
         OsYyU5qhwRE7CrWCAAHYia+BqCAeTpbO/sB/1b5gL2fkbEXMGK7/k84wgwK6ADlsJSOt
         tJWg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572010; x=1778176810; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUu7mQ1IZ0Q0xIYdFkBHILVbw44swnDWUbAxj0il5RQ=;
        b=o/LfiaIXsGP/PH6MGnEjskn4juET0QjTEqd1G8qzQAcg38yqmCFH9UbcWOanUAPhMg
         MM8l7heRQP4PTo4QzrRdSVv4qt4FipywomK6RVkQ29It1VRCy2lnnk82NAcdHlCMxT/K
         64teLkEV63r2MCH9vM3OibWL0x0dPRYRCqoppc7AZXvJERyS94q6CaCbjQMifdYlJp/u
         OjERPHGhctUSRIWdpcmqfbS9bX6u1dAvA5JzDEsYYPW5VwuQ7g1Pi0bMwdwJ2gG1p1LW
         1BuX3D6XvD9Bptv4ywOKVMsqkblqI7AiW9tbNH+c6qHu/daEXVlrcSrATLutkcgdJMzk
         EuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572010; x=1778176810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lUu7mQ1IZ0Q0xIYdFkBHILVbw44swnDWUbAxj0il5RQ=;
        b=Cgld7B2JWFjyz+zQZzqnoKHCf+/N7OKvJt8ORo9SRDaDAdmso/GBWqdWWTCm4kfAdY
         w2OhuRTaIutKpEqbNdS94yYLWLh7RGsLdGO2uGdBA4C1cQvMKoraUUFHxTDgOSILYYRc
         1xvJ04bJLIhRGrbwqPG7Axx/ELDBITqZ95KsOH6CDszglUoDJJIv0Bu4LTbfh/aG6KJi
         UHfPHq4GGw4qNuCD37H63H9XOFVVuGKvR5fO9ZRJD2Bt9a6ZQHurEFAO7CkEQ6bXbi5P
         5yhAnqvyzGcz21FlSMsg+I9VS+GbwCxiw+kv9T0by3n9Lq7gOJRnEza5lFYab+8HG54J
         IDKA==
X-Gm-Message-State: AOJu0Yxm2G9fiD+sO75dm1v3QSAgx6KwIEjTzqeKokr9IxqHEhntykQr
	cgVKZI/qVpRT4lFbI4wh7qkw+zobOdfHAtCBmVPkYbfPd0LeVFQvJtIW1vRtUIUNCzPDsPer9Pc
	WEG9+74FYeSBPlhorVb2BQw7wnG0QC1k=
X-Gm-Gg: AeBDiesu7PMZRRIExfOVDuLixo/VjOC+gE0hIkTNUWVIKvM5VMRhJiMcduITvWeNZhN
	PbywOw0vrxDiwdQ4Ssa2ZmZmUqwlw7S7jRJgyadcMZXaHVVk+TKXFrypEZdYxdM4lARaVdt6QUD
	2Nbvo/4v1hzLvQpkF8Rue0gQwzhRqKAbxcx+MG21MHdjLZ3z8GZxQtRBf91jD6BLDaXj+bAJOcO
	URaUegjIigLKaAq9qZeTkGyuq/WuHePAMIBp9LUkmHCDX3OYxcybg+aGdAG6X29NSu9uXeK6bE/
	ia46xU+FKntcRkgdKzM=
X-Received: by 2002:a05:620a:40c3:b0:8e8:ffd2:ef83 with SMTP id
 af79cd13be357-8fa862e652dmr615080985a.9.1777572008486; Thu, 30 Apr 2026
 11:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260430161702.77076-1-danismostlikely@gmail.com>
 <20260430161702.77076-2-danismostlikely@gmail.com> <CANx9H-BO+dV6g2BWxE6PMc93tRaKaTFQkj3s9Lfo3pG6yFs6nA@mail.gmail.com>
In-Reply-To: <CANx9H-BO+dV6g2BWxE6PMc93tRaKaTFQkj3s9Lfo3pG6yFs6nA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 30 Apr 2026 11:59:57 -0600
X-Gm-Features: AVHnY4IL5_tGRfl2BV6havZBzS4gKd0GlkZez7XDskLuRntXIiivuGdx37Uhu30
Message-ID: <CACS+7ZSQhPRu-QXJo01cKDwDnQi_n66ujv2Jp4FG55uN0031YQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-requests: Increase chardet upper limit
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Dan McGregor <dan.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 18:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236179

On Thu, 30 Apr 2026 at 11:51, Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Thu, Apr 30, 2026 at 9:18=E2=80=AFAM Dan McGregor via lists.openembedd=
ed.org <danismostlikely=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Dan McGregor <dan.mcgregor@vecima.com>
>>
>> OE Core includes chardet 6.0, while requests warns for any version
>> greater than or equal to 6.0. Not for any real reason, but because
>> it was a higher version than what was released when requests 2.32
>> was released.
>>
>
> For "master" we should upgrade to 2.33.1 which is the latest release and =
includes this patch:
> https://github.com/psf/requests/compare/v2.32.5...v2.33.1
>
> For 'wrynose' we should use the backport, but there is also a bump to cha=
rdet < 8 that merged:
> https://github.com/psf/requests/commit/b2a1d33f571518ca9a6148e7da787cc582=
7f897a

Oh I agree about master. This was intended for wrynose for now, since
it's either released or close to it.
And it was both < 8 and < 7 that merged, I cherry-picked the first
one. The link above is one after my cherry-pick below. I'm not opposed
to cherry-picking both though in one patch.

>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
>> ---
>>  ...01-Increase-chardet-upper-limit-to-7.patch | 26 +++++++++++++++++++
>>  .../python/python3-requests_2.32.5.bb         |  1 +
>>  2 files changed, 27 insertions(+)
>>  create mode 100644 meta/recipes-devtools/python/python3-requests/0001-I=
ncrease-chardet-upper-limit-to-7.patch
>>
>> diff --git a/meta/recipes-devtools/python/python3-requests/0001-Increase=
-chardet-upper-limit-to-7.patch b/meta/recipes-devtools/python/python3-requ=
ests/0001-Increase-chardet-upper-limit-to-7.patch
>> new file mode 100644
>> index 00000000000..2c445e42549
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-requests/0001-Increase-charde=
t-upper-limit-to-7.patch
>> @@ -0,0 +1,26 @@
>> +From 0f965846b95d096d76a1795db37fbe9acad0eb65 Mon Sep 17 00:00:00 2001
>> +From: Amin Vakil <info@aminvakil.com>
>> +Date: Sun, 22 Feb 2026 19:37:16 +0330
>> +Subject: [PATCH] Increase chardet upper limit to 7
>> +
>> +Upstream-Status: Backport [https://github.com/psf/requests/commit/4bd79=
e397304d46dfccd76f36c07f66c0295ff82]
>> +---
>> + src/requests/__init__.py | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/requests/__init__.py b/src/requests/__init__.py
>> +index 051cda13..9a80c625 100644
>> +--- a/src/requests/__init__.py
>> ++++ b/src/requests/__init__.py
>> +@@ -76,7 +76,7 @@ def check_compatibility(urllib3_version, chardet_vers=
ion, charset_normalizer_ver
>> +         major, minor, patch =3D chardet_version.split(".")[:3]
>> +         major, minor, patch =3D int(major), int(minor), int(patch)
>> +         # chardet_version >=3D 3.0.2, < 6.0.0
>> +-        assert (3, 0, 2) <=3D (major, minor, patch) < (6, 0, 0)
>> ++        assert (3, 0, 2) <=3D (major, minor, patch) < (7, 0, 0)
>> +     elif charset_normalizer_version:
>> +         major, minor, patch =3D charset_normalizer_version.split(".")[=
:3]
>> +         major, minor, patch =3D int(major), int(minor), int(patch)
>> +--
>> +2.44.4
>> +
>> diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/m=
eta/recipes-devtools/python/python3-requests_2.32.5.bb
>> index 3477a5d83e9..02d476e975f 100644
>> --- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
>> +++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
>> @@ -8,6 +8,7 @@ inherit pypi python_setuptools_build_meta
>>  SRC_URI[sha256sum] =3D "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a88=
93c3af500cec7d7cf"
>>
>>  SRC_URI +=3D "file://CVE-2026-25645.patch"
>> +SRC_URI +=3D "file://0001-Increase-chardet-upper-limit-to-7.patch"
>>  SRC_URI:append:class-nativesdk =3D " file://environment.d-python3-reque=
sts.sh"
>>
>>  do_install:append:class-nativesdk() {
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#236176): https://lists.openembedded.org/g/openembedd=
ed-core/message/236176
>> Mute This Topic: https://lists.openembedded.org/mt/119084300/924729
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [t=
icotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

