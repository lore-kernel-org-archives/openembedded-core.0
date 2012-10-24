Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TR2lt-0003zk-AQ
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 17:21:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Oct 2012 08:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,640,1344236400"; d="scan'208";a="159855114"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Oct 2012 08:08:00 -0700
Message-ID: <50880450.9030605@linux.intel.com>
Date: Wed, 24 Oct 2012 08:08:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Morten Minde Neergaard <mneergaa@cisco.com>
References: <1350643027-25785-1-git-send-email-mneergaa@cisco.com>
In-Reply-To: <1350643027-25785-1-git-send-email-mneergaa@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add support for running custom terminals.
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
X-List-Received-Date: Wed, 24 Oct 2012 15:21:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2012 03:37 AM, Morten Minde Neergaard wrote:
> Example config:
> OE_TERMINAL = "custom"
> OE_TERMINAL_CUSTOMCMD = "mysuperterm"
>
> Signed-off-by: Morten Minde Neergaard <mneergaa@cisco.com>
> ---
>   meta/classes/terminal.bbclass |   10 ++++++----
>   meta/lib/oe/terminal.py       |   17 ++++++++++++++++-
>   2 files changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
> index 2cd6f4c..51846c1 100644
> --- a/meta/classes/terminal.bbclass
> +++ b/meta/classes/terminal.bbclass
> @@ -4,7 +4,7 @@ OE_TERMINAL[choices] = 'auto none \
>                           ${@" ".join(o.name \
>                                       for o in oe.terminal.prioritized())}'
>
> -OE_TERMINAL_EXPORTS = 'XAUTHORITY SHELL DBUS_SESSION_BUS_ADDRESS DISPLAY EXTRA_OEMAKE SCREENDIR'
> +OE_TERMINAL_EXPORTS += 'XAUTHORITY SHELL DBUS_SESSION_BUS_ADDRESS DISPLAY EXTRA_OEMAKE SCREENDIR'
>   OE_TERMINAL_EXPORTS[type] = 'list'
>
>   XAUTHORITY ?= "${HOME}/.Xauthority"
> @@ -15,17 +15,19 @@ def oe_terminal(command, title, d):
>       import oe.data
>       import oe.terminal
>
> +    env = dict()
> +
>       for export in oe.data.typed_value('OE_TERMINAL_EXPORTS', d):
>           value = d.getVar(export, True)
>           if value is not None:
> -            os.environ[export] = str(value)
> +            env[export] = str(value)
>
>       terminal = oe.data.typed_value('OE_TERMINAL', d).lower()
>       if terminal == 'none':
>           bb.fatal('Devshell usage disabled with OE_TERMINAL')
>       elif terminal != 'auto':
>           try:
> -            oe.terminal.spawn(terminal, command, title, None, d)
> +            oe.terminal.spawn(terminal, command, title, env, d)
>               return
>           except oe.terminal.UnsupportedTerminal:
>               bb.warn('Unsupported terminal "%s", defaulting to "auto"' %
> @@ -34,7 +36,7 @@ def oe_terminal(command, title, d):
>               bb.fatal('Unable to spawn terminal %s: %s' % (terminal, exc))
>
>       try:
> -        oe.terminal.spawn_preferred(command, title, None, d)
> +        oe.terminal.spawn_preferred(command, title, env, d)
>       except oe.terminal.NoSupportedTerminals:
>           bb.fatal('No valid terminal found, unable to open devshell')
>       except oe.terminal.ExecutionError as exc:
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 71d8a43..4c1e318 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -47,7 +47,7 @@ class Terminal(Popen):
>
>   class XTerminal(Terminal):
>       def __init__(self, sh_cmd, title=None, env=None, d=None):
> -        Terminal.__init__(self, sh_cmd, title, env)
> +        Terminal.__init__(self, sh_cmd, title, env, d)
>           if not os.environ.get('DISPLAY'):
>               raise UnsupportedTerminal(self.name)
>
> @@ -105,6 +105,21 @@ class Screen(Terminal):
>           else:
>               logger.warn(msg)
>
> +class Custom(Terminal):
> +    command = 'false' # This is a placeholder
> +    priority = 3
> +
> +    def __init__(self, sh_cmd, title=None, env=None, d=None):
> +        self.command = d and d.getVar('OE_TERMINAL_CUSTOMCMD', True)
> +        if self.command:
> +            if not '{command}' in self.command:
> +                self.command += ' {command}'
> +            Terminal.__init__(self, sh_cmd, title, env, d)
> +            logger.warn('Custom terminal was started.')
> +        else:
> +            logger.debug(1, 'No custom terminal (OE_TERMINAL_CUSTOMCMD) set')
> +            raise UnsupportedTerminal('OE_TERMINAL_CUSTOMCMD not set')
> +
>
>   def prioritized():
>       return Registry.prioritized()
>

Merged into OE-Core

Thanks
	Sau!


