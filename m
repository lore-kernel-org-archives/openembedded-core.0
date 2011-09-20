Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R68ID-0002cC-22 for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 23:55:53 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8KLulXW004187 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 22:56:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hKKzXrrLoPqR
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 22:56:47 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8KLueiv004173
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 22:56:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 22:50:23 +0100
In-Reply-To: <2539230a1b1e941f43d6b6b3b686d90dac900410.1316553828.git.mark.hatle@windriver.com>
References: <cover.1316553828.git.mark.hatle@windriver.com>
	<2539230a1b1e941f43d6b6b3b686d90dac900410.1316553828.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316555432.14488.88.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/7] rootfs_rpm: Use specific MACHINE_ARCH for multilib recipes
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
X-List-Received-Date: Tue, 20 Sep 2011 21:55:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-20 at 16:33 -0500, Mark Hatle wrote:
> From: Dongxiao Xu <dongxiao.xu@intel.com>
> 
> Currently MACHINE_ARCH deploy folder is unique in multilib system, thus
> a lib32 version of rpm package will override a normal rpm package if its
> PACKAGE_ARCH is ${MACHINE_ARCH}.
> 
> Take netbase as an example, which the PACKAGE_ARCH = MACHINE_ARCH. Both
> the normal version of netbase package and the lib32 version are named as
> "netbase-4.45-r1.qemux86_64.rpm" putting in tmp/deploy/rpm/qemux86-64
> directory, so we need to differentiate them.
> 
> Here we define spedific MACHINE_virtclass-multilib-lib(xx) to override
> the default MACHINE value, thus got different MACHINE_ARCH to fix this
> issue.

We simply *cannot* do this and this patch cannot be merged. I thought
I'd explained this once but I will try and do so again.

The problem is MACHINE specific packages can have generic content. They
may have binaries, libraries or other things contained within them. Lets
assume we have a strange system which has files in /lib, /lib32
and /lib64. We need the following permutations:

qemux86 /lib
qemux86 /lib64
qemux86 /lib32

and these are not equal to:

qemux86_64 /lib
qemux86_64 /lib64
qemux86_64 /lib32

which may or may not have different contents or different optimisations
applied to the binaries/libraries contained within.

You are trying to take a shortcut here and cross link these two sets and
that doesn't scale to generic combinations. 

Furthermore, MACHINE is meant to be consistent within a given build and
changing MACHINE for different multilibs will have all kinds of
unintended consequences (such as the cache file location changing for
different recipes).

Wasn't there an alternative proposal from Dongxiao that added MLPREFIX
to MACHINE_ARCH and resolved this issue that way instead? I know that
causes issues at the package management level but I think we're going to
have to run with that approach and resolve any issues it leads to...

Cheers,

Richard







