Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 485D071F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 09:46:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2015 01:41:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,643,1418112000"; d="scan'208";a="459319298"
Received: from gcattani-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.20.5])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2015 01:30:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Date: Wed, 25 Feb 2015 09:46:07 +0000
Message-ID: <2654076.xn0iOlK7Dp@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1424720381-4282-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1424720381-4282-1-git-send-email-sven.ebenfeld@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] terminal.py: No --disable-factory for gnome-terminal >= 3.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Feb 2015 09:46:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Sven,

On Monday 23 February 2015 20:39:41 Sven Ebenfeld wrote:
> --disable-factory has been disabled in earlier versions of gnome-terminal
> but from version 3.10 it raises an error and quits. This makes devshell
> unusable with gnome-terminal >= 3.10. This patch checks for the version and
> removes --disable-factory if you have the terminal version 3.10 or higher.
> 
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  meta/lib/oe/terminal.py | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 54e3ffc..01c0ccc 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -55,6 +55,14 @@ class Gnome(XTerminal):
>      command = 'gnome-terminal -t "{title}" --disable-factory -x {command}'
>      priority = 2
> 
> +    def __init__(self, sh_cmd, title=None, env=None, d=None):
> +        # Check version
> +        (major, minor) = check_terminal_version("gnome-terminal")
> +        if major >= 3 and minor >= 10:
> +            logger.warn(1, 'Gnome-Terminal >3.10 does not support
> --disable-factory') +            self.command = 'gnome-terminal -t
> "{title}" -x {command}' +        XTerminal.__init__(self, sh_cmd, title,
> env, d)
> +
>  class Mate(XTerminal):
>      command = 'mate-terminal -t "{title}" -x {command}'
>      priority = 2
> @@ -73,11 +81,10 @@ class Konsole(XTerminal):
> 
>      def __init__(self, sh_cmd, title=None, env=None, d=None):
>          # Check version
> -        vernum = check_konsole_version("konsole")
> -        if vernum:
> -            if vernum.split('.')[0] == "2":
> -                logger.debug(1, 'Konsole from KDE 4.x will not work as
> devshell, skipping') -                raise UnsupportedTerminal(self.name)
> +        (major, minor) = check_terminal_version("konsole")
> +        if major == 2:
> +            logger.debug(1, 'Konsole from KDE 4.x will not work as
> devshell, skipping') +            raise UnsupportedTerminal(self.name)
>          XTerminal.__init__(self, sh_cmd, title, env, d)
> 
>  class XTerm(XTerminal):
> @@ -219,10 +226,10 @@ def check_tmux_pane_size(tmux):
>          return True
>      return False
> 
> -def check_konsole_version(konsole):
> +def check_terminal_version(terminalName):
>      import subprocess as sub
>      try:
> -        p = sub.Popen(['sh', '-c', '%s --version' %
> konsole],stdout=sub.PIPE,stderr=sub.PIPE) +        p = sub.Popen(['sh',
> '-c', '%s --version' % terminalName],stdout=sub.PIPE,stderr=sub.PIPE) out,
> err = p.communicate()
>          ver_info = out.rstrip().split('\n')
>      except OSError as exc:
> @@ -232,10 +239,17 @@ def check_konsole_version(konsole):
>          else:
>              raise
>      vernum = None
> +    major = int(0)
> +    minor = int(0)
>      for ver in ver_info:
>          if ver.startswith('Konsole'):
>              vernum = ver.split(' ')[-1]
> -    return vernum
> +	if ver.startswith('GNOME Terminal'):
> +            vernum = ver.split(' ')[-1]
> +    if vernum:
> +	major = int(vernum.split('.')[0])
> +	minor = int(vernum.split('.')[1])
> +    return major, minor

Obviously we needed the other part, but this API change means that we no 
longer get the full version when there are more than two parts (e.g. the 
current version of konsole on my system is 2.4.12), and it will blow up in the 
case when the version does not contain '.' or contains non-integer parts e.g. 
"3.4-beta". These might not be immediate problems but they may be in future.

I'd honestly rather we keep this as a string; if we need to do comparisons we 
can use distutils.version.LooseVersion(). I can send a fix for this along with 
a fix for Konsole 2.x which seems to be able to work now.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

