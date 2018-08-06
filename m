Return-Path: <gtertych@cisco.com>
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2D160053
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1170; q=dns/txt; s=iport;
	t=1533542753; x=1534752353;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=Za+vl8+11nKxq3BhNvmiXbsOBbQDQ67nVxHpw25x18I=;
	b=adovgRiM4wd/MNIIVArpx2Fho7cVctDWN+ZNgQDrgj3+pLDm4y4Mc7Sp
	6VT9DGpumWS1k40dRWXF6uhplrwmd6stAry/Izsi40uPp8LsaLDsnrcFH
	O/D0xjhUDShhU0edsu9JWqJ1li/zPxJo4sZjHreFB8hN/3B2obX9reZMG 8=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CiAwCwAGhb/xbLJq1bGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYQxbRIog36IaI1FCCWIUY8QCyWERwKDPzgUAQIBAQIBAQJ?=
	=?us-ascii?q?tHAyFNwEBAQECASMVQQULCxgCAiYCAlcTBgIBAYMcAYFyBQgPq2eBLoRfhWk?=
	=?us-ascii?q?FFHeIFYFBP4E5DIJfgSaBdQEBgi6CNIJVAo0wLYxWCYYaiSUGiDyFZIprh0w?=
	=?us-ascii?q?CBAsCFIFYIYE/CwhwFYMkgiUXg0WBf4hWPDABAQqQBQEB?=
X-IronPort-AV: E=Sophos;i="5.51,451,1526342400"; 
   d="scan'208";a="5656374"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2018 08:05:52 +0000
Received: from [10.61.161.194] ([10.61.161.194]) (authenticated bits=0)
	by aer-core-3.cisco.com (8.15.2/8.15.2) with ESMTPSA id w7685pdp008012
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 6 Aug 2018 08:05:51 GMT
To: Mikko.Rapeli@bmw.de
References: <1533335883158.4719@cisco.com> <20180806065653.GG8291@hiutale>
From: grygorii tertychnyi <gtertych@cisco.com>
Message-ID: <8c479ede-7561-9ce3-3766-1594ae175825@cisco.com>
Date: Mon, 6 Aug 2018 11:06:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180806065653.GG8291@hiutale>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: gtertych
X-Outbound-SMTP-Client: 10.61.161.194, [10.61.161.194]
X-Outbound-Node: aer-core-3.cisco.com
Cc: xe-linux-external@cisco.com, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 06 Aug 2018 08:05:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 08/06/2018 09:56 AM, Mikko.Rapeli@bmw.de wrote:

> On Fri, Aug 03, 2018 at 10:37:05PM +0000, Grygorii Tertychnyi (gtertych) via Openembedded-core wrote:
>> cvert-kernel - generate CVE report for the Linux kernel.
>>    NVD entries for the Linux kernel is almost always outdated.
>>    For example, https://nvd.nist.gov/vuln/detail/CVE-2018-1065
>>    is shown as matched for "versions up to (including) 4.15.7",
>>    however the patch 57ebd808a97d has been back ported for 4.14.
>>    cvert-kernel script checks NVD Resource entries for the patch URLs
>>    and looking for the commits in the local git tree.
> This is an interesting approach.
>
> For the kernel I've been using information not from NVD but from
> https://github.com/nluedtke/linux_kernel_cves/
>
> As an example, all CVE fixed in 4.14 kernel series point releases AND all
> non-fixed CVE are listed in:
>
> https://github.com/nluedtke/linux_kernel_cves/blob/master/4.14/4.14_security.txt
>
> I have not tried to automate this, but I do find the information there
> much better than NVD.

Thanks for the links!
I did not know about these, I'll defenetly try it.

> -Mikko


