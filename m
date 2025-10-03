Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBF2CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 15:20:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.10276.1759504828401831665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 08:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tndttJOx;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 57128C00DA7;
	Fri,  3 Oct 2025 15:20:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5CF0060683;
	Fri,  3 Oct 2025 15:20:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24FEA102F1C37;
	Fri,  3 Oct 2025 17:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759504825; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cCtvMg4D+Lh5OhvUqbM9yXu5So96Su5tnZm2BIWOlU8=;
	b=tndttJOxXg5aMnbd4iDyJC+DgWB11lRWEyT++rr4eFRd3Jg+AOzyTDY5I1b7JNblEc3z0M
	4zLnIXjQL76IAKc1GujVOmMN2YWpQt6onX4jkIsrdpfL27l06DQWEsIM475SSgf0BqTO18
	mf///edjvRzYeaxbjE9wYTpdVJ3gIHHeBty6S49vVUZQE6zcPimaYiXsDoj0Lpa/CQO8/J
	SmwDoT5obvlyb4z5nzIJNaXjFgO4PABFDhg/XFlSx5lFn7glr1s14Gx2oYghGnBgujHwk9
	GPTUW2xnGDwapfdk+cQ6oYbkAlvQX92OpzlvKBQMKU+Q67mKYsULOqH11iPapQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 17:20:24 +0200
Message-Id: <DD8SELHX4UAB.MPYI46KKMURF@bootlin.com>
Subject: Re: [PATCH v5 1/2] wic: add --extra-partition-space option to set
 unused space
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250903144528.2248743-1-pierre-loup.gosse@smile.fr>
 <DD8SAYMI039W.2BNRYZDREQTNO@bootlin.com>
In-Reply-To: <DD8SAYMI039W.2BNRYZDREQTNO@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 15:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224397

On Fri Oct 3, 2025 at 5:15 PM CEST, Mathieu Dubois-Briand wrote:
> On Wed Sep 3, 2025 at 4:45 PM CEST, pierre-loup.gosse wrote:
>> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>>
>> By default, the content of the partition is filled by the filesystem
>> without leaving any unused free space. The --extra-space flag adds
>> extra space to the filesystem size, not to the partition.
>>
>> Unused free space after the filesystem can be useful for some cases,
>> such as encrypting a partition at runtime.
>> With --extra-partition-space 32M, we ensure that the last 32M of the
>> partition is unused: this space does not contain filesystem data and
>> can store the LUKS2 header.
>>
>> The implementation sets a difference between the partition and
>> filesystem size:
>>   - With --fixed-size, the extra part space is removed from the
>>     filesystem size.
>>   - Otherwise (with or without --size flag), the extra part space is
>>     added to the partition size.
>>
>> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>>
>> CC: Alexander Kanavin <alex.kanavin@gmail.com>
>> CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> ---
>
> Hi Pierre-Loup,
>
> Thanks for the new version.
>
>> +    def test_extra_partition_space(self):
>> +        native_sysroot =3D get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-too=
ls")
>> +
>> +        with NamedTemporaryFile("w", suffix=3D".wks") as tempf:
>> +            tempf.write("bootloader --ptable gpt\n" \
>> +                        "part                 --ondisk hda --size 10M  =
      --extra-partition-space 10M --fstype=3Dext4\n" \
>> +                        "part                 --ondisk hda --fixed-size=
 20M  --extra-partition-space 10M --fstype=3Dext4\n" \
>> +                        "part --source rootfs --ondisk hda             =
      --extra-partition-space 10M --fstype=3Dext4\n" \
>> +                        "part --source rootfs --ondisk hda --fixed-size=
 200M --extra-partition-space 10M --fstype=3Dext4\n")
>> +            tempf.flush()
>> +
>> +            _, wicimg =3D self._get_wic(tempf.name)
>> +
>> +            res =3D runCmd("parted -m %s unit b p" % wicimg,
>> +                            native_sysroot=3Dnative_sysroot, stderr=3Ds=
ubprocess.PIPE)
>> +
>
> This fails when "parted" is not installed on the host machine:
>
> 2025-10-03 13:42:20,053 - oe-selftest - INFO - 9: 73/93 615/639 (37.32s) =
(0 failed) (wic.Wic2.test_extra_partition_plugin)
> 2025-10-03 13:42:20,053 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/selftest/cases/wic.py", line 1683, in test_extra_partition_plugin
>     self.assertEqual('4', result.output, msg=3D"Expect 3 partitions, not =
%s" % result.output)
>   File "/usr/lib/python3.11/unittest/case.py", line 873, in assertEqual
>     assertion_func(first, second, msg=3Dmsg)
>   File "/usr/lib/python3.11/unittest/case.py", line 1253, in assertMultiL=
ineEqual
>     self.fail(self._formatMessage(msg, standardMsg))
>   File "/usr/lib/python3.11/unittest/case.py", line 703, in fail
>     raise self.failureException(msg)
> AssertionError: '4' !=3D "ERROR: Can't find executable parted\n1"
> - 4
> + ERROR: Can't find executable parted
> 1
>  : Expect 3 partitions, not ERROR: Can't find executable parted
> 1
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2456
>
> You can easily reproduce this on a test machine by removing parted from
> the host. Also, test_wic_sector_size use parted but does not show the
> same issue:
>
> oe-selftest -r wic.Wic.test_wic_sector_size
> ...
> 2025-10-03 15:05:58,051 - oe-selftest - INFO - RESULTS - wic.Wic.test_wic=
_sector_size: PASSED (94.37s)
>
> I believe this comes from the following line and the associated
> try/finally block to revert to the default PATH variable:
>
> os.environ['PATH'] =3D get_bb_var("PATH", "wic-tools")
>
> Can you use something similar?
>
> Thanks,
> Mathieu

And now I see that this patch is merged and I'm replying to a mail sent
a month ago... Sorry.

Still, this will lead to intermittent failures, can you take a bit of
time to send a fix?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


