Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AB5C624DF
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 12:11:48 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12235.1771762302252952409
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 04:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DawTYXG1;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4359249bbacso2612028f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 04:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771762301; x=1772367101; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTBsfkL027rCswQdkjhpxKVnr6359e88xah8EIh7fMA=;
        b=DawTYXG1G9P7kkpetV7iQgua3uO7B40Sv33wkv+SK7Ihvhxz/ObNbRkA2O4qvdIcym
         fh7U7xHII7FoIPtZNVEzNpgZBrv1yUpMGVp/p7e3r67U1oEqKNmIzynJtspOL4XSUdz7
         g61fxvHjlAGwpTgcspobS9aVdmnHgJv1LOeC97mFf/B6wG1AXm3AIslRXmXFyGF+p15k
         xaK7zho66u2Q2iNU91T2u5SJjx0tko2UeydvagXSEIHHYtlR7gOGNEKP1lzcLeqMK9K0
         ccwDdAZeyrir2DFXK2H3JXvBt3EVLIHi06OZSnkUaq4m4+P9K4xLETfF8wLLn8pK6AtK
         z22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771762301; x=1772367101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTBsfkL027rCswQdkjhpxKVnr6359e88xah8EIh7fMA=;
        b=wWc81l60x+yEZSrm3P0R50Nyzzf7LkvJQYfDyP5tOfYW9NlmAMf8RsoBzV56xu8abK
         qmS9rzFYfNCp2g+ooK1/b7Qmu/WiHGOY2jt0PzrS2S9zmvM1AEfo5daAixFTR+dOCbYi
         sC52O2t6MzZCq8IukbaJI61T2J3SuSfvCTyhghVKn8NSB9XUnKrNKIMnTfvhf6F5kV7D
         +/5htlaMG9cuzeNFiE7xydufxA/2o+c8hTINZhy4vZWEMwB4khkTnoMn7qIJ3LC0F3+p
         KJFOtSWNeyMeQW06iTmU5mL7LwEF4DFohvpeOUqxUmlD1kbHen2+z/OE9a6A6ey4iInd
         47Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVlU6/fIWp3NevnAdN5K5DuFMuxPBUkCQl0niR0tkK73BeBoZo/dTFKvOS+9NE64q5zLpMDn7cYoW+eHTZ5yIzHGg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyV5VamoslD9OJVNSb6UvRStqXWF9PALnrVXKGLS/7h33FLHAsJ
	m9WjyBCgQbLNIf8DGjJaCSgcaWi4N9B8Cce8QvksbL/FBdTKTuT35rnF
X-Gm-Gg: AZuq6aLfqFvIW75XdeBX5bfstAVgvyUwXwl+PuFUDAo8FYI5odZumNmiHzbpxlj30GY
	Jmbh2XCX9ZEClbJqZ1l1jlzW73boPAeA/xOdoeahoswLUrvlb0zYD/ESq23x+/Ba3j4OS7bU64b
	cMfBSeXoArbN07B+AfqWxWx97nTP1MJa+XTfNzD4coO4UAEKMdVMheZwVn/2nxeo68ZlpcICQ+C
	Y+cb82LfvcKkYF9YHp2owMWZn98/LY2iQ8XYriVvwc+F41uj2lqHhYL0dRwX/cTGhW9KS8+IGlD
	DH/BjlE0npTNc3a9h/qyydfhiimouWg61FnIDFP/JQPL/SglONKpmRcb08lybSedYAHXc/bC9U5
	1hhF726WAGjG5ZrGF+HA6SlCHTvULU+QWsSgqN9rAQ+VADqIQtbZIJZ6JAldm1phV4jKiDS4dOW
	t6Mm/5RiM1v8YPi50nV0rDGM7MzpI6OTEuCCfrFN26ffoAXL0DIM1BKlc8dEsmdDquxqOcZVuM
X-Received: by 2002:a05:6000:1a8a:b0:436:4ba:59a8 with SMTP id ffacd0b85a97d-439625c9b6fmr21398256f8f.3.1771762300380;
        Sun, 22 Feb 2026 04:11:40 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4cc81sm11104629f8f.26.2026.02.22.04.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 04:11:39 -0800 (PST)
Message-ID: <98d2f7fa5179720e9579af4e55af7af49abe2a5e.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: remove dependency on
 initramfs when not bundled
From: adrian.freihofer@gmail.com
To: mathieu.dubois-briand@bootlin.com, adrian.freihofer@siemens.com, 
	openembedded-core@lists.openembedded.org
Date: Sun, 22 Feb 2026 13:11:39 +0100
In-Reply-To: <DGIA36GNR4J5.1T52ZELIA28Y9@bootlin.com>
References: <20260217173225.101935-1-adrian.freihofer@siemens.com>
	 <DGIA36GNR4J5.1T52ZELIA28Y9@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 12:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231631

On Wed, 2026-02-18 at 18:53 +0100, Mathieu Dubois-Briand via
lists.openembedded.org wrote:
> On Tue Feb 17, 2026 at 6:32 PM CET, Adrian Freihofer via
> lists.openembedded.org wrote:
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > Previously, the kernel recipe depended on the initramfs image even
> > when
> > INITRAMFS_IMAGE_BUNDLE was not enabled. This caused the kernel to
> > be
> > rebuilt whenever the initramfs image changed, regardless of whether
> > the
> > kernel actually included the initramfs.
> >=20
> > The problematic chain was:
> > =C2=A0 linux:do_deploy ->
> > =C2=A0 linux:do_bundle_initramfs ->
> > =C2=A0 image-initramfs:do_image_complete
> >=20
> > The original intent (acc. to the comment) was to ensure the
> > initramfs
> > image was available for tools like wic. However, apart from
> > bundling the
> > initramfs in the kernel, there is probably no reason why the kernel
> > should depend on the initramfs. And it is therefore simply wrong if
> > it
> > does so anyway. Thus, use cases that may be broken by these change
> > are
> > based on a bug, not a feature. This needs to be fixed by adding a
> > dependency on the initramfs in the right place, not in the kernel
> > where
> > this destroys the kernel's sstate-caching.
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
>=20
> Hi Adrian,
>=20
> It looks like this is causing some build issues. I only saw them on
> ARM64 so far:
>=20
> ERROR: core-image-full-cmdline-1.0-r0 do_image_wic: Execution of
> '/srv/pokybuild/yocto-worker/genericarm64-
> alt/build/build/tmp/work/genericarm64-poky-linux/core-image-full-
> cmdline/1.0/temp/run.do_image_wic.2336354' failed with exit code 1
> ...
> > INFO: Creating image(s)...
> ...
> > ERROR: _exec_cmd: cp -v -p /srv/pokybuild/yocto-
> > worker/genericarm64-
> > alt/build/build/tmp/deploy/images/genericarm64/core-image-
> > initramfs-boot-genericarm64.cpio.gz /srv/pokybuild/yocto-
> > worker/genericarm64-alt/build/build/tmp/work/genericarm64-poky-
> > linux/core-image-full-cmdline/1.0/tmp-wic/hdd/boot returned '1'
> > instead of 0
> > output: cp: cannot stat '/srv/pokybuild/yocto-worker/genericarm64-
> > alt/build/build/tmp/deploy/images/genericarm64/core-image-
> > initramfs-boot-genericarm64.cpio.gz': No such file or directory
> >=20
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3228
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3202
>=20
> Can you have a look at what is going wrong?


Thank you!
Here is a v2 which should address this issue:
https://lists.openembedded.org/g/openembedded-core/message/231629

Adrian

>=20
> Thanks,
> Mathieu
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231315):
> https://lists.openembedded.org/g/openembedded-core/message/231315
> Mute This Topic: https://lists.openembedded.org/mt/117860606/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

