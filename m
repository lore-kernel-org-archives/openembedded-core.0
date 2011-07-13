Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qh5IC-0003ES-KB for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:40:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DJaLo7001121;
	Wed, 13 Jul 2011 20:36:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30590-10; Wed, 13 Jul 2011 20:36:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DJaDFH001114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 13 Jul 2011 20:36:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <2a927e54abaec88f79de810e5b48293d4db4740a.1310581914.git.kergoth@gmail.com>
References: <cover.1310581914.git.kergoth@gmail.com>
	<2a927e54abaec88f79de810e5b48293d4db4740a.1310581914.git.kergoth@gmail.com>
Date: Wed, 13 Jul 2011 20:36:11 +0100
Message-ID: <1310585771.20015.1121.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/2] Rework how the devshell functions
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
X-List-Received-Date: Wed, 13 Jul 2011 19:40:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 11:35 -0700, Christopher Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> In the new implementation, each known terminal is defined as a class in
> oe.terminal, as a subclass of bb.process.Popen.  terminal.bbclass wraps this
> functionality, providing the metadata pieces.  It obeys the OE_TERMINAL
> variable, which is a 'choice' typed variable.  This variable may be 'auto',
> 'none', or any of the names of the defined terminals.
> 
> When using 'auto', or requesting an unsupported terminal, we attempt to spawn
> them in priority order until we get one that's available on this system (and
> in the case of the X terminals, has DISPLAY defined).  The 'none' value is
> used when we're doing things like automated builds, and want to ensure that no
> terminal is *ever* spawned, under any circumstances.
> 
> Current available terminals:
> 
>     gnome
>     konsole
>     xterm
>     rxvt
>     screen
> 
> Signed-off-by: Chris Larson <chris_larson@mentor.com>
> ---
>  meta/classes/devshell.bbclass |   29 +++++-------
>  meta/classes/terminal.bbclass |   30 ++++++++++++
>  meta/lib/oe/terminal.py       |  102 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 144 insertions(+), 17 deletions(-)
>  create mode 100644 meta/classes/terminal.bbclass
>  create mode 100644 meta/lib/oe/terminal.py
> 
> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
> index 5f262f4..95c29f3 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -1,22 +1,17 @@
> -do_devshell[dirs] = "${S}"
> -do_devshell[nostamp] = "1"
> +inherit terminal
>  
> -XAUTHORITY ?= "${HOME}/.Xauthority"
>  
> -devshell_do_devshell() {
> -	export DISPLAY='${DISPLAY}'
> -	export DBUS_SESSION_BUS_ADDRESS='${DBUS_SESSION_BUS_ADDRESS}'
> -	export XAUTHORITY='${XAUTHORITY}'
> -	export TERMWINDOWTITLE="Bitbake Developer Shell"
> -	export EXTRA_OEMAKE='${EXTRA_OEMAKE}'
> -	export SHELLCMDS="bash"
> -	${TERMCMDRUN}
> -	if [ $? -ne 0 ]; then
> -	    echo "Fatal: '${TERMCMD}' not found. Check TERMCMD variable."
> -	    exit 1
> -	fi
> +export XAUTHORITY ?= "${HOME}/.Xauthority"
> +export SHELL ?= "bash"
> +export DBUS_SESSION_BUS_ADDRESS
> +export DISPLAY
> +export EXTRA_OEMAKE

Variables that are placed into the global environment affect the
checksums of any shell tasks when they change so I don't think we can do
this (and its why they are in a function as above).

Perhaps we could list the variables we want to export in a variable and
then pass that list to popen's environment?

Cheers,

Richard



