Return-Path: <andrew.shadura@collabora.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFD8C433EF
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 20:40:34 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web09.17325.1640983233147297701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Dec 2021 12:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@collabora.co.uk
 header.s=mail header.b=Cdo9F6Vd;
 spf=pass (domain: collabora.co.uk, ip: 46.235.227.227,
 mailfrom: andrew.shadura@collabora.co.uk)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh)
	with ESMTPSA id DB3531F4087E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.co.uk;
	s=mail; t=1640983231;
	bh=C+SCg010j9xLdimz4Y7Lk23Zsln5ENQTkjIDNf1/NrM=;
	h=Date:To:From:Subject:From;
	b=Cdo9F6VdI70Clycm5V6u2/iAGLCDmmRupRj+mQVc0gnl/Qt3yH6bPSIeWV7uWWDb7
	 30dwOWYyfLX6NNWEgt619tj2zkDET7Y05SPR4oSrU0GE1mRsQxejDC4PFjZibrezT0
	 h6mPokB7lqCAvoB6oCVEqn2AMAo678mTDN+SgC+sY0wBmovywRivGx5zonj1YNoivE
	 5w5WSFEL27Fatj0s9etf6cHSzMl1ZePQS+YY7SL83N9apiEjk/mhVSK3EdVioRb/H6
	 jY1NtZHkWIbXejKmT8o7vH2dlV8gjM8Oen/PCrBi23zve6+6sRxAb8I/s+ExxZ6oxb
	 EDq3vRiVQ9aXQ==
Message-ID: <e9d8abaa-20e9-4ee6-0cfc-2705d858c432@collabora.co.uk>
Date: Fri, 31 Dec 2021 21:40:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: openembedded-core@lists.openembedded.org
From: Andrej Shadura <andrew.shadura@collabora.co.uk>
Subject: pseudo FTBFS with recent glibc
Organization: Collabora
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 20:40:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160092

Hi,

pseudo started failing to build from the source apparently after a glibc=20
update [1] we had in Debian:

>> In file included from pseudo_wrappers.c:46:
>> ports/unix/guts/symlinkat.c: In function =E2=80=98wrap_symlinkat=E2=80=
=99:
>> pseudo_client.h:14:65: error: =E2=80=98_STAT_VER=E2=80=99 undeclared (=
first use in this function)
>>    14 | #define base_fstatat(dirfd, path, buf, flags) real___fxstatat6=
4(_STAT_VER, dirfd, path, buf, flags)
>>       |                                                               =
  ^~~~~~~~~
>> ports/unix/guts/symlinkat.c:37:14: note: in expansion of macro =E2=80=98=
base_fstatat=E2=80=99
>>    37 |         rc =3D base_fstatat(dirfd, newpath, &buf, AT_SYMLINK_N=
OFOLLOW);
>>       |              ^~~~~~~~~~~~

A similar issue has been reported against fakeroot [2]. I guess,=20
something similar is required for pseudo as well.

[0]: https://bugs.debian.org/1002136
[1]: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3D8ed005d=
af0
[2]: https://salsa.debian.org/clint/fakeroot/-/merge_requests/10/diffs

--=20
Cheers,
   Andrej

