Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CC9C98328
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 09:20:08 +0000 (UTC)
Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16031.1790414401986562633
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 02:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xE8Fgw5w;
 spf=pass (domain: smile.fr, ip: 74.125.225.96, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so928295f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790414400; x=1791019200; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EEsbYmW6tzoeAh2UA9DYW5erwISJ2pIw8eX7emzwEMg=;
        b=xE8Fgw5wd/8fSFRSXWOasxNLnyxEFV5m+oGN+YJ30nvMMdItJc+yQKzAPh1QUM0NrD
         3DzuVfSj5qQd1bzUjqKdxI/Sh9Wr26wXsIRe3gFFzWW6MPA551CNSVyKibSZORct22Hx
         O/XQcmwLvF25FbhmgA0cwM6pt5KJklUXio5NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790414400; x=1791019200;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEsbYmW6tzoeAh2UA9DYW5erwISJ2pIw8eX7emzwEMg=;
        b=tLwApLqe8Fjsy6x7YkPC0jmrkVxdmri2lsSVU0DuAB3wnFx/OkG0rH7Jy0V4VQ0zYq
         XR+d0z2wjo986E2DWf9FHwbSX1k5RDwWybj/TwzI9b8bo4LUmiKY6HC++NHf7PN05AL4
         2H5fjWjEuKfEpEhPK1B3E6hL8axQi4pFq372SgxWUuQTlfS5x5/gXKfYN2hlgmx7ZpY0
         uFIiuT1xFQ8pxyGF1JuvzCm1IJ0O04iroH279JGNCl4iYL6EP5ScQueArgunlVi9ksr7
         ulMzbvLkiayEU4sgezga4nRT4RYj/R7qbw9zXX2cCLztH2L/7lVWBE2XtD5lRcOamuVq
         KMSA==
X-Forwarded-Encrypted: i=1; AKwUvBz4qO0IALLkj4NqwVvtW10McDDK4rcusS75rpQx1b9A76EVNtFX+kdVYLdHBgJGTas3X+p5KCm0SwagaTSxgL604g==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKXixy9WOYMzxHmH10ybAsH27bwnWuBs6pVQoAVnta9EipsYEQ4
	aUN0/PjG3pWSoIoSWJ6PunfSjxZHcxF219gS3hXVlP1/4IcTtNsloEz/XlKqBIocRSY=
X-Gm-Gg: AYBFou0SPnNiS8dY+/V4NX6pvv0mKasPPSbUY98qqulBWktgNhR9r9XOZQ/vZSmqFMa
	0X3qH7RJGmj7qEKRxxsj8tLuOOHp4gbGNWTjc+quy2VOsMsDHUufT1YEJyaxFj9NpvKbUBwdsk4
	KDVsQpGO/Rn351TMFnRe4ag5yEwOitsohef98tG8ZEteyGi99ApDyjcophlTo1ucW2GgOnElRkM
	KNqm2/agSnWnF0h8FyC2ZPg5OH2SEyIUSSPphix76k2MXDEYWtyhDW/0yelRgbcThNak3aSYxir
	2M08kqaAHavYDlfeB4Z0RMOsWB+LHA+431/EtCcoXqa85dDu+wDA9SbGizWOxuvfAUKFJupMxpl
	BLpwD2x4nVPLZVu2TAbhBMSz0mp3wzgaWRIOBJq+eQVm8hCd8jfmdC6wCmjXKFKuSQ9sTBzA+nO
	aQgmi4m3crsadsH9F92/GrG+LI0+QuQfHw/hemfftngPgxAwHlV2PiVIhdM/T5/UoQhFX+XW+qH
	PAE/GVhUPjfSP7ME3A+a3EzRB2oNI4t7n3ZPbVPV2ApZyOiBE9P5BY4voaX
X-Received: by 2002:a05:6000:29cf:b0:488:8823:f9f2 with SMTP id ffacd0b85a97d-48888240462mr1548163f8f.25.1790414400019;
        Sat, 26 Sep 2026 02:20:00 -0700 (PDT)
Received: from localhost (2a02-8440-2602-893a-2c59-e728-83de-e80a.rev.sfr.net. [2a02:8440:2602:893a:2c59:e728:83de:e80a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a4e9sm10837337f8f.11.2026.09.26.02.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 02:19:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 11:19:58 +0200
Message-Id: <DLP4XNN74N6I.1RINHBSPGZQL3@smile.fr>
Subject: Re: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-sources
 filter
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Benjamin Robin" <benjamin.robin@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>
To: <kazuyoshi_akiyama@jp.honda>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
In-Reply-To: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 09:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246633

On Thu Sep 17, 2026 at 6:24 AM CEST, KAZUYOSHI AKIYAMA via lists.openembedd=
ed.org wrote:
> SPDX_INCLUDE_COMPILED_SOURCES is meant to filter all source files down to
> only the ones that were compiled before adding them to the SBOM,
> but on wrynose it doesn't work.
> add_package_files() is what picks which files go into the SBOM.
> It walks ${SPDXWORK} itself to get file paths,
> then keeps only the ones that match the list of compiled sources
> returned by get_compiled_sources().
> get_compiled_sources() just returns what save_debugsources_info() stored,
> and that data uses paths rooted at ${TARGET_DBGSRC_DIR}
> (=3D /usr/src/debug/${PN}/${PV}), not the ${SPDXWORK}-rooted paths
> add_package_files() compares against.
> So the list get_compiled_sources() returns never matches
> what add_package_files() is comparing,
> and almost every file ends up marked as not compiled.
> This happens for every recipe except the kernel,
> which has its own special-cased path.
>
> This isn't just a matter of the SBOM missing the right files.
> sbom-cve-check uses the same match result to decide whether
> a vulnerable file was actually built, for its vulnerability triage.
> If the match count is always zero, that triage doesn't work either.
> On yocto-6.0.2 we confirmed the misjudgment affects cpio and perl.
>
> master already has this fixed,
> and this backport brings that fix to wrynose.
> b567c2f0d9 is the commit that fixes it.
> Everything else in the series is a prerequisite for that patch.
> Backporting b567c2f0d9 along with its prerequisites
> brings wrynose's behavior in line with master.
> With this, compiled sources get counted correctly,
> and sbom-cve-check's triage works correctly too.
>
> On wrynose (genericx86-64, core-image-full-cmdline),
> the match rate goes from effectively zero to 93.9%.
>
> One thing changes.
> What the SBOM records as a source file name changes too.
> aa44a0f0eb re-unpacks under UNPACKDIR instead of WORKDIR,
> so a recorded source file name changes
> (e.g. sources/acl-2.3.2/... becomes acl-2.3.2/...).
> This is a change to SBOM metadata only.
> The actual build output is unaffected.
> Anyone diffing SBOMs across LTS point releases will see it.

Hello,

Thanks for the series, this sounds like a worthy fix.
But, this SBOM change is a bit more intrusive than I'm confortable
with... This will create a lot of noise for users that precisely track
their SBOMs.

Can we do the fix without this change?

Thanks!
--=20
Yoann Congal
Smile ECS


