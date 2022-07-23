Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8962EC433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 12:28:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.5694.1658579309328994168
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 05:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sb3fTAAv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 u14-20020a05600c00ce00b003a323062569so3811685wmm.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=tJpor4zuUqW5j0jBo9sL6vmdjPAzG8KZEeFBCwVrvjo=;
        b=Sb3fTAAvqztTWZ4nYL3q/33Kd5v4NmnUE1qyt8j9trGHhwk0Y1ICyab7QxTE+UbeFt
         ZnGWOAdrSPo2/nLTTrZlBkD75RfUN4B04Qzxh8SfJXKxtaRrPbXhlSicUzwQIDLwQzYJ
         6URzi+sgLtTOlfQ2I11oUADq8J7DQlHoijqzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=tJpor4zuUqW5j0jBo9sL6vmdjPAzG8KZEeFBCwVrvjo=;
        b=PtZR/zCp60yQqTQt1IhaxeJOfj5HALCrOElJ7M8q7acI8iC3JqGjGI+jijK/dxKhWF
         i5AZVufYibYul/lxplahwTIU8peZLnnx51llEOpTAqDigGH2Yq1GqJAGiU3Q70RrW/Uu
         ORAGACrq4iAdo7m5OcuovQzbUGoX/3Dc8cLN5ye/25LuUGOHBNKsPS3RUPFOf8qjsoAS
         zvDPz2iCr98+nzjilnIBM19iUgiofq0PCtcFi+aw2Sm9PwQuFc3K5WfK82USekpRUbbv
         AtW8eenxI4Cf710/KVc9507Gtr454E/NsJWhV5hnjbFhGYqNzyuSh8nLhiX1wpJQ0cEU
         TQyQ==
X-Gm-Message-State: AJIora9kZljE5mVlFbKNo2uook4uAenk8IonUFZeHFZiENkF3T0Sp7ug
	wXJyWlgb9pIGE6OUHYPhM5zI5w==
X-Google-Smtp-Source: 
 AGRyM1uHCF5s75SrduXphP4DmrXVOkq/V8913SLttrMB4CcLJLImyoxCaw0fT3W65agWlrnwjHRKXw==
X-Received: by 2002:a05:600c:a42:b0:39c:9166:5a55 with SMTP id
 c2-20020a05600c0a4200b0039c91665a55mr2743940wmq.141.1658579307515;
        Sat, 23 Jul 2022 05:28:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9bb3:b62f:20a1:a32?
 ([2001:8b0:aba:5f3c:9bb3:b62f:20a1:a32])
        by smtp.gmail.com with ESMTPSA id
 x15-20020a5d490f000000b0021e43b4edf0sm6930658wrq.20.2022.07.23.05.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 05:28:27 -0700 (PDT)
Message-ID: 
 <c4286ef790a6cb53bff42c8505051b6d4de4ac27.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] zlib: split SRC_URI into inc file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Sean Nyekjaer
	 <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org, denis@denix.org,
	raj.khem@gmail.com
Date: Sat, 23 Jul 2022 13:28:26 +0100
In-Reply-To: <YtvpFxiRz1bAFTR7@mail.local>
References: <20220715115515.4012984-1-sean@geanix.com>
	 <YtvpFxiRz1bAFTR7@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 12:28:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168434

On Sat, 2022-07-23 at 14:27 +0200, Alexandre Belloni wrote:
> Hello,
>=20
> This doesn't pass the selftests:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3865/st=
eps/14/logs/stdio
>=20
> 2022-07-23 10:00:43,013 - oe-selftest - INFO - pkgdata.OePkgdataUtilTests=
.test_find_path (subunit.RemotedTestCase)
> 2022-07-23 10:00:43,026 - oe-selftest - INFO -  ... FAIL
> Stderr:
> 2022-07-23 08:46:34,614 - oe-selftest - INFO - Adding: "include selftest.=
inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-2078=
751/conf/local.conf
> 2022-07-23 08:46:34,615 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
> 2022-07-23 10:00:17,568 - oe-selftest - INFO - Running bitbake to generat=
e pkgdata
> 2022-07-23 10:00:43,026 - oe-selftest - INFO - 3: 49/59 163/494 (3.69s) (=
pkgdata.OePkgdataUtilTests.test_find_path)
> 2022-07-23 10:00:43,026 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oe=
qa/selftest/cases/pkgdata.py", line 50, in test_find_path
>     result =3D runCmd('oe-pkgdata-util find-path /lib/libz.so.1')
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oe=
qa/utils/commands.py", line 207, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\=
n%s" % (command, result.status, exc_output))
> AssertionError: Command 'oe-pkgdata-util find-path /lib/libz.so.1' return=
ed non-zero exit status 1:
> ERROR: Unable to find any package producing path /lib/libz.so.1
> Stderr:
> 2022-07-23 08:46:34,614 - oe-selftest - INFO - Adding: "include selftest.=
inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-2078=
751/conf/local.conf
> 2022-07-23 08:46:34,615 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
> 2022-07-23 10:00:17,568 - oe-selftest - INFO - Running bitbake to generat=
e pkgdata
> 2022-07-23 10:00:47,408 - oe-selftest - INFO - pkgdata.OePkgdataUtilTests=
.test_glob (subunit.RemotedTestCase)
> 2022-07-23 10:00:47,408 - oe-selftest - INFO -  ... ok
> 2022-07-23 10:00:47,408 - oe-selftest - INFO - 3: 50/59 164/494 (4.39s) (=
pkgdata.OePkgdataUtilTests.test_glob)
> 2022-07-23 10:00:53,202 - oe-selftest - INFO - pkgdata.OePkgdataUtilTests=
.test_list_pkg_files (subunit.RemotedTestCase)
> 2022-07-23 10:00:53,202 - oe-selftest - INFO -  ... FAIL
> Stderr:
> 2022-07-23 08:46:34,614 - oe-selftest - INFO - Adding: "include selftest.=
inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-2078=
751/conf/local.conf
> 2022-07-23 08:46:34,615 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
> 2022-07-23 10:00:17,568 - oe-selftest - INFO - Running bitbake to generat=
e pkgdata
> 2022-07-23 10:00:53,202 - oe-selftest - INFO - 3: 51/59 165/494 (5.79s) (=
pkgdata.OePkgdataUtilTests.test_list_pkg_files)
> 2022-07-23 10:00:53,202 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oe=
qa/selftest/cases/pkgdata.py", line 147, in test_list_pkg_files
>     self.assertTrue(found, 'Could not find zlib library file %s in libz1 =
package file list: %s' % (libspec, files['libz1']))
>   File "/usr/lib64/python3.9/unittest/case.py", line 688, in assertTrue
>     raise self.failureException(msg)
> AssertionError: False is not true : Could not find zlib library file /lib=
/libz.so.1.* in libz1 package file list: ['/usr/lib/libz.so.1', '/usr/lib/l=
ibz.so.1.2.12']

FWIW I agree with Ross, we should be able to handle minizip in the
existing recipe so this patch needs to be reworked anyway.

Cheers,

Richard

