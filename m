Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1055D60CEC
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:52:35 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.5830.1731966747893653628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eGxe7IkK;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso33363731fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 13:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731966746; x=1732571546; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwygE7mR/aKMzEFfgjV/h+sXIUKvDyC9yDD4Soqkafc=;
        b=eGxe7IkKydn74e4NDyJZ6rf/vncIwtruKFC4Wp24FNY7G05D349HQgk3UHfArADZe5
         c4IawvEcAMt/f166OuKcLQ5M2KtQIub+0IDcNAaOseGRm5s7cfHS1YcyemDKyaaQyo48
         w0FM/bt8pWXX6DRZaVpTxjggXGPEgJcUlX3YlGMPKNpWO8GnrKa80xbQQzqBOwwe16X1
         NUMb/2TPjiNFzLZrpfG6fphBT3ALd6CMGGHracJd5EAEjRbOvDgOMFMD+bEufpTV/qKC
         taKmq0Jew/Kv4pr31z8gZIUyfsMyPR53XqHhWxIAMehmW3HPCyjEjIY3NmwA9LmtMtR0
         9Q/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731966746; x=1732571546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwygE7mR/aKMzEFfgjV/h+sXIUKvDyC9yDD4Soqkafc=;
        b=i4hS63g9Q8hhjDVOuiUn9+cI74U8LiBZ0CigbVWo8WMj/jau7x7kpM5bJZHT/K+fV9
         8/BmQA9yYzhp1+OsavAlAjVrBeevchzgDgZTeK/rrQ/otaVpR5kBeZghAyPyY4AAwOK8
         uV9Pk8SQh3tLHsf0Jh25tSK5vb53+ebQfsEwlaTLlSKgpsJcyAoWHhacLUUvXaxL+fVo
         OxNK//to0xE6kE/6QkcrFHc16gpYTcpusvTgaoMQAPQJCYhSqAI0N5iWjieNA3xTiaMu
         RUomJnlYoT3JzcUHZUGCbfDcOURvc/6n9wMrf6AlVoh2CXIcVDxI6Fn8jyFSrG9kyh1k
         PPXA==
X-Gm-Message-State: AOJu0Yz7CDqpRTHyG4meVKidpSozUXtiNyKtATG8FFP1gZcJd8qd4mXU
	hoFk2xLP5ZQZBFala97wb9hCZd8xNHQvEd24g1kxcCkM15hBW/3runD69K51keiQheNOch0fGgB
	HUdrganumVniaOGNgWGv+ijy6gXbX3g==
X-Google-Smtp-Source: AGHT+IFOry9fzR8ft3V8a7n/pBsvC5w5F355aib+UC8QEI19RZPbFu95Ha9RMYxpFrwojRb/Yqws9dXqZwkOjKCrxoE=
X-Received: by 2002:a05:651c:2228:b0:2fa:d84a:bda5 with SMTP id
 38308e7fff4ca-2ff60610792mr81823421fa.7.1731966745689; Mon, 18 Nov 2024
 13:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20241110030741.4108407-1-hongxu.jia@windriver.com>
In-Reply-To: <20241110030741.4108407-1-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 18 Nov 2024 14:52:13 -0700
Message-ID: <CAJdd5GZK-Ed68dDg8JiQ5eE1KFgwuV1+a1xnNmansmShBB4zSA@mail.gmail.com>
Subject: Re: [PATCH 1/3] sbom30.py: reduce redundant spdxid-hash symlinks to
 save inode on host
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207374

I think what you are trying to get at here is that the same file is
present in multiple different "packages", so all references are
equally interchangeable?

I'm fine if we can figure out a reasonable way to do that, but I don't
think this is the correct approach. A better option would be to simple
reference the SPDX ID of the previously described file instead of
making a new one each time. I don't really like "magic" in the
jsonld_hash_path() which really hides what we are actually after (only
creating a single file element and referencing it multiple times).

This would also conveniently solve the license problem since only one
file element would be created per hash.

However, I think the reason it's done in the manner it is, is because
each instance of the file is in a different path, so you'd lose that
information by combining them all into the same file element;
although, you might still be able to deduplicate the license
information

On Sat, Nov 9, 2024 at 8:07=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.com=
> wrote:
>
> In order to support all in-scope SPDX data within a single
> JSON-LD file for SPDX 3.0.1, Yocto's SBOM:
> - In native/target/nativesdk recipe, created spdxid-hash symlink
>   for each element to point to the JSON-LD file that contains
>   element details;
> - In image recipe, use spdxid-hash symlink to collect element
>   details from varies of JSON-LD files
>
> While SPDX_INCLUDE_SOURCES =3D "1", it adds sources to JSON-LD file
> and create 2N+ spdxid-hash symlinks for N source files.
> (N for software_File, N for hasDeclaredLicense's Relationship)
>
> For large numbers of source files, adding an extra symlink -> real file
> will occupy one more inode (per file), which will need a slot in
> the OS's inode cache. In this situation, disk performance is slow
> and inode is used up quickly
>
> While using function add_package_files to add source files to JSON-LD fil=
e,
> the spdxid-hash symlinks for source files point to the same JSON-LD file,
> then according to the format of spdxId
>
> - spdxId of souce file:
> http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/0838=
759b8d71923d250a0813dda7356ffd309576115bbf8ed7e266cf4aed86a5/sourcefile/1
>
> Remove the count number ('/1') from spdxId suffix, then all
> source files in one recipe will share one spdxid-hash symlink.
>
> The same reason to sysroot and package files
>
> - spdxId of sysroot file:
> http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/0838=
759b8d71923d250a0813dda7356ffd309576115bbf8ed7e266cf4aed86a5/sysroot/1
>
> - spdxId of pacakge file:
> http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/0838=
759b8d71923d250a0813dda7356ffd309576115bbf8ed7e266cf4aed86a5/package/shadow=
-src/file/1
>
> Build core-image-minimal with/without this commit, comparing the spdxid-h=
ash number, 7 281 824 -> 70 508
>
> echo 'SPDX_INCLUDE_SOURCES =3D "1"' >> local.conf
>
> With this commit:
> $ time bitbake core-image-minimal
> real    95m6.960s
> user    0m22.832s
> sys     0m4.087s
>
> $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash/ -name "*.spdx.json" |wc -l
> 70508
>
> Without this commit:
> $ time bitbake core-image-minimal
> real    100m17.769s
> user    0m24.516s
> sys     0m4.334s
>
> $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name "*.json" |wc -l
> 7281824
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index e3a9428668..4efeaae3a0 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -911,6 +911,10 @@ def jsonld_arch_path(d, arch, subdir, name, deploydi=
r=3DNone):
>
>
>  def jsonld_hash_path(_id):
> +    # For the spdId added by add_package_files, remove suffix count numb=
er
> +    if re.match(r".*/(sourcefile|sysroot|file)/\w+$", _id):
> +        _id =3D os.path.dirname(_id)
> +
>      h =3D hashlib.sha256(_id.encode("utf-8")).hexdigest()
>
>      return Path("by-spdxid-hash") / h[:2], h
> @@ -992,6 +996,11 @@ def write_recipe_jsonld_doc(
>              *hash_path,
>              deploydir=3Ddeploydir,
>          )
> +
> +        # Return if expected symlink exists
> +        if link_name.is_symlink() and link_name.resolve() =3D=3D dest:
> +            return hash_path[-1]
> +
>          try:
>              link_name.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
>              link_name.symlink_to(os.path.relpath(dest, link_name.parent)=
)
> --
> 2.25.1
>

