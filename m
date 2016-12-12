Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B0249605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 03:31:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBC3VqWQ019554
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 11 Dec 2016 19:31:52 -0800 (PST)
Received: from [128.224.177.14] (128.224.177.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 11 Dec 2016 19:31:51 -0800
To: Randy Witt <randy.e.witt@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1481014270.git.liezhi.yang@windriver.com>
	<2ecbdf8cca844fb9b76df48f80b0762811dd1b04.1481014270.git.liezhi.yang@windriver.com>
	<4f79b40c-e1a8-3e62-0cbb-ea4c9d4176e4@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <79478da4-8b87-e424-a658-79e113434e28@windriver.com>
Date: Mon, 12 Dec 2016 11:31:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <4f79b40c-e1a8-3e62-0cbb-ea4c9d4176e4@linux.intel.com>
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
X-List-Received-Date: Mon, 12 Dec 2016 03:31:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/08/2016 01:58 AM, Randy Witt wrote:
>
>>      def setup_slirp(self):
>>          """Setup user networking"""
>>
>>          if self.fstype == 'nfs':
>>              self.setup_nfs()
>>          self.kernel_cmdline_script += ' ip=dhcp'
>> -        self.set('NETWORK_CMD', self.get('QB_SLIRP_OPT'))
>> +        # Port mapping
>> +        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
>> +        qb_slirp_opt_default = "-netdev user,id=net0%s" % hostfwd
>> +        qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
>> +        # Figure out the port
>> +        ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
>> +        ports = [int(i) for i in ports]
>> +        mac = 2
>> +        # Find a free port to avoid conflicts
>> +        for p in ports[:]:
>> +            p_new = p
>> +            while not check_free_port('localhost', p_new):
>> +                p_new += 1
>> +                mac += 1
>> +                while p_new in ports:
>> +                        p_new += 1
>> +                        mac += 1
>> +            if p != p_new:
>> +                ports.append(p_new)
>> +                qb_slirp_opt = re.sub(':%s-' % p, ':%s-' % p_new, qb_slirp_opt)
>> +                logger.info("Port forward changed: %s -> %s" % (p, p_new))
> Regardless if the port is changed or not, so that things like tests have an
> easier time of figuring out the port mappings, would it be good add a flag that
> prints out the entire list of ports used, or always do it? i.e. "Port forwarding
> 2222:22 2333:23.... It's not necessary of course, you can  always look at the

Thansk, make sense, I added the following lines:

+        # Print out port foward
+        hostfwd = re.findall('(hostfwd=[^,]*)', qb_slirp_opt)
+        if hostfwd:
+            logger.info('Port forward: %s' % ' '.join(hostfwd))

Now print:
runqemu - INFO - Port forward: hostfwd=tcp::2222-:22 hostfwd=tcp::2323-:23


Updated in the repo:
   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
 
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu

Robert Yang (6):
   scripts/runqemu: fix checking for <file>.cpio.gz
   qemuboot.bbclass: use IMGDEPLOYDIR
   runqemu-export-rootfs: fix inconsistent var names
   runqemu: support mutiple qemus running when nfs
   runqemu: fixes for slirp, network device and hostfwd
   qemuboot.bbclass: add blank lines in comments


// Robert

> command line and then check to see if anything is remapped. But that's a bit
> more work.
>
>> +        mac = "%s%02x" % (self.mac_slirp, mac)
>> +        self.set('NETWORK_CMD', '%s %s' %
>> (self.network_device.replace('@MAC@', mac), qb_slirp_opt))
>
>

