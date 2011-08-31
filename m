Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX182/VPCO+VK+S83Eoe90/qAfOtnWn4om8c=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qyd5d-0004nZ-ID
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 07:11:53 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7V56P1M002636;
	Wed, 31 Aug 2011 00:06:25 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1311858624-3686-1-git-send-email-galak@kernel.crashing.org>
Date: Wed, 31 Aug 2011 00:06:29 -0500
Message-Id: <BCA18FF8-8F94-4E3D-836A-D7B99830E4E6@kernel.crashing.org>
References: <1311858624-3686-1-git-send-email-galak@kernel.crashing.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
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
X-List-Received-Date: Wed, 31 Aug 2011 05:11:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 28, 2011, at 8:10 AM, Kumar Gala wrote:

> If a SOCKS5 gateway is needed for a proxy access like git it might =
also
> require authentication to the proxy via a password and username.  =
Adding
> SOCKS5_USER & SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for automation
> of the authentication request to occur when something like a git fetch
> is going through the proxy.
>=20
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> * Fixes issue with a git fetch request failing to get pass a firewall
>=20
> scripts/oe-buildenv-internal |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/scripts/oe-buildenv-internal =
b/scripts/oe-buildenv-internal
> index c13fc40..b223292 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -55,4 +55,4 @@ unset BITBAKEDIR
> export BUILDDIR
> export PATH
>=20
> -export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO TCMODE TCLIBC http_proxy =
ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID =
SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS =
PARALLEL_MAKE GIT_PROXY_COMMAND"
> +export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO TCMODE TCLIBC http_proxy =
ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID =
SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS =
PARALLEL_MAKE GIT_PROXY_COMMAND SOCKS5_PASSWD SOCSK5_USER"
> --=20
> 1.7.3.4

Richard,

I'm able reproduce this, with out my patch I get prompted for a socks =
password, w/it having SOCKS5_PASSWD set in my environment the git clone =
is able to succeed.

So from our discussion a while back on IRC:

Aug 11 10:54:20 <RP__>	galak: Well, it will but it will only place it =
in the internal data store
Aug 11 10:54:42 <RP__>	galak: there isn't anything to say "also export =
this from the data store into the environment that bitbake uses"

=46rom the way I read  bitbake/lib/bb/utils.py:

def approved_variables():
    """
    Determine and return the list of whitelisted variables which are =
approved
    to remain in the environment.
    """
...

[ this will add SOCKS5_PASSWD to the 'approved' list ]

and

def filter_environment(good_vars):

[ will not skip unsetting it from the environment since its in the =
'approved' list ]

That seems to explain how this ends up working.

So question is what else needs to be done to get this accepted ?

- k=


