Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18617.1794313516728428156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 04:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UQFjhI0n;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B0C121A15FB;
	Tue, 10 Nov 2026 12:25:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6810960012;
	Tue, 10 Nov 2026 12:25:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5169C10329424;
	Tue, 10 Nov 2026 13:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794313513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bTcHaC3E+XgiPv/1RJVF+909xaK5J5Nr6/G/P1Mpg6E=;
	b=UQFjhI0nkBfU0YZKZS22T3U63wpAJNozJAes28t3s8FmW/5AOzAv1xk1hEufEV59Z0oqDm
	qA2yMaxVcc7vNdDreLub+FUidB2/bj8kswTsn6ndBLJDA7URvTUP426km+6atqoU1qMHFS
	kuCHV9MQ9lwhTkA8NVUlK3oiAFDTiG/AN+nMBd4xKIMBWPmvTv4HAUPIgRHs7fsh8N5aLc
	GSGFgLPSihs/xB165t68V9HOk+x/jBBDI/I2RxiY9zYrXAEojundlqKR4/tJAoselfvrlH
	4u7hWvW/NOlG6Os46YvOoUUfK3m2WLkjCx7Pj41IrnQfTnTvcjtHFXvw0uJ6oA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 13:25:11 +0100
Message-Id: <DMRJ1ZHRD2GY.3FYG0JMUT4C3I@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 00/18] devtool: ide-sdk: add support for
 Rust recipes
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <enguerrand.de-ribaucourt@savoirfairelinux.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 12:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249920

On Mon Nov 9, 2026 at 2:44 PM CET, Enguerrand de Ribaucourt via openembedde=
d-core wrote:
> Hello, this series introduces support for Rust ide-sdk VS Code
> configuration against the Yocto cross-compilation toolchain:
>
>  - editor symbol resolution and linting
>  - build task
>  - deploy task
>  - debugging
>
> It introduces a cargo-example recipe following the model used for
> cmake and meson.
>
> The generated configurations can be portable to standalone SDK
> installations by manually updating the paths.
>
> C/C++ IntelliSense could provide navigation for native code compiled
> by Cargo build scripts, using the recipe compiler and sysroot. This
> first series defers it because no mixed-language fixture is available
> to validate that workflow.
>
> BitBake generates the Cargo configuration consumed by ide-sdk. This serie=
s
> updates the parsed configuration and writes its supported TOML values
> without adding a new dependency.
>
> I reproduced the selftest coverage expected from other recipe classes,
> including configuration analysis up to actual debugging symbol resolution=
.
>
> I largely used AI generation to write this stack. After many iterations,
> I am finally happy with the code and commit history quality of this serie=
s.
> I also have a documentation commit ready for the manual if this gets
> approved.
>
> Any feedback is appreciated. Hope this will help lots of Rust developers
> working with Yocto distros :).
>
> Cheers,
> Enguerrand de Ribaucourt
>
> Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirf=
airelinux.com>
> ---

Hi Enguerrand,

Thanks for the v2.

I can see one of the selftest is failing, but only in 1 of the 3
selftest builds. So it might be something not fully deterministic with
lldb-server installation:

2026-11-10 10:42:27,794 - oe-selftest - INFO - devtool.DevtoolIdeSdkRustTes=
ts.test_code_cargo_qemu_slirp (subunit.RemotedTestCase)
2026-11-10 10:42:27,795 - oe-selftest - INFO -  ... FAIL
...
2026-11-10 10:42:27,795 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 4503, in test_cod=
e_cargo_qemu_slirp
    self._verify_rust_lldb_debugging(tempdir, expected_input=3D4)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 4545, in _verify_=
rust_lldb_debugging
    runCmd(ssh_args, output_log=3Dself._cmd_logger)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command '['ssh', '-p', '2222', '-o', 'UserKnownHostsFile=3D=
/dev/null', '-o', 'StrictHostKeyChecking=3Dno', 'root@localhost', "/bin/sh =
-c 'grep -q :04F2 /proc/net/tcp /proc/net/tcp6 2>/dev/null && exit 0; mkdir=
 -p /tmp/lldb_server_1266_usr-bin-cargo-example_multi; cd /tmp/lldb_server_=
1266_usr-bin-cargo-example_multi; /usr/bin/lldb-server platform --server --=
listen *:1266 --gdbserver-port 1267 > /tmp/lldb_server_1266_usr-bin-cargo-e=
xample_multi/lldb_server.log 2>&1 & _lldb_server_pid=3D$!; echo $_lldb_serv=
er_pid > /tmp/lldb_server_1266_usr-bin-cargo-example_multi/lldb_server.pid;=
 _w=3D0; while ! grep -q :04F2 /proc/net/tcp /proc/net/tcp6 2>/dev/null; do=
 kill -0 $_lldb_server_pid 2>/dev/null || { cat /tmp/lldb_server_1266_usr-b=
in-cargo-example_multi/lldb_server.log >&2; echo lldb-server exited before =
it started listening on port 1266 >&2; exit 1; }; _w=3D$((_w+1)); [ $_w -lt=
 600 ] || { kill $_lldb_server_pid 2>/dev/null; echo lldb-server did not st=
art on port 1266 after $_w retries >&2; cat /tmp/lldb_server_1266_usr-bin-c=
argo-example_multi/lldb_server.log >&2; exit 1; }; sleep 0.1; done;'"]' ret=
urned non-zero exit status 1:
Warning: Permanently added '[localhost]:2222' (RSA) to the list of known ho=
sts.
/bin/sh: line 0: /usr/bin/lldb-server: not found
lldb-server exited before it started listening on port 1266

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/5043

Can you have a look at the issue?

I launched a rebuild of that build, out of curiosity. But in all cases,
we should understand what happened here.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

