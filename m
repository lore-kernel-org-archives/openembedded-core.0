Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD36C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 20:17:34 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.2858.1640895452918503137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 12:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=W7V/B+7O;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id bm14so101945894edb.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 12:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DUdF5UmlyBQpchIWcVQ38Nr5SS5ta1iiiNH7If8MYoo=;
        b=W7V/B+7O0IVdefwQeVPF4MgMC2jQCfvnvhrfgRbPLoNnZMNv7QU4RMD1FmeCnFYqha
         9rz3DDHMAwm/zADvLUR01MnxdQvN9E5atvsybFlFXct6ly29OHL72SIIe9gM2GP5VuP3
         mEufKnEfe+GSzU+HT+e7muR1xFfpqn3TnPNbTxlJ3Jhgaj5SE2hkABBwhwdbxEd7ssYL
         PvujMJEVBNMEVf5OE8fthfoLnIM02kQM1kbHuMnJ+qokG/SegOfVxHhcNOvduIgZC9Zj
         M4Q4hedbtxHc8G4WgfHh12gfvjMrUVVUMd/gWN5TFY5cFZyNIJGo3oXCjzuAHS6JP6dq
         Uftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DUdF5UmlyBQpchIWcVQ38Nr5SS5ta1iiiNH7If8MYoo=;
        b=U9scEQs6sia/uanlmbpV7ouzcVrh8xryOPQ543oEUFtME2wYeKbjfKE02FQnZ/zn0I
         teJrOIqqTixx7L6Kn0AWMNOcWWjq7gjLvCeBl/z04MyJt4CwSqsmQ4euxJCCX1SScH+U
         B4wdz2gK2RwDBsNwDFK2GnMLOHygpf2dh5Vuy8VVpxjF5O6PbM9ZyRw0KQpNW07ajrhR
         da5PluR6+smA1BJS6BbLUHr2XyShLkJ72nN3DkR2oFe3e+ZbwJGHT0kdhHFYMPbXhHWK
         K3DMi3ZdZgyDi+AWb2K8OJa/kVwYllwmn01YXrVPrxKXwbB4tcL8uXAVKl5W/rz5rFTZ
         JUzA==
X-Gm-Message-State: AOAM532tdKQsQQtWln7DVuPNuGsAlBkVjsM1Wo6HX7FWpGVd2ti0CN5F
	+kHtAMvP8VDHEOccRrTXaITAlbonSgjtPBd0MkxqAw==
X-Google-Smtp-Source: 
 ABdhPJwzCAOnN5pCRp6ArLPxCwLV9coiLNpMhnBD12my/Kq9wH6KyaZW1uKrrRdLTa4LFIT05/YEvca/iLR2uCrOows=
X-Received: by 2002:a17:907:1b24:: with SMTP id
 mp36mr27545290ejc.487.1640895451033;
 Thu, 30 Dec 2021 12:17:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1640181998.git.steve@sakoman.com>
 <a4e272700e18ca7e86e24ce4e24031ce7745c87b.1640181998.git.steve@sakoman.com>
 <16C59D37B8124AF8.22808@lists.openembedded.org>
 <6cf463b6-6612-cac1-80ef-93ce21d9e211@gmail.com>
In-Reply-To: <6cf463b6-6612-cac1-80ef-93ce21d9e211@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 30 Dec 2021 10:17:19 -1000
Message-ID: 
 <CAOSpxdYqjDgfUu6c7qCfMbX1GnHd6TyeCA+vV8geX-1p3xbdGw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 02/14] openssh: Fix CVE-2021-41617
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 20:17:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160065

On Thu, Dec 30, 2021 at 9:04 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On 12/30/21 19:54, Jacob Kroon via lists.openembedded.org wrote:
> > On 12/22/21 15:12, Steve Sakoman wrote:
> >> From: sana kazi <sanakazisk19@gmail.com>
> >>
> >> Add patch to fix CVE-2021-41617
> >> Link: https://bugzilla.suse.com/attachment.cgi?id=854015
> >>
> >> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> >> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> ---
> >>  .../openssh/openssh/CVE-2021-41617.patch      | 52 +++++++++++++++++++
> >>  .../openssh/openssh_8.2p1.bb                  |  1 +
> >>  2 files changed, 53 insertions(+)
> >>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
> >>
> >> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
> >> new file mode 100644
> >> index 0000000000..bda896f581
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
> >> @@ -0,0 +1,52 @@
> >> +From a6414400ec94a17871081f7df24f910a6ee01b8b Mon Sep 17 00:00:00 2001
> >> +From: Ali Abdallah <aabdallah@suse.de>
> >> +Date: Wed, 24 Nov 2021 13:33:39 +0100
> >> +Subject: [PATCH] CVE-2021-41617 fix
> >> +
> >> +backport of the following two upstream commits
> >> +
> >> +f3cbe43e28fe71427d41cfe3a17125b972710455
> >> +bf944e3794eff5413f2df1ef37cddf96918c6bde
> >> +
> >> +CVE-2021-41617 failed to correctly initialise supplemental groups
> >> +when executing an AuthorizedKeysCommand or AuthorizedPrincipalsCommand,
> >> +where a AuthorizedKeysCommandUser or AuthorizedPrincipalsCommandUser
> >> +directive has been set to run the command as a different user. Instead
> >> +these commands would inherit the groups that sshd(8) was started with.
> >> +---
> >> + auth.c | 8 ++++++++
> >> + 1 file changed, 8 insertions(+)
> >> +
> >> +CVE: CVE-2021-41617
> >> +Upstream-Status: Backport [https://bugzilla.suse.com/attachment.cgi?id=854015]
> >> +Comment: No change in any hunk
> >> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> >> +
> >> +diff --git a/auth.c b/auth.c
> >> +index 163038f..a47b267 100644
> >> +--- a/auth.c
> >> ++++ b/auth.c
> >> +@@ -52,6 +52,7 @@
> >> + #include <limits.h>
> >> + #include <netdb.h>
> >> + #include <time.h>
> >> ++#include <grp.h>
> >> +
> >> + #include "xmalloc.h"
> >> + #include "match.h"
> >> +@@ -851,6 +852,13 @@ subprocess(const char *tag, struct passwd *pw, const char *command,
> >> +            }
> >> +            closefrom(STDERR_FILENO + 1);
> >> +
> >> ++           if (geteuid() == 0 &&
> >> ++               initgroups(pw->pw_name, pw->pw_gid) == -1) {
> >> ++                   error("%s: initgroups(%s, %u): %s", tag,
> >> ++                       pw->pw_name, (u_int)pw->pw_gid, strerror(errno));
> >> ++                   _exit(1);
> >> ++           }
> >> ++
> >> +            /* Don't use permanently_set_uid() here to avoid fatal() */
> >> +            if (setresgid(pw->pw_gid, pw->pw_gid, pw->pw_gid) == -1) {
> >> +                    error("%s: setresgid %u: %s", tag, (u_int)pw->pw_gid,
> >> +--
> >> +2.26.2
> >> diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> >> index b60d1a6bd4..e903ec487d 100644
> >> --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> >> +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> >> @@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
> >>             file://add-test-support-for-busybox.patch \
> >>             file://CVE-2020-14145.patch \
> >>             file://CVE-2021-28041.patch \
> >> +           file://CVE-2021-41617.patch \
> >>             "
> >>  SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
> >>  SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
> >>
> >>
> >>
> >>
> >>
> >
> > I would have expected this patch to leave a mark in my buildhistory, but
> > nothing related to openssh(d) shows up.
> >
> > Size of /usr/sbin/sshd stays the same, which at least to me is a little
> > odd.. but I can see that the sha256sum output of sshd changes.
> >
> > (It would be nice to have sha256sum hashes of files in buildhistory)
> >
> > Am I the only one who thinks this is a little strange ?
> >
> > /Jacob
> >
>
> Let me rephrase, I do see changes related to debug information and the
> debug package, but no change in the resulting '/usr/sbin/sshd' size that
> goes in the final image.

Yes, it is unusual that the size of sshd is the same pre and post patch.

I checked the size of auth.o pre and post patch, and it is also the
same (not surprisingly!)

However I've verified that the patch modifies auth.c as desired, and
the md5sums for both auth.o and ssshd are different pre and post patch
(as expected)

So this is just one of those cases where different code results in the
same size!

Steve

