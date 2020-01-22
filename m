Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4AB7FD5F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 21:20:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00MLJxHY009159
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 13:20:10 -0800
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 22 Jan 2020 13:19:49 -0800
To: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <87tv4n5jm4.fsf@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <1f3d52d7-c738-855c-e48c-61c0a2e64111@windriver.com>
Date: Wed, 22 Jan 2020 16:19:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87tv4n5jm4.fsf@windriver.com>
X-Originating-IP: [172.25.44.8]
Subject: Re: [PATCHv2] kbd: make libkbdfile-test08 ptest work for multilib
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
X-List-Received-Date: Wed, 22 Jan 2020 21:20:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit


LGTM.

Thanks Matthew.
../Randy

On 1/22/20 3:20 PM, Mingde (Matthew) Zeng wrote:
> This patch fixes kbd ptest libkbdfile-test08 failure in 64-bit images.
> 
> ```sh
> root@intel-x86-64:/usr/lib64/kbd/ptest# ./run-ptest
> make: Entering directory '/usr/lib64/kbd/ptest/tests'
> make[1]: Entering directory '/usr/lib64/kbd/ptest/tests'
> PASS: libkbdfile-test01
> PASS: libkbdfile-test02
> PASS: libkbdfile-test03
> PASS: libkbdfile-test04
> PASS: libkbdfile-test05
> PASS: libkbdfile-test06
> PASS: libkbdfile-test07
> FAIL: libkbdfile-test08
> PASS: libkbdfile-test09
> ...
> ```
> 
> `DATADIR` and `ABS_DATADIR` are compile flags defined in
> ./kbd/tests/Makefile.am. `DATADIR` is the relative directory of
> kbd, i.e `./kbd/ptest/tests` whereas `ABS_DATADIR` is the full
> directory path, i.e `/usr/lib/kbd/ptest/tests`. The latter has a
> problem when building ptests for a 64-bit image, because the tests
> folder is located at `/usr/lib64/kbd/ptest/tests` instead.
> 
> Therefore `ABS_DATADIR` is changed to `DATADIR`, also consistent with
> what *every other* kbd test is doing.
> 
> The test searches DATADIR recursively for a file named `test0.map`,
> but it finds the wrong file at
>      `/findfile/test_0/keymaps/test0.map`,
> while it actually needs
>      `/findfile/test_0/keymaps/i386/qwerty/test0.map`.
> 
> Thus appending `/i386` to `dirpath` so that `libkbdfile-test08.c`
>      finds the right test file.
> 
> Signed-off-by: Matthew Zeng<Matthew.Zeng@windriver.com>
> ---
>   ...append-i386-to-fix-libkbdfile-test08.patch | 45 +++++++++++++++++++
>   meta/recipes-core/kbd/kbd_2.2.0.bb            |  1 +
>   2 files changed, 46 insertions(+)
>   create mode 100644 meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch
> 
> diff --git a/meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch b/meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch
> new file mode 100644
> index 0000000000..54e4dc9034
> --- /dev/null
> +++ b/meta/recipes-core/kbd/kbd/0001-Use-DATADIR-and-append-i386-to-fix-libkbdfile-test08.patch
> @@ -0,0 +1,45 @@
> +From 4c12f76f4177cfd560cf708a16774ebfadbd41a5 Mon Sep 17 00:00:00 2001
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
> +made drastic changes since v2.2.0, in fact they got rid of ABS_DATADIR
> +in commit 5b6df5c along with a series of other commits which may or
> +may not fix this issue. We will find out in future releases.
> +
> +Signed-off-by: Matthew Zeng<Matthew.Zeng@windriver.com>
> +---
> + tests/libkbdfile-test08.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/tests/libkbdfile-test08.c b/tests/libkbdfile-test08.c
> +index bf41707..5e287f1 100644
> +--- a/tests/libkbdfile-test08.c
> ++++ b/tests/libkbdfile-test08.c
> +@@ -14,14 +14,14 @@ main(int __attribute__((unused)) argc, char **argv)
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
> + 	int rc = 0;
> +
> +-	rc = kbdfile_find((char *)(ABS_DATADIR "/findfile/test_0/keymaps/i386/qwerty/test0"), (char **) dirpath, (char **) suffixes, fp);
> ++	rc = kbdfile_find((char *)"test0", (char **) dirpath, (char **) suffixes, fp);
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

