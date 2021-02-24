Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.5735.1614166813850428568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 03:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=Quc4PN30;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (unknown [83.135.214.71])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5CB5320B6C40;
	Wed, 24 Feb 2021 03:40:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5CB5320B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1614166812;
	bh=aiAarxGE9LfznSR9Ee2vz26pvm/wNSNsJlVexOK0JVE=;
	h=To:Cc:From:Subject:Date:From;
	b=Quc4PN3038aUbcwRoshedgXAWsSy8ar0XoBEIH3ZWyrRA4gkd727kXV/OWjK9Ogm5
	 Hreaif257+RQeKjC2t5hgoysdbFeXfT0BpU9qCawAjI0vMFl6jxoXA5C19wB3wY6fj
	 HsTOnv6DfUjdz9uq0Tla1Stluu9V2Rm2oLj/ghek=
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: randy.macleod@windriver.com
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Subject: Current native SDK glibc compat
Message-ID: <4ec292a9-3723-34f2-51a5-01dd6652f651@linux.microsoft.com>
Date: Wed, 24 Feb 2021 12:40:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

the current master build seems to be broken with symbols unavailable=20
from the host glibc. The following is to see on the SDK built and=20
installed on the same host Ubuntu 18.04.5 having glibc 2.27:

$ . /tmp/poky-sdk-master-00/environment-setup-core2-64-poky-linux

$ ldd $(which $CC)
/tmp/poky-sdk-master-00/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky=
-linux/x86_64-poky-linux-gcc:=20
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found=20
(required by=20
/tmp/poky-sdk-master-00/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky=
-linux/x86_64-poky-linux-gcc)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-vdso.so.1 (0x00007ffdaa=
ca2000)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libm.so.6 =3D> /lib/x86_64-li=
nux-gnu/libm.so.6 (0x00007feab87eb000)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libc.so.6 =3D> /lib/x86_64-li=
nux-gnu/libc.so.6 (0x00007feab83fa000)
/tmp/poky-sdk-master-00/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64=
.so.2=20
=3D> /lib64/ld-linux-x86-64.so.2 (0x00007feab8b89000)

$ objdump -T $(which $CC) | grep GLIBC_2.33
objdump: warning:=20
/tmp/poky-sdk-master-00/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky=
-linux/x86_64-poky-linux-gcc:=20
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0008002
objdump: warning:=20
/tmp/poky-sdk-master-00/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky=
-linux/x86_64-poky-linux-gcc:=20
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0010001
objdump: warning:=20
/tmp/poky-sdk-master-00/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky=
-linux/x86_64-poky-linux-gcc:=20
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0010002
0000000000000000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DF *UND*=C2=A0 00000000000=
00000=C2=A0 GLIBC_2.33 lstat
0000000000000000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DF *UND*=C2=A0 00000000000=
00000=C2=A0 GLIBC_2.33=C2=A0 stat
0000000000000000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DF *UND*=C2=A0 00000000000=
00000=C2=A0 GLIBC_2.33 fstat


Similar issue is observer on several other binaries consuming same=20
symbols. This doesn't seem a uninative issue, avoiding uninative doesn't=20
change this. Stable branches are fine.

I was looking through the doc but couldn't find a way to enforce a=20
certain symbol version usage. Please advise on a proper way to fix this.


Regards

Anatol


