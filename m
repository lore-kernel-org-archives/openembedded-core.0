Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1URlne-0002H5-OL for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 17:58:37 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FFeV2S021371; Mon, 15 Apr 2013 16:41:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lchLy5GrC2-7; Mon, 15 Apr 2013 16:41:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FFfGJK021397
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 15 Apr 2013 16:41:17 +0100
Message-ID: <1366040453.8670.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Mon, 15 Apr 2013 16:40:53 +0100
In-Reply-To: <516C19C6.9080807@windriver.com>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1366024028-24911-8-git-send-email-richard.purdie@linuxfoundation.org>
	<516C19C6.9080807@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/7] allarch: Drop various problematic allarch usages
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
X-List-Received-Date: Mon, 15 Apr 2013 15:58:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-15 at 10:16 -0500, Mark Hatle wrote:
> On 4/15/13 6:07 AM, Richard Purdie wrote:
> > In each of these cases allarch is used where the package in question has a
> > dependency on things which are not allach and change when MACHINE is changed.
> >
> > This leads to a rebuild of the package each time MACHINE is switched and
> > the sstate checksum changes. The dependencies in question are not suited
> > be being marked as ABISAFE.
> 
> In each of these cases, does the contents of the package change when the MACHINE 
> (or something in that machine) are modified?  If so, I agree they are definitely 
> not allarch.

The contents does not, the sstate checksum however does due to the
dependencies. The dependencies are thinks like gtk+ and dbus.

> However, if the dependency really doesn't matter, then why isn't ABISAFE correct 
> in each case?

I'm using ABISAFE in this context as shorthand for
SIGGEN_EXCLUDERECIPES_ABISAFE and those are defined as things which
don't need to rebuild if the dependency changes.

gtk+ and dbus both provide libraries and we do want software to rebuild
if they change. In the allarch case we could whitelist the dependency
however in the general case we shouldn't.

Even with that problem addressed somehow, it leaves an issue with ipk
multilibs where the distcc-config allarch recipe would always depend
upon "distcc" and hence distcc would get pulled into the image,
regardless of any other multilib settings (which in turn pulls in gtk+
for example). A "lib64-xxx-image" would therefore end up with near
enough two copies of half the system due to this. This is something we
really need to fix in the opkg implementation of multilibs but I have no
idea how.

Combine the two issues together, neither of which can be addressed at
this point of the release cycle and I put the above patch forwards until
we can better resolve this.

Cheers,

Richard




