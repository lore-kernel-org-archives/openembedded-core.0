Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED87CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 14:29:43 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.web11.22734.1761229775374438378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 07:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A87x1PAJ;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63e393c49f1so1051002d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761229774; x=1761834574; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuXIHNpIb/Sqb3gbjThImlh3NsBfZ9YXnK97q/2guPE=;
        b=A87x1PAJycx3XEuqgMr6Un4Cj5YLi05kQpJkpLC6VNFdmkmZBDW6lGXbiK45wf4akY
         P6YWD/tOk1Q16ATIDNeOTQZqgBm7jW8YiffREbxWWF6EayQW1SLbqh3uajyrr8i7PU/c
         GV7XmAB/kXFm3YRaCA9NumD7KklO6CJ5lfqolFe5QMSWGzDkfDUS1SwrxVFGy19LOQJE
         b5oWU+P1hGi+Dk1FWi0OpdOI7Lan3+SA5ZqZeAHsYP0dHI1y1bqhmCQLYlLhHRQ4eVFc
         +9AAIK16ySWGip8wLqLP8D+BfMsIcuRHOfhH0hpRhkhsC8PqDaEr3OKhUPhQYP63jFdB
         j6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761229774; x=1761834574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuXIHNpIb/Sqb3gbjThImlh3NsBfZ9YXnK97q/2guPE=;
        b=mQBVfpTq/yBFxDAQgjp9O8alSQY3f+8fYD7tbQ/4LNXeYbSGKwDc3Bm8Ntezykeiwe
         0lx2wAjLrHESFud3N7sjZepcsgLWL3ezi/GdhsEa1k19gty7KfKu0VC0ps6i3jVxSd8u
         D5b+Y/VVquhzylI9fwGJrvQlgEpcJuioR679Fmo7xs4szWncaA00ZLYUIOyoU6u9NikE
         wOt/0sXKG/Vf6BVNiZqyqYTv5fjG2YJQ3YAiD0qUkDmRvY0Z25xw6V8okHxKz7mcxIwN
         ztt4m2vDoP1Ugv67JWIxuSOHfjBgtDpxtdJITKAuwlM62dnkHCI8ieGsb3QYRG85D8rb
         kfBw==
X-Gm-Message-State: AOJu0YwjixUGYnSVtrvus4TY7MP+x4Zf1c+kjS9Ud4RbweMcBBu4leDD
	qyKdsN+gX4UHU5zkgvKLhoLQkIHfxWdG4NhloofdCttkje6kAdP2zv0m8MDQKVytqoZ4rHIfzWt
	cTXHGluxuPpr5u65B+ZvqmXWyLZ6xs+4=
X-Gm-Gg: ASbGncsE3HEEArTKzr5m1Cph2Q3EI8CyDIQM8W5XLkQoV5B8F2AymrTMU2kAKc2ELaH
	Kbp0wvBnoo/AB/9cmkNllMHkqdlta6MSmuumT+cq+Sjmh/4nGuzv8/TZcnb58qIWXP25Csg9c/m
	8zzG7m37PuB00twbmqJkW029vBXGPj95nBTTddwSHXyFNgVtiNlU0y1IrDWe1WJqmUSy7kJ+Zhj
	vSbfEQ9aANSnyYBdc2iRebKlQzfW09AsMrP4v8C9eYEEaYgRsWTVfgvYtUc8hHnYSO5J10N6q/E
	dZzJMB2XeA==
X-Google-Smtp-Source: AGHT+IGA7YR5xK2xWsMTz/4/9G51M2d9G9FQMyNPTG/VxC8hNcbpF6E61VJCrYEQ1bohzexGioDjJ8w/WNRXcDNfqbU=
X-Received: by 2002:a05:690e:11c4:b0:63e:2059:cb80 with SMTP id
 956f58d0204a3-63e2059cd40mr17208767d50.33.1761229774411; Thu, 23 Oct 2025
 07:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251022090647.419543-2-jose.quaresma@foundries.io> <20251022090647.419543-4-jose.quaresma@foundries.io>
In-Reply-To: <20251022090647.419543-4-jose.quaresma@foundries.io>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 23 Oct 2025 08:29:22 -0600
X-Gm-Features: AS18NWBoALrpQQi7c2RS4XTEXWwXvisCeDAXy8hzBUmoFonYsFRs-WUzD7bX9Ho
Message-ID: <CAJdd5GbccKjmUNNaaUChS4rVJLRVWmCy7kQ+LPq6u7y2CD5GLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] create-spdx-3.0: add SPDX_LICENSES to SPDX3_DEP_FILES
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 14:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225266

On Wed, Oct 22, 2025 at 3:07=E2=80=AFAM Jose Quaresma via
lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
>
> If we have changes on SPDX_LICENSES content we ended up building invalid =
sstate-cache archives.
> The default value for the SPDX_LICENSES is the file meta/files/spdx-licen=
ses.json but this file
> don't use the bitbake fetcher and because of this their checksum is not v=
alidated.
> So we need to add this file to the build dependency chain of the SPDX.
>
> For example, currently we have bump from 3.24.0 to 3.27.0 on master-next =
for the file
> meta/files/spdx-licenses.json. Since the file content is not taken into a=
ccount, we end
> up creating invalid sstate-cache artifacts on the autobuilder on master-n=
ext builds.
> This created sstate-cache artifacts will also be available to master bran=
ch users
> that are using the upstream sstate-cache mirror.
>
> If someone is using the public mirror but still following the master bran=
ch
> they will encounter something like the following error which this change =
aims to resolve.
>
> | ERROR: initramfs-rootfs-image-1.0-r0 do_create_image_sbom_spdx: http://=
spdxdocs.org/openembedded-alias/by-doc-hash/57301e8063a8bf25308226271627db2=
b78675cda9f648c5c6c14a2b9c18f48dc/zlib/UNIHASH/license/3_27_0/Zlib not foun=
d in /work/build/tmp/deploy/spdx/3.0.1/armv8a/by-spdxid-hash/57/57301e8063a=
8bf25308226271627db2b78675cda9f648c5c6c14a2b9c18f48dc.spdx.json

Ah excellent. I think we've seen this error before sporadically. Thanks!

LGTM to me

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

>
> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 3a8a97eca4..a6d2d44e34 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -136,6 +136,7 @@ oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] =
=3D "SPDX_MULTILIB_SSTATE_ARCH
>  SPDX3_DEP_FILES =3D "\
>      ${COREBASE}/meta/lib/oe/sbom30.py:True \
>      ${COREBASE}/meta/lib/oe/spdx30.py:True \
> +    ${SPDX_LICENSES}:True \
>      "
>
>  python do_create_spdx() {
> --
> 2.51.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225180): https://lists.openembedded.org/g/openembedde=
d-core/message/225180
> Mute This Topic: https://lists.openembedded.org/mt/115889319/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

