Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7230EC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 22:41:37 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.708.1638398495766600069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 14:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hp1lqXlQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id u1so55532085wru.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 14:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sp93V+wOLEKqS/pqwra9wgXkZg2bfjt2yTHLSuUn3lA=;
        b=Hp1lqXlQlJoslgx54v5STLzlu6zkK9J8kNk5GBzN1WhSiKRpB8xHbZUSCwmmK6FrTk
         frcaJJEQz77YDbKdmqTBQA4+s8uQYIuSFojfIMIjLRv7gNUGpinxO/jOZ5vPt/HKo/Fj
         46zgmvRKTXsJn1UGerAqNTmJ1mkMQZfBqbvrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sp93V+wOLEKqS/pqwra9wgXkZg2bfjt2yTHLSuUn3lA=;
        b=Pw3JBa10fzMsb3lvX+MDxmKufTGSMM/k3+2qOQAwCcdxq18ABx1acLQU6TG0pOdvhu
         tXQwJCBragDXc2xut9DHYH5mUPY/mSmnhKizGM1W3PqD8JaPykKZmYgdzrfHEItI1Ak3
         TFPUmvt0yTjTYlER16UTe2fgWHnA2znE+KvV7jm6RxSkH5t6IDCsCq8OL9ShQSI1B/gK
         LrbRtftUFO6SFhgtYRUhv/Jq3OK4sinnKJ41mHNTKtIY6djHxczDuaJsDAgBSjKFF7C1
         KX37p4bBeXWtXcvce5yPBLA9FD0uXAVX49iA/K1X45lRYsWkHmbcwORC63+gzL7Ardp/
         ZiDg==
X-Gm-Message-State: AOAM530QGFUrzaPWF+0wUNebB/Gohh+fwxiDF2q9YZwX51HCpbHDvlCf
	BHwupfqHYcLDqI3CCyaQkEK2Nw==
X-Google-Smtp-Source: 
 ABdhPJxvb9mN6kyxZR8550rxWnuXTJ/EHbMIRnOnwjD0+YtHuREvLw7DOdVLjskS/noIKc95dsH75w==
X-Received: by 2002:adf:e54a:: with SMTP id z10mr9617331wrm.328.1638398494072;
        Wed, 01 Dec 2021 14:41:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51?
 ([2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51])
        by smtp.gmail.com with ESMTPSA id
 r17sm548656wmq.11.2021.12.01.14.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:41:33 -0800 (PST)
Message-ID: 
 <fb26eb6ccf73ad93d1a9cd49ca27210f57e24b6b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4] patch.py: Initialize git repo before
 patching
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pavel Zhukov <pavel@zhukoff.net>,
	openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>
Date: Wed, 01 Dec 2021 22:41:33 +0000
In-Reply-To: <20211201161220.6336-1-pavel@zhukoff.net>
References: <16BCAC9ACE071CC4.4083@lists.openembedded.org>
	 <20211201161220.6336-1-pavel@zhukoff.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 22:41:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159066

On Wed, 2021-12-01 at 17:12 +0100, Pavel Zhukov wrote:
> From: Pavel Zhukov <pavel.zhukov@huawei.com>
> 
> If PATCHTOOL="git" has been specified but workdir is not git repo
> bitbake fails to apply the patches with error message:
> Command Error: 'git rev-parse --show-toplevel' exited with 0  Output:
> fatal: not a git repository (or any of the parent directories): .git
> 
> Fix this by initializing the repo before patching.
> This allows binary git patches to be applied.
> 
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>  meta/lib/oe/patch.py                    | 17 +++++++++++++++++
>  meta/lib/oeqa/selftest/cases/bbtests.py |  6 ++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index fccbedb519..8326cb55bc 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -56,6 +56,10 @@ def runcmd(args, dir = None):
>          if dir:
>              os.chdir(olddir)
>  
> +def getstatusoutput(cmd):
> +    import subprocess
> +    return subprocess.getstatusoutput(cmd.split())
> +

I'm not convinced this function is adding much or is needed. imports can just go
at the start of the python file in this case too.

>  class PatchError(Exception):
>      def __init__(self, msg):
>          self.msg = msg
> @@ -298,6 +302,19 @@ class GitApplyTree(PatchTree):
>          PatchTree.__init__(self, dir, d)
>          self.commituser = d.getVar('PATCH_GIT_USER_NAME')
>          self.commitemail = d.getVar('PATCH_GIT_USER_EMAIL')
> +        if not self._isInitialized():
> +            self._initRepo()
> +
> +    def _isInitialized(self):
> +        cmd = "git rev-parse --show-toplevel"
> +        (status, output) = getstatusoutput(cmd)
> +        ## Make sure we're in builddir to not break top-level git repos
> +        return status == 0 and os.path.samedir(output, self.dir)
> +
> +    def _initRepo(self):
> +        runcmd("git init".split(), self.dir)
> +        runcmd("git add .".split(), self.dir)
> +        runcmd("git commit -a --allow-empty -m Patching_started".split(), self.dir)
>  
>      @staticmethod
>      def extractPatchHeader(patchfile):
> diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
> index 6779e62103..2c3defc6b7 100644
> --- a/meta/lib/oeqa/selftest/cases/bbtests.py
> +++ b/meta/lib/oeqa/selftest/cases/bbtests.py
> @@ -297,3 +297,9 @@ INHERIT:remove = \"report-error\"
>  
>          test_recipe_summary_after = get_bb_var('SUMMARY', test_recipe)
>          self.assertEqual(expected_recipe_summary, test_recipe_summary_after)
> +
> +    def test_git_patchtool(self):
> +        self.write_recipeinc('man-db', 'PATCHTOOL=\"git\"')
> +        result = bitbake('man-db -c patch', ignore_status=False)
> +        self.delete_recipeinc('man-db')
> +        bitbake('-cclean man-db')

Can you add a comment here about what exactly we're testing please? If something
changes the way the man-db recipe works, this test will break (e.g. it became a
git based recipe rather than tarball).

We may also want to check that the man-db SRC_URI doesn't contain git:// to
guard against that and better document what the test is testing?

Cheers,

Richard





