Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32863.1795347903009995827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 03:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oh4Cn43q;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B134FC6223C
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 11:45:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01A6260512;
	Sun, 22 Nov 2026 11:45:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C0C811BC000E;
	Sun, 22 Nov 2026 12:44:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795347899; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BMmW4nK6MEipWx4dTCAUtEnFXvwZzW9Hh3DPqn/AvKQ=;
	b=oh4Cn43q5SJbaZe8ClTlWeM14C2Pf7jogYk7lXjjKaagh+3lcvW8qM9IV16aWWf5BdbNxS
	JyXlda3rccUVJaxBdQ6VioD+HxcuNWFSgJ9aIiS+ULJTPngFuZyGR3eI4Biz4os/nwDPsS
	FfgGRnBZucUOwWsqrBJtQCaW+JaFUnuLqYIg5LBFSKiaOJyxUVWr0pYD52awuYsb9t/8nL
	u8sMtSjmBivdmRcA5Bqh+E0tI0nSnq/VTVIo2SOy2s6LBUFO5ml/OPDcbHtvZCnsL4/zzz
	uM+bzJU5hnYzdAPI2YrWuooJnf3xSgxNEtJshVjzo9se/iCiobrQjpA33Ctvew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 12:44:55 +0100
Message-Id: <DN1PPP14OJFU.2WACOJI87M8F5@bootlin.com>
To: "Enguerrand de Ribaucourt"
 <enguerrand.de-ribaucourt@savoirfairelinux.com>, "Adrian Freihofer"
 <adrian.freihofer@gmail.com>
Subject: Re: [OE-core] [PATCH v2 00/18] devtool: ide-sdk: add support for
 Rust recipes
Cc: <openembedded-core@lists.openembedded.org>, "Adrian Freihofer"
 <adrian.freihofer@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com> <DMRJ1ZHRD2GY.3FYG0JMUT4C3I@bootlin.com> <CAB3asfiNShsoU4MzCjkUieDaBqs36MiGLuV6oLb7K1tX3ufbTw@mail.gmail.com> <72b94c28-8f93-4c2d-8423-d63f6c093552@savoirfairelinux.com>
In-Reply-To: <72b94c28-8f93-4c2d-8423-d63f6c093552@savoirfairelinux.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 11:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250867

On Fri Nov 20, 2026 at 6:09 PM CET, Enguerrand de Ribaucourt wrote:
>
> On 11/11/26 07:46, Adrian Freihofer wrote:
>>=20
>>=20
>> Am Di., 10. Nov. 2026 um 13:25=C2=A0Uhr schrieb Mathieu Dubois-Briand vi=
a=20
>> openembedded-core <mathieu.dubois-=20
>> briand=3Dbootlin.com@lists.openembedded.org=20
>> <mailto:bootlin.com@lists.openembedded.org>>:
>>     I can see one of the selftest is failing, but only in 1 of the 3
>>     selftest builds. So it might be something not fully deterministic wi=
th
>>     lldb-server installation:
>>     Warning: Permanently added '[localhost]:2222' (RSA) to the list of
>>     known hosts.
>>     /bin/sh: line 0: /usr/bin/lldb-server: not found
>>     lldb-server exited before it started listening on port 1266
>>=20
>>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/
>>     builds/5043 <https://autobuilder.yoctoproject.org/valkyrie/#/
>>     builders/48/builds/5043>
>>=20
>>     Can you have a look at the issue?
>>=20
>> That can happen if one test instance tries to connect to the wrong=20
>> runqemu instance (e.g. one with gdb-server installed) respectively the=
=20
>> port exposed on the build machine. There is a patch series which tries=
=20
>> to fix that. But v1 was rejected because it used Qemu's human readable=
=20
>> QMP API instead of the machine readable JSON API. v2 is still WIP=20
>> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dadrianf/=
=20
>> runqemu-use-qmp-for-port-alloc <https://git.openembedded.org/=20
>> openembedded-core-contrib/log/?h=3Dadrianf/runqemu-use-qmp-for-port-=20
>> alloc>. It requires adding some APIs to Qemu upstream. Not a trivial=20
>> quick fix. I was also lowering the priority on that because it seemed=20
>> like working.
>>=20
>> Probably this issue is not directly introduced by this patch series. But=
=20
>> the more tests we add, the more likely it becomes that two of them run=
=20
>> in parallel and fail in that wy.
>
> Hello,
>
> Should I wait for that series to be merged?
>
> Otherwise, I can provide a fix that would directly update the tasks.json=
=20
> from the actual Qemu SSH Slirp port returned by
> `qemu_cm =3D runqemu(testimage, runqemuparams=3Drunqemuparams,=20
> launch_cmd=3Dlaunch_cmd)`. It's just a few lines, but it does look more=
=20
> like a workaround than a solution. I can make that a separate commit=20
> that would be easy to revert once Adrian's branch has been merged.
>
> devtool ide-sdk also accepts an ssh port argument, but the current test=
=20
> flow needs to execute qemu after ide-sdk has been run.
>
> Please let me know how you want to proceed, or if you have any other=20
> remarks on this stack.
>
> Best Regards,
> Enguerrand de Ribaucourt

I'm adding this series back into my branch, we will see how often the
test fails. This mean I will probably open a bug report to track the
corresponding test failures.

I understand the bug is not introduced by this series, but the increased
failure rate it will trigger might quickly become painful.

Adrian, do you have any clue about how complex this will be to fix? Any
other opinion?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

