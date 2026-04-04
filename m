Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915F9E88D87
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 05:55:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11840.1775282121365735824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 22:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QtBPiG2Y;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4AF5D1A3143;
	Sat,  4 Apr 2026 05:55:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 111C7603C2;
	Sat,  4 Apr 2026 05:55:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA0A310450163;
	Sat,  4 Apr 2026 07:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775282118; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ONJ2LG0JH5xdvIu+FOFTld03DeH+pQCdSlW2RGhqAH0=;
	b=QtBPiG2Yztx98JljpRHgqur+NrCKCv/j//9OXG/EyWo56h3rIWpT0Hfx2VDA0TUZn1F26J
	SHeErSqGnL01e7LaDhrmhe88mLQneZqiWQzEzjRskp0E5spgxW3H9ZO8q8YVoqfOey8yXn
	rg4SlRAI1Qj01ai6t1z5gvr3+rMzKj6bFQNNP9ireUJcZxjnaGXn2JfrM9UPZ8hAMIPJrz
	fzp0ZN2sKeEhlzsM4eK8aS71ifDjC6uC4co4ig2sVWoXUIYtlI/jr/SZeGB/b6Gr2ZvQfm
	MUiI1A9w4PxiYmmXxBvCvbcLRyJcP9eqmIy86X6bEHvA5I18A/oox5iqIo3Qpw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 07:55:15 +0200
Message-Id: <DHK4ZL7W9BQT.3D1Y5HJNCKPCE@bootlin.com>
Subject: Re: [OE-core] [PATCH] sanity: Require tar 1.35 or later on
 rhel9-alike distros
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <yoann.congal@smile.fr>, "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
 <DHJO8L8EC2Z9.1N02J4E6QUEGC@bootlin.com>
 <DHJOO3S7NQMS.D0NB9IPZPFV0@smile.fr>
In-Reply-To: <DHJOO3S7NQMS.D0NB9IPZPFV0@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 05:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234607

On Fri Apr 3, 2026 at 7:07 PM CEST, Yoann Congal via lists.openembedded.org=
 wrote:
> On Fri Apr 3, 2026 at 6:47 PM CEST, Mathieu Dubois-Briand via lists.opene=
mbedded.org wrote:
>> On Fri Apr 3, 2026 at 1:54 PM CEST, Paul Barker wrote:
>>> tar 1.34 (and possibly earlier versions) is unable to extract tarballs
>>> containing read-only files with xattrs. This was fixed upstream, but
>>> it's unlikely at this point that the fix will be backported to RHEL9
>>> related distros (CentOS Stream 9, AlmaLinux 9, Rocky Linux 9). The issu=
e
>>> affects these distros specifically because they have selinux enabled by
>>> default and this uses xattrs.
>>>
>>> The specific failure we've seen is with the /usr/lib/udev/hwdb.bin file
>>> installed by the systemd recipe - this file is chmod 0444. This leads t=
o
>>> the following error, typically during do_image_wic (shortened and split
>>> to make it readable):
>>>
>>>     subprocess.CalledProcessError: Command
>>>     'tar --xattrs --xattrs-include=3D'*' -cf - -S -C .../tmp/work/qemux=
86_64-poky-linux/core-image-minimal/1.0/rootfs -p . |
>>>     tar --xattrs --xattrs-include=3D'*' -xf - -C .../tmp/work/qemux86_6=
4-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs2'
>>>     returned non-zero exit status 2.
>>>
>>> That error message is likely to confuse users, and the fix is not
>>> obvious. So, error out if tar 1.34 or earlier is present on affected
>>> distros and recommend upgrading or using the buildtools tarball.
>>>
>>> Signed-off-by: Paul Barker <paul@pbarker.dev>
>>
>> Hi Paul,
>>
>> So now, this is failing on several workers. Aren't we using buildtools
>> on rocky9 / stream9?
> You're thinking of "[PATCH yocto-autobuilder-helper] config.json: Use bui=
ldtools on RHEL9 derivatives"
> https://lore.kernel.org/yocto-patches/20260331-rhel9-v1-1-e5c2cf815386@pb=
arker.dev/T/#u
> ... not merged, yet.
>

Thanks! For some reason I thought it was merged.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


