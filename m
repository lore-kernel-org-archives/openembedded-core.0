Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7C04160119
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 00:40:32 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id m2so196210qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 17:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lpzww66GaJMssrRru4IlbtF0zcOc4kginK9l8sw43OQ=;
	b=SMGQwlNE0iesgMLYBPmAEX03KZYWixZJ9uF3jiAOnHxAZd4jOZgovgKaqkSaI0BxRs
	xxKKTgyypLxdL0mQ6Ybt+kOv1aaALWg+RZJuuD4pUGevaZ9ZMZuLz8ms5boZx/+vSDgf
	QA4hEpPtYnorGJQfG0HC9GVosBRsBGaQofTPq1+tX/woBjKPSJX3735gvbYKgzAinYi2
	k85XW7e8biDTOLOnrOKQLgdJ/0V9gmgn7vJscQVPVhCJc/bvV3yJEV45J9Bh8hIlm6NB
	EMJVlplAbhdWtrQy1YJcffKyq8gL2rIqN02USTwRhkg074WZ9PMsWM8ZNIbQP0/O1vHW
	C0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lpzww66GaJMssrRru4IlbtF0zcOc4kginK9l8sw43OQ=;
	b=l6SJbmbgCTfT/Qbv5pqUKeU1teODtBYnNKIhTLEGUu/JqqPnABNmgregqrdgJVirwR
	YvVMVWVLTfVWtZRaBfjNpmf9wTzrpzhYxjvmB/dZH4udvoi0FIUipDTF5BUZpEbnHvTa
	yVDHALxJiVuzuU+X4dYsX978SBaWEmCxl0U+aSzPNjEsNQQ+jCS3ZUdalzF+sLPzOPZc
	D6VsXOCWPmEe38AL8tSxmF7M5crYh7S3WvFXrvN9Hss4CrjfRBCpjZhs+BUI/RNCi1dm
	OfU1AYRjov8hlR5A4prhgfrX5z+lHukMmqAM6d7f5dlrgbKgMGHYKiEtqKtRORhLp/fv
	4UDw==
X-Gm-Message-State: ALyK8tLEjxuKrxC+WPNuYYcnpvedYWdJBgvz8JdWYjxAG3Ij1dLrcjdxNYFmY/NRlGb5x46VA6v2MSxCHQwvNg==
X-Received: by 10.200.51.76 with SMTP id u12mr40111313qta.55.1467852033100;
	Wed, 06 Jul 2016 17:40:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 6 Jul 2016 17:40:03 -0700 (PDT)
In-Reply-To: <2e1423fa0b0ac6bf9facbe5e9ed9df1051ccd6fa.1467849364.git.paul.eggleton@linux.intel.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
	<2e1423fa0b0ac6bf9facbe5e9ed9df1051ccd6fa.1467849364.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2016 17:40:03 -0700
Message-ID: <CAMKF1sonCKidrVKfLWekD6=-VMChoWxXUUmTWfaAwgpQZx2ahA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] lib/oe/patch: handle encoding differences in patch files
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
X-List-Received-Date: Thu, 07 Jul 2016 00:40:34 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 6, 2016 at 4:57 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> With Python 3, the encoding of a file is significant; several recipes in
> OE-Core have patches which are not fully utf-8 decodable e.g. man,
> lrzsz, and gstreamer1.0-libav, leading to errors when using devtool's
> modify, upgrade or extract subcommands on these recipes. To work around
> this, try reading the patch file as utf-8 first and if that fails try
> latin-1 before giving up.


while this makes devtool robust. I think it will also be a good
opportunity to inform
the user/developer of the utf-8 non compliant file and may be a hint
on how to fix it if possible

>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/lib/oe/patch.py | 100 +++++++++++++++++++++++++++++----------------------
>  1 file changed, 57 insertions(+), 43 deletions(-)
>
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 4a0d3f7..af3adec 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -117,43 +117,50 @@ class PatchSet(object):
>                  return None
>              return os.sep.join(filesplit[striplevel:])
>
> -        copiedmode = False
> -        filelist = []
> -        with open(patchfile) as f:
> -            for line in f:
> -                if line.startswith('--- '):
> -                    patchpth = patchedpath(line)
> -                    if not patchpth:
> -                        break
> -                    if copiedmode:
> -                        addedfile = patchpth
> -                    else:
> -                        removedfile = patchpth
> -                elif line.startswith('+++ '):
> -                    addedfile = patchedpath(line)
> -                    if not addedfile:
> -                        break
> -                elif line.startswith('*** '):
> -                    copiedmode = True
> -                    removedfile = patchedpath(line)
> -                    if not removedfile:
> -                        break
> -                else:
> -                    removedfile = None
> -                    addedfile = None
> -
> -                if addedfile and removedfile:
> -                    if removedfile == '/dev/null':
> -                        mode = 'A'
> -                    elif addedfile == '/dev/null':
> -                        mode = 'D'
> -                    else:
> -                        mode = 'M'
> -                    if srcdir:
> -                        fullpath = os.path.abspath(os.path.join(srcdir, addedfile))
> -                    else:
> -                        fullpath = addedfile
> -                    filelist.append((fullpath, mode))
> +        for encoding in ['utf-8', 'latin-1']:
> +            try:
> +                copiedmode = False
> +                filelist = []
> +                with open(patchfile) as f:
> +                    for line in f:
> +                        if line.startswith('--- '):
> +                            patchpth = patchedpath(line)
> +                            if not patchpth:
> +                                break
> +                            if copiedmode:
> +                                addedfile = patchpth
> +                            else:
> +                                removedfile = patchpth
> +                        elif line.startswith('+++ '):
> +                            addedfile = patchedpath(line)
> +                            if not addedfile:
> +                                break
> +                        elif line.startswith('*** '):
> +                            copiedmode = True
> +                            removedfile = patchedpath(line)
> +                            if not removedfile:
> +                                break
> +                        else:
> +                            removedfile = None
> +                            addedfile = None
> +
> +                        if addedfile and removedfile:
> +                            if removedfile == '/dev/null':
> +                                mode = 'A'
> +                            elif addedfile == '/dev/null':
> +                                mode = 'D'
> +                            else:
> +                                mode = 'M'
> +                            if srcdir:
> +                                fullpath = os.path.abspath(os.path.join(srcdir, addedfile))
> +                            else:
> +                                fullpath = addedfile
> +                            filelist.append((fullpath, mode))
> +            except UnicodeDecodeError:
> +                continue
> +            break
> +        else:
> +            raise PatchError('Unable to decode %s' % patchfile)
>
>          return filelist
>
> @@ -280,12 +287,19 @@ class GitApplyTree(PatchTree):
>          """
>          Extract just the header lines from the top of a patch file
>          """
> -        lines = []
> -        with open(patchfile, 'r') as f:
> -            for line in f.readlines():
> -                if line.startswith('Index: ') or line.startswith('diff -') or line.startswith('---'):
> -                    break
> -                lines.append(line)
> +        for encoding in ['utf-8', 'latin-1']:
> +            lines = []
> +            try:
> +                with open(patchfile, 'r', encoding=encoding) as f:
> +                    for line in f:
> +                        if line.startswith('Index: ') or line.startswith('diff -') or line.startswith('---'):
> +                            break
> +                        lines.append(line)
> +            except UnicodeDecodeError:
> +                continue
> +            break
> +        else:
> +            raise PatchError('Unable to find a character encoding to decode %s' % patchfile)
>          return lines
>
>      @staticmethod
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

