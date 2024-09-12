Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44980EED630
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 17:32:34 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.53925.1726162350410485871
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 10:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9gtSZRV;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5365aec6fc1so1480565e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726162348; x=1726767148; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h606rP4i4XExb3klHV4GZmz3tDrzZXVeDct6EhOh24=;
        b=R9gtSZRVu9KBQvbYzFKbx3lb51hBC1FtrxNtY86GwsxXlnZ4VtwP99dRoe15kkLmiH
         dBfbYwYG6XqW1BtBCAs6CW/Vnzj8nK3luR/kiTaOq19U6abIfAO6+CmthBsT7p5k9CSd
         NaFJXNCGqzNkIQnDwRhC8jUsoY4NOe2Z3J7EyDOmtuP2O56FHr8VvXf51ZKWe0fcIbgM
         ZpMhDUyoPbVURXSvsB/ySeY/uvxK5gp5qOxgmwOvRBXUIJZzTezDlrUDQS0YoWVncsbh
         iDZMvRchK8kEdP4p/ktM+Nq8nCt0r5AGC9Xf3NegB+a4e7qPiM3xfexAEBay7Ikglb9J
         OJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726162348; x=1726767148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h606rP4i4XExb3klHV4GZmz3tDrzZXVeDct6EhOh24=;
        b=xJ2bHFZKWpdhGTUCg8n6LfIn7o4HkiJNPxdNIdZWy0EiN/WlKKyLB5gjyBlv7Czoss
         ZaBWWdSbu6L+FGRHAXkqe9nSdl5VJiKyeCQsq/4AX4hfwlig3F/CrWfGEUL66m91GmjC
         g2/ctWohQMKRUgwyEQQpbvdWBL/t3tJvUmss4aeX12k2hldwksVqo4kuvkIyxs2njbn7
         5YTXqoUzR4QEfSvwKfgZy80fdJnfbQ/BKzhF/q3klfj6s0ivfZxQQUxdD/NOM6C2rDmC
         5xk+z2ogfmL76Jfcd6anpV1Gqy9d3JV4nPl+1F6e/vb6BhbapfwvKfFtrxvJbXCppwRX
         EqZg==
X-Gm-Message-State: AOJu0YyOvHuxkLkhUOer+YSbbPQVtK89y6Mpp+rHpmebue3lLqIKHbt6
	zLvSdRS5qS/8XCcU8/28g3Nc3UUcvyR39PRj8JBsCqJDRvdivmSH+TbGWzeRno8iztpnxUzvwB8
	AD9dLe+EliXGE0SHO+FU9tPJqVh0=
X-Google-Smtp-Source: AGHT+IHZ+zCRqrSEu9oPgucXr2P8gqH75c3dp6akjgIwJ2nBLnT9tYSmNFuN3uIjT9iRdfrW9z2/5WKA/EuyjKAblw8=
X-Received: by 2002:a05:6512:224f:b0:535:69ee:9717 with SMTP id
 2adb3069b0e04-53678fb7363mr2664210e87.3.1726162347576; Thu, 12 Sep 2024
 10:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240912165736.1531460-1-ross.burton@arm.com> <64B7E637-6165-4267-A45E-470A16DE53C1@arm.com>
 <CA+chaQf3yD3bLOihOAQC+wfzZpsJ5QJgOvcDiAG0YowuRobpGw@mail.gmail.com> <40EF6753-F47A-47AD-B93C-0D3DE7DD9FFD@arm.com>
In-Reply-To: <40EF6753-F47A-47AD-B93C-0D3DE7DD9FFD@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Sep 2024 19:32:16 +0200
Message-ID: <CA+chaQej=wshkpVid5hh=p9vkgoW2BgmT8=YrPOLBaWb3zQ97A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: check for working user namespaces
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 17:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204458

On Thu, Sep 12, 2024 at 7:28=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> By which do you mean the build failed gracefully, whereas previously it w=
ould have exploded?

Without existing TMPDIR it failed with just the error from sanity
check (as expected).

With existing TMPDIR (where sanity check was already executed before
your change) or without your change applied it fails with many
PermissionError exceptions.

I forgot to mention that I did another zlib-native build after
echo 0 > /proc/sys/kernel/apparmor_restrict_unprivileged_userns
and that didn't fail sanity check nor in build (as expected).

> > On 12 Sep 2024, at 18:22, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > Works as expected, the build failed :).
> >
> > openembedded-core/build$ bitbake -k zlib-native
> > ERROR: User namespaces are not usable by BitBake, possibly due to AppAr=
mor.
> > See https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-releas=
e-notes/39890#unprivileged-user-namespace-restrictions
> > for more information.
> >
> > The only issue might be that these checks are executed only once, so
> > if you have existing TMPDIR (where it was failing) then it will
> > continue failing with:
> >
> > ERROR: PermissionError: [Errno 1] Operation not permitted
> >
> > During handling of the above exception, another exception occurred:
> >
> > Traceback (most recent call last):
> >  File "/home/martin/work/bitbake/bin/bitbake-worker", line 278, in chil=
d
> >    bb.utils.disable_network(uid, gid)
> >  File "/home/martin/work/bitbake/lib/bb/utils.py", line 1696, in
> > disable_network
> >    with open("/proc/self/uid_map", "w") as f:
> > PermissionError: [Errno 1] Operation not permitted
> >
> > until TMPDIR is removed and sanity re-executed.
> >
> > On Thu, Sep 12, 2024 at 6:59=E2=80=AFPM Ross Burton via lists.openembed=
ded.org
> > <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >>
> >> Note that in its final form this isn=E2=80=99t had any testing on an U=
buntu machine, so testing would be appreciated if anyone has an Ubuntu 24.x=
 machine (not a container, need their kernel) with apparmor enabled.
> >>
> >> Thanks,
> >> Ross
> >>
> >>> On 12 Sep 2024, at 17:57, Ross Burton via lists.openembedded.org <ros=
s.burton=3Darm.com@lists.openembedded.org> wrote:
> >>>
> >>> If user namespaces are not available (typically because AppArmor is
> >>> blocking them), alert the user.
> >>>
> >>> We consider network isolation sufficiently important that this is a f=
atal
> >>> error, and the user will need to configure AppArmor to allow bitbake =
to
> >>> create a user namespace.
> >>>
> >>> [ YOCTO #15592 ]
> >>>
> >>> Signed-off-by: Ross Burton <ross.burton@arm.com>
> >>> ---
> >>> meta/classes-global/sanity.bbclass | 24 ++++++++++++++++++++++++
> >>> 1 file changed, 24 insertions(+)
> >>>
> >>> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global=
/sanity.bbclass
> >>> index 1d242f0f0a0..72dab0fea2b 100644
> >>> --- a/meta/classes-global/sanity.bbclass
> >>> +++ b/meta/classes-global/sanity.bbclass
> >>> @@ -475,6 +475,29 @@ def check_wsl(d):
> >>>            bb.warn("You are running bitbake under WSLv2, this works p=
roperly but you should optimize your VHDX file eventually to avoid running =
out of storage space")
> >>>    return None
> >>>
> >>> +def check_userns():
> >>> +    """
> >>> +    Check that user namespaces are functional, as they're used for n=
etwork isolation.
> >>> +    """
> >>> +
> >>> +    # There is a known failure case with AppAmrmor where the unshare=
() call
> >>> +    # succeeds (at which point the uid is nobody) but writing to the=
 uid_map
> >>> +    # fails (so the uid isn't reset back to the user's uid). We can =
detect this.
> >>> +    parentuid =3D os.getuid()
> >>> +    pid =3D os.fork()
> >>> +    if not pid:
> >>> +        try:
> >>> +            bb.utils.disable_network()
> >>> +        except:
> >>> +            pass
> >>> +        os._exit(parentuid !=3D os.getuid())
> >>> +
> >>> +    ret =3D os.waitpid(pid, 0)[1]
> >>> +    if ret:
> >>> +        bb.fatal("User namespaces are not usable by BitBake, possibl=
y due to AppArmor.\n"
> >>> +                 "See https://discourse.ubuntu.com/t/ubuntu-24-04-lt=
s-noble-numbat-release-notes/39890#unprivileged-user-namespace-restrictions=
 for more information.")
> >>> +
> >>> +
> >>> # Require at least gcc version 8.0
> >>> #
> >>> # This can be fixed on CentOS-7 with devtoolset-6+
> >>> @@ -641,6 +664,7 @@ def check_sanity_version_change(status, d):
> >>>    status.addresult(check_git_version(d))
> >>>    status.addresult(check_perl_modules(d))
> >>>    status.addresult(check_wsl(d))
> >>> +    status.addresult(check_userns())
> >>>
> >>>    missing =3D ""
> >>>
> >>> --
> >>> 2.34.1
> >>>
> >>>
> >>>
> >>>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#204450): https://lists.openembedded.org/g/openembe=
dded-core/message/204450
> >> Mute This Topic: https://lists.openembedded.org/mt/108416977/3617156
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[martin.jansa@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

