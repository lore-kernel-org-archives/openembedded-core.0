Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B91C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 11:08:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6279.1657278470364871096
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 04:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AlTv516k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id b26so30088678wrc.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 04:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=7I2LEry6j4LTIm5nOk8g/taM7rOchR3SFWOtc/+5Lro=;
        b=AlTv516k7QAXfyVZF+wM6y5cWsYhopkXE1uTHhAxF4/4lnyVQX6+Vt3Gh4VGnhtxFq
         ASgo9LVnsFfqnxDHEZBhuDOBI2msTTFIJNb1ncF28Jq2CRwEChy2KMyiddr7ENtPEKz2
         2aIZhJMEtju7i5/wh11jxCc4a/2HVNuzjC9ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=7I2LEry6j4LTIm5nOk8g/taM7rOchR3SFWOtc/+5Lro=;
        b=2YpYF5wjih6X5ftxzRc2PCizWJVNMjp2jcrdFT7f+HQfil2UjoVoUBaXPjN3uTm++f
         ZMuavO3kYSsib4FItN9qnoPPqEV7jhP8PGqhVrsCkMAE04uQSIh2UPvZqF/R+Hg3clby
         nTuSjE0oCquIloJgRZwFWcDy1+NTdq0r43FucochQyFUmPQYp+OzENMt3rc5QFUEZpUO
         KvuwqBCkztaRhSTP4vSjFQpalWT7rfe57a3dTN3kXDbLqKfUU+ZPRJ36eOY0n3A5JMJU
         SRHMlp6ZzTUzd84PdiqN7OjwdVQogVRrJdwLb6D9/aoN1OLkXuGNQYx+KVW4HRrmGuh2
         rrGQ==
X-Gm-Message-State: AJIora/fdpjeeByf6ft+qqrSBOiMHMhzqjrNuUEQSEtZnj1MapnYro5G
	GMc5eDxIsts/mSVfZ+ufV8q/GysQvO8PSQ==
X-Google-Smtp-Source: 
 AGRyM1td3lNuUumTK/kr0Oy7YeTfqhUxhU74vO54iOTELSNsUEQASj14AF4CkMCvu7A1dw6QPS1M0g==
X-Received: by 2002:adf:ce0c:0:b0:21d:929e:1522 with SMTP id
 p12-20020adfce0c000000b0021d929e1522mr886952wrn.126.1657278468422;
        Fri, 08 Jul 2022 04:07:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d855:200b:b1b2:5d8c?
 ([2001:8b0:aba:5f3c:d855:200b:b1b2:5d8c])
        by smtp.gmail.com with ESMTPSA id
 x1-20020adfdcc1000000b0021d63fe0f03sm16540885wrm.12.2022.07.08.04.07.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:07:47 -0700 (PDT)
Message-ID: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
Subject: Reproducible build issues with buildpaths - take 2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jul 2022 12:07:47 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 11:08:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167819

Hi All,

We've made good progress and I appreciate the help from people. I ran a
fresh build on the autobuilder and I forced it to rerun the QA checks
for all recipes. The tricky bit about warnings is that they don't show
up for objects from sstate and the addition of the buildpaths QA check
doesn't cause the checks to rerun. Due to that a few more previsouly
unseen issues cropped up.

The list of issues now stands are:

qemuppc:
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5428
WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/5.=
15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.cmd in packa=
ge kernel-devsrc contains reference to TMPDIR [buildpaths]

meta-arm:
https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2629
stdio: WARNING: perl-5.36.0-r0 do_package_qa: QA Issue: File /usr/lib/perl/=
ptest/dist/threads-shared/Makefile.old in package perl-ptest contains refer=
ence to TMPDIR

meta-gplv2:
https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/5460
WARNING: bash-3.2.57-r0 do_package_qa: QA Issue: File /usr/bin/bashbug in p=
ackage bash contains reference to TMPDIR [buildpaths]
WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/tar/1.17-=
r3/build/lib/string.h in package tar-src contains reference to TMPDIR
WARNING: diffutils-2.8.1-r7.0 do_package_qa: QA Issue: File /usr/bin/diff.d=
iffutils in package diffutils contains reference to TMPDIR [buildpaths]
WARNING: findutils-4.2.31-r4 do_package_qa: QA Issue: File /usr/bin/updated=
b in package findutils contains reference to TMPDIR [buildpaths]
WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.=
d/iso9660 in package mc-helpers contains reference to TMPDIR [buildpaths]

There is a proposal on the oe-architecture list about simply disabling
this layer going forward. The increased number of issues reinforces my
view on that.

meta-virt:
https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/292
WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue=
: File /usr/lib/xen/boot/xen-shim in package xen-tools-shim contains refere=
nce to TMPDIR [buildpaths]
WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue=
: File /usr/src/debug/xen-tools/4.16+stableAUTOINC+f265444922-r0/git/tools/=
libs/light/dsdt_pvh.c in package xen-tools-src contains reference to TMPDIR=
 [buildpaths]
WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue=
: File /usr/lib/libxenlight.so.4.16.0 in package xen-tools-libxenlight cont=
ains reference to TMPDIR [buildpaths]
WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue=
: File /usr/lib/libxenlight.a in package xen-tools-staticdev contains refer=
ence to TMPDIR [buildpaths]
WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue=
: File /usr/lib/debug/usr/lib/xen/boot/xen-shim-syms in package xen-tools-d=
bg contains reference to TMPDIR [buildpaths]

There is also still the lttng-modules issue if we enable .debug
checking. I disabled that for these tests to reduce the noise.

Cheers,

Richard


