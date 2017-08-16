Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 310657833C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 15:18:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7GFInBt007310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Aug 2017 08:18:49 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 08:18:49 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
	<1502890461.13978.127.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <44accf1b-b80e-ad04-0aaa-1d6127a9fcd1@windriver.com>
Date: Wed, 16 Aug 2017 10:18:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502890461.13978.127.camel@linuxfoundation.org>
Cc: peter.kjellerstedt@axis.com
Subject: Re: [PATCH 0/6 v2] Fix RPM4 regressions based on Pyro
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
X-List-Received-Date: Wed, 16 Aug 2017 15:18:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/16/17 8:34 AM, Richard Purdie wrote:
> On Tue, 2017-08-15 at 16:41 -0500, Mark Hatle wrote:
>> From the comments to the original patch, the only not addressed was
>> adding an OE self-test for this behavior.  I tried to do this, but I
>> don't see any existing tests that build a recipe and inspect the
>> results of the built package.  I'm not sure of any other way to
>> identify if things are working or not.
> 
> oe-selftest can do this.
> 
>> I have built and tested this for:
>>
>> core-image-base core-image-minimal core-image-full-cmdline 
>> core-image-kernel-dev core-image-lsb core-image-lsb-dev 
>> core-image-lsb-sdk core-image-testmaster core-image-clutter 
>> core-image-weston core-image-x11 core-image-sato core-image-sato-dev 
>> core-image-sato-sdk core-image-sato-sdk-ptest
> 
> As we both suspected there are some issues with enabling this again,
> many are showcased here:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/builds/1156/steps/BuildImages/logs/stdio
> 
> * ltp has ksh/csh requirements in ptest
> * package dhcp-client-4.3.5-r0.0.armv5e requires libdns.so.170, but none of the providers can be installed
> * nothing provides /usr/bin/python33 needed by bind-9.10.5+P3-r0.0.armv5e
> ERROR: openssl-1.1.0f-r0 do_package_qa: QA Issue: /usr/lib/openssl/ptest/util/find-unused-errs contained in package openssl-ptest requires /bin/bash, but no providers found in RDEPENDS_openssl-ptest? [file-rdeps]
> ERROR: openssl-1.1.0f-r0 do_package_qa: QA Issue: /usr/lib/openssl/ptest/fuzz/helper.py contained in package openssl-ptest requires /usr/bin/python, but no providers found in RDEPENDS_openssl-ptest? [file-rdeps]
> ERROR: bind-9.10.5-P3-r0 do_package_qa: QA Issue: /usr/sbin/dnssec-checkds contained in package bind requires /usr/bin/python33, but no providers found in RDEPENDS_bind? [file-rdeps]

The above are valid packaging bugs.  RP may get there first, but I'll try to get
patches setup for them.

--Mark

> I suspect the key piece of testing you were missing may have been ptest enablement?
> 
> I might try and sort a few patches for pieces of this.
> 
> Cheers,
> 
> Richard
> 


