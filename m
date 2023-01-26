Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016CEC05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 21:17:46 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.86648.1674767863082842442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 13:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PWHeHGqa;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: festevam@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id bm8so2624711oib.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 13:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5h/ndj0Xn5kL9nSoPnkYXdtRUlOEp2KjLtFLbZm84sk=;
        b=PWHeHGqaEW7h3SGND+aJ9SooyBr2v6wrXLyMhlllGl04djnyJgP+JSLYDLqlEv9+dL
         w7f8A/eQ7Jst74tDfQpNsjYPxJklOW1IprgUpuuS3phAQ3zYXVTZ42uqJ3n8wATKFHSB
         LCWLX67QPuHGqPNlYVLUh2/eBA7EU0852WVDHS4uBzNWDLYo4i7nqC7pQfE0rJul6wPX
         6UMvSeRvpM6/ix8KxJGF8YOhhXS6o331S4Gg6Eqng5SSeVoN3NF7BfjgdBYsvevXNGyw
         Wnxz/D32+uz1oyuPAxlr83zV0Sc5pYJUmMQqEM4nvHV/DJqC3SK2Q1jK2HaEWQY86fGM
         TN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5h/ndj0Xn5kL9nSoPnkYXdtRUlOEp2KjLtFLbZm84sk=;
        b=6b8rZm4oWTLICvsvvcGsU5KUHAFXJBAAmYCA2uu6ZRnD5OGfEWvnbqFuWCd44lBGD/
         eHV0T1aBQSE6m1f5t5aXvgTnJONDy8POsJU/VBGlPXmZRVr5HegPyoY4YTzBqSjPpipB
         df4eU4Gwom4QlZC1wvANBjNRSWKRaMLFuLAjFdlRjeZ/4ZOGJ5bF4mtDOD0pzJ3ddtjR
         xXXcPJEOegp4P/mKX6HsTWyhyKPAAr7beYgt9BV4z+uI856MeX8drYKo4KG6DiqYp04w
         ga7jcrkA7vg1Q/8sBmeqfAtOKRuGAZzbeE/grKneTpDnTkUGHNn79UzgkjqRlAOkfUjz
         kBgQ==
X-Gm-Message-State: AFqh2ko5nzAApVmXMiF2FwaMHEQwyzBwQLHGg7HlFdoe286ik2ymsYrz
	v39QizR1MBvu6ySvMzodde8zMfeKKnw=
X-Google-Smtp-Source: AMrXdXuol6gBCzxIUXCLFAhKLrYl6eQAIkZM/junQ4NsiwrbU76FgAkd6mEik04Fb6ipEjU61Q53aQ==
X-Received: by 2002:aca:5bd5:0:b0:35c:46c8:2638 with SMTP id p204-20020aca5bd5000000b0035c46c82638mr12454072oib.12.1674767862019;
        Thu, 26 Jan 2023 13:17:42 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:e83c:473f:f93a:fe6e])
        by smtp.gmail.com with ESMTPSA id k23-20020a056830151700b00684caa721a8sm945086otp.17.2023.01.26.13.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 13:17:41 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Marek Vasut <marex@denx.de>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH][kirkstone] bitbake: fetch2/git: Prevent git fetcher from fetching gitlab repository metadata
Date: Thu, 26 Jan 2023 18:17:24 -0300
Message-Id: <20230126211724.3088459-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 21:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176425

From: Marek Vasut <marex@denx.de>

The bitbake git fetcher currently fetches 'refs/*:refs/*', i.e. every
single object in the remote repository. This works poorly with gitlab
and github, which use the remote git repository to track its metadata
like merge requests, CI pipelines and such.

Specifically, gitlab generates refs/merge-requests/*, refs/pipelines/*
and refs/keep-around/* and they all contain massive amount of data that
are useless for the bitbake build purposes. The amount of useless data
can in fact be so massive (e.g. with FDO mesa.git repository) that some
proxies may outright terminate the 'git fetch' connection, and make it
appear as if bitbake got stuck on 'git fetch' with no output.

To avoid fetching all these useless metadata, tweak the git fetcher such
that it only fetches refs/heads/* and refs/tags/* . Avoid using negative
refspecs as those are only available in new git versions.

Per feedback on the ML, Gerrit may push commits outsides of branches or
tags during CI runs, which currently works with the 'nobranch=1' fetcher
parameter. To retain this functionality, keep fetching everything in case
the 'nobranch=1' is present. This still avoids fetching massive amount of
data in the common case, since 'nobranch=1' is rare. Update 'nobranch'
documentation.

Reviewed-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
(Bitbake rev: d32e5b0ec2ab85ffad7e56ac5b3160860b732556)

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../bitbake-user-manual/bitbake-user-manual-fetching.rst  | 4 ++--
 bitbake/lib/bb/fetch2/git.py                              | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
index 9c269ca837..e86a4d86ea 100644
--- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
+++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
@@ -424,8 +424,8 @@ This fetcher supports the following parameters:
 
 -  *"nobranch":* Tells the fetcher to not check the SHA validation for
    the branch when set to "1". The default is "0". Set this option for
-   the recipe that refers to the commit that is valid for a tag instead
-   of the branch.
+   the recipe that refers to the commit that is valid for a any namespace
+   instead of the branch.
 
 -  *"bareclone":* Tells the fetcher to clone a bare clone into the
    destination directory without checking out a working tree. Only the
diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index f0df6fb69b..37b2a07d89 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -44,7 +44,7 @@ Supported SRC_URI options are:
 
 - nobranch
    Don't check the SHA validation for branch. set this option for the recipe
-   referring to commit which is valid in tag instead of branch.
+   referring to commit which is valid in any namespace instead of branch.
    The default is "0", set nobranch=1 if needed.
 
 - usehead
@@ -374,7 +374,11 @@ class Git(FetchMethod):
               runfetchcmd("%s remote rm origin" % ud.basecmd, d, workdir=ud.clonedir)
 
             runfetchcmd("%s remote add --mirror=fetch origin %s" % (ud.basecmd, shlex.quote(repourl)), d, workdir=ud.clonedir)
-            fetch_cmd = "LANG=C %s fetch -f --progress %s refs/*:refs/*" % (ud.basecmd, shlex.quote(repourl))
+
+            if ud.nobranch:
+                fetch_cmd = "LANG=C %s fetch -f --progress %s refs/*:refs/*" % (ud.basecmd, shlex.quote(repourl))
+            else:
+                fetch_cmd = "LANG=C %s fetch -f --progress %s refs/heads/*:refs/heads/* refs/tags/*:refs/tags/*" % (ud.basecmd, shlex.quote(repourl))
             if ud.proto.lower() != 'file':
                 bb.fetch2.check_network_access(d, fetch_cmd, ud.url)
             progresshandler = GitProgressHandler(d)
-- 
2.25.1


