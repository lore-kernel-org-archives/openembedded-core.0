Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82242EF36F2
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 07:04:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8631.1773039850214070717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 00:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fBf6lu8q;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D2ECDC4286F
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Mar 2026 07:04:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73F075FFB8;
	Mon,  9 Mar 2026 07:04:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2564010369906;
	Mon,  9 Mar 2026 08:04:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773039847; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ricZRbbFAGv9kfb8EfTb+hW+gA7OKSEe4CW2A1VDFX4=;
	b=fBf6lu8qeRjA7UhWYhV94tUgX9PFHcIRhDn9cO48Y3w+xxPrhkAm3SIRYzquaTv8aG7U8f
	vayOAWZ1miK8vGpoXZlbe4QFFr4fKKkyb4tl1JVTLeVJUQLJvQlbFg5RcFxNKUNBZmgKtO
	uAGjSpl4KFlaigmtirBSrBMYK6lb4zGTIvhKdRBJIdkiJ88Bi4DXOsPN4ZAgzD/um57elm
	lKQyY3lUCYSpnPcw+xj+Q4REbu1vpVqQCKpxx3Qgbo1HUcGIYrasRGwqDtzjQGkcTY7EAo
	vttOJwDc14skSlm2AMSzkhjw/QYqUqHA0L+ZQk9oiIuykTNGvCK14inH+IpLRA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 08:04:04 +0100
Message-Id: <DGY263XJ28Q5.S68LXPC7JMI6@bootlin.com>
Cc: <alex.kanavin@gmail.com>, "Ross Burton" <ross.burton@arm.com>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liezhi.yang@windriver.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1772367692.git.liezhi.yang@windriver.com>
 <8e2bf6e0befe331a0f834687317a3dcd2d735b92.1772367692.git.liezhi.yang@windriver.com> <2bbd3ebdc7f525fc5fdb5848ec6d80c70dbb9e22.camel@linuxfoundation.org> <86d3c351-16e9-44bd-8b38-b8c6ed75aa0a@windriver.com> <e4bed048-61eb-425a-a3bf-a3906145938d@windriver.com> <DGU6U0PB5R0J.2FMV5TJUWPZJV@bootlin.com> <e85b7909-392f-4fb1-a463-46a09484060e@windriver.com>
In-Reply-To: <e85b7909-392f-4fb1-a463-46a09484060e@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 07:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232680

On Sat Mar 7, 2026 at 4:22 PM CET, Robert Yang via lists.openembedded.org w=
rote:
> Hi Mathieu,
>
> On 3/5/26 01:52, Mathieu Dubois-Briand wrote:
>> On Tue Mar 3, 2026 at 1:01 PM CET, Robert Yang via lists.openembedded.or=
g wrote:
>>> I've updated it in the pull (patch 7). @Mathieu, would you please help =
to
>>> re-test it if RP has no objections on the external generator?
>>>
>>>     https://github.com/robertlinux/yocto rbt/rpm
>>>     https://github.com/robertlinux/yocto/tree/rbt/rpm
>>>
>>> for you to fetch changes up to f8fa3090196bae3e12ad76f12f101722d84ca20a=
:
>>>
>>>     rpm: 4.20.1 -> 6.0.1 (2026-03-03 11:29:07 +0000)
>>>
>>> ----------------------------------------------------------------
>>>
>>> Robert Yang (7):
>>>     package_rpm.bbclass: Drop external dependency generator to support =
rpm
>>>       6
>>>     package_rpm.bbclass: Define _lib and _libdir for rpmbuild
>>>     lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc o=
r
>>>       musl
>>>     glib/python3/acl: Add pkgconfig to RDEPENDS
>>>     lib/oe/package.py: Don't redirect stderr
>>>     target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
>>>     rpm: 4.20.1 -> 6.0.1
>>>
>>> // Robert
>>=20
>> Hi Robert,
>>=20
>> I did pick these commits.
>
> Thank you very much for your great patience.
>
>>=20
>> We have some different errors now.
>>=20
>> ERROR: core-image-sato-1.0-r0 do_rootfs: Could not invoke dnf. Command '=
/srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky=
-linux/core-image-sato/1.0/recipe-sysroot-native/usr/bin/dnf -v --rpmverbos=
ity=3Dinfo -y -c /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/wor=
k/qemux86_64-poky-linux/core-image-sato/1.0/rootfs/etc/dnf/dnf.conf --setop=
t=3Dreposdir=3D/srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/=
qemux86_64-poky-linux/core-image-sato/1.0/rootfs/etc/yum.repos.d --installr=
oot=3D/srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_6=
4-poky-linux/core-image-sato/1.0/rootfs --setopt=3Dlogdir=3D/srv/pokybuild/=
yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-ima=
ge-sato/1.0/temp --repofrompath=3Doe-repo,/srv/pokybuild/yocto-worker/qa-ex=
tras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/oe-roo=
tfs-repo --nogpgcheck install dnf packagegroup-base-extended packagegroup-c=
ore-boot packagegroup-core-ssh-dropbear packagegroup-core-x11-base packageg=
roup-core-x11-sato psplash rpm run-postinsts locale-base-c locale-base-en-u=
s locale-base-en-gb' returned 1:
>
> It looks that something is wrong with the storage.
>
>> ...
>> ++ tr -d '[:space:]'
>> /var/tmp/rpm-tmp.U4iaJX: line 98: tr: command not found
>> + test x '!=3D' x
>> ++ echo --system --home /var/lib/dbus --no-create-home --shell /bin/fals=
e --user-group messagebus
>> ++ tr -d '[:space:]'
>> /var/tmp/rpm-tmp.U4iaJX: line 114: tr: command not found
>> + test x '!=3D' x
>> ++ echo
>> ++ tr -d '[:space:]'
>> /var/tmp/rpm-tmp.U4iaJX: line 130: tr: command not found
>> ...
>>=20
>>    Installing       : dbus-common-1.16.2-r0.x86_64_v3                   =
 682/790Error: Cannot open file /srv/pokybuild/yocto-worker/qa-extras2/buil=
d/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/oe-rootfs-repo/r=
pm/x86_64_v3/dbus-1-1.16.2-r0.x86_64_v3.rpm: [Errno 2] No such file or dire=
ctory: '/srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86=
_64-poky-linux/core-image-sato/1.0/oe-rootfs-repo/rpm/x86_64_v3/dbus-1-1.16=
.2-r0.x86_64_v3.rpm'
>> TypeError: 'NoneType' object cannot be interpreted as an integer
>> FATAL ERROR: python callback ??? failed, aborting!
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/3271
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3276
>>=20
>> I'm a bit surprise by tr errors here, as it looks a bit unrelated. There
>> is a small probability it's related to something else in my branch, but
>> this series is clearly the best candidate. I will keep you updated if it
>> finally looks related to something else.
>>=20
>> I also got some more traditional "nothing provides" errors:
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/3317
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/3321
>  > > Can you have a look at these?
>
> For the above two errors, it is because the sstate cache had been pollute=
d. I
> moved pkgconfig-native from do_package to do_package_write_rpm, the
> do_package_write_rpm still can be mirrored from the old (but bad) sstate-=
cache.
> It woudl work when the old sstate cache are invalid. So I've sent a
> gettext update patch:
>
> [OE-core] [PATCH 0/1] gettext: 0.26 -> 1.0
>
> It would make nearly all the sstate cache invalid, and re-built from sour=
ces,
> then this should be fixed.
>
> What I'm worried about is that gettext is very basic package, I hope it w=
on't
> cause more troubles. I've done world build on qemux86-64 and qemuarm64.
>
> Other reipes' upgrading may also can make the sstate cache invalid.
>
> // Robert
>

Hi Robert,

I ran a build, not with your gettext patch, but with the one from the
glibc upgrade by Hemanth. We still had similar errors.

Any opinion?

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3378
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3330
https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/3302
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3307

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


