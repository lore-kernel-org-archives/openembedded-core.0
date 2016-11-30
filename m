Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E51C562135
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 02:00:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAU20cZt003142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 29 Nov 2016 18:00:38 -0800
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 29 Nov 2016 18:00:37 -0800
To: Randy Witt <randy.e.witt@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1480363884-6789-1-git-send-email-randy.e.witt@linux.intel.com>
	<f4759de9-823a-bfcd-9305-e14438347631@windriver.com>
	<7b78a4a8-3157-ed82-6efa-1ec699ec8a71@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <64750cb9-5fbf-e82a-cc74-4f3f13657dd0@windriver.com>
Date: Wed, 30 Nov 2016 10:00:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <7b78a4a8-3157-ed82-6efa-1ec699ec8a71@linux.intel.com>
Subject: Re: [PATCH] qemu*.conf: Add slirp support for all qemu machines
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
X-List-Received-Date: Wed, 30 Nov 2016 02:00:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/30/2016 02:24 AM, Randy Witt wrote:
>
>>
>> "-device virtio-net-device,netdev=net0" and
>> "-netdev user,id=net0,hostfwd=tcp::2222-:22"
>>
>> Then there is no way for user to override the second part, and we can't
>> call the first part as a "QB_SLIRP_OPT" since it is only part of them,
>> so I won't break them into 2, and if the user defines QB_SLIRP_OPT
>> in there bsp conf file, then it will be replaced totally.
>>
>
> I'm aware that this will only work for one instance, but currently it doesn't
> work at all and it blocks a high priority bug. The only way to make it 100%
> work, would be to have qemu do the binding of the port to a dynamic one and then
> the user queries it after. Otherwise there is always a window where another
> process could bind to the port.

We can check whether the port is free and use another one if not, we've
already done similar things in runqemu-export-rootfs for nfs, please see:

http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129376.html

// Robert

>
> I don't think the bsp should be in the business of choosing which ports to
> forward. And if it is, then it should be a separate option in the qemuboot.conf,
> with just the "-netdev user" part because otherwise the user will always have to
> modify qemuboot.conf just to forward different ports.
>
> It makes more sense to let the user do something like "runqemu slirp=22,65,..."
> and then return back the actual port used in the forwarding.


>
>

