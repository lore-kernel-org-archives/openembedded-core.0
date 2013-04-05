Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1UO7Nr-0005tE-4P
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 16:12:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r35DtYLn016793
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Apr 2013 06:55:34 -0700 (PDT)
Received: from [172.25.32.36] (172.25.32.36) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 5 Apr 2013 06:55:34 -0700
Message-ID: <515ED7D5.6080308@windriver.com>
Date: Fri, 5 Apr 2013 08:55:33 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Christopher Larson <kergoth@gmail.com>
References: <1365101122-15705-1-git-send-email-kergoth@gmail.com>
	<1365122683-17652-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1365122683-17652-1-git-send-email-kergoth@gmail.com>
X-Enigmail-Version: 1.5.1
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3] oe.terminal: add tmux classes
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
X-List-Received-Date: Fri, 05 Apr 2013 14:12:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/04/2013 07:44 PM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> This adds two new Terminal classes. It's separated into two, so that opening
> a split inside a tmux window is preferred to the other terminal types, but
> opening a tmux session is prioritized only slightly higher than screen.
>
> - tmuxrunning: Open a new pane in the current running tmux window. Requires
>   that the TMUX variable be added to the env whitelist to use it.
> - tmux: Open a new tmux session
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/lib/oe/terminal.py | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 2e23d59..e52863f 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -142,6 +142,44 @@ class TmuxNewSession(Terminal):
>          else:
>              logger.warn(msg)
>  
> +class TmuxRunning(Terminal):
> +    """Open a new pane in the current running tmux window"""
> +    name = 'tmux-running'
> +    command = 'tmux split-window {command}'
> +    priority = 2.75
> +
> +    def __init__(self, sh_cmd, title=None, env=None, d=None):
> +        if not bb.utils.which(os.getenv('PATH'), 'tmux'):
> +            raise UnsupportedTerminal('tmux is not installed')
> +
> +        if not os.getenv('TMUX'):
> +            raise UnsupportedTerminal('tmux is not running')
> +
> +        Terminal.__init__(self, sh_cmd, title, env, d)


When we chatted yesterday I didn't fully understand how the Tmux Running piece worked.   Now I get it, you run tmux and then start a build with in that session and just join back to it when the TMUX var is set because that is how TMUX does internal communications setup.  I have to admit that is pretty slick. :-)

It seems to me we can just fold these two classes together and drive it off the TMUX variable.   This way we can just have one OE TERMINAL type, and if you don't want the behavior to engage of the "split" you just unset TMUX before you build.   I believe that this covers all the cases you care about, and would allow for the simplistic case I care about where I just set OE_TERMINAL=tmux to work for both cases. I would recommend we just patch up the bitbake.conf BBHASH pieces all in one shot with this patch so their is nothing special anyone has to do to make use of this.

Would you be ok with that?

Further work that I'll probably consider doing if no one else does it first is to add tmux-native so we always have it as the fall back for getting to patch failures and such on a remote build server.

Cheers,
Jason.



> +
> +class Tmux(Terminal):
> +    """Start a new tmux session and window"""
> +    command = 'tmux new -d -s devshell -n devshell {command}'
> +    priority = 0.75
> +
> +    def __init__(self, sh_cmd, title=None, env=None, d=None):
> +        if not bb.utils.which(os.getenv('PATH'), 'tmux'):
> +            raise UnsupportedTerminal('tmux is not installed')
> +
> +        # TODO: consider using a 'devshell' session shared amongst all
> +        # devshells, if it's already there, add a new window to it.
> +        window_name = 'devshell-%i' % os.getpid()
> +
> +        self.command = 'tmux new -d -s {0} -n {0} {{command}}'.format(window_name)
> +        Terminal.__init__(self, sh_cmd, title, env, d)
> +
> +        attach_cmd = 'tmux att -t {0}'.format(window_name)
> +        msg = 'Tmux started. Please connect in another terminal with `tmux att -t {0}`'.format(window_name)
> +        if d:
> +            bb.event.fire(bb.event.LogExecTTY(msg, attach_cmd, 0.5, 10), d)
> +        else:
> +            logger.warn(msg)
> +
>  class Custom(Terminal):
>      command = 'false' # This is a placeholder
>      priority = 3



