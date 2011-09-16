Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R4cJM-00029c-31
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:34:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Sep 2011 10:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="49183896"
Received: from scimitar.jf.intel.com (HELO [10.7.199.70]) ([10.7.199.70])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2011 10:29:34 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 10:29:32 -0700
In-Reply-To: <d281634d8b836e626c989fe781a87971824ff186.1316192786.git.paul.eggleton@linux.intel.com>
References: <cover.1316192786.git.paul.eggleton@linux.intel.com>
	<d281634d8b836e626c989fe781a87971824ff186.1316192786.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316194174.2325.3.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] lib/oe/terminal.py: declare konsole from KDE 4.x as unsupported
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
X-List-Received-Date: Fri, 16 Sep 2011 17:34:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-16 at 18:08 +0100, Paul Eggleton wrote:
> Konsole 2.x (from KDE 4.x) does not work as devshell - it does not pass
> the environment or current working directory through among other issues,
> so do a version check and disable it if it is found (skipping to the
> next available terminal application.)

Thanks for fixing this!

> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Joshua Lock <josh@linux.intel.com>

> ---
>  meta/lib/oe/terminal.py |   27 +++++++++++++++++++++++++++
>  1 files changed, 27 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 3965462..1455e8e 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -61,6 +61,15 @@ class Konsole(XTerminal):
>      command = 'konsole -T "{title}" -e {command}'
>      priority = 2
>  
> +    def __init__(self, command, title=None, env=None):
> +        # Check version
> +        vernum = check_konsole_version("konsole")
> +        if vernum:
> +            if vernum.split('.')[0] == "2":
> +                logger.debug(1, 'Konsole from KDE 4.x will not work as devshell, skipping')
> +                raise UnsupportedTerminal(self.name)
> +        XTerminal.__init__(self, command, title, env)
> +
>  class XTerm(XTerminal):
>      command = 'xterm -T "{title}" -e {command}'
>      priority = 1
> @@ -104,3 +113,21 @@ def spawn(name, command, title=None, env=None):
>      output = pipe.communicate()[0]
>      if pipe.returncode != 0:
>          raise ExecutionError(pipe.command, pipe.returncode, output)
> +
> +def check_konsole_version(konsole):
> +    import subprocess as sub
> +    try:
> +        p = sub.Popen(['sh', '-c', '%s --version' % konsole],stdout=sub.PIPE,stderr=sub.PIPE)
> +        out, err = p.communicate()
> +        ver_info = out.rstrip().split('\n')
> +    except OSError as exc:
> +        import errno
> +        if exc.errno == errno.ENOENT:
> +            return None
> +        else:
> +            raise
> +    vernum = None
> +    for ver in ver_info:
> +        if ver.startswith('Konsole'):
> +            vernum = ver.split(' ')[-1]
> +    return vernum

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



