Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A6BCA6011
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 17:01:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20295.1791478889030697564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 10:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pbZWWM99;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so28259445e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 10:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791478887; x=1792083687; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zwYL48hgprWd/MsrFqElIivbYSJYRweuGOIkC/HCKRY=;
        b=pbZWWM99PHfmbJiRASgEYF1Py+OTTatWPPhv8EkR3hDwhISwNWKqxQ/p8QGjzkO23X
         R5fVRIwREDZpRaW9VfxNG1tgqJTjuQGLU9ZrKBfSV0m6uq8w6d3WsP0WkoQJFBK9L0Rk
         /6odWKraQ+50OuNVB7z06UAKAstp6ViebEyp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791478887; x=1792083687;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwYL48hgprWd/MsrFqElIivbYSJYRweuGOIkC/HCKRY=;
        b=xkB8WdhA/k9mAqMtzfQb0rzRD3pN0iwGeEhFN9Uw2hFVWhdJfX1zXFOBX1Hc6bWbYS
         jOrNWYzyRmVZEPqyK/gyuvZ2F9vDf232XdyGA7U436j6PBWyiDeHi4E78hT95piKGs7C
         31ryY++yw1kEDyFBF4yZrHP9dRSCraqM/GaTojLqwbo7z8EC6IuwmcPHBUqk6gB0xwlu
         PMt7A8YWQAumXd6qhzFm0xYQcU077vmnkg+wzu21wl/1JWFc11Bk34IAU6U41iQUsbcq
         o1PFD8bTgqw6Wo0lmZb+pIKYloRaGUPik03sqh9LwZ1CkNSoCmGbIyteTc4kT53PEdZB
         vniw==
X-Forwarded-Encrypted: i=1; AKwUvBz0X3zDVe1yrj0Lr16IcOhrzmk+/cXoQVeDcGtjCerOexlocENxZhmBEaDAW9FE8b3NukBPRNl2qkRzF2EAZ5ljmA==@lists.openembedded.org
X-Gm-Message-State: AFuF++mYw6TApb2zKSljqjHRaQpz+DKw3+gNwvcA4mO/NDSEZDgELsCB
	Ed3IzcfqNwn3QIhPXRdMuWYFJgvFDFa2hxLL/JUxY3q1eggDYwnri9zb+J5tV+dmWRU=
X-Gm-Gg: AYBFou0SYh0CS/BkGXW8fdssQ94guJis4RZmwMYE1IjPheCQz4/kr286c5nALf8sDno
	4FpWdtiX8tSLxswYKgy3x76Z56RUeqpWMi/OMpRy7whei1SiOY9PQpVzSE1FsuA1BdjlH59aqxS
	Xr3eVMt9Hb0sTpCobK2lZjxGy+UOuziu+VAKjHzmRime3BjXDLzdhh1MMWX/22W0QkNx55pZpXG
	EuujE+r7L6dOtsBEJAEyduy3bLTAHhIple6+ePJOG+yA7k2QPHpqlRw2NExCt9fuxbU1gZUtNAF
	+bP0zA2yYdCFNxI4XRXPOdoQCMmNfrwxXWTab3e5X71jckE9f7ciLnQEaWeaXEGVXUvNn4dowWn
	iZMlGIimhgP1YKX0tQQgMBgDpd4Ho9KhQkpiHv3bLc8MdGjUnHgCo4h0nwoAeGY5mdAiOhgoybF
	Ywk27bdZmMKg5nFxY6ksA22kygG9ApjfecgUS/7KrSSQAHBdmlBZ2+OtddqeU1McUWjlFai5wAp
	2s6Sfyb5oIgiXoJ+7dalXm6rw5HkRoSc+qlv/r1ulCai2JMG73y81atc4W0WVG+vP6M7Ylh
X-Received: by 2002:a05:600c:1c03:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-4a180423bd2mr129869555e9.16.1791478886927;
        Thu, 08 Oct 2026 10:01:26 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db652194esm561258f8f.24.2026.10.08.10.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 10:01:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Oct 2026 19:01:25 +0200
Message-Id: <DLZM9IKRLG8B.1EXNWNHOHH9R8@smile.fr>
Subject: Re: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-sources
 filter
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Benjamin Robin" <benjamin.robin@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, <kazuyoshi_akiyama@jp.honda>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
 <DLZI7EDWUQXV.1K633GEHIRHQM@smile.fr>
In-Reply-To: <DLZI7EDWUQXV.1K633GEHIRHQM@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 17:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247436

On Thu Oct 8, 2026 at 3:50 PM CEST, Yoann Congal wrote:
> On Thu Sep 17, 2026 at 6:24 AM CEST, KAZUYOSHI AKIYAMA via lists.openembe=
dded.org wrote:
>> SPDX_INCLUDE_COMPILED_SOURCES is meant to filter all source files down t=
o
>> only the ones that were compiled before adding them to the SBOM,
>> but on wrynose it doesn't work.
>> add_package_files() is what picks which files go into the SBOM.
>> It walks ${SPDXWORK} itself to get file paths,
>> then keeps only the ones that match the list of compiled sources
>> returned by get_compiled_sources().
>> get_compiled_sources() just returns what save_debugsources_info() stored=
,
>> and that data uses paths rooted at ${TARGET_DBGSRC_DIR}
>> (=3D /usr/src/debug/${PN}/${PV}), not the ${SPDXWORK}-rooted paths
>> add_package_files() compares against.
>> So the list get_compiled_sources() returns never matches
>> what add_package_files() is comparing,
>> and almost every file ends up marked as not compiled.
>> This happens for every recipe except the kernel,
>> which has its own special-cased path.
>>
>> This isn't just a matter of the SBOM missing the right files.
>> sbom-cve-check uses the same match result to decide whether
>> a vulnerable file was actually built, for its vulnerability triage.
>> If the match count is always zero, that triage doesn't work either.
>> On yocto-6.0.2 we confirmed the misjudgment affects cpio and perl.
>>
>> master already has this fixed,
>> and this backport brings that fix to wrynose.
>> b567c2f0d9 is the commit that fixes it.
>> Everything else in the series is a prerequisite for that patch.
>> Backporting b567c2f0d9 along with its prerequisites
>> brings wrynose's behavior in line with master.
>> With this, compiled sources get counted correctly,
>> and sbom-cve-check's triage works correctly too.
>>
>> On wrynose (genericx86-64, core-image-full-cmdline),
>> the match rate goes from effectively zero to 93.9%.
>>
>> One thing changes.
>> What the SBOM records as a source file name changes too.
>> aa44a0f0eb re-unpacks under UNPACKDIR instead of WORKDIR,
>> so a recorded source file name changes
>> (e.g. sources/acl-2.3.2/... becomes acl-2.3.2/...).
>> This is a change to SBOM metadata only.
>> The actual build output is unaffected.
>> Anyone diffing SBOMs across LTS point releases will see it.
>>
>> Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
>> ---
>> Benjamin Robin (4):
>>       spdx_common: simplify get_patched_src() implementation
>>       spdx_common: modify UNPACKDIR instead of WORKDIR in get_patched_sr=
c()
>>       spdx_common: In get_patched_src() ensure kernel dir name to be ${B=
P}
>>       package: no longer modify paths in save_debugsources_info()
>>
>>  meta/lib/oe/package.py      |  54 +++++++++----------
>>  meta/lib/oe/spdx30_tasks.py |   1 -
>>  meta/lib/oe/spdx_common.py  | 125 +++++++++++++++++++++++++++----------=
-------
>>  3 files changed, 101 insertions(+), 79 deletions(-)
>> ---
>> base-commit: 9da814ca3685ada3fce46b8987f04ed3d57247b7
>> change-id: 20260917-backport-wrynose-8fa831054074
>>
>> Best regards,
>> -- =20
>> Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
>
> Independently of the "stable-worthyness" in the sibling thread. I tested
> this and got a failure that I think is related to this series:
> oe-selftest-fedora rocky8-vk-1 wrynose completed at 2026-10-05 18:01:07+0=
0:00
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4820
>
> oe-selftest-debian debian12-vk-9 wrynose completed at 2026-10-08 11:44:05=
+00:00
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/5026
> Re-run as:
>   oe-selftest-debian debian12-vk-9 wrynose completed at 2026-10-08 11:44:=
05+00:00
>   https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/502=
6
>
> oe-selftest-fedora opensuse160-vk-2 wrynose completed at 2026-10-08 11:45=
:38+00:00
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4840
> Re-run as:
>   oe-selftest-fedora opensuse160-vk-2 wrynose completed at 2026-10-08 11:=
45:38+00:00
>   https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/484=
0
>
> I started a build without this series:
> oe-selftest-debian debian12-vk-6 wrynose still running
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/5027

That build (5027) also failed like those before but did not have this
series. I conclude that this series does not cause these failures.
Sorry for the noise.
--=20
Yoann Congal
Smile ECS


