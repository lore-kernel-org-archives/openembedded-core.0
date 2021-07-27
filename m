Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web08.1138.1627392875034151034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 06:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cybernetics.com header.s=mail header.b=ZsEpuEOh;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==842db41608d==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1627392873-0fb3b001bf174e0001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id 5zkIdIR9K99QaAKq; Tue, 27 Jul 2021 09:34:33 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=yIdQsRqDjkPVA3nroQlf0DFoC8I2CvAmNvAZQ7GjUlc=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:Cc:To; b=ZsEpuEOhlJ9z3T4C/DwIQJd0hspHhz1537m41a3ZvjER
	wif2gLjuOZIw4V0Lm+OhpomuxJnB83lczis+ps1wqZQgHeYo1uHb77ttiP7ghKSFTWrfZ3BQyZ+Qo
	cgbkLq0xoXBMdVZ8ZzInsw9gR91JfU8dhq6DAF/IAuGm+0uMwE=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 10999367; Tue, 27 Jul 2021 09:34:33 -0400
To: openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
Cc: randy.macleod@windriver.com
From: "Tony Battersby" <tonyb@cybernetics.com>
Subject: [master][PATCH 0/4] Reproducible LTO builds
Message-ID: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
X-ASG-Orig-Subj: [master][PATCH 0/4] Reproducible LTO builds
Date: Tue, 27 Jul 2021 09:34:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1627392873
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 2200
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Currently, enabling Link Time Optimization via:

require conf/distro/include/lto.inc
DISTRO_FEATURES_append =3D " lto"

makes the build non-reproducible (as in
https://reproducible-builds.org/).=C2=A0 This patch set fixes some of the
problems, but is not yet a complete solution.

This patch set addresses the following bugs:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14490

openembedded-core patches
1/4: lto.inc: disable LTO for grub
2/4: gcc: Backport patch to make LTO builds more reproducible
3/4: bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS

openembedded-devel patches
4/4: net-snmp: fix QA Issue after LDFLAGS change

Patch 3 adds DEBUG_PREFIX_MAP to TARGET_LDFLAGS (it was already in
TARGET_CFLAGS).=C2=A0 This could possibly be done differently, such as by
removing it from TARGET_CFLAGS and adding it to TOOLCHAIN_OPTIONS,
TARGET_CC_ARCH, or TUNE_CCARGS, but I haven't tested those.=C2=A0 Let me =
know
if there is a better/preferred way to do it.

The TARGET_LDFLAGS change broke net-snmp from meta-networking, so I have
included a patch to fix that.=C2=A0 Other packages might have been broken=
 as
well, although I haven't found any others.

With all these patches, there are still many shared libraries in /lib
and /usr/lib that are still not reproducible with LTO enabled because
x86_64-poky-linux-libtool filters out the -f*-prefix-map flags added by
patch 3 when linking shared libraries.=C2=A0 /usr/lib/libbz2.so.1.0.6 fro=
m
the libbz2 package from the bzip2 recipe is a good example.=C2=A0 I do no=
t
have a patch for that problem.=C2=A0 I will leave that to someone else.

So this is what we need to achieve reproducible LTO builds:
*) This patch set
*) A fix for libtool
*) Add LTO to reproducible builds testing if appropriate (e.g.
meta/lib/oeqa/selftest/cases/reproducible.py, CI on Autobuilder)
*) Fixes for individual packages, if needed
*) Once everything works, update the documentation again (I previously
requested a documentation change for this bug, which will eventually
show up at
http://docs.yoctoproject.org/test-manual/reproducible-builds.html).

Tony Battersby
Cybernetics

