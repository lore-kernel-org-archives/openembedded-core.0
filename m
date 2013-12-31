Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id ABAD46B5FF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2013 14:18:18 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id q10so12429303pdj.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2013 06:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=2sxPPZBlAx5KXmLqM3PJuLPFkdA2nOAK/zv+Lwo7QO8=;
	b=nDBWYJVisLyR0QDpM6sLIvyDrmIad87Mi+juluG4AwC/Qd0t6PF9t5mLZQbfRkLgLF
	D9aWktzLay2M1KLMhW7LvmvQ7L/wDzyeOGKjOLDjV0LssidC+NdwThY8NO8fQwAIBl/j
	+H/FX+9QFHE3eWO+rwucmPnlW5hYec7a7y+QuNdt9eD+OybGrEXK3qTfEbRm7isVftA/
	nOtvhTF2re6yMci7RnGBKmOfWa/hUiRJX1+6P0AfUtskXCLAmZ75sz/RB1yPm1wTf1xQ
	iWqboJPhqmWIJDDg9sERBG0UOTkM2EQ5AqtAGt6XrI3qRavEzJYKLtUdb4MBThQjyoks
	laZA==
X-Gm-Message-State: ALoCoQlnTQFTssg36EcNJre+l6G7jE7sU8ZSWW7CrY5tLoIB8qB4YYY/0XAFwKujl6G+RGml0fs0
MIME-Version: 1.0
X-Received: by 10.66.66.202 with SMTP id h10mr76172190pat.70.1388499499618;
	Tue, 31 Dec 2013 06:18:19 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.84.67 with HTTP; Tue, 31 Dec 2013 06:18:19 -0800 (PST)
In-Reply-To: <1387889050-25592-1-git-send-email-lpapp@kde.org>
References: <1387889050-25592-1-git-send-email-lpapp@kde.org>
Date: Tue, 31 Dec 2013 14:18:19 +0000
X-Google-Sender-Auth: 6Mekmp_dHSyu-QJr8MZM5v227iE
Message-ID: <CAOMwXhOfJEkntBTQLDGWjRYA6jorCWNEUF1+t8n5RJJoozcVJA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/patch.py: Prefer "git am" over "git apply" when applying git patches
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
X-List-Received-Date: Tue, 31 Dec 2013 14:18:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ping?

Alternatively, the system could also have an option for further
fine-tuning what to do with git patches

On Tue, Dec 24, 2013 at 12:44 PM, Laszlo Papp <lpapp@kde.org> wrote:
> It is better to use "git am" when possible to preserve the commit messages and
> the mail format in general for patches when those are present. A typical use
> case is when developers would like to keep the changes on top of the latest
> upstream, and they may occasionally need to rebase. This is not possible with
> "git diff" and "diff" generated patches.
>
> Since this is not always the case, the fallback would be the "git apply"
> operation which is currently available.
>
> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>  meta/lib/oe/patch.py | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 59abd0a..b085c9d 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -203,17 +203,23 @@ class GitApplyTree(PatchTree):
>          PatchTree.__init__(self, dir, d)
>
>      def _applypatch(self, patch, force = False, reverse = False, run = True):
> -        shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
> +        def _applypatchhelper(shellcmd, patch, force = False, reverse = False, run = True):
> +            if reverse:
> +                shellcmd.append('-R')
>
> -        if reverse:
> -            shellcmd.append('-R')
> +            shellcmd.append(patch['file'])
>
> -        shellcmd.append(patch['file'])
> +            if not run:
> +                return "sh" + "-c" + " ".join(shellcmd)
>
> -        if not run:
> -            return "sh" + "-c" + " ".join(shellcmd)
> +            return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
>
> -        return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
> +        try:
> +            shellcmd = ["git", "--work-tree=.", "am", "-3", "-p%s" % patch['strippath']]
> +            return _applypatchhelper(shellcmd, patch, force, reverse, run)
> +        except CmdError:
> +            shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
> +            return _applypatchhelper(shellcmd, patch, force, reverse, run)
>
>
>  class QuiltTree(PatchSet):
> --
> 1.8.5.1
>

