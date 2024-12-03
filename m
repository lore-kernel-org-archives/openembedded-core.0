Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEB1E64AAB
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:52:44 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.19863.1733233962574630987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GgLyZnu1;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.179, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e399936829eso2855046276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233962; x=1733838762; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO8err6L+FJDMRsqQhxD4T+2LZzfYKMVD+HRMAWKFPY=;
        b=GgLyZnu1pqj2y1ElAzSFKupzV5Q+/7xsDS8DO/eUb1sm8cARnuK18Qa0OKE2zwF3uq
         vHpIuC+Bi9SXNx2VBzjZkFEIC4k5zWQFAQsvct6eLs+qXpGwi+nMHFMseuCKW+9WBASO
         9lNd9Gn9u7ZytHRAvuhRVpXumeNMtj0EPCJgSN8B1YH8oI0RLXwCvYV3GNHjKyQCWQAC
         Fom/5P0QOFJ8qpF6JrbZEAdGzTDdKiBDqHrR/wurGu49ARE5zfgNbS8lQKY6np7Sy84j
         +3jG/IOqzJuIQaCDQwb4UqZWdqbgJ8aH1Oad55HlAI2flbC9D7z59UOqkrPLLp1/EMz6
         v4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233962; x=1733838762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO8err6L+FJDMRsqQhxD4T+2LZzfYKMVD+HRMAWKFPY=;
        b=fJmnK+GItKhoeSuac9rdOSMgdif66WpsMG+rSeAId/hi+c1ND28cO2Lc+X0+1mftVb
         03x5JSBXyQvbn++LyyhpNjyrWsErp5J3rPqaPMKN2pkE36g1wdFz9LXwOR3YxvKbxjmk
         faHELRG9yhQJ0lLYteIno5zCQ6Vg/R9HGoq4kFm9RLN95VG7JwOdLdJwQ3C9tXhD1TGZ
         l3993x66S0HbtF4DAr+IhHAZ49ArOvO8kWXIQBa9gGUUwbTMZpZQqHkaooD+waBioeaq
         I8M7mJZLUI8bvKhG2d7Ql8ufTL4uBCCTl64N0RUJKQn4VnVKPTGRVGSPewKUWhhtdZHU
         tyRw==
X-Gm-Message-State: AOJu0Yxl6z774Cc8jnkeIt6fKGdYt3wXWzZzKDFI+wNcjBZgG8W+QuGw
	yK5io9FMQcCLWVO5157nCSVNJAW//ShNBGMUSMouL4aoC/F/IcbCfwTEBN88A21vrZ683sJ3q7Q
	LmPMYrupMVdAp2wRTyAWE4zeDsy76X+71njR8xbxZKuZquRWMHHQ=
X-Gm-Gg: ASbGncvYR1mrPhwiVUzdH4zF4tMl7EO7Z/m/pbQaeosAzz4C24ttJDrGx0T692HLVRN
	7BcU1/8pk67iez2uVuRX9zr6JKb3LAh4=
X-Google-Smtp-Source: AGHT+IHsEklTCA7lJf5rNUiTqtj85q9Cz2FBGIEbcYimruZFy0rnikPt8UNrkBRHHIR9DxRADlunfmZAe41fX2pbUgk=
X-Received: by 2002:a05:6902:f87:b0:e39:7c9d:9f8a with SMTP id
 3f1490d57ef6-e39d39e6588mr2529502276.11.1733233961768; Tue, 03 Dec 2024
 05:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20241202233844.2808663-1-peter.marko@siemens.com>
In-Reply-To: <20241202233844.2808663-1-peter.marko@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 3 Dec 2024 05:52:31 -0800
Message-ID: <CAOSpxdZ4Nd0a+7mEcs2cgvtNNJpC4ypOM1TNsYAKp0qDnCLY+A@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] qemu: patch CVE-2024-6505
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208209

This is fixed in the qemu minor version upgrade currently out for review:

https://lists.openembedded.org/g/openembedded-core/message/208200

Steve

On Mon, Dec 2, 2024 at 3:39=E2=80=AFPM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Backport patch [3] as linked from [1] via [2].
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-6505
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D2295760
> [3] https://gitlab.com/qemu-project/qemu/-/commit/f1595ceb
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/CVE-2024-6505.patch             | 40 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index e9f63b9eaf..f07869cc4d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -52,6 +52,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>             file://0001-target-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32=
.patch \
>             file://0002-target-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64=
.patch \
>             file://0003-target-riscv-kvm-change-timer-regs-size-to-u64.pa=
tch \
> +           file://CVE-2024-6505.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2024-6505.patch
> new file mode 100644
> index 0000000000..fbb7ad31b2
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch
> @@ -0,0 +1,40 @@
> +From f1595ceb9aad36a6c1da95bcb77ab9509b38822d Mon Sep 17 00:00:00 2001
> +From: Akihiko Odaki <akihiko.odaki@daynix.com>
> +Date: Mon, 1 Jul 2024 20:58:04 +0900
> +Subject: [PATCH] virtio-net: Ensure queue index fits with RSS
> +
> +Ensure the queue index points to a valid queue when software RSS
> +enabled. The new calculation matches with the behavior of Linux's TAP
> +device with the RSS eBPF program.
> +
> +Fixes: 4474e37a5b3a ("virtio-net: implement RX RSS processing")
> +Reported-by: Zhibin Hu <huzhibin5@huawei.com>
> +Cc: qemu-stable@nongnu.org
> +Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> +Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> +Signed-off-by: Jason Wang <jasowang@redhat.com>
> +
> +CVE: CVE-2024-6505
> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/f1595ceb9aad36a6c1da95bcb77ab9509b38822d]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + hw/net/virtio-net.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> +index 8f30972708..5635620a31 100644
> +--- a/hw/net/virtio-net.c
> ++++ b/hw/net/virtio-net.c
> +@@ -1909,7 +1909,8 @@ static ssize_t virtio_net_receive_rcu(NetClientSta=
te *nc, const uint8_t *buf,
> +     if (!no_rss && n->rss_data.enabled && n->rss_data.enabled_software_=
rss) {
> +         int index =3D virtio_net_process_rss(nc, buf, size);
> +         if (index >=3D 0) {
> +-            NetClientState *nc2 =3D qemu_get_subqueue(n->nic, index);
> ++            NetClientState *nc2 =3D
> ++                qemu_get_subqueue(n->nic, index % n->curr_queue_pairs);
> +             return virtio_net_receive_rcu(nc2, buf, size, true);
> +         }
> +     }
> +--
> +2.30.2
> +
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208164): https://lists.openembedded.org/g/openembedde=
d-core/message/208164
> Mute This Topic: https://lists.openembedded.org/mt/109891410/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

