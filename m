Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000E5C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 07:53:32 +0000 (UTC)
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
 by mx.groups.io with SMTP id smtpd.web11.9261.1750319601831294509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 00:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=nxgOGDHr;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.189, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([178.143.45.236])
	by cmgsmtp with ESMTPSA
	id SA5GuUkoV75drSA5GudgfE; Thu, 19 Jun 2025 09:53:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750319599; bh=4439Vl5Cn6vU4qxoHZDqFygXjN5V+t70NYVafpp7VHY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type;
	b=nxgOGDHrVv8JOMMw8fqfs3ropvCSEazQ/5bYXJjehPFH7JJgilFVSBS2j3D39Cn8e
	 iP0mewEo5DSI24g3G6h/028+GolRVnIal41uDxfmqpVGj26Ak4rQyHM0ViK/y1XrSg
	 pmbXMQxG+skbWS5o+Ujq9h7WqQHcCewPowi6RkFOmytExNoG6vNpq6RU5vGqHROlzO
	 jd7deNCo2EN7s7EhzcAwCDmcl4Sg3+VSB2P66/uaA7xRVzURFgDQCMdImknLbB6w2T
	 yGipag3wmbAdT5d+Izm4DFz4SDJyJTSHO9eCfTjvAM9UCDEuPm5TO25Waoas07svZK
	 HbF4rtjpX8b+A==
Message-ID: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
Date: Thu, 19 Jun 2025 09:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: Andrej Valek <andrej.v@skyrain.eu>
Subject: perf: nativesdk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHZRKaNTNjhtFs/4X7PkQ4MPi4WYIRnwylypRl7iJ38VJK4dl2p/F6gs6/PcgQOTOsOq8XoXDVQA3YICfD6EdyJBCGsRt84EFJiZj9GSi6flc2/HaD/k
 sUTZYytQtr/k0xi6FdYBy9UB5FUc+Zu7FEzjIlYsiE4YBGDxTsmZrCzXF+yMPCxkBndmI2e3x2Z9Ek/rFIC1YwKx3QW30ZzFutwiZ/Bb/0IhyyKdd7VxWGtm
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 07:53:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219054

Hello,

I know, that what I'm doing is not fully supported way, but... . I 
wanted to build the perf for target device (aarch64), record the data 
and analyze them on the host. So I extended the recipe by adding 
BBCLASSEXTEND = "native nativesdk".

After that I have compilation failure do to missing manifest.

ERROR: nativesdk-perf-1.0-r0 do_configure: The sstate manifest for task 
'linux-libc-headers:populate_sysroot' (multilib variant '') could not be 
found.
The pkgarchs considered were: machineA, cortexa53, cortexa53, cortexa53, 
armv8a-crc, armv8a, aarch64, allarch, x86_64_x86_64-nativesdk.
But none of these manifests exists:
/home/build/tmp/sstate-control/manifest-machineA-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-armv8a-crc-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-armv8a-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-aarch64-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-allarch-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-linux-libc-headers.populate_sysroot

The "linux-libc-headers" dependency is coming from "gcc-cross-aarch64".

EXTRADEPENDS = ""
DEPENDS = "virtual/${TARGET_PREFIX}binutils ${EXTRADEPENDS} ${NATIVEDEPS}"
PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
python () {
     if d.getVar("TARGET_OS").startswith("linux"):
         d.setVar("EXTRADEPENDS", "linux-libc-headers")
}

This function adds the dependency without respecting any 
native/nativesdk variant.

I know touching the "PACKAGE_EXTRA_ARCHS" or removing this function 
above it's not right way to fix it.

How to deal with something like that?

Thanks,
Andy

