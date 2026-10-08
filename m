Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CCBCA6007
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 13:50:41 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15775.1791467438698006022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 06:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HiANxxsW;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48af27fe287so2266714f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791467437; x=1792072237; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nRiRpfY+Non+8hDHx2pcyXknpyn90yTvhYQF28MG4Yk=;
        b=HiANxxsWwCmj1R9BHAH8Sr4LA9ELpPp94ov7Zrzv22gCbt+UXhGrjI+ffYHnI0l0/6
         Vse84eN3VmdR6seFdfjgBIDaNhXUAXAXFaMMXJTrfTFju8bxMdOyP5Kfwf3/cWzGA/0I
         g62i5UQDGcjZ4gevs7X4FNsLhbijLennmWfAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791467437; x=1792072237;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRiRpfY+Non+8hDHx2pcyXknpyn90yTvhYQF28MG4Yk=;
        b=vg7XmTjZXzK8ef9bHY5D4nHM5QX0+pIV5e6v2NK6N8krnHBEmgADhPmvjFa4/ZkWtz
         JpR6ouEv/I1Wfd9CpahYhA7TiIRV2a8cI4kiaVOTwSlIRpVVN5w3MtbOlJc0VylNlsIB
         3Gy0suIKYNd6BjnSoPFoXUFJQWQFa7O5+DAz1SGBR7j2CqTD2xxpBqhaX7XODH5Gc/wQ
         tCfbQOLXFZODTrwVNXiwBi+aXIsyjUytlTfpAvJ9ikmXWMCX6TyrUywsqInV9SXnGquf
         ZHOxmGkNSG1qNMsEsQ9qMszw7r5KOFmDJlSp1n0pMVjNnSIsyX0o6l/9n1V8q3+fcYQr
         hrbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxh5OqQ8gG522ZpD9iAWtG31NJbyKp6Mekhv4X7A085UUufOGRXg2VUFvr1rit++3NAdNHgbYLm8DG4Jpdwa1N7bA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKqKaSRKHc79J5z/rDsihsQ27HrTKv5H+TqL9llD6CyLeikMPcq
	9Buy8BI5WOZywzGlYuLgBtJnTeONqOuYDPNdv03GZNlyFW+Dws5Na4d0Rp+fh+nIqFM=
X-Gm-Gg: AYBFou2xoKDtIkKe14hLtDE1RHvPaLrfP7a8488BZCuNlzXgxNzrZAxAU7I1Zvf5KrM
	uZYNwfpD+xfMfAo6zbn/fex4XwfOxks4s9prjcwoDahzlgLJNOaz3sacyeHG5pCoEugnh4h5HFB
	F3nzcDaO7UhDNRhS1qe4b2kdszI/YSaVY453+EuD+AvvNRuMZM+Zwbhc1XAp57PRxmI20hW6Izb
	dGtm203UzK8vL8L3nG6JSuu0YKq14YBRzAKnhY3DLaHQnBRYMbzjPXHE8QfkH9tXm61L7YpKsql
	c/c4gRQQcydBNQDy3zVzwlCKCCUewsUeIbb1beLQffrOPDT9TEvaGv91lMs4dJ6ipIK7Mez7x+a
	iFVuqH/V3N35TlNIQc/XCYCQh3FRJ3ca2+OpjxmX3gJNdWp0ZO0pzb10q8X5MjtA7539PPvx2s9
	iZ7AN7UdzcbABmmqW6qKAr+peMLh9Ols5Jeqx2iU35rN3bq2zStc2lqxqSL7KVosBn1Mqr90FeY
	HtGnNfJxB0dPDrwGDwIGSI7zapZ2J5nYCpC+feUgBJ8vsW7Yrmf/nbNdt0iG82cIyslxXcs
X-Received: by 2002:a05:6000:25fd:b0:48c:77aa:2f78 with SMTP id ffacd0b85a97d-48c77aa320dmr8166773f8f.56.1791467436767;
        Thu, 08 Oct 2026 06:50:36 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7f2a704asm4948796f8f.28.2026.10.08.06.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:50:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Oct 2026 15:50:35 +0200
Message-Id: <DLZI7EDWUQXV.1K633GEHIRHQM@smile.fr>
Cc: "Benjamin Robin" <benjamin.robin@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>
To: <kazuyoshi_akiyama@jp.honda>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-sources
 filter
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
In-Reply-To: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 13:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247430

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
>
> Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
> ---
> Benjamin Robin (4):
>       spdx_common: simplify get_patched_src() implementation
>       spdx_common: modify UNPACKDIR instead of WORKDIR in get_patched_src=
()
>       spdx_common: In get_patched_src() ensure kernel dir name to be ${BP=
}
>       package: no longer modify paths in save_debugsources_info()
>
>  meta/lib/oe/package.py      |  54 +++++++++----------
>  meta/lib/oe/spdx30_tasks.py |   1 -
>  meta/lib/oe/spdx_common.py  | 125 +++++++++++++++++++++++++++-----------=
------
>  3 files changed, 101 insertions(+), 79 deletions(-)
> ---
> base-commit: 9da814ca3685ada3fce46b8987f04ed3d57247b7
> change-id: 20260917-backport-wrynose-8fa831054074
>
> Best regards,
> -- =20
> Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>

Independently of the "stable-worthyness" in the sibling thread. I tested
this and got a failure that I think is related to this series:
oe-selftest-fedora rocky8-vk-1 wrynose completed at 2026-10-05 18:01:07+00:=
00
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4820

oe-selftest-debian debian12-vk-9 wrynose completed at 2026-10-08 11:44:05+0=
0:00
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/5026
Re-run as:
  oe-selftest-debian debian12-vk-9 wrynose completed at 2026-10-08 11:44:05=
+00:00
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/5026

oe-selftest-fedora opensuse160-vk-2 wrynose completed at 2026-10-08 11:45:3=
8+00:00
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4840
Re-run as:
  oe-selftest-fedora opensuse160-vk-2 wrynose completed at 2026-10-08 11:45=
:38+00:00
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4840

I started a build without this series:
oe-selftest-debian debian12-vk-6 wrynose still running
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/5027

Regards,
--=20
Yoann Congal
Smile ECS


