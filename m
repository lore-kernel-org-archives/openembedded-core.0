Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98761745FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 06:53:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9O6qnWW028622
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Oct 2018 23:53:00 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 23 Oct 2018 23:52:39 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1540351835-16861-1-git-send-email-changqing.li@windriver.com>
	<46d200d7ef4c6399ccc99801674fb203916555c6.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <3746db69-c37e-4500-4780-bfe24bdafdd2@windriver.com>
Date: Wed, 24 Oct 2018 14:52:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <46d200d7ef4c6399ccc99801674fb203916555c6.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] openssl: fix occasionally install fail for parallel build
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
X-List-Received-Date: Wed, 24 Oct 2018 06:53:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/24/2018 02:04 PM, Richard Purdie wrote:
> On Wed, 2018-10-24 at 11:30 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> when do parallel build, like run "make install -j 48", openssl will
>> do_install
>> failed with below error:
>> mv: cannot stat 'openssl/1.1.1-
>> r0/image/usr/lib/libcrypto.so.1.1.new': No such file or directory
>> Makefile:318: recipe for target 'install_dev' failed
>>
>> problem caused by target install_dev and target install_runtime, both
>> installed
>> libcrypto.so.1.1, result in log:
>> *** Installing development files
>> ...
>> install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
>> link /var/tmp/foo/lib/libcrypto.so ->
>> /var/tmp/foo/lib/libcrypto.so.1.1
>> ...
>> *** Installing runtime files
>> install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
>>
>> command in install_dev and install_runtime will have parallel
>> competition.
>>
>> have create an issue to upstream:
>> https://github.com/openssl/openssl/issues/7466#issuecomment-432148137
>>
>> but upstream won't support this condition, so use this fix as a
>> workaround to fix the problem.
> This means that:
>
> a) Upstream don't support parallel make install
> b) Reject patches fixing any bugs in parallel make install
>
> This means the Upstream-Status should be rejected with the link above,
> not pending. It also means we may need to think about not using
> parallel install although since its working, its tempting to carry
> patches and keep using it if it works.
>
> It may be worth pointing out to upstream that it is mostly working for
> us? I am a little worried they know something we don't about problems
> this could run into.
>
> Cheers,
>
> Richard
>
>
I will point out to upstream that it is mostly working for us,  and
ask upstream suggestion about potential problem of parallel build.

if upstream think no obvious potential problem can seen,  I will change
upstream-status to reject and resend the patch.

if upstream recommend not to do parallel build,  I will add something 
like below
to stop parallel build for make install, and resend the patch, but in 
this case,  build
openssl  will very slow.

ifneq ($(filter install,$(MAKECMDGOALS)),)
.NOTPARALLEL:
endif




-- 
BRs

Sandy(Li Changqing)
Wind River Linux


