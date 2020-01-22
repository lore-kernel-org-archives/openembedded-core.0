Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E22587F8AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 19:30:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00MJUUJ7006452
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 11:30:40 -0800
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 22 Jan 2020 11:30:19 -0800
To: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <87a76fcoqf.fsf@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <f6b6d458-e35c-ce8f-ee32-0dc935c1c986@windriver.com>
Date: Wed, 22 Jan 2020 14:30:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87a76fcoqf.fsf@windriver.com>
X-Originating-IP: [172.25.44.8]
Subject: Re: [PATCH] kbd: fix ptest libkbdfile-test08
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
X-List-Received-Date: Wed, 22 Jan 2020 19:30:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Change your oneline summary from:
    Re: [PATCH] kbd: fix ptest libkbdfile-test08
to:
    Re: [PATCH] kbd: make libkbdfile-test08 ptest work for multilib

That's more specific so it helps readers but it's still terse
and just a bit over the recommended 50 character git shortlog length:
    https://chris.beams.io/posts/git-commit/

( See the definition of multlib in:
 
https://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#combining-multiple-versions-library-files-into-one-image 
)

On 1/22/20 1:47 PM, Mingde (Matthew) Zeng wrote:

Hold on...

First you should state the problem you are solving and
include the key part of a test failure output.

>      `DATADIR` and `ABS_DATADIR` are compile flags defined in
>      ./kbd/tests/Makefile.am. `DATADIR` is the relative directory of
>      kbd, i.e `./kbd/ptest/tests` whereas `ABS_DATADIR` is the full
>      directory path, i.e `/usr/lib/kbd/ptest/tests`. The latter has a
>      problem when building ptests for a 64-bit image, because the tests
>      folder is located at `/usr/lib64/kbd/ptest/tests` instead.
> 
>      Therefore `ABS_DATADIR` is changed to `DATADIR`, also consistent
>      with what *every other* kbd test is doing.

If that's what every other kbd test is doing, then maybe your patch
would be accepted upstream... Oh, I see below that upstream has been
making significant changes so I suppose it's okay to keep this as
oe-specific. In fact they get rid if this ABS_DATADIR in commit:
    5b6df5c Use autotest
so you might mention that in the commit/patch log.

> 
>      The test searches DATADIR recursively for a file named
>      `test0.map`, but it finds the wrong file at
>      `/findfile/test_0/keymaps/i386/qwerty/test0.map`, while it
>      actually needs `/findfile/test_0/keymaps/i386/qwerty/test0.map`.

Your formatting here could be improved, i.e.:


The test searches DATADIR recursively for a file named `test0.map`,
but it finds the wrong file at:
    `/findfile/test_0/keymaps/i386/qwerty/test0.map`,
while it actually needs:
    `/findfile/test_0/keymaps/i386/qwerty/test0.map`.
---
This format also makes it clear that you have used the same path twice
which doesn't seem to make sense, right?

> 
>      Thus appending `/i386` to `dirpath` so that `libkbdfile-test08.c`
>      finds the right test file.
> 
> Signed-off-by: Matthew Zeng<Matthew.Zeng@windriver.com>
> ---
>   ...append-i386-to-fix-libkbdfile-test08.patch | 44 +++++++++++++++++++
>   meta/recipes-core/kbd/kbd_2.2.0.bb            |  1 +
>   2 files changed, 45 insertions(+)
>   create mode 100644 meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch
> 
> diff --git a/meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch b/meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch
> new file mode 100644
> index 0000000000..ec40764c1d
> --- /dev/null
> +++ b/meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch
> @@ -0,0 +1,44 @@
> +From 92c0fb720cf7b9966494e5eaa1f7a4ea8e0a34d2 Mon Sep 17 00:00:00 2001
> +From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
> +Date: Wed, 22 Jan 2020 11:02:17 -0500
> +Subject: [PATCH] Use DATADIR and append i386 to fix libkbdfile-test08 ptest
> + failure
> +
> +Replace ABS_DATADIR with DATADIR and append i386 to dirpath.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +This OE specific patch applies to kbd v2.2.0 for now, the upstream
> +    made drastic changes since v2.2.0 which may or may not fix this
> +    issue, we will find out in future releases.
> +
> +Signed-off-by: Matthew Zeng<Matthew.Zeng@windriver.com>
> +---
> + tests/libkbdfile-test08.c | 8 +++-----
> + 1 file changed, 3 insertions(+), 5 deletions(-)
> +
> +diff --git a/tests/libkbdfile-test08.c b/tests/libkbdfile-test08.c
> +index bf41707..993fedc 100644
> +--- a/tests/libkbdfile-test08.c
> ++++ b/tests/libkbdfile-test08.c
> +@@ -14,14 +14,12 @@ main(int __attribute__((unused)) argc, char **argv)
> + 	if (!fp)
> + 		kbd_error(EXIT_FAILURE, 0, "unable to create kbdfile");
> +
> +-	const char *const dirpath[]  = { "", DATADIR "/findfile/test_0/keymaps/**", 0 };
> ++	const char *const dirpath[]  = { "", DATADIR "/findfile/test_0/keymaps/i386/**", 0 };
> + 	const char *const suffixes[] = { "", ".map", ".kmap", 0 };
> +
> +-	const char *expect = ABS_DATADIR "/findfile/test_0/keymaps/i386/qwerty/test0.map";
> ++	const char *expect = DATADIR "/findfile/test_0/keymaps/i386/qwerty/test0.map";
> +
> +-	int rc = 0;
> +-
> +-	rc = kbdfile_find((char *)(ABS_DATADIR "/findfile/test_0/keymaps/i386/qwerty/test0"), (char **) dirpath, (char **) suffixes, fp);
> ++	int rc = kbdfile_find((char *)"test0", (char **) dirpath, (char **) suffixes, fp);

Minor point but generally, when you are fixing a bug,
just change the minimum so in the 4 lines above, you should leave:
    int rc = 0;
That makes the diff a bit smaller and means that any compiler output
such as a warning should remain the same. Most bug fixes should ideally
only affect the bug being addressed.

Good work, please send a v2.

../Randy


> +
> + 	if (rc != 0)
> + 		kbd_error(EXIT_FAILURE, 0, "unable to find file");
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-core/kbd/kbd_2.2.0.bb b/meta/recipes-core/kbd/kbd_2.2.0.bb
> index df9b0bb90b..e13cea7634 100644
> --- a/meta/recipes-core/kbd/kbd_2.2.0.bb
> +++ b/meta/recipes-core/kbd/kbd_2.2.0.bb
> @@ -16,6 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
>              file://run-ptest \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://set-proper-path-of-resources.patch', '', d)} \
>              file://0001-analyze.l-add-missing-string-format.patch \
> +           file://0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch \
>              "
> 
>   SRC_URI[md5sum] = "d1d7ae0b5fb875dc082731e09cd0c8bc"
> --
> 2.24.0
> 


-- 
# Randy MacLeod
# Wind River Linux

