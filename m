Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1Lcl-0001F7-6k for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 19:09:19 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87HA9NZ015634; Wed, 7 Sep 2011 18:10:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DReSRcrn-Tjm; Wed,  7 Sep 2011 18:10:09 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87HA4gu015624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 7 Sep 2011 18:10:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <BCA18FF8-8F94-4E3D-836A-D7B99830E4E6@kernel.crashing.org>
References: <1311858624-3686-1-git-send-email-galak@kernel.crashing.org>
	<BCA18FF8-8F94-4E3D-836A-D7B99830E4E6@kernel.crashing.org>
Date: Wed, 07 Sep 2011 18:04:01 +0100
Message-ID: <1315415041.13021.9.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/oe-buildenv-internal: Add SOCKS5_{USER, PASSWD} to BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Wed, 07 Sep 2011 17:09:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-31 at 00:06 -0500, Kumar Gala wrote:
> On Jul 28, 2011, at 8:10 AM, Kumar Gala wrote:
> 
> > If a SOCKS5 gateway is needed for a proxy access like git it might also
> > require authentication to the proxy via a password and username.  Adding
> > SOCKS5_USER & SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for automation
> > of the authentication request to occur when something like a git fetch
> > is going through the proxy.
> > 
> > Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> > ---
> > * Fixes issue with a git fetch request failing to get pass a firewall
> > 
> > scripts/oe-buildenv-internal |    2 +-
> > 1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> > index c13fc40..b223292 100755
> > --- a/scripts/oe-buildenv-internal
> > +++ b/scripts/oe-buildenv-internal
> > @@ -55,4 +55,4 @@ unset BITBAKEDIR
> > export BUILDDIR
> > export PATH
> > 
> > -export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND"
> > +export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND SOCKS5_PASSWD SOCSK5_USER"
> > -- 
> > 1.7.3.4
> 
> Richard,
> 
> I'm able reproduce this, with out my patch I get prompted for a socks password, w/it having SOCKS5_PASSWD set in my environment the git clone is able to succeed.
> 
> So from our discussion a while back on IRC:
> 
> Aug 11 10:54:20 <RP__>	galak: Well, it will but it will only place it in the internal data store
> Aug 11 10:54:42 <RP__>	galak: there isn't anything to say "also export this from the data store into the environment that bitbake uses"
> 
> From the way I read  bitbake/lib/bb/utils.py:
> 
> def approved_variables():
>     """
>     Determine and return the list of whitelisted variables which are approved
>     to remain in the environment.
>     """
> ...
> 
> [ this will add SOCKS5_PASSWD to the 'approved' list ]
> 
> and
> 
> def filter_environment(good_vars):
> 
> [ will not skip unsetting it from the environment since its in the 'approved' list ]
> 
> That seems to explain how this ends up working.
> 
> So question is what else needs to be done to get this accepted ?

To put this simply, this patch shouldn't work. The fact that it does
worried me and there is a bitbake bug. You can do something like this:

BB_ENV_EXTRAWHITE="$BB_ENV_EXTRAWHITE FOO" FOO=1 bitbake quilt-native -c devshell

and see FOO=1 in the shell. It should only do that if the metadata also
does "export FOO" which it does not.

So, no, this patch isn't right and we'll need to actually export the
variables once I fix the above bug.

Cheers,

Richard




