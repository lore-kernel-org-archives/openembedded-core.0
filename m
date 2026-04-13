Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93E4EBFD22
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 09:19:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.268394.1776071980459085067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 02:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BDsRRZes;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so39137815e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 02:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776071979; x=1776676779; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TQfIkEU6UaIY9bopOgEK9STMnIC9QvgMi/tDnu3gjYs=;
        b=BDsRRZescZq6nbdj5DGpH1Arw/jRQHx0F/U+I5dxll3TC32sxxTsYJI5dNmwyn/FQa
         lMYv5Mzhe9le+bSKUy2v6ioSGXaNLkGe4VnGSLvhjq0WfPGFPzBfTc4YgeatIKT9qzEZ
         HcThBtt6xfpe+mM7CnL6vr1MdTNXBNB6ng2XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071979; x=1776676779;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQfIkEU6UaIY9bopOgEK9STMnIC9QvgMi/tDnu3gjYs=;
        b=tAoLJNnamXnLiGUj8Zjidy1s1BgHVyTfMXadw3taYHpOOJdVZGjhFPfeLMUXaOW6pi
         LnEnkbbrHLKapAefCxCETFvHg+VFKWQLJpq81z144nJhRa2MBz0nSQ7vvi+ZvbRTNArQ
         ztp3txjhXiKio23Lu1///LJnan+NrxDoXPC6CG29RJTiIlOgBdR7cL0h3+cE+bIx+UbC
         0fK57+l4zOWJm42yEWKCzqaKIFg52xWhpdE/Tu5dAW4Kjot1GGOGQ2nIfrk2xYF5ubXJ
         i92lVsP3Tdtu2+K09GHm3o2SzFE/ZcDlA7EJEqqToo7TgZqE1mMxRJDh19r2ri7+zfLY
         VBOQ==
X-Gm-Message-State: AOJu0YxtVPTGCZpFv7m9wFe3z01qI4QuEEjU8aI5/nrFGYF0+BnzDnb1
	GhwKYknAlgF9soqXbIQkeCrfBVjs0NA2oDlXgl9ttmoCvMGMZvbdyZ1j6Kr38XG3p10=
X-Gm-Gg: AeBDieuWT7dg18IiCg3IcIzgznEHlcJDS4HoC/Z7Clij7MOa7clhZVWFwELRu3Y8XuM
	2A7NKbqAM60xcnOdMRfHYdSmOZVYe5rFP2HciNeqQdq+B2YWJGAthXLA833Qlwgy9AgeTg0a9Pt
	/+vVjii0Suxk/nmmGC40Tp+g/VHmr3JG8Ih8w6c/aUf4t7jrXp5idFEY3N/GbAX9fuxgWZneGeu
	h8IwCExuAFA29+cBQLDB7PDo6uyu70UsfxnoNhcwd3VFeAuEDKqykdF09DAkAFHykhUl18KaIvV
	iXktrJ36LBJ0ouFQrsNojNz8aJZky3y1NR1P/5unEUeD4nzTXk6lSrtFsycl2pLGiHUjksym8JI
	/4L2lTeyN29GzmsDN+4eFLC861k//u/WqkGImFArii9HPAD4Nsc91IP5d3ReuaZ3gpsPhzWdSEP
	iJ2HaNL8IbbYqRqZhSs+LEb9wqIv8x9ds+dhxKPRnxjfqMnAajk5DsSB0r+9tCqNNS04VTvXenH
	Xew6zpClO2Az1XN
X-Received: by 2002:a05:600c:a11b:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-488d66559d0mr145091215e9.0.1776071978726;
        Mon, 13 Apr 2026 02:19:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94f6:3ed9:6e87:6a93? ([2001:8b0:aba:5f3c:94f6:3ed9:6e87:6a93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58a8438sm311232815e9.5.2026.04.13.02.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:19:37 -0700 (PDT)
Message-ID: <3b023d332e89496f3d89f535d2afbee665405d28.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv2] systemd: fix unmerged-bin tainted message
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rs@ti.com, ross.burton@arm.com, mathieu.dubois-briand@bootlin.com
Cc: openembedded-core@lists.openembedded.org, peter.kjellerstedt@axis.com, 
	joerg.sommer@navimatix.de
Date: Mon, 13 Apr 2026 10:19:37 +0100
In-Reply-To: <20260410182747.1646597-2-rs@ti.com>
References: <20260410182747.1646597-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 09:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235093

On Fri, 2026-04-10 at 13:27 -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
>=20
> Systemd prefers both /bin and /sbin to link to /usr/bin. If this is not
> the case it reports that the system is tainted in systemctl status.
>=20
> Add a link from /usr/sbin to /usr/bin to prevent anything from being
> excluded from the merged bin directory. This mimics the current merged
> bin directory structure of Arch Linux [1].
>=20
> Update the systemd recipe to prevent creating a duplicate link when
> sbinmerge is enabled.
>=20
> Override most sbin variables to point to their bin equivalent when
> usermerge is enabled, with the exception being base_sbindir_native and
> sbindir_native. There is no guarantee the host machine is using this
> filesystem scheme.
>=20
> This check was added to systemd back in 2024 [2].
>=20
> [1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesystem/=
-/blob/main/PKGBUILD
> [2] https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d=
1e4a6aa6d9f0d

Just to be clear, whilst I understand the issue and people wanting to
fix this, I'm not going to take this into wrynose. The failures and
other issues the fix has caused shows it isn't a safe/easy fix and
we'll have to give it a bit more thought in the next development cycle.

Cheers,

Richard

