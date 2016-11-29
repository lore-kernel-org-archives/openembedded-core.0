Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5939271A06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 18:24:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2016 10:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="1065780019"
Received: from bitbang.jf.intel.com (HELO [10.7.199.68]) ([10.7.199.68])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2016 10:24:13 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1480363884-6789-1-git-send-email-randy.e.witt@linux.intel.com>
	<f4759de9-823a-bfcd-9305-e14438347631@windriver.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <7b78a4a8-3157-ed82-6efa-1ec699ec8a71@linux.intel.com>
Date: Tue, 29 Nov 2016 10:24:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f4759de9-823a-bfcd-9305-e14438347631@windriver.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 18:24:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


>
> "-device virtio-net-device,netdev=net0" and
> "-netdev user,id=net0,hostfwd=tcp::2222-:22"
>
> Then there is no way for user to override the second part, and we can't
> call the first part as a "QB_SLIRP_OPT" since it is only part of them,
> so I won't break them into 2, and if the user defines QB_SLIRP_OPT
> in there bsp conf file, then it will be replaced totally.
>

I'm aware that this will only work for one instance, but currently it doesn't 
work at all and it blocks a high priority bug. The only way to make it 100% 
work, would be to have qemu do the binding of the port to a dynamic one and then 
the user queries it after. Otherwise there is always a window where another 
process could bind to the port.

I don't think the bsp should be in the business of choosing which ports to 
forward. And if it is, then it should be a separate option in the qemuboot.conf, 
with just the "-netdev user" part because otherwise the user will always have to 
modify qemuboot.conf just to forward different ports.

It makes more sense to let the user do something like "runqemu slirp=22,65,..." 
and then return back the actual port used in the forwarding.


