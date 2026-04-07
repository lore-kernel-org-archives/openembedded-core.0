Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E83E105D986
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 21:10:26 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92145.1775596217982643240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 14:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3AKrt8u6;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b949bf4easo155071f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775596216; x=1776201016; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stCTf2rLkrcTBLw5w+VZOxAAcgGPcn8GlCytGsc/ufo=;
        b=3AKrt8u6hLsTfw0ceZ3wCzfUBCrK6kjjvWByYQPYWg16difMldGtHovZDKwJABqtbk
         vRr90U44Eqh/z5HRt8f5dXvQ1fAL3CJ38Aj5u7Vc/sW2dIDrUx18Siy0SlbUsAu3xTF3
         B1IUNVydVv3lRd0fxpYMQr0synok5LjfSV3iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775596216; x=1776201016;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=stCTf2rLkrcTBLw5w+VZOxAAcgGPcn8GlCytGsc/ufo=;
        b=n6J1xfGNw7rF+Du/STrsssc4zsFvJQHRuL/9MBxFJzedabij/l2M/2iU7PVmmv4FSi
         pBUCjoxVtmxBntYj0KbIBYcXnOd88h/tQc+ZsoSCNdV4JXyeOpv9549T2uoVwmo9dRJ0
         AGhTM3SKM9K77J2BoGSZ5bQWyjrCCQ3eSQ4GRf0y0cRv3mwU0UuYFfYLydSUrmr6gBhu
         o/t/UfQSbDh+yVz2WCEIP1FHnBjjbfQhSKkQje4kUnl7y9c0wUIHlIYdYcby4KYUwLHp
         sVPcT1OwJQ26BHFh/mZQI7IrV3MWp3B4EGKOXJZrjWKdP6gjdV6QH1EZ3RiUlfMq4Zmi
         DESA==
X-Gm-Message-State: AOJu0YydnlrT7Sp4RTm8jaWKTVCVPAV7w9Zi5tSWzSRugU9nCpVe1Lwe
	+/JlK5yBiR2736g4R9iVWQuzn6Pc8ybYM6JpiGUkxfWBoXGBOHsxd+7y1HzP8iXBBi4=
X-Gm-Gg: AeBDiesKASztEX5ria60pi3BAHeotXuLnBdRx+ZFSl15k+4foB+sGlnXXl70Vszo8rp
	BIsuTGOVbXrnFKuv1o8p40Ohux/mF3a8YlHapFV7E0IqiA1lTkPqbrTdOu1da0Ncmq+2bAQi6FK
	psYGwQYUnJJkbdwqLz92TVxP99MOlBLgAze1FRQ4IF/gMqg74UmPHJMl4WDKFh+v1+Qruh929OD
	7TaWKiWqvUXuUWiTmWskT7dxNQ5GLAyMt8kEP+SBd4x487OF040UZGrdJBKeFNmROeev/k20EkR
	hn+do5VuGWetcoSVQHixdnvWj0LUleOXq+/uET16Y+nPYqSSh4BpVMGmI/tWFYyFZ5f/TIEGw/r
	/8qzPrbNSRy/yHaDQsPxElWwHoKCRHYSkNqTNGEVWP+1ZMFz4kVl0mxVar0cutgPi2TkEL/5yf8
	cU65MFaVdYD5cO/2WRFQa0zTCGWgH4sClcF3xUSGLkt1goJR1y/5mX5mlIfi9D5nbFOHeY8FZIl
	K0AJMO0FqZZ4jca
X-Received: by 2002:a05:6000:2c0c:b0:43b:9f7e:c912 with SMTP id ffacd0b85a97d-43d28f8dc71mr27467935f8f.1.1775596216184;
        Tue, 07 Apr 2026 14:10:16 -0700 (PDT)
Received: from localhost (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d214f2b63sm47433773f8f.28.2026.04.07.14.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 14:10:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 23:10:15 +0200
Message-Id: <DHN8BSK6TPNF.3URJSKNIEGULG@smile.fr>
Subject: Re: [OE-core][kirkstone v3 00/19] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Patches and discussions about the oe-core layer"
 <openembedded-core@lists.openembedded.org>
To: "Vijay Anusuri" <vanusuri@mvista.com>
X-Mailer: aerc 0.20.0
References: <cover.1775578386.git.yoann.congal@smile.fr>
 <CANQUz18ce-pbkn8-N6AorS8a5w5B8FJAtt9_dFXKnCUMSncvMQ@mail.gmail.com>
In-Reply-To: <CANQUz18ce-pbkn8-N6AorS8a5w5B8FJAtt9_dFXKnCUMSncvMQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 21:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234787

On Tue Apr 7, 2026 at 8:14 PM CEST, Vijay Anusuri wrote:
> Hi Yoann,
>
>
>
> On Tue, 7 Apr, 2026, 9:46=E2=80=AFpm Yoann Congal via lists.openembedded.=
org,
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>
>> Please review this set of changes for kirkstone and have comments back b=
y
>> end of day Wednesday, April 8.
>>
>> Please note:
>> - This will be the last review cycle for kirkstone.
>> - If you expect a patch to get merged and it is not in this series ping
>>   me as soon as possible.
>> - Some patches look OK to me and are included here but will only be
>>   merged if some patches are sent/fixed in more recent branches:
>>   - Pending an equivalent patch sent for scarthgap:
>>     - ncurses: fix for CVE-2025-69720
>>   - Pending an equivalent patch sent for whinlatter:
>>     - libarchive: Fix CVE-2026-4111
>>
> --> Libarchive 3.8.6 upgrade patch submitted for whinlatter. This upgrade
> fixes CVE-2026-4111 .

That's right:
[OE-core][whinlatter][patch] libarchive: upgrade 3.8.5 -> 3.8.6 - Vijay Anu=
suri
https://lore.kernel.org/openembedded-core/20260406065532.1259890-1-vanusuri=
@mvista.com/
(I did not make the connection)

Thanks!

>
> Passed a-full on autobuilder:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3612
>>
>> v2->v3:
>> - Added ncurses:=C2=B7fix=C2=B7for=C2=B7CVE-2025-69720 to the series
>>
>> v1->v2:
>> - replaced "python3: Fix CVE-2025-15282" with
>>   "python3: upgrade 3.10.19 -> 3.10.20"
>> - Those patches are not held anymore since equivalent patches have been
>>   sent to more recent branches:
>>     - curl: patch CVE-2026-3784
>>     - curl: patch CVE-2026-3783
>>     - curl: patch CVE-2026-1965
>>     - vim: Fix CVE-2026-33412
>>
>> The following changes since commit
>> c4194cadb1180da37514c55cd97827eb0269c8e2:
>>
>>   build-appliance-image: Update to kirkstone head revision (2026-03-20
>> 09:58:53 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.openembedded.org/openembedded-core-contrib
>> stable/kirkstone-nut
>>
>> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/k=
irkstone-nut
>>
>> for you to fetch changes up to 94df79c304f692b0108155e04905180cdf92b2cd:
>>
>>   scripts/install-buildtools: Update to 4.0.34 (2026-04-07 09:14:47 +020=
0)
>>
>> ----------------------------------------------------------------
>>
>> Bruce Ashfield (2):
>>   linux-yocto/5.15: update to v5.15.200
>>   linux-yocto/5.15: update to v5.15.201
>>
>> Fabien Thomas (1):
>>   README.OE-Core: update contributor links and add kirkstone prefix
>>
>> Hitendra Prajapati (2):
>>   vim: Fix CVE-2026-33412
>>   ncurses: fix for CVE-2025-69720
>>
>> Jinfeng Wang (1):
>>   tzdata/tzcode-native: upgrade 2025c -> 2026a
>>
>> Paul Barker (1):
>>   create-pull-request: Keep commit hash to be pulled in cover email
>>
>> Peter Marko (1):
>>   libtheora: mark CVE-2024-56431 as not vulnerable yet
>>
>> Vijay Anusuri (10):
>>   tzdata,tzcode-native: Upgrade 2025b -> 2025c
>>   python3: upgrade 3.10.19 -> 3.10.20
>>   python3-pyopenssl: Fix CVE-2026-27448
>>   python3-pyopenssl: Fix CVE-2026-27459
>>   libarchive: Fix CVE-2026-4111
>>   sqlite3: Fix CVE-2025-70873
>>   curl: patch CVE-2025-14524
>>   curl: patch CVE-2026-1965
>>   curl: patch CVE-2026-3783
>>   curl: patch CVE-2026-3784
>>
>> Yoann Congal (1):
>>   scripts/install-buildtools: Update to 4.0.34
>>
>>  README.OE-Core.md                             |  10 +-
>>  .../ncurses/files/CVE-2025-69720.patch        |  42 ++
>>  .../ncurses/ncurses_6.3+20220423.bb           |   1 +
>>  .../python3-pyopenssl/CVE-2026-27448.patch    | 125 ++++++
>>  .../python3-pyopenssl/CVE-2026-27459.patch    | 106 +++++
>>  .../python/python3-pyopenssl_22.0.0.bb        |   5 +
>>  .../python/python3/CVE-2025-12084.patch       | 171 --------
>>  .../python/python3/CVE-2025-13836.patch       | 163 --------
>>  .../python/python3/CVE-2025-13837.patch       | 162 --------
>>  .../python/python3/CVE-2025-6075.patch        | 364 ------------------
>>  ...{python3_3.10.19.bb =3D> python3_3.10.20.bb} |   6 +-
>>  .../libarchive/CVE-2026-4111-1.patch          |  32 ++
>>  .../libarchive/CVE-2026-4111-2.patch          | 308 +++++++++++++++
>>  .../libarchive/libarchive_3.6.2.bb            |   2 +
>>  meta/recipes-extended/timezone/timezone.inc   |   6 +-
>>  .../linux/linux-yocto-rt_5.15.bb              |   6 +-
>>  .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
>>  meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
>>  .../libtheora/libtheora_1.1.1.bb              |   3 +
>>  .../curl/curl/CVE-2025-14524.patch            |  42 ++
>>  .../curl/curl/CVE-2026-1965-1.patch           |  98 +++++
>>  .../curl/curl/CVE-2026-1965-2.patch           |  29 ++
>>  .../curl/curl/CVE-2026-3783-pre1.patch        |  66 ++++
>>  .../curl/curl/CVE-2026-3783.patch             | 157 ++++++++
>>  .../curl/curl/CVE-2026-3784.patch             |  73 ++++
>>  meta/recipes-support/curl/curl_7.82.0.bb      |   6 +
>>  .../sqlite/files/CVE-2025-70873.patch         |  33 ++
>>  meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
>>  .../vim/files/CVE-2026-33412.patch            |  61 +++
>>  meta/recipes-support/vim/vim.inc              |   1 +
>>  scripts/create-pull-request                   |   2 +-
>>  scripts/install-buildtools                    |   4 +-
>>  32 files changed, 1224 insertions(+), 893 deletions(-)
>>  create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.patch
>>  create mode 100644
>> meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
>>  create mode 100644
>> meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
>>  delete mode 100644
>> meta/recipes-devtools/python/python3/CVE-2025-12084.patch
>>  delete mode 100644
>> meta/recipes-devtools/python/python3/CVE-2025-13836.patch
>>  delete mode 100644
>> meta/recipes-devtools/python/python3/CVE-2025-13837.patch
>>  delete mode 100644
>> meta/recipes-devtools/python/python3/CVE-2025-6075.patch
>>  rename meta/recipes-devtools/python/{python3_3.10.19.bb =3D>
>> python3_3.10.20.bb} (98%)
>>  create mode 100644
>> meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
>>  create mode 100644
>> meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783-pre1.pa=
tch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch
>>  create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.pat=
ch
>>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#234753):
>> https://lists.openembedded.org/g/openembedded-core/message/234753
>> Mute This Topic: https://lists.openembedded.org/mt/118710539/7301997
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> vanusuri@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>


--=20
Yoann Congal
Smile ECS


