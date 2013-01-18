Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TwBx6-000534-Cw for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 14:25:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0IDAMi5009094;
	Fri, 18 Jan 2013 13:10:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05510-05; Fri, 18 Jan 2013 13:10:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0IDADF3009088
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 18 Jan 2013 13:10:14 GMT
Message-ID: <1358514613.27799.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Fri, 18 Jan 2013 13:10:13 +0000
In-Reply-To: <cover.1358432402.git.laurentiu.palcu@intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Remove obsolete update-modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 13:25:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-17 at 16:58 +0200, Laurentiu Palcu wrote:
> All,
> 
> Working on the postinstall improvements I stumbled over update-modules
> script which postponed postinstalls for all the kernel or kernel module
> packages for first boot. However, after some investigations I saw that this
> script is pretty much obsolete. So, this patchset will remove it from all
> recipes and bbclasses it was referenced.
> 
> Here's why it's useless now:
> 
> update-modules was used mainly to create the /etc/modules.conf file, out of files
> in /etc/modutils, and /etc/modules file from /etc/modules-load.d/*.conf files.
> Then it just ran depmod -A.
> 
> * depmod can be run in the postinst/postrm on its own, no need to run through update-modules;
> * /etc/modules.conf is not used anymore by modprobe. modprobe now looks in
>   /etc/modprobe.d/ directory for *.conf files;
> * /etc/modules was used by /etc/init.d/modutils.sh to automatically load
>   modules at boot. However, I improved the script in order to also look into
>   /etc/modules-load.d/ directory and load all the modules listed there that were not
>   already loaded (in case /etc/modules existed);
> 
> I know this is a major change and will affect a lot of people. But, in order
> to support RO rootfs and run all the postinstalls on host, this change was
> kind of necessary. Note, though, that the update-modules recipe was not removed
> yet. It will be removed eventually but, for now, I decided to leave it in place
> in case some people are nostalgic and want to still use it for a while.

I've merged these, I'll also take a patch to remove update-modules
itself.

Cheers,

Richard



