Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A964C43334
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 12:41:37 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.49775.1656765687890323731
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 05:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dm0daUXz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id b26so6814228wrc.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 05:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=vuEPWVKAduTd8ysy6+EoiiG6/U9VCRZJVT0cGNU37Vo=;
        b=dm0daUXzOYh4hYAxFoiHJ2iDuwlR52LyvYICFYLZrRMh1tdg3HTJC3DejipiU4J4zF
         DrPPXmEwjHjZQGqsx+ZOlvdlxcVjXQ1RlsqSIo4TdNsNyLmbg7enAmeFoyNSOU9fTK01
         fxyg0nZNuChZbbtqSV6i0mRWqPWX+RA/LGLdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=vuEPWVKAduTd8ysy6+EoiiG6/U9VCRZJVT0cGNU37Vo=;
        b=uuV85kGhSPFpBUD9IaPf/8IX2dXLjUReambSsHUJfcHFRq5APOhyQK1OCFiNFHLyD/
         FXoFhT9D2QAT9NfonOILc+JTwuoBGpeNadtEyvqqIP5feQvDGpByBYMgGL6/JwQJfkkt
         isAEq5QoqBImkwbPtkEJdCvWWNbVWK5kgcw03zeVctEPFZwsJfS4V039x2l+t1VGujS4
         JRzIIlh57AOG5GhA3xRwmUIH9LmRTKk6ie7k7BwdxnrjtpsLqe0+YwjoHjB1VRy83uHv
         +TlzfxMQlnKz0F2s3MlwfMtd3QLIvMycGho3TMM9+hHxhfUMH0CEyrn6Muu6oDMuBXsZ
         ZFKg==
X-Gm-Message-State: AJIora+UomwS55DxSUnXT7x7FJPUJ/ZuKQlkwW7cJQDfeYtkiNI19UpQ
	VIAzDLgVIRh3reWLVlSg4lkYiI5R3uvpFg==
X-Google-Smtp-Source: 
 AGRyM1t9XM47FjG+2+AWb0aepwMzD73xgGgW+T0pQGCNHfpJZxHg/yZSXsgtFxdQNEl6QbcicN8vaA==
X-Received: by 2002:a05:6000:1542:b0:21d:28c0:eb43 with SMTP id
 2-20020a056000154200b0021d28c0eb43mr18375978wry.622.1656765685339;
        Sat, 02 Jul 2022 05:41:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3569:71aa:bd43:a6d5?
 ([2001:8b0:aba:5f3c:3569:71aa:bd43:a6d5])
        by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b0039c747a1e8fsm9972859wmp.7.2022.07.02.05.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 05:41:24 -0700 (PDT)
Message-ID: 
 <c751cf96c88840dec4b77930ffa0c805c50a7f7b.camel@linuxfoundation.org>
Subject: Build paths/reproduibility issues in master - help requested
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 02 Jul 2022 13:41:24 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Jul 2022 12:41:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167550

Hi All,

I tried enabling buildpaths in WARN_QA on the autobuilder. This in
theory should have built cleanly but it didn't as we don't test all the
autobuilder configurations for reproducibility. I think this proves the
value in enabling it however before we can there are a handful of
issues we need to fix:

With oe-core (systemd enabled):
stdio: WARNING: go-helloworld-0.1-r0 do_package_qa: QA Issue: File /usr/bin=
/go-helloworld in package go-helloworld contains reference to TMPDIR [build=
paths]
stdio: WARNING: glibc-tests-2.35-r0 do_package_qa: QA Issue: File /usr/lib/=
glibc-tests/ptest/tests/glibc-ptest/tst-timer4-time64 in package glibc-test=
s contains reference to TMPDIR
stdio: WARNING: systemd-1_251.2-r0 do_package_qa: QA Issue: File /usr/src/d=
ebug/systemd/1_251.2-r0/build/src/login/logind-gperf.c in package systemd-s=
rc contains reference to TMPDIR

With docs enabled:
stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin=
/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [buildp=
aths]
stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib64/pk=
gconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpaths]
stdio: WARNING: lib32-gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/=
share/gtk-doc/python/gtkdoc/config_data.py in package lib32-gtk-doc contain=
s reference to TMPDIR [buildpaths]
stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/vapig=
en-wrapper in package vala contains reference to TMPDIR [buildpaths]
stdio: WARNING: gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/share/=
gtk-doc/python/gtkdoc/config_data.py in package gtk-doc contains reference =
to TMPDIR [buildpaths]

meta-virt:
stdio: WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: Q=
A Issue: File /usr/lib/libxenlight.a in package xen-tools-staticdev contain=
s reference to TMPDIR [buildpaths]
stdio: WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: Q=
A Issue: File /usr/src/debug/xen-tools/4.16+stableAUTOINC+f265444922-r0/git=
/tools/libs/light/dsdt_pvh.c in package xen-tools-src contains reference to=
 TMPDIR [buildpaths]
stdio: WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: Q=
A Issue: File /usr/lib/debug/usr/lib/xen/boot/xen-shim-syms in package xen-=
tools-dbg contains reference to TMPDIR [buildpaths]
stdio: WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: Q=
A Issue: File /usr/lib/xen/boot/xen-shim in package xen-tools-shim contains=
 reference to TMPDIR [buildpaths]
stdio: WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: Q=
A Issue: File /usr/lib/libxenlight.so.4.16.0 in package xen-tools-libxenlig=
ht contains reference to TMPDIR [buildpaths]

Help in resolving these would be much appreciated.

I've further builds running to see if there are any further issues as
the first build has issues with a fifo in psplash.

Cheers,

Richard

