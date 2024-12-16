Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA0AE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 15:35:50 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.59288.1734363342518730956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 07:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PbYmJnwX;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so4646192e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 07:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734363341; x=1734968141; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7j7e7WDFfLDcbtv457vbWwP+wycF8Tz2yVxJWuSG+c=;
        b=PbYmJnwXBoPlUWUjfNVq3C0tTS4DGJEv0aGNSscVsF7NnAG4Xd1PWXtDJGkCU+JtHk
         8wZuoSETZ5nZo8iiE7jYYKjPtTiQDW1nuFlP3iZr+Fg816T1bIWwGlUiG6iTGPaz+r8o
         fdEL39bgIKCQ23G5yQKNz64H14DeD2OkgdNlCxLKWS7FIx+ajEEmIZ0qVHT2asVGoR69
         4R7dZPrdGZY9dlGV5SIfAmtAgUaHYam7eeZUyxbRSpoJxjm8mwvxypvhSMtBsHESBa7w
         NyUVqOcEEhcq/jBUUGhnGRM8jBQ2ic9gRIdGTvDFz5UrECyGx9CKR3VzXtVmsanzc1qB
         wp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363341; x=1734968141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7j7e7WDFfLDcbtv457vbWwP+wycF8Tz2yVxJWuSG+c=;
        b=COIPDptoRhoX9F0R4cAT/5sD/Aruvp2vKSWcVuIJ45eSw+Slv8vOO5NHnlh1SGda8b
         ebNFW94SGznNEQfP3tgOlyzSmq/dcri0WLcXoFeo0X8FfxETwjqWoaJczl1j1cH6aoDW
         555UPHdJAp6ASY2ALApHvF0iJoS6HL7YZhKQhCHxAJtVNc+EAA/I6OmINY0AdqwDVsPO
         iFIbMyqnj034tKndDxV3DUoDK1eqIHGazEEPjQ/Xokv08TlycBwQ41bKWgNBTX5XNTdz
         kG6WyHrqswvmVhTx35d39YVG40fULLTdAvIGU8pRNG866L7E4TdcJEFvnbsYrL7wun4t
         R6sA==
X-Gm-Message-State: AOJu0YzU8bzCn8N4/qsKSHwGY7TkDa1JH2iPSjbRlf8cg9Q14TZL+vfx
	0ZF5tyoy6ZDL15UDboxwdZpSN677vhLeCd+g0jB5KAxtSYoh47SKl7RSRs48IQBkSOn5Wa6QDID
	m+ztim+pw7sYm1bS0E/POst2s4XUwwA==
X-Gm-Gg: ASbGnctA+Gh7PdQjiPaD/QDDU+sPVI1242ZRVKtXQn4yQYn4tJtpDnLet0j7QLXYIUK
	8VmEKdA266yoPZWpwRMBkZb4XgzasaUp6obHt4jjoJnCaNGGm3Wof
X-Google-Smtp-Source: AGHT+IET+qpsKG33RscPdpJC76Q+YXl/LLAdgxS7LhD3Hr9RH9Hiu6nAdRK1P21/Elo4xlUPaDxaBg/E1Ypw3oddNQ8=
X-Received: by 2002:a05:6512:3e06:b0:53e:39c2:f02b with SMTP id
 2adb3069b0e04-540905aae7cmr4298105e87.42.1734363339031; Mon, 16 Dec 2024
 07:35:39 -0800 (PST)
MIME-Version: 1.0
References: <CAJdd5GboPsjC+A9PBBSGX_41PYLGdWCoJF5V1u6J2+R-NC1W4w@mail.gmail.com>
 <20241216080646.959345-1-hongxu.jia@windriver.com>
In-Reply-To: <20241216080646.959345-1-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 16 Dec 2024 08:35:26 -0700
Message-ID: <CAJdd5Ga2=2o1Pb9hYj6=aG_Esz1JKRPK7+XBn62EmaJKa=X3vg@mail.gmail.com>
Subject: Re: [PATCH V2] meta/lib/oe/sbom30.py: fix alias in
 simplelicensing_customIdToUri not extracted
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 15:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208776

On Mon, Dec 16, 2024 at 1:06=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> After commit [spdx 3.0: Rework how SPDX aliases are linked] applied, it s=
et
> license_text_map with SPDX alias other than actual ID
>
> The property of simplelicensing_customIdToUri is ListProp(ObjectProp(Dict=
ionaryEntry))),
> and class DictionaryEntry has key and value, the property of value is Str=
ingProp other
> than ObjectProp in which could not support to decode/extract SPDX alias w=
ith actual ID
> in image jsonld file
> -----------
>       "simplelicensing_customIdToUri": [
>         {
>           "type": "DictionaryEntry",
>           "key": "LicenseRef-PD",
>           "value": "http://spdxdocs.org/openembedded-alias/by-doc-hash/d5=
3e90e23b12c4ad640809a74a810e86f31c76cdbdf36487712d22a33d53362a/sqlite3-nati=
ve/UNIHASH/license-text/PD"
>         }
>       ],
> -----------
>
> Add special code in the linking to manually go through all of the
> simplelicensing_customIdToUri DictionaryEntry items and resolve
> any aliases to actual objects
> -----------
>       "simplelicensing_customIdToUri": [
>         {
>           "type": "DictionaryEntry",
>           "key": "LicenseRef-PD",
>           "value": "http://spdx.org/spdxdocs/sqlite3-native-e5cc0672-d8dd=
-57e8-a2df-fe4615831fda/162c62b5b011cd3f82f413b3dae4d6d1542201552c964d5ce69=
fe170e0720b85/license-text/PD"
>         }
>       ]
> -----------
>
> Suggested-by: jpewhacker@gmail.com
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 65603e69b7..ad2fce41d9 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -855,6 +855,16 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>          self.doc.import_ =3D sorted(imports.values(), key=3Dlambda e: e.=
externalSpdxId)
>          bb.debug(1, "Linking...")
>          self.link()
> +
> +        # Manually go through all of the simplelicensing_customIdToUri D=
ictionaryEntry
> +        # items and resolve any aliases to actual objects.
> +        for lic in self.foreach_type(oe.spdx30.simplelicensing_LicenseEx=
pression):
> +            for d in lic.simplelicensing_customIdToUri:
> +                if d.value.startswith(OE_ALIAS_PREFIX):
> +                    obj =3D self.find_by_id(d.value)
> +                    if obj is not None:
> +                        d.value =3D obj._id

This is correct, but you need to add:

 else:
     self.missing_ids.add(d.value)

Otherwise LGTM

> +
>          self.missing_ids -=3D set(imports.keys())
>          return self.missing_ids
>
> --
> 2.25.1
>

