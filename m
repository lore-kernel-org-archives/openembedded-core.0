Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 532E56A59F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 16:36:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2013 09:36:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,695,1367996400"; d="scan'208";a="367420268"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2013 09:36:06 -0700
Message-ID: <51E81976.4010509@linux.intel.com>
Date: Thu, 18 Jul 2013 09:36:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <cover.1374140808.git.hongxu.jia@windriver.com>
	<6cb2efa600f580748a228b8e8577479c76140368.1374140808.git.hongxu.jia@windriver.com>
In-Reply-To: <6cb2efa600f580748a228b8e8577479c76140368.1374140808.git.hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] python: fix importing readline with probably escape sequence output
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
X-List-Received-Date: Thu, 18 Jul 2013 16:36:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2013 03:55 AM, Hongxu Jia wrote:
> While imports readline in python, if the term in terminfo is available and
> it contains the variable 'km' and 'smm', the readline initialization will
> output the value of 'smm' which is the escape sequence '\E[?1034h'.
>
> 'km' means the terminal has a meta key which is a special key on MIT keyboards,
> 'smm' means turn on the meta key if this terminal has one. They don't exist in
> term 'dumb'.
>
> Explicitly use dumb as default terminal to avoid probably escape sequence
> output. The dumb is used to label tty lines when you don't know what kind
> of terminal is on it. The characteristics of an unknown terminal are the
> lowest common denominator.
>
> [YOCTO #4835]
> [YOCTO #4732]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-devtools/python/python.inc            |  4 ++-
>   ...e-explicitly-use-dumb-as-default-terminal.patch | 35 ++++++++++++++++++++++
>   2 files changed, 38 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/python/python/readline-explicitly-use-dumb-as-default-terminal.patch
>
> diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
> index 80609a8..2fc894d 100644
> --- a/meta/recipes-devtools/python/python.inc
> +++ b/meta/recipes-devtools/python/python.inc
> @@ -7,7 +7,9 @@ INC_PR = "r0"
>
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ed3abfd1059e2d3a36a8cff3986f9bb6"
>
> -SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2"
> +SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
> +           file://readline-explicitly-use-dumb-as-default-terminal.patch \
> +"
>
>   SRC_URI[md5sum] = "c57477edd6d18bd9eeca2f21add73919"
>   SRC_URI[sha256sum] = "726457e11cb153adc3f428aaf1901fc561a374c30e5e7da6742c0742a338663c"
> diff --git a/meta/recipes-devtools/python/python/readline-explicitly-use-dumb-as-default-terminal.patch b/meta/recipes-devtools/python/python/readline-explicitly-use-dumb-as-default-terminal.patch
> new file mode 100644
> index 0000000..11928d1
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/readline-explicitly-use-dumb-as-default-terminal.patch
> @@ -0,0 +1,35 @@
> +readline: explicitly use dumb as default terminal
> +
> +Explicitly use dumb as default terminal to avoid probably
> +escape sequence output. The dumb is used to label tty lines
> +when you don't know what kind of terminal is on it. The
> +characteristics of an unknown terminal are the lowest common
> +denominator.
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Upstream-Status: inappropriate [oe specific]
> +---
> + Modules/readline.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/Modules/readline.c b/Modules/readline.c
> +--- a/Modules/readline.c
> ++++ b/Modules/readline.c
> +@@ -882,6 +882,14 @@ setup_readline(void)
> + #endif
> +     /* Force rebind of TAB to insert-tab */
> +     rl_bind_key('\t', rl_insert);
> ++
> ++    /* Explicitly use dumb as default terminal to avoid probably
> ++     * escape sequence output. The dumb is used to label tty lines
> ++     * when you don't know what kind of terminal is on it. The
> ++     * characteristics of an unknown terminal are the lowest common
> ++     * denominator.
> ++     */
> ++    rl_terminal_name = "dumb";
I don't think this will work, since it will force all terminal 
interactions that use python to be dumb, how will the bitbake knotty 
interface behave with dumb terminal.

Sau!

> +     /* Bind both ESC-TAB and ESC-ESC to the completion function */
> +     rl_bind_key_in_map ('\t', rl_complete, emacs_meta_keymap);
> +     rl_bind_key_in_map ('\033', rl_complete, emacs_meta_keymap);
> +--
> +1.8.1.2
> +
>

