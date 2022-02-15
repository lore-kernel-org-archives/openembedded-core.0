Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <3ecb78b3324bb26e48c3789d87e74a4b83ff21db.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 15 Feb 2022 13:37:19 +0000
In-Reply-To: <333ededd-79c4-8a21-b6a5-8012b5f793e3@windriver.com>
References: <20220208225310.1685131-1-raj.khem@gmail.com>
	 <333ededd-79c4-8a21-b6a5-8012b5f793e3@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: "Jia, Hongxu" <Hongxu.Jia@windriver.com>, Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Tue, 2022-02-15 at 08:25 +0000, Jia, Hongxu wrote:
> On 2/9/22 06:53, Khem Raj wrote:
> > diff --git a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-
> > unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0001-fix-
> > create-thread-failed-in-unprivileged-process-BZ-.patch
> > deleted file mode 100644
> > index 3283dd7ad8a..00000000000
> > --- a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-
> > unprivileged-process-BZ-.patch
> > +++ /dev/null
> > @@ -1,79 +0,0 @@
> > -From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 2001
> > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > -Date: Sun, 29 Aug 2021 20:49:16 +0800
> > -Subject: [PATCH] fix create thread failed in unprivileged process [BZ
> > #28287]
> > -
> > -Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and
> > clone3]
> > -applied, start a unprivileged container (docker run without --privileged),
> > -it creates a thread failed in container.
> > -
> > -In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined. 
> > If
> > -__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
> > -
> > -As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
> > -CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
> > -was specified by an unprivileged process (process without CAP_SYS_ADMIN)
> > -
> > -[1] https://man7.org/linux/man-pages/man2/clone3.2.html
> > -
> > -So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
> > -fix the issue. Here are the test steps:
> > -
> Hi RP,
> 
> I found this local patch was removed from glibc, we have to get it back and
> regenerate uninative to avoid the thread creation failure in  unprivileged
> container

Sorry about that. Assuming Khem agrees, could you send a patch to add it back
please? I'll then try and sort out a new uninative release.

I wish we had better sanity testing :/.

Thanks,

Richard


