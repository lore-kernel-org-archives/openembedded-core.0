Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 964C775A04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 19:26:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2015 12:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,640,1427785200"; d="scan'208";a="713485768"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.4.144])
	([10.219.4.144])
	by orsmga001.jf.intel.com with ESMTP; 18 Jun 2015 12:26:04 -0700
Message-ID: <55831B63.60406@linux.intel.com>
Date: Thu, 18 Jun 2015 14:26:27 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1433274867-5685-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <1433274867-5685-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [PATCH] terminal.py: Allow devshell/menuconfig on recent gnome-terminal
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
X-List-Received-Date: Thu, 18 Jun 2015 19:26:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ping



On 06/02/2015 02:54 PM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Recent versions of gnome-terminal does not support non-UTF8 charset:
> https://bugzilla.gnome.org/show_bug.cgi?id=732127 as a result, devshell and
> menuconfig tasks silently hang  (error found on trace log of 'strace -f -v
> -s 8192 -e write=2 bitbake -c devshell quilt-native': "Non UTF-8 locale
> (ANSI_X3.4-1968) is not supported!"). As a workaround, clearing the LC_ALL
> environment variable so it uses the locale. Once fixed on the gnome-terminal
> project, this should be removed.
>
> Tested on gnome-terminal versions:
>
>         GNOME Terminal 3.4.1.1
>         GNOME Terminal 3.14.2 (Default on Ubuntu 15.04)
>
> [YOCTO #7791]
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>   meta/lib/oe/terminal.py |    6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 4f5c611..52a8913 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -57,6 +57,12 @@ class Gnome(XTerminal):
>       priority = 2
>
>       def __init__(self, sh_cmd, title=None, env=None, d=None):
> +        # Recent versions of gnome-terminal does not support non-UTF8 charset:
> +        # https://bugzilla.gnome.org/show_bug.cgi?id=732127; as a workaround,
> +        # clearing the LC_ALL environment variable so it uses the locale.
> +        # Once fixed on the gnome-terminal project, this should be removed.
> +        if os.getenv('LC_ALL'): os.putenv('LC_ALL','')
> +
>           # Check version
>           vernum = check_terminal_version("gnome-terminal")
>           if vernum and LooseVersion(vernum) >= '3.10':
>

