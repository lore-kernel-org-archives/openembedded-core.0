Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 788D26C202
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:18:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA9EIMnK008717
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 06:18:23 -0800 (PST)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 9 Nov 2018 06:18:22 -0800
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1541754618.git.hongxu.jia@windriver.com>
	<cb45fc25b42e280523a2a8c0173dd7b494cb4635.1541754618.git.hongxu.jia@windriver.com>
	<f04feafb7ce74b451ee4e514e0331642c3fc12ac.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <48b3a122-eeda-66ee-48a9-79eee6d64efb@windriver.com>
Date: Fri, 9 Nov 2018 22:18:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <f04feafb7ce74b451ee4e514e0331642c3fc12ac.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] libjitterentropy: add 2.1.2
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
X-List-Received-Date: Fri, 09 Nov 2018 14:18:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/11/9 下午6:30, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2018-11-09 at 17:12 +0800, Hongxu Jia wrote:
>>  From the following kernel commit we know: Fedora has integrated the
>> jitter
>> entropy daemon to work around slow boot problems, especially on VM's
>> that
>> don't support virtio-rng
>>
>>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=81e69df38e2911b642ec121dec319fad2a4782f3
>> Do the same thing for Yocto.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> I'm not convinced this is going to help. The userspace support comes up
> quite late and the kernel blocking has already happened before that
> point when I last saw these issues. This was why I just enabled the
> virtio rng passthrough everywhere...

Yes, if VM support virtio-rng, we indeed do not need it, but for VM not 
support virtio-rng, it makes sense.


> Is libjitterentropy actually helping your use cases?

Yes, it helps,  I use runqemu without  virtio-rng  on qemumips64 to 
simulate VM that don't support virtio-rng

With libjitterentropy and rng-tools, it takes <60s to init crng (after 
rngd-tools started successfully)

[   48.967114] random: crng init done

Fri Nov  9 14:06:49 2018: Starting random number generator daemon
Fri Nov  9 14:06:50 2018: Initalizing available sources
Fri Nov  9 14:06:50 2018:
Fri Nov  9 14:06:50 2018: Failed to init entropy source hwrng
Fri Nov  9 14:06:50 2018:
Fri Nov  9 14:07:05 2018: Enabling JITTER rng support
Fri Nov  9 14:07:06 2018:
Fri Nov  9 14:07:06 2018: Initalizing entropy source jitter
Fri Nov  9 14:07:06 2018:
Fri Nov  9 14:07:06 2018: .
Fri Nov  9 14:07:06 2018: Starting OpenBSD Secure Shell server: sshd
Fri Nov  9 14:07:06 2018: done.
Fri Nov  9 14:07:07 2018: hwclock: can't open '/dev/misc/rtc': No such 
file or directory
Fri Nov  9 14:07:07 2018: Starting syslogd/klogd: done
Nov  9 14:07:07 qemumips64 user.notice kernel: [   48.967114] random: 
crng init done


Without libjitterentropy and rng-tools, it takes >2minutes to init crng 
(there are some other

virtual device to generate noise for entropy)

[  124.728869] random: crng init done


By the way, without virtio-rng, /dev/hwrng is dead on guest, that's the 
reason why I upgrade

rng-tools and integrate libjitterentropy, previously old rng-tools hung 
minutes in this situation.


//Hongxu


> Cheers,
>
> Richard
>


