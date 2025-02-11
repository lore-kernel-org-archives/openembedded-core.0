Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD390C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 22:32:51 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.1535.1739313168729764595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 14:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JR3Tcprx;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7be8f28172dso366580785a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 14:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739313168; x=1739917968; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iF3hX3tzjYrGBgQjs1o5PWJPqRCTWBIt6C9XiCOD5Eo=;
        b=JR3Tcprx0eCKmy8av0craNpLcblFEYXNyzfltj+ORYmFid2WsRc5610zqKJpLiv8eP
         VviMj75qWgid90M3GJZkGR5nNh7mbduRLZRXIJG+6w9wsS2YUGB803y1IpvzM4n5y1YV
         hcsBnJ38i0JJaIIDPEF8nQ9yITbtAaB0cPidEYZSsxFC/RQ9atdUfpN3sf/P3TvMEl30
         O5zu8PK28WjYNvT/slfkCuJyRGJZj5QuR377uKQH5I7OZIToJ50srKgqeDRaRjCvcLUN
         VYOekGdRp28UF+MRVF/bBosO0YlJ2s4382tCTatTC3BtGHXtYz6TTAAn5Dy4Hu1szOT0
         GJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739313168; x=1739917968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iF3hX3tzjYrGBgQjs1o5PWJPqRCTWBIt6C9XiCOD5Eo=;
        b=wOSaBhvHHC8KMRoUrNNqZoHA5TEF9tcvIgHbOyWRT+xhAOfYL2cFoeYMqJaI8MBaiC
         7vfeOZ004WR64nIhVvlFhLoMOaw1RcLNkmcAqwBEzJPaQxicbWWHoPNJU5pPDFaZXl78
         63vxZ9SvGV3IjrmtQIsFqYXCL9QZmkA7n3eEDKyC3Z4b8M0wPWgeIckyrx8VUZn3MMKj
         TBtpgwc9xtzmO8yz3VC3mMjWl8fwmsFMgQIG5v6dnW61Ls2vVGBIMfHIHUM4kJ213N/8
         +CeyAMojKpkjO49SegkMM++X/XQTzLUI2hqjNRj7R9lADNtR1E/ZFCIjlLp8LXDjWb/1
         cv8g==
X-Gm-Message-State: AOJu0Yw2TfjvUVUf4cGfaaOV09DqqoQsG9DVpWj9QuTHmFmXAAEtF+lS
	0uwliPjEtFM5EsHZz90d91gertCib3CTnlwxyGiGMBeJzuJSzZes
X-Gm-Gg: ASbGnctC9MdVb+ciJABMQejpKbCFnKRS2Hn2yt2skygpfpbCxQicir9as/xWVarTdIt
	FHsr5407HLdje4ls43QqbMKMxoB/CxEMjBxV6N+y4q306SJFfcco2KQoBh9QaTtWaPW3i6IHB6l
	ZIiiGLaetKa6sjoGW4Cu/vNi81uQ9nTNdtrX3jRZo/Byf8JVD7xSqKSrE55R7+mi5V1ZaMFL7T9
	zfzgplBkX6vEVItkLYuHJyV7OEnm4fUQm3pt04Vb/R6QSE/2BZSHg8/P22RLumH5VgJDkhpQfjK
	A/cmXhLj0TW1MiF1imLYY6J528ns1PI5T7JVSBtuOKUeK0ZwLXT6YwOmEwv1Lt/+OEEiQg==
X-Google-Smtp-Source: AGHT+IFOJIWPjY4ZBOuLwKtF7qVyAVQnqrCOYXXeG02+QWHzRnIMj+5jia/rd9E9QVnjzfhC7A/Ziw==
X-Received: by 2002:a05:620a:4621:b0:7c0:60d5:77da with SMTP id af79cd13be357-7c06fc6c032mr147964785a.15.1739313167430;
        Tue, 11 Feb 2025 14:32:47 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041debe6bsm732124085a.15.2025.02.11.14.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:32:46 -0800 (PST)
Date: Tue, 11 Feb 2025 17:32:45 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: stefan.herbrechtsmeier-oss@weidmueller.com
Cc: openembedded-core@lists.openembedded.org,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: Re: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and
 patch support
Message-ID: <Z6vQDT6LkF9JMQ+S@gmail.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 22:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211196

In message: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and patch support
on 11/02/2025 Stefan Herbrechtsmeier via lists.openembedded.org wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Add support for early fetch, unpack and patches task which run before
> normal patch task. This feature is useful to fetch additional
> dependencies based on a patched source before the normal unpack and
> patch tasks. The patch are marked as early via an early=1 parameter. An
> example use case is a patch for a package manager lock file (Cargo.lock,
> go.sum, package-lock.json).

I understand why you need to do the above, but there's now multiple
fetch and patch tasks running throughout the pipeline of the
build and that's just more complexity to maintain.

This is what I was asking about in some of my first replies
to the RFC series. When I've done this in the past, I'd just
suggest something simpler like the recipe provide a complete
"lock file" in the layer/recipe-space and have it overlayed
in the source.

Of course that means it is in the same fetch task as what
will be fetching the vendor bits, but coordinating within
the single task is simpler in my experience (and it can
be checked on the SRC_URI). I haven't fully thought through
how to manage it, but wanted to reply to this while it was
fresh in my mind.

Bruce

> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
> 
>  meta/classes-global/patch.bbclass | 17 +++++----
>  meta/classes-recipe/early.bbclass | 61 +++++++++++++++++++++++++++++++
>  meta/lib/oe/patch.py              | 10 +++--
>  3 files changed, 77 insertions(+), 11 deletions(-)
>  create mode 100644 meta/classes-recipe/early.bbclass
> 
> diff --git a/meta/classes-global/patch.bbclass b/meta/classes-global/patch.bbclass
> index e5786b1c9a..7fa94c7aa7 100644
> --- a/meta/classes-global/patch.bbclass
> +++ b/meta/classes-global/patch.bbclass
> @@ -82,18 +82,18 @@ python patch_task_postfunc() {
>              oe.patch.GitApplyTree.commitIgnored("Add changes from %s" % func, dir=srcsubdir, files=['.'], d=d)
>  }
>  
> -def src_patches(d, all=False, expand=True):
> +def src_patches(d, all=False, expand=True, early=False):
>      import oe.patch
> -    return oe.patch.src_patches(d, all, expand)
> +    return oe.patch.src_patches(d, all, expand, early)
>  
> -def should_apply(parm, d):
> +def should_apply(parm, d, early=False):
>      """Determine if we should apply the given patch"""
>      import oe.patch
> -    return oe.patch.should_apply(parm, d)
> +    return oe.patch.should_apply(parm, d, early)
>  
>  should_apply[vardepsexclude] = "DATE SRCDATE"
>  
> -python patch_do_patch() {
> +def apply_patches(d, s, early=False):
>      import oe.patch
>  
>      patchsetmap = {
> @@ -113,8 +113,6 @@ python patch_do_patch() {
>  
>      classes = {}
>  
> -    s = d.getVar('S')
> -
>      os.putenv('PATH', d.getVar('PATH'))
>  
>      # We must use one TMPDIR per process so that the "patch" processes
> @@ -124,7 +122,7 @@ python patch_do_patch() {
>      process_tmpdir = tempfile.mkdtemp()
>      os.environ['TMPDIR'] = process_tmpdir
>  
> -    for patch in src_patches(d):
> +    for patch in src_patches(d, early=early):
>          _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
>  
>          if "patchdir" in parm:
> @@ -159,6 +157,9 @@ python patch_do_patch() {
>  
>      bb.utils.remove(process_tmpdir, True)
>      del os.environ['TMPDIR']
> +
> +python patch_do_patch() {
> +    apply_patches(d, d.getVar('S'))
>  }
>  patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
>  
> diff --git a/meta/classes-recipe/early.bbclass b/meta/classes-recipe/early.bbclass
> new file mode 100644
> index 0000000000..e458fd8f7b
> --- /dev/null
> +++ b/meta/classes-recipe/early.bbclass
> @@ -0,0 +1,61 @@
> +# Copyright (C) 2025 Weidmueller Interface GmbH & Co. KG
> +# Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> +#
> +# SPDX-License-Identifier: MIT
> +
> +EARLY_UNPACKDIR = "${WORKDIR}/sources-unpack-early"
> +
> +def get_early_source_dir(d, sourcedir):
> +    unpackdir = d.getVar("UNPACKDIR")
> +    workdir = d.getVar('WORKDIR')
> +    originaldir = unpackdir if sourcedir.startswith(unpackdir) else workdir
> +    early_unpackdir = d.getVar("EARLY_UNPACKDIR")
> +    return sourcedir.replace(originaldir, early_unpackdir)
> +
> +python early_do_fetch_early() {
> +    fetch_src_uris(d, True)
> +}
> +addtask fetch_early
> +do_fetch_early[dirs] = "${DL_DIR}"
> +do_fetch_early[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
> +do_fetch[prefuncs] += "fetcher_hashes_dummyfunc"
> +do_fetch_early[network] = "1"
> +
> +python early_do_unpack_early() {
> +    unpackdir = d.getVar("EARLY_UNPACKDIR")
> +    unpack_src_uris(d, unpackdir, True)
> +}
> +addtask unpack_early after do_fetch_early
> +do_unpack_early[cleandirs] = "${EARLY_UNPACKDIR}"
> +
> +python early_do_patch_early() {
> +    source_dir = d.getVar("S")
> +    source_dir = get_early_source_dir(d, source_dir)
> +    apply_patches(d, source_dir, True)
> +}
> +addtask patch_early after do_unpack_early
> +do_patch_early[dirs] = "${WORKDIR}"
> +do_patch_early[depends] = "${PATCHDEPENDENCY}"
> +do_patch_early[vardepsexclude] = "PATCHRESOLVE"
> +
> +python () {
> +    import bb.fetch
> +    src_uris = get_src_uris(d, True)
> +    for src_uri in src_uris:
> +        uri = bb.fetch.URI(src_uri)
> +        path = uri.params.get("downloadfilename", uri.path)
> +
> +        # HTTP/FTP use the wget fetcher
> +        if uri.scheme in ("http", "https", "ftp"):
> +            d.appendVarFlag('do_fetch_early', 'depends', ' wget-native:do_populate_sysroot')
> +
> +        # Git packages should DEPEND on git-native
> +        elif uri.scheme in ("git", "gitsm"):
> +            d.appendVarFlag('do_fetch_early', 'depends', ' git-native:do_populate_sysroot')
> +
> +        # *.xz should DEPEND on xz-native for unpacking
> +        if path.endswith('.xz') or path.endswith('.txz'):
> +            d.appendVarFlag('do_fetch_early', 'depends', ' xz-native:do_populate_sysroot')
> +}
> +
> +EXPORT_FUNCTIONS do_fetch_early do_unpack_early do_patch_early
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 58c6e34fe8..7737011e5a 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -904,7 +904,7 @@ def patch_path(url, fetch, unpackdir, expand=True):
>  
>      return local
>  
> -def src_patches(d, all=False, expand=True):
> +def src_patches(d, all=False, expand=True, early=False):
>      unpackdir = d.getVar('UNPACKDIR')
>      fetch = bb.fetch2.Fetch([], d)
>      patches = []
> @@ -921,7 +921,7 @@ def src_patches(d, all=False, expand=True):
>          parm = urldata.parm
>          patchname = parm.get('pname') or os.path.basename(local)
>  
> -        apply, reason = should_apply(parm, d)
> +        apply, reason = should_apply(parm, d, early)
>          if not apply:
>              if reason:
>                  bb.note("Patch %s %s" % (patchname, reason))
> @@ -950,8 +950,12 @@ def src_patches(d, all=False, expand=True):
>      return patches
>  
>  
> -def should_apply(parm, d):
> +def should_apply(parm, d, early=False):
>      import bb.utils
> +
> +    if early and not bb.utils.to_boolean(parm.get('early'), False):
> +        return False, "applies to normal patch task only"
> +
>      if "mindate" in parm or "maxdate" in parm:
>          pn = d.getVar('PN')
>          srcdate = d.getVar('SRCDATE_%s' % pn)
> -- 
> 2.39.5
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211141): https://lists.openembedded.org/g/openembedded-core/message/211141
> Mute This Topic: https://lists.openembedded.org/mt/111123537/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


