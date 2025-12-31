Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354BBEE57D6
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:41:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81719.1767166905678081761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KpmGwLK0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 888641A255A;
	Wed, 31 Dec 2025 07:41:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E47360744;
	Wed, 31 Dec 2025 07:41:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D47E6113B072C;
	Wed, 31 Dec 2025 08:41:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767166903; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QjbXlWNQdXeC+vvrc7QSENW7QgwL/glwz9IFyy6UtAQ=;
	b=KpmGwLK053PHw9YnkO4xOYNAkmHInl0LrD3x6enUtb0F0AvnxDZ/TjGCUP5FecKQgW0Hsg
	tIFExM9BklCNv2Z4MKQp4y3mmFWZ8WMvjlH61ODosQ8k5MbdCrCW6oPr15GLzo+sNstoYP
	OM9zT/u/ucR+xamxlGRkUyJ3YkSyCSixtIEUJuOVfXMbX47ggVUOY41uJnnEGJp0AqC9W0
	dwumXMiI8oGrfoc80bVNf4GGfpuj7CoPMr7TO3Efp81xYCdvJB3tKwQG1lXeJVm1FPJAdz
	1MYzYLelhp8k81Fm3RpQm0oX9yri27CzAlKlHjkl1W3oI5+Hl9xFtlVi7pTIeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 08:41:40 +0100
Message-Id: <DFC8DUU93AH8.3HVB3NWSVHZYP@bootlin.com>
Subject: Re: [OE-core] [PATCH 13/14] oe-selftest: devtool: add test for gdb
 pretty-printing
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251230084720.2371227-1-adrian.freihofer@siemens.com>
 <20251230084720.2371227-14-adrian.freihofer@siemens.com>
In-Reply-To: <20251230084720.2371227-14-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 07:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228724

On Tue Dec 30, 2025 at 9:46 AM CET, Adrian Freihofer via lists.openembedded=
.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> This extends the existing devtool IDE SDK tests to verify that gdb
> pretty-printing is working correctly.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---

Hi Adrian,

We discussed this over IRC, but let's keep a trace of it here.

This patch is probably responsible of the following error in the
autobuilder, during arm hosted selftests:

2025-12-30 16:17:15,120 - oe-selftest - INFO - devtool.DevtoolIdeSdkTests.t=
est_devtool_ide_sdk_code_cmake (subunit.RemotedTestCase)
2025-12-30 16:17:15,121 - oe-selftest - INFO -  ... FAIL
...
AssertionError: Command '/srv/pokybuild/yocto-worker/oe-selftest-armhost/bu=
ild/build-st-1628878/tmp/work/aarch64-linux/gdb-cross-aarch64/16.3/recipe-s=
ysroot-native/usr/bin/aarch64-poky-linux/aarch64-poky-linux-gdb --batch -ex=
 'set sysroot /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-s=
t-1628878/tmp/work/cortexa57-poky-linux/cmake-example/1.0/image' -ex 'pytho=
n import sys;sys.path.insert(0, '"'"'/srv/pokybuild/yocto-worker/oe-selftes=
t-armhost/build/build-st-1628878/tmp/work/cortexa57-poky-linux/cmake-exampl=
e/1.0/recipe-sysroot/usr/share/gcc-15.2.0/python'"'"');from libstdcxx.v6.pr=
inters import register_libstdcxx_printers;register_libstdcxx_printers(None)=
' -ex 'set substitute-path /usr/include /srv/pokybuild/yocto-worker/oe-self=
test-armhost/build/build-st-1628878/tmp/work/cortexa57-poky-linux/cmake-exa=
mple/1.0/recipe-sysroot/usr/include' -ex 'set substitute-path /usr/src/debu=
g/cmake-example/1.0 /tmp/devtoolqa7jq2nm81' -ex 'set substitute-path /usr/s=
rc/debug /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-162=
8878/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/src=
/debug' -ex 'set solib-search-path /srv/pokybuild/yocto-worker/oe-selftest-=
armhost/build/build-st-1628878/tmp/work/qemuarm64-poky-linux/oe-selftest-im=
age/1.0/rootfs-dbg/lib/.debug:/srv/pokybuild/yocto-worker/oe-selftest-armho=
st/build/build-st-1628878/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1=
.0/rootfs-dbg/usr/lib/.debug:/srv/pokybuild/yocto-worker/oe-selftest-armhos=
t/build/build-st-1628878/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.=
0/rootfs-dbg/usr/lib/debug:/srv/pokybuild/yocto-worker/oe-selftest-armhost/=
build/build-st-1628878/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.0/=
rootfs-dbg/lib:/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-=
st-1628878/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/u=
sr/lib:/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-16288=
78/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.0/rootfs/lib:/srv/poky=
build/yocto-worker/oe-selftest-armhost/build/build-st-1628878/tmp/work/qemu=
arm64-poky-linux/oe-selftest-image/1.0/rootfs/usr/lib' -ex 'file /srv/pokyb=
uild/yocto-worker/oe-selftest-armhost/build/build-st-1628878/tmp/work/corte=
xa57-poky-linux/cmake-example/1.0/image/usr/bin/cmake-example' -ex 'target =
remote 192.168.7.4:1234' -ex 'break main' -ex 'continue' -ex 'break CppExam=
ple::print_json()' -ex 'continue' -ex 'print CppExample::test_string.compar=
e("cpp-example-lib Magic: 123456789")' -ex 'print CppExample::test_string.c=
ompare("cpp-example-lib Magic: 123456789aaa")' -ex 'list cpp-example-lib.hp=
p:14,14' -ex 'list cpp-example.cpp:55,55' -ex 'break cpp-example.cpp:55' -e=
x 'continue' -ex 'print numbers' -ex 'continue'' returned non-zero exit sta=
tus 1:
_start () at ../sysdeps/aarch64/dl-start.S:23
23	ENTRY (_start)
Breakpoint 1 at 0xaaaaaaaa1400: file /usr/src/debug/cmake-example/1.0/cpp-e=
xample.cpp, line 15.

Breakpoint 1, main (argc=3D1, argv=3D0xfffffffffd08) at /usr/src/debug/cmak=
e-example/1.0/cpp-example.cpp:15
15	{
Breakpoint 2 at 0xfffff7f91d70: file /usr/src/debug/cmake-example/1.0/cpp-e=
xample-lib.cpp, line 28.

Breakpoint 2, CppExample::print_json (this=3D0xfffffffffac8) at /usr/src/de=
bug/cmake-example/1.0/cpp-example-lib.cpp:28
28	    jobj =3D json_object_new_object();
$1 =3D 0
$2 =3D -3
14	    inline static const std::string test_string =3D "cpp-example-lib Mag=
ic: 123456789";
55	    std::vector<int> numbers =3D {1, 2, 3};
No compiled code for line 55 in file "cpp-example.cpp".
Make breakpoint pending on future shared library load? (y or [n]) [answered=
 N; input not from terminal]
[Inferior 1 (process 346) exited normally]
A syntax error in expression, near the end of `numbers'.
The program is not being run.
...
2025-12-30 16:26:11,523 - oe-selftest - INFO - devtool.DevtoolIdeSdkTests.t=
est_devtool_ide_sdk_none_qemu (subunit.RemotedTestCase)
2025-12-30 16:26:11,524 - oe-selftest - INFO -  ... FAIL
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3070

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


