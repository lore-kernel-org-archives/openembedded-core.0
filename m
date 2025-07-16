Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2251C83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:28:14 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.18175.1752658090753882513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VBXFpkjt;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b16a0e38so6662238e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 02:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752658089; x=1753262889; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CeA44/yIp5CLiMt1wZ6mYgUqBGdNr1zpx0M9WDKQbGc=;
        b=VBXFpkjt6JYjMzdga/VA9I3D/nExkSn3v2wl9g+t327jioO3Cqohnh00XZ0iQ0lt91
         MYPS2nJRv6ZfPR7RuzSpapA+Qgl2kIBlTyvwDjzK1ovOZOcIP13inFTWDep4HAuTyhf8
         ayXOnV9JewXBuIRvnrapYY/Xe2n+eZFZ18D4XHx1CqsXpHCYlTdALQjn29S5eYySLzJG
         4ciH3YyhMiwwQgeAH0UTpErEdQvGzmRaW6Hb66Yvwz01LdjOoVm/B+dqNtanO3EnpxB1
         RyWR5LmlsgEHc+pRDuvsYgvYMXacVtOnYeluHjMq9Vhn+SMbg5nDqH2fO+bKIeixH1AK
         ivow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752658089; x=1753262889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CeA44/yIp5CLiMt1wZ6mYgUqBGdNr1zpx0M9WDKQbGc=;
        b=aKYezYj+0D8quopdqK7Y1+UFhcemwtw5PxnGTY71V0HnDxWyQL9Jpr2fd0JYkVXFnX
         AZ3Qx9GPqpWV06biN8+uJLt5eZPxBH0hHRKYHNBeVHaA6txhZGUCZS0pYtLGSfUkkKHv
         7apM1fr/mj2dRQdmyBWE8ZFKS5XSUDVKk1vdF9HhSYQn2wpIOHVN7NWEsOwKd1ujDSp1
         7SV/Azht+3ikWmsEs00QRnUcbyRa4No4el2jYcSDS/15fxDe7GK5Q/XG1mnVOF9lZWMU
         iNmAEh27m+4CyWj7FumlkK1Cdv6luLOUsrm5F+mHe42CSAGzE8R1pYwY41vJgPbSvL1f
         kd3Q==
X-Gm-Message-State: AOJu0YwkSshfZJucgxxCDZ0UP6Kj3IdhqAw/wOkG36XlWaVrbR9zwR5E
	33ApcumlRDzp1SkpPkGEBaU+V4pwpVjV7vBKF1e/0eLaigpUvljtR1YohJvQ5BENpDk=
X-Gm-Gg: ASbGncuU9oiO6e1+P9BDX0/FZu3AqHSev+Ts4YzxZJJCNTWGGpU3gng1DdTdcG1MGR1
	tsbVDHfahdDmZ3Xv6csW/CZMunv4UQSo+mwUVkQOi9rzoS1nEvsgPNZZ3wSFJXlom2L+YoIIiCC
	BlKrS4NwvmIRUSsmq2IddKgAee5DuzIHCPX0F+CTq22qezLMGMHAoGF+sUtTSQtHx90iLaaXjSD
	VbnEBfXabKDOs1GN7ZfahOn883ezvajKul8ChypaIN5kS5KIGmbj+Et1BHSuvdLDskLQK62QEbj
	h8hkTpBpcVNuFFr+wCh7XVqoD0Y0eg6zAFdPqGkijDxBS+Ht0ZdDWwasMeJJygeoynVGx2bdnKS
	PZRmvrI8lzGyeIKkWi+E92xx7VcREuogcHxWy3FFBLqVi0QJCjSfYL88=
X-Google-Smtp-Source: AGHT+IH7tf4vQodJHoldWivs5RJMgKxwp2jf+HChJ7zDjRNWJ2lJzeUgL9cgO+DT2hsB/MiCpxR79w==
X-Received: by 2002:a05:6512:1086:b0:553:2c01:ff44 with SMTP id 2adb3069b0e04-55a232ff9ecmr799870e87.2.1752658088698;
        Wed, 16 Jul 2025 02:28:08 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d2f89sm2573249e87.115.2025.07.16.02.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:28:08 -0700 (PDT)
Date: Wed, 16 Jul 2025 12:28:06 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: kamel.bouhara@bootlin.com
Cc: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com, mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com
Subject: Re: [OE-core] [PATCH 1/1] spdx3: Add optional kernel configuration
 export to build_parameter for virtual/kernel
Message-ID: <aHdwpmxe3-5x1P1e@nuoska>
References: <20250716090517.481832-1-kamel.bouhara@bootlin.com>
 <20250716090517.481832-2-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716090517.481832-2-kamel.bouhara@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 09:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220440

Hi,

On Wed, Jul 16, 2025 at 11:05:17AM +0200, Kamel Bouhara via lists.openembedded.org wrote:
> Enhances SPDX Document by extracting kernel build-time configuration settings from '${B}/.config'.
> 
> Each CONFIG_* line is parsed and exported as a DictionaryEntry in the build_Build.build_parameter
> section of the SPDX document. This provides better visibility into kernel build behavior and
> configuration, in alignment with the SPDX3 metadata model.
> 
> The feature is gated by a new tunable variable:
> 
>     SPDX_INCLUDE_KERNEL_CONFIG (default: "1")
> 
> Setting this to "0" disables exporting the kernel configuration, which may be useful to improve
> performance or reduce the size of generated SPDX documents.
> 
> Example:
> 
>     CONFIG_FOO=y  →  { key: "CONFIG_FOO", value: "y" }
> 
> This complements existing metadata export features and enables a more complete audit trail of how
> the kernel is built within a given build.

Why is the kernel so special? All other SW components have build time configs too.

For information harvesting, a lot of data can be extracted from the build system
but to me it's important that the build system and tools benefit the users
who actually do maintenance and development work. They need to be able to see
what patches get applied, what they fix, what configs are used etc. Extracting
all possible info into some IT management tooling which never directly feeds
back to the build system or developers to actually improve the CVE patch status,
enable security features and updates and fixes for real bugs, is not very useful.

If some information is in the build system, then developers can read it from there
also when doing reviews and audits. For kernel, the -dev binary package has the
effective config after build has completed.

Cheers,

-Mikko

> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass |  6 ++++++
>  meta/lib/oe/spdx30_tasks.py          | 32 ++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
> index c0a5436ad6..cdb9422f37 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -50,6 +50,12 @@ SPDX_INCLUDE_TIMESTAMPS[doc] = "Include time stamps in SPDX output. This is \
>      useful if you want to know when artifacts were produced and when builds \
>      occurred, but will result in non-reproducible SPDX output"
>  
> +SPDX_INCLUDE_KERNEL_CONFIG ??= "1"
> +SPDX_INCLUDE_KERNEL_CONFIG[doc] = "If set to '1', the .config file for the kernel will be parsed \
> +and each CONFIG_* value will be included in the Build.build_parameter list as DictionaryEntry \
> +items. Set to '0' to disable exporting kernel configuration to improve performance or reduce \
> +SPDX document size."
> +
>  SPDX_IMPORTS ??= ""
>  SPDX_IMPORTS[doc] = "SPDX_IMPORTS is the base variable that describes how to \
>      reference external SPDX ids. Each import is defined as a key in this \
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index c352dab152..f87d079cb0 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -18,6 +18,28 @@ from contextlib import contextmanager
>  from datetime import datetime, timezone
>  from pathlib import Path
>  
> +def parse_kernel_config(config_path):
> +    entries = []
> +    if not os.path.exists(config_path):
> +        bb.warn(f"Kernel config file not found at: {config_path}")
> +        return entries
> +
> +    try:
> +        with open(config_path, 'r') as f:
> +            for line in f:
> +                line = line.strip()
> +                if not line or line.startswith("#"):
> +                    continue
> +                if "=" in line:
> +                    key, value = line.split("=", 1)
> +                    entries.append(oe.spdx30.DictionaryEntry(
> +                        key=key,
> +                        value=value.strip('"')
> +                    ))
> +        bb.note(f"Parsed {len(entries)} kernel config entries from {config_path}")
> +    except Exception as e:
> +        bb.error(f"Failed to parse kernel config file: {e}")
> +    return entries
>  
>  def walk_error(err):
>      bb.error(f"ERROR walking {err.filename}: {err}")
> @@ -495,6 +517,8 @@ def create_spdx(d):
>  
>      build_objset.doc.rootElement.append(build)
>  
> +    build.build_parameter = []
> +
>      build_objset.set_is_native(is_native)
>  
>      for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").split():
> @@ -815,6 +839,14 @@ def create_spdx(d):
>              sorted(list(build_inputs)) + sorted(list(debug_source_ids)),
>          )
>  
> +    if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) != "0":
> +        if "virtual/kernel" in (d.getVar("PROVIDES") or "").split():
> +            bb.note("Detected virtual/kernel provider, extracting kernel configuration")
> +            config_path = d.expand("${B}/.config")
> +            kernel_params = parse_kernel_config(config_path)
> +            if kernel_params:
> +                build.build_parameter.extend(kernel_params)
> +
>      oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", deploydir)
>  
>  
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220439): https://lists.openembedded.org/g/openembedded-core/message/220439
> Mute This Topic: https://lists.openembedded.org/mt/114181881/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


