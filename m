Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SPhOX-0001Vk-MA
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:47:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q42LbjNZ011161
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 May 2012 14:37:45 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 2 May 2012 14:37:45 -0700
Message-ID: <4FA1A928.20309@windriver.com>
Date: Wed, 2 May 2012 16:37:44 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<DE7E5733-CC28-46DD-A4BC-C1AA663F925B@dominion.thruhere.net>
	<4FA145AD.4070606@windriver.com>
	<965C6250-6D1E-438E-8207-1E1D9DAF398A@dominion.thruhere.net>
In-Reply-To: <965C6250-6D1E-438E-8207-1E1D9DAF398A@dominion.thruhere.net>
X-Enigmail-Version: 1.4.1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Wed, 02 May 2012 21:47:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/02/2012 09:44 AM, Koen Kooi wrote:
> Op 2 mei 2012, om 16:33 heeft Jason Wessel het volgende geschreven:
>
>> On 05/02/2012 09:29 AM, Koen Kooi wrote:
>>> Op 2 mei 2012, om 16:23 heeft Jason Wessel het volgende geschreven:
>>>
>>>> The user mode NFS server does not get built by default when you are
>>>> using a purely command line driven development environment without SDK
>>>> tools.  In order to accommodate simple test configurations and have
>>>> all the tools built for the minimal validation with qemu-native,
>>>> simply add the dependency to unfs-server-native.
>>> So all images I build for e.g. qemux86 now have an nfs-server? Can we please move settings like that to the specific images?
>>>
>> This is part of the simulation environment.  Not all of the run qemu functionality works correctly without this.
> I repeat:  Can we please move settings like that to the specific images?
>
> I don't need nor want nfs servers in the images I build for qemu. And they work just fine without it.

Are you advocating that you really want to make the system harder to use where somethings just do not work out of the box for no obvious reason?   I realize that for your particular use case everything works fine, or you would be submitting patches to fix it.

The qemux86 appears to be a very generic BSP aimed at having an easy to use simulation environment.  If you build a minimal image it would seem that it should work for all the the runqemu boot methods out of the box with no additional steps.

If your BSP has no simulator, you will not be building QEMU and in theory, this is not an issue.

Example of what happens today:

1) . ../oe-init-build-env
2) bitbake core-image-minimal
3) runqemu-extract-sdk tmp/deploy/images/core-image-minimal-qemux86.tar.bz2 nfs
4) runqemu qemux86 nographic `pwd`/nfs
--- And now the error ---
Error: Unable to find rpc.mountd binary in /opt/poky/scratch/build/tmp/sysroots/x86_64-linux/usr/sbin/
--------------------------------


If you are in absolute disagreement with this patch, please suggest a way to accomplish the same thing with the same number of steps or fewer.  Arguably, I'd like to even go a step further and reduce this to 3 steps where the runqemu can auto extract the NFS root on demand if it is not already there.

It seems that the runqemu could also be modified to allow you to choose slirp networking such that no root access is needed at all for invoking the simulation.  All such changes are aimed at simplistic generic use of the generated images.

Cheers,
Jason.


