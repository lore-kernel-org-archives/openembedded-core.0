Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB625C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 22:10:06 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.65422.1656886189647423622
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 15:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UW480H1a;
 spf=pass (domain: gmail.com, ip: 209.85.217.45,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id o190so7455927vsc.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 15:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PyOr7Y5IhoNhLLKALvE70qCVoVD7rPi531aCvVMjOpM=;
        b=UW480H1aSBeUkmXe5J/4a+x89AbNkXkqvzJS3BYIy35Twj7wcI3R8G6GB/xt+XWymh
         7l7MBZvWyeqsQBod6rnJXBPxJ5JkahFu0D20SlTp7ed9e3sFThVMcYIuq8Qi3qlOageo
         bFWstfE0yiC+DJ/Y1JOIorg4GoXeBk1+/CW8LcERKucNkKpHZzZeDpA72eiBrOuRUj5D
         hAi+UZGlSwhhEv5hw5ZiDkoqSVPhQW82sBXiNX6thdCzytm+YyMIAIQyp9spQVKq0rqd
         N8iBQp7mdyNXKeq2ohzj+z8ElPh1UG0RYQ86stc1iT3bpBF2tIbvYXI4K+C4idkTq4QH
         boAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PyOr7Y5IhoNhLLKALvE70qCVoVD7rPi531aCvVMjOpM=;
        b=4w5OUACpwBrwtGTT1izYuqUqnW6v713Jl8Na6VbdOQJ964M4s3rfBOE6Y9nFwK4LE7
         MhW7quiB/6ia0VWWKyNwXh3cSNhbaW1muhEkcjO5EtzZvsmESOzqe7ydxZtrDmGn3TW6
         xFkteL7bd2hLdqkzbjRtz4KMUVs95qzDFjjqDesIgrFL8vfjrjfagq7gtwFWkvE7twH3
         EtYHnNpQqOP1aWUgRpMOm043pZ+WvmJDUEq7j6JKtEGUZk0STmYZ0yXiTTO/ogls3P0J
         VW3G4r8iSU764l4V1eQ1SqSNZ112tYXlu9AzGKN8uyCELTM7Ki0CT3VvYS4B5SaIxVv/
         Bxzw==
X-Gm-Message-State: AJIora/Tahkm4Cz4g8fEjz5J3Y0m82oN3rV1wCFvLznEGu/iJFPQgtV0
	7wuzATFZ4lXq1y1Q45j5E25vjYqDM9rPyqLEAIU=
X-Google-Smtp-Source: 
 AGRyM1sTBCSpxXZuVD1RrlaKoDbNpEkg0ck2op7QZtcU+L1hhqYbGECG3Kh4w5H3oFs71XT2edPEjShYfaGDEUUoceg=
X-Received: by 2002:a67:e3da:0:b0:356:ba54:fc28 with SMTP id
 k26-20020a67e3da000000b00356ba54fc28mr2290401vsm.77.1656886188655; Sun, 03
 Jul 2022 15:09:48 -0700 (PDT)
MIME-Version: 1.0
References: 
 <c751cf96c88840dec4b77930ffa0c805c50a7f7b.camel@linuxfoundation.org>
In-Reply-To: 
 <c751cf96c88840dec4b77930ffa0c805c50a7f7b.camel@linuxfoundation.org>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 3 Jul 2022 15:09:37 -0700
Message-ID: 
 <CACMJ4GZiVzK5zQtFfdjPujAgv8NK9rPMEE_efy+sEfn2P2fEgg@mail.gmail.com>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>, Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 22:10:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167591

On Sat, Jul 2, 2022 at 5:41 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi All,
>
> I tried enabling buildpaths in WARN_QA on the autobuilder. This in
> theory should have built cleanly but it didn't as we don't test all the
> autobuilder configurations for reproducibility. I think this proves the
> value in enabling it however before we can there are a handful of
> issues we need to fix:
>
> With oe-core (systemd enabled):
> stdio: WARNING: go-helloworld-0.1-r0 do_package_qa: QA Issue: File /usr/bin/go-helloworld in package go-helloworld contains reference to TMPDIR [buildpaths]
> stdio: WARNING: glibc-tests-2.35-r0 do_package_qa: QA Issue: File /usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-timer4-time64 in package glibc-tests contains reference to TMPDIR
> stdio: WARNING: systemd-1_251.2-r0 do_package_qa: QA Issue: File /usr/src/debug/systemd/1_251.2-r0/build/src/login/logind-gperf.c in package systemd-src contains reference to TMPDIR
>
> With docs enabled:
> stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buildpaths]
> stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpaths]
> stdio: WARNING: lib32-gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package lib32-gtk-doc contains reference to TMPDIR [buildpaths]
> stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> stdio: WARNING: gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package gtk-doc contains reference to TMPDIR [buildpaths]
>
> meta-virt:
> stdio: WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/libxenlight.a in package xen-tools-staticdev contains reference to TMPDIR [buildpaths]
> stdio: WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/src/debug/xen-tools/4.16+stableAUTOINC+f265444922-r0/git/tools/libs/light/dsdt_pvh.c in package xen-tools-src contains reference to TMPDIR [buildpaths]

I've just had a quick look at this - not with this kirkstone tree yet,
but this one repro's with master and current Xen. Apparently there was
some work on improving support for reproducible builds with the acpica
package and the iasl compiler but I don't know if it is supposed to be
able to handle this case? (CCing JPEW)

> stdio: WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/debug/usr/lib/xen/boot/xen-shim-syms in package xen-tools-dbg contains reference to TMPDIR [buildpaths]
> stdio: WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/xen/boot/xen-shim in package xen-tools-shim contains reference to TMPDIR [buildpaths]
> stdio: WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/libxenlight.so.4.16.0 in package xen-tools-libxenlight contains reference to TMPDIR [buildpaths]
>
> Help in resolving these would be much appreciated.

ack

Christopher

>
> I've further builds running to see if there are any further issues as
> the first build has issues with a fifo in psplash.
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167550): https://lists.openembedded.org/g/openembedded-core/message/167550
> Mute This Topic: https://lists.openembedded.org/mt/92128673/3619037
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [christopher.w.clark@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

