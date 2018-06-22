Return-Path: <ptsneves@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADBF75219
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 18:44:10 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id h10-v6so7591584wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 11:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aj7lq0eAytLi8MNq1n7W/qIChJMNzrMtqzjEsUM9G9c=;
	b=XDu04LIrwFnkZedipx7LtWb23Ak4846zhxvi7+nnqnmLw4jZz1gldbzyygZ1V2ugVN
	R3xtLNtaGwM5zbDhNS/cvrpSRcKOMXSBuSXoQJ8vlcswafMHDqf7blQQNJRSk8SvHYdC
	DjRgctXhlj16gY9vta3FqiVUZKfeY3h3iEYLWtiNMLKHnTNClToq2bxvt5vKGXEApQeP
	HaAAC44i6wtP/A31ahJ7iJproTERS66HQ+KJkJtoSV5Dx/JjHMPpUu5DF+BbiX86Y6w+
	14dUTWPPGNFI64s3A6dYjABZgi1CkdkTfDjfeowapFGO0nQXxtkRIAEULiBT6mXA+3UJ
	ZKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aj7lq0eAytLi8MNq1n7W/qIChJMNzrMtqzjEsUM9G9c=;
	b=pDA2tMf4bY8b1HLAwp8CBZPWb44KJ5ZvyOchsXHKuA7SN/dEoequo1Kr7SYnyiF7d4
	4Zj+wHh13ClB4zIfyrIxDPywDYPVPG6T9A89QOCRKULmrmfl9OVOzl/dXY1vKKF4w725
	3/lj2uT9+XoGK71cs2TLRlsl0QNyVo2vLkBssiVyYpxKZ22VNJyIXh5IK06sj3tt5hvw
	GFxpkXl0bJJwqdZPzRblnISiT4dHAVhVawfV4YI7S3rlF2mJ/X2JVm9v/21ft2PyrRJg
	fghnqRr1M87pHqpBnLtEfGm1gPi2WGmWCSkoeTFQUcIoQobLoYrKObFw9ZM6x+1ZRhWf
	60sQ==
X-Gm-Message-State: APt69E0ObYDRBXLVqQ3AHs5SNCmsEeV9l1/CAePUEm05RRRMKFnTt7nm
	RXN4rCxfa9Nge+Uq632T4fdHLERpg+QboQS8M0aR5kA=
X-Google-Smtp-Source: AAOMgpdtHnWO2i94hv0Gty5S8VSbPHPCS9MAyrAOTvJmc7GT5NpipJ+dHepiO9J6Gq8IKVoN03VxzODMDD3pUW4pqfk=
X-Received: by 2002:adf:cf0d:: with SMTP id
	o13-v6mr2462149wrj.112.1529693051034; 
	Fri, 22 Jun 2018 11:44:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:3e0b:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 11:44:10
	-0700 (PDT)
In-Reply-To: <20180619202029.5338-1-ptsneves@gmail.com>
References: <20180619202029.5338-1-ptsneves@gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
Date: Fri, 22 Jun 2018 20:44:10 +0200
Message-ID: <CAJO0J4he-mJZbhQtVD_-3YxUACY6xxVFgbTGRW+BnVaeuneURQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meson-with-tests: Allows for build time tests of meson
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
X-List-Received-Date: Fri, 22 Jun 2018 18:44:10 -0000
Content-Type: text/plain; charset="UTF-8"

By suggestion of Alexander I have tried to change recipes known to use meson
My results are mixed.

With libinput the test was skipped automatically
With libepoxy there were no tests defined.
With json-glib I can run 13/14 tests successfully. One of the tests
exits with a segmentation fault and I cannot know if it is qemu giving
the ghost or a real code bug. Given that the 13 of 14 tests pass
successfully I find that the risk of misconfiguration on my part is
reduced. Because many heads think better than 1 or even 2 I leave here
the result logs of the failing test: My next step is to build the text
executable and run it on a target, to rule out qemu error.

There is an error that catches my attention: A child process outputs
on stderr  "/lib/ld-linux-armhf.so.3: No such file or directory\n".
This implies that somehow a fork or execve inside qemu is escaping my
exe_wrapper and running without -L sysroot option, but a strace
revealed a correct qemu execve syscall. Also, if somehow there is an
escape of qemu it is odd it only happens in a specific test. This
failure is reproducible.

There is also a segmentation fault on qemu but I cannot know if it is
qemu or the program. I think the segmentation fault is the test's
fault because just before death  there is an assertion fail that does
not happen when i run the test built with my native toolchain.

Paulo Neves

ERROR: json-glib-1.4.2-r0 do_compile: Function failed: do_compile (log
file is located at
/home/pneves/builds/tmp/work/cortexa15hf-neon-poky-linux-gnueabi/json-glib/1.4.2-r0/temp/log.do_compile.17219)
ERROR: Logfile of failure stored in:
/home/pneves/builds/tmp/work/cortexa15hf-neon-poky-linux-gnueabi/json-glib/1.4.2-r0/temp/log.do_compile.17219
Log data follows:
| DEBUG: Executing shell function do_compile
| ninja: no work to do.
| [0/1] Running all tests.
|  1/14 array                                   OK       0.07 s
|  2/14 boxed                                   OK       0.09 s
|  3/14 builder                                 OK       0.08 s
|  4/14 generator                               OK       0.14 s
|  5/14 gvariant                                OK       0.16 s
|  6/14 invalid                                 OK       0.11 s
|  7/14 node                                    FAIL     0.26 s
|  8/14 object                                  OK       0.11 s
|  9/14 parser                                  OK       0.17 s
| 10/14 path                                    OK       0.11 s
| 11/14 reader                                  OK       0.10 s
| 12/14 serialize-simple                        OK       0.08 s
| 13/14 serialize-complex                       OK       0.10 s
| 14/14 serialize-full                          OK       0.08 s
|
| OK:        13
| FAIL:       1
| SKIP:       0
| TIMEOUT:    0
|
|
| The output from the failed tests:
|
|  7/14 node                                    FAIL     0.26 s
|
| --- command ---
| G_TEST_SRCDIR='/home/pneves/builds/tmp/work/cortexa15hf-neon-poky-linux-gnueabi/json-glib/1.4.2-r0/json-glib-1.4.2/json-glib/tests'
G_TEST_BUILDDIR='/home/pneves/builds/tmp/work/cortexa15hf-neon-poky-linux-gnueabi/json-glib/1.4.2-r0/build/json-glib/tests'
/home/pneves/builds/tmp/work/cortexa15hf-neon-poky-linux-gnueabi/json-glib/1.4.2-r0/meson_exe_wrapper.sh
/home/pneves/builds/tmp/work/cortexa15hf-neon-poky-linux-gnueabi/json-glib/1.4.2-r0/build/json-glib/tests/node
--tap -k
| --- stdout ---
| # random seed: R02Sd21f2673b828a5a1afbadb819142cde4
| 1..27
| # Start of nodes tests
| ok 1 /nodes/gvalue
| # Start of init tests
| ok 2 /nodes/init/int
| ok 3 /nodes/init/double
| ok 4 /nodes/init/boolean
| ok 5 /nodes/init/string
| ok 6 /nodes/init/null
| # End of init tests
| # Start of copy tests
| ok 7 /nodes/copy/null
| ok 8 /nodes/copy/value
| ok 9 /nodes/copy/object
| # End of copy tests
| # Start of get tests
| ok 10 /nodes/get/int
| ok 11 /nodes/get/double
| # End of get tests
| # Start of gvalue tests
| ok 12 /nodes/gvalue/autopromotion
| # End of gvalue tests
| # Start of seal tests
| ok 13 /nodes/seal/int
| ok 14 /nodes/seal/double
| ok 15 /nodes/seal/boolean
| ok 16 /nodes/seal/string
| ok 17 /nodes/seal/null
| ok 18 /nodes/seal/object
| ok 19 /nodes/seal/array
| # End of seal tests
| # Start of immutable tests
| # child process (/nodes/immutable/int [17270]) stdout: ""
| # child process (/nodes/immutable/int [17270]) stderr:
"/lib/ld-linux-armhf.so.3: No such file or directory\n"
| # Json:ERROR:../json-glib-1.4.2/json-glib/tests/node.c:376:test_immutable_int:
stderr of child process (/nodes/immutable/int [17270]) failed to
match: *Json-CRITICAL **: json_node_set_int: assertion
'!node->immutable' failed*
| --- stderr ---
| **
| Json:ERROR:../json-glib-1.4.2/json-glib/tests/node.c:376:test_immutable_int:
stderr of child process (/nodes/immutable/int [17270]) failed to
match: *Json-CRITICAL **: json_node_set_int: assertion
'!node->immutable' failed*
| qemu: uncaught target signal 6 (Aborted) - core dumped
| Aborted (core dumped)
| -------
|
| Full log written to
/home/pneves/builds/tmp/work/cortexa15hf-neon-poky-linux-gnueabi/json-glib/1.4.2-r0/build/meson-logs/testlog.txt
| FAILED: meson-test
| /home/pneves/builds/tmp/work/cortexa15hf-neon-poky-linux-gnueabi/json-glib/1.4.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
-u /home/pneves/builds/tmp/work/cortexa15hf-neon-poky-linux-gnueabi/json-glib/1.4.2-r0/recipe-sysroot-native/usr/bin/meson
test --no-rebuild --print-errorlogs
| ninja: build stopped: subcommand failed.
| WARNING: exit code 1 from a shell command.

On Tue, Jun 19, 2018 at 10:20 PM, Paulo Neves <ptsneves@gmail.com> wrote:
> meson build system has the functionality of setting
> an executable wrapper to run cross-compiled
> binaries. The setting is called exe_wrapper and can
> be defined in the meson.cross file. With a valid
> exe_wrapper meson build system can test if the built
> binary is sane.
>
> Another advantage of setting exe_wrapper setting
> is that we can run the tests defined in the meson
> build system. This way if this class is inherited
> not only are the default targets built, their tests
> will also run and have an opportunity to fail the
> the build at the recipe level if necessary.
>
> The user of this class should not inherit meson
> directly but leave it to this class. This class
> may later be merged into meson.bbclass itself.
>
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  meta/classes/meson-with-tests.bbclass | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta/classes/meson-with-tests.bbclass
>
> diff --git a/meta/classes/meson-with-tests.bbclass b/meta/classes/meson-with-tests.bbclass
> new file mode 100644
> index 0000000000..ddaeebc726
> --- /dev/null
> +++ b/meta/classes/meson-with-tests.bbclass
> @@ -0,0 +1,26 @@
> +inherit meson
> +
> +DEPENDS_append += "qemu-native"
> +
> +do_write_config_append() {
> +  #You need to pass qemu with the sysroot path
> +  #arguments, but internally meson uses Popen
> +  #so we could try lists of arguments
> +  #While passing a list directly in the exe_wrapper
> +  #parameter passes the sanity test, it later on
> +  #fails in the actual test run with:
> +  #TypeError: expect bytes or str, not list
> +  #So we create an in here wrapper.
> +  cat > ${WORKDIR}/meson_exe_wrapper.sh << EOF
> +#!/bin/sh
> +qemu-${TARGET_ARCH} -L ${RECIPE_SYSROOT} \$@
> +EOF
> +
> +  chmod u+x ${WORKDIR}/meson_exe_wrapper.sh
> +
> +  sed "/binaries/a\exe_wrapper = '${WORKDIR}/meson_exe_wrapper.sh'" -i ${WORKDIR}/meson.cross
> +}
> +
> +do_compile_append() {
> +  ninja test
> +}
> --
> 2.14.1
>

