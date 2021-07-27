Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.4954.1627408592467137862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 10:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ONQxDsrt;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id i1so16647811plr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bc18KF8Dntjqa79wYyjcldfv8VgaPhwcj28x1IDNWBc=;
        b=ONQxDsrtX6Kao1jg+5xmb6myfTMHv8tWcrxvIHjyHD2u6BVDCCNPLfdnxCT1n+85mX
         v/bZym8O20c73XodkWxYKXzBVeeZXEIr1kPyVxxB93fLDh6Hn/U8ytSWNp8S/7+oneFk
         HPGC6wyhgBv6mHCphNoS9Z9xxXAAxnTWRFpdn9QRN2nx899KSrmvS/HJ2ZACLMRbiUfB
         OVl37OHjjJbSg5nywTYEBW15wiBh1sKq2dVaa5aw8Ksz/3ytMxj3nt4rCRR61nSfBuTc
         sgBoFf8+KLNiskLOt1ZTf/Aomujz2ckTtj/aFNINdERJsMWRT0t6DTSdms/qDBgsRg1b
         T+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bc18KF8Dntjqa79wYyjcldfv8VgaPhwcj28x1IDNWBc=;
        b=fGt6gaayeJpV8wdfWlC7bUtKP1cbNrie4Ptvsvr1qpc1KJqIP1a2yWkHPUHcCxP/C0
         kLsVndtfjEsWkiJjWd5eLK9HvmMJCKp6a7tidiElRsasA6cjA0BXfbDMP/MdLzCDDxI3
         LQuqm1wmJtdNmIGnYO9xzra519jmDmbX+/RMor8PStLr06GvjFOxTnqRpXxyNYbBDLji
         movdxDV0ilrihEgO/FltRmEek7buVxZnT7Den1DPGxbEV8i3W9FIFuQL7djMdpyZ8L9W
         meBy+DrFjFV9VQ+BrO4C603EA/tFztLiu3IHsaGphblsNeVVk0UvD9EdUFpmgfp+e6qV
         9eIQ==
X-Gm-Message-State: AOAM532kN5NyWPXodgyHNVkudm7k295GgAzOlFn6ciY//UyWpSa7B8UI
	DMpsQsciznsxvnQ3JmlEcQGExVVhQoWlNw==
X-Google-Smtp-Source: ABdhPJwkUDqWCh8q3XWI0r9wJ4XOcHv2NTJz1xExsticQA+AOwOK52hfvP9Ez4cqo6UvgNLRo1TzUA==
X-Received: by 2002:a63:df14:: with SMTP id u20mr24593831pgg.348.1627408591394;
        Tue, 27 Jul 2021 10:56:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:4888:96cd:7ffd:e939? ([2601:646:9200:a0f0:4888:96cd:7ffd:e939])
        by smtp.gmail.com with ESMTPSA id e23sm3524893pjt.8.2021.07.27.10.56.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 10:56:30 -0700 (PDT)
Subject: Re: [OE-core] [master][PATCH 2/4] gcc: Backport patch to make LTO builds more reproducible
To: openembedded-core@lists.openembedded.org
References: <8230a75c-1d38-e82c-2ed6-1386e2d2bb4f@cybernetics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <97fed496-4e40-caf3-1bd6-41994907bfd2@gmail.com>
Date: Tue, 27 Jul 2021 10:56:29 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <8230a75c-1d38-e82c-2ed6-1386e2d2bb4f@cybernetics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/27/21 6:36 AM, Tony Battersby wrote:
> Backport ustream gcc patch that enables -fdebug-prefix-map to cover
> additional cases with LTO enabled to make LTO builds more reproducible.
> 
> [YOCTO #14481]
> 
> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> ---
>   meta/recipes-devtools/gcc/gcc-11.1.inc        |  1 +
>   ...prefix-maps-before-checksumming-DIEs.patch | 95 +++++++++++++++++++
>   2 files changed, 96 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtools/gcc/gcc-11.1.inc
> index c21242af58..167fddb65a 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
> @@ -72,6 +72,7 @@ SRC_URI = "\
>              file://0038-arc-Update-64bit-move-split-patterns.patch \
>              file://0039-arc-Fix-u-maddhisi-patterns.patch \
>              file://0040-arc-Update-doloop_end-patterns.patch \
> +           file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
>   "
>   SRC_URI[sha256sum] = "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
>   SRC_URI[backports.sha256sum] = "69274bebd6c069a13443d4af61070e854740a639ec4d66eedf3e80070363587b"
> diff --git a/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch b/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
> new file mode 100644
> index 0000000000..c8dcd74b9d
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
> @@ -0,0 +1,95 @@
> +From 7cc2df084b7977653a9b59cbc34a9ad500ae619c Mon Sep 17 00:00:00 2001
> +From: Richard Biener <rguenther@suse.de>
> +Date: Tue, 20 Jul 2021 11:00:33 +0200
> +Subject: [PATCH] debug/101473 - apply debug prefix maps before checksumming DIEs
> +
> +The following makes sure to apply the debug prefix maps to filenames
> +before checksumming DIEs to create the global symbol for the CU DIE
> +used by LTO to link the late debug to the early debug.  This avoids
> +binary differences (in said symbol) when compiling with toolchains
> +installed under a different path and that compensated with appropriate
> +-fdebug-prefix-map options.
> +
> +The easiest and most scalable way is to record both the unmapped
> +and the remapped filename in the dwarf_file_data so the remapping
> +process takes place at a single point and only once (otherwise it
> +creates GC garbage at each point doing that).
> +
> +2021-07-20  Richard Biener  <rguenther@suse.de>
> +
> +	PR debug/101473
> +	* dwarf2out.h (dwarf_file_data): Add key member.
> +	* dwarf2out.c (dwarf_file_hasher::equal): Compare key.
> +	(dwarf_file_hasher::hash): Hash key.
> +	(lookup_filename): Remap the filename and store it in the
> +	filename member of dwarf_file_data when creating a new
> +	dwarf_file_data.
> +	(file_name_acquire): Do not remap the filename again.
> +	(maybe_emit_file): Likewise.
> +
> +[YOCTO #14481]
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=7cc2df084b7977653a9b59cbc34a9ad500ae619c]


looks ok.


> +
> +The upstream patch was modified to compensate for the definition of
> +"struct dwarf_file_data" being in dwarf2out.c rather than dwarf2out.h in
> +this version of gcc.
> +
> +Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> +---
> +diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> +--- a/gcc/dwarf2out.c	2021-04-27 06:00:13.000000000 -0400
> ++++ b/gcc/dwarf2out.c	2021-07-23 16:40:06.141886167 -0400
> +@@ -1283,6 +1283,7 @@ dwarf2out_switch_text_section (void)
> +
> + /* Data about a single source file.  */
> + struct GTY((for_user)) dwarf_file_data {
> ++  const char * key;
> +   const char * filename;
> +   int emitted_number;
> + };
> +@@ -12334,7 +12335,7 @@ file_name_acquire (dwarf_file_data **slo
> +
> +   fi = fnad->files + fnad->used_files++;
> +
> +-  f = remap_debug_filename (d->filename);
> ++  f = d->filename;
> +
> +   /* Skip all leading "./".  */
> +   while (f[0] == '.' && IS_DIR_SEPARATOR (f[1]))
> +@@ -27231,13 +27232,13 @@ dwarf2out_ignore_block (const_tree block
> + bool
> + dwarf_file_hasher::equal (dwarf_file_data *p1, const char *p2)
> + {
> +-  return filename_cmp (p1->filename, p2) == 0;
> ++  return filename_cmp (p1->key, p2) == 0;
> + }
> +
> + hashval_t
> + dwarf_file_hasher::hash (dwarf_file_data *p)
> + {
> +-  return htab_hash_string (p->filename);
> ++  return htab_hash_string (p->key);
> + }
> +
> + /* Lookup FILE_NAME (in the list of filenames that we know about here in
> +@@ -27267,7 +27268,8 @@ lookup_filename (const char *file_name)
> +     return *slot;
> +
> +   created = ggc_alloc<dwarf_file_data> ();
> +-  created->filename = file_name;
> ++  created->key = file_name;
> ++  created->filename = remap_debug_filename (file_name);
> +   created->emitted_number = 0;
> +   *slot = created;
> +   return created;
> +@@ -27293,8 +27295,7 @@ maybe_emit_file (struct dwarf_file_data
> +       if (output_asm_line_debug_info ())
> + 	{
> + 	  fprintf (asm_out_file, "\t.file %u ", fd->emitted_number);
> +-	  output_quoted_string (asm_out_file,
> +-				remap_debug_filename (fd->filename));
> ++	  output_quoted_string (asm_out_file, fd->filename);
> + 	  fputc ('\n', asm_out_file);
> + 	}
> +     }
> 
> 
> 
> 
> 
