Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1961C88E56
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 00:12:51 +0000 (UTC)
Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17046.1789258371313979330
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 17:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OH1V0PY/;
 spf=pass (domain: gmail.com, ip: 74.125.231.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6beed321ad9so641048eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 17:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789258370; cv=none;
        d=google.com; s=arc-20260327;
        b=bNXz2mGSoLXtX+vYHSc8kKd2LQkrDkoaSOI0ekrQFdIWMv3i+jJoYl1kY7d7heg4sF
         cnRStjStBgz1HAPnED5bYIGtiqRY6cJsWpIyKVmBmPprtNbF9qmxbaBBlejeXasSkMK3
         Gh/UUGMUKBiQ6lv5s0EAKxFL4ePIFMJkFPX0QAKxKwMMf+KNEpwskm09ffUPQRX85Sg8
         W0Pkb8YRu2gdcj7FK5EQrr7y/RAEBG5/nREn8d0kSbAL1ONHBAR5b/7KLRr+XITSXc7y
         X5m9ow/wmtj/U7W1O4u+mhTlJKgyN337JG+uQV16IlMLtwJJAjHB2Q8NaGt68pVX6EA/
         a9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RrDkGMoRwvfj2g3E32E2x8QKUXHCAVJ2EFu50m+wFKY=;
        fh=BfsWvjZvgXaStClBpDNu35+4JHSxlBx4uH6yv+xp1+s=;
        b=kSq4C28Cd1XiKfQZg8yF/35f+3hl2Y9LetyPO6vHdk91rO2ynPsztm1wHOvRzq4P9F
         DOz/tNzNzCVSJ9ag9bJ4t9JAi8uBnGPhFMTqtu5i4y7/F6CrF9SuB0PKip5aQtiWKwPT
         QsQTkiQECuasuY6E062CEUSCiC1W22e+4SSW7+H2w5VZVe4XWdfPsSCnIqgNCBppSSVs
         NT2XQsVU0qLP4cgMhSszPk7lX/fw5XeKH6qIcDNsUciy+B7U65RswPzGikSo7ZKv5NLS
         o/VCUMFlTFMqqoATN4W2FeHGGO9artoHg8RljDesXRWagc57WagZzeFj7wn29ElbzzLH
         b55g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789258370; x=1789863170; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RrDkGMoRwvfj2g3E32E2x8QKUXHCAVJ2EFu50m+wFKY=;
        b=OH1V0PY/QI22p716ClykMpb8ZwmDE849TwV1BW66H8sZu5X/Ro6oHgZWA3IH/dghnU
         uxhyMuREoZO0tJoA+STpGI9zucFQqoAs24O2oNtBHdjTQUTW2SjBTre0DqfKss6+TzzN
         UEkjirn8Sp6r4nDcxFBCCl74jgwci9BbmHpiaKhermPWyOv6JmFmNJpKpnBEKN0d6lGH
         5bxE8QOiAajFZztoaurFPPMLfewr33cfqwLeF9ljIc2oSAaBl+pAOoTR5ICFj+J9x0TJ
         dtDln1kZ9m3khqSloIzh0TeLBycQpPNQWrN0sAnJUEoIZWu9TQ8qRHOy99IJc+XaWJfd
         RIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789258370; x=1789863170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrDkGMoRwvfj2g3E32E2x8QKUXHCAVJ2EFu50m+wFKY=;
        b=XGjwFS9AuVLrh0ypugJcwuRQTsmEuL8TRedVEsksMW7/j1tZMaC+AM8XeJf7UfeIr8
         kgMkTVd1bm0dDXxQByGxmstI5A8bmmLCW40o53ug58fa6CkQuBTOuOK0gGwsQsHJDu3o
         iirsDoMT4ftPlOvrKq4E8qeR91XcjZNbDQFxcARfjYzOumTWQoLckGI/+kCWU8Wh8+kY
         Uv8hkedArgMG/UDQslyACaILPT2phZ1SVeQQDKRqeI0yr7i/tCAr0InKnHFGCiBuTDSI
         bL+x22a1uVs4YWvMVM1a8eL2MxhjBZoqDjZi9Xdw/zGSF7VDN+7CCKrUvTvc7OLrb3CX
         yr4A==
X-Gm-Message-State: AFuF++naufrL0QMmu4y3qFagwyns5diPp39e4lNB5myC/KluNga+k+JR
	K/PkWyLw7mAnuIepC11GfsAOJLzqBZhDN1AP4iIHN/9Cs4C7YM4AIVvGcsxdm45uNbs0KNUlwtf
	OOT3ddXaDisD1NFc43z7OUiXdyUZ4qY7IKtJL
X-Gm-Gg: AYBFou2RRJX92nPp0VieCm6AlV6PcC2RL9DF/Ndxil2dgF+1HuLBYnq1Hpk3dfb9mX+
	mkRtIDS8IlGipo8mM1dOixbT2IAlRswqMcZ63CBolQubg8yPRLKqrCKKPOl3ULP6BZ/gUtPjuxO
	JutRcRnFZi52c7ooMk8MX+g645M6vY/4GZNdSCRQNY1wZzHf6osD+zGjb/c41qb+uAjv0izXyjZ
	/z0lqRhFSDbADR0Ow3gTglhWzoThsCdu4BaNKQCwf2fiKgTbMm0JJgGKBIjqzrGBpk+l1RjWeP4
	0+ml375oeEuZ6PFXY5EODBpOZ7N2s6RaNCxZ2MuJPzCHGaByjVG4McPuTRBtru28id1/NICsUXy
	mSmrG
X-Received: by 2002:a05:6820:4b8b:b0:6c3:42eb:ec22 with SMTP id
 006d021491bc7-6c342ec1f4cmr1055048eaf.23.1789258370354; Sat, 12 Sep 2026
 17:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1789163914.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 13 Sep 2026 12:12:39 +1200
X-Gm-Features: AcwNN1WIM6UXGpM3XqFckpRDpxIZF8gL7ir9KGHWz34b3RbGPegJ1-BCjYkc5wQ
Message-ID: <CADySD0GdXN1DPdYv0oy-rZ0r-EB7RoU8waJOAD4jrG-t1tEgmg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 00/13] Patch review
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 00:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245707

Hello Yoann,

Any reason why the following were not included?

https://lists.openembedded.org/g/openembedded-core/message/245310
https://lists.openembedded.org/g/openembedded-core/message/245311

cheers
Ankur

On Sat, Sep 12, 2026 at 10:15=E2=80=AFAM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> Please review this set of changes for scarthgap and have comments back by
> end of day Tuesday, September 15.
>
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4718
> * oe-selftest-fedora fails with 16415 =E2=80=93 AB-INT: github infrastruc=
ture issues
>   I still need to backport fixes from master to wrynose, and then,
>   scarthgap.
> * qemuarm64-ptest failed with 16267 =E2=80=93 [scarthgap] AB-INT PTEST: p=
ython3 failure (test_wrong_cert_tls13)
>   retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61=
/builds/4516
> Note: this build was not rebased on the latest build-appliance update.
>
>
> The following changes since commit bb166ac536daa43602ce8962cd3eb137783b8d=
c9:
>
>   build-appliance-image: Update to scarthgap head revision (2026-09-11 14=
:32:15 +0100)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/scarthgap=
-nut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
scarthgap-nut
>
> for you to fetch changes up to e85367ebf673225c69694ee63679ea7620c4b420:
>
>   u-boot, u-boot-tools: Fix CVE-2026-46728 (2026-09-11 17:32:37 +0200)
>
> ----------------------------------------------------------------
>
> Daniel Turull (1):
>   libarchive: mark CVE-2026-14164 as fixed-version
>
> Darsh Kelaiya (1):
>   python3-lxml: fix CVE-2026-41066
>
> Deepak Rathore (2):
>   binutils: fix CVE-2026-3441 and CVE-2026-3442
>   binutils: fix CVE-2026-4647
>
> Devansh Patel (1):
>   u-boot: share CVE_PRODUCT with u-boot-tools
>
> Gyorgy Sarvari (1):
>   python3-py: set CVE_PRODUCT
>
> Hetvi Thakar (4):
>   python3-pip: Fix CVE-2026-8643
>   go: Fix CVE-2026-33814
>   go: Fix CVE-2026-39823
>   u-boot, u-boot-tools: Fix CVE-2026-46728
>
> Peter Marko (1):
>   openssl: upgrade 3.5.7 -> 3.5.8
>
> Vijay Anusuri (1):
>   p11-kit: Fix CVE-2026-18938
>
> Yoann Congal (1):
>   linux-yocto/6.6: update CVE exclusions (6.6.151)
>
>  .../u-boot/files/CVE-2026-46728.patch         |  379 ++
>  meta/recipes-bsp/u-boot/u-boot-common.inc     |    2 +
>  .../u-boot/u-boot-tools_2024.01.bb            |    2 +
>  meta/recipes-bsp/u-boot/u-boot.inc            |    2 -
>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |    1 +
>  .../{openssl_3.5.7.bb =3D> openssl_3.5.8.bb}    |    2 +-
>  .../binutils/binutils-2.42.inc                |    2 +
>  .../CVE-2026-3441_CVE-2026-3442.patch         |   51 +
>  .../binutils/binutils/CVE-2026-4647.patch     |  228 +
>  meta/recipes-devtools/go/go-1.22.12.inc       |    2 +
>  .../go/go/CVE-2026-33814.patch                |   44 +
>  .../go/go/CVE-2026-39823.patch                |  100 +
>  .../python/python3-lxml/CVE-2026-41066.patch  |  262 +
>  .../python/python3-lxml_5.0.2.bb              |    4 +-
>  .../CVE-2026-8643-regression_p1.patch         |   34 +
>  .../CVE-2026-8643-regression_p2.patch         |   69 +
>  .../python/python3-pip/CVE-2026-8643.patch    |   79 +
>  .../python/python3-pip_24.0.bb                |    3 +
>  .../python/python3-py_1.11.0.bb               |    2 +
>  .../libarchive/libarchive_3.7.9.bb            |    5 +
>  .../linux/cve-exclusion_6.6.inc               | 4540 ++++++++++++++++-
>  .../p11-kit/files/CVE-2026-18938.patch        |   52 +
>  .../recipes-support/p11-kit/p11-kit_0.25.3.bb |    1 +
>  23 files changed, 5787 insertions(+), 79 deletions(-)
>  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb =3D> openssl_=
3.5.8.bb} (99%)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441=
_CVE-2026-3442.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-4647=
.patch
>  create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33814.patch
>  create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39823.patch
>  create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-41=
066.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-864=
3-regression_p1.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-864=
3-regression_p2.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-864=
3.patch
>  create mode 100644 meta/recipes-support/p11-kit/files/CVE-2026-18938.pat=
ch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245670): https://lists.openembedded.org/g/openembedde=
d-core/message/245670
> Mute This Topic: https://lists.openembedded.org/mt/121207001/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

