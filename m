Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SWQZg-0000hm-9I
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 13:14:52 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q4LB4hUa030624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 May 2012 13:04:44 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1SWQQ2-0000u2-V1; Mon, 21 May 2012 13:04:55 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Andreas Oberritter <obi@opendreambox.org>
References: <1337187331-4945-1-git-send-email-obi@opendreambox.org>
	<89109968-DC24-477E-9E9D-2F255D1EB93B@dominion.thruhere.net>
	<4FB3F434.2040703@opendreambox.org>
	<lymx55fs0d.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA00DC.4000709@opendreambox.org>
	<lyliklevtz.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA1416.3050102@opendreambox.org>
Date: Mon, 21 May 2012 13:04:54 +0200
In-Reply-To: <4FBA1416.3050102@opendreambox.org> (Andreas Oberritter's message
	of "Mon, 21 May 2012 12:08:22 +0200")
Message-ID: <lyd35xeqw9.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -1.3
X-Spam-Level: -
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD
X-Scanned-By: MIMEDefang 2.73
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
X-List-Received-Date: Mon, 21 May 2012 11:14:52 -0000
Content-Type: text/plain; charset=us-ascii

Andreas Oberritter <obi@opendreambox.org> writes:

>>>>> What's the use case for removing packages offline
>> 
>> yes; I am working on the build machine. The NFS filesystem is mounted
>> read-only on the target.
>
> How do you handle prerm and postrm scripts that fail because $D is
> set?

Fortunately, there are very few packages where this failure is
critical (--> package is not working).  Important tasks like user
creation, alternatives handling or systemctl calls take care about
offline package management already.

kernel modules are the only package class which might affect me and is
not suited for offline installation/upgrades.  But I can live with it
because I develop the kernel at a separate location and call 'make
modules_install INSTALL_MOD_PATH=<nfsroot>' there.


> How do you handle the majority of scripts that don't care about $D at
> all?

Examples?  pseudo does a good job for 'systemctl enable/disable' or
update-alternatives operations, 'systemd.bbclass' wraps the 'systemctl
stop/start'.

Btw... your patch is correct about removal of $D. As written above, it
is not needed for 'systemctl disable'.  But I am against removal of
offline capabilities because they are not needed in 80% of use cases.


Enrico


