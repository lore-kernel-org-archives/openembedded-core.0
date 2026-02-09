Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D70E7E0C4
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 10:45:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45097.1770633936956622065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 02:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=A1qjvU9N;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43621bf67ceso1691498f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 02:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770633935; x=1771238735; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxkheqsbUzgYPD0IPAbnkIWST8S8ijyhByxUxkJ9UvI=;
        b=A1qjvU9NfBWtx8EHSn3k8TTtXflDYKfwGzRYIY3BT8TJD/PlEwSz4XsbdOKUsQHzpK
         ZmQ9ZJKH+Qtwzy3GrZnTl5otb7xXEq7Qd64RpFMmu5CXB5LutzrsbRGzVKoItxROu8XH
         2ADkJriMRvlmLq9AUnPHfgBUvq8TKUsE+IG80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633935; x=1771238735;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XxkheqsbUzgYPD0IPAbnkIWST8S8ijyhByxUxkJ9UvI=;
        b=N092nc7VE8CoDLUe3KVOkEA9gXqYfYrBNjKxgxZgiwQBxThcE/ABXmZ9wYrTQiiIgU
         lsT5fuv5h2TRcWpjakS32VmWF3bUdWCVugIzoRqwUc1pgZj3lP1yz6TqxCoDjCjT02jV
         sEydU+dEhGMLWHPS3tc50RLB0MZJYROE3UKw8nrhbKGJYuVmtuQTp/q8ku3aF6regCVA
         feJTfeSI01CLEAlIv/u1t9/1Eo1TPO4Rnl+PlCdhceWO5qK9NAGU9YBAay1zBQLSj1Oz
         4s0CuKM3WLP5f27Tp2LQ8cnP3v8WjuOZhKTVW2neQZVLsc7LPs1UAFhJ0x9cYEoSUYmQ
         qWdA==
X-Forwarded-Encrypted: i=1; AJvYcCXdQTd+c89gFK9mhCz7bYmw+oLVo2c1wz1WARkfkrZhzfdNV93mhhvY9FeJvYu8D5+5FDLPMzxllePa7NM5kviI3Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuXwCGevWUZIscM6ZiyCBzxyMLqL287ZF+FgNDAmvv3pbiVC3o
	uQS3Gw1vd/5TxXESoWJbb3+Odqbw1juY5EFES0vKRcV38WGXc2nvIjDgtE9zBaK891k=
X-Gm-Gg: AZuq6aJ7MjvUCfQ+1tef7zwId18UOBidDAhUegYIqb5g8cAAmtX1ujjSVd9I+IgHQ5X
	NzsH0CJqvQ49cahBz0akSKBBZuklHECqBuvBAiL0Tbv36/ne12mBW6w7uaCrgGUUcgT41LBNEen
	T20WriBDdtn2DOx3iXccwIfWzaJTLd+louluFpA29/wup1OrB+uvtucKdxFz2ryhGJecPgne9iT
	U1EKalVUe7n1go5kN3m6jh0PSi7WvOs3TrI/l2vDMkGEwxcHOEKBSU1rri876/8WSpsO0Pue5Ua
	v6o1DA+Nawpy1Rslhv5Q0jJXObGEnR88qaiykAK6eqsb6ysxoR8kb2ofL6R5QyzFIBUNH8qB9/G
	rH4Tn/1S985HMjXYqlj7SkWeBapmCGZKonC1+Y/mkHL6EXRw9PJ66409SV438Hso4wQpnsUN/LX
	9yhGTueJojQEtMQzaQ9EWhoNkFHeP7axxWyp8RwN3zqo/+Z8k5SScyav5fKfBjr7DG5Bq1OLPRP
	dQ=
X-Received: by 2002:adf:f452:0:b0:436:42fb:154c with SMTP id ffacd0b85a97d-43642fb16eamr7196801f8f.61.1770633935079;
        Mon, 09 Feb 2026 02:45:35 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b25d5sm26711501f8f.2.2026.02.09.02.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 02:45:34 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 11:45:34 +0100
Message-Id: <DGADCG1T404K.22590D22LM044@smile.fr>
Subject: Re: [OE-core][whinlatter 00/22] Pull request (cover letter only)
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Paul Barker" <paul@pbarker.dev>, "Yogesh Tyagi"
 <yogesh.tyagi@intel.com>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1770630733.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1770630733.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 10:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230779

On Mon Feb 9, 2026 at 10:58 AM CET, Yoann Congal wrote:
> Those are the patches from the last patch review:
> https://lore.kernel.org/openembedded-core/cover.1770109549.git.yoann.cong=
al@smile.fr/T/#t
> (with added cherry-pick info, where appropriate)
>
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3181
As Paul wrote on IRC, I forgot to mention that the meta-intel build
failed. But, IMHO it should not prevent the merge:
* meta-intel build also fail on master currently: See the latest nightly:
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/2992
  =3D> This new failure is not related to this series
* I notified the maintainer (Yogesh Tyagi, CC'd) last week, he is
  working on reproducing & fixing it.

> The following changes since commit fa31089d48cac2aa11279e932a77f4dbdc02c0=
2d:
>
>   libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-26 08:44:38 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/whinlatte=
r-next
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
whinlatter-next
>
> for you to fetch changes up to 7ffbe7bb6e262a410afac64c5211df0d52c202c7:
>
>   inetutils: patch CVE-2026-24061 (2026-02-09 01:51:46 +0100)
>
> ----------------------------------------------------------------
>
> Hugo SIMELIERE (1):
>   libtasn1: Fix CVE-2025-13151
>
> Jiaying Song (1):
>   grub: fix CVE-2025-54770 CVE-2025-61661 CVE-2025-61662 CVE-2025-61663
>     CVE-2025-61664
>
> Ken Kurematsu (1):
>   libtheora: set CVE_PRODUCT
>
> Khai Dang (1):
>   docbook-xml-dtd4: fix the fetching failure
>
> Mark Hatle (1):
>   dpkg: Fix ADMINDIR
>
> Mathieu Dubois-Briand (2):
>   oeqa/gitarchive: Fix git push URL parameter
>   oeqa/gitarchive: Push tag before copying log files
>
> Peter Marko (13):
>   go: upgrade 1.25.5 -> 1.25.6
>   zlib: ignore CVE-2026-22184
>   python3-urllib3: patch CVE-2026-21441
>   glibc: stable 2.42 branch updates
>   dropbear: patch CVE-2025-14282
>   libpng: upgrade 1.6.53 -> 1.6.54
>   glib-2.0: patch CVE-2026-0988
>   libxml2: patch CVE-2026-0989
>   libxml2: patch CVE-2026-0990
>   libxml2: patch CVE-2026-0992
>   libxml2: add follow-up patch for CVE-2026-0992
>   expat: upgrade 2.7.3 -> 2.7.4
>   inetutils: patch CVE-2026-24061
>
> Richard Purdie (2):
>   scripts/oe-git-archive: Ensure new push parameter is specified
>   pseudo: Update to 1.9.3 release
>
>  meta/lib/oe/package_manager/deb/__init__.py   |   4 +
>  .../oeqa/selftest/cases/gitarchivetests.py    |   4 +-
>  meta/lib/oeqa/utils/gitarchive.py             |   8 +-
>  .../grub/files/CVE-2025-54770.patch           |  41 +++
>  .../grub/files/CVE-2025-61661.patch           |  40 +++
>  .../grub/files/CVE-2025-61662.patch           |  72 ++++
>  .../grub/files/CVE-2025-61663_61664.patch     |  64 ++++
>  meta/recipes-bsp/grub/grub2.inc               |   4 +
>  .../inetutils/CVE-2026-24061-01.patch         |  38 ++
>  .../inetutils/CVE-2026-24061-02.patch         |  82 +++++
>  .../inetutils/inetutils_2.6.bb                |   2 +
>  .../dropbear/dropbear/CVE-2025-14282-01.patch | 280 +++++++++++++++
>  .../dropbear/dropbear/CVE-2025-14282-02.patch |  97 +++++
>  .../dropbear/dropbear/CVE-2025-14282-03.patch | 282 +++++++++++++++
>  .../dropbear/dropbear/CVE-2025-14282-04.patch |  72 ++++
>  .../dropbear/dropbear/CVE-2025-14282-05.patch |  46 +++
>  .../recipes-core/dropbear/dropbear_2025.88.bb |   5 +
>  .../expat/{expat_2.7.3.bb =3D> expat_2.7.4.bb}  |   2 +-
>  .../glib-2.0/files/CVE-2026-0988.patch        |  58 +++
>  meta/recipes-core/glib-2.0/glib.inc           |   1 +
>  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>  meta/recipes-core/glibc/glibc_2.42.bb         |   2 +-
>  .../libxml/libxml2/CVE-2026-0989.patch        | 309 ++++++++++++++++
>  .../libxml/libxml2/CVE-2026-0990.patch        |  76 ++++
>  .../libxml/libxml2/CVE-2026-0992-01.patch     |  49 +++
>  .../libxml/libxml2/CVE-2026-0992-02.patch     | 336 ++++++++++++++++++
>  .../libxml/libxml2/CVE-2026-0992-03.patch     |  33 ++
>  meta/recipes-core/libxml/libxml2_2.14.6.bb    |   5 +
>  meta/recipes-core/zlib/zlib_1.3.1.bb          |   2 +
>  .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  10 +-
>  ...-dirs.c-set_rootfs-was-not-checking-.patch |  46 +++
>  meta/recipes-devtools/dpkg/dpkg_1.22.21.bb    |   1 +
>  .../go/{go-1.25.5.inc =3D> go-1.25.6.inc}       |   2 +-
>  ...e_1.25.5.bb =3D> go-binary-native_1.25.6.bb} |   6 +-
>  ..._1.25.5.bb =3D> go-cross-canadian_1.25.6.bb} |   0
>  ...{go-cross_1.25.5.bb =3D> go-cross_1.25.6.bb} |   0
>  ...osssdk_1.25.5.bb =3D> go-crosssdk_1.25.6.bb} |   0
>  ...runtime_1.25.5.bb =3D> go-runtime_1.25.6.bb} |   0
>  ...ent-based-hash-generation-less-pedan.patch |   8 +-
>  ...ng-cgo-on-386-call-C-sigaction-funct.patch |   4 +-
>  ...d-go-make-GOROOT-precious-by-default.patch |   2 +-
>  .../go/{go_1.25.5.bb =3D> go_1.25.6.bb}         |   0
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |   4 +-
>  .../python3-urllib3/CVE-2026-21441.patch      | 111 ++++++
>  .../python/python3-urllib3_2.5.0.bb           |   1 +
>  .../{libpng_1.6.53.bb =3D> libpng_1.6.54.bb}    |   4 +-
>  .../libtheora/libtheora_1.2.0.bb              |   2 +
>  .../gnutls/libtasn1/CVE-2025-13151.patch      |  30 ++
>  .../recipes-support/gnutls/libtasn1_4.20.0.bb |   1 +
>  scripts/lib/resulttool/store.py               |   9 +-
>  scripts/oe-git-archive                        |   2 +-
>  51 files changed, 2228 insertions(+), 31 deletions(-)
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patc=
h
>  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-202=
6-24061-01.patch
>  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-202=
6-24061-02.patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-01=
.patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-02=
.patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-03=
.patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-04=
.patch
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-05=
.patch
>  rename meta/recipes-core/expat/{expat_2.7.3.bb =3D> expat_2.7.4.bb} (92%=
)
>  create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.pat=
ch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.pat=
ch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.pat=
ch
>  create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options=
-dirs.c-set_rootfs-was-not-checking-.patch
>  rename meta/recipes-devtools/go/{go-1.25.5.inc =3D> go-1.25.6.inc} (91%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.25.5.bb =3D> go-bina=
ry-native_1.25.6.bb} (79%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.25.5.bb =3D> go-cro=
ss-canadian_1.25.6.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.25.5.bb =3D> go-cross_1.25.6=
.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.25.5.bb =3D> go-crosssdk_=
1.25.6.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.25.5.bb =3D> go-runtime_1.=
25.6.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.25.5.bb =3D> go_1.25.6.bb} (100%)
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026=
-21441.patch
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.53.bb =3D> libpng_1.6.=
54.bb} (94%)
>  create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.p=
atch


--=20
Yoann Congal
Smile ECS


