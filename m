Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SRXTb-000071-KP
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 01:36:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2012 16:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="137986634"
Received: from unknown (HELO [10.7.198.150]) ([10.7.198.150])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2012 16:25:26 -0700
Message-ID: <4FA859E5.4080609@linux.intel.com>
Date: Mon, 07 May 2012 16:25:25 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
	<1336065154-8513-2-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1336065154-8513-2-git-send-email-rep.dot.nop@gmail.com>
Subject: Re: [PATCH 2/6] runqemu: use modern, single-char name of test(1)
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
X-List-Received-Date: Mon, 07 May 2012 23:36:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/12 10:12, Bernhard Reutner-Fischer wrote:
> @@ -313,11 +313,11 @@ findimage() {
>       # recently created one is the one we most likely want to boot.
>       filenames=`ls -t $where/*-image*$machine.$extension 2>/dev/null | xargs`
>       for name in $filenames; do
> -        if [[ "$name" =~ core-image-sato-sdk ||
> -              "$name" =~ core-image-sato     ||
> -              "$name" =~ core-image-lsb      ||
> -              "$name" =~ core-image-basic    ||
> -              "$name" =~ core-image-minimal ]]; then
> +        if [ "$name" =~ core-image-sato-sdk -o \
> +              "$name" =~ core-image-sato     -o \
> +              "$name" =~ core-image-lsb      -o \
> +              "$name" =~ core-image-basic    -o \
> +              "$name" =~ core-image-minimal ]; then
>               ROOTFS=$name
>               return
>           fi	

This change broke findimage() for me on both bash and dash. Reproducer 
is 'runqemu qemux86'.

Under bash I get:

/srv/yocto/poky/scripts/runqemu: line 303: [: too many arguments

Undoing this change fixes things for me. Note: this change doesn't 
revert cleanly.

I've filed this as Yocto #2433:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=2433

As an aside, when trying (unsuccessfully) to figure out a fix for this I 
ran across Ubuntu's page on dash[1] which indicates changing || for -o 
isn't right. Anyone have a strong opinion on that?

Cheers,
Joshua

1. https://wiki.ubuntu.com/DashAsBinSh
-- 
Joshua Lock
         Yocto Project
         Intel Open Source Technology Centre


