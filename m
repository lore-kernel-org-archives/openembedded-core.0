Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D26F1099B58
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 00:30:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3202.1774053007218276740
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 17:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=C5qVPB4I;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso22082585e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 17:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774053005; x=1774657805; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9yFem+XRmvfyZCeQNLwFK/+b+oG73PxnN6BsGg18DQ=;
        b=C5qVPB4IG10xb2jdVyA6PZes5/3azq6kCeIw/kKCVjNu5Au2fhas9pro/MzHg79lLn
         UWhUKWsKN8oXYWjapII/hGCmnaD4f9a8w4328FjW99mK7HF9JW6UQsqF1wkKPfGb0QT+
         K3im2SyNSnMeqokon7U9qkx5AultDudY6OR1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774053005; x=1774657805;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9yFem+XRmvfyZCeQNLwFK/+b+oG73PxnN6BsGg18DQ=;
        b=sfA1tPxi4KDqaecvthswmpe+df/zq4R9Qk/RYe9u1AJTWwbJjYvcOl8zrn9mQnrGx1
         9HlRDYnlSvnvRoJo811WeI2voKo5s+5/rc8htXttfyBeq9LVFFXp7dK3RfmDBARIqRwU
         kO3xGSxyMZh9f1729xW/J9RrvJpauRm0adBpY5JHr0H3F5TT0qVvYN/sTHFlbQU+TweF
         HYsz8iW4Yi8e7Ev0GmaVO5Xfe0m72FAs9awxm8aGERDEeGeBuQ9Js1RFPf4xBPrvOUs9
         R4g+N/xue0fMrD9DEgNHSzmMUfDEnm+OlaGSHeNWBHF9UMQco06e+6LhhbuLjLhGBb3O
         7sZA==
X-Forwarded-Encrypted: i=1; AJvYcCV1Kw3ibWPM0+E8ovxZivR+eEKBzyELMBrjKe9yZQ4Z5J9SihSxyc+NKCgMKe+jGqHjzZoMxCqPl69n+TFY1/qjxA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwRO+N5evt8LlRXw677xjoE8DoVRlhHxiVXrSHl2iRgojCc8xqm
	9qfyf5xTvHXsk5nWxvVxH2Yf5bTTgXTpzGvFSbS23T3+UnvCLfUtVjrbr75cmZJqjFc=
X-Gm-Gg: ATEYQzzL83lMWqkHppK+b5n7IXBl3B66jIYWYsFepklTr7poyMxIZ/14T3nGRh086/O
	vJRfQWanSmUUiqcvwTyrXh1KQIfiE55QKPC2TZxKNu/0t9ofnG5Gnp6X9g/Exaa5dPDBKs1JLFf
	uz+PfId57MozYZ1S/RQn/vEy0xaYXYValE3kOdIMe2cQdH3rA3VEB7oi5zlymZZzfU3/avmdhLw
	a7TdwW+GI71nj41KeDlvJNot7/SsGz+PPc/ZIy9BFbBsoTGZxiK1M+eLTGnKijMEYGP1rnyEJyT
	/c2+t6DYICXTfDAaUs5EnZPuRCjeQ3ArcMGwMwpKVoou8yFwobspvEbMoFFyByRMUx7UWOsDDne
	j+xvxSKTYy0YlAtJzSFlSwT8IE5tgHJw8vff0PUE5dWePM2WC0CyqyFDPXk/eaxNhSU6LsxmHKp
	6xeyqEyp6wZdvo4DtLaahAt+doST0dzUHTe7bxhpBnPHPRDlbR564oZ4ifJOk64hEm7u2EZln0w
	YOnBdACKXUJg/HhVq/uPVSqNg==
X-Received: by 2002:a05:600c:1993:b0:487:4cb:2fe4 with SMTP id 5b1f17b1804b1-48704cb2ff4mr2264735e9.33.1774053005451;
        Fri, 20 Mar 2026 17:30:05 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487031790fdsm37459165e9.3.2026.03.20.17.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 17:30:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 01:30:04 +0100
Message-Id: <DH81AZACSEQK.3JVCYSLWG2NFM@smile.fr>
To: <hprajapati@mvista.com>, "Fabien Thomas" <fabien.thomas@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [kirkstone][PATCH] busybox: fix for CVE-2026-26157,
 CVE-2026-26158
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260313131845.56221-1-hprajapati@mvista.com>
 <DH6PK2HKFZEL.OW09CNJ5IJ15@smile.fr>
 <c643bc67-8d9a-4740-9539-ea7b90d93c99@mvista.com>
In-Reply-To: <c643bc67-8d9a-4740-9539-ea7b90d93c99@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 00:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233644

On Thu Mar 19, 2026 at 12:40 PM CET, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Hi Team,
>
> I'm not able to load the official busybox repo form last week, so I used=
=20
> mirror.

Yes, the busybox git host is sadly not reliable :(
Khem found a mirror that looks trustworthy and up-to-date: https://gogs.lib=
recmc.org/OWEALS/busybox/

In the hope that the busybox host will recover, let's put
git.busybox.net in our upstream-status but add a note with this mirror.

> If anyone have access, they may try to fix this or I will look into=20
> these later.
>
> Regards,
>
> Hitendra
>
> On 19/03/26 4:35 pm, Fabien Thomas wrote:
>> On Fri Mar 13, 2026 at 2:18 PM CET, Hitendra Prajapati via lists.openemb=
edded.org wrote:
>>> Although the patch was not merged yet, Debian already took it ([1] & [2=
]).
>>> Since busybox CVE handling is slow, follow Debian decision.
>>>
>>> [1]https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/=
0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
>>> [2]https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/=
0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
>>>
>>> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>>> ---
>>>   .../CVE-2026-26157-CVE-2026-26158-01.patch    |  35 ++++
>>>   .../CVE-2026-26157-CVE-2026-26158-02.patch    | 197 +++++++++++++++++=
+
>>>   meta/recipes-core/busybox/busybox_1.35.0.bb   |   2 +
>>>   3 files changed, 234 insertions(+)
>>>   create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-C=
VE-2026-26158-01.patch
>>>   create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-C=
VE-2026-26158-02.patch
>>>
>>> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-=
26158-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-=
26158-01.patch
>>> new file mode 100644
>>> index 0000000000..306ccad511
>>> --- /dev/null
>>> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-0=
1.patch
>>> @@ -0,0 +1,35 @@
>>> +From 038e0e4d791ea4e8a8da5e06904756142fc6b8dc Mon Sep 17 00:00:00 2001
>>> +From: Radoslav Kolev<radoslav.kolev@suse.com>
>>> +Date: Mon, 16 Feb 2026 11:50:04 +0200
>>> +Subject: tar: only strip unsafe components from hardlinks, not symlink=
s
>>> +
>>> +commit 3fb6b31c7 introduced a check for unsafe components in
>>> +tar archive hardlinks, but it was being applied to symlinks too
>>> +which broke "Symlinks and hardlinks coexist" tar test.
>>> +
>>> +Signed-off-by: Radoslav Kolev<radoslav.kolev@suse.com>
>>> +Signed-off-by: Denys Vlasenko<vda.linux@googlemail.com>
>>> +
>>> +CVE: CVE-2026-26157, CVE-2026-26158
>>> +Upstream-Status: Backport [https://github.com/mirror/busybox/commit/3f=
b6b31c716669e12f75a2accd31bb7685b1a1cb]

Maybe something like this?
Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D3fb=
6b31c716669e12f75a2accd31bb7685b1a1cb]
(Alternative mirrored URL: https://gogs.librecmc.org/OWEALS/busybox/commit/=
3fb6b31c716669e12f75a2accd31bb7685b1a1cb)=20

>>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>>> +---
>>> + archival/libarchive/get_header_tar.c | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchiv=
e/get_header_tar.c
>>> +index dc0f7e0..a8c2ad8 100644
>>> +--- a/archival/libarchive/get_header_tar.c
>>> ++++ b/archival/libarchive/get_header_tar.c
>>> +@@ -453,7 +453,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *ar=
chive_handle)
>>> +
>>> + 	/* Everything up to and including last ".." component is stripped */
>>> + 	strip_unsafe_prefix(file_header->name);
>>> +-	if (file_header->link_target) {
>>> ++	if (file_header->link_target && !S_ISLNK(file_header->mode)) {
>>> + 		/* GNU tar 1.34 examples:
>>> + 		 * tar: Removing leading '/' from hard link targets
>>> + 		 * tar: Removing leading '../' from hard link targets
>>> +--
>>> +2.50.1
>>> +
>>> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-=
26158-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-=
26158-02.patch
>>> new file mode 100644
>>> index 0000000000..69e6e98c75
>>> --- /dev/null
>>> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-0=
2.patch
>>> @@ -0,0 +1,197 @@
>>> +From 0c20d6b353b058ab910dd3a0211e2b906802b105 Mon Sep 17 00:00:00 2001
>>> +From: Denys Vlasenko<vda.linux@googlemail.com>
>>> +Date: Thu, 29 Jan 2026 11:48:02 +0100
>>> +Subject: tar: strip unsafe hardlink components - GNU tar does the same
>>> +
>>> +Defends against files like these (python reproducer):
>>> +
>>> +import tarfile
>>> +ti =3D tarfile.TarInfo("leak_hosts")
>>> +ti.type =3D tarfile.LNKTYPE
>>> +ti.linkname =3D "/etc/hosts"  # or "../etc/hosts" or ".."
>>> +ti.size =3D 0
>>> +with tarfile.open("/tmp/hardlink.tar", "w") as t:
>>> +	t.addfile(ti)
>>> +
>>> +function                                             old     new   del=
ta
>>> +skip_unsafe_prefix                                     -     127    +1=
27
>>> +get_header_tar                                      1752    1754      =
+2
>>> +.rodata                                           106861  106856      =
-5
>>> +unzip_main                                          2715    2706      =
-9
>>> +strip_unsafe_prefix                                  102      18     -=
84
>>> +----------------------------------------------------------------------=
--------
>>> +(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total: =
31 bytes
>>> +
>>> +Signed-off-by: Denys Vlasenko<vda.linux@googlemail.com>
>>> +
>>> +CVE: CVE-2026-26157, CVE-2026-26158
>>> +Upstream-Status: Backport [https://github.com/mirror/busybox/commit/3f=
b6b31c716669e12f75a2accd31bb7685b1a1cb]

Use the same pattern as above.

>>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>>> +---
>>> [...]
>>> +
>>> diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes=
-core/busybox/busybox_1.35.0.bb
>>> index 0b5ac220f5..bb07502ccc 100644
>>> --- a/meta/recipes-core/busybox/busybox_1.35.0.bb
>>> +++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
>>> @@ -62,6 +62,8 @@ SRC_URI =3D"https://busybox.net/downloads/busybox-${P=
V}.tar.bz2;name=3Dtarball \=20
>>> file://CVE-2025-46394-01.patch \ file://CVE-2025-46394-02.patch \=20
>>> file://CVE-2025-60876.patch \ +=20
>>> file://CVE-2026-26157-CVE-2026-26158-01.patch \ +=20
>>> file://CVE-2026-26157-CVE-2026-26158-02.patch \ "
>>>   SRC_URI:append:libc-musl =3D" file://musl.cfg "
>>>  =20
>> Hi Hitendra,
>>
>> I'm working with Yoann, helping him to support the maintenance of
>> the stable branches.
>>
>> Thanks for the patch. Indeed, since the Busybox CVE handling is indeed s=
low,
>> following Debian is acceptable. However, there are a few issues that nee=
d to
>> be addressed before this can be merged:
>>
>> In the patch metadata (Upstream-Status / Backport):
>> - Source URL: Please use the official upstream repository (git.busybox.n=
et,
>> which I'm aware is littlebit downish) instead of the GitHub mirror.
>> - Commit Reference: The Debian patches you cited do not actually backpor=
t
>> the commit 3fb6b31c716669e12f75a2accd31bb7685b1a1cb as claimed in the st=
atus.
>> Seems that the first one is actually a backport of
>> 599f5dd8fac390c18b79cba4c14c334957605dae, recently merged in busybox mas=
ter.
>>
>> Please clarify the "Upstream-Status" to reflect exactly
>> what these patches represent.
>>
>> The first patch (01.patch) fails to apply on the current Kirkstone
>> busybox_1.35.0 recipe:
>>
>> ERROR: busybox-1.35.0-r0 do_patch:
>> Applying patch 'CVE-2026-26157-CVE-2026-26158-01.patch'
>> patching file archival/libarchive/get_header_tar.c
>> Hunk #1 FAILED at 453.
>> 1 out of 1 hunk FAILED -- rejects in file archival/libarchive/get_header=
_tar.c
>>
>> Please ensure the patches are rebased and tested against
>> the kirkstone branch of openembedded-core.
>>
>> Best regards,

Regards,
--=20
Yoann Congal
Smile ECS


