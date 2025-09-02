Return-Path: <oe@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19443CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 15:04:09 +0000 (UTC)
Received: from outbound5.mail.transip.nl (outbound5.mail.transip.nl [136.144.136.9])
 by mx.groups.io with SMTP id smtpd.web10.79806.1756825445848760094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 08:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@myspectrum.nl header.s=transip-a header.b=YPcTPAzf;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.9, mailfrom: oe@myspectrum.nl)
Received: from submission3.mail.transip.nl (unknown [10.100.4.72])
	by outbound5.mail.transip.nl (Postfix) with ESMTP id 4cGTXg2zlvzHTHv;
	Tue,  2 Sep 2025 17:04:03 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission3.mail.transip.nl (Postfix) with ESMTPSA id 4cGTXf2BcRz2nC0cq;
	Tue,  2 Sep 2025 17:04:02 +0200 (CEST)
Received: from [192.168.178.17] (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: oe@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 865DE20089;
	Tue,  2 Sep 2025 15:04:01 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=oe@myspectrum.nl smtp.mailfrom=oe@myspectrum.nl
Message-ID: <a00f1d80-39a2-4b55-a36e-b69797ba761b@myspectrum.nl>
Date: Tue, 2 Sep 2025 17:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] gomod: extract license files for omitted
 modules
To: openembedded-core@lists.openembedded.org, christian.lindeberg@axis.com,
 ross.burton@arm.com
References: <20250719150105.2697443-1-jeroen@myspectrum.nl>
Content-Language: en-US
From: Jeroen Hofstee <oe@myspectrum.nl>
In-Reply-To: <20250719150105.2697443-1-jeroen@myspectrum.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: ClueGetter at submission3.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1756825442; h=from:subject:to:
 references:in-reply-to:date:mime-version:content-type;
 bh=gU7R28j3vnt2THOFj5ByoHR3N7IVn34LFkI3EK+NHuw=;
 b=YPcTPAzfALT3vf9fpnR65he+tMYRjvXzuTxU24iiciOnShNH4ZZ+e4yA2N+vDkvv14xP/5
 OZH1dC+fo7Ul5Ef5cWx6BUaA/QcL6BjiQVqOnkBRlDbH8bjeF/4VUe6rvdv8D5ZI9axiD+
 KsNn0AVRmY3ccxXtSRuJaoCgnuGYHRr/9kKFscO4YzdKtWtPbbXJsRscVTFe2XMZCA3zrj
 o/VEWhsfj5vxpfHcnm9YC4ptbNoV3wLtW6bCR1R+a6Uk7dwy5J7Ln8hTNDpzdWCFkjDCxA
 sebqv/eovNO1ivzFhSAYYxmPxmW9c6icNyj6uB0Yw2XYZTRiQscYNtOEn2d67Q==
X-Report-Abuse-To: abuse@transip.nl
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 15:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222733

Hi Christian, Ross or some else to whom it may concern ,

Can you also have a look at:
https://patchwork.yoctoproject.org/project/oe-core/patch/20250719150105.2697443-1-jeroen@myspectrum.nl/

It simply makes sure LICENSE files are always present.

Thanks,
Jeroen

On 7/19/25 17:01, Jeroen Hofstee wrote:
> From: Jeroen Hofstee <jhofstee@victronenergy.com>
>
> If a gomod is omitted with a PACKAGECONFIG option its license file
> doesn't get extracted to the gomod cache dir and hence do_populate_lic
> will complain that the license file isn't found. This adds a task
> do_extract_lic after do_compile and before do_populate_lic to make
> sure the license files are extracted in such a case.
>
> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
>
> ---
> v2:
>
> - drop bb.utils.mkdirhier(os.path.dirname(cachefile)), extract
>    will create it.
> - fix typo in the commit msg, it is do_populate_lic
> ---
>   meta/classes-recipe/go-mod.bbclass | 33 ++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mod.bbclass
> index a15dda8f0e..4c0496e1e7 100644
> --- a/meta/classes-recipe/go-mod.bbclass
> +++ b/meta/classes-recipe/go-mod.bbclass
> @@ -29,6 +29,39 @@ do_unpack[cleandirs] += "${GOMODCACHE}"
>   GO_WORKDIR ?= "${GO_IMPORT}"
>   do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
>   
> +python do_extract_lic() {
> +    import zipfile
> +
> +    lics = d.getVar("LIC_FILES_CHKSUM")
> +    cache = d.getVar("GOMODCACHE")
> +    dldir = os.path.join(cache, "cache", "download")
> +    prefix = "file://pkg/mod/"
> +
> +    for lic in lics.split():
> +        if not lic.startswith(prefix):
> +            continue
> +
> +        try:
> +            src = lic[len(prefix):].split(";")[0]
> +            url, suffix = src.split("@v")
> +            version, _, file = suffix.partition(os.path.sep)
> +        except:
> +            continue
> +
> +        cachefile = os.path.join(cache, src)
> +        zip = os.path.join(dldir, url, "@v", "v" + version) + ".zip"
> +        if os.path.exists(cachefile) or not os.path.exists(zip):
> +            continue
> +
> +        try:
> +            bb.note(f"extract {src} from {zip}")
> +            zipfile.ZipFile(zip).extract(src, cache)
> +        except:
> +            bb.warn(f"could not extract {src} from {zip}")
> +}
> +
>   # Make go install unpack the module zip files in the module cache directory
>   # before the license directory is polulated with license files.
> +# Do make sure licenses get extracted for omitted modules.
> +addtask do_extract_lic after do_compile before do_populate_lic
>   addtask do_compile before do_populate_lic
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220613): https://lists.openembedded.org/g/openembedded-core/message/220613
> Mute This Topic: https://lists.openembedded.org/mt/114238035/9720520
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [oe@myspectrum.nl]
> -=-=-=-=-=-=-=-=-=-=-=-
>

