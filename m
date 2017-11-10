Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 64DE9785DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 14:21:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2017 06:21:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,374,1505804400"; d="scan'208";a="172078232"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 10 Nov 2017 06:21:31 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1510275834.git.liezhi.yang@windriver.com>
	<65b92ba827b1b5252355bb8d656b73286ec182fb.1510275834.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6adc72a1-8fd1-7e85-36c4-565d659fb438@linux.intel.com>
Date: Fri, 10 Nov 2017 16:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <65b92ba827b1b5252355bb8d656b73286ec182fb.1510275834.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 13/23] package_manager.py: reverse archs correctly
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
X-List-Received-Date: Fri, 10 Nov 2017 14:21:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/10/2017 08:27 AM, Robert Yang wrote:

> -        if arch_var == None:
> -            self.archs = self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_")
> +
> +        if arch_var:
> +            self.archs = self.d.getVar(arch_var).replace("-","_").split()
> +        else:
> +            self.archs = self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_").split()
> +        # Reverse archs to ensure the -best- match is listed firstly, but need
> +        # make sure not mixed with multilib archs, and let multilib archs have
> +        # higher a priority for multilib image:
> +        # For non-multilib image: (e.g., core-image-minimal)
> +        # machine_arch:package_archs:multilib_archs:allarch_archs
> +        # For multilib image: (e.g., lib32-core-image-minimal)
> +        # machine_arch:multilib_archs:package_archs:allarch_archs
> +        package_archs_var = self.d.getVar('PACKAGE_ARCHS').replace("-","_").split()
> +        machine_arch_var = [self.d.getVar('MACHINE_ARCH').replace("-","_")]
> +        package_archs = []
> +        allarch_archs = []
> +        ml_archs = []
> +        machine_arch = []
> +        for arch in self.archs:
> +            if arch in machine_arch_var:
> +                bb.note("Found MACHINE_ARCH: %s" % arch)
> +                machine_arch.append(arch)
> +            elif arch in package_archs_var:
> +                bb.note("Found PACKAGE_ARCH: %s" % arch)
> +                package_archs.append(arch)
> +            elif arch in 'all any noarch'.split():
> +                bb.note("Found allarch: %s" % arch)
> +                allarch_archs.append(arch)
> +            else:
> +                bb.note("Found multilib arch: %s" % arch)
> +                ml_archs.append(arch)
> +        package_archs.reverse()
> +        if machine_arch:
> +            self.archs = machine_arch
> +        mlprefix = self.d.getVar('MLPREFIX')
> +        if ml_archs:
> +            ml_archs.reverse()
> +            if mlprefix:
> +                self.archs += ml_archs + package_archs
> +            else:
> +                self.archs += package_archs + ml_archs
>           else:
> -            self.archs = self.d.getVar(arch_var).replace("-","_")
> +            self.archs = package_archs
> +
> +        self.archs += allarch_archs
> +        self.archs = ' '.join(self.archs)
> +        bb.note("The archs used by package manager: %s" % self.archs)
> +

Can you place all of this in a helper function please?

Alex

