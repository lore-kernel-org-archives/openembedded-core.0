Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SWRXn-0000FY-JI
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 14:16:59 +0200
Received: by werg55 with SMTP id g55so3494823wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 05:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Ihp0phPUTXp1X+GgvanCDi/S69KHOuk9ZRsYXC0CyKw=;
	b=EY5K7hTYcfnySoKDZSiZBIQEPWDJtWlanDuWNautHUKRHTAJUY69J79pkhlVOLUKpV
	Hn6y2238fTteFk8obsl4Er7hZKZJb5anG19d3QhOOocGh5qxy86AT6f6sOmGl2BZiATq
	K06Ixntps3M+2V+YBzmayhA3TpVB4fac5bmLlu3aHWZocYS+uEoWdNPIe/icCZdswkh9
	1kzWbaLuI60XBErZPjIUjTuxgKEwA0+siSPa3fJBbj1HwDE7SrqiIpKe8aCBizmpBpg7
	RyOlmWfA4p23LE2fBjH0aF9fPH+V9FlH6UlhKBETEpz4OI3j9dFLarfg9zJPoegS7ymz
	KtRw==
Received: by 10.216.139.129 with SMTP id c1mr13403096wej.48.1337602012110;
	Mon, 21 May 2012 05:06:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gv4sm39482050wib.8.2012.05.21.05.06.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 05:06:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FBA2BAD.5070709@opendreambox.org>
Date: Mon, 21 May 2012 14:06:48 +0200
Message-Id: <401C0B52-7177-4259-AABB-63F942E77EBF@dominion.thruhere.net>
References: <1337187331-4945-1-git-send-email-obi@opendreambox.org>
	<89109968-DC24-477E-9E9D-2F255D1EB93B@dominion.thruhere.net>
	<4FB3F434.2040703@opendreambox.org>
	<lymx55fs0d.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA00DC.4000709@opendreambox.org>
	<lyliklevtz.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA1416.3050102@opendreambox.org>
	<lyd35xeqw9.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA2BAD.5070709@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQniNxjQNzuU5naoma/2xxj6fiSwOUmhRONIMRFxmfpigUWGrXyZWbctLfe5wJzR/3W9o1GN
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] avahi-systemd: drop postrm, use prerm instead
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
X-List-Received-Date: Mon, 21 May 2012 12:16:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 21 mei 2012, om 13:49 heeft Andreas Oberritter het volgende geschreven:

> On 21.05.2012 13:04, Enrico Scholz wrote:
>> Andreas Oberritter <obi@opendreambox.org> writes:
>> 
>>>>>>> What's the use case for removing packages offline
>>>> 
>>>> yes; I am working on the build machine. The NFS filesystem is mounted
>>>> read-only on the target.
>>> 
>>> How do you handle prerm and postrm scripts that fail because $D is
>>> set?
>> 
>> Fortunately, there are very few packages where this failure is
>> critical (--> package is not working).  Important tasks like user
>> creation, alternatives handling or systemctl calls take care about
>> offline package management already.
>> 
>> kernel modules are the only package class which might affect me and is
>> not suited for offline installation/upgrades.  But I can live with it
>> because I develop the kernel at a separate location and call 'make
>> modules_install INSTALL_MOD_PATH=<nfsroot>' there.
>> 
>> 
>>> How do you handle the majority of scripts that don't care about $D at
>>> all?
>> 
>> Examples?
> 
> Every recipe inheriting gconf.bbclass, gtk-icon-cache.bbclass,
> kernel.bbclass, module.bbclass or libc-package.bbclass, for example. You
> can use git grep '$D' to find more candidates.
> 
>> pseudo does a good job for 'systemctl enable/disable' or
>> update-alternatives operations, 'systemd.bbclass' wraps the 'systemctl
>> stop/start'.
>> 
>> Btw... your patch is correct about removal of $D. As written above, it
>> is not needed for 'systemctl disable'.  But I am against removal of
>> offline capabilities because they are not needed in 80% of use cases.
> 
> Considering that in the meantime my similar patch [1] to systemd.bbclass
> got merged into meta-oe by Koen, who initially was against it, I guess
> this patch can finally get merged now, too.

Crap, I missed the $D part, that's going to get reverted


