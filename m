Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6892C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:38:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7003.1788266294155290400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 05:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D6jfByrm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso10205175e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788266292; x=1788871092; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2fhhH/SWvruw9//pK7hjfEGkL4Dfp5ZqWzMAbbhHBlI=;
        b=D6jfByrmzqzDe3bZOk/9rPrgrhpL9GLUb1HU3at2z7lnph/ZqK0Bw+MQCH+iE2xEt/
         N3g3o+4L5/QY84f2j+ieL8Ao5tSFYeyGYjW4iscMXH/3nKBe2HsA9nTQmFaNCxtfpzVy
         Irwx84BmPZFApP3Iwzz7vy2h9/iUYLagLbQfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266292; x=1788871092;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fhhH/SWvruw9//pK7hjfEGkL4Dfp5ZqWzMAbbhHBlI=;
        b=oULgwFKC6r4BTQ4JcI05Q4h617rTDoT0obe0mf13TROkdcyETYDZETCMrBH+uXfc7l
         OCq91kYtCyxxQFlwqJ0Sr94wSo84LfpdqieLFAbXbfTsboxi3+DUqDiZLJQUHPWeiAc3
         ZKdHKX+MwuBi+FdW9BU7JTJpQqBhY0TKKBYWhpS9vr+d/RIMEjtEaNF9v/8dpkjEq8G/
         5YecqRbxKw4Xj4ff/As90UGX/DTQVQxJ2xSOVVhdtxtsZhkISV+7k85XV9dZX65FnknU
         DshbatJ/NiMwBxctOYWLw4xxLUYlV9Oo1xGN4Um6R3v3Ew0P/TvNWkeoxtL9XfJBTj8L
         GLqQ==
X-Gm-Message-State: AFuF++kNgXEOWuXGb1nz6gzmWuefGkbiHgAyTMz0e167rRQUqFeHiL9P
	whVj/mTJBj+YcqPfeyWLzQYE3pGCqgbBlIoZtR7RY7zQVZOHMw3nv+/mWqzUD1NML/k=
X-Gm-Gg: AR+sD12MvHC9KL0bRD6kbU1WeHEnMPNwY0/lYhnwxe6fNJ5Hgh80s31kRPvnlD2pfA3
	aGZzTJC0i6BN61Ado48pHNtT2X9jkRB3a0pl+VpRjIyevQWgWc8z6ruIol0WhG84VmSvQUv/Nql
	C2rVYVJv5n7ojZMVxtE31GF93mbGEA/csJHCXmJ8NH3eJusbCM4YoJSGw0sYksqT1ZIhrOjnHkZ
	HVLCO8VGKzteWq849C9HAAM//QkyMpcNQbXNxA5olkzlMgZpk26khydBLtEp2phMBGEF2s4hEqB
	oQkifxWjyEyJq15zeCrRh80EOgO9KYQtlCH9iL1ccmk4BRmntp/H+vpmZvehrrEdlptyQoGuKEB
	Ed+2aeCu0GQny9k+deVH4iaJreLxLj/ul5w693oJMPn7IMSUsupZJpB3dcdK4o4XYEtt784btlE
	STjNpG7gHKU6BH+qBq3P5wDnKOWMT69atiyWPyd/0aJZHyJFPvEPQ3mkC8H8gSXsWNvaydjAcxd
	cz9ry1g4MKOP1JblZT41aWyGFoCPKPWIIZZYXPxRjR3mnq5iGOrxA==
X-Received: by 2002:a05:600d:6402:20b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49cdc42f448mr123450935e9.3.1788266279548;
        Tue, 01 Sep 2026 05:37:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9e4b:8577:fa6f:4727? ([2001:8b0:aba:5f3c:9e4b:8577:fa6f:4727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d781bcsm4393687f8f.26.2026.09.01.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:37:58 -0700 (PDT)
Message-ID: <2b0488ec7cb16415cc3b447c478adea58e048ec2.camel@linuxfoundation.org>
Subject: Re: FILLME-exact-v1-subject
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: roman.nazarenko@leica-geosystems.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 01 Sep 2026 13:37:57 +0100
In-Reply-To: <20260901115853.481006-1-roman.nazarenko@leica-geosystems.com>
References: <20260827155227.813074-1-roman.nazarenko@leica-geosystems.com>
	 <20260901115853.481006-1-roman.nazarenko@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244824

On Tue, 2026-09-01 at 13:58 +0200, roman.nazarenko@leica-geosystems.com wro=
te:
> I tried the do_install postfunc and it breaks packagegroups.
>=20
> packagegroup.bbclass does "deltask do_install" but keeps do_package, and
> a deleted task never runs its postfuncs. So with
> LICENSE_CREATE_PACKAGE=3D1 add_package_and_files() still creates ${PN}-li=
c
> in perform_packagecopy, nothing fills it, and ALLOW_EMPTY is set for
> packagegroup packages - a silently empty package. Those -lic packages do
> have content today, as find_license_files() returns generic_<LICENSE>
> even with an empty LIC_FILES_CHKSUM. Packagegroups also deltask
> do_populate_sysroot, so they were never racy to begin with.

I suspect we should fix packagegroups differently, either disabling the
license packages, allowing them to be empty in that case or allowing
the postfunc to run. Might just be easiest to disable there.

> It is also wider than needed: do_install[postfuncs] has to be added
> unconditionally, so do_install's basehash changes for every recipe and
> sstate is invalidated from there downwards.

It would be a one off basehash change so I don't think this is a good
reason to base an architectural decision off.

> ${PKGD} avoids both - it is private to do_package, so the race is gone
> by construction, and it works for recipes without a do_install. It does
> stop staging license texts into recipe-sysroot, but that looks like the
> fix rather than a side effect, given the failure came out of
> sysroot_stage_all.
>=20
> Ok to keep ${PKGD}, or is there something about ${D} I am missing?

The intent has always been to have the packaged files and the sysroots
as similar as we can keep them, just to reduce complexity and potential
bugs. This is why I'm leaning to make this more in line with that
rather than making it worse...

Think about this from the other perspective of debugging where files
are coming from. They *supposed* to come from do_install and be in ${D}
. Even where there are differences between sysroots and ${D}, files are
pretty much always in ${D}. The current behaviour will therefore take
people by surprise. We have enough usability issues without creating
more differences without a good reason.

Cheers,

Richard

