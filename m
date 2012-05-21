Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWRGg-0005TO-Be
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 13:59:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 10C52315C65E;
	Mon, 21 May 2012 13:49:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id NfG1acL6H3xY; Mon, 21 May 2012 13:49:02 +0200 (CEST)
Received: from [172.22.22.61] (drms-590ed1c8.pool.mediaWays.net
	[89.14.209.200])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 320C5315C65B;
	Mon, 21 May 2012 13:49:02 +0200 (CEST)
Message-ID: <4FBA2BAD.5070709@opendreambox.org>
Date: Mon, 21 May 2012 13:49:01 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <1337187331-4945-1-git-send-email-obi@opendreambox.org>
	<89109968-DC24-477E-9E9D-2F255D1EB93B@dominion.thruhere.net>
	<4FB3F434.2040703@opendreambox.org>
	<lymx55fs0d.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA00DC.4000709@opendreambox.org>
	<lyliklevtz.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA1416.3050102@opendreambox.org>
	<lyd35xeqw9.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyd35xeqw9.fsf@ensc-virt.intern.sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 21 May 2012 11:59:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 21.05.2012 13:04, Enrico Scholz wrote:
> Andreas Oberritter <obi@opendreambox.org> writes:
> 
>>>>>> What's the use case for removing packages offline
>>>
>>> yes; I am working on the build machine. The NFS filesystem is mounted
>>> read-only on the target.
>>
>> How do you handle prerm and postrm scripts that fail because $D is
>> set?
> 
> Fortunately, there are very few packages where this failure is
> critical (--> package is not working).  Important tasks like user
> creation, alternatives handling or systemctl calls take care about
> offline package management already.
> 
> kernel modules are the only package class which might affect me and is
> not suited for offline installation/upgrades.  But I can live with it
> because I develop the kernel at a separate location and call 'make
> modules_install INSTALL_MOD_PATH=<nfsroot>' there.
> 
> 
>> How do you handle the majority of scripts that don't care about $D at
>> all?
> 
> Examples?

Every recipe inheriting gconf.bbclass, gtk-icon-cache.bbclass,
kernel.bbclass, module.bbclass or libc-package.bbclass, for example. You
can use git grep '$D' to find more candidates.

>  pseudo does a good job for 'systemctl enable/disable' or
> update-alternatives operations, 'systemd.bbclass' wraps the 'systemctl
> stop/start'.
> 
> Btw... your patch is correct about removal of $D. As written above, it
> is not needed for 'systemctl disable'.  But I am against removal of
> offline capabilities because they are not needed in 80% of use cases.

Considering that in the meantime my similar patch [1] to systemd.bbclass
got merged into meta-oe by Koen, who initially was against it, I guess
this patch can finally get merged now, too.

Regards,
Andreas

[1]
http://git.openembedded.org/meta-openembedded/commit/?id=637cb7e3d2cfdc74d239a4257e6f3477aa17da4e


