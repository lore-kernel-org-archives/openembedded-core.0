Received: from smtpout.karoo.kcom.com ([212.50.160.34])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1TPHaQ-0003a4-UE
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 20:46:22 +0200
X-IronPort-AV: E=Sophos;i="4.80,615,1344207600"; d="scan'208";a="667353990"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 19 Oct 2012 19:33:01 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.72)
	(envelope-from <mac@mcrowe.com>)
	id 1TPHNV-0004ZR-E6; Fri, 19 Oct 2012 19:33:01 +0100
Date: Fri, 19 Oct 2012 19:33:01 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20121019183301.GA17013@mcrowe.com>
References: <20121019153834.GA13159@mcrowe.com>
	<CABcZANkWq0YZ38E9cCDvoJvpou0eunXJcHUUQCnbhRmDm_oQLg@mail.gmail.com>
	<20121019165738.GC14620@mcrowe.com>
	<CABcZANkCuggDC-rmqBA=N3GaWqTYWAPr+9eOoECiTSGVVgQN7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANkCuggDC-rmqBA=N3GaWqTYWAPr+9eOoECiTSGVVgQN7A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Using SSTATE_MIRRORS with sstate subdirectories
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
X-List-Received-Date: Fri, 19 Oct 2012 18:46:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 19, 2012 at 10:41:17AM -0700, Chris Larson wrote:
> On Fri, Oct 19, 2012 at 9:57 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > SSTATE_MIRRORS = "\
> > file://Debian-testing/.* file:///private/sstate-cache/Debian-6.0.6/PATH \n \
> > file://.* file:///private/sstate-cache/PATH \n \
> > "
> >
> > Then I get paths like:
> >
> > DEBUG: For url file://Debian-testing/8c/sstate-tar-replacement-native-x86_64-linux-1.26-r3-x86_64-2-8cc4342260b064ace38e0aa1acf2f618_populate-sysroot.tgz returning file:///private/sstate-cache/Debian-6.0.6/Debian-testing/8c/sstate-tar-replacement-native-x86_64-linux-1.26-r3-x86_64-2-8cc4342260b064ace38e0aa1acf2f618_populate-sysroot.tgz
> 
> SSTATE_MIRRORS = "\
> file://${LSBNATIVESTRING} file:///private/sstate-cache/Debian-6.0.6 \n \
> file://.* file:///private/sstate-cache/PATH \n \
> "

Hi Chris,

Thanks for your reply.

After correcting ${LSBNATIVESTRING} to ${NATIVELSBSTRING} that worked!

I'm still somewhat baffled as to why that one doesn't require PATH but
the general one does but that no longer matters to me.
 
> We do this at mentor with a class to simplify the setup. See
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/tree/classes/sstate-reuse.bbclass.
> Then you'd do this:
> 
> INHERIT += "sstate-reuse"
> SSTATE_MIRROR_DISTROS = "Debian-testing"
> SSTATE_MIRROR_SITES = "file:///private/sstate-cache"
> 
> We do most of our automated builds on 32 bit and 64 bit centos 5.4
> hosts, then those native/cross sstates can then be reused just about
> everywhere, since that distro is so old.

Thanks. That looks interesting. I'm trying to do something similar,
except our main automated build machine is Debian stable and the
"clients" are Debian stable, testing and Ubuntu recent. I'd made the
same assumption that binaries compiledon Debian stable should run on
all the others.

Thanks again.

Mike.


