Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15126.1795782920443648359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 04:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rrZrc5cV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C61481A17D5
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:35:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 950056049C;
	Fri, 27 Nov 2026 12:35:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5269511E684C3;
	Fri, 27 Nov 2026 13:35:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795782917; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EF02ZZVlQikz21IqO+lohL56KqrbimTjjkMbqGFjQLA=;
	b=rrZrc5cVxQr2qWBU9Nf0xqc6lgHLGWiTF4W6oLwRNq2OXVKrJO9/uE8vh91ID0/0+5Go2J
	fHgnEZMTKIjTJOB18veuudEiHJg1orcJF57yytY/AVkcCD3cdNtK0BLGeviMQmsw5SPfph
	Pc5zaVDXodvOjB2CFjo/JAqtBWBrcupDAGXRvUvmbdUTwFqtroSpsxHlM1miCxhO3b0qbn
	Dg6Hq25S8k5ltW3khuNccSvqqLZWWf+S5hFjOAtzGx+rKas0WkyR+ufeR0zUs7FTL4r2Xz
	twds1/tXvPPRYeXndH8nSXAf3H9787qdQOIX3ZOPIKMcHSBvYg6Dor4VSYAiNg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 13:35:12 +0100
Message-Id: <DN5ZWX2YIK10.2DW3CFLX8BL08@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/2] libpcap: upgrade 1.11.0 -> 1.11.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261125090627.78976-2-jaipaul.cheernam@est.tech>
 <20261126162516.93141-1-jaipaul.cheernam@est.tech>
 <20261126162516.93141-3-jaipaul.cheernam@est.tech>
In-Reply-To: <20261126162516.93141-3-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251382

On Thu Nov 26, 2026 at 5:25 PM CET, Jaipaul Cheernam wrote:
> Changes: [1]
>
> Tuesday, November 24, 2026 / The Tcpdump Group
>   Summary for 1.11.1 libpcap release
>     Source code:
>       Fix function names in two error messages.
>       Have pcap_fileno() return -1 rather than PCAP_ERROR if the HANDLE
>         is invalid, as the return value isn't a general error.
>       Indicate no-capture and no-inject devices.
>       Require libpcap [internal-only] config.h in [internal-only] pcap-in=
t.h.
>       Use more parentheses in BPF_STMT() and BPF_JUMP().
>     General:
>       Set all the file descriptors/HANDLEs to an invalid value in
>         pcap_open_dead().
>     Building and testing:
>       At the build time require atexit(3) not to crash.
>       Require config.h to be from the libpcap build.
>       Test for <sysexits.h> instead of specific OSes.
>       mkdep: Use mktemp(1) if it is available.
>       mkdep: Propagate compiler errors.
>       Enable out-of-tree invocation of autogen.sh.
>       testprogs: Factor fcodetest out of filtertest.
>       Avoid some compiler builtins in Clang < 9.0.0.
>     Packet filtering:
>       Fix validation of "/", "%", "<<" and ">>" 2nd operand.
>       Fix a dangling register index in "proto[expr]".
>       Fix a register index leak in "protochain".
>       Fix the skipping of AH in "protochain".
>     Haiku:
>       Fix a compiler warning. (Issue #1738)
>     rpcap:
>       Properly check for a network error in one case. (Pull request
>         #1793)
>     Documentation:
>       Note in pcap_fileno(3PCAP) and pcap_get_selectable_fd(3PCAP) that
>         the descriptors returned by those routines must not be
>         closed. (Issue #1722)
>       Update a few OS-specific README files.
>     Linux:
>       Include sysfs rx_dropped in pcap_stat.ps_ifdrop (GH bug 1328).
>     QNX:
>       Fix DLT_PFSYNC definition on QNX 8.0.
>     Link-layer types:
>       Add LINKTYPE_ETW2/DLT_ETW2.
>
> - Adapt ptest to "testprogs: Factor fcodetest out of filtertest." change =
[2]
>
> ptest-summary:
> INFO:  6580 tests skipped
> INFO:     0 tests failed
> INFO: 16043 tests passed: T min/avg/max =3D 0.001184/0.002512/0.022410s
> INFO: Testing time =3D 42.74 seconds.
> INFO: Executed test rate overall =3D 375.35 per second.
>
> [1] https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.11.1/CHAN=
GES
> [2] https://github.com/the-tcpdump-group/libpcap/commit/fd4ece414c8c
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

You can find a new failure below:

Failed ptests:
{'libpcap': ['libpcap']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1657
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1638
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/5021
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4989

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

