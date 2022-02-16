Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06B2C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 09:22:51 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web09.9851.1645003370842678561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 01:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QaSzsyn6;
 spf=pass (domain: gmail.com, ip: 209.85.217.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id p7so1760889vsg.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 01:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhGovcS/kYy8Yo5cV3gfcJNr0mrPVfP68D0sm3oKJNc=;
        b=QaSzsyn65G2sx+5Y7ozaBoCVIzdfG8yWe/AxcOi0wpotWBvDnfyyh+08PBBg8PijDy
         TDWVFRizKktcauSJ1v1kL+65/PTprqRRYoqHzUgh2EpBdIdBBWSG5x0TZArCj3uifC1F
         XEeKE51P58yX1KFD4HeX9wYcLYK1M+TmbsV03fqgNBOf/msx16W+M2aL34koQLGL4VZb
         BUnJpdslo9Zg/s3cIzdztB1Bb9LvFDpVxSwqcdKAue/v2dzPtR555ipTs5htVWkTPVaW
         7cLZSpExKxSKdwkC5uxmFs1Kf+dHoAjTJa7Iou6/YT0w77WLdH8TYQvYfaSqF/GgWz3w
         OBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhGovcS/kYy8Yo5cV3gfcJNr0mrPVfP68D0sm3oKJNc=;
        b=1jWVVzKYCfCY0d04uDq1mSdODOjlchaQs1DdDiTZD2K0kR+VB8freTDy+IWirXEcuE
         6T4cMj6Pl5AMV3Uno/23406Z54wBAq7B7Hmr1cua8V3xUf4jzLX0mSUiZWMnkFCRNEZM
         oe6GQy+6oXLWq6pHzHYT/yav8XlDRS0+RPknF7mqcWF7uBI6MKagxCwjhh2UOLZrdyLA
         UkeA69L2TxRGWX3IccgvVmTCqPQQqj/yQM35JQkJXj/QxjBhsufy0MRim6fQhuMmv5Cc
         SMS3/x9qRaLL89/nHh7uk2eUSsNuGWLD2UlMY9RItnLwM3ZM/eC5UGGtfuQuDVGXCnhD
         Sq4w==
X-Gm-Message-State: AOAM533qiYZxt2tbQBCQxZ1AuRkonUYj3vIpinjhmDlCKf4ke9QTZuCa
	X8iQIVCzNRlGJb3x2ugXrPOvXkc+DL3DYsHE8I4=
X-Google-Smtp-Source: 
 ABdhPJxzs5OSODGEuSjkEhBxdxLqPZo8IRQGbmUvQQNjcih63whKhyYJklGldSwhqD9WdQ+Ul22kcuknRr2Q1Mis1FI=
X-Received: by 2002:a05:6102:5091:b0:31b:a839:872c with SMTP id
 bl17-20020a056102509100b0031ba839872cmr514126vsb.26.1645003369798; Wed, 16
 Feb 2022 01:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20220208225310.1685131-1-raj.khem@gmail.com>
 <333ededd-79c4-8a21-b6a5-8012b5f793e3@windriver.com>
 <CAMKF1sp5rtBg0tf4mN-9VBUxVYXbqrA1i8nQe-L_8MHNRapj1g@mail.gmail.com>
 <MW3PR11MB4633B716168A3E59ECA2F06994359@MW3PR11MB4633.namprd11.prod.outlook.com>
 <CAMKF1srKp84XMQLTs6jbfhxMhgBK2suLxjHQNbdPBH+gT9qW1g@mail.gmail.com>
 <MW3PR11MB46331A0B570CEB101DACBE1E94359@MW3PR11MB4633.namprd11.prod.outlook.com>
In-Reply-To: 
 <MW3PR11MB46331A0B570CEB101DACBE1E94359@MW3PR11MB4633.namprd11.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 Feb 2022 10:22:38 +0100
Message-ID: 
 <CA+chaQevizhQX+ogTf+5rOhbjJjch8yS79S+DOpk8o-KFm90HA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
To: hongxu <hongxu.jia@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000082e13d05d81f314c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 09:22:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161772

--00000000000082e13d05d81f314c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ubuntu patched their docker.io package shortly after upgrading to
glibc-2.34 in Ubuntu-21.10, see:
http://changelogs.ubuntu.com/changelogs/pool/universe/d/docker.io/docker.io=
_20.10.7-0ubuntu5~20.04.2/changelog

docker.io (20.10.7-0ubuntu4) impish; urgency=3Dmedium

  * d/p/seccomp-add-support-for-clone3-syscall-in-default-policy.patch: Fix
    failure with new glibc clone3 syscall adding it to the default seccomp
    policy (LP: #1943049).

 -- Lucas Kanashiro <kanashiro@ubuntu.com>  Fri, 10 Sep 2021 15:34:38 -0300

AFAIK Ubuntu isn't affected anymore, I've updated
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1711 and I'm fine with
dropping the patch now (it was useful before, but now distributions had
enough time to prepare for 2.34 changes).

On Wed, Feb 16, 2022 at 9:31 AM hongxu <hongxu.jia@windriver.com> wrote:

> From upstream docker github [1]
>
> The issue was found in 20.10.7, the the fix was merged in v20.10.10-rc1
> [2]
> From docker release notes, it was published in version 20.10.10 at
> 2021-10-25[3]
>
> In ubuntu 20.04.2, the docker version is 20.10.7 (20.10.7-0ubuntu1~
> 20.04.2) [4],
>
> From [5], Ubuntu 21.10 and Fedora 35 has the issue
>
> [1] https://github.com/moby/moby/issues/42680
> <https://github.com/moby/moby/issues/42680>
> seccomp filter breaks latest glibc (in fedora rawhide) by blocking clone3
> with EPERM =C2=B7 Issue #42680 =C2=B7 moby/moby =C2=B7 GitHub
> <https://github.com/moby/moby/issues/42680>
> Client: Version: 20.10.7 API version: 1.41 Go version: go1.16.6 Git
> commit: f0df350 Built: Mon Jul 26 16:34:29 2021 OS/Arch: linux/amd64
> Context: default Experimental ...
> github.com
> *=EE=9C=91*
> [2]
> https://github.com/moby/moby/commit/6835d15f5523063f0a04a86d4810a637c6010=
d62
>
> <https://github.com/moby/moby/commit/6835d15f5523063f0a04a86d4810a637c601=
0d62>
> [20.10] update containerd binary to v1.4.10 =C2=B7 moby/moby@6835d15
> <https://github.com/moby/moby/commit/6835d15f5523063f0a04a86d4810a637c601=
0d62>
> - Update runc to v1.0.2 - Update hcsshim to v0.8.21 - Support
> &quot;clone3&quot; in default seccomp profile - Fix panic in metadata
> content writer on copy error Signed-off-by: Sebastiaan van Stijn...
> github.com
> *=EE=9C=91*
>
> [3] https://docs.docker.com/engine/release-notes/#201010
> Docker Engine release notes - Docker Documentation
> <https://docs.docker.com/engine/release-notes/#201010>
> Docker Engine release notes. This document describes the latest changes,
> additions, known issues, and fixes for Docker Engine. Note: The client an=
d
> container runtime are now in separate packages from the daemon in Docker
> Engine 18.09. Users should install and update all three packages at the
> same time to get the latest patch releases.
> docs.docker.com
>
>
> [4] https://bugs.launchpad.net/ubuntu/+source/docker.io/+bug/1948361
> Bug #1948361 =E2=80=9Cdocker.io - error adding seccomp filter rule for s.=
.. : Bugs
> : docker.io package : Ubuntu
> <https://bugs.launchpad.net/ubuntu/+source/docker.io/+bug/1948361>
> Encountered the following error using the docker.io package in
> focal-proposed running the
> autotest-client-test/ubuntu_performance_deep_learning test. "docker: Erro=
r
> response from daemon: failed to create shim: OCI runtime create failed:
> container_linux.go:380: starting container process caused: error adding
> seccomp filter rule for syscall clone3: permission denied: unknown." This
> test essentially pulls down a nvidia tensorflow docker container, runs th=
e
> container and triggers the preloaded ...
> bugs.launchpad.net
> *=EE=9C=91*
>
> [5]
> https://pascalroeleven.nl/2021/09/09/ubuntu-21-10-and-fedora-35-in-docker=
/
> Ubuntu 21.10 and Fedora 35 in Docker =E2=80=93 Pascal Roeleven
> <https://pascalroeleven.nl/2021/09/09/ubuntu-21-10-and-fedora-35-in-docke=
r/>
> Here I am, back again with another post which I think the internet needs.
> It took me days to figure it out and I can=E2=80=99t imagine there aren=
=E2=80=99t more
> people who are running into the same issue.
> pascalroeleven.nl
>
> //Hongxu
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Wednesday, February 16, 2022 12:08 PM
> *To:* Jia, Hongxu <Hongxu.Jia@windriver.com>
> *Cc:* Richard Purdie <richard.purdie@linuxfoundation.org>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
>
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
>
> On Tue, Feb 15, 2022 at 6:28 PM Jia, Hongxu <Hongxu.Jia@windriver.com>
> wrote:
>
> Hi khem,
>
> Upstream glibc reject it because the latest docker has supported it[1],
> and upstream glibc does not backward compatibility with old docker[2]
>
> In order to build Yocto with uninative in old docker, we need this local
> patch
>
>
> How old is the docker and I assume
> It=E2=80=99s some distribution needing it ?
>
>
> [1]
> https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6=
594
> <https://urldefense.com/v3/__https://github.com/moby/moby/commit/9f6b562d=
d12ef7b1f9e2f8e6f2ab6477790a6594__;!!AjveYdw8EvQ!JrdILWjxfDiWHnl5n9iunsdZlq=
M0OsXFKtRci3uAgclNV9L6va0Ic-5IjAs7u16jFNv8$>
>
> <https://urldefense.com/v3/__https://github.com/moby/moby/commit/9f6b562d=
d12ef7b1f9e2f8e6f2ab6477790a6594__;!!AjveYdw8EvQ!JrdILWjxfDiWHnl5n9iunsdZlq=
M0OsXFKtRci3uAgclNV9L6va0Ic-5IjAs7u16jFNv8$>
> seccomp: add support for "clone3" syscall in default policy =C2=B7
> moby/moby@9f6b562
> <https://urldefense.com/v3/__https://github.com/moby/moby/commit/9f6b562d=
d12ef7b1f9e2f8e6f2ab6477790a6594__;!!AjveYdw8EvQ!JrdILWjxfDiWHnl5n9iunsdZlq=
M0OsXFKtRci3uAgclNV9L6va0Ic-5IjAs7u16jFNv8$>
> If no seccomp policy is requested, then the built-in default policy in
> dockerd applies. This has no rule for &quot;clone3&quot; defined, nor any
> default errno defined. So when runc receives the con...
> github.com
> <https://urldefense.com/v3/__http://github.com__;!!AjveYdw8EvQ!JrdILWjxfD=
iWHnl5n9iunsdZlqM0OsXFKtRci3uAgclNV9L6va0Ic-5IjAs7u_GA6nFS$>
> *=EE=9C=91*
>
> [2]https://sourceware.org/pipermail/libc-alpha/2021-August/130590.html
> <https://urldefense.com/v3/__https://sourceware.org/pipermail/libc-alpha/=
2021-August/130590.html__;!!AjveYdw8EvQ!JrdILWjxfDiWHnl5n9iunsdZlqM0OsXFKtR=
ci3uAgclNV9L6va0Ic-5IjAs7u54oSjL_$>
>
> //Hongxu
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Wednesday, February 16, 2022 12:17 AM
> *To:* Jia, Hongxu <Hongxu.Jia@windriver.com>
> *Cc:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Richard Purdie <
> richard.purdie@linuxfoundation.org>
> *Subject:* Re: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
>
> On Tue, Feb 15, 2022 at 12:25 AM Jia, Hongxu <Hongxu.Jia@windriver.com>
> wrote:
> >
> > On 2/9/22 06:53, Khem Raj wrote:
> >
> > diff --git
> a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivil=
eged-process-BZ-.patch
> b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivil=
eged-process-BZ-.patch
> > deleted file mode 100644
> > index 3283dd7ad8a..00000000000
> > ---
> a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivil=
eged-process-BZ-.patch
> > +++ /dev/null
> > @@ -1,79 +0,0 @@
> > -From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 2001
> > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > -Date: Sun, 29 Aug 2021 20:49:16 +0800
> > -Subject: [PATCH] fix create thread failed in unprivileged process [BZ
> #28287]
> > -
> > -Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and
> clone3]
> > -applied, start a unprivileged container (docker run without
> --privileged),
> > -it creates a thread failed in container.
> > -
> > -In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is
> defined.  If
> > -__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
> > -
> > -As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
> > -CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
> > -was specified by an unprivileged process (process without CAP_SYS_ADMI=
N)
> > -
> > -[1] https://man7.org/linux/man-pages/man2/clone3.2.html
> <https://urldefense.com/v3/__https://man7.org/linux/man-pages/man2/clone3=
.2.html__;!!AjveYdw8EvQ!JrdILWjxfDiWHnl5n9iunsdZlqM0OsXFKtRci3uAgclNV9L6va0=
Ic-5IjAs7u3AyFyV8$>
> > -
> > -So if __clone3 returns -1 with EPERM, fall back to clone or clone2 cou=
ld
> > -fix the issue. Here are the test steps:
> > -
> >
> > Hi RP,
> >
> >
> > I found this local patch was removed from glibc, we have to get it back
> and regenerate uninative to avoid the thread creation failure in
> unprivileged container
> >
>
> I intentionally dropped it since upstream glibc will not accept this
> patch since its not glibc problem but
> rather container runtime problem. Can you investigate that path before
> we reapply it. Maintaining a rejected patch is last thing we want to
> do.
>
> >
> > //Hongxu
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161771):
> https://lists.openembedded.org/g/openembedded-core/message/161771
> Mute This Topic: https://lists.openembedded.org/mt/89009276/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000082e13d05d81f314c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ubuntu patched their <a href=3D"http://docker.io">docker.i=
o</a> package shortly after upgrading to glibc-2.34 in Ubuntu-21.10, see:<d=
iv><a href=3D"http://changelogs.ubuntu.com/changelogs/pool/universe/d/docke=
r.io/docker.io_20.10.7-0ubuntu5~20.04.2/changelog">http://changelogs.ubuntu=
.com/changelogs/pool/universe/d/docker.io/docker.io_20.10.7-0ubuntu5~20.04.=
2/changelog</a><br></div><div><br></div><div><a href=3D"http://docker.io">d=
ocker.io</a> (20.10.7-0ubuntu4) impish; urgency=3Dmedium<br><br>=C2=A0 * d/=
p/seccomp-add-support-for-clone3-syscall-in-default-policy.patch: Fix<br>=
=C2=A0 =C2=A0 failure with new glibc clone3 syscall adding it to the defaul=
t seccomp<br>=C2=A0 =C2=A0 policy (LP: #1943049).<br></div><div><br></div><=
div>=C2=A0-- Lucas Kanashiro &lt;<a href=3D"mailto:kanashiro@ubuntu.com">ka=
nashiro@ubuntu.com</a>&gt; =C2=A0Fri, 10 Sep 2021 15:34:38 -0300<br></div><=
div><br></div><div>AFAIK Ubuntu isn&#39;t affected anymore, I&#39;ve update=
d=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1711"=
>https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1711</a> and I&#39;m f=
ine with dropping the patch now (it was useful before, but now distribution=
s had enough time to prepare for 2.34 changes).</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 16, 2022=
 at 9:31 AM hongxu &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.j=
ia@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<span style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(2=
55,255,255)">From upstream docker github [1]</span>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
<br>
</div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
The issue was found in<span>=C2=A0</span><span style=3D"margin:0px">20.10.7=
, the the fix was merged in=C2=A0v20.10.10-rc1 [2]</span></div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
<span style=3D"margin:0px">From docker release notes, it was published in v=
ersion 20.10.10 at 2021-10-25[3]</span></div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
<br>
</div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
<span style=3D"margin:0px;background-color:white">In ubuntu 20.04.2, the do=
cker version is=C2=A0</span><span style=3D"margin:0px;background-color:whit=
e">20.10.7 (</span><span style=3D"margin:0px;background-color:white">20.10.=
7-</span><span style=3D"margin:0px;background-color:white">0ubuntu1~</span>=
<span style=3D"margin:0px;background-color:white">20.04.2)=C2=A0[4],</span>=
</div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
<span style=3D"margin:0px"><br>
</span></div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
<span style=3D"margin:0px">From [5],=C2=A0Ubuntu 21.10 and Fedora 35 has th=
e issue</span></div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
<br>
</div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
[1]=C2=A0<a href=3D"https://github.com/moby/moby/issues/42680" rel=3D"noope=
ner noreferrer" style=3D"margin:0px" target=3D"_blank">https://github.com/m=
oby/moby/issues/42680</a><br>
</div>
<div style=3D"margin:0px;font-size:15px;color:rgb(32,31,30);background-colo=
r:rgb(255,255,255)">
<div style=3D"margin:16px 0px;max-width:800px;min-width:424px">
<table style=3D"width:800px;border-radius:2px;padding:12px 36px 12px 12px;b=
order:1px solid rgb(200,200,200)">
<tbody>
<tr valign=3D"top" style=3D"border-spacing:0px">
<td>
<div style=3D"margin:0px 12px 0px 0px;height:120px;overflow:hidden"><a href=
=3D"https://github.com/moby/moby/issues/42680" rel=3D"noopener noreferrer" =
style=3D"margin:0px" target=3D"_blank"><img width=3D"240" height=3D"120" st=
yle=3D"margin: 0px; display: block;" src=3D"https://opengraph.githubassets.=
com/a41091aebf5cd0f5794a29a43ef7a6208fa5df0cd2824ada79ffc1b7fb467028/moby/m=
oby/issues/42680"></a></div>
</td>
<td style=3D"width:488px">
<div style=3D"margin:0px 8px 12px 0px;font-weight:300;font-size:21px;font-f=
amily:wf_segoe-ui_light,&quot;Segoe UI Light&quot;,&quot;Segoe WP Light&quo=
t;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif">
<a href=3D"https://github.com/moby/moby/issues/42680" rel=3D"noopener noref=
errer" style=3D"margin:0px" target=3D"_blank">seccomp filter breaks latest =
glibc (in fedora rawhide) by blocking clone3 with EPERM =C2=B7 Issue #42680
 =C2=B7 moby/moby =C2=B7 GitHub</a></div>
<div style=3D"margin:0px 8px 12px 0px;font-size:14px;font-family:wf_segoe-u=
i_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;=
color:rgb(102,102,102);overflow:hidden;max-height:100px">
Client: Version: 20.10.7 API version: 1.41 Go version: go1.16.6 Git commit:=
 f0df350 Built: Mon Jul 26 16:34:29 2021 OS/Arch: linux/amd64 Context: defa=
ult Experimental ...</div>
<div style=3D"margin:0px;font-size:14px;font-family:wf_segoe-ui_normal,&quo=
t;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;color:rgb(166=
,166,166)">
<a href=3D"http://github.com" target=3D"_blank">github.com</a></div>
</td>
</tr>
</tbody>
</table>
<div title=3D"Remove link preview" style=3D"margin:0px"><i>=EE=9C=91</i></d=
iv>
</div>
</div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
[2]=C2=A0<a href=3D"https://github.com/moby/moby/commit/6835d15f5523063f0a0=
4a86d4810a637c6010d62" rel=3D"noopener noreferrer" style=3D"margin:0px" tar=
get=3D"_blank">https://github.com/moby/moby/commit/6835d15f5523063f0a04a86d=
4810a637c6010d62</a></div>
<div style=3D"margin:0px;font-size:15px;color:rgb(32,31,30);background-colo=
r:rgb(255,255,255)">
<div style=3D"margin:16px 0px;max-width:800px;min-width:424px">
<table style=3D"width:800px;border-radius:2px;padding:12px 36px 12px 12px;b=
order:1px solid rgb(200,200,200)">
<tbody>
<tr valign=3D"top" style=3D"border-spacing:0px">
<td>
<div style=3D"margin:0px 12px 0px 0px;height:120px;overflow:hidden"><a href=
=3D"https://github.com/moby/moby/commit/6835d15f5523063f0a04a86d4810a637c60=
10d62" rel=3D"noopener noreferrer" style=3D"margin:0px" target=3D"_blank"><=
img width=3D"240" height=3D"120" style=3D"margin: 0px; display: block;" src=
=3D"https://opengraph.githubassets.com/232bea6d1440bb915cda2ac46a719e5ee82b=
3efe10f8d273c2e772d9c12759ad/moby/moby/commit/6835d15f5523063f0a04a86d4810a=
637c6010d62"></a></div>
</td>
<td style=3D"width:488px">
<div style=3D"margin:0px 8px 12px 0px;font-weight:300;font-size:21px;font-f=
amily:wf_segoe-ui_light,&quot;Segoe UI Light&quot;,&quot;Segoe WP Light&quo=
t;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif">
<a href=3D"https://github.com/moby/moby/commit/6835d15f5523063f0a04a86d4810=
a637c6010d62" rel=3D"noopener noreferrer" style=3D"margin:0px" target=3D"_b=
lank">[20.10] update containerd binary to v1.4.10 =C2=B7 moby/moby@6835d15<=
/a></div>
<div style=3D"margin:0px 8px 12px 0px;font-size:14px;font-family:wf_segoe-u=
i_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;=
color:rgb(102,102,102);overflow:hidden;max-height:100px">
- Update runc to v1.0.2 - Update hcsshim to v0.8.21 - Support &amp;quot;clo=
ne3&amp;quot; in default seccomp profile - Fix panic in metadata content wr=
iter on copy error Signed-off-by: Sebastiaan van Stijn...</div>
<div style=3D"margin:0px;font-size:14px;font-family:wf_segoe-ui_normal,&quo=
t;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;color:rgb(166=
,166,166)">
<a href=3D"http://github.com" target=3D"_blank">github.com</a></div>
</td>
</tr>
</tbody>
</table>
<div title=3D"Remove link preview" style=3D"margin:0px"><i>=EE=9C=91</i></d=
iv>
</div>
</div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
<br>
</div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
[3]=C2=A0<a href=3D"https://docs.docker.com/engine/release-notes/#201010" r=
el=3D"noopener noreferrer" style=3D"margin:0px" target=3D"_blank">https://d=
ocs.docker.com/engine/release-notes/#201010</a></div>
<div style=3D"margin:0px;font-size:15px;color:rgb(32,31,30);background-colo=
r:rgb(255,255,255)">
<div style=3D"margin:16px 0px;max-width:800px;min-width:424px">
<table style=3D"width:800px;border-radius:2px;padding:12px 36px 12px 12px;b=
order:1px solid rgb(200,200,200)">
<tbody>
<tr valign=3D"top" style=3D"border-spacing:0px">
<td style=3D"width:744px">
<div style=3D"margin:0px 8px 12px 0px;font-weight:300;font-size:21px;font-f=
amily:wf_segoe-ui_light,&quot;Segoe UI Light&quot;,&quot;Segoe WP Light&quo=
t;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif">
<a href=3D"https://docs.docker.com/engine/release-notes/#201010" rel=3D"noo=
pener noreferrer" style=3D"margin:0px" target=3D"_blank">Docker Engine rele=
ase notes - Docker Documentation</a></div>
<div style=3D"margin:0px 8px 12px 0px;font-size:14px;font-family:wf_segoe-u=
i_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;=
color:rgb(102,102,102);overflow:hidden;max-height:100px">
Docker Engine release notes. This document describes the latest changes, ad=
ditions, known issues, and fixes for Docker Engine. Note: The client and co=
ntainer runtime are now in separate packages from the daemon in Docker Engi=
ne 18.09. Users should install and
 update all three packages at the same time to get the latest patch release=
s.</div>
<div style=3D"margin:0px;font-size:14px;font-family:wf_segoe-ui_normal,&quo=
t;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;color:rgb(166=
,166,166)">
<a href=3D"http://docs.docker.com" target=3D"_blank">docs.docker.com</a></d=
iv>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br style=3D"color:rgb(32,31,30);font-size:15px;background-color:rgb(255,25=
5,255)">
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
<br>
</div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
[4]=C2=A0<a href=3D"https://bugs.launchpad.net/ubuntu/+source/docker.io/+bu=
g/1948361" rel=3D"noopener noreferrer" style=3D"margin:0px" target=3D"_blan=
k">https://bugs.launchpad.net/ubuntu/+source/docker.io/+bug/1948361</a></di=
v>
<div style=3D"margin:0px;font-size:15px;color:rgb(32,31,30);background-colo=
r:rgb(255,255,255)">
<div style=3D"margin:16px 0px;max-width:800px;min-width:424px">
<table style=3D"width:800px;border-radius:2px;padding:12px 36px 12px 12px;b=
order:1px solid rgb(200,200,200)">
<tbody>
<tr valign=3D"top" style=3D"border-spacing:0px">
<td style=3D"width:744px">
<div style=3D"margin:0px 8px 12px 0px;font-weight:300;font-size:21px;font-f=
amily:wf_segoe-ui_light,&quot;Segoe UI Light&quot;,&quot;Segoe WP Light&quo=
t;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif">
<a href=3D"https://bugs.launchpad.net/ubuntu/+source/docker.io/+bug/1948361=
" rel=3D"noopener noreferrer" style=3D"margin:0px" target=3D"_blank">Bug #1=
948361 =E2=80=9Cdocker.io - error adding seccomp filter rule for s... : Bug=
s :
 docker.io package : Ubuntu</a></div>
<div style=3D"margin:0px 8px 12px 0px;font-size:14px;font-family:wf_segoe-u=
i_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;=
color:rgb(102,102,102);overflow:hidden;max-height:100px">
Encountered the following error using the <a href=3D"http://docker.io" targ=
et=3D"_blank">docker.io</a> package in focal-proposed running the autotest-=
client-test/ubuntu_performance_deep_learning test. &quot;docker: Error resp=
onse from daemon: failed to create shim: OCI runtime create failed: contain=
er_linux.go:380:
 starting container process caused: error adding seccomp filter rule for sy=
scall clone3: permission denied: unknown.&quot; This test essentially pulls=
 down a nvidia tensorflow docker container, runs the container and triggers=
 the preloaded ...</div>
<div style=3D"margin:0px;font-size:14px;font-family:wf_segoe-ui_normal,&quo=
t;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;color:rgb(166=
,166,166)">
<a href=3D"http://bugs.launchpad.net" target=3D"_blank">bugs.launchpad.net<=
/a></div>
</td>
</tr>
</tbody>
</table>
<div title=3D"Remove link preview" style=3D"margin:0px"><i>=EE=9C=91</i></d=
iv>
</div>
</div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
<br>
</div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5,255,255)">
[5]=C2=A0<a href=3D"https://pascalroeleven.nl/2021/09/09/ubuntu-21-10-and-f=
edora-35-in-docker/" rel=3D"noopener noreferrer" style=3D"margin:0px" targe=
t=3D"_blank">https://pascalroeleven.nl/2021/09/09/ubuntu-21-10-and-fedora-3=
5-in-docker/</a></div>
<div style=3D"margin:0px;font-size:15px;color:rgb(32,31,30);background-colo=
r:rgb(255,255,255)">
<div style=3D"margin:16px 0px;max-width:800px;min-width:424px">
<table style=3D"width:800px;border-radius:2px;padding:12px 36px 12px 12px;b=
order:1px solid rgb(200,200,200)">
<tbody>
<tr valign=3D"top" style=3D"border-spacing:0px">
<td style=3D"width:744px">
<div style=3D"margin:0px 8px 12px 0px;font-weight:300;font-size:21px;font-f=
amily:wf_segoe-ui_light,&quot;Segoe UI Light&quot;,&quot;Segoe WP Light&quo=
t;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif">
<a href=3D"https://pascalroeleven.nl/2021/09/09/ubuntu-21-10-and-fedora-35-=
in-docker/" rel=3D"noopener noreferrer" style=3D"margin:0px" target=3D"_bla=
nk">Ubuntu 21.10 and Fedora 35 in Docker =E2=80=93 Pascal Roeleven</a></div=
>
<div style=3D"margin:0px 8px 12px 0px;font-size:14px;font-family:wf_segoe-u=
i_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;=
color:rgb(102,102,102);overflow:hidden;max-height:100px">
Here I am, back again with another post which I think the internet needs. I=
t took me days to figure it out and I can=E2=80=99t imagine there aren=E2=
=80=99t more people who are running into the same issue.</div>
<div style=3D"margin:0px;font-size:14px;font-family:wf_segoe-ui_normal,&quo=
t;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;color:rgb(166=
,166,166)">
<a href=3D"http://pascalroeleven.nl" target=3D"_blank">pascalroeleven.nl</a=
></div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br style=3D"color:rgb(32,31,30);font-size:15px;background-color:rgb(255,25=
5,255)">
<span style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(2=
55,255,255)">//Hongxu</span><br>
</div>
<div id=3D"gmail-m_-7535576878203681381appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_-7535576878203681381divRplyFwdMsg" dir=3D"ltr"><font fac=
e=3D"Calibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>Fro=
m:</b> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
<b>Sent:</b> Wednesday, February 16, 2022 12:08 PM<br>
<b>To:</b> Jia, Hongxu &lt;<a href=3D"mailto:Hongxu.Jia@windriver.com" targ=
et=3D"_blank">Hongxu.Jia@windriver.com</a>&gt;<br>
<b>Cc:</b> Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;; <a h=
ref=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">o=
penembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembed=
ded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.=
openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)</=
font>
<div>=C2=A0</div>
</div>
<div>
<p></p>
<div style=3D"border:1pt solid rgb(156,101,0);padding:2pt">
<p style=3D"line-height:12pt;background:rgb(255,235,156)"><b><span style=3D=
"font-size:10pt;color:rgb(156,101,0)"></span></b><span style=3D"font-size:1=
0pt;color:red">[Please note: This e-mail is from an EXTERNAL e-mail address=
]</span></p>
</div>
<div>
<div><br>
</div>
<div><br>
<div>
<div dir=3D"ltr">On Tue, Feb 15, 2022 at 6:28 PM Jia, Hongxu &lt;<a href=3D=
"mailto:Hongxu.Jia@windriver.com" target=3D"_blank">Hongxu.Jia@windriver.co=
m</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi khem,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Upstream glibc reject it because the latest docker has supported it[1], and=
 upstream glibc does not backward compatibility with old docker[2]</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
In order to build Yocto with uninative in old docker, we need this local pa=
tch</div>
</div>
</blockquote>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">How old is the docker and I assume</div>
<div dir=3D"auto">It=E2=80=99s some distribution needing it ?=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div dir=3D"ltr">
<div dir=3D"auto" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;f=
ont-size:12pt;color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
[1]=C2=A0<a href=3D"https://urldefense.com/v3/__https://github.com/moby/mob=
y/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594__;!!AjveYdw8EvQ!JrdILWjxf=
DiWHnl5n9iunsdZlqM0OsXFKtRci3uAgclNV9L6va0Ic-5IjAs7u16jFNv8$" id=3D"gmail-m=
_-7535576878203681381x_m_7849487073109687248LPlnkOWALinkPreview" style=3D"f=
ont-family:Calibri,Arial,Helvetica,sans-serif" target=3D"_blank">https://gi=
thub.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594</a></div=
>
<div>
<div id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248LPBorder_GTaH=
R0cHM6Ly9naXRodWIuY29tL21vYnkvbW9ieS9jb21taXQvOWY2YjU2MmRkMTJlZjdiMWY5ZTJmO=
GU2ZjJhYjY0Nzc3OTBhNjU5NA.." style=3D"width:100%;margin-top:16px;margin-bot=
tom:16px;max-width:800px;min-width:424px">
<table id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248LPContainer=
910426" role=3D"presentation" style=3D"padding:12px 36px 12px 12px;width:10=
0%;border:1px solid rgb(200,200,200);border-radius:2px">
<tbody>
<tr valign=3D"top" style=3D"border-spacing:0px">
<td>
<div id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248LPImageContai=
ner910426" style=3D"margin-right:12px;height:120px;overflow:hidden;width:24=
0px">
<a id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248LPImageAnchor91=
0426" href=3D"https://urldefense.com/v3/__https://github.com/moby/moby/comm=
it/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594__;!!AjveYdw8EvQ!JrdILWjxfDiWHnl=
5n9iunsdZlqM0OsXFKtRci3uAgclNV9L6va0Ic-5IjAs7u16jFNv8$" target=3D"_blank"><=
img id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248LPThumbnailIma=
geId910426" alt=3D"" height=3D"120" width=3D"240" style=3D"display: block;"=
></a></div>
</td>
<td style=3D"width:100%">
<div id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248LPTitle910426=
" style=3D"font-size:21px;font-weight:300;margin-right:8px;font-family:wf_s=
egoe-ui_light,&quot;Segoe UI Light&quot;,&quot;Segoe WP Light&quot;,&quot;S=
egoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;margin-bottom:12=
px">
<a id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248LPUrlAnchor9104=
26" href=3D"https://urldefense.com/v3/__https://github.com/moby/moby/commit=
/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594__;!!AjveYdw8EvQ!JrdILWjxfDiWHnl5n=
9iunsdZlqM0OsXFKtRci3uAgclNV9L6va0Ic-5IjAs7u16jFNv8$" style=3D"text-decorat=
ion:none;font-family:wf_segoe-ui_light,&quot;Segoe UI Light&quot;,&quot;Seg=
oe WP Light&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sa=
ns-serif" target=3D"_blank">seccomp:
 add support for &quot;clone3&quot; syscall in default policy =C2=B7 moby/m=
oby@9f6b562</a></div>
<div id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248LPDescription=
910426" style=3D"font-size:14px;max-height:100px;font-family:wf_segoe-ui_no=
rmal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;marg=
in-bottom:12px;margin-right:8px;overflow:hidden;color:rgb(102,102,102)">
If no seccomp policy is requested, then the built-in default policy in dock=
erd applies. This has no rule for &amp;quot;clone3&amp;quot; defined, nor a=
ny default errno defined. So when runc receives the con...</div>
<div id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248LPMetadata910=
426" style=3D"font-size:14px;font-weight:400;font-family:wf_segoe-ui_normal=
,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;color:rg=
b(166,166,166)">
<a href=3D"https://urldefense.com/v3/__http://github.com__;!!AjveYdw8EvQ!Jr=
dILWjxfDiWHnl5n9iunsdZlqM0OsXFKtRci3uAgclNV9L6va0Ic-5IjAs7u_GA6nFS$" style=
=3D"font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot=
;,Tahoma,Arial,sans-serif" target=3D"_blank">github.com</a></div>
</td>
</tr>
</tbody>
</table>
<div id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248LPCloseButton=
Container910426" title=3D"Remove link preview" role=3D"button">
<i aria-hidden=3D"true" id=3D"gmail-m_-7535576878203681381x_m_7849487073109=
687248LPCloseButton910426">=EE=9C=91</i></div>
</div>
</div>
<br>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
[2]<a href=3D"https://urldefense.com/v3/__https://sourceware.org/pipermail/=
libc-alpha/2021-August/130590.html__;!!AjveYdw8EvQ!JrdILWjxfDiWHnl5n9iunsdZ=
lqM0OsXFKtRci3uAgclNV9L6va0Ic-5IjAs7u54oSjL_$" id=3D"gmail-m_-7535576878203=
681381x_m_7849487073109687248LPlnk217615" style=3D"font-family:Calibri,Aria=
l,Helvetica,sans-serif" target=3D"_blank">https://sourceware.org/pipermail/=
libc-alpha/2021-August/130590.html</a><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
//Hongxu</div>
<div id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248appendonsend"=
></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_-7535576878203681381x_m_7849487073109687248divRplyFwdMsg=
" dir=3D"ltr"><font face=3D"Calibri, sans-serif" style=3D"font-size:11pt;fo=
nt-family:Calibri,sans-serif;color:rgb(0,0,0)"><b style=3D"font-family:Cali=
bri,sans-serif">From:</b> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" style=3D"font-family:Calibri,sans-serif" target=3D"_blank">raj.khem@gmail=
.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> Wednesday, February 1=
6, 2022 12:17 AM<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b> Jia, Hongxu &lt;<a href=
=3D"mailto:Hongxu.Jia@windriver.com" style=3D"font-family:Calibri,sans-seri=
f" target=3D"_blank">Hongxu.Jia@windriver.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Cc:</b> <a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" style=3D"font-family:Calibri,sans-seri=
f" target=3D"_blank">
openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembe=
dded-core@lists.openembedded.org" style=3D"font-family:Calibri,sans-serif" =
target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;; Richard=
 Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" style=3D"=
font-family:Calibri,sans-serif" target=3D"_blank">richard.purdie@linuxfound=
ation.org</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> Re: [OE-core] [PAT=
CH v3 1/3] glibc: Upgrade to 2.35 (RFC)</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2" style=3D"color:rgb(0,0,0)"><span style=3D"font-size:1=
1pt">
<div>[Please note: This e-mail is from an EXTERNAL e-mail address]</div>
</span></font></div>
</div>
<div dir=3D"ltr">
<div><font size=3D"2" style=3D"color:rgb(0,0,0)"><span style=3D"font-size:1=
1pt">
<div><br>
<br>
On Tue, Feb 15, 2022 at 12:25 AM Jia, Hongxu &lt;<a href=3D"mailto:Hongxu.J=
ia@windriver.com" target=3D"_blank">Hongxu.Jia@windriver.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; On 2/9/22 06:53, Khem Raj wrote:<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-fail=
ed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0001-f=
ix-create-thread-failed-in-unprivileged-process-BZ-.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 3283dd7ad8a..00000000000<br>
&gt; --- a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-u=
nprivileged-process-BZ-.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,79 +0,0 @@<br>
&gt; -From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" targ=
et=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; -Date: Sun, 29 Aug 2021 20:49:16 +0800<br>
&gt; -Subject: [PATCH] fix create thread failed in unprivileged process [BZ=
 #28287]<br>
&gt; -<br>
&gt; -Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 an=
d clone3]<br>
&gt; -applied, start a unprivileged container (docker run without --privile=
ged),<br>
&gt; -it creates a thread failed in container.<br>
&gt; -<br>
&gt; -In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defi=
ned.=C2=A0 If<br>
&gt; -__clone3 returns -1 with ENOSYS, fall back to clone or clone2.<br>
&gt; -<br>
&gt; -As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,<br>
&gt; -CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUT=
S<br>
&gt; -was specified by an unprivileged process (process without CAP_SYS_ADM=
IN)<br>
&gt; -<br>
&gt; -[1] <a href=3D"https://urldefense.com/v3/__https://man7.org/linux/man=
-pages/man2/clone3.2.html__;!!AjveYdw8EvQ!JrdILWjxfDiWHnl5n9iunsdZlqM0OsXFK=
tRci3uAgclNV9L6va0Ic-5IjAs7u3AyFyV8$" target=3D"_blank">
https://man7.org/linux/man-pages/man2/clone3.2.html</a><br>
&gt; -<br>
&gt; -So if __clone3 returns -1 with EPERM, fall back to clone or clone2 co=
uld<br>
&gt; -fix the issue. Here are the test steps:<br>
&gt; -<br>
&gt;<br>
&gt; Hi RP,<br>
&gt;<br>
&gt;<br>
&gt; I found this local patch was removed from glibc, we have to get it bac=
k and regenerate uninative to avoid the thread creation failure in=C2=A0 un=
privileged container<br>
&gt;<br>
<br>
I intentionally dropped it since upstream glibc will not accept this<br>
patch since its not glibc problem but<br>
rather container runtime problem. Can you investigate that path before<br>
we reapply it. Maintaining a rejected patch is last thing we want to<br>
do.<br>
<br>
&gt;<br>
&gt; //Hongxu<br>
</div>
</span></font></div>
</div>
</blockquote>
</div>
</div>
</div>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161771): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161771" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161771</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89009276/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89009276/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000082e13d05d81f314c--

