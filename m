Return-Path: <danismostlikely@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 97BB471633
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 23:58:12 +0000 (UTC)
Received: by ykba4 with SMTP id a4so44752364ykb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 15:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qrGGS5midAmMdeiojWeQa1bjYdiWTiTfoRtP86vR5GQ=;
	b=Nat3I/exPaG6zknXmzhZzXs3pG+bhXj17EFVn76wxjIRulzJLyLlp/LR7juyfB4tKq
	hLbs+1/gkFJlrY4WaaJJKDb9IeXUGFC3h+beLujHFG60rkRUI9dAWnk5W8M7exRAlga9
	2LgreTW3cc/WX8gNjOegQJpfNmhJfs1u4oZethIo/xUpl9NDEuGJI4kRBiLLjYoUSq8h
	+uhKOKxlPNGRByuQeBHDE0MZBq7onbgfVuxLiL4VFMdbd26JoRxWgoe8+MYw7jPanxBE
	gvkGsSqCdbm+nTpea13XRimSeMVV+0v6aFaRcXC/0/aYUcCOF1oES05+H4wFJ9ei2tzR
	NJuQ==
MIME-Version: 1.0
X-Received: by 10.31.178.151 with SMTP id b145mr16116745vkf.54.1446595092218; 
	Tue, 03 Nov 2015 15:58:12 -0800 (PST)
Received: by 10.31.237.197 with HTTP; Tue, 3 Nov 2015 15:58:12 -0800 (PST)
In-Reply-To: <1446590054-31188-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
References: <1446590054-31188-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Date: Tue, 3 Nov 2015 17:58:12 -0600
Message-ID: <CACS+7ZSrrrmyc3hAUU6RJUSEpPvoBeQOLyFmjadJSqgJjoyVJg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Cc: benoit.rapidel+yocto@exmachina.fr,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 03 Nov 2015 23:58:15 -0000
Content-Type: text/plain; charset=UTF-8

On 3 November 2015 at 16:34,
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Old tmux version (< 1.9) does not support nested formats on the -F parameter, so
> if nested format does not give any answer, do the query in two steps.
>
> Tested on tmux 1.6.

Yeah, I noticed this shortly after I submitted the fix for 1.9 but
didn't think much of it. What system are you using that has tmux 1.6?

>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/lib/oe/terminal.py |   15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 52a8913..686b1ce 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -218,11 +218,24 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
>
>  def check_tmux_pane_size(tmux):
>      import subprocess as sub
> +    size = 0
>      try:
>          p = sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}"' % tmux,
>                  shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
>          out, err = p.communicate()
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
>      except OSError as exc:
>          import errno
>          if exc.errno == errno.ENOENT:
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

