Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A5DC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 16:40:04 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.8546.1657125597818309679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XZIvxXUJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id f190so9157815wma.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=6w6VeVBnFbeXllPEbG5XA0UFkv1Dh0Hv0gBkBRY9I/8=;
        b=XZIvxXUJF0yDVbzYLfFBqmjzMdDy+rYQ/zP8i0SbS6dMhl6MOuWSwKVv69Z42FhC51
         MXzhslx+NDIE2thuJ7mmIuEKu7WRh78ojIcSwURHi67h4atlpqS/5+PCTW/Kxxs33XOP
         vLS1nHGs6vqdXqQf0J2GFO7BVEpJosR1186Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=6w6VeVBnFbeXllPEbG5XA0UFkv1Dh0Hv0gBkBRY9I/8=;
        b=hdzWR8kE1CXOWorOLp+RvgwDBPa+9m/gudwjM8aJanWJTg32zyO8MYZAzXjBGxP0W8
         eWkJYo5aSu7rnTYa5ePqHmWtPMldd7sI3j6lr+JDxUOCKkmJPh3B84vb+f35+1xYsu4O
         j0PP6ITgcnz09N9jHQYUEafyszebpMcYV4U3r9STpmkJ5TgIKMqGNloEtBkb38EpFF/7
         Q/6Y79tDIjWniWpkb36Y62L3OofJyj4srluilr2w8xX/CNMIDCeemlj7HKZrlqK9+u6K
         k6BVmT306+dQEnGWEUTbYjEKhK67yDrEEKA0kEFeBYwochLJzvM8pqm07fnVK0mkyY3+
         P+Og==
X-Gm-Message-State: AJIora8n1aAebhKdKu/EaP5WqHbv0DGGWw4DYr49TQ6J1Gy4Huk7sezu
	FK29JjyN/dGG5gTWdvTg2GeAzeic96uJRg==
X-Google-Smtp-Source: 
 AGRyM1vl4Bqby0AWIEpozLiU46hTtOPzNI1OhroxJtjGZKoxczRDOh9175QrowJEMN4SYYk2VBgR2Q==
X-Received: by 2002:a05:600c:19c8:b0:3a1:7399:861d with SMTP id
 u8-20020a05600c19c800b003a17399861dmr40604835wmq.170.1657125595901;
        Wed, 06 Jul 2022 09:39:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8?
 ([2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8])
        by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b003a0502c620dsm12991143wmq.44.2022.07.06.09.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:39:55 -0700 (PDT)
Message-ID: 
 <5b8c809573b0ecb0039333edcbeb1936b40db564.camel@linuxfoundation.org>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 06 Jul 2022 17:39:54 +0100
In-Reply-To: <16FEBD90A08F81A5.1980@lists.openembedded.org>
References: <16FE039DA287E43E.1980@lists.openembedded.org>
	 <16FEA3B3CA900B93.1980@lists.openembedded.org>
	 <16FEBD90A08F81A5.1980@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 16:40:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167736

On Mon, 2022-07-04 at 22:28 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2022-07-04 at 14:34 +0100, Richard Purdie via
> > > With docs enabled:
> > > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /u=
sr/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [=
buildpaths]
> > > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/li=
b64/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [build=
paths]
> > > stdio: WARNING: lib32-gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File=
 /usr/share/gtk-doc/python/gtkdoc/config_data.py in package lib32-gtk-doc c=
ontains reference to TMPDIR [buildpaths]
> > > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin=
/vapigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> > > stdio: WARNING: gtk-doc-1.33.2-r0 do_package_qa: QA Issue: File /usr/=
share/gtk-doc/python/gtkdoc/config_data.py in package gtk-doc contains refe=
rence to TMPDIR [buildpaths]

I think I have fixes out for rpm (via lua) and vala. gtk-doc remains.

> > These still remain. In addition we also have:
> >=20
> > A musl ltp issue:
> > stdio: WARNING: ltp-20220527-r0 do_package_qa: QA Issue: File /opt/ltp/=
testcases/open_posix_testsuite/logfile.conformance-all in package ltp conta=
ins reference to TMPDIR [buildpaths]

Still remaining.

> >=20
> > Some multilib issues:
> > stdio: WARNING: lib32-vala-0.56.1-r0 do_package_qa: QA Issue: File /usr=
/bin/vapigen-wrapper in package lib32-vala contains reference to TMPDIR [bu=
ildpaths]
> > stdio: WARNING: vala-0.56.1-r0 do_package_qa: QA Issue: File /usr/bin/v=
apigen-wrapper in package vala contains reference to TMPDIR [buildpaths]
> > stdio: WARNING: rpm-1_4.17.0-r0 do_package_qa: QA Issue: File /usr/lib6=
4/pkgconfig/rpm.pc in package rpm-dev contains reference to TMPDIR [buildpa=
ths]

These are probably fixed.

> > qemuarm64:
> > stdio: WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib=
/modules/5.15.44-yocto-standard/build/include/generated/.vdso-offsets.h.cmd=
 in package kernel-devsrc contains reference to TMPDIR [buildpaths]

Fix out from Bruce (thanks!)

> >=20
> > meta-gplv2 issue:
> > stdio: WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexe=
c/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [bu=
ildpaths]
> > stdio: WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debu=
g/tar/1.17-r3/build/lib/string.h in package tar-src contains reference to T=
MPDIR

This may be the end of meta-gplv2 since nobody cares.

> >=20
> > Christopher replied about meta-virt which is much appreciated!
>=20
> With the .debug checking patch applied, we also see an issue with
> lttng-modules on beaglebone, edgerouter, and qemumips:
>=20
> stdio: WARNING: lttng-modules-2.13.4-r0 do_package_qa: QA Issue: File /li=
b/modules/5.15.36-yocto-standard/kernel/lttng-modules/lib/.debug/lttng-lib-=
ring-buffer.ko in package lttng-modules-dbg contains reference to TMPDIR

Still remaining.

Cheers,

Richard


