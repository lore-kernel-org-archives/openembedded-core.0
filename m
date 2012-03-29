Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren.hart@intel.com>) id 1SDOP4-0002tF-Q8
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 01:05:16 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Mar 2012 15:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83285084"
Received: from unknown (HELO envy.home) ([10.255.12.115])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Mar 2012 15:56:09 -0700
Message-ID: <4F74E85E.6060800@intel.com>
Date: Thu, 29 Mar 2012 15:55:26 -0700
From: Darren Hart <darren.hart@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1332952962.git.dexuan.cui@intel.com>
	<1333058859.18082.44.camel@ted>
In-Reply-To: <1333058859.18082.44.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] genext2fs: support large files and filesystems without using large amounts of memor
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 23:05:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/29/2012 03:07 PM, Richard Purdie wrote:
> On Thu, 2012-03-29 at 00:51 +0800, Dexuan Cui wrote:
>> Hi RP, Saul, Paul, Darren, Mark, Josh and joaohf and all, please comment.
>>
>> Let's figure out if this big patch is accepatable or not...
>>
>> With this patch, I can successfully create a 8.5GB .ext3 file with genext2fs.
>> The speed is slow -- I spent about 1.5 hours.
> 
> If these patches solved all the problems and made things work
> wonderfully I'd probably say we'd take them. Unfortunately I don't
> consider taking 1.5 hours to build am 8GB filesystem "wonderful", its
> rather worrying and I don't think its performing any where need fast
> enough for our needs :(.
> 
> Patching genext2fs at this point in the cycle is a rather risky
> undertaking too and I'm getting very concerned about this. 
> 
> We might have to look at alternative ways to solve this problem. I think
> Darren said he might help look at this and has some other ideas. Darren?

Without having looked into this very far, I seem to recall this was
generating sparse files. This means every time we copy something into
the filesystem it has to allocate the space on the drive. This is great
for building big filesystems that will be mostly empty - but for big
filesystems that we plan to mostly populate, I believe we would be
better off doing pre-allocation (I'm taking this from my experience
creating VMs in virtmanager). However, since using dd to create the file
would require mounting it in order to copy files across (and we want to
avoid requiring root permissions during build), this may not be an option.

Have we tried without the -z option? (-z allows holes in files - I
presume this means sparse files).

Depending on how much of the 8.5 GB image we are filling, we may get a
significant speed increase by first generating a smaller image and then
using resize2fs to grow it to the desired size (referencing
http://landley.livejournal.com/47024.html).


A quick test without passing an initial rootfs showed no difference
between -z and no -z. It may still be worth trying with the actual
population to see if that makes a difference.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


