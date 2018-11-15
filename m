Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22B98601D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 09:31:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAF9VjQp009107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Nov 2018 01:31:45 -0800 (PST)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 15 Nov 2018 01:31:44 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1542247292.git.Qi.Chen@windriver.com>
	<579d70f86c017ddc17bc9dfd071361a53e4b0f26.1542247292.git.Qi.Chen@windriver.com>
	<d7b9e550f8628efc13616d92344089dbfd234ec9.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <e27e1be4-896f-c77e-a987-a4877ca73320@windriver.com>
Date: Thu, 15 Nov 2018 17:38:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <d7b9e550f8628efc13616d92344089dbfd234ec9.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 8/8] busybox: add coreutils to RDEPENDS of busybox-ptest
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
X-List-Received-Date: Thu, 15 Nov 2018 09:31:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2018 05:23 PM, Richard Purdie wrote:
> On Thu, 2018-11-15 at 10:02 +0800, Chen Qi wrote:
>> busybox's echo test cases needs 'od' command to have '-t' option
>> support. However, our busybox disable it by default by not setting
>> CONFIG_DESKTOP. CONFIG_DESKTOP affects many busybox utilities. So
>> add coreutils to RDEPENDS of busybox-ptest.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/busybox/busybox.inc | 3 +++
>>   1 file changed, 3 insertions(+)
> This means any build of busybox will now also build coreutils which
> isn't really desirable.
>
> If there any way to just enable the -t option to od without all the
> other changes? Has this been mentioned to upstream busybox?
>
> Cheers,
>
> Richard
>
>

The current busybox codes are:
[snip]
#include "libbb.h"
#if ENABLE_DESKTOP
/* This one provides -t (busybox's own build script needs it) */
#include "od_bloaty.c"
#else
[snip]

So there's currently no way to just enable '-t' for 'od' without 
affecting other utilities.
I'll check with busybox upstream to see why they do so and if we could 
do some change.

Best Regards,
Chen Qi

