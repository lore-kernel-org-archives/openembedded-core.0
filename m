Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98592C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 20:33:23 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.1751.1644266002691767465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 12:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qaqgLX9D;
 spf=pass (domain: konsulko.com, ip: 209.85.160.171,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f171.google.com with SMTP id z1so13034226qto.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 12:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=Ab4EsE0/7ygQ5dOyAuNMfwqmYdNh1gud/yauXmOF5NQ=;
        b=qaqgLX9DqjMSPcG9cdpyo1uYLNd/weinS8THkju+Wj6HUv3WyENstsrUSiIpmLw/6j
         LJtcSIx1ROn2nETE7gRJY475UZ95WBBbm2ThPKMUhS9z/UGcDRs5dAXEW57phBnR4UOX
         3EtxJ5aLQ6aIxezab7zeoFdOXR+1/ovofkw/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=Ab4EsE0/7ygQ5dOyAuNMfwqmYdNh1gud/yauXmOF5NQ=;
        b=jRMqdQ5MMPMpfzkvqhAdv84IxcpAwlcfpBaThjhtMZs1/aFaX05lqHZB0AG8R5UrZz
         5V8c6wP3Ok7e1+hmV3pzGNuhNxRdAcnXK5kzPwQY+YOuMo7WY9h86uJEpfW4bfHDItaL
         5JnBF3HKaWOkoZ9G4OpxfjFzplg/GjRswfMCRKWTOoYrMDWCUaO8Lutcj8K9qC7zUHTu
         UlewxiumZHTgRNAKYiNgOhywFuNB2SMqoWILG5An72LcPI1ID0k6+1xv6P6KSdPdL/yI
         F8/cxP69AwLkaLp90fjv5wPoV7alvSPrA4YTrIHwtP9W01osfim/LYehS/e5zwSzAIrP
         9mcQ==
X-Gm-Message-State: AOAM533wqEkWKG3kWbQnkq+RtFkNwShgha9OvuUG7Q1Ig9NjbKf2lRq2
	Ykxml0eN6KoErKVsCrmL5MNZI5cwA+A0Ig==
X-Google-Smtp-Source: 
 ABdhPJzTYu47WTsfE4jmx+wyKlP+pdv8h4AHAmqTrpugbQdMkklX/8HAQlc1kTVI8bPKRDOpEn3E7g==
X-Received: by 2002:a05:622a:1a0b:: with SMTP id
 f11mr919624qtb.329.1644266001596;
        Mon, 07 Feb 2022 12:33:21 -0800 (PST)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 d22sm5959736qkn.112.2022.02.07.12.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 12:33:21 -0800 (PST)
Date: Mon, 7 Feb 2022 15:33:19 -0500 (EST)
From: Scott Murray <scott.murray@konsulko.com>
To: Saul Wold <Saul.Wold@windriver.com>
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] create-spdx: Get SPDX-License-Identifier
 from source
In-Reply-To: <20220207192915.70095-1-saul.wold@windriver.com>
Message-ID: <5aebf892-1a3d-9647-3490-39242941653@spiteful.org>
References: <20220207192915.70095-1-saul.wold@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 20:33:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161466

On Mon, 7 Feb 2022, Saul Wold wrote:

> This patch will read the begining of source files and try to find
> the SPDX-License-Identifier to populate the licenseInfoInFiles
> field for each source file. This does not populate licenseConcluded
> at this time, nor rolls it up to package level.
>
> We read as binary file since some source code seem to have some
> binary characters, the license is then converted to ascii strings.
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
> v2: Updated commit message, and fixed REGEX based on Peter's suggetion
>
>  meta/classes/create-spdx.bbclass | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
> index 8b4203fdb5..588489cc2b 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -37,6 +37,24 @@ SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created f
>
>  do_image_complete[depends] = "virtual/kernel:do_create_spdx"
>
> +def extract_licenses(filename):
> +    import re
> +    import oe.spdx
> +
> +    lic_regex = re.compile(b'SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
> +
> +    try:
> +        with open(filename, 'rb') as f:
> +            size = min(15000, os.stat(filename).st_size)
> +            txt = f.read(size)
> +            licenses = re.findall(lic_regex, txt)
> +            if licenses:
> +                ascii_licenses = [lic.decode('ascii') for lic in licenses]
> +                return ascii_licenses
> +    except Exception as e:
> +        bb.warn(f"Exception reading {filename}: {e}")
> +    return None
> +
>  def get_doc_namespace(d, doc):
>      import uuid
>      namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
> @@ -232,6 +250,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
>                          checksumValue=bb.utils.sha256_file(filepath),
>                      ))
>
> +                if "SOURCE" in spdx_file.fileTypes:
> +                    extracted_lics = extract_licenses(filepath)
> +                    if extracted_lics:
> +                        spdx_file.licenseInfoInFiles = extracted_lics
> +
>                  doc.files.append(spdx_file)
>                  doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
>                  spdx_pkg.hasFiles.append(spdx_file.SPDXID)

IMO this seems like perhaps either going too far, or not far enough.  If
we go to the trouble to scan source files for explicit SPDX license
declarations, but do not go as far as pattern detection like the
meta-spdxscanner layer does with its use Scancode Toolkit
(https://github.com/nexB/scancode-toolkit), then it seems there's
more potential for giving users a false impression as to the completeness
of the resulting report/SBOM.  Perhaps that can be handled by making it
very clear that further scanning and auditing is still required in the
hopefully forthcoming create-spdx.bbclass documentation, but I can
imagine having to explain this to customers.

Scott




