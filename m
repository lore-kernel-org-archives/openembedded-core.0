Return-Path: <gtertych@cisco.com>
X-Greylist: delayed 593 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 Aug 2018 07:33:29 UTC
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id ACB3860043
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 07:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1312; q=dns/txt; s=iport;
	t=1533540811; x=1534750411;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=KSiEaAJdqTSIuNsMGhH2IAK/bXA0K76JcwJ33wbxWdw=;
	b=a+tJ8nEY/LamaIC/MZC57Ryk3WmN0exfawMXfZGj5vQvpSr7wpOrj2tS
	tezgHc23tLDfG8AQvFkEakSEJNjbOom5+WJOON9Qzqx/B6+06QFWvBxes
	Zw60bnyrK7oApvPhdu+xLy10XHtXr1CU8LCVFOhZwMGvBPb5keOCOmAdl s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CiAwBL9mdb/xbLJq1bGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYQxbRIog36IaI1ECCWIUY8QCyOESQKDOzgUAQIBAQIBAQJ?=
	=?us-ascii?q?tHAyFOAEFIxVBEAsYAgImAgJXBgEMBgIBAYMcAYFyDQ+rdYEuhF+FbRR3iBW?=
	=?us-ascii?q?BQT+BOQyCX4EmgXUBA4RgglUCjTAtjFYJhhqJJQaBTUaGKYVkiB+CTIdMAgQ?=
	=?us-ascii?q?LAhSBWCGBPwsIcBU7gmkJh3eDZoRwPDCQEQEB?=
X-IronPort-AV: E=Sophos;i="5.51,451,1526342400"; 
   d="scan'208";a="5652347"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2018 07:23:36 +0000
Received: from [10.61.161.194] ([10.61.161.194]) (authenticated bits=0)
	by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTPSA id w767NZDv001458
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 6 Aug 2018 07:23:36 GMT
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1533335883158.4719@cisco.com>
	<08924f71-ddd6-ea25-3b24-18ed74c92233@gmail.com>
From: grygorii tertychnyi <gtertych@cisco.com>
Message-ID: <a8c4395c-a91c-7a9e-8525-9fd67a7e0076@cisco.com>
Date: Mon, 6 Aug 2018 10:24:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <08924f71-ddd6-ea25-3b24-18ed74c92233@gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: gtertych
X-Outbound-SMTP-Client: 10.61.161.194, [10.61.161.194]
X-Outbound-Node: aer-core-4.cisco.com
Cc: "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH 1/2] cve-report: add scripts to generate CVE reports
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
X-List-Received-Date: Mon, 06 Aug 2018 07:33:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 08/04/2018 05:16 PM, akuster808 wrote:
>
> On 08/03/2018 03:37 PM, Grygorii Tertychnyi (gtertych) via
> Openembedded-core wrote:
>> cvert-kernel - generate CVE report for the Linux kernel.
>>    NVD entries for the Linux kernel is almost always outdated.
>>    For example, https://nvd.nist.gov/vuln/detail/CVE-2018-1065
>>    is shown as matched for "versions up to (including) 4.15.7",
>>    however the patch 57ebd808a97d has been back ported for 4.14.
>>    cvert-kernel script checks NVD Resource entries for the patch URLs
>>    and looking for the commits in the local git tree.
>>
>> cvert-foss - generate CVE report for the list of packages.
>>    It analyzes the whole image manifest to align with the complex
>>    CPE configurations.
>>
>> cvert-update - only update NVD feeds and store CVE blob locally.
>>    CVE blob is a pickled representation of the cve_struct dictionary.
>>
>> cvert.py - python module used by all cvert-* scripts.
>>    Uses NVD JSON Vulnerability Feeds https://nvd.nist.gov/vuln/data-feeds#JSON_FEED
>>
>> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
>
> This looks existing. I will give a try this weekend.
>
> Is this what was talked about at the last OEDeM ?

Thanks Armin.
Yes, we talked about this on the last year's meeting.


