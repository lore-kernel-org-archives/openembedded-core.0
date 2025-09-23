Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808E1CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 18:45:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.5368.1758653095960781763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 11:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eDPygz+r;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 341BF4E40CAD;
	Tue, 23 Sep 2025 18:44:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E486560690;
	Tue, 23 Sep 2025 18:44:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0B97102F173F;
	Tue, 23 Sep 2025 20:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758653093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z7lLEe37yy+jGvM5xnDMmS+YQvKRxrfTrhN/cVPIRfA=;
	b=eDPygz+rmgy9WaCpMo/qZ2x2BE4zj+5lHnu8hNTrvIGu86m6PUpHR96CXtS680kAfDWVYe
	M1pq+8HSjhYdk6/Sq/wO8+bm4MyfV3OPVM0zXLpNQ3bkXWxnEEGyFd3VBRH7/zKHWjXnOV
	xStMAyTo/oQE0BcLX8xsMqr+VAcNrOjUIkwiEST+HMPP+5IGWD4H6h/UjGLOBUWFe7vgK8
	buC9pmEt7rmlv/otDwmpZZinkfwEnJ9wacQmnG2npWoKyocrnsZwkf0eSCtlCHCHqkjRjR
	TPnBYkEnnZ4+0AAy3rHMF/7a79euBRQW6cyRp8jZiUZuJ7QuK3CyA4GOyvPN5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Sep 2025 20:44:47 +0200
Message-Id: <DD0EHMY9ITYL.3KAYD72BZUUIJ@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/1] wic: updated fstab does not preserve
 metadata of the original file
Cc: <hongxu.jia@windriver.com>, <trevor.woerner@linaro.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Daniel Andrade" <dani.barra25@gmail.com>, "Randy MacLeod"
 <randy.macleod@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250902190555.7929-1-dani.barra25@gmail.com>
 <DCK51OC59LCA.XXERUU1OP7Y@bootlin.com>
 <16907d6c-a28d-4369-95fd-199fcccba105@windriver.com>
 <CA+-=zY2PzZ3RqtzLbFzd6TxSdBVft2KrSvzKQqP2oxZZUMnWhg@mail.gmail.com>
 <CA+-=zY09Um_hG1knpWFBRHx-mTBgNUN3vH9WA0nhiY7ub-PKvw@mail.gmail.com>
In-Reply-To: <CA+-=zY09Um_hG1knpWFBRHx-mTBgNUN3vH9WA0nhiY7ub-PKvw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 18:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223910

Hi Daniel,

Sorry, but I'm not sure to get your point.

I ran the test locally, and it does fail. It also fails if I modify it
to use squashfs instead of ext4.

My reproduction procedure:
git clone https://git.yoctoproject.org/poky-ci-archive -b autobuilder.yocto=
project.org/valkyrie/a-full-2320
. oe-init-build-env
echo 'SANITY_TESTED_DISTROS =3D ""' >> conf/local.conf
oe-selftest -r wic.Wic.test_no_fstab_update

Thanks,
Mathieu

On Tue Sep 23, 2025 at 5:05 PM CEST, Daniel Andrade wrote:
> Good Afternoon,
>
> I have been trying to figure it out and something seems off.
> The specific test you refer to may be hiding a problem or maybe I have my
> testbench compromised and I would like your help to test.
> The test `test_no_fstab_update ` verifies if the fstab was updated or not
> because on the wks file used to do it there is a --no-fstab-update. The
> thing is, I think this test is passing because what is forcing it to not
> update is a constraint that I removed previously on the patch (the one th=
at
> checks if the system is ext* or msdos) and not because the flag is
> triggering its intended functionality.
> The crosscheck I did was modifying the fstype from ext4 to squashfs and
> indeed the test failed.
> Can someone also verify this?
>
> Daniel
>
> Daniel Andrade <dani.barra25@gmail.com> escreveu (s=C3=A1bado, 13/09/2025=
 =C3=A0(s)
> 11:02):
>
>> Hello guys, sorry for the delay.
>> I have been busy, but I hope to provide you with a fix in the next few
>> days.
>>
>> Sorry about that,
>> Daniel
>>
>> Randy MacLeod <randy.macleod@windriver.com> escreveu (quinta, 11/09/2025
>> =C3=A0(s) 17:56):
>>
>>> On 2025-09-04 11:58 a.m., Mathieu Dubois-Briand via
>>> lists.openembedded.org wrote:
>>>
>>> On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via lists.openembedded=
.org wrote:
>>>
>>> From: Daniel Andrade <dani.barra25@gmail.com> <dani.barra25@gmail.com>
>>>
>>> Using `install` in the rootfs plugin forces fstab to be replaced entire=
ly, meaning that even its Inodes will change, leading xattrs and SELinux co=
ntext stored by pseudo not to be applied.
>>> The fix just uses `cp` without preserving attributes from the temporary=
 fstab since none of them are needed, just the content.
>>> Same thing happens with the predefined mechanisms for ext4 and msdos. U=
sing debugfs there is no way to replace contents while maintaining metadata=
, so the approach taken on the path was to remove the different fstab logic=
 for those fstypes and also use the same modified cp command. Reviewing the=
 builds I did it seems to work for all of the fstypes.
>>>
>>> Another problem is that the timestamp applied to fstab is not the same =
as every other file. It seems like the `SOURCE_DATE_EPOCH` variable goes to=
 the fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
>>> Since you are using that variable everywhere, it is not the same value =
as ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.conf` tha=
t is applied in every other file.
>>>
>>> Daniel Andrade (1):
>>>   wic: Content of the temporary updated fstab should be copied into the
>>>     original not replacing it entirely.
>>>
>>>  meta/conf/bitbake.conf                   |  4 +++-
>>>  scripts/lib/wic/partition.py             | 15 +--------------
>>>  scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
>>>  3 files changed, 6 insertions(+), 17 deletions(-)
>>>
>>> Hi Daniel,
>>>
>>> Thanks for your patch.
>>>
>>> It looks like it is breaking a test:
>>>
>>> 2025-09-04 15:28:11,112 - oe-selftest - INFO - wic.Wic.test_no_fstab_up=
date (subunit.RemotedTestCase)
>>> 2025-09-04 15:28:11,113 - oe-selftest - INFO -  ... FAIL
>>> ...
>>> 2025-09-04 15:28:11,114 - oe-selftest - INFO - testtools.testresult.rea=
l._StringException: Traceback (most recent call last):
>>>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/=
oeqa/selftest/cases/wic.py", line 859, in test_no_fstab_update
>>>     self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
>>>   File "/usr/lib/python3.12/unittest/case.py", line 885, in assertEqual
>>>     assertion_func(first, second, msg=3Dmsg)
>>>   File "/usr/lib/python3.12/unittest/case.py", line 1251, in assertMult=
iLineEqual
>>>     self.fail(self._formatMessage(msg, standardMsg))
>>>   File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
>>>     raise self.failureException(msg)
>>> AssertionError: 'af3c087d6c9131735c8d1f270a226892' !=3D '9edb8255abd217=
fdb20e118833afb856'
>>> - af3c087d6c9131735c8d1f270a226892
>>> + 9edb8255abd217fdb20e118833afb856
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2412=
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2268
>>>
>>> Can you fix it please?
>>>
>>> Ping?
>>>
>>> I think this is being tracked by:
>>>
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15947
>>>
>>> "WIC does not preserve metadata when updating fstab"
>>>
>>> Btw, we were just following the "Need Info" process during the bug revi=
ew
>>> meeting
>>> so that's why I'm sending this email.
>>>
>>> ../Randy
>>>
>>> Thanks,
>>> Mathieu
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#222962): https://lists.openembedded.org/g/openembed=
ded-core/message/222962
>>> Mute This Topic: https://lists.openembedded.org/mt/115043355/3616765
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>>
>>> --
>>> # Randy MacLeod
>>> # Wind River Linux
>>>
>>>




--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


