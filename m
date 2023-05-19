Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EB6C77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 07:44:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.20651.1684482273134932089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 00:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LPTFnBhw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B2FC7FF807;
	Fri, 19 May 2023 07:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684482271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1tXD2T7No38o6VwSJY6/ZNZZ6Fvs7m4kLSonBlzkjHs=;
	b=LPTFnBhw3C3Q46iMTbkNLUhb7/f+fe02UTg9T7HmWmzjuAJJaUJ1f2FuZnipEMwzlm5bHp
	BIGIdkXj5g9okxfEOWoZrKAbi4sIaddksIHiVnRx9OXGHV5p2ro4fZdzoJjFN22pnOpNmi
	bqe7+65oBxREMKIuj3XiRliz1o1RpMNZFBEhjUE4oEsLidqQQioDCkKzEMdMQ2z+oRuUFt
	1lheESwp0g25nK5y4FPjlE3oK6bWmbIi44s0p9fO5QlDdUxhFLHU0dWwBY4w7tlN95O4mK
	ZjvG3xkvDXaZatGRYnik2qwjxlWuRNs2dsJnVs32kDdKBHaNvF49u5eKwpPsWQ==
Message-ID: <f04650dc-e504-e146-2845-e7cbeed5c547@bootlin.com>
Date: Fri, 19 May 2023 09:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: mikko.rapeli@linaro.org, Peter Marko <peter.marko@siemens.com>
Subject: Re: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
Content-Language: en-US
To: andrej.valek@siemens.com, openembedded-core@lists.openembedded.org
References: <20230505111814.491483-1-andrej.valek@siemens.com>
 <20230519062420.37015-1-andrej.valek@siemens.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230519062420.37015-1-andrej.valek@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 07:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181536

Hi Andrej

On 19.05.23 at 08:24, Andrej Valek via lists.openembedded.org wrote:
> - Replace CVE_CHECK_IGNORE with CVE_STATUS + [CVE_STATUS_REASONING] to be
> more flexible. CVE_STATUS should contain flag for each CVE with accepted
> values "Ignored", "Not applicable" or "Patched". It allows to add
> a status for each CVEs.
> - Optional CVE_STATUS_REASONING flag variable may contain a reason
> why the CVE status was used. It will be added in csv/json report like
> a new "reason" entry.
> - Settings the same status and reason for multiple CVEs is possible
> via CVE_STATUS_GROUPS variable.
> - All listed CVEs in CVE_CHECK_IGNORE are copied to CVE_STATUS with
> value "Ignored" like a fallback.
>
> Examples of usage:
> CVE_STATUS[CVE-1234-0001] = "Ignored" # or "Not applicable" or "Patched"
> CVE_STATUS[CVE-1234-0002] = "Not applicable"
> CVE_STATUS_REASONING[CVE-1234-0002] = "Issue only applies on Windows"
>
> CVE_STATUS_GROUPS = "CVE_STATUS_WIN CVE_STATUS_PATCHED"
> CVE_STATUS_WIN = "CVE-1234-0001 CVE-1234-0002"
> CVE_STATUS_WIN[status] = "Not applicable"
> CVE_STATUS_WIN[reason] = "Issue only applies on Windows"
>
> CVE_STATUS_PATCHED = "CVE-1234-0003 CVE-1234-0004"
> CVE_STATUS_PATCHED[status] = "Patched"
> CVE_STATUS_PATCHED[reason] = "Fixed externally"
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>   documentation/dev-manual/new-recipe.rst      |  4 +-
>   documentation/dev-manual/vulnerabilities.rst | 11 ++---
>   documentation/ref-manual/classes.rst         |  9 ++--
>   documentation/ref-manual/variables.rst       | 33 ++++++++++++---
>   meta/classes/cve-check.bbclass               | 44 +++++++++++++++++---
>   meta/lib/oe/cve_check.py                     |  6 +++
>   6 files changed, 87 insertions(+), 20 deletions(-)

Many thanks for the patch and for the documentation changes too !
However, could you send the documentation changes separately, using the 
yocto-docs repository as a reference, and sending them to the 
docs@lists.yoctoproject.org mailing list?

You seem to have produced your patches against "poky", but that's a 
repository aggregating stuff from other repositories. Your code changes 
should be for the "openembedded-core" repository.

Another advantage is that we can merge the documentation changes only 
when the code changes are accepted.

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


