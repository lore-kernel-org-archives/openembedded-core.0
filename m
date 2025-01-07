Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C482BE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 14:04:08 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.20834.1736258642362745139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 06:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s2USVCHD;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.180, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e3c8ae3a3b2so18673927276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 06:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736258641; x=1736863441; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCLFHN2ZXSU2KNrz3lfpRnIXTNNv0SN04HhU5tDxG8E=;
        b=s2USVCHDOm5/okJ665Eete269EOul4s6xEQlnHpNgJzPFGm39Cwu3hir8AXnvazg3I
         IVW7Nnck85nk7fbE3XE7vdG/hglrQZf8lGoahW93eF1izaN/vMbVRTdfLWE7KVjeLFnY
         VULxipRFbqK1JRliSCDbJCMj9A+vNr/s2iCbGSYWjD40cKD7N+fAOyE+miKWNv2RGYLO
         6tZ+rvw4OIVvDnBF5LX9yKyQrCIjBvDbDFgwjQxznsRsUB353B+8JEYsA9aEsqFkNQt3
         ZKQZYPNyWBCudXCjsiHh81/3DRMRsUy6QaLQuSYo1Y2yzOAe8/vyi0tP7I+ndwA1OPK5
         w/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736258641; x=1736863441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCLFHN2ZXSU2KNrz3lfpRnIXTNNv0SN04HhU5tDxG8E=;
        b=sDNJ3x41rFTBlXcYUHLghEqL4gPbGiC/lNHYFLY1NNAPFEUPsr8uUTgqGKIPPsNR+k
         MpnY6Lgi9yNOmcigTIPakdF/42J1ep+aQech65tZBYknWDK0g7GwqbVoeple+hen3D0R
         2s1j1nB27jQFb0YEZmlHEX29FLFMdCbFepvmQm27OmS5c+JW9F/8POhESocC5sT9Wop+
         azwYL8dfHqdbsT95Z7iUO7KCG2FY23spiRbuZbUzJ4BafLXtSFafkTZe42BoK9R01HTz
         ZUuQN2OCGz8nL3EfKLZTv1w7DYjEZynNS1z+19xY91nU5lgS7JotFWs+bjwD8Qy12Ocn
         pjVA==
X-Gm-Message-State: AOJu0Yw2oyBYNCxGasREu59HpJXXHJH/1bBdC1GiuSufDsWYx65QC3VK
	BRzla+EpTlPNCW01EohzpzZII3j6jBKg1JjgAOpEhX43+sek7PhHNsk9LuQwefFq8qq327BgDvF
	hiZ9sVUoYVDJ4eRy/WrpAAvXUtx1p/FYipfDIa0UOSp/NidpgkCXfsQ==
X-Gm-Gg: ASbGnctb6wXsHlFPIHX33CNsdTaz0CTEjFkbRnb51y2EoIABbNHC6fvNfGOxzPkMi34
	cfLZ7ufMJ32CbmEjkI9SUqHHrbKyjcugmTzi1XQ==
X-Google-Smtp-Source: AGHT+IGhJSgsYyLudY+S9Fnx2hClqMGMLt8gBR19g5DhFmXbtQVFe1Jyuj86FtTi2bhUJAbx35GbRoU9tb33zFjbN+Y=
X-Received: by 2002:a05:690c:4d01:b0:6ef:77e3:efe3 with SMTP id
 00721157ae682-6f3f811506cmr474288817b3.13.1736258641492; Tue, 07 Jan 2025
 06:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20250107065756.642432-1-spushpka@cisco.com>
In-Reply-To: <20250107065756.642432-1-spushpka@cisco.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 7 Jan 2025 06:03:50 -0800
Message-ID: <CAOSpxdbNu+ydoeZrcJ-jf58eE2wYeHUm-rg5PJqetvGfJOJgjQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-openembedded] [scarthgap] [PATCH] wireshark
 4.2.7: Fix CVE-2024-9781
To: spushpka@cisco.com
Cc: openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 14:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209473

Wrong mailing list!  Please send to openembedded-devel@lists.openembedded.o=
rg

Thanks,

Steve

On Tue, Jan 7, 2025 at 3:35=E2=80=AFAM Shubham Pushpkar via
lists.openembedded.org <spushpka=3Dcisco.com@lists.openembedded.org>
wrote:
>
> Upstream Repository: https://gitlab.com/wireshark/wireshark.git
>
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-9781
> Type: Security Fix
> CVE: CVE-2024-9781
> Score: 7.8
> Patch: https://gitlab.com/wireshark/wireshark/-/commit/cad248ce3bf5
>
> Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> ---
>  .../wireshark/files/CVE-2024-9781.patch       | 133 ++++++++++++++++++
>  .../wireshark/wireshark_4.2.7.bb              |   1 +
>  2 files changed, 134 insertions(+)
>  create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2=
024-9781.patch
>
> diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2024-978=
1.patch b/meta-networking/recipes-support/wireshark/files/CVE-2024-9781.pat=
ch
> new file mode 100644
> index 000000000..eb8c733da
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch
> @@ -0,0 +1,133 @@
> +From f32965be7c80ca6eb330d0e9b34f0c563db7d869 Mon Sep 17 00:00:00 2001
> +From: Gerald Combs <gerald@wireshark.org>
> +Date: Tue, 8 Oct 2024 11:56:28 -0700
> +Subject: [PATCH] AppleTalk: Make sure we have valid addresses
> +
> +Make sure ATP, ZIP, and ASP have valid addresses. Use sizeof instead of
> +a hard-coded value in a few places.
> +
> +Fixes #20114
> +
> +(cherry picked from commit 3de741321f85c205c0a8266c40f33cb0013bd1d2)
> +
> +Conflicts:
> +       epan/dissectors/packet-atalk.c
> +
> +CVE: CVE-2024-9781
> +Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/comm=
it/cad248ce3bf5]
> +
> +(cherry picked from commit cad248ce3bf53026cc837fedeaca65d0f20ea3b5)
> +Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> +---
> + epan/dissectors/packet-atalk.c | 44 ++++++++++++++++++++++++----------
> + 1 file changed, 32 insertions(+), 12 deletions(-)
> +
> +diff --git a/epan/dissectors/packet-atalk.c b/epan/dissectors/packet-ata=
lk.c
> +index 396e7af519..065d6aedb6 100644
> +--- a/epan/dissectors/packet-atalk.c
> ++++ b/epan/dissectors/packet-atalk.c
> +@@ -232,9 +232,18 @@ static int hf_asp_attn_code     =3D -1;
> + static int hf_asp_seq           =3D -1;
> + static int hf_asp_size          =3D -1;
> +
> ++/*
> ++ * Structure used to represent a DDP address; gives the layout of the
> ++ * data pointed to by an Appletalk "address" structure.
> ++ */
> ++struct atalk_ddp_addr {
> ++  guint16 net;
> ++  guint8 node;
> ++};
> ++
> + typedef struct {
> +   guint32 conversation;
> +-  guint8  src[4];
> ++  guint8  src[sizeof(struct atalk_ddp_addr)];
> +   guint16 tid;
> + } asp_request_key;
> +
> +@@ -502,6 +511,10 @@ static const value_string asp_error_vals[] =3D {
> +   {0,                   NULL } };
> + value_string_ext asp_error_vals_ext =3D VALUE_STRING_EXT_INIT(asp_error=
_vals);
> +
> ++static bool is_ddp_address(address *addr) {
> ++  return addr->type =3D=3D atalk_address_type && addr->len =3D=3D sizeo=
f(struct atalk_ddp_addr);
> ++}
> ++
> + /*
> +  * hf_index must be a FT_UINT_STRING type
> +  * Are these always in a Mac extended character set?  Should we have a
> +@@ -744,6 +757,12 @@ dissect_atp(tvbuff_t *tvb, packet_info *pinfo, prot=
o_tree *tree, void* data _U_)
> +   conversation_t  *conversation;
> +   asp_request_val *request_val   =3D NULL;
> +
> ++  // ATP is carried over DDP
> ++  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
> ++    return 0;
> ++  }
> ++
> ++
> +   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ATP");
> +
> +   ctrlinfo =3D tvb_get_guint8(tvb, offset);
> +@@ -770,7 +789,7 @@ dissect_atp(tvbuff_t *tvb, packet_info *pinfo, proto=
_tree *tree, void* data _U_)
> +     asp_request_key request_key;
> +
> +     request_key.conversation =3D conversation->conv_index;
> +-    memcpy(request_key.src, (!atp_asp_dsi_info.reply)?pinfo->src.data:p=
info->dst.data, 4);
> ++    memcpy(request_key.src, (!atp_asp_dsi_info.reply)?pinfo->src.data:p=
info->dst.data, sizeof(struct atalk_ddp_addr));
> +     request_key.tid =3D atp_asp_dsi_info.tid;
> +
> +     request_val =3D (asp_request_val *) wmem_map_lookup(atp_request_has=
h, &request_key);
> +@@ -1018,7 +1037,7 @@ get_transaction(tvbuff_t *tvb, packet_info *pinfo,=
 struct atp_asp_dsi_info *atp_
> +   conversation =3D find_or_create_conversation(pinfo);
> +
> +   request_key.conversation =3D conversation->conv_index;
> +-  memcpy(request_key.src, (!atp_asp_dsi_info->reply)?pinfo->src.data:pi=
nfo->dst.data, 4);
> ++  memcpy(request_key.src, (!atp_asp_dsi_info->reply)?pinfo->src.data:pi=
nfo->dst.data, sizeof(struct atalk_ddp_addr));
> +   request_key.tid =3D atp_asp_dsi_info->tid;
> +
> +   request_val =3D (asp_request_val *) wmem_map_lookup(asp_request_hash,=
 &request_key);
> +@@ -1051,6 +1070,11 @@ dissect_asp(tvbuff_t *tvb, packet_info *pinfo, pr=
oto_tree *tree, void *data)
> +   if (data =3D=3D NULL)
> +     return 0;
> +
> ++  // ASP is carried over ATP/DDP
> ++  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
> ++    return 0;
> ++  }
> ++
> +   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ASP");
> +   col_clear(pinfo->cinfo, COL_INFO);
> +
> +@@ -1183,15 +1207,6 @@ dissect_asp(tvbuff_t *tvb, packet_info *pinfo, pr=
oto_tree *tree, void *data)
> + /* -----------------------------
> +    ZIP protocol cf. inside appletalk chap. 8
> + */
> +-/*
> +- * Structure used to represent a DDP address; gives the layout of the
> +- * data pointed to by an Appletalk "address" structure.
> +- */
> +-struct atalk_ddp_addr {
> +-    guint16 net;
> +-    guint8  node;
> +-};
> +-
> +
> + static int atalk_str_len(const address* addr _U_)
> + {
> +@@ -1241,6 +1256,11 @@ dissect_atp_zip(tvbuff_t *tvb, packet_info *pinfo=
, proto_tree *tree, void* data)
> +   if (data =3D=3D NULL)
> +     return 0;
> +
> ++  // ATP ZIP is carried over DDP
> ++  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
> ++    return 0;
> ++  }
> ++
> +   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ZIP");
> +   col_clear(pinfo->cinfo, COL_INFO);
> +
> +--
> +2.44.1
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb=
 b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
> index b80710683..d68b082bb 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "https://1.eu.dl.wireshark.org/src/wireshar=
k-${PV}.tar.xz \
>             file://0002-flex-Remove-line-directives.patch \
>             file://0004-lemon-Remove-line-directives.patch \
>             file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-hos=
t.patch \
> +           file://CVE-2024-9781.patch \
>             "
>
>  UPSTREAM_CHECK_URI =3D "https://1.as.dl.wireshark.org/src"
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209452): https://lists.openembedded.org/g/openembedde=
d-core/message/209452
> Mute This Topic: https://lists.openembedded.org/mt/110475405/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

