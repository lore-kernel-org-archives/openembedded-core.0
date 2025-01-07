Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCCEE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 16:46:19 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.25474.1736268378986738142
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 08:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bO1g8yxu;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso15610038e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 08:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736268377; x=1736873177; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7octprIvjN4h96+a/1jtIxmQBzh7SJmOa2/o5PUq8Fk=;
        b=bO1g8yxuEWyF9fIWJKMsJ9t+G7BBSCgmwK7XGnM3BpeaVHtp37QADX6i0NmBl/RchM
         mcBpaJ+DxdZYZuot1kzrUc1I2A80tweh52OOLGNk8tpSNrVyBx8QEx2Hp720mYHjv0PV
         C8AUEK8er2UuslYsO/QtCp6PRHH7dMpFa8/6OVuoQG0DlZ9aMZxMPxwuRwyWRCuSWoTf
         mtBP6xe4eyr5Ep9+tYs+jUOQAcC8b5hGF7ZycoNJFTdzwM04ge4Bv8zZYpRYdVUDcwcK
         VDGECHE4C/38DoIMtOuTTlBM4MZ9Bzp1EXdtkoA61ss/cHH2WE/NuASB0d1ye3+K7LBW
         quHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268377; x=1736873177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7octprIvjN4h96+a/1jtIxmQBzh7SJmOa2/o5PUq8Fk=;
        b=YrBJ0lIDg+fRZ6FDrCoGqUtFimHTgdHmoOyWGg2CM/fC4yMc1yHNEM/tcThzgSa2F6
         vXe19qNw5zuRNQ1HY112lPOZ9RJ1kfzEcoHKMx7jUMmhqM14R6L3aypcdqXL3/dhm8lu
         WJpJJzNfglOdMw1btJ20fRQrXFnkssD1mWbxycLP0Ma4y4g/CGzg+ujvoa1JRxIJQdxk
         8QZfcSpwkqyhXDVgcwoS5cLyipp12AMuY0mQ9lifNtn5y/7WU50N1nUrBiHuTMQGo+pP
         TElZiOpLT6o+5v9urXRE6E7ybT/fdpnIYnAS/aeTD6s3Xqd5ollhrgc57ZOkp/Tr++5s
         rkXQ==
X-Gm-Message-State: AOJu0Yx7ciJruLcmkwxgNtdO6zhFdHDcXMqUSYWeHwSF3EuH1NulfVYe
	LrJa8znccAXZK3sE2o9F7EkHf3u5B3FSKjnRe/Qr3+QzT2ppVD7Ujpey2b4D99XMwplI3t4ADpG
	dyHSTDPEkhJ/AQwci/L6oAUSbhQ970g==
X-Gm-Gg: ASbGnct5ulHPAMBHeG+CGOfHA3HEeYioi/eqQ26bOHptqjFWHJ1XImm7F+IiurxpLcz
	1iq9uFTCcFvSZms0gBIov25ZkpTAy8kjhXHfCYzGFGNrE+eB1JcfM
X-Google-Smtp-Source: AGHT+IGmv0hBL4Qof5rTvlZH497f5P0W2bTgxUpxrIvqIjXR5uiFHFtP/eKalZlCuGUx1wN8vUC7rtZnAZzgvfP66dY=
X-Received: by 2002:ac2:4c50:0:b0:542:28dc:a2b3 with SMTP id
 2adb3069b0e04-54229530148mr22373315e87.22.1736268376830; Tue, 07 Jan 2025
 08:46:16 -0800 (PST)
MIME-Version: 1.0
References: <20241225024826.960533-1-hongxu.jia@windriver.com> <20241225024826.960533-2-hongxu.jia@windriver.com>
In-Reply-To: <20241225024826.960533-2-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 7 Jan 2025 09:46:03 -0700
X-Gm-Features: AbW1kvZLSWGyWYpEK02G18yGsWXp2SMyzyMMq_AZ1hzDeDXnZbjh9o-6KmzYo-0
Message-ID: <CAJdd5Gb0iQ7UQWuoNBALNgCY+HnQJL9J_4FyHJYdgSurmx=SBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/2] meta/lib/oe/sbom30.py: fix alias in
 simplelicensing_customIdToUri not extracted
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 16:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209480

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Dec 24, 2024 at 7:48=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
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
> Suggested-by: Joshua Watt <jpewhacker@gmail.com>
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 08fea2aca3..0004447066 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -855,6 +855,18 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
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
> +                    else:
> +                        self.missing_ids.add(d.value)
> +
>          self.missing_ids -=3D set(imports.keys())
>          return self.missing_ids
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209070): https://lists.openembedded.org/g/openembedde=
d-core/message/209070
> Mute This Topic: https://lists.openembedded.org/mt/110280280/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

