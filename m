Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1RVmZt-0001SF-3A
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 17:00:09 +0100
Received: by vbbfc21 with SMTP id fc21so463272vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 07:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=WIuNgeenvnU+to7VP7ZZvhJqvXk0OY1mZpIkBaNNYy8=;
	b=xdHpEX13kXBccUEmTr3zwZyqDH3uC+QF/LyZwcr6KxUSO1aqKGlgz0WF6TV9/ax3wK
	0O4QbYOkG1WGeuZtF7nkPNFE6WVw4XRQ/79SJ3zKlJVRkYC94F1tOsGuOzwlH2wUrPl5
	rDoU+9M/OssRtZ5i/+asGglAtPhq3OYyN1WvQ=
Received: by 10.52.37.129 with SMTP id y1mr2545531vdj.23.1322668408047;
	Wed, 30 Nov 2011 07:53:28 -0800 (PST)
Received: from cl-t066-141cl.privatedns.com.gmail.com ([67.205.85.241])
	by mx.google.com with ESMTPS id p17sm2967135vdj.4.2011.11.30.07.53.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 07:53:27 -0800 (PST)
From: Mario Domenech Goulart <mario.goulart@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1322667784-23451-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 30 Nov 2011 10:40:34 -0500
In-Reply-To: <1322667784-23451-1-git-send-email-koen@dominion.thruhere.net>
	(Koen Kooi's message of "Wed, 30 Nov 2011 16:43:04 +0100")
Message-ID: <8562i1k499.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1.91 (gnu/linux)
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [Proof of concept] patch.bbclass: add incredibly naive 'git am' mode
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
X-List-Received-Date: Wed, 30 Nov 2011 16:00:09 -0000
Content-Type: text/plain; charset=us-ascii

Hi,

On Wed, 30 Nov 2011 16:43:04 +0100 Koen Kooi <koen@dominion.thruhere.net> wrote:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/classes/patch.bbclass |    1 +
>  meta/lib/oe/patch.py       |   14 ++++++++++++++
>  2 files changed, 15 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index ac6c1ce..9f99e38 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -18,6 +18,7 @@ python patch_do_patch() {
>  		"patch": oe.patch.PatchTree,
>  		"quilt": oe.patch.QuiltTree,
>  		"git": oe.patch.GitApplyTree,
> +		"gitam": oe.patch.GitAmTree,
>  	}
>  
>  	cls = patchsetmap[d.getVar('PATCHTOOL', 1) or 'quilt']
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index f4ccb3e..06965ba 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -176,6 +176,20 @@ class GitApplyTree(PatchTree):
>  
>          return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
>  
> +class GitAmTree(PatchTree):
> +    def __init__(self, dir, d):
> +        PatchTree.__init__(self, dir, d)
> +
> +    def _applypatch(self, patch, force = False, reverse = False, run = True):
> +        shellcmd = ["git", "am"]
> +
> +        shellcmd.append(patch['file'])
> +
> +        if not run:
> +            return "sh" + "-c" + " ".join(shellcmd)

That'd result in

    'sh-cgit am'

Maybe you mean something like

    " ".join(["sh", "-c"] + shellcmd)

?

> +
> +        return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
> +
>  
>  class QuiltTree(PatchSet):
>      def _runcmd(self, args, run = True):

Best wishes.
Mario
-- 
http://parenteses.org/mario


