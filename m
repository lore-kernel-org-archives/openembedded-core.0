Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2965CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:38:32 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.15017.1758015512287284445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=egkTz3Zn;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-77766aae1abso22299526d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758015511; x=1758620311; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oJp+iIV61T1PTowDQ36Fj2dszgU6zDXZz2pYWC6ob58=;
        b=egkTz3ZnwvjeBtkxmA8MXD8ahk8d8+P+DCKPiijAPsu65tOn6hTf8LK6VRPn9vOmoO
         qdBHCtW2xngBf1j9lUzQk0vwbP7kmeaB+wMO/BaG8uNzMHAzuHzm2HqzX9dhQhiKWCJn
         WAKu1KvfIvOTn5E770jbPCw4zepOU+wYsDdwPYbJst4qCVd3/PIiL0ByAFFlBwJOBcDS
         RF7Pk3Q6aKhASrCehnWm/zD6npctvHRVovxwSJxEGGBupxxQdwVnBiAakRZzQeWhHDpL
         ZcaUnP938k/jjoCMIiXXyD5Ut1ykK+Z6vkg1N9yc8ZprOa7VaPIup9oWM+1QvEgO4DT/
         zQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015511; x=1758620311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJp+iIV61T1PTowDQ36Fj2dszgU6zDXZz2pYWC6ob58=;
        b=LHSbMARqzddNxrlP/Fn+GwZdh0PKIjSAbhBcEhJXe3Utu2xKJgtVUHO/D1ijx9/euf
         sdxeFbfjtimBZ03IB/IaEXSZZZR5G5KFF5KZavVRSh7LdZxVTCedqzkzhvIirL0wh5Al
         TJOPgvSrQONhTuf4cV9Z3nNWPiIwtjKs6vHiyJ6toihrfo/+egSrQyY0BOaisqMDU5NV
         x/aZazkQudeLZH3x+Cr4VSiA773D1W4LIf7B3VM83yVwf+AMS6Zt8+rdbM5k/QwD4Ufn
         ko9HvnO+VHXF6cpcxThtU0zMWT/uJVgDCDtGD3bxQTpMZvCOPciBAj63xItPlEFhUmf/
         psvQ==
X-Gm-Message-State: AOJu0YwmI4FvNT5S944OcA64G5r8WaUfNfbGeSreupTZqfgp8/3X1BDE
	6R1Oi7HHBs79sXh3Sho/ZBrayraPNe53OcGSdZuA0QToJJ3wzuj2fMoPCjs5ojtqSBma3UD1xyG
	jkZggEjA0beZkTKGwX+5M41NTcEW/G4ta1g==
X-Gm-Gg: ASbGnctMM22s3ttv1MmLgqo7XRtVYCuD3rLVfyWPD5dkORG9zPQM+Vv/QU32uRSWcUp
	MFPEZBJzsJnmLQU/BqtK0VtdQewvoX+Zz8LzJ7lAMHlDlM9zE+mfiyS4b4mLpbpiKWa3wEPTXkG
	lENF45PFe4DteGhwwtSyM2boBILICbFd2daSZSSN592evrkzb8oL7Wh2KXD2osSaqfg4rfUEE6n
	z5pfbWOhBTFtZe95x2kXKQIdwzFQ9+aWOPr9veVqHFC0QpIyD3Nye0qWPxovrVoAISN1+6tTGHe
	+qCzD4d8wuRpzHejnEybVWuW9VBTH3t4Zk06Bgja
X-Google-Smtp-Source: AGHT+IH8VDpM8EbyvhTzFDX8XQfFTqiPqpbgcu1/4rnm4UXqc9m6ZO9m1r8HvoTZfLfnJrLXr9M1SfdivMGLG0icAuE=
X-Received: by 2002:a05:6214:2aac:b0:712:644:d9f2 with SMTP id
 6a1803df08f44-767bb4ada8cmr200271006d6.10.1758015511163; Tue, 16 Sep 2025
 02:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250914103848.2067604-1-skandigraun@gmail.com>
In-Reply-To: <20250914103848.2067604-1-skandigraun@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Sep 2025 11:38:20 +0200
X-Gm-Features: AS18NWBypNwFOWrkoPhTk1NVz7PdjoYuD3F-pqG0O6ykIYEOmDTQh3IEFsAlYGU
Message-ID: <CANNYZj8YH72O6Ddj82tU-r=nkiBagSbd4ie4wTrutkyCRr9Pmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest/devtool: make 'git status' list all
 files separately
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 09:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223537

Thanks, it would help to point that the recipe is vulkan-samples, and
the breakage was observed in <insert link> after sending a version
update in <insert link>.

alex

On Sun, 14 Sept 2025 at 12:38, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
>
> By default, when running "git status", and git finds an untracked folder with some
> files in it, it lists only the folder, without the file content. In case the folder
> is already tracked, then the new/modified files inside the folder are displayed
> separately.
>
> Some tests rely on listing all the files separately to be able to determine the outcome
> of the test. As an example, test_devtool_git_submodules creates a patch that's stored
> in the meta layer. It verifies from git status that the patch is present in the layer.
> However, when using the default "git status" behavior, to be able to see the file listed,
> its parent folder must be tracked by git already, otherwise only the folder is listed.
>
> The recipe that this testcase uses has carried patches for a long time - recently the
> recipe was updated, and the last patch was also removed. This broke the test, because
> git tracked no patch-folder anymore, and when the test couldn't find the test-patch's
> name in the git status report, it failed.
>
> To avoid this problem, add "--untracked-files=all" argument to the git status request,
> which displays all untracked files, regardless of their parent folder tracking-status.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> index 19a205912b..a59d9e123a 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -122,7 +122,7 @@ class DevtoolTestCase(OESelftestTestCase):
>
>      def _check_repo_status(self, repo_dir, expected_status):
>          """Check the worktree status of a repository"""
> -        result = runCmd('git status . --porcelain',
> +        result = runCmd('git status . --porcelain  --untracked-files=all',
>                          cwd=repo_dir)
>          for line in result.output.splitlines():
>              for ind, (f_status, fn_re) in enumerate(expected_status):
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223346): https://lists.openembedded.org/g/openembedded-core/message/223346
> Mute This Topic: https://lists.openembedded.org/mt/115235085/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

