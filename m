Return-Path: <dvhart@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B4AB765DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 18:14:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Oct 2014 11:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,679,1406617200"; d="scan'208";a="611481429"
Received: from fodeyemi-mobl.amr.corp.intel.com (HELO [10.255.93.105])
	([10.255.93.105])
	by fmsmga002.fm.intel.com with ESMTP; 08 Oct 2014 11:14:31 -0700
User-Agent: Microsoft-MacOutlook/14.4.3.140616
Date: Wed, 08 Oct 2014 11:14:29 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <D05ACCDB.AC1D5%dvhart@linux.intel.com>
Thread-Topic: master: qemu-native fails do_compile: unrecognized command line
	option =?ISO-8859-1?B?jC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZ7k=?=
References: <D05ACA13.AC1CD%dvhart@linux.intel.com>
In-Reply-To: <D05ACA13.AC1CD%dvhart@linux.intel.com>
Mime-version: 1.0
Subject: =?UTF-8?B?UmU6IG1hc3RlcjogcWVtdS1uYXRpdmUgZmFpbHMgZG9fY29tcGlsZTogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBvcHRpb24gxZItZnN0YWNrLXByb3RlY3Rvci1zdHJvbmfCuQ==?=
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Oct 2014 18:14:56 -0000
Content-type: text/plain;
	charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable

On 10/8/14, 11:00, "Darren Hart" <dvhart@linux.intel.com> wrote:

>I'm seeing the following error attempting to build qemu-native for
>qemux86-64 from the master branch:
>
>ERROR: Logfile of failure stored in:
>/build/yocto/master/intel-corei7-64_20141008094748/build/tmp/work/x86_64-l
>i
>nux/qemu-native/2.1.0-r0/temp/log.do_compile.737
>Log data follows:
>| DEBUG: Executing shell function do_compile
>| NOTE: make -j 1
>|   GEN   arm-linux-user/config-devices.mak
>|   GEN   arm-softmmu/config-devices.mak
>|   GEN   i386-linux-user/config-devices.mak
>|   GEN   i386-softmmu/config-devices.mak
>|   GEN   x86_64-linux-user/config-devices.mak
>|   GEN   x86_64-softmmu/config-devices.mak
>|   GEN   config-all-devices.mak
>|   GEN   config-host.h
>|   GEN   qemu-options.def
>|   GEN   qmp-commands.h
>|   GEN   qapi-types.h
>|   GEN   qapi-visit.h
>|   GEN   qapi-event.h
>|   GEN   trace/generated-events.h
>|   GEN   trace/generated-tracers.h
>|   GEN   tests/test-qapi-types.h
>|   GEN   tests/test-qapi-visit.h
>|   GEN   tests/test-qmp-commands.h
>|   GEN   tests/test-qapi-event.h
>|   CC    tests/qemu-iotests/socket_scm_helper.o
>|   LINK  tests/qemu-iotests/socket_scm_helper
>| g++: error: unrecognized command line option '-fstack-protector-strong'
>|=20
>/build/yocto/master/intel-corei7-64_20141008094748/build/tmp/work/x86_64-l
>i
>nux/qemu-native/2.1.0-r0/qemu-2.1.0/rules.mak:88: recipe for target
>'tests/qemu-iotests/socket_scm_helper' failed
>| make: *** [tests/qemu-iotests/socket_scm_helper] Error 1
>| ERROR: oe_runmake failed
>| WARNING: exit code 1 from a shell command.
>| ERROR: Function failed: do_compile (log file is located at
>/build/yocto/master/intel-corei7-64_20141008094748/build/tmp/work/x86_64-l
>i
>nux/qemu-native/2.1.0-r0/temp/log.do_compile.737)
>ERROR: Task 7=20
>(virtual:native:/build/yocto/master/intel-corei7-64_20141008094748/poky/me
>t
>a/recipes-devtools/qemu/qemu_2.1.0.bb, do_compile) failed with exit code
>'1'
>
>
>The key bit being:
>| g++: error: unrecognized command line option '-fstack-protector-strong'
>
>
>
>As this appears to be a toolchain versioning issue, I tested this
>independently:
>
>dvhart@rage:~
>$ g++-4.8 -fstack-protector-strong test.c -o test
>g++-4.8: error: unrecognized command line option
>=8C-fstack-protector-strong=B9
>
>dvhart@rage:~
>$ g++-4.9 -fstack-protector-strong test.c -o test
>dvhart@rage:~
>
>$ ./test
>Hello World!
>
>
>Sure enough, 4.9 supports this, and 4.8 does not. I'm looking into if
>this=20
>is a qemu-native configuration issue or something else... But if anyone
>already has a solution in hand, please let me know.

This appears to be related to the Debian Jessie default g++ (4.8). If I
set it to 4.9, the build continues.

--=20
Darren Hart
Intel Open Source Technology Center




