Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02248C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 08:07:08 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.26272.1652688422226756543
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 01:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fXkdzPGq;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id eg11so3355176edb.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 01:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+OnQkSwcYjkJubyS0oPQkgDRKGc50uIEuBlGI9gseK0=;
        b=fXkdzPGqd8MPLjhawQVyecMr9/mQZUN7T/KOqlx9js+GCRWBlCFHMOd1ni/0GtK/a6
         mrz52duoH3/ggHfG/d0YuXf7oTE2i88P8Tc8a7pjfCRAizATc4HNqkF0286OfCDKWS99
         SUPJoiOR7lNfP8s4/2dWXOIqLPiN2auTEXgMOQqKA4RHil0IDIZcsIMuu8IESy9KpNt0
         kapFtmydsXCpgwOeYUsX1ndbjqZ0vLnavKGGjyeqdC4Tlr+DW5QEl5KvPVRMb9oinwoj
         uvx8pUDLzPBeiZe1V/BTWIjtyGm88Wrw704T9Q9JZZiD7T0rO6DAO0e56n0eKcTZ+Ytq
         R4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+OnQkSwcYjkJubyS0oPQkgDRKGc50uIEuBlGI9gseK0=;
        b=iw4bKPmCove+FyLtOaYGXio5a1MARg0FJc/LVJ7g+D42MyFadEpDjc6zTm+7F1QbHC
         ruAboA0nffeQzCPSR2brti1Zo8uRIWVcV1AW27yMP/YbEoa8kyF0R8+hzEjd6n+1gCkz
         ox+j2G6Xx/baU2B6SW9wAXLLzhIqFTuWzmRWPI9mx1cfvvWiQo3KCJQJPKXAYAAs0WLp
         LjcqzrFGDlYlxwNVDcPHMbYpxZlhhQaGMHhHn3U8BuN1Gz+utMJi1e9eySo+40K1v7bY
         aSVSEglQfVBt453rCqOFDscZjjbEi73KQ0IgE8bQCwCrJsMuG96BedtBtapB47l3cqFM
         tEaQ==
X-Gm-Message-State: AOAM5304PAvRmhorBQUyfA4FwFVT1OwGWpiA9WG/eRzjQabaRUlVewBB
	DjHotPfLpBZkFmiP1obScURHkmOvIKzk+usUAcc=
X-Google-Smtp-Source: 
 ABdhPJwPRGdd+408zjWqyiYm4clb/gm7wBFerHcjk0VTIvGmWyMzOZudHzk5Ck1lHs9f/n8pEt6VwCLNaFiHuVUWil0=
X-Received: by 2002:a05:6402:2714:b0:427:b9bb:a179 with SMTP id
 y20-20020a056402271400b00427b9bba179mr11449013edd.102.1652688420661; Mon, 16
 May 2022 01:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220512054303.429208-1-changqing.li@windriver.com>
 <CAO5Uq5TO3gZQNkucAy9s8aiJ=0+nMJDe-zw=SBT+wOjbUQwniQ@mail.gmail.com>
 <dbf5957af1a1afd39a90465b47eeae90fa6f350e.camel@linuxfoundation.org>
 <SN6PR11MB25578B38EF44CB5A0D00A40782CA9@SN6PR11MB2557.namprd11.prod.outlook.com>
 <CAO5Uq5Tyakm1_Q26j93ok83of5Uru-J07i4657fg58AYxBTaQw@mail.gmail.com>
 <SN6PR11MB255731C22AC93F566A3FEB6C82CF9@SN6PR11MB2557.namprd11.prod.outlook.com>
In-Reply-To: 
 <SN6PR11MB255731C22AC93F566A3FEB6C82CF9@SN6PR11MB2557.namprd11.prod.outlook.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 16 May 2022 09:06:49 +0100
Message-ID: 
 <CAO5Uq5Tr+0jjec3VY+UQrEyyjoHP3UpWuRJUQrmN+yeZ9ToyDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
To: "Li, Changqing" <Changqing.Li@windriver.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 08:07:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165667

Untested, but if its useful (I suspect cut & paste will have broken spaces):

diff --git a/meta/recipes-core/udev/eudev/init
b/meta/recipes-core/udev/eudev/init
index c60dbbf6d512..64cd0ea3ef39 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -23,6 +23,38 @@ kill_udevd () {
     [ -n "$pid" ] && kill $pid
 }

+make_static_nodes () {
+       kmod static-nodes --format=tmpfiles |
+       while read TTYPE TPATH TMODE TUSER TGROUP TAGE TARG; do
+       case "${TTYPE}" in
+       'd')
+               test -d "${TPATH}" || mkdir -p -m "${TMODE}" "${TPATH}"
+               ;;
+
+       'c!')
+               if [ ! -c "${TPATH}" ]; then
+                       old_ifs="${IFS}"
+                       IFS=:
+                       set -- ${TARG}
+                       IFS="${old_ifs}"
+                       mknod -m "${TMODE}" "${TPATH}" c "$@"
+               fi
+               ;;
+
+       *)
+               echo ERROR
+               exit 1
+               ;;
+       esac
+       if [ "${TUSER}" != "-" ]; then
+               chown "${TUSER}" "${TPATH}"
+       fi
+       if [ "${TGROUP}" != "-" ]; then
+               chown "${TGROUP}" "${TPATH}"
+       fi
+       done
+}
+
 case "$1" in
   start)
     export ACTION=add
@@ -51,6 +83,8 @@ case "$1" in
     # make_extra_nodes
     kill_udevd > "/dev/null" 2>&1

+    make_static_nodes
+
     # trigger the sorted events
     [ -e /proc/sys/kernel/hotplug ] && printf '\0\n' >/proc/sys/kernel/hotplug
     @UDEVD@ -d

On Mon, May 16, 2022 at 6:35 AM Li, Changqing
<Changqing.Li@windriver.com> wrote:
>
>
>
> ________________________________
> From: Alex Kiernan <alex.kiernan@gmail.com>
> Sent: Sunday, May 15, 2022 10:59 PM
> To: Li, Changqing <Changqing.Li@windriver.com>
> Cc: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.org>; Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Fri, May 13, 2022 at 2:42 AM Li, Changqing
> <Changqing.Li@windriver.com> wrote:
> >
> >
> >
> > ________________________________
> > From: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.org>
> > Sent: Thursday, May 12, 2022 6:33 PM
> > To: Alex Kiernan <alex.kiernan@gmail.com>; Li, Changqing <Changqing.Li@windriver.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
> >
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Thu, 2022-05-12 at 08:45 +0100, Alex Kiernan wrote:
> > > On Thu, May 12, 2022 at 6:43 AM Changqing Li <changqing.li@windriver.com> wrote:
> > > >
> > > > From: Changqing Li <changqing.li@windriver.com>
> > > >
> > > > dev in modules.devname should be populated in /dev on boot.
> > > > remove create static mode from udevd will make these devices
> > > > cannot be populated. When use sysVinit, devices like /dev/net/tun
> > > > will not be created.
> > > >
> > > > more info:
> > > > udevd in systemd also remove create static mode in udevd, but using
> > > > service kmod-static-nodes.service and
> > > > systemd-tmpfiles-setup-dev.service in systemd to create these node, so
> > > > systemd works well.
> > > >
> > > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > > ---
> > > >  ...dev-create-static-nodes-from-modules.patch | 115 ++++++++++++++++++
> > > >  meta/recipes-core/udev/eudev_3.2.11.bb        |   1 +
> > > >  2 files changed, 116 insertions(+)
> > > >  create mode 100644 meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
> > > >
> > > > diff --git a/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
> > > > new file mode 100644
> > > > index 0000000000..19611f4e89
> > > > --- /dev/null
> > > > +++ b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
> > > > @@ -0,0 +1,115 @@
> > > > +From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon Sep 17 00:00:00 2001
> > > > +From: Changqing Li <changqing.li@windriver.com>
> > > > +Date: Tue, 10 May 2022 14:04:35 +0800
> > > > +Subject: [PATCH] eudev: create static nodes from modules
> > > > +
> > > > +Revert commit <src/udev/udevd.c: remove create static nodes from modules>
> > > > +https://gitweb.gentoo.org/proj/eudev.git/commit/?id=2b7abd5ec9cc47a8b895df6db77fb1537c6f1a39
> > > > +
> > > > +Upstream-Status: Inappropriate [oe-specific]
> > > > +
> > > > +Upstream intentionally remove create static nodes from modules, it is
> > > > +expected handled by tmpfiles services, refer [1].
> > > > +[1] https://github.com/eudev-project/eudev/issues/229
> > > > +
> > > > +For yocto, when start with sysVinit, to enable systemd distro feature,
> > > > +and install systemd-tmpfiles is not proper, so revert this commit.
> > > > +
> > >
> > > Reading the upstream issue, I'm not sure this really is an
> > > "Inappropriate" upstream. eudev has dropped this commit, because you
> > > can use systemd-tmpfiles ("as it works without systemd and can be
> > > compiled individually" - presumably using our unsupported musl
> > > patches...) or opentmpfiles (which is dead and points you back to
> > > systemd-tmpfiles).
> > >
> > > Feels like this is an engage with upstream rather than carry a patch
> > > forever which just causes us to be perpetually divergent.
> >
> > I agree, this does sound like something we need to address to keep the
> > project maintainable...
> >
> > I tried to suggest upstream to add this back,  but  upstream seems prefer to use tmpfile solution.
> >
>
> Given how limited the output format which static-nodes generates for
> tmpfiles is (just d and c! entries), parsing that output directly as
> part the eudev init script wouldn't be horrible. Or make kmod generate
> files in the format that volatiles expects? Though that would need
> populate-volatile extending to generate device nodes.
>
> Thanks, I will dig more about the tmpfile solution, and send a V2 patch.
>
> Regards
> Changqing
>
> --
> Alex Kiernan



-- 
Alex Kiernan

