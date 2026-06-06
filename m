Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDFDCD8C85
	for <webhook@archiver.kernel.org>; Sat,  6 Jun 2026 12:23:07 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14936.1780748579220774830
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jun 2026 05:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jdJCTZmD;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4908b92904fso31893015e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2026 05:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780748577; x=1781353377; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RmX+mwtbeUbxHmrE1R9G3nlNGONdn27BYRcPiqctm3Y=;
        b=jdJCTZmD7vByIqiOcvxV/ucMuNGhNHE95TIUHdsHlncn5+nHF1T0hoziQEMDvCPvuq
         ig4Vk4t0ffghciR4ioN2x9CGmzqrh7eN5TON5Uy/5Fvabsz8n1qpJfC42DV0ng9awsC9
         txE1YqLfDLFnPc+ev4R7JsCHsbdagV186X0VLfeOAK+C6sZvmg9aU4+UdSKkOfYrGmiM
         eQgu3hzVGBf5Lxu5B7/zCX6S6HS7D3ddmP5T7+71QmvCXxoChWUfAJh82kLI7RY0FNF5
         06S7IAp8VOj2IvaP8/iFQJ8gZeu5+6kM7ccO1UVU667aWTX1ga7kTAw9MUqO3+yjN9/X
         upPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748577; x=1781353377;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RmX+mwtbeUbxHmrE1R9G3nlNGONdn27BYRcPiqctm3Y=;
        b=mGJ7L79KR2GVvsshk7P3s+x6qEgpFEkRPP/upf3pf1u+BnHdIIzgv0nHADjqhCw0dY
         JnnlpYp0XrEJ25DyLoiDDMNueqoQ77xlFQ4escSGatGcU6H7d/KWKRw0+j/gaAmPkWMH
         E/lt5hF+X91Pauwx6WStLwlJrMLhrVACHm8Vom2ac6YZbXOTeVCGRa9Cdkymr9+UCp2z
         eVUXqCDE1ftts9fbS1BJ+MbhBfkRbmLWa/KibcEcxUD/u6vWKu6Q07MUQwW9NKLJLEbf
         wep0TEQECp373J6J1U6+A1/0CcDvIn1XP/WEo9n3kRerb8JB7Hza6R1hSL+cTUCc2obV
         Lchg==
X-Forwarded-Encrypted: i=1; AFNElJ91hAkJW76cE9mdi9TbOPI6PpkIXmBF/I7uxbc8rBUCn6MAQ3oGIofjS/l3zgCy31xKlP9taX7vEd367sr16MekSA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLu1JqEZRTxi1fjYNIRsbt7XpSt4El41IhOBiqs9e9wNfUOAHh
	rCvSDRM4XJWUvcg7MHpWYX73OvxQb5GzvpGvXhoLNlUaFJg9wD1BLt+F
X-Gm-Gg: Acq92OE3wZAxiWIC78E/3DAQoAM0mH+SH0rXFTGqACt6xPjL9WphEos3q9OybIvaByX
	bKrW6a0pG5B+WM0ds3kksQzHeZmTH8Kyi2cVpBmTXsh2eybNtf2h5h5JGvG/ZFp9VbczmmkL/jk
	ugTdF6NRl4LznmKnCyWAMtKJU6BnxPQlLeYwn+B2hT5I88At1XKTIMQcXda+kYT8uEojNxJrBrw
	vjBlxgVn9w2w9Nx+/5vI9eDOsTVrPUaYJW9uRYZjEbHvYC+JvmEJ256AUpvKCZ7yBzqSqYhEdYT
	NIrZNMJmrWtWpLrxr3qGbpwF+IaQvTuoq76VWp37rv9lweWvp1fdnNPZwJbHhOhvGaM2AYLIngM
	zfi+zPktMQMKpWWdrHoYAMe/JON4whk7fceebW9Wc+tVLPSjBck6DL8+HFBja38pIIG0kQKb/yE
	dX/k5I1B8mn0SIlNPoBeHAj9KK5KG9N+yl95nxHZmJCadnhvit2PAKW+K/+ngQbSUKspWZY7Uze
	4QIjFL1wkGh7MAjtp6l1w==
X-Received: by 2002:a05:600c:a48:b0:490:b1df:de4 with SMTP id 5b1f17b1804b1-490c2622b4bmr129413005e9.22.1780748577293;
        Sat, 06 Jun 2026 05:22:57 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcae2sm36320500f8f.6.2026.06.06.05.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:22:56 -0700 (PDT)
Message-ID: <1dc5fb556362c555d7d6e1d71565f29cbc283409.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] oe-selftest: fitimage: support new
 schema for uboot configuration signing
From: adrian.freihofer@gmail.com
To: rybczynska@gmail.com
Cc: mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org
Date: Sat, 06 Jun 2026 14:22:55 +0200
In-Reply-To: <DJ0WX33YW3NU.1SJXTUGODRTOX@bootlin.com>
References: <20260603105453.25881-1-marta.rybczynska@ygreky.com>
	 <20260603105453.25881-2-marta.rybczynska@ygreky.com>
	 <DJ0WX33YW3NU.1SJXTUGODRTOX@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2026 12:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238220

On Fri, 2026-06-05 at 08:47 +0200, Mathieu Dubois-Briand via
lists.openembedded.org wrote:
> On Wed Jun 3, 2026 at 12:54 PM CEST, Marta Rybczynska via
> lists.openembedded.org wrote:
> > From: Marta Rybczynska <rybczynska@gmail.com>
> >=20
> > Modify testcases after adding signing of a configuration of uboot
> > instead
> > of various sections separately.
> >=20
> > This change includes an additional parameter to _check_signing that
> > allows
> > more flexible configuration and avoids assumptions on what section
> > has,
> > and which section does not have a signature - now they are defined
> > in a data structure.
> >=20
> > Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
> > ---
>=20
> Hi Marta,
>=20
> Thanks for the new version.
>=20
> It looks like we still have some failing selftests:
>=20
> 2026-06-04 10:59:24,072 - oe-selftest - INFO -
> fitimage.UBootFitImageTests.test_sign_standalone_uboot_atf_tee_fit_im
> age (subunit.RemotedTestCase)
> 2026-06-04 10:59:24,073 - oe-selftest - INFO -=C2=A0 ... FAIL
> ...
> ERROR: u-boot-1_2026.04-r0 do_uboot_assemble_fitimage: Execution of
> '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-
> 3150517/tmp/work/qemuarm-poky-linux-gnueabi/u-
> boot/2026.04/temp/run.do_uboot_assemble_fitimage.4036817' failed with
> exit code 1
> ...
> > sha256,rsa2048:spl-oe-selftest-
> > =C2=A0error!
> > Verification failed for '(null)' hash node in 'conf' config node
> > Failed to verify required signature 'key-spl-cascaded-oe-selftest'
> > Signature check bad (error 1)
> > WARNING: exit code 1 from a shell command.
> NOTE: recipe u-boot-1_2026.04-r0: task do_uboot_assemble_fitimage:
> Failed
> ...
> 2026-06-04 11:00:25,624 - oe-selftest - INFO -
> fitimage.UBootFitImageTests.test_sign_standalone_uboot_fit_image
> (subunit.RemotedTestCase)
> 2026-06-04 11:00:25,625 - oe-selftest - INFO -=C2=A0 ... FAIL
> ...
> ERROR: u-boot-1_2026.04-r0 do_uboot_assemble_fitimage: Execution of
> '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-
> 3150517/tmp/work/qemuarm-poky-linux-gnueabi/u-
> boot/2026.04/temp/run.do_uboot_assemble_fitimage.4134657' failed with
> exit code 1
> ...
> > Signature check bad (error 1)
> > Verifying Hash Integrity for node 'conf'... sha256,rsa2048:spl-oe-
> > selftest+
> > sha256,rsa2048:spl-oe-selftest-
> > =C2=A0error!
> > Verification failed for '(null)' hash node in 'conf' config node
> > Failed to verify required signature 'key-spl-cascaded-oe-selftest'
> > WARNING: exit code 1 from a shell command.
> NOTE: recipe u-boot-1_2026.04-r0: task do_uboot_assemble_fitimage:
> Failed
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4050
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3964
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3820
>=20
> Can you have a look at the issue?
>=20

Hi Marta

I hope this one
https://lists.openembedded.org/g/openembedded-core/message/238219 will
fix this issue.

Regards,
Adrian


> Thanks,
> Mathieu
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238142):
> https://lists.openembedded.org/g/openembedded-core/message/238142
> Mute This Topic: https://lists.openembedded.org/mt/119626514/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

