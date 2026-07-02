Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D69EC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 07:47:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64006.1782978447422035908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 00:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vMFtOy0R;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BFEBDC4FED2
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 07:47:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7AA055FF03;
	Thu,  2 Jul 2026 07:47:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0535B104C8351;
	Thu,  2 Jul 2026 09:47:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782978445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=83nz0npG/SixR02UAIvCxOnlJzeYSDxtazqBAWOSuiA=;
	b=vMFtOy0RdoSnWzqufUPt6CynMe5q1Eqsn5Oea9C3e96TtdnJw0UT+uhxcSJWZQOjXE8ze9
	AVMuMCww3zQhNbGAzHf1PP1C6MkPK8/fLYIxHjOB3LMNEdvzbUhYlcLNxci2gYIH+Impxr
	mzBm2ywEY6Cmp7GRiMymTKEZSu/W+7axrlrs9dLQFgLx8IjG1GrM9s/MkUdQz4YLvaqvBS
	TPkVlPcqiZbLsccLoloYLATYdQXLig0PIJ+U/I8GJAgVDPfC40HIWZvf9S4veZKRyNDHSb
	dInp+sXMpINVsyA9BqLuK5w+dZozNN1aLPvn4Q5pfQUjuzMfMXCiRb8sYXjByA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 09:47:22 +0200
Message-Id: <DJNX3WT8EPIC.1IJ439OLYUYFU@bootlin.com>
To: <Moritz.Haase@bmw.de>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] json-c: upgrade 0.18 -> 0.19
Cc: <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260701090208.3598070-1-Moritz.Haase@bmw.de>
In-Reply-To: <20260701090208.3598070-1-Moritz.Haase@bmw.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 07:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240021

On Wed Jul 1, 2026 at 11:02 AM CEST, Moritz Haase via lists.openembedded.or=
g wrote:
> Release notes are available at [0].
>
> Newly added tests (see [1]) require the 'json_parse' app at (test) runtim=
e.
> Thus, apps are now being built and the 'json_parse' app is deployed in th=
e
> 'ptest' package. We do not package the apps separately as upstream doesn'=
t
> consider them to be ready for that (see [2]). This approach is based on t=
he
> discussion in [3].
>
> [0]: https://github.com/json-c/json-c/blob/json-c-0.19/ChangeLog
> [1]: https://github.com/json-c/json-c/blob/d9d8cab82291637671f6c90cf06e57=
8750a08718/tests/test_json_parse_cli.test#L18
> [2]: https://github.com/json-c/json-c/blob/d9d8cab82291637671f6c90cf06e57=
8750a08718/apps/CMakeLists.txt#L122-L124
> [3]: https://lists.openembedded.org/g/openembedded-core/topic/120026557#
>

Hi Moritz,

Thanks for the new version.

>  do_install_ptest() {
> -    install -d ${D}/${PTEST_PATH}/tests
> +    install -d ${D}/${PTEST_PATH}/{apps,tests}
> +
> +    # The 'json_parse_cli' test executes the 'json_parse' app via '../ap=
ps/json_parse', so we
> +    # package it accordingly.
> +    install ${B}/apps/json_parse ${D}/${PTEST_PATH}/apps
> +

It looks like install task is failing on the autouilder:

ERROR: json-c-0.19-r0 do_install_ptest_base: Execution of '/srv/pokybuild/y=
octo-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux3=
2/json-c/0.19/temp/run.do_install_ptest_base.1456696' failed with exit code=
 1
...
| install: target '/srv/pokybuild/yocto-worker/qemux86-64-x32/build/build/t=
mp/work/x86_64_x32-poky-linux-gnux32/json-c/0.19/image//usr/lib/json-c/ptes=
t/tests': No such file or directory
| WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/4006
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/4068
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3946
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3959

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


