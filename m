Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.17329.1601477405519585141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 07:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TwkBbf3J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id v12so2087698wmh.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 07:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=KrJsU7E94ObEIfCnps1Qh3l0Hf8q8DlEeEkdIeNsnfs=;
        b=TwkBbf3JzVE/ZRLpH6afqBV5JCW+Z2rzsyT0DNWphLTPq5w1Wzutf71HxQvWMw6j66
         kUlLEmJzowKzPaDWGbgxc+bmHT4fpNaqP/8AdMeBw/uDzpIw49fWahmXfEORgzkFsvI+
         BB0JsUEZwa0cBkcKUyJshMcz8EmjgwF01XM3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=KrJsU7E94ObEIfCnps1Qh3l0Hf8q8DlEeEkdIeNsnfs=;
        b=VuCo33isdCI+hSdOftdPvLqoyOfNp9nqEmvn6vQcMiCJpUUus/0rY05c4x9cIJzzow
         VYipxsRVPkrNELJsNBEUw6Ii05i1VKHG6+ACX21Wssqtte99loqUvQ7B9Xm9Jdj8HfFd
         6I0ldX0m9f4Pc8P07CflMiVOK/q36lKbfEndLsFuKLwOghbNXNoimQ6ToUTSAO3AWhru
         qlrIJBcdr7Jc+FIMQCOUkysZbE/R64abd01IwM2EzNqVhjoXb9Yqld3v9wNMjFrOxBnt
         56MyN4hGTSjYrOCUTaUfl1v6x7XHbwcTwSUrtrE4sR/Lpjvu0e/w22nkEAB3DTOZcLOE
         /+zA==
X-Gm-Message-State: AOAM533NPUKkJzoQxuzMbA7DLmX7nul3sxL95lgF3s3kK5iwBVKWvxJy
	O6oe5+Ym4P8+SF8dK7VroqJNk54Gikb1mA==
X-Google-Smtp-Source: ABdhPJwljBzZGTmd22UnWjtL0IXcbqb/vOPT7oRnOfIgFDW4kekAMHTDbbJ9A7htIBMVCSm545Bexg==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr3561553wmp.187.1601477403260;
        Wed, 30 Sep 2020 07:50:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id y1sm3144408wma.36.2020.09.30.07.50.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:50:02 -0700 (PDT)
Message-ID: <6a941db53044a51874cd4df5c63c0a86d5d437ea.camel@linuxfoundation.org>
Subject: Ongoing pseudo issues and request for help
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2020 15:50:01 +0100
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As people have probably gathered we have some concerns about rare file
mode corruption with pseudo. This is really really rare but its not
right and we need to do something about it.

As discussed on list recently, we need to make pseudo abort() when it
encounters such an issue rather than hacking around it.

Patches to make pseudo abort in such a case are in master-next, along
with a set of other changes. These changes make pseudo ignore a set of
directories from a permissions/ownership perspective.

The current setting is (line wrapped to make it more readable):

+PSEUDO_IGNORE_PATHS = " \
/usr/,
/etc/,
/lib,
/dev/,
${T},
${WORKDIR}/recipe-sysroot,
${SSTATE_DIR},
${STAMPS_DIR},
${WORKDIR}/pkgdata-sysroot,
${TMPDIR}/sstate-control,
${DEPLOY_DIR},
${WORKDIR}/deploy-,
${TMPDIR}/buildstats,
${WORKDIR}/sstate-build-package_,
${WORKDIR}/sstate-install-package_,
${TMPDIR}/sysroots-components"

which seems to give us a good start. In particular, this makes
packaging during do_package_write_* mostly happen under pseudo but the
final files are not written out in pseudo active paths. This is
deliberate and necessary but also slightly complicates things.

Also note there is conditional code to add ${S} and ${B} to this list
if they're not ${WORKDIR}. Path matching happens by the start of the
path matching one of these fragments.

If you run with these patches you'll probably end up with one of a
number of issues:

ERROR: Task (/home/pokybuild/yocto-worker/non-gpl3/build/meta/recipes-core/glibc/glibc_2.32.bb:do_package) failed with exit code '134'

means the task aborted. To debug, take a look at the pseudo log file:

pokybuild@tumbleweed-ty-3:~/yocto-worker/non-gpl3/build/build-renamed/tmp/work/core2-32-poky-linux/glibc/2.32-r0/pseudo> cat pseudo.log
debug_logfile: fd 2
pid 1997 [parent 1996], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 1996.
path mismatch [2 links]: ino 236066483 db '/home/pokybuild/yocto-worker/non-gpl3/build/build/tmp/work/core2-32-poky-linux/glibc/2.32-r0/image/usr/share/locale/cs' req '/home/pokybuild/yocto-worker/non-gpl3/build/build/tmp/work/core2-32-poky-linux/glibc/2.32-r0/sstate-build-package/package'.
db cleanup for server shutdown, 14:15:45.384
memory-to-file backup complete, 14:15:45.385.
db cleanup finished, 14:15:45.385

The abort is from the path mismatch.

It means that a lookup was seen for:

/home/pokybuild/yocto-worker/non-gpl3/build/build/tmp/work/core2-32-poky-linux/glibc/2.32-r0/sstate-build-package/package

but it wasn't in the database. There was a matching inode entry in the database of:

/home/pokybuild/yocto-worker/non-gpl3/build/build/tmp/work/core2-32-poky-linux/glibc/2.32-r0/image/usr/share/locale/cs

This is puzzling as files in WIORKDIR/image/ would come from
do_install, so something has removed a file added during do_install but
has done so outside of pseudo's "sight" (a task without fakeroot
context?).

At this point the work is in figuring out what happened to that file
and ensuring pseudo does see what happens to anything in WORKDIR/image.

You may also see user/group number lookup issues, usually where its
tried to resolve the build user ID. Usually something like:

Exception: KeyError: 'getpwuid(): uid not found: 1000'

If this is from the sstatesig code, the file being accessed should be
listed before the traceback. Its then a question of debugging why that
file isn't being seen by pseudo (and whether it should be or not).

We need to start to look into the failing cases and figure out what the
patterns are, why they're not being seen by pseudo and work through
them.

For one case for locale-archive in do_rootfs, I had to add new
functionality to pseudo.

In that case it was an access pattern of:

fd = fopen("A")
link("A", "B")
unlink("A")
fchown(fd)

pseudo maintains a list of paths for the open fds and this breaks with
the above scenario.

I've put the patches in master-next on the autobuilder and will start
working through the issues it highlights but help would be appreciated.
Its hard to tell how big this problem even is right now.

Cheers,

Richard



