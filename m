Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1DC7DBD1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 21:44:15 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id a46so3734953uae.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 14:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FBGgJfQFkKlRBvylM3H+P5hNDSiclqx15qsX0Kg0YnM=;
	b=RugtCW3xQGOz1oSFdpRQjDA7BG5lFK8m50DP7lff89ioqK5nPPur3Jd+h8ptpD7BZV
	iGmGwKGiWFZiMs2YjXAfgsWiEAuRO4HLJXTxbV9x/osTC5eagFIKYBhCwrm+FNpgEBXD
	+oHGd8oypQeQZV7PWnl5QhYMCePfvTpUxGOXGRo9N4OeOFv1f4FhXCKwgtVN3iHrCgGU
	4yC61WBZw+gT8+kfYBlOHbcXaOR/qZjrjLS3DH51fFmo4JwrCUh/yApp0LOgBIIcSnCs
	20XVhBKeXUMJGnrfCapjrVljV43x4sd+ehc9+x5/S1uMqz06xoRoiXikgqP2t3xNJRzI
	LZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FBGgJfQFkKlRBvylM3H+P5hNDSiclqx15qsX0Kg0YnM=;
	b=r05X29YFdqewBXnjkRofNC6rJ4QPWUDMnHvaEWb+qOMAYxSFxpEpz3vj68+hzRkDlu
	AYXI5fb1//bzDxAJXBSgsqUll2lYu80ex7zuhznlaaAbCsOXETIODJauuRwBljFlaX34
	2Ma/V+8n9gqPYKek/K3mSAC5oe36pEPCQ0YD+ZCIwypaY5XbHOc/FXWP0jdB+PgIO+is
	wIYuYp87ucX7mdH1voCWlRjGfSkLFUQgl4czrv6Ds+5GQZsB0LZxj6+G64VwNTofdsNG
	uCtcqxs6T46stw6jTfdVD45n/lYZb9CCmU8AAbjiNd1FSanUEnBNsBtzN0zzMmYEDJut
	F7RA==
X-Gm-Message-State: APjAAAXd9EkJ7jrHaCWuIsWEbS5wI17C+iUNtmlLJ3Gwtve0cmP0Y22l
	MOY8LHNvEZUIHGpi0XdDGVwNdZdjMQJ4VLopI169ha0L
X-Google-Smtp-Source: APXvYqy9VYicr15sSyex12ROZaBKnc3GHq6nyHAvwf39mUKZam6FK1caulzFZ2BGLj+akqwBItUoOk8ZOgIpaPpr6MA=
X-Received: by 2002:ab0:348a:: with SMTP id c10mr26610708uar.79.1555105456190; 
	Fri, 12 Apr 2019 14:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190412210912.21432-1-bunk@stusta.de>
In-Reply-To: <20190412210912.21432-1-bunk@stusta.de>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 12 Apr 2019 14:44:05 -0700
Message-ID: <CAJ86T=V5RzrFCdyQ2fyJHHkH352vMF+DQ6dXHsxwSC9kRLMBZg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Set XZ_COMPRESSION_LEVEL to -9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2019 21:44:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 12, 2019 at 2:09 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> It is consistent with other compressors also using their
> best compression.
>
> xz is currently the option that offers best compression,
> using settings even lower than the default is surprising
> and makes it harder to choose the best available compression.
>
> For anyone who cares about compression time using a different
> option like gzip or bzip2 is the logical choice.

The concern with xz's highest compression level is memory usage rather
than CPU time. Quoting from the manpage:

  Preset   DictSize   CompCPU    CompMem   DecMem
    -0     256 KiB     0      3 MiB    1 MiB
    -1       1 MiB     1      9 MiB    2 MiB
    -2       2 MiB     2     17 MiB    3 MiB
    -3       4 MiB     3     32 MiB    5 MiB
    -4       4 MiB     4     48 MiB    5 MiB
    -5       8 MiB     5     94 MiB    9 MiB
    -6       8 MiB     6     94 MiB    9 MiB
    -7      16 MiB     6    186 MiB   17 MiB
    -8      32 MiB     6    370 MiB   33 MiB
    -9      64 MiB     6    674 MiB   65 MiB

Given that these are per-thread the memory requirements may start to
get a little unreasonable with xz -9. We do limit usage to 50% of
physical memory via XZ_DEFAULTS though so maybe it's not a big
concern?

Either way, perhaps now would be a good time to remove
XZ_COMPRESSION_LEVEL from image_types.bbclass and instead just include
the compression level option in XZ_DEFAULTS so that it gets used
consistently everywhere.

> For decompression, better compressed is actually faster
> to decompress.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/classes/image_types.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 95aa1674cf..1c44ec4a80 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -54,7 +54,7 @@ def imagetypes_getdepends(d):
>      # Sort the set so that ordering is consistant
>      return " ".join(sorted(deps))
>
> -XZ_COMPRESSION_LEVEL ?= "-3"
> +XZ_COMPRESSION_LEVEL ?= "-9"
>  XZ_INTEGRITY_CHECK ?= "crc32"
>
>  ZIP_COMPRESSION_LEVEL ?= "-9"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

