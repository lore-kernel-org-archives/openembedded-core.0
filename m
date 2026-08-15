Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06426C5AD5A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 05:30:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3715.1786771816915405154
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 22:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HPPH76bO;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B16D44E41233;
	Sat, 15 Aug 2026 05:30:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76BB2604AA;
	Sat, 15 Aug 2026 05:30:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF6E411C4F382;
	Sat, 15 Aug 2026 07:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786771809; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=liQJT/cYTIsRAINW9FXEpDTe6s+iDyjJEFdShpoLdVw=;
	b=HPPH76bOPBspYKsYsj8vMstgG4QKT9eel+A1Axkl5/w5wFxRLQuD3PxyPK5/5UL/AYfHL+
	jvA0mO2cNR8WBVNiWNlB1c3mofa07A70lnpcwA6bQrzZOzaKxLTbFwEWdnRue2iwaXuX5E
	JYfbMHdmg+m3+xujzES+ToMtyG5ag3mwt1FGrfZqNkcPN0AW7+WWxaWTtOM8iTByDurdYS
	Sq6g+XmHIuxu/VU2SS91xDpPbSXpeOeyzNIfsHaEvIFH+CBpioN2uht1e5RYosuCKZUuKb
	gAVCYKa5ZPhx71LnYQR8+11ZY7YpbhK8cz1fQvBxhGcMeyj+ZZjIC/rAskZ1Qw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Aug 2026 07:30:04 +0200
Message-Id: <DKP9QR622BEY.1JP3LFV6R35WN@bootlin.com>
Subject: Re: [PATCH v14 00/10] rpm: 4.20.1 -> 6.0.2
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "mattware@cisco.com"
 <mattware@cisco.com>, "esparlin@cisco.com" <esparlin@cisco.com>,
 "peter.marko@siemens.com" <peter.marko@siemens.com>, "MacLeod, Randy"
 <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Gavini, Sumanth" <sumanth.gavini@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260812234900.866436-1-sumanth.gavini@windriver.com>
 <DKNRRQM7Q3FN.34QV9VN15JGBS@bootlin.com>
 <4ebd8940-a044-4c14-8434-960ffbb0d525@windriver.com>
In-Reply-To: <4ebd8940-a044-4c14-8434-960ffbb0d525@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 05:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243469

On Sat Aug 15, 2026 at 4:16 AM CEST, Sumanth Gavini wrote:
> On 8/13/2026 6:12 AM, Mathieu Dubois-Briand wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>=20
>> On Thu Aug 13, 2026 at 1:48 AM CEST, Sumanth Gavini wrote:
>>> * V14:
>>>      - Dropped "rpm: filter /usr/bin/pkg-config from RPM auto-generated=
 Requires"
>>>      (pkgconfigdeps.sh patch). Per Ross Burton's review, instead of sup=
pressing
>>>      the /usr/bin/pkg-config emission, added:
>>>        RPROVIDES:${PN} +=3D "pkgconfig /usr/bin/pkg-config"
>>>      to the pkgconf recipe so it satisfies the auto-generated Requires =
without
>>>      modifying the upstream rpm script.
>>>
>>>     - Removed /usr/bin/pkg-config from nativesdk-sdk-provides-dummy.bb.
>>>       RPM 6's internal dependency generator auto-detects file-level Pro=
vides
>>>       from installed files, so nativesdk-pkgconf already provides
>>>       /usr/bin/pkg-config via the wrapper script it installs. Keeping t=
he
>>>       dummy entry caused a DNF conflict during do_populate_sdk:
>>>         nativesdk-sdk-provides-dummy conflicts with /usr/bin/pkg-config
>>>         provided by nativesdk-pkgconf
>>>
>>>     - Added "libarchive: Disable RPM filter auto-bidding" (0005 patch).
>>>       With both the RPM filter and RPM format reader registered, the fi=
lter
>>>       intercepted RPM files first and failed to parse RPM 6 packages
>>>       (debuginfod scanning still failed after the 0004 patch). Disablin=
g the
>>>       filter's automatic bidding lets the format reader handle RPM file=
s,
>>>       while archive_read_append_filter(ARCHIVE_FILTER_RPM) still works
>>>       explicitly, keeping test_read_append_rpm_filter passing.
>>>
>>>     - Updated 0004-Convert-RPM-reader-into-a-proper-format.patch to inc=
lude
>>>       the test_read_format_huge_rpm.c changes from upstream PR #2846. T=
his
>>>       test now correctly exercises the format reader instead of the fil=
ter.
>>>
>>>     - Updated patches 7,9 and 10 for the latest master changes; no code
>>>       changes; removed upstream modifications
>>>
>>>     Tests verified:
>>>       - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
>>>       - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native
>>>       - oe-selftest -r sdk.SDKTests.test_sdk_manifests
>>>       - oe-selftest -r sdk.SDKTests.test_sdk_runqemu
>>>       - bitbake core-image-ptest-libarchive:do_testimage
>>>       - bitbake core-image-sato -c populate_sdk
>>>       - bitbake core-image-sato-sdk:do_rootfs
>>>
>>=20
>> Hi Sumanth,
>>=20
>> We again have some pkgconfig errors. I suspect it's the same issue as
>> for the previous series: the generated recipe signatures are the same as
>> before, so we are re-using old data from the sstate-cache.
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4439
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/4413
>>=20
>> I also note a new failure:
>>=20
>> Error:
>>   Problem 1: conflicting requests
>>    - nothing provides /usr/bin/pkg-config needed by acl-dev-2.4.0-r0.cor=
texa57 from oe-repo
>>   Problem 2: conflicting requests
>>    - nothing provides /usr/bin/pkg-config needed by eudev-dev-3.2.14-r0.=
cortexa57 from oe-repo
>>   Problem 3: conflicting requests
>>    - nothing provides /usr/bin/pkg-config needed by kmod-dev-34.2-r0.cor=
texa57 from oe-repo
>>   Problem 4: conflicting requests
>>    - nothing provides /usr/bin/pkg-config needed by libz-dev-1.3.2-r0.co=
rtexa57 from oe-repo
>>   Problem 5: conflicting requests
>>    - nothing provides /usr/bin/pkg-config needed by openssl-dev-3.5.7-r0=
.cortexa57 from oe-repo
>>   Problem 6: conflicting requests
>>    - nothing provides /usr/bin/pkg-config needed by util-linux-dev-2.42.=
2-r0.cortexa57 from oe-repo
>>   Problem 7: conflicting requests
>>    - nothing provides /usr/bin/pkg-config needed by xz-dev-5.8.3-r0.cort=
exa57 from oe-repo
>> (try to add '--skip-broken' to skip uninstallable packages or '--setopt=
=3Doptional_metadata_types=3Dfilelists' to load additional filelists metada=
ta)
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/4371
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4269
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4286
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/942
>>=20
>> As usual, the detailed configuration can be found in the "Write config"
>> step.
>>=20
>> Thanks,
>> Mathieu
>>=20
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>=20
>
> Hi Mathieu,
>
> Looks like this is an sstate reuse issue. The pkgconfigdeps.sh fix is in=
=20
> the rpm recipe (used by both rpm and rpm-native via BBCLASSEXTEND), and
> do_package_write_rpm does declare a proper dependency on=20
> rpm-native:do_populate_sysroot. Despite that, I'm seeing the shared=20
> sstate cache and hash-equivalence server serve prebuilt RPMs for zlib,=20
> glib-2.0, etc. that predate the fix.
>
> I confirmed locally: disabling sstate mirrors and rebuilding from=20
> scratch fixes it, no missing pkgconfig() Provides errors. Could you=20
> retry with sstate disabled to confirm on your end?
>
> Thanks,

Hi Sumanth,

I did that already with the previous series, as stated in my comments
there. Yes, disabling sstate or changing PR values mask the issue.

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


