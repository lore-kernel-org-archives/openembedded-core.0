Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654DFC71134
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 19:58:09 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.4497.1692993487960334402
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=sxo+rctV;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so1946498a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 12:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692993486; x=1693598286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WkPea5LEVJbaeyPtDirzCU4QSKF7SdtKsGdtNezWR8=;
        b=sxo+rctV5zSTWz+cZhi01tnPxowKa14Vo8H8lU70HcOzXJy4mfq9s0nf4bhf1yOqk9
         Z1/4m7oqES3+mA6IE30pwQCrgPM0F3YJjwSO2jj2uLsUDr8T+tR9m8eHWe5Gmw3JkyhQ
         os2YJzVQ7O4040MpM07hka7qtLGmYXQaxDFq7XvfbCeOEm8AKC6fB1A1JcQ4IlJA7D8O
         kFYWbXZ5MjhL6M/t5ht0bL9v05cXdDNSPItR+86C/2NewUYtSX3P+XI8HI4FCfAMsrDF
         u8HPavkQCpbPEoaEJtI3EPVHRjSdqTtxuKCY5wyyTKrIInZVPyT1nDmOS5bYQj1V5Unk
         edqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692993486; x=1693598286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WkPea5LEVJbaeyPtDirzCU4QSKF7SdtKsGdtNezWR8=;
        b=k5kKZGpMn+8/L3EM45koyNQGCM6wYFfOvwQtaAlTwzdhB+XLc9uelevpEClDq7XEPq
         JjIIxATLMUVJhDYAEckWQYuusMd2VXoN3CKs0LdiHq62FXddDRuCNqMS0UdXm1ARtfHM
         W2xyKmaXFWQmLRXzInHAxT3rOC+f5xIedGh6Vwnnk1hWdpkU9Rx3TSDxWNEpixBdSbZg
         aj8y/ww9sYVsVa7/pRfk0KmLTBa/NrEDCfCsoWXH0iN5zIgv1poT+q6ZipzZsLgs32O3
         badI+Vc6pqhR3ehuJrInYZq60cBHt0W7uj6tm9dJe/+DzfECP0/qVrCECIieyL61egFy
         U2QA==
X-Gm-Message-State: AOJu0YzkmktgSoJ25y6sI82/C1JuppwrMUi7T4OuRF0Kzo19UyhuIB2t
	+pFg5LSm3uWJgh/PRwbnkL4JsHMFq7Fp3V9qnUYqQg==
X-Google-Smtp-Source: AGHT+IE4BcNbCcRAiisunWyIi2+yn7cRTIJ9OXm2pQIsrOdb6zW11iZrxTn0ZQ9azZpFktVD4WIYvUEs4NsOYlaYM5c=
X-Received: by 2002:a17:907:2ccc:b0:99b:cd1a:a453 with SMTP id
 hg12-20020a1709072ccc00b0099bcd1aa453mr14495026ejc.3.1692993485933; Fri, 25
 Aug 2023 12:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <6dfa9aba563c61deb382ac6162d15a1fc60c271e.camel@iris-sensing.com>
In-Reply-To: <6dfa9aba563c61deb382ac6162d15a1fc60c271e.camel@iris-sensing.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 25 Aug 2023 09:57:54 -1000
Message-ID: <CAOSpxdaKSE7ObH2OtwaqX1TMi87OB9SVEYQoPpnLuCVXt6Gs2w@mail.gmail.com>
Subject: Re: [OE-core] Providing detailed CPE information for CVE matching capabilities
To: Jasper.Orschulko@iris-sensing.com
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 19:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186725

On Fri, Aug 25, 2023 at 9:18=E2=80=AFAM Jasper Orschulko via
lists.openembedded.org
<Jasper.Orschulko=3Diris-sensing.com@lists.openembedded.org> wrote:
>
> Hi Richard,
> hi all,
>
> I want to address a flaw in the current CPE generation functionality in
> openembedded, which renders the CPEs unusable in regards to the minimal
> requirements of the NIST CPE Name Matching Specification standard
> (https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7696.pdf).
>
> This makes working with the generated CPEs in thirdparty software close
> to impossible, as it would require the thirdparty software to implement
> matching logic beyond the requirements defined in the NIST standard.
>
>
> Status quo:
>
> Currently, the CPE is generated from the optional CVE_PRODUCT
> (optionally including the vendor) and CVE_VERSION variables. If neither
> are provided, CPE generation will fall back on the BPN and PV of the
> recipe.
>
> As a result, the generated CPE will usually look as follows:
>
> cpe:2.3:*:*:${BPN}:${PV}:*:*:*:*:*:*:*:*
>
> Or, if the CVE_PRODUCT includes a vendor:
>
> cpe:2.3:*:${vendor}:${product}:${PV}:*:*:*:*:*:*:*:*
>
>
>
> The Issue (The TL;DR):
>
> This will return zero=C2=B9 matches when doing CPE matching against CVE C=
PEs
> in accordance with the minimal requirements of the NIST Name Matching
> Specification. For reliable matches the components CPE should be as
> precise as possible, i.e. not containing any "*" (ANY) values for vital
> attributes, such as: Part, Vendor, Product, Version, Target_HW.
>
>
>
> The Issue (In detail):
>
> To understand the issue in full detail, in depth knowledge of the NIST
> specification is required. However, I will try to provide a
> comprehensive summary below:
>
> CPE matching is done using a source CPE and target CPE. Due to
> limitations (see Table 6-2, cases 4 & 11), using the CVE CPE as a
> source and the component CPE as a target is the only sensible way
> (otherwise a CVE CPE containing wildcards would lead to undefined
> behavior).
>
> Each attribute of the CVE CPE, will then be matched against the
> component CPE, setting the relationship of each source attribute to the
> corresponding target attribute to either superset (=E2=8A=83), equal (=3D=
),
> subset (=E2=8A=82) or disjoint (=E2=89=A0) (see Table 6-1, example: Table=
 6-3).
>
> The NIST standard then defines 4 required CPE Name Comparison Relations
> (see Table 6-4), with two of them relevant for what we would consider a
> "match" between a CVE CPE and a component CPE:
>
> If all attribute relations are EQUAL (=3D) -> Then CPE name relation is
> EQUAL (=3D) -> match
>
> If all attribute relations are SUPERSET (=E2=8A=83) or
> EQUAL (=3D) -> Then CPE name relation is SUPERSET (=E2=8A=83) -> match
>
> Let's take a look at this, based on a real-world example:
>
> CVE CPE: cpe:2.3:o:linux:linux_kernel:5.15.37:*:*:*:*:*:x86:*:*
> Component CPE: cpe:2.3:*:*:linux_kernel:5.15.37:*:*:*:*:*:*:*:*
>
> In this example the CVE CPE has the attributes "Part" ("o"), "Vendor"
> ("linux") and "Target_HW" defined, while the Component CPE sets these
> attributes to "ANY", thus the CVE CPE attributes are subsets of the
> component CPEs (see Table 6-2, case 13), making the entire CVE CPE a
> subset of the component CPE, thus causing a false-negative.
>
>
>
> Proposed solution:
>
> Openembedded should, in accordance with the CPE Naming Specification
> (https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf), provide
> complete and accurate CPE information (at least: Part, Vendor, Product,
> Version, Target_HW) for recipes in order to avoid false-negatives
> during CVE CPE comparison and ensure compatibility with other tools.
>
> A component CPE could then look like this (something I came up with in
> 5 minutes, enjoy with a grain of salt):
>
> cpe:2.3:o:linux:linux_kernel:5.15.37:<COMPONENT_SHA_COMMIT_HASH>:*:open
> embedded:<OPENEMBEDDED_RELEASE>:<TARGET_ARCH>:en_US (is there a bitbake
> variable for this?):*
>
> Setting attributes such as SW_Edition =3D "openembbeded" and Target_SW =
=3D
> "<OPENEMBEDDED_VERSION>" also has the positive side-effect of allowing
> for the registration of openembedded-specific CVEs, e.g.
> vulnerabilities in patches within recipes.
>
> Of course, this is easier said than done, as some of the required
> information, especially "Part" and "Vendor" is missing from existing
> recipes.
>
> I therefore, suggest the following approach:
>
> Step 1 (non-intrusive):
>
> Introduce a new, optional variable CVE_PART, which is set to "a"
> (application) by default but may be overridden in a recipe (e.g. for
> linux_kernel)
>
> For consistency: Introduce the new, optional variable CVE_VENDOR as a
> replacement for the CVE_PRODUCT "double role" (for backwards
> compatibility, we can evaluate CVE_VENDOR first, then check for a
> vendor within CVE_PRODUCT).
>
> Adding already existing information from the build (e.g. Target_HW) to
> the CPE.
>
> Start filling in CVE_VENDOR for core recipes (openembedded-core).
>
> Optional: Step 2 (enforcement):
>
> Once a certain threshold of recipes with complete information is
> reached, we might want to consider enforcing explicit CVE_* variable
> declaration by default, with an option for disabling this behavior
> (e.g. introducing a variable CVE_UNKNOWN), similar to the LICENSE
> variable bahavior.
>
>
> I hope I was able to give some insights on why I believe that
> improvements to the openembedded CPE generation process, as well as to
> information provided by the recipes (even though a diligent task) are
> vital.
>
> I am looking forward to your feedback on this.
>
> Cheers,
> Jasper
>
>
> =C2=B9: This is also partly due to my
> commit https://git.openembedded.org/openembedded-core/commit/?id=3De7c1de=
f3c3c3a72249802ef6fb64292277a7a53e
> which, while technically correct, makes a bad situation even worse.

I suspect that means that I shouldn't take this patch for the stable branch=
es?

Steve

> Still, only a handful of recipes which happen to be of type
> "application" and explicitly set the "vendor" attribute, had the chance
> to successfully match some (but not all) CVE CPEs. False negatives
> would still lie at > 99%.
>
>
> --
> With best regards
>
> Jasper Orschulko
> DevOps Engineer
>
> Tel. +49 30 58 58 14 265
> Fax +49 30 58 58 14 999
> Jasper.Orschulko@iris-sensing.com
>
> =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=
=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=
=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =
=E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2
>
> iris-GmbH
> infrared & intelligent sensors
> Ostendstra=C3=9Fe 1-14 | 12459 Berlin
>
> https://iris-sensing.com/
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186724): https://lists.openembedded.org/g/openembedde=
d-core/message/186724
> Mute This Topic: https://lists.openembedded.org/mt/100962508/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

