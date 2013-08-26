Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-02.prod.phx3.secureserver.net
	(p3plsmtpa06-02.prod.phx3.secureserver.net [173.201.192.103])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAAC6A9E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 00:47:42 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-02.prod.phx3.secureserver.net with 
	id HCni1m0011mTNtu01CniWE; Sun, 25 Aug 2013 17:47:43 -0700
Message-ID: <521AA5AF.8020205@pabigot.com>
Date: Sun, 25 Aug 2013 19:47:43 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
References: <1377477606-17591-1-git-send-email-pab@pabigot.com>
In-Reply-To: <1377477606-17591-1-git-send-email-pab@pabigot.com>
Subject: Re: [PATCH] pseudo: fix memory leak and missed privilege drop
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
X-List-Received-Date: Mon, 26 Aug 2013 00:47:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/25/2013 07:40 PM, Peter A. Bigot wrote:
> From: "Peter A. Bigot" <pab@pabigot.com>
>
> qemu.bbclass adds PSEUDO_UNLOAD=1 in qemu_run_binary to avoid reference to
> pseudo functions that may not exist in the target environment.  This patch
> detects the addition of that variable within the environment to which the
> call applies, even if not present in the parent environment.
>
> As a side effect it fixes a memory leak.
>
> [YOCTO #4843]

Some explanation because this one bothers me:

I ran into bug #4843 when building core-image-minimal on an Ubuntu 12.04 
host under x86_64, where the RPM post-install script for udev-hwdb ran 
udevadm under qemu-arm.  I added some debug code to pseudo and 
determined that pseudo_dropenv() was not being invoked for these 
commands, making the presence of PSEUDO_UNLOAD=1 irrelevant.

I discovered that the code that implements the unload didn't look at the 
environment that applied to the operation, only to the environment in 
which pseudo was being run.  I also noticed that the need-to-unload code 
appears to have a memory leak.

Please look this over; it does work for me, and it seems like the right 
approach, but it also seems like the approach couldn't possibly have 
worked in the past and should have been detected before so maybe there's 
something else going on my environment.

Peter

