Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TPAd3-0002gW-Ss for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 13:20:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JB7DMb029806;
	Fri, 19 Oct 2012 12:07:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29505-03; Fri, 19 Oct 2012 12:07:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JB763A029800
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 19 Oct 2012 12:07:07 +0100
Message-ID: <1350644825.2520.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 19 Oct 2012 12:07:05 +0100
In-Reply-To: <20121019105559.GJ3087@jama.jama.net>
References: <1350588305-16854-1-git-send-email-sgw@linux.intel.com>
	<20121019105559.GJ3087@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate: add manifest info for shared file matches
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
X-List-Received-Date: Fri, 19 Oct 2012 11:20:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-10-19 at 12:55 +0200, Martin Jansa wrote:
> On Thu, Oct 18, 2012 at 12:25:05PM -0700, Saul Wold wrote:
> > Present the manifest file that contains the matches for
> > files being installed to a location that already contains
> > that file. This will help to determine which is the correct
> > recipe to fix when this occurs.
> > 
> > [YOCTO #3191]
> 
> Can we do the same when removing files from sysroot?
> 
> To catch errors like this:
> http://git.openembedded.org/openembedded-core/commit/?id=6b12d4cd39bacb087654b59e25f5052a4e839b26
> 
> 12:40:15 < JaMa> it depends on order of tasks
> 12:41:27 < JaMa> gettext-native depends on gettext-minimal-native, so gettext-minimal-native installs own config.rpath to sysroot (when gettext-native "owns"
>                  it too)
> 12:41:55 < JaMa> then gettext-native is built and before populting sysroot it removes own files there (including config.rpath)
> 12:43:45 < JaMa> and because sstate assumes that every file in sysroot is provided by exactly one recipe, gettext-minimal-native looses his config.rpath
> 12:44:49 < JaMa> now there is at least warning when 2 recipes are installing the same file to sysroot, but that doesn't resolve this issues when some file is
>                  "moved" between recipes
> 12:47:30 < JaMa> because gettext-minimal-native is only recipe installing it
> 12:47:39 < JaMa> and gettext-native is only removing it
> 
> If we check manifests from other recipes before removing files we can show warning that
> gettext-native is trying to remove config.rpath now provided by gettext-minimal-native
> and keep config.rpath in sysroot.

The plan is to make it a hard error if something installs a file that
already exists. This issue will be resolved when that happens and I want
to get there sooner than later.

Running the check at sysroot clean time is therefore going to complicate
the code a lot and damage performance with no real end need...

> Now everybody doing incremental builds needs to call
> bitbake -c cleansstate gettext-minimal-native

-c clean should be sufficient. I wish people would use appropriately
sized hammers and this is why I never wanted cleansstate in the first
place :(.

Cheers,

Richard



