Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web12.1970.1632431129845829046
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 14:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hQ0nVwng;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id a3so11561272oid.6
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 14:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=EpyD3NafZ3+/lNj6EDdwbrDMfO2eeLQHS9bQz1Xdhn0=;
        b=hQ0nVwngBTdaRfjzcPrfS+dy7bJbfIhjQWYfivTxUGR+DrYtiWb8xhg2v4B4iJB0rZ
         EL5W4V4br3sV2+is4Ey9jEIC4PC38EJ1j7mJt7YYBy+rLmrMd4RR/PU8ZAFRoYLAQVAj
         EDeDVfG/oJp+UdD4RtgW7m8BODFxmQ5NLJgPs9gs83f8y4pT13JVV28O6p+AuEwbXb2I
         FLS8aJrLDF0wl+7upvwxcVGdYBz3wX1bSK/ZuprE6bYcKERIzU1Mf0JL2jlP1pKSYpRb
         rBitZo/qmrw6YoIa5EeQWJ+518J2uqW/ayAYD7+8oaarKGppa8Z4RzCFNtXedRT09Hgm
         nucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EpyD3NafZ3+/lNj6EDdwbrDMfO2eeLQHS9bQz1Xdhn0=;
        b=VzwXG+L/O6Qe24gkMyBpv8cuhdGK27kJop/HwIiWMJeRJfdzNzACTKQ5gF07xiuqz9
         sUv8J2GSUmBrHa8D9bGUdIUZq/Gde8djrPrHuoOeHpCc0H2Oqod0jbnGDeCCNODBC3yq
         9DNi+U+VhsYj3ZZRLJWEHrH3SAh2gBLfEC3dI3/eGtOxb+r14ac3+CrGlwvp88r4E2fS
         8UZNgpWBEKS4YFpApjbswERFp4zRerc1qezP/LrBnoVmUz1OElBJUE1pikqYZKx9SQwC
         V3wmuotyu53NA4s3hT46rTDMNY7KUV77oZn5nG0npvLvbr4u5VRef+mGaGYedrZNzMy7
         dkaA==
X-Gm-Message-State: AOAM5339NSPR7ZyYYiaHt88d/OU/p0rHCIN/g0xz0ke5tG9VzIVAEntn
	KVLShEjiyHSsV/R0dc7A01RTrEileEU=
X-Google-Smtp-Source: ABdhPJxgXOHHRcnLm/OqDoC7mAZhefCR1QB+jxg/s5l+ip+6cHLXklc6UlRdqHWUSN7rWKpxb3cRPQ==
X-Received: by 2002:a05:6808:bd1:: with SMTP id o17mr2340683oik.92.1632431128788;
        Thu, 23 Sep 2021 14:05:28 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id l25sm1647832oic.54.2021.09.23.14.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 14:05:28 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [PATCH v2] create-spdx: Don't collect natives sources
To: Saul Wold <saul.wold@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20210923205328.2662727-1-saul.wold@windriver.com>
Message-ID: <91fdbb39-dded-4c59-75de-4a8e223f370a@gmail.com>
Date: Thu, 23 Sep 2021 16:05:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923205328.2662727-1-saul.wold@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/23/21 3:53 PM, Saul Wold wrote:
> Extend the SPDXPackage to include is_native so it can be used later in
> the processing.
>
> When the collect_dep_sources() runs, it collects sources from both native
> and non-native recipes. Later when the GENERATED_FROM matching occurs it
> may find the file (via checksum) from the native recipe since it's the
> same checksum as the target file. The that are generated DocumentRefs
> point to the native recipe rather than the target recipe DocumentRef.
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>   meta/classes/create-spdx.bbclass | 11 +++++++++--
>   meta/lib/oe/spdx.py              |  1 +
>   2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
> index 3c73c21c04..e565f0bf6c 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):
>   
>       sources = {}
>       for dep in dep_recipes:
> +        # Don't collect sources from native recipes as they
> +        # match non-native sources also.
> +        if dep.recipe.is_native == "True":
> +            continue
>           recipe_files = set(dep.recipe.hasFiles)
>   
>           for spdx_file in dep.doc.files:
> @@ -382,7 +386,6 @@ python do_create_spdx() {
>       include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
>       archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
>       archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
> -    is_native = bb.data.inherits_class("native", d)
>   
>       creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
>   
> @@ -401,6 +404,10 @@ python do_create_spdx() {
>       recipe.name = d.getVar("PN")
>       recipe.versionInfo = d.getVar("PV")
>       recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
> +    if bb.data.inherits_class("native", d):
> +        recipe.is_native = "True"
> +    else:
> +        recipe.is_native = "False"
>   
>       for s in d.getVar('SRC_URI').split():
>           if not s.startswith("file://"):
> @@ -480,7 +487,7 @@ python do_create_spdx() {
>       sources = collect_dep_sources(d, dep_recipes)
>       found_licenses = {license.name:recipe_ref.externalDocumentId + ":" + license.licenseId for license in doc.hasExtractedLicensingInfos}
>   
> -    if not is_native:
> +    if recipe.is_native is "False":
>           bb.build.exec_func("read_subpackage_metadata", d)
>   
>           pkgdest = Path(d.getVar("PKGDEST"))
> diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
> index 9814fbfd66..452148f339 100644
> --- a/meta/lib/oe/spdx.py
> +++ b/meta/lib/oe/spdx.py
> @@ -164,6 +164,7 @@ class SPDXPackage(SPDXObject):
>       packageVerificationCode = _Object(SPDXPackageVerificationCode)
>       hasFiles = _StringList()
>       packageFileName = _String()
> +    is_native = _String()

It's probably not well documented in this file, but this has to match to 
the SPDX standard; we can't add arbitrary fields here. When I was 
referring to an "annotation" I was specifcially referring to an SPDX 
annotation:

https://spdx.github.io/spdx-spec/8-annotations/

We'd need to decide on some schema for encoding the data in the annotation

>   
>   
>   class SPDXFile(SPDXObject):
