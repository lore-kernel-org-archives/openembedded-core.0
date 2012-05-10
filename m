Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSKwY-0008Us-9N
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 06:25:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 May 2012 21:15:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="138915702"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2012 21:15:39 -0700
Message-ID: <4FAB40EB.6060409@linux.intel.com>
Date: Wed, 09 May 2012 21:15:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336044432-28854-1-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1336044432-28854-1-git-send-email-jason.wessel@windriver.com>
Subject: Re: [PATCH] terminal.bbclass, oe-buildenv-internal: pass SCREENDIR environment variable
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
X-List-Received-Date: Thu, 10 May 2012 04:25:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2012 04:27 AM, Jason Wessel wrote:
> Some versions of the screen utility provided from the host OS vendor
> write the socket directory to $HOME/.screen.  When using a shared home
> directory across many servers, one sets the SCREENDIR environment
> variable to avoid collisions in the shared home directory.  This
> results in problems launching a devshell where it is not entirely
> obvious what happened because the SCREENDIR environment variable
> got stripped from the environment prior to setting up the screen
> in detached mode.
>
> Example:
>     % bitbake -c devshell busybox
>     # ...Please connect in another terminal with "screen -r devshell"
>
>     % screen -r devshell
>     There is no screen to be resumed matching devshell.
>
> The temporary work around was to do something like:
>     sh -c "unset SCREENDIR; screen -r devshell"
>
> This patch adds SCREENDIR to the white list to ensure screen
> works properly on systems where a developer needs to use
> the SCREENDIR with shared home directories.
> ---
>   meta/classes/terminal.bbclass |    2 +-
>   scripts/oe-buildenv-internal  |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
> index ca28bd2..3cfc84b 100644
> --- a/meta/classes/terminal.bbclass
> +++ b/meta/classes/terminal.bbclass
> @@ -4,7 +4,7 @@ OE_TERMINAL[choices] = 'auto none \
>                           ${@" ".join(o.name \
>                                       for o in oe.terminal.prioritized())}'
>
> -OE_TERMINAL_EXPORTS = 'XAUTHORITY SHELL DBUS_SESSION_BUS_ADDRESS DISPLAY EXTRA_OEMAKE'
> +OE_TERMINAL_EXPORTS = 'XAUTHORITY SHELL DBUS_SESSION_BUS_ADDRESS DISPLAY EXTRA_OEMAKE SCREENDIR'
>   OE_TERMINAL_EXPORTS[type] = 'list'
>
>   XAUTHORITY ?= "${HOME}/.Xauthority"
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 14e728d..9de7b05 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -70,4 +70,4 @@ unset BITBAKEDIR
>   # Used by the runqemu script
>   export BUILDDIR
>   export PATH
> -export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER"
> +export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER SCREENDIR"

Merged into OE-Core

Thanks
	Sau!

(a little late I know).


