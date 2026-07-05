Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54058C43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 08:30:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127366.1783240201060937130
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 01:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UdQmuc1Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1370169f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783240199; x=1783844999; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x81VHaTj2n/Z+5oHccFeyK6eEAwejAdCsWZ+SrE42zE=;
        b=UdQmuc1YYxfiMskzqoiMdSo5BbdHsDfpUrwLkZm1R9EGceZdOyU3McpwKicgnQkB6I
         ZQAfFe2TYdpl1v6PP805ZdXicIKup3Jz5oivvXKKaRStINSBmdnqRW8q2wLs8QSY+eP9
         ihzn9pwHSqSg/CObTFnAOKY+7XOYQK4FprWcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783240199; x=1783844999;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x81VHaTj2n/Z+5oHccFeyK6eEAwejAdCsWZ+SrE42zE=;
        b=oz2tJELUgB2cO/z+a+gExPQyLoVO0ka7SZROO8U4aXajyxh/7Luy9/+4a/R8v+gcBa
         mFLsjVMQveCGMsfNLsqeseaS5IB7FI/ZlzqavHDjgOAey5CxfyRvSSjzVs6oqTpd76dm
         SHo+yiJ+RMdCQocNr7wTkIT+lEmlf53NtUN0/d9sJsQMM5gYrqyN69HUzfE0YYKQyTgf
         S/heEvxf0lxtsnm1+8T35lPw3KysYcDhCNRMPUHCKhO3O/p5/7GUYX4yPXvyCQyRIG7R
         /MTUz0qDPIKowACnvLETgYr1FVECLyl9gHvKM9b/YxKaqZimxpaxrWe56Ta/dQ1Bj+hs
         3ehA==
X-Forwarded-Encrypted: i=1; AHgh+RoeXqUQJFXuSf7QkzM0zRs3u4bEdqSwhm2RjKUhbighYsx6NKZaW08RBCfuOA0XEM7ZpVlh6NFEZpbCgKdVhUXqZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYuVn6c7NUpoW+t9h2NOE3KHba5orMui3uQxpci20rFH4YijrP
	S8u9tJCI7zc7yPN7qXZfJQ3Avl1pDdhXGFAH2nVj488kWzqUp176DZ+ViBjb0oIFHBo=
X-Gm-Gg: AfdE7clKmRj7nvFDLF5XP7eVWbqldScziVlCEE5vRwTkAhZCRuEIwcZ+ALqc90zaT3X
	mDcwh53DcCKmVCUWiUbibWEYp/jpz02TedFJ6wiG04bm2XM8f7n3O0GxAQbuljD3V5a3BQGtu0C
	6VAXeqoQGXxkU41ZiMSwzgAvBbNDL2STLUyAyFdrVKPZ9n48ZqvJykOsqqeyPzBWWdyBdw7zo97
	FPeqqzUUBFOQB7vdnu1PvCdSmZ8H59ny+/4JmqXifzxskYIhq51i9tH332Y2Z7SyLgDVOz7b/aJ
	Ejkvj04X2hZhPmcdNl7iJMqt4+tllr0MUDY6uVPNDWsNr4t/nNarOXs9+fRvAxd4w0T9+fpTbtY
	PYod4xLJOqafNGhFoIfREv1QmyfBTlz4qQ8MqJDZRSjO0S/ZmVjvh94ouUy+brT3grn67RMEUpO
	WkZ2TLcXcP7mgsTrhLw3iZLT2tjZQSLrgb5vAcY7ek2mn6DrcuzM6QIL+0wuc66yLzdjfksFP5B
	c0=
X-Received: by 2002:a05:6000:200f:b0:473:c2ec:7a79 with SMTP id ffacd0b85a97d-47abb08cb6emr6181731f8f.12.1783240199087;
        Sun, 05 Jul 2026 01:29:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:952e:67c8:1422:6cf? ([2001:8b0:aba:5f3c:952e:67c8:1422:6cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm14868021f8f.21.2026.07.05.01.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:29:58 -0700 (PDT)
Message-ID: <c3823daaaff5a77fb92f1ecdbeb2711605f93a21.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4 00/10] Implement SPDX for deploy tasks
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Sun, 05 Jul 2026 09:29:56 +0100
In-Reply-To: <20260630210422.1903245-1-JPEWhacker@gmail.com>
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
	 <20260630210422.1903245-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 08:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240143

On Tue, 2026-06-30 at 15:01 -0600, Joshua Watt via lists.openembedded.org w=
rote:
> The SPDX use case for file system image has been well defined since SPDX
> was first implemented, however there has always been a desire to also
> express SPDX output for other non-image deliverables (primarily, those
> that have a do_deploy task or similar). These types of tasks cannot
> easily use the traditional method of having a separate SPDX task that
> runs to create their SPDX output as this causes lots of problems with
> the way dependencies are specified. Instead, it is desirable for these
> tasks to directly produce SPDX output that can be consumed by other
> tasks that depend on them.
>=20
> This patch series adds support for this. Any sstate task that starts
> with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and it
> will run a postfunc to generate SPDX output that describes what is being
> deployed. For classical do_deploy tasks, this is setup to be easy by
> automatically capturing all the deployed output files in the SPDX data,
> but other tasks can be added as well.
>=20
> Finally, the do_create_image_spdx task is removed and replaced with a
> SPDX deploy postfunc using this new system. This means that any task
> that depends on do_image_complete will automatically also get the SPDX
> output for the image, simplifying the dependency handling.
>=20
> V2: Fixed SPDX documents missing at SBoM creation time when the
> documents were not a direct dependency of the SBoM, and were present in
> a sstate object. Previously, these sstate objects were not restored
> because they were "covered" by the later sstate tasks, but now they are
> restored if they are depended on by a task that creates SPDX output.
>=20
> V3: Fixed a bug where dependencies that are not in the taskhash could be
> missing when the final SBoM is created and added tests.
>=20
> V4: Fixed some testing errors that revealed that EFI providers have to
> be MACHINE_ARCH (and consequently, wic-tools)
>=20
> Joshua Watt (10):
> =C2=A0 spdx: Skip dependencies that are not in the taskhash
> =C2=A0 spdx: Add ability for deploy tasks to create SPDX
> =C2=A0 oeqa: Add SPDX deploy SBoM test
> =C2=A0 classes-global/sstate: Keep SPDX generating setscene dependencies
> =C2=A0 Add SPDX deploy tasks to various recipes
> =C2=A0 spdx: Replace do_create_image_spdx with deploy task
> =C2=A0 grub-efi: Change to MACHINE_ARCH
> =C2=A0 systemd-boot: Change to MACHINE_ARCH
> =C2=A0 multilib: Add systemd-boot to NON_MULTILIB_RECIPES
> =C2=A0 wic-tools: Change to MACHINE_ARCH

There is something not quite right in here which I suspect, but havve't
currently conclusively prove caused:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4276
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4216

Cheers,

Richard

