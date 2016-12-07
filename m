Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0633D71B0B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 17:58:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Dec 2016 09:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,314,1477983600"; d="scan'208";a="15005368"
Received: from bitbang.jf.intel.com (HELO [10.7.199.68]) ([10.7.199.68])
	by orsmga002.jf.intel.com with ESMTP; 07 Dec 2016 09:58:54 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1481014270.git.liezhi.yang@windriver.com>
	<2ecbdf8cca844fb9b76df48f80b0762811dd1b04.1481014270.git.liezhi.yang@windriver.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <4f79b40c-e1a8-3e62-0cbb-ea4c9d4176e4@linux.intel.com>
Date: Wed, 7 Dec 2016 09:58:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <2ecbdf8cca844fb9b76df48f80b0762811dd1b04.1481014270.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH V2 5/6] runqemu: fixes for slirp, network device and hostfwd
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
X-List-Received-Date: Wed, 07 Dec 2016 17:58:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


>      def setup_slirp(self):
>          """Setup user networking"""
>
>          if self.fstype == 'nfs':
>              self.setup_nfs()
>          self.kernel_cmdline_script += ' ip=dhcp'
> -        self.set('NETWORK_CMD', self.get('QB_SLIRP_OPT'))
> +        # Port mapping
> +        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
> +        qb_slirp_opt_default = "-netdev user,id=net0%s" % hostfwd
> +        qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
> +        # Figure out the port
> +        ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
> +        ports = [int(i) for i in ports]
> +        mac = 2
> +        # Find a free port to avoid conflicts
> +        for p in ports[:]:
> +            p_new = p
> +            while not check_free_port('localhost', p_new):
> +                p_new += 1
> +                mac += 1
> +                while p_new in ports:
> +                        p_new += 1
> +                        mac += 1
> +            if p != p_new:
> +                ports.append(p_new)
> +                qb_slirp_opt = re.sub(':%s-' % p, ':%s-' % p_new, qb_slirp_opt)
> +                logger.info("Port forward changed: %s -> %s" % (p, p_new))
Regardless if the port is changed or not, so that things like tests have an 
easier time of figuring out the port mappings, would it be good add a flag that 
prints out the entire list of ports used, or always do it? i.e. "Port forwarding 
2222:22 2333:23.... It's not necessary of course, you can  always look at the 
command line and then check to see if anything is remapped. But that's a bit 
more work.

> +        mac = "%s%02x" % (self.mac_slirp, mac)
> +        self.set('NETWORK_CMD', '%s %s' % (self.network_device.replace('@MAC@', mac), qb_slirp_opt))


