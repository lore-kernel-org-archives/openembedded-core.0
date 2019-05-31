Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6809E7DDA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 06:34:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4V6Yme9018335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2019 23:34:48 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 30 May 2019 23:34:47 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <ba81c9ea11db351bde7fec1c40c2f57495c3fdec.camel@linuxfoundation.org>
	<1559196696-70652-1-git-send-email-mingli.yu@windriver.com>
	<2464053a8ff6ebd77a312cbc70b7ffda2c559345.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CF0CC64.2070002@windriver.com>
Date: Fri, 31 May 2019 14:40:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <2464053a8ff6ebd77a312cbc70b7ffda2c559345.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.170]
Subject: Re: [PATCH v4] elfutils: fix ptest failures
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
X-List-Received-Date: Fri, 31 May 2019 06:34:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年05月31日 04:49, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2019-05-30 at 14:11 +0800, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> * Add missing files which needed by ptest test
>>    to fix the ptest failures such as:
>>    | sh: ../src/elflint: No such file or directory
>>    | FAIL: asm-tst4
>>
>> * Rework 0001-skip-the-test-when-gcc-not-deployed.patch
>>    to skip the tests which depend on gcc
>>
>> * Define INHIBIT_PACKAGE_STRIP_FILES for elfutils to
>>    avoid stripping some generated binaries otherwise
>>    some of the tests such as test-nlist, run-strip-reloc.sh,
>>    run-strip-strmerge.sh and so on will fail
>>
>> Before:
>> --------------------------------------------
>> Recipe   | Passed    | Failed   | Skipped
>> --------------------------------------------
>> elfutils | 176       | 23       | 4
>> --------------------------------------------
>>
>> After:
>> --------------------------------------------
>> Recipe   | Passed    | Failed   | Skipped
>> --------------------------------------------
>> elfutils | 199       | 0       | 4
>> --------------------------------------------
>
> Thanks, this is better again. We do still have a musl issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/648
>
> Error:
>   Problem: package packagegroup-core-full-cmdline-extended-1.0-r6.0.noarch requires iproute2, but none of the providers can be installed
>    - package packagegroup-core-full-cmdline-1.0-r6.0.noarch requires packagegroup-core-full-cmdline-extended, but none of the providers can be installed
>    - package iproute2-5.1.0-r0.0.core2_32 requires elfutils-ptest >= 0.176, but none of the providers can be installed
>    - conflicting requests
>    - nothing provides elfutils-binutils needed by elfutils-ptest-0.176-r0.0.core2_32
> (try to add '--skip-broken' to skip uninstallable packages or '--nobest' to use not only best candidate packages)

I didn't encounter the failure during do_rootfs when "bitbake 
core-image-sato-sdk" with musl on qemux86.

Could you help to provide your local.conf?

Thanks,

>
> Cheers,
>
> Richard
>
>

