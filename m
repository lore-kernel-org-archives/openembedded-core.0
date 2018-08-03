Return-Path: <kamensky@cisco.com>
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
	by mail.openembedded.org (Postfix) with ESMTP id E227778BB2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 20:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2469; q=dns/txt; s=iport;
	t=1533328056; x=1534537656;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=W6ffwbeRpTxzFd7zmvdWbKVDO/TvuZn2r/uptjW7Jzs=;
	b=TLReSapl3ugRK0kH7/GUATOZTmzu30SyZIf8fe9vrfixT3fFcra9kxo/
	tt9BXmSD2Wy+fgS2yoL16A5+8C4e+eSoWTZyX2mSTArnUEpQpWLlq+2Ck
	FzjrG5e2dxX8agdS5Q0TUtRlHFuCJK4tRpEwSPLKhlq8l5iiqtONThwBH 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ASAgCRumRb/5RdJa1cGgEBAQEBAgE?=
	=?us-ascii?q?BAQEIAQEBAYNOY38ojGaNTiWXWAsYC4QDRgKDDiE4FAECAQECAQECbRwMhTY?=
	=?us-ascii?q?BAQEDAQEBNgI0CwULCxUxJwEvGYMhgXcID7M4ilWJCReCAIFFgl+DGwEEgiu?=
	=?us-ascii?q?FCQKHWoYEjE8JhhmCbwWCR4U6RYZMhT6KZIdLAgQLAhSBWCGBUk0jFTuCaQm?=
	=?us-ascii?q?LDFGFDR8wAZAjAQE?=
X-IronPort-AV: E=Sophos;i="5.51,439,1526342400"; d="scan'208";a="152079684"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
	by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Aug 2018 20:27:35 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id w73KRYIf009243
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 3 Aug 2018 20:27:35 GMT
Date: Fri, 3 Aug 2018 13:27:34 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: omar.ocampo.coronado@intel.com
In-Reply-To: <20180803230955.104596-1-omar.ocampo.coronado@intel.com>
Message-ID: <alpine.LRH.2.00.1808031320270.50550@sjc-ads-6991.cisco.com>
References: <20180803230955.104596-1-omar.ocampo.coronado@intel.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.218.111, sjc-ads-6991.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package: skip strip on signed kernel modules
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
X-List-Received-Date: Fri, 03 Aug 2018 20:27:35 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Fri, 3 Aug 2018, omar.ocampo.coronado@intel.com wrote:

> From: foocampo <omar.ocampo.coronado@intel.com>
>
> Executing strip action on kernel modules removes the signature.
> Is not possible to strip and keep the signature, therefore avoid
> strip signed kernel modules.
>
> Signed-off-by: foocampo <omar.ocampo.coronado@intel.com>
> ---
> meta/lib/oe/package.py | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index fa3428ad61..f7d2d3b7c4 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -24,6 +24,9 @@ def runstrip(arg):
>
>     # kernel module
>     if elftype & 16:
> +        if is_kernel_module_signed(file):
> +            bb.debug(1, "Skip strip on signed module %s" % file)
> +            return

It does not look right to me. Above means that signed
KLM will go into image with symbols. Or I don't read
code correctly?

Where is signature stored? Is it some kind of an ELF NOTE? In
this case you would just need to drop only "--remove-section=.note"
from strip command. Wondering why .notes were stripped in the
first place.

>         stripcmd.extend(["--strip-debug", "--remove-section=.comment",
>             "--remove-section=.note", "--preserve-dates"])

I suggest split above into two invocations and do second
stripcmd.extend(["--remove-section=.note"]) only for non signed modules.
Assuming that signature is in the .note section. If it is not .comment,
do that with "--remove-section=.comment" instead.

>     # .so and shared library
> @@ -46,6 +49,13 @@ def is_kernel_module(path):
>     with open(path) as f:
>         return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
>
> +# Detect if .ko module is signed
> +def is_kernel_module_signed(path):
> +    with open(path, "rb") as f:
> +        f.seek(-28, 2)

Where magic -28 comes from? Is it true for all cases, all CPU arches?
I think it could be done more cleanly here.

Thanks,
Victor

> +        module_tail = f.read()
> +        return "Module signature appended" in "".join(chr(c) for c in bytearray(module_tail))
> +
> # Return type (bits):
> # 0 - not elf
> # 1 - ELF
> -- 
> 2.18.0
>
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

