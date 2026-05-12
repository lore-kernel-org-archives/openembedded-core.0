Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521B2CD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 22:27:53 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.773.1778624864198093559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 15:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NSTQCxRX;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65318dafbcbso6485930d50.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 15:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778624863; cv=none;
        d=google.com; s=arc-20240605;
        b=UkYH3HPp1n2PFiDx3hKlbezA6D2a83UGyCqxpcwlEUWOsBiRXE8uq/8HUHF6i8wFbg
         wY5PQNBEWdvKyNXvC5tHFBbOHdF+6CjJ/aKvQeQ8DTMRwyA+iSKMUrqgtaro7L1Xr/QS
         2t7qO3MFnxuDq6n6C+hCqbypLhEgoqNwEtEsh8iqT19x8fKXbr5vYP7dWSr9sG4nJM4V
         3G7GHMhxpTHL2pPEFxaYNFrXhWa/e40Q8znH0Hcj+ssdJ8ip7BLL3q3mjBMz7AfPCb2t
         WFukjjHYuoLyvkZgK27jEBK9xaajIgwsHpnR+52JaMgrspDCbwwyhIq/0Iq2JvBWvEb2
         FpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XQyDn8Nf7e0alScpvUlGsu6YAqnfIrCuxA9jglPW3YY=;
        fh=/0bD1tHDTlNqNV+s0MufUGqSvGjmuOTE19tshw4lm28=;
        b=bbNVa6kARbR2iNAxpKEt+blPyF/BPmi7OXS+rFb2T7JwD7/Damp8zcfNfhkMtWVlvT
         77KVOyXy3LppvdO/b5o8H9ucfWV0d/9f/QaeN/elBPy8vlASDrZz/TkCQbUOOjbrR4/F
         nxrtY2BzpCxv5Cr50/Z0tu2NzuJuaj0QiJW1Bg6Fgg0G7XgiLeHFI9kRyzrLCifci6ro
         /Htjeh8XmWdNNfLN0xq04p7aajuors6mwKRtonc1DXr55ywe7ErTZlhRtJJcqHbhJqCP
         7lrf73nFUQxBx2hVdrn8tGlLu9IgDCVt8V3iVpvqC0uRIzv3p5P38th8C9XhSgFHfQUJ
         wdUg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778624863; x=1779229663; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQyDn8Nf7e0alScpvUlGsu6YAqnfIrCuxA9jglPW3YY=;
        b=NSTQCxRX0KREvzcVbkbW8TV31KDbpGwi+LUDUeAfvWLpWACiukWWDlcztrR5PuBbq5
         bMWL/fjypFuET4HDh3FWBSaKzLeKWBgZGVF/L9Medipkl2V7XEVk41CbxKESU2qs97+W
         aEoZfwdoD/5LyeyyyVEEUEPopkxePdcE+KnR03dLz1OaBxgy0O09t8gZApb8SGQxyY+O
         OCOu2k9y8b2hRFy5kt2lAAgSQjuLazD85D4/dsbayk09V+128+ouBom70dfYQTe06vUh
         N8fIPDHWGFxOD/T3NoM9AAFK/qurcS9NZPuWkR55AqvEBNMG+LYIrolHuiz+0hJkf6Zq
         frxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778624863; x=1779229663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XQyDn8Nf7e0alScpvUlGsu6YAqnfIrCuxA9jglPW3YY=;
        b=sac5BChNeLTPg6XdgQ8z79ZXulIRfXNna0WIhHTYdrQ6MRDuYJZok3WcZ1G8nUVYJZ
         yL6OxgNU9L1E0JR9GKZI/PCtYzhJ2qpKHkQ1Jmei00F1CEGR1ivU4b7jAQZn+DtVcDXG
         KkJj1tHt/UNmn+jAz7GRc2HCTDtEzceP7jT9yFE29akomqeTJ/nrMw2OKFBIujGNoYC4
         qMn8e3HWgj0c8aps99b67O7LKQRV/g9jl+/WMM71cZkBoNylr26NwbIwuOLCCeLa10hP
         0zsyXnn4MfxMNiBO2TR5a2DEiXgcVw/4ZyEVbtTyeRFalY2NNjmc/Y647ypPPZqCzmTX
         XkKA==
X-Gm-Message-State: AOJu0Yx4BkX/bLmjpo8Hzum5CSB0z3htmt6NnfKv338uWHRjACp+mGRN
	rNtKGylLEVggfa/AyHcOXSsHQpYz/K2UwwCWCBLmzRqwu+Bk0dr/HTrryQOc3CEKWwqM9iu2f8G
	4uf6qTqxQ3QQhuYeNwuGFmDG1pc3cJ8mPHc+s
X-Gm-Gg: Acq92OHpYAWM4ZEC0O3zr2NQrSbVYlOi5lKuebBbynqsrnJF9FutiSRTWB4uaEj2Q0m
	52j93WmJbIZ3rxjsfubAC1UTsW4+6TbH0Y8/doAevevsu8fxHR3dIRAMii3iXDkuCLPvfT8DKWW
	f0d6JVjLiinp4v1r4TTSpBiR1m3P1hOzHQGbjBlVJ4a3Crf8/77SxJOzByFyfxFTd5swrXFIvDC
	8P5GbYPP7sTsneT3sBnJ419WBPo6LOpUADvnocDtTJk1nUY9v5fnaBCRtf+urPqaj0/wzOolgYb
	ZXCukgLn0346GTyzMPBJwg==
X-Received: by 2002:a05:690e:12c4:b0:652:fc9b:4a1b with SMTP id
 956f58d0204a3-65df82b3d5dmr218904d50.40.1778624863245; Tue, 12 May 2026
 15:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com> <20260512-sbom-zstd-support-v1-2-93273381d548@bootlin.com>
In-Reply-To: <20260512-sbom-zstd-support-v1-2-93273381d548@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 12 May 2026 16:27:31 -0600
X-Gm-Features: AVHnY4Jj1u8nsZC4iVqsYhWS2J5V1w_zi2H8D9ebbJ4ELD8B4D2OYze9Isfkl3I
Message-ID: <CAJdd5GZfKYWsR3Ryw7OFpbe6qD-HaKXm8o2CENby1q5H9oZrkQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] spdx3: support SBOM compression based on SPDX_SBOM_EXT
To: jeremie.dautheribes@bootlin.com
Cc: openembedded-core@lists.openembedded.org, miquel.raynal@bootlin.com, 
	thomas.petazzoni@bootlin.com, benjamin.robin@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 22:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236916

On Tue, May 12, 2026 at 11:02=E2=80=AFAM J=C3=A9r=C3=A9mie Dautheribes via
lists.openembedded.org
<jeremie.dautheribes=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Add support for optional zstd compression for all types of SBOMs,
> including:
>   - image SBOM
>   - recipe SBOM
>   - SDK SBOM
>
> Zstd compression is applied if SPDX_SBOM_EXT ends with ".zst".
>
> Co-authored-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootl=
in.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass |  3 ++-
>  meta/lib/oe/sbom30.py                | 11 +++++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 785edb9865..6cf8fa4688 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -75,7 +75,8 @@ SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base variabl=
e that describes how to \
>              SPDX 3 spec. Optional but recommended"
>
>  SPDX_SBOM_EXT ??=3D ".spdx.json"
> -SPDX_SBOM_EXT[doc] =3D "SBOM file extension name."
> +SPDX_SBOM_EXT[doc] =3D "SBOM file extension name.\
> +    If it ends with '.zst', SBOMs are automatically compressed using Zst=
d."
>
>  # Agents
>  #   Bitbake variables can be used to describe an SPDX Agent that may be =
used
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 0f1f9281ad..2184c1a07f 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -1036,8 +1036,15 @@ def write_jsonld_doc(d, objset, dest):
>          serializer =3D oe.spdx30.JSONLDInlineSerializer()
>
>      objset.objects.add(objset.doc)
> -    with dest.open("wb") as f:
> -        serializer.write(objset, f, force_at_graph=3DTrue)
> +
> +    if dest.name.endswith(".zst"):

I'm not sure I like this detection mechanism; I think we usually do
something more explicit for compression rather than relying on the
suffix in other places?

> +        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))

The API is oe.utils.parallel_make_argument()

> +        with bb.compress.zstd.open(dest, "w", num_threads=3Dnum_threads)=
 as f:
> +            serializer.write(objset, f, force_at_graph=3DTrue)
> +    else:
> +        with dest.open("wb") as f:
> +            serializer.write(objset, f, force_at_graph=3DTrue)
> +
>      objset.objects.remove(objset.doc)
>
>
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236897): https://lists.openembedded.org/g/openembedde=
d-core/message/236897
> Mute This Topic: https://lists.openembedded.org/mt/119282964/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

