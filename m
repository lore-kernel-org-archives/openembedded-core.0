Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD023D3A668
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 14:56:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.21767.1730213758704525479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 07:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GZMEBVhl;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fe02c386so5988878e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 07:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730213757; x=1730818557; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kh4lXUmdoQ7511B9g0OQ+PnDbKH6e99v4LyJybZniFE=;
        b=GZMEBVhll7r3pSt5BaQDs0qCSaTALzKc0e9NlIE0yiRrcYSXgZIvny6+dvsRdbltct
         5fu2PWHClqQv1ucCk40ElUpgB6hIZB/UUXV2f0xu0bTZJdo9HGK0XrQ1iHCdStui4fh2
         bLYV6rNw4NwMmtJX0O8EwDmJztWKWuWZWd5QCdvLVViqpqB+G4arLuLHCeAXL8qs47kH
         4mZBptnyvw9d2D0DGjFzcLQJx0OEd/z+m6bGGQmc9akFpszdjRq3n3ugWBNO2Nx/7eX+
         ENhPkuin++UxZoDBt8MTMh7trHywurlx2iYx6Ib0+whrSDgWcY9HzM45eAroxOHeHbtG
         MZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730213757; x=1730818557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kh4lXUmdoQ7511B9g0OQ+PnDbKH6e99v4LyJybZniFE=;
        b=oJQ6uqCDUTQlQm52jM1+squgMgeGtbhIQQQ4/hIZXUiTlGfuDQq484Z0EI4YIaHlxM
         kGZ0R6ILMr6X447dREmSMgaWsABjqBPYtXgPA3VpL1WY34aOwGW9XteMlglsjFdjjScE
         vcH/NrGsb3sTIMXju68OuujgXDckF7dkonmc2HF6FUNzh2QmfMtJzipTRQgberzWUV4J
         CDhuLQJEYd2Gpc/3XkiRyq7kgqM/3hyCeqI/3Y/pW1+rXzI6A0bKIkQO4DWJNuBhp3U0
         WuytLvqmCgH3klpBVTLFp547WEWfZJ9aXUB8WfqxSw3zFkAVeaxK9/EOzOGbI3W49As5
         i3Iw==
X-Gm-Message-State: AOJu0YzadJmDhT0OVpsTZ16uyMByklDmk9i+XlfB4YoRTSnPV08U33cR
	AX+wLxsbGAOhzu94xBsIh5qV9/kpdsOCUiLpL3Db3XRc5JoQmxubAToedrvGjqr0ukVgPYo9JjU
	WxOED4MRJ34d5vhWTRse7fIVuqPRQDA==
X-Google-Smtp-Source: AGHT+IFxunsgxIDDkqV0AFboEtOUY8YiTvOuJPqlnin6x2c6Ay0mSwdukcBXbDYpw0MukFCRtUwceOn6/9YxailpnDM=
X-Received: by 2002:a05:6512:3b14:b0:539:fe02:c1fe with SMTP id
 2adb3069b0e04-53b4923a790mr813143e87.16.1730213756378; Tue, 29 Oct 2024
 07:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20241029091723.2851061-1-hongxu.jia@windriver.com> <20241029091723.2851061-4-hongxu.jia@windriver.com>
In-Reply-To: <20241029091723.2851061-4-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 29 Oct 2024 08:55:43 -0600
Message-ID: <CAJdd5GZc7ODWMj78SjEJxS4HXyj-hScZ1+ry9d1n1G+p-U5Haw@mail.gmail.com>
Subject: Re: [oe-core][PATCH V2 3/7] meta/lib/oe/sbom30.py: create
 hasDeclaredLicense relationship if file_licenses is empty
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 14:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206501

On Tue, Oct 29, 2024 at 3:17=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> If file_licenses is empty, the hasDeclaredLicense relationship is from so=
urcefile
> to NoneElement. Such as
>
>     {
>       "type": "Relationship",
>       ...
>       "from": "http://spdx.org/spdxdocs/gettext-minimal-native-1fa0d5cb/s=
ourcefile/3323",
>       "relationshipType": "hasDeclaredLicense",
>       "to": [
>         "NoneElement"
>       ]
>     },
>
> According to Specification Version 3.0.1
>
> NoneElement should be used if [1]
>
>     the SPDX creator desires to assert that there are NO elements for the=
 given context of use.
>
> NoAssertionElement should be used if [2]
>
>     the SPDX creator has attempted to but cannot reach a reasonable objec=
tive determination;
>     the SPDX creator has made no attempt to determine this field; or
>     the SPDX creator has intentionally provided no information (no meanin=
g should be implied by doing so).
>
> If we indicates to look for licenses and didn't find any. It should be No=
AssertionElement other than NoneElement
>
> [1] https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Individuals/NoneEl=
ement/
> [2] https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Individuals/NoAsse=
rtionElement/
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index e3a9428668..7ae05c42a9 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -620,6 +620,11 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>          for extracted_lic in oe.spdx_common.extract_licenses(filepath):
>              file_licenses.add(self.new_license_expression(extracted_lic,=
 license_data))
>
> +        # SPDX creator has attempted to but cannot reach a reasonable ob=
jective determination
> +        # https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Individuals=
/NoAssertionElement/
> +        if not file_licenses:
> +            file_licenses =3D [oe.spdx30.Element.NoAssertionElement]

This still needs to be NoneElement, because we looked and did not find
any licenses, therefore in our estimation, there are not any to be
found. This is the meaning intended by the spec; we (the SPDX creator)
are explicitly stating that there are NO licenses (elements) defined
in the file (given context).

If we didn't scan the file at all, that means that we were unable (or
made no attempt) to determine if the file had licenses or not; and
thus NoAssertion would be the correct choice since we would want to
explicitly state we chose not to look for any licenses. This is not
what we actually do in practice, except for in the case where
extract_licenses() gets an exception; if you wanted to, you could have
the function return None in that case and then use that to add a
NoAssertion to the relationship, but the empty list must be treated as
NoneElement

> +
>          self.new_relationship(
>              [spdx_file],
>              oe.spdx30.RelationshipType.hasDeclaredLicense,
> --
> 2.25.1
>

