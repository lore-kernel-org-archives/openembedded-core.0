Return-Path: <aws.ismail@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 679AF771B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 23:09:36 +0000 (UTC)
Received: by oixx65 with SMTP id x65so12297037oix.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 15:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+rrZNSsT+bVVqYzDl1J2gSesz2QShb1nDGGjePrPR0k=;
	b=nDrYqH/kPjrhOurM+lgLVnFiUZRNOOgj8aqxfP/t5zviECu9j+9IsFa/epifuaStt7
	7rjiQgyTsZ6dbNWbcys8hWAa4N2zVknh38oyRrw2NKqU1X9PZYFUY4ALp+je8OXmKIpl
	bVLPBVyxDdUlPMictsY4BiOdnBPwy5VlKrtRv7S3NrzX8o/zYKvOmY+uX7GWCSWyZDII
	i+jwzug2ucW99utBlfK3SYvgnvZVuYBRgzmcJ1mfMeuaZTwayvcVeIv8yK2JPD0/eAkH
	NhTmaRI9zmQ5I5+Bhk/6kF/nB9tLMUWBiN5D7jPGkBgJBp+2SAtASCAPcVAcFJCv2sZi
	5AqQ==
X-Received: by 10.202.45.206 with SMTP id t197mr6592254oit.110.1447283376558; 
	Wed, 11 Nov 2015 15:09:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.41.39 with HTTP; Wed, 11 Nov 2015 15:09:17 -0800 (PST)
In-Reply-To: <1446852308-19752-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
References: <1446852308-19752-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
From: Aws Ismail <aws.ismail@gmail.com>
Date: Wed, 11 Nov 2015 18:09:17 -0500
Message-ID: <CAMHMu0P4_AwDZ2nC54ra5pqf5QehD9aaQ2zSGYnbMpA8JYdtmQ@mail.gmail.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] terminal: Open a new window instead of split on older tmux versions (<1.9)
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
X-List-Received-Date: Wed, 11 Nov 2015 23:09:41 -0000
Content-Type: text/plain; charset=UTF-8

I verified this does work under tmux v1.8 with latest poky jethro.

On Fri, Nov 6, 2015 at 6:25 PM,
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> If an old version is detected (<1.9), create a new window instead of split:
> the reason is that there is no easy way to get the active pane height if no
> nested formats are supported.
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/lib/oe/terminal.py |   20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 52a8913..a4a8c97 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -131,7 +131,7 @@ class TmuxRunning(Terminal):
>              raise UnsupportedTerminal('tmux is not running')
>
>          if not check_tmux_pane_size('tmux'):
> -            raise UnsupportedTerminal('tmux pane too small')
> +            raise UnsupportedTerminal('tmux pane too small or tmux < 1.9 version is being used')
>
>          Terminal.__init__(self, sh_cmd, title, env, d)
>
> @@ -218,6 +218,12 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
>
>  def check_tmux_pane_size(tmux):
>      import subprocess as sub
> +    # On older tmux versions (<1.9), return false. The reason
> +    # is that there is no easy way to get the height of the active panel
> +    # on current window without nested formats (available from version 1.9)
> +    vernum = check_terminal_version("tmux")
> +    if vernum and LooseVersion(vernum) < '1.9':
> +        return False
>      try:
>          p = sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}"' % tmux,
>                  shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
> @@ -229,14 +235,16 @@ def check_tmux_pane_size(tmux):
>              return None
>          else:
>              raise
> -    if size/2 >= 19:
> -        return True
> -    return False
> +
> +    return size/2 >= 19
>
>  def check_terminal_version(terminalName):
>      import subprocess as sub
>      try:
> -        p = sub.Popen(['sh', '-c', '%s --version' % terminalName],stdout=sub.PIPE,stderr=sub.PIPE)
> +        cmdversion = '%s --version' % terminalName
> +        if terminalName.startswith('tmux'):
> +            cmdversion = '%s -V' % terminalName
> +        p = sub.Popen(['sh', '-c', cmdversion], stdout=sub.PIPE,stderr=sub.PIPE)
>          out, err = p.communicate()
>          ver_info = out.rstrip().split('\n')
>      except OSError as exc:
> @@ -251,6 +259,8 @@ def check_terminal_version(terminalName):
>              vernum = ver.split(' ')[-1]
>          if ver.startswith('GNOME Terminal'):
>              vernum = ver.split(' ')[-1]
> +        if ver.startswith('tmux'):
> +            vernum = ver.split()[-1]
>      return vernum
>
>  def distro_name():
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

