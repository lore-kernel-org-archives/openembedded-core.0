Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C36C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 08:23:24 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.43608.1754900596264924987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 01:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N6SJyJsl;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-7072ed7094aso39349836d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 01:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754900595; x=1755505395; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qt2zlnHC2BJYdiIadm76Js/ZroQXg3Hcqel1sCEJb4k=;
        b=N6SJyJslihDfvfQlN+sAWPKC92liwSNPDnRM2H4HHMHWE2Nx1DnjsFPOAfJ3H4RhRq
         0dZh4+FW47uIl8oDzMSyYkGfbNBY7cMtxKzsSgKJbo95Nr/Jg6le0aYQ5wKJfBAilhar
         bwgMD5nVySSjGeSNjMJk2lOo1sNupHoZ3XMd46KJvBhj/LowwZGom2bNEC0GvRvEyPob
         cM3ZOyF1jCDWEZjKl13TCXIYugJN2PPg+9Xnbl+ZFlxfE19r2lQZrCnQzCkOixW5+1oM
         2Np6Sr7Swokf2/Pj3lFw3UodaGEoIeps9UPYfrOZuJ0YbHJL9v7QPWwYHS+sfxaC4O3q
         XpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900595; x=1755505395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qt2zlnHC2BJYdiIadm76Js/ZroQXg3Hcqel1sCEJb4k=;
        b=wpft2s6o+g1HKwnbP1mKTSYIhGjXqsLOEWPRsrRZGCRbCnZW4mKxbHJMcPD7uinw7S
         KOMqDwyHJrwfq2GuMtgffUFBCEc+v0SJaj/DH1c9d+MXUhf36fykuvQYBHoEI0JB8taV
         Dr3ApWHU8OLxDerpuWNggyyae6pRCppywSjg3i3332PGqxoQET5LDqcALyP932Qq6iaN
         JW1duF8IzRx9I5mFQtkMm8d8FBgHb9iSvSblIjHCPW29gsZc2WtA13A0sl0XY+ifDpVr
         LF0JaXSkuxO5SzHdv4mI/YzczSwgxYJ8Ohx8IbQ7TX5rD2swL36hpiIqC+QjOea2PqXA
         KMRw==
X-Gm-Message-State: AOJu0YwZ0rbuY36pwvQ49JRmQv/kBqBivlaHEp0VrInD5NyVJyblOrN0
	o8B+QUt3rFLO7oG8s/wVz1TjFzgS7mADMrtwEjZyE/p2WY31INN1g8mu9RNPqoB1kxnZ3Y557nI
	BXiqmhmw59PzQr87lg5kF7dV4XrCBbk0=
X-Gm-Gg: ASbGnct7n9vNWNn+E5qT/8sqyQA6wDcl04qCOC1l5+8yRUqoDDJUrZj8SZvP957KMHi
	cdBlqWCj1I1XKffJwcBz1Fkhs//QU94jZsKpCI5yyjyb71yPVQ2pbqg3UwWbeQM4KI3so8xHSFC
	+TOPS9CxZTEJT1bn5NdHXv5Mn9/3ON97INfpuymjIZqywwItNwbiCSD9GQ3kP+GMLLw5KsUo7hk
	QkaDBs=
X-Google-Smtp-Source: AGHT+IHhOGt2Q3NZ5CPApIrHhYau/c6sNYljWD3R4kSFydxETan6eTvrURlM5IwSD2nH3Uf01viPi1Ng7K9VX5+WPXE=
X-Received: by 2002:a05:6214:48d:b0:704:c686:3f54 with SMTP id
 6a1803df08f44-7099a207e94mr175636406d6.15.1754900595105; Mon, 11 Aug 2025
 01:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250808084931.2156763-1-akash.hadke27@gmail.com> <20250808084931.2156763-23-akash.hadke27@gmail.com>
In-Reply-To: <20250808084931.2156763-23-akash.hadke27@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Aug 2025 10:23:04 +0200
X-Gm-Features: Ac12FXw0zBsPENJiElNTiqBtiwckyvGfwd1WEr6WN9OQ-Tin2ChfV7T4otUgtf0
Message-ID: <CANNYZj_cgBmsnSyHohxhBFyAUfocnuZLZvBiYLhby2w4-2dFww@mail.gmail.com>
Subject: Re: [OE-core] [poky][scarthgap][PATCH 23/23] bitbake: fetch2/git: Add
 multiple revision support
To: akash.hadke27@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 08:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221725

I don't think this whole patchset is eligible for scarthgap. It adds
new features, and that's per policy is not allowed.

This particular last patch needs to land in master first (or there
must be an explanation of why it is not necessary there).

Alex

On Fri, 8 Aug 2025 at 10:51, akash hadke via lists.openembedded.org
<akash.hadke27=gmail.com@lists.openembedded.org> wrote:
>
> In scarthgap single SRC_URI can still have multiple revisions
> update the code in order to iterate over these revisions and
> do the fetch.
>
> Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
> ---
>  bitbake/lib/bb/fetch2/git.py | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
> index 390d9ddafc..88fa119e1d 100644
> --- a/bitbake/lib/bb/fetch2/git.py
> +++ b/bitbake/lib/bb/fetch2/git.py
> @@ -513,12 +513,13 @@ class Git(FetchMethod):
>                  raise bb.fetch2.FetchError("Unable to find revision %s even from upstream" % missing_rev)
>
>          if self.lfs_need_update(ud, d):
> -            self.lfs_fetch(ud, d, ud.clonedir, ud.revision)
> +            for name in ud.names:
> +                self.lfs_fetch(ud, d, name, ud.clonedir, ud.revisions[name])
>
> -    def lfs_fetch(self, ud, d, clonedir, revision, fetchall=False, progresshandler=None):
> +    def lfs_fetch(self, ud, d, name, clonedir, revision, fetchall=False, progresshandler=None):
>          """Helper method for fetching Git LFS data"""
>          try:
> -            if self._need_lfs(ud) and self._contains_lfs(ud, d, clonedir) and len(revision):
> +            if self._need_lfs(ud) and self._contains_lfs(ud, d, name, clonedir) and len(revision):
>                  self._ensure_git_lfs(d, ud)
>
>                  # Using worktree with the revision because .lfsconfig may exists
> @@ -649,7 +650,7 @@ class Git(FetchMethod):
>              runfetchcmd(fetch_cmd, d, workdir=dest)
>              runfetchcmd("%s update-ref %s %s" % (ud.basecmd, ref, revision), d, workdir=dest)
>              # Fetch Git LFS data
> -            self.lfs_fetch(ud, d, dest, ud.revisions[ud.names[0]])
> +            self.lfs_fetch(ud, d, name, dest, ud.revisions[ud.names[0]])
>
>          # Apply extra ref wildcards
>          all_refs_remote = runfetchcmd("%s ls-remote origin 'refs/*'" % ud.basecmd, \
> @@ -738,7 +739,7 @@ class Git(FetchMethod):
>          repourl = self._get_repo_url(ud)
>          runfetchcmd("%s remote set-url origin %s" % (ud.basecmd, shlex.quote(repourl)), d, workdir=destdir)
>
> -        if self._contains_lfs(ud, d, destdir):
> +        if any(self._contains_lfs(ud, d, name, destdir) for name in ud.names):
>              if not need_lfs:
>                  bb.note("Repository %s has LFS content but it is not being fetched" % (repourl))
>              else:
> @@ -806,8 +807,9 @@ class Git(FetchMethod):
>          Verifies whether the LFS objects for requested revisions have already been downloaded
>          """
>          # Bail out early if this repository doesn't use LFS
> -        if not self._contains_lfs(ud, d, wd):
> -            return True
> +        for name in ud.names:
> +            if not self._contains_lfs(ud, d, name, wd):
> +                return True
>
>          self._ensure_git_lfs(d, ud)
>
> @@ -835,12 +837,12 @@ class Git(FetchMethod):
>      def _need_lfs(self, ud):
>          return ud.parm.get("lfs", "1") == "1"
>
> -    def _contains_lfs(self, ud, d, wd):
> +    def _contains_lfs(self, ud, d, name, wd):
>          """
>          Check if the repository has 'lfs' (large file) content
>          """
>          cmd = "%s grep lfs %s:.gitattributes | wc -l" % (
> -            ud.basecmd, ud.revision)
> +            ud.basecmd, ud.revisions[name])
>
>          try:
>              output = runfetchcmd(cmd, d, quiet=True, workdir=wd)
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221620): https://lists.openembedded.org/g/openembedded-core/message/221620
> Mute This Topic: https://lists.openembedded.org/mt/114597154/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

