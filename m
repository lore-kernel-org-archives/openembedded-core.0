Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE182C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 10:45:23 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web11.31455.1655808321408795219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 03:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=VCW9efpw;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from [IPV6:2a06:4004:10df:1:f5e4:e344:82de:a74] (_gateway
 [172.25.0.1])
	by first.geanix.com (Postfix) with ESMTPSA id 42320E6BB7;
	Tue, 21 Jun 2022 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1655808317; bh=QEX5SPDu2/nwxAZsLiLe+NZSsJNpBGlCYJD0xrw+lfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VCW9efpw8Nq1MRqma/KDMiE7/DhzzcsWsa5fcHKHWvoW9duBWyyU3aYJclSgF8u+N
	 wlFXyqVG6YWoAmOGxdZzQWRJj5QCftOKL78ifzOJIuex+DUyrU4GEr7uMbiidjRu2q
	 7nlpDcy5hC9UGkPrc+vu5Uvnvon73hIfhLUqgcy2DnKbCErUDFds7wo4zGQSqFaFBI
	 S3KfDAFMkAo0rAdxHH+OWoOh70rU2z3i0Vrz/+svFrzveZt6PuXQtf9p2KqZPYaAnS
	 GP2ASj0eTY+0FMlzsRPKvSSFpY2nI3zTKBZGmUzAkw/dF2kPliufHJeI+j7HhbI97w
	 PZVWl1iySaRcw==
Message-ID: <86367787-69bc-5828-8d15-f58872e21e14@geanix.com>
Date: Tue, 21 Jun 2022 12:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [OE-core][PATCH v3 1/2] cve-check: add json format
To: Marta Rybczynska <rybczynska@gmail.com>,
 openembedded-core@lists.openembedded.org, ross@burtonini.com
Cc: Marta Rybczynska <marta.rybczynska@huawei.com>
References: <20220329125432.78608-1-rybczynska@gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20220329125432.78608-1-rybczynska@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 10:45:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167144



On 29/03/2022 14.54, Marta Rybczynska wrote:
> Add an option to output the CVE check in a JSON-based format.
> This format is easier to parse in software than the original
> text-based one and allows post-processing by other tools.
> 
> Output formats are now handed by CVE_CHECK_FORMAT_TEXT and
> CVE_CHECK_FORMAT_JSON. Both of them are enabled by default.
> 
> The JSON output format gets generated in a similar way to the
> text format with the exception of the manifest: appending to
> JSON arrays requires parsing the file. Because of that we
> first write JSON fragments and then assemble them in one pass
> at the end.
> 
> Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> 
> ---

Hi Marta,

When upgrading from honister to kirkstone, this patch was included.

We have INHERIT += "cve" in our distro conf.
When doing a build from scratch it works fine with the cve json output, 
but when doing an incremental build it will throw:
	bb.error("Error adding the same package twice")

I have tried modifying that line to:
	bb.error("Error adding the same package twice. Offending package: %s" % 
product["name"])

It looks like it tries to add all packages again...

I have just disabled json output for now.
CVE_CHECK_FORMAT_JSON = "0"

Br,
/Sean

