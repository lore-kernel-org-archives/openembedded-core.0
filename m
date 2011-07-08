Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfDkk-000346-JD for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:18:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FXvic021330;
	Fri, 8 Jul 2011 16:33:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20817-06; Fri,  8 Jul 2011 16:33:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FXoCk021324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Jul 2011 16:33:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <3e091c2f3f0f39d3557004dba908b650e9aea7fb.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<3e091c2f3f0f39d3557004dba908b650e9aea7fb.1310132765.git.otavio@ossystems.com.br>
Date: Fri, 08 Jul 2011 16:33:12 +0100
Message-ID: <1310139192.20015.888.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/8] Rework how the devshell functions
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
X-List-Received-Date: Fri, 08 Jul 2011 16:18:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 13:47 +0000, Otavio Salvador wrote:
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
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/devshell.bbclass |   26 ++++-------
>  meta/classes/terminal.bbclass |   30 ++++++++++++
>  meta/lib/oe/classutils.py     |    2 +
>  meta/lib/oe/terminal.py       |  102 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 143 insertions(+), 17 deletions(-)
>  create mode 100644 meta/classes/terminal.bbclass
>  create mode 100644 meta/lib/oe/terminal.py
> 
> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
> index 5f262f4..7317d64 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -1,22 +1,14 @@
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

For reference, the reason I keep putting off merging this is that there
are a number of variables above that were added there for a reason (e.g.
DBUS_SESSION_BUS_ADDRESS) and this patch wipes them out.

The patch therefore makes someone's usecase work better and the expense
of breaking some others and to me that doesn't make a good patch.

I'm the first to agree that the bitbake environment handling sucks,
badly. It would be nice if there were some way we could save off the
original environment and then restore it under certain conditions which
would then make the need for gross code like the above go away. Likely
that would need changes at the bitbake level but I think we need to try
and fix this problem properly...

[I'm fine with the other changes that patch makes, I just worry about
the environment bits]

Cheers,

Richard





