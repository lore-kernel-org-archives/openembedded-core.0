Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C20A875A31
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 19:55:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2015 11:54:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,248,1444719600"; d="scan'208";a="843534249"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.145])
	([10.219.5.145])
	by orsmga002.jf.intel.com with ESMTP; 05 Nov 2015 11:54:56 -0800
Message-ID: <563BB4A2.3020800@linux.intel.com>
Date: Thu, 05 Nov 2015 13:57:22 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1446590054-31188-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <1446590054-31188-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Cc: benoit.rapidel+yocto@exmachina.fr
Subject: Re: [PATCH] terminal: Support old tmux version (<1.9) when querying height value
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
X-List-Received-Date: Thu, 05 Nov 2015 19:55:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

This patch did not solve the case when multiple panes are present. I 
will send a V2 patch.


On 11/03/2015 04:34 PM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Old tmux version (< 1.9) does not support nested formats on the -F parameter, so
> if nested format does not give any answer, do the query in two steps.
>
> Tested on tmux 1.6.
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>   meta/lib/oe/terminal.py |   15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 52a8913..686b1ce 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -218,11 +218,24 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
>
>   def check_tmux_pane_size(tmux):
>       import subprocess as sub
> +    size = 0
>       try:
>           p = sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}"' % tmux,
>                   shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
>           out, err = p.communicate()
> -        size = int(out.strip())
> +        try:
> +            size = int(out.strip())
> +        except ValueError:
> +            # Older tmux versions (< 1.9) does not support nested formats,
> +            # so try it in two steps
> +            p = sub.Popen('%s list-panes -F "#{?pane_active,yes,no}"' % tmux,
> +                shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
> +            out, err = p.communicate()
> +            if "yes" in out.strip():
> +                p = sub.Popen('%s list-panes -F "#{pane_height}"' % tmux,
> +                              shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
> +                out, err = p.communicate()
> +                size = int(out.strip())
>       except OSError as exc:
>           import errno
>           if exc.errno == errno.ENOENT:
>

