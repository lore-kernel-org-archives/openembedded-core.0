Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55171CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 03:27:01 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9895.1764646017090062646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 19:26:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup 20230812-3u04._domainkey.redrectangle.org on 127.0.0.53:53: no such host" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=cjHjH//v;
 spf=fail (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 5F05B61A2;
	Tue,  2 Dec 2025 04:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764646014;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=QqyiPFlbNRRvt/mjDiZHINCzTXATKuJZXLVdctOwJtE=;
	b=cjHjH//viwZ102L6CeLDtiVadi8qWhP1P5Sm7Wr/8NWJfPzWeBX6DVfLEZMUppkF
	Tt4BgPYWEVF7FF7Phm+rsu4BVCoE1wGxesSOXjRcmcwIKsJ0ZwURt/q9zw1ZD7laqwI
	OIZ6BwzatY6szQrn7YyGw/JMDlRy63jalfLsO84hX1qzDLPOTcDRx5AWGYKzE10keHL
	C15eNAv0xA4uOEeoiOYGE52mqhIgGxsJUWt7gK+tN3uaO6ckFw9CJqtHRn4TgIq+HUe
	FK9meYxVKIOkxZqtAZ8mFNjmwzq5GhEipPwbB12t+Rb0OMQiIs+WZRC1gzb7N7HQcYu
	42S+WVgjiw==
Received: by smtp.mailfence.com with ESMTPSA ; Tue, 2 Dec 2025 04:26:51 +0100 (CET)
Message-ID: <84565778-e205-454a-9fbf-6d526d6a8e20@redrectangle.org>
Date: Mon, 1 Dec 2025 19:26:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH 3/9] lib/oe/go: document map_arch, and
 raise an error on unknown architecture
To: Peter Marko <peter.marko@siemens.com>,
 openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20251113122806.16769-1-peter.marko@siemens.com>
 <20251113122806.16769-4-peter.marko@siemens.com>
Content-Language: en-US
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <20251113122806.16769-4-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ContactOffice-Account: com:454140407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 03:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227146

On 11/13/25 04:28, Peter Marko wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> Add a comment explaining what this function does and where the values
> come from.
> 
> If the architecture isn't know, instead of returning an empty string
> which could fail mysteriously, raise a KeyError so it fails quickly.
> 
> (From OE-Core rev: 025414c16319b068df1cd757ad9a3c987a6b871d)
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>   meta/lib/oe/go.py | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
> index dfd957d157a..4559dc63b28 100644
> --- a/meta/lib/oe/go.py
> +++ b/meta/lib/oe/go.py
> @@ -7,6 +7,10 @@
>   import re
>   
>   def map_arch(a):
> +    """
> +    Map our architecture names to Go's GOARCH names.
> +    See https://github.com/golang/go/blob/master/src/internal/syslist/syslist.go for the complete list.
> +    """
>       if re.match('i.86', a):
>           return '386'
>       elif a == 'x86_64':
> @@ -31,4 +35,4 @@ def map_arch(a):
>           return 'riscv64'
>       elif a == 'loongarch64':
>           return 'loong64'
> -    return ''
> +    raise KeyError(f"Cannot map architecture {a}")
> 
> 

This was recently merged to scarthgap and unfortunately it breaks 
SOURCE_MIRROR_FETCH on architectures not supported by Go.

This is easily reproduced:

git clone https://git.yoctoproject.org/poky
cd poky
. oe-init-build-env
Set MACHINE to qemuppc and set SOURCE_MIRROR_FETCH = "1" in local.conf
bitbake --runonly fetch core-image-minimal

WARNING: 
/home/robert/yocto/poky-scarthgap/meta/recipes-devtools/go/go-cross_1.22.12.bb: 
Exception during build_dependencies for GOARCH
WARNING: 
/home/robert/yocto/poky-scarthgap/meta/recipes-devtools/go/go-cross_1.22.12.bb: 
Error during finalise of 
/home/robert/yocto/poky-scarthgap/meta/recipes-devtools/go/go-cross_1.22.12.bb
ERROR: ExpansionError during parsing 
/home/robert/yocto/poky-scarthgap/meta/recipes-devtools/go/go-cross_1.22.12.bb
bb.data_smart.ExpansionError: Failure expanding variable TARGET_GOARCH, 
expression was ${@go_map_arch(d.getVar('TARGET_ARCH'), d)} which 
triggered exception KeyError: 'Cannot map architecture powerpc'
The variable dependency chain for the failure is: TARGET_GOARCH -> GOARCH
...


Is there another way of using SOURCE_MIRROR_FETCH to avoid this? Or is 
reverting this reasonable? I realize we're probably one of the few 
remaining PowerPC users, but more generally it feels like parsing 
shouldn't be limited to whatever architectures Go happens to support.

Thanks,
Robert

