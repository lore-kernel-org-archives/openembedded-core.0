Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A52C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:00:02 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.2148.1739314798266195703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 14:59:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXVh9z8r;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so48707246d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 14:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739314797; x=1739919597; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0U60I78KBPbpgLOsWIJZGcJ54y4RDK6aFWw99P3qss=;
        b=fXVh9z8rBmn37zhHxc21p+1+ZrPVmgHy28waj1OTeTpypU9owFBVQ2fsR6+kBRdbcn
         zv3v2Jl9KJyFiQ/tyxy/FKo8ZK8bl/yU6ve70pO0BaPgAwbaz46lM6Qi5ky/u6sclP0J
         1Wvg+ko/J9THX+NMyACRbJsVCWuGVgCnkU6Y/aQB0xm590GIAygFWKBu2sEkHHz3I00d
         MD5P43rAvzLB3TTFb57lSDVZgfktJ0ksUIA2mokIXpO5E34AmjF6b1uz7BPRTK7x3gd0
         9MFUy5Dz6s6+8oE0RmUX03sYGp1hQC7cJtEet6b+I7pX060pLNQCsE6qQVpM2GX2dlx8
         foAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739314797; x=1739919597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0U60I78KBPbpgLOsWIJZGcJ54y4RDK6aFWw99P3qss=;
        b=Sdal+Y8UaQY94UK3DE90cPjuPeQG0iFypbqp/Oj0CKlV7o8GSeHqItyF7KweRHsemV
         iYpXggTTL3kPLEoIUgvxBj6epETpLJ57r7RYFMaLh7XF/jmPfJjsbmRsCo/oGScwACES
         rkLsG4XDYrSp8ZaGNwoqfSWnke6JzdhW6qyasPZf8Yvl435PeRCvcDD6BBnpLDnaepDn
         zYJGfXeY459/iYOeaEgbtzVh4MgKe//ew9bHf7fbEtO1/je8x4ibIeah585qxhHiGDu2
         l8Nf26cxO5B+RcnVnEePZCGq2HIhIDBJ2oalgFNnqluCjiidhJk6d3VKEbmuRBSYn9kl
         6aMw==
X-Gm-Message-State: AOJu0YyBAB7PXbuP7yBKjHS91Egdnqz3kQkr5Sa9aPQT4nl0G68zbRxQ
	WqAD2FOHhlRVcd6HMYEj1aBCSp1C6Pjxr2M0dEGUY2Lw6eDXhxgK
X-Gm-Gg: ASbGnctEPPOOwB5SYP8zefb2ESpLZN/1/b+KkpgRMvaHy7lGOgIEAz2SfbdFCoO39TS
	KXjUy4IDN8K2LNw5Mi93m9M/J3OysVtZDEr9KM/hNMfUIH5VSDpYa3KlsPgJOsEx0hrfL5vEPAL
	95HJ2hFsFBgY9Yqq+S5F3wP9dMOaKKUFla9XxRs/KMX3V2LFTEdMfkmWMoyQxrCUkX9JgEJ/MsO
	TryRdgIx8EleZyX9TA7tMzzGt6YUO/njcJHECJQxx1DNNDXDk+4gditkzTKZ/v1jio+BYwQYHcU
	Src1TsUYfBtXhn6egJoOcR8Dw3pCiS9lzlivCuHmrd0DH7WNPuD4TdwZPbd/xWVPYfd+CA==
X-Google-Smtp-Source: AGHT+IGnEwLfRl6Wul5q5m92wVIRR0gltUi0ZLsipE+/domKUz0ImX+e1ZPjx4045e9ESi0nVsA5vg==
X-Received: by 2002:a05:6214:518f:b0:6e4:6ef7:b5fc with SMTP id 6a1803df08f44-6e46f8795c7mr7548126d6.14.1739314797256;
        Tue, 11 Feb 2025 14:59:57 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44df787e8sm52202516d6.113.2025.02.11.14.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:59:56 -0800 (PST)
Date: Tue, 11 Feb 2025 17:59:55 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: stefan.herbrechtsmeier-oss@weidmueller.com
Cc: openembedded-core@lists.openembedded.org,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: Re: [OE-core] [RFC PATCH 18/30] classes: add vendor class for go
Message-ID: <Z6vWayPuHfEIrzEF@gmail.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-18-stefan.herbrechtsmeier-oss@weidmueller.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211150034.18696-18-stefan.herbrechtsmeier-oss@weidmueller.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 23:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211197

In message: [OE-core] [RFC PATCH 18/30] classes: add vendor class for go
on 11/02/2025 Stefan Herbrechtsmeier via lists.openembedded.org wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Add a vendor class for go to resolve the dependency SRC_URIs from a
> go.sum file and run populate the go mod vendor folder.
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
> 
>  meta/classes-recipe/vendor_go.bbclass | 59 +++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 meta/classes-recipe/vendor_go.bbclass
> 
> diff --git a/meta/classes-recipe/vendor_go.bbclass b/meta/classes-recipe/vendor_go.bbclass
> new file mode 100644
> index 0000000000..dc5f8d1d8d
> --- /dev/null
> +++ b/meta/classes-recipe/vendor_go.bbclass
> @@ -0,0 +1,59 @@
> +# Copyright (C) 2025 Weidmueller Interface GmbH & Co. KG
> +# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +# The directory of the go.mod file relative to the root directory, per default
> +# assume there's a file directly in the root directory
> +GO_SRC_DIR ?= ""
> +
> +# The path to the go.mod file
> +GO_MANIFEST_DIR ?= "${GO_SRC_PATH}/go.mod"
> +
> +# The path to go.sum file
> +GO_LOCK_DIR ?= "${@os.path.join(os.path.dirname(d.getVar('GO_MANIFEST_DIR')), 'go.sum')}"
> +
> +# The URL of the go proxy
> +GO_PROXY ?= "https://proxy.golang.org"
> +
> +GO_SRC_PATH = "${S}/${GO_SRC_DIR}"
> +GO_SRC_SUBDIR = "${@os.path.relpath(d.getVar('CARGO_SRC_PATH'), d.getVar('WORKDIR'))}"
> +GO_SRC_URI_FILE = "${VENDOR_DIR}/go-source-uris.txt"
> +SRC_URI_FILES:append = " ${GO_SRC_URI_FILE}"
> +
> +inherit go-mod vendor
> +
> +GO_INSTALL_PREFIX = "."
> +GO_SRC_PATH = "${S}"
> +GO_SRCURI_DESTSUFFIX = ""
> +
> +GOMODCACHE = "invalid"
> +GO_MOD_CACHE_DIR = "go/pkg/mod"
> +GO_WORKPATH = "${GO_SRC_PATH}"
> +GO_MOD_RECRDEPTASK = ""
> +
> +GOBUILDFLAGS:append = " -mod=vendor"
> +
> +python vendor_go_do_vendor_resolve() {
> +    import oe.vendor
> +    import oe.vendor.go
> +
> +    lock_file_dir = d.getVar("GO_LOCK_DIR")
> +    lock_file_subdir = get_early_source_dir(d, lock_file_dir)
> +    proxy = d.getVar("GO_PROXY")
> +    cache_subdir = d.getVar("GO_MOD_CACHE_DIR")
> +    src_uris = oe.vendor.go.resolve_src_uris(lock_file_subdir, proxy, cache_subdir)
> +    with open(d.getVar("GO_SRC_URI_FILE"), "w") as f:
> +        oe.vendor.dump(f, src_uris)
> +}
> +
> +run_go_mod_vendor() {
> +    cd ${GO_SRC_PATH}
> +    export GOMODCACHE="${UNPACKDIR}/${GO_MOD_CACHE_DIR}"
> +    ${GO} mod vendor

What happens if a module isn't in the unpackdir ? I assume it goes
to the go infrastructure and fetches the module ? Or is it
impossible for one to not be in the cache (i.e. is it
always fully pre-poulated via the vendor_go_do_vendor_resolve ?)

It is unclear to me how the vendor'd modules get into an archive
that can be saved for future reproducible builds (can you point
me at that glue?).

Bruce

> +}
> +do_unpack[postfuncs] += "run_go_mod_vendor"
> +do_unpack[depends] += "${@oe.utils.build_depends_string(d.getVar('DEPENDS_GOLANG'), 'do_populate_sysroot')}"
> +
> +EXPORT_FUNCTIONS do_vendor_resolve
> -- 
> 2.39.5
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211143): https://lists.openembedded.org/g/openembedded-core/message/211143
> Mute This Topic: https://lists.openembedded.org/mt/111123541/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


