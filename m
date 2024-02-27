Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF631C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 09:29:09 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.8825.1709026122900061640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 01:28:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJyTsilS;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d269dc3575so36957741fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 01:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709026121; x=1709630921; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AY7OT3vBw8C3VzMDHTIvdZmmZPCEiTdmcQ/DTEns37E=;
        b=KJyTsilSQ4mCSooFIataUeYtXTYCwfr5qI8123EWuJDV/rEEoKrIU9st3OIGRC3qcS
         RannTyCjMmMAdXs6VvO9kla8oOJGgJk7gjXb+R9CCM0m1/HEneAf4+eAJt/DDucNLH9Z
         0QWmwRE4igItsBkYs7ulbAt16ATURnFjwBDTZ5zqumGcWxGfet+H826z20y2xzZPk0TW
         a8ss4iAJgpK76d615VoDiI+BO1C0Wkau9yh+Jm5H1ExEowNjN1ZzZ0RJkRFGAc78qWJ3
         tx3f1q35sDs98E4RD2RxscQ2/44wR3IGao/8cTTSQXyVRMlV68PIa1TjvEHsOeaGBzPK
         FaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709026121; x=1709630921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AY7OT3vBw8C3VzMDHTIvdZmmZPCEiTdmcQ/DTEns37E=;
        b=eW4gXyk5svuczMAxf9c6u31KiaBo44K0xFo0ZN0kfkL2LYQq4BtmGD2CvMjXjtMgjA
         MmfJIl4o0KKUfI7IoWfGx00x+S0f2iQQpnTpkWSfD2reaKJETZgm5JMajJU0+XRszZcA
         KlZdLaWAbrSuhhvPsQd99OQZCiFRVL6ms4sC5k+09uKVy2pDGp6+v8Abb4i8S0jYXtIa
         VN4Dtk+lkaS8bAWVEhdEhiEAhp1Az+id+Pm4Y9E7fh//SXoUP/2otuJKM+2ZyZTpDj2j
         kxUSAxanGOoUBT0s0ll1TGiGrIfmiVZ3UP8tgxTRTIw4+nvNX6MORPnryeStDdBU4dHi
         nNug==
X-Gm-Message-State: AOJu0YzhLErq3d6dVxLRbSSIpNZ17l02/63VmxHq/9YsmCQLraXR+Bpa
	iI7J9jCbYiyI5r8MwbKiD0lkpni5wPyfgej5hQ06Y/87oUcMzt22ZSj9RMYhH1CPdKGsWYcsRto
	OzFfn7KW5T3HCrIiW+2izIFzBTtA=
X-Google-Smtp-Source: AGHT+IHNjstvi5gwO36leQeHpmkI4QFFJCJXR1L1M2vDTs6xaEbkR2G5eFg5c0q9XFYbBTDe+gDp1qsmSgC+QLbUUe8=
X-Received: by 2002:a2e:809:0:b0:2d2:509c:6626 with SMTP id
 9-20020a2e0809000000b002d2509c6626mr2554642lji.21.1709026120706; Tue, 27 Feb
 2024 01:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20240227051155.2166683-1-changqing.li@windriver.com>
In-Reply-To: <20240227051155.2166683-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Feb 2024 10:28:29 +0100
Message-ID: <CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 09:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196246

The patch description doesn't match the patch content. The packaging
doesn't change for README items, and VOLATILE_LOG_DIR isn't checked
anywhere.

Also, don't tweak WATCHDOR_TIMEOUT block, it's not relevant, and hard
to tell if something changed there.

I would rather suggest packaging the needed README item into the same
package that references it from other files. What is beoding done with
sed and grep is *really* hard to understand.


Alex

On Tue, 27 Feb 2024 at 06:11, Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
> install README.logs under systemd doc dir.
>
> But for OE, systemd doc dir is splited into package systemd-doc, when it
> is not installed on the target, there will be an dead link:
> Eg:
> root@intel-x86-64:/var/log# ls -l README
> lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/systemd/README.logs
> root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
> ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file or directory
>
> First, package this link into systemd-doc to fix above issue.  Second,
> Source link path created by systemd is not correct when VOLATILE_LOG_DIR
> is true. Create the symlink using absolute path to cover both condition.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_255.1.bb | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
> index 9e09c89355..73ef0f01b2 100644
> --- a/meta/recipes-core/systemd/systemd_255.1.bb
> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
> @@ -382,10 +382,15 @@ do_install() {
>         # add a profile fragment to disable systemd pager with busybox less
>         install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh
>
> -    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
> -        sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
> -            ${D}/${sysconfdir}/systemd/system.conf
> -    fi
> +       if [ -n "${WATCHDOG_TIMEOUT}" ]; then
> +               sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
> +                       ${D}/${sysconfdir}/systemd/system.conf
> +       fi
> +
> +       if grep -q '^L /var/log/README' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf 2>/dev/null; then
> +               sed -i -e '/^L \/var\/log\/README/d' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf
> +               echo "L ${localstatedir}/log/README - - - - ${datadir}/doc/systemd/README.logs" > ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf
> +       fi
>  }
>
>  python populate_packages:prepend (){
> @@ -622,6 +627,8 @@ FILES:${PN}-udev-rules = "\
>                          ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
>  "
>
> +FILES:${PN}-doc  += "${nonarch_libdir}/tmpfiles.d/legacy-doc.conf"
> +
>  CONFFILES:${PN} = "${sysconfdir}/systemd/coredump.conf \
>         ${sysconfdir}/systemd/journald.conf \
>         ${sysconfdir}/systemd/logind.conf \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196242): https://lists.openembedded.org/g/openembedded-core/message/196242
> Mute This Topic: https://lists.openembedded.org/mt/104598170/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

