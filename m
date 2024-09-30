Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069EECF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 09:20:50 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.50536.1727688041936099278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 02:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NsRdBI6b;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5398df2c871so1508834e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727688040; x=1728292840; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2nbapM0zIzPU6eO7/IDR7KOPKxkxzELjekYsRqUIzc=;
        b=NsRdBI6b024iOTy+5ojb7pY4wLXevTks6S69TsHSFEG8X5/BqP9UGQEd9zzfg727mh
         0kHD6jGKNp8spkkypdzl3n9n3FsAYRTve0B7ezZKLA9Y/4RmZnrXn5pMtoj4484uZJDe
         03WSi9P153gIM/7QDnB1QN0x2nkktDe0zafYpCBL36Ce3Hn8O7oDNWETGDd1pQ/1vHVF
         oBMxc4Ne8l1yBvflAomKg68lvnWPeL5McAfEFB6xsdUko41xjwxLgAJtmy3hqKMWjMDg
         N/py/R6hQsQ4KbtZgkUwhOztQliYl60N7cgLov4/s84ZkxgGfWTJje3UjkQXX8vySZgG
         lNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727688040; x=1728292840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2nbapM0zIzPU6eO7/IDR7KOPKxkxzELjekYsRqUIzc=;
        b=hX+dZHtY0KctqdW5TCrWv+VJq16S8ZdD7VbCNXcDGq5HfDMOw/b/mWeew8/fEnltWw
         1kA2U+HGndpg5umdXIKt/oD0qe7HUbvW4Lnhixk0B/G+1oTlgoQrStJub8J4VTE5mwUk
         S31eLtsu3cRnWQo8YPqAZf7vPlbePtMZz273ZQdvsAMEQgUvZ05NlFlDcN1bo9CWfwY8
         aJG3fYd51FZ2tWeOgjCe3DXng+KOB40ohaiYa9BSoAh28davXrKUNCAkgcNUMVxhjo88
         qBgpPMbA8Vqotimi+K8QSIQNPtwe8axiGRhPQWbTb/WzN6++9+IS1RmUyPCG+qU4ewK6
         CWjA==
X-Gm-Message-State: AOJu0Yz2G/BBb9fv3FMU1MFnGE9rSqlLZoR+lglBO/CrxYyCkeykDXCp
	ADs0uwhVpIOBquUrtega16kBMy/6jaO7rE+GOuc/R7sKSXGJUrKiwJbCJhoWj25hQlOUP/tFfvD
	SJ04rc8f8K8v0WMhya/hnlbym7iQ=
X-Google-Smtp-Source: AGHT+IHPZYiSxep67Hgey3TWJM+jJ/oUeY3akblBD1W5Cxt51aZLJiFa4FzGbZiDH3tb5ZGPHvjVMBpS9WO/sLMyw9M=
X-Received: by 2002:a05:6512:1046:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-5389fc3c3a9mr5099461e87.20.1727688039127; Mon, 30 Sep 2024
 02:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240930091015.21148-1-yoann.congal@smile.fr>
In-Reply-To: <20240930091015.21148-1-yoann.congal@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Sep 2024 11:20:27 +0200
Message-ID: <CANNYZj8uwvjD3kLRP_YmsriveP_1kjWQpFzwTRfnoQoU8w5rrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] reproducibility: continue testing in case of
 build failure
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 09:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205103

I'm not sure I can support this. It adds a lot of difficult to
understand code with the sole purpose of dancing around the build
failures, I'd rather just fail the test with no attempt to salvage
reproducibility comparisons and keep implmenetation simple and short.


Alex

On Mon, 30 Sept 2024 at 11:11, Yoann Congal via lists.openembedded.org
<yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> The current reproducibility test stops all build tasks when a single
> task fails (default BitBake behavior). This means that a single build
> failure prevents the reproducibility of other packages from being
> tested, which is not ideal.
>
> To address this, we now use the --continue option of BitBake during test
> builds, allowing the build process to proceed even when some tasks fail.
> The failure cases are handled as gracefully as possible.
>
> In the event of a build failure:
> - The entire reproducibility test will be considered a failure.
> - The complete BitBake log will be saved in the "saved output" directory
>   to facilitate debugging. On the autobuilder, this log should be
>   available at https://autobuilder.yocto.io/pub/repro-fail/.
> - The last 20 lines of the log, which should show the failing recipes,
>   will be displayed in the oe-selftest console.
> - If BitBake fails to create the deployment directory, it will be
>   manually created to allow the comparison process to proceed.
>
> Here is what the output looks like when testing reproducibility of bash,
> a failing recipe (hello-fail) and a non-reproducible recipe
> (hello-norepro):
>    $ rm -rf ../build-master-st <snip>/yocto/repro_output/* ; OEQA_DEBUGGI=
NG_SAVED_OUTPUT=3D<snip>/yocto/repro_output oe-selftest -r reproducible.Rep=
roducibleTests
>   <snip>
>   2024-09-30 00:04:27,485 - oe-selftest - INFO - test_reproducible_builds=
 (reproducible.ReproducibleTests.test_reproducible_builds)
>   2024-09-30 00:05:31,676 - oe-selftest - INFO - Non-reproducible package=
s will be copied to <snip>/yocto/repro_output/oe-reproducible-20240930-aukc=
_3o6
>   2024-09-30 00:05:31,676 - oe-selftest - INFO - Building reproducibleA (=
sstate allowed)...
>   2024-09-30 00:13:08,009 - oe-selftest - INFO - Bitbake failed! but keep=
 going... Log:
>   2024-09-30 00:13:08,009 - oe-selftest - INFO -     Command 'bitbake  --=
continue bash hello-norepro hello-fail' returned non-zero exit status 1:
>   2024-09-30 00:13:08,009 - oe-selftest - INFO -
>   2024-09-30 00:13:08,009 - oe-selftest - INFO -     ... (last 20 lines o=
f output)
>   2024-09-30 00:13:08,009 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_package_write_deb: Started
>   2024-09-30 00:13:08,009 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_package_qa: Started
>   2024-09-30 00:13:08,009 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_populate_sysroot: Succeeded
>   2024-09-30 00:13:08,009 - oe-selftest - INFO -     NOTE: Running setsce=
ne task 342 of 343 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.3=
2.bb:do_create_package_spdx_setscene)
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_create_package_spdx_setscene: Started
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_create_package_spdx_setscene: Succeeded
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: Running setsce=
ne task 343 of 343 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.3=
2.bb:do_create_spdx_setscene)
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_create_spdx_setscene: Started
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_create_spdx_setscene: Succeeded
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_package_qa: Succeeded
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_package_write_deb: Succeeded
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: Running noexec=
 task 979 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.=
bb:do_build)
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: Tasks Summary:=
 Attempted 979 tasks of which 833 didn't need to be rerun and 1 failed.
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     NOTE: Generating JSO=
N CVE summary
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     Complete CVE JSON re=
port summary created at: <snip>/yocto/poky/build-master-st/reproducibleA/tm=
p/log/cve/cve-summary.json
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     Summary: 1 task fail=
ed:
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -       <snip>/yocto/poky/=
meta/recipes-core/hello-single/hello-fail_1.0.bb:do_compile
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -         log: <snip>/yoct=
o/poky/build-master-st/reproducibleA/tmp/work/core2-64-poky-linux/hello-fai=
l/1.0/temp/log.do_compile.2116040
>   2024-09-30 00:13:08,010 - oe-selftest - INFO -     Summary: There was 1=
 ERROR message, returning a non-zero exit code.
>   2024-09-30 00:13:08,011 - oe-selftest - INFO - reproducibleA build fail=
ed. Trying to compute built packages differences but the test will fail.
>   2024-09-30 00:13:08,011 - oe-selftest - INFO - Building reproducibleB-e=
xtended (sstate NOT allowed)...
>   2024-09-30 00:40:12,933 - oe-selftest - INFO - Bitbake failed! but keep=
 going... Log:
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -     Command 'bitbake  --=
continue bash hello-norepro hello-fail' returned non-zero exit status 1:
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -     ... (last 20 lines o=
f output)
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_package_write_deb: Started
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_package_qa: Started
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_create_spdx: Succeeded
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: Running task 9=
78 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_c=
reate_package_spdx)
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_create_package_spdx: Started
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_create_package_spdx: Succeeded
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_package_write_ipk: Succeeded
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_package_qa: Succeeded
>   2024-09-30 00:40:12,933 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_package_write_deb: Succeeded
>   2024-09-30 00:40:12,934 - oe-selftest - INFO -     NOTE: recipe bash-5.=
2.32-r0: task do_package_write_rpm: Succeeded
>   2024-09-30 00:40:12,934 - oe-selftest - INFO -     NOTE: Running noexec=
 task 979 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.=
bb:do_build)
>   2024-09-30 00:40:12,934 - oe-selftest - INFO -     NOTE: Tasks Summary:=
 Attempted 979 tasks of which 2 didn't need to be rerun and 1 failed.
>   2024-09-30 00:40:12,934 - oe-selftest - INFO -     NOTE: Generating JSO=
N CVE summary
>   2024-09-30 00:40:12,934 - oe-selftest - INFO -     Complete CVE JSON re=
port summary created at: <snip>/yocto/poky/build-master-st/reproducibleB-ex=
tended/tmp/log/cve/cve-summary.json
>   2024-09-30 00:40:12,934 - oe-selftest - INFO -
>   2024-09-30 00:40:12,934 - oe-selftest - INFO -     Summary: 1 task fail=
ed:
>   2024-09-30 00:40:12,934 - oe-selftest - INFO -       <snip>/yocto/poky/=
meta/recipes-core/hello-single/hello-fail_1.0.bb:do_compile
>   2024-09-30 00:40:12,934 - oe-selftest - INFO -         log: <snip>/yoct=
o/poky/build-master-st/reproducibleB-extended/tmp/work/core2-64-poky-linux/=
hello-fail/1.0/temp/log.do_compile.3007134
>   2024-09-30 00:40:12,934 - oe-selftest - INFO -     Summary: There were =
5 WARNING messages.
>   2024-09-30 00:40:12,934 - oe-selftest - INFO -     Summary: There was 1=
 ERROR message, returning a non-zero exit code.
>   2024-09-30 00:40:12,934 - oe-selftest - INFO - reproducibleB-extended b=
uild failed. Trying to compute built packages differences but the test will=
 fail.
>   2024-09-30 00:40:12,934 - oe-selftest - INFO - Checking deb packages fo=
r differences...
>   2024-09-30 00:40:12,974 - oe-selftest - INFO - Reproducibility summary =
for deb: same=3D52 different=3D1 different_excluded=3D0 missing=3D0 total=
=3D53
>   unused_exclusions=3D[]
>   2024-09-30 00:40:12,976 - oe-selftest - INFO - Checking ipk packages fo=
r differences...
>   2024-09-30 00:40:13,014 - oe-selftest - INFO - Reproducibility summary =
for ipk: same=3D52 different=3D1 different_excluded=3D0 missing=3D0 total=
=3D53
>   unused_exclusions=3D[]
>   2024-09-30 00:40:13,015 - oe-selftest - INFO - Checking rpm packages fo=
r differences...
>   2024-09-30 00:40:13,047 - oe-selftest - INFO - Reproducibility summary =
for rpm: same=3D52 different=3D1 different_excluded=3D0 missing=3D0 total=
=3D53
>   unused_exclusions=3D[]
>   2024-09-30 00:40:13,048 - oe-selftest - INFO - Running diffoscope
>   2024-09-30 00:40:14,051 - oe-selftest - INFO -  ... FAIL
>   2024-09-30 00:40:14,052 - oe-selftest - INFO - Traceback (most recent c=
all last):
>     File "<snip>/yocto/poky/meta/lib/oeqa/selftest/cases/reproducible.py"=
, line 380, in test_reproducible_builds
>       self.fail('\n'.join(fails))
>   AssertionError: Bitbake reproducibleA failure
>   Bitbake reproducibleB-extended failure
>   The following deb packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb=
/./core2-64/hello-norepro_1.0-r0_amd64.deb
>   The following ipk packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/ipk=
/./core2-64/hello-norepro_1.0-r0_core2-64.ipk
>   The following rpm packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/rpm=
/./core2_64/hello-norepro-1.0-r0.core2_64.rpm
>
>   2024-09-30 00:40:14,052 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   2024-09-30 00:40:14,052 - oe-selftest - INFO - FAIL: test_reproducible_=
builds (reproducible.ReproducibleTests.test_reproducible_builds)
>   2024-09-30 00:40:14,052 - oe-selftest - INFO - ------------------------=
----------------------------------------------
>   2024-09-30 00:40:14,052 - oe-selftest - INFO - Traceback (most recent c=
all last):
>     File "<snip>/yocto/poky/meta/lib/oeqa/selftest/cases/reproducible.py"=
, line 380, in test_reproducible_builds
>       self.fail('\n'.join(fails))
>   AssertionError: Bitbake reproducibleA failure
>   Bitbake reproducibleB-extended failure
>   The following deb packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb=
/./core2-64/hello-norepro_1.0-r0_amd64.deb
>   The following ipk packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/ipk=
/./core2-64/hello-norepro_1.0-r0_core2-64.ipk
>   The following rpm packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/rpm=
/./core2_64/hello-norepro-1.0-r0.core2_64.rpm
>
>   2024-09-30 00:40:14,053 - oe-selftest - INFO - ------------------------=
----------------------------------------------
>   2024-09-30 00:40:14,053 - oe-selftest - INFO - Ran 1 test in 2146.797s
>   2024-09-30 00:40:14,053 - oe-selftest - INFO - FAILED
>   2024-09-30 00:40:14,053 - oe-selftest - INFO -  (failures=3D1)
>   2024-09-30 00:40:17,620 - oe-selftest - INFO - RESULTS:
>   2024-09-30 00:40:17,621 - oe-selftest - INFO - RESULTS - reproducible.R=
eproducibleTests.test_reproducible_builds: FAILED (2146.57s)
>   2024-09-30 00:40:17,623 - oe-selftest - INFO - SUMMARY:
>   2024-09-30 00:40:17,623 - oe-selftest - INFO - oe-selftest () - Ran 1 t=
est in 2146.798s
>   2024-09-30 00:40:17,623 - oe-selftest - INFO - oe-selftest - FAIL - Req=
uired tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=3D0)
>
> =3D> Test failed but hello-norepro is displayed as non-reproducible.
>
> The testresult.json contains:
>   {
>       "oeselftest_debian-12_qemux86-64_20240930000424": {
>           "configuration": { <snip> },
>           "result": {
>               "reproducible": {
>                   "files": {
>                       "package_deb": {
>                           "different": [
>                               {
>                                   "reference": "<snip>/yocto/poky/build-m=
aster-st/reproducibleA/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64=
.deb",
>                                   "test": "<snip>/yocto/poky/build-master=
-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_a=
md64.deb"
>                               }
>                           ],
>                           "different_excluded": [],
>                           "missing": [],
>                           "same": [
>                               <snip>
>                               {
>                                   "reference": "<snip>/yocto/poky/build-m=
aster-st/reproducibleA/tmp/deploy/deb/./core2-64/bash_5.2.32-r0_amd64.deb",
>                                   "test": "<snip>/yocto/poky/build-master=
-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/bash_5.2.32-r0_amd64.d=
eb"
>                               },
>                               <snip>
>                           ]
>                       },
>                       "package_ipk": { <same as deb> },
>                       "package_rpm": { <same as deb> }
>                   }
>               },
>               "reproducible.ReproducibleTests.test_reproducible_builds": =
{
>                   "duration": 2146.5671875476837,
>                   "log": "Traceback (most recent call last):\n  File \"<s=
nip>/yocto/poky/meta/lib/oeqa/selftest/cases/reproducible.py\", line 380, i=
n test_reproducible_builds\n    self.fail('\\n'.join(fails))\nAssertionErro=
r: Bitbake reproducibleA failure\nBitbake reproducibleB-extended failure\nT=
he following deb packages are different and not in exclusion list:\n<snip>/=
yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64=
/hello-norepro_1.0-r0_amd64.deb\nThe following ipk packages are different a=
nd not in exclusion list:\n<snip>/yocto/poky/build-master-st/reproducibleB-=
extended/tmp/deploy/ipk/./core2-64/hello-norepro_1.0-r0_core2-64.ipk\nThe f=
ollowing rpm packages are different and not in exclusion list:\n<snip>/yoct=
o/poky/build-master-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/hel=
lo-norepro-1.0-r0.core2_64.rpm\n",
>                   "status": "FAILED"
>               },
>               "reproducible.rawlogs": {
>                   "log": "DIFFERENT: <snip>/yocto/poky/build-master-st/re=
producibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.d=
eb\nSAME: <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/depl=
oy/deb/./core2-64/bash_5.2.32-r0_amd64.deb\n<snip>"
>               }
>           }
>       }
>   }
>
> =3D> "reproducible.ReproducibleTests.test_reproducible_builds".status is
> correctly "FAILED" but the reproducibility of bash and hello-norepro is
> tested.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 57 ++++++++++++++++----
>  1 file changed, 48 insertions(+), 9 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa=
/selftest/cases/reproducible.py
> index 3d3f30eebc..af4e53af2f 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -215,7 +215,7 @@ class ReproducibleTests(OESelftestTestCase):
>          bb.utils.mkdirhier(os.path.dirname(dest))
>          shutil.copyfile(source, dest)
>
> -    def do_test_build(self, name, use_sstate):
> +    def do_test_build(self, name, use_sstate, output_log=3DNone):
>          capture_vars =3D ['DEPLOY_DIR_' + c.upper() for c in self.packag=
e_classes]
>
>          tmpdir =3D os.path.join(self.topdir, name, 'tmp')
> @@ -234,11 +234,19 @@ class ReproducibleTests(OESelftestTestCase):
>              ''').format(package_classes=3D' '.join('package_%s' % c for =
c in self.package_classes),
>                          tmpdir=3Dtmpdir)
>
> +        bitbake_failure_count =3D 0
>          if not use_sstate:
>              if self.sstate_targets:
>                 self.logger.info("Building prebuild for %s (sstate allowe=
d)..." % (name))
>                 self.write_config(config)
> -               bitbake(' '.join(self.sstate_targets))
> +               try:
> +                   bitbake("--continue "+' '.join(self.sstate_targets),
> +                           output_log=3Doutput_log, limit_exc_output=3D2=
0)
> +               except AssertionError as e:
> +                   bitbake_failure_count +=3D 1
> +                   self.logger.info("Bitbake failed! but keep going... L=
og:")
> +                   for line in str(e).split("\n"):
> +                       self.logger.info("    "+line)
>
>              # This config fragment will disable using shared and the sst=
ate
>              # mirror, forcing a complete build from scratch
> @@ -251,8 +259,21 @@ class ReproducibleTests(OESelftestTestCase):
>          self.write_config(config)
>          d =3D get_bb_vars(capture_vars)
>          # targets used to be called images
> -        bitbake(' '.join(getattr(self, 'images', self.targets)))
> -        return d
> +        try:
> +            bitbake("--continue "+' '.join(getattr(self, 'images', self.=
targets)),
> +                    output_log=3Doutput_log, limit_exc_output=3D20)
> +        except AssertionError as e:
> +            bitbake_failure_count +=3D 1
> +
> +            self.logger.info("Bitbake failed! but keep going... Log:")
> +            for line in str(e).split("\n"):
> +                self.logger.info("    "+line)
> +            for c in self.package_classes:
> +                deploy =3D d['DEPLOY_DIR_' + c.upper()]
> +                if not os.path.exists(deploy):
> +                    self.logger.info("Manually creating %s" % deploy)
> +                    bb.utils.mkdirhier(deploy)
> +        return (d, bitbake_failure_count)
>
>      def test_reproducible_builds(self):
>          def strip_topdir(s):
> @@ -278,15 +299,33 @@ class ReproducibleTests(OESelftestTestCase):
>          # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15554
>          # So, the reproducibleA & reproducibleB directories are changed =
to reproducibleA & reproducibleB-extended to have different size.
>
> -        vars_A =3D self.do_test_build('reproducibleA', self.build_from_s=
state)
> -
> -        vars_B =3D self.do_test_build('reproducibleB-extended', False)
> +        fails =3D []
> +        vars_list =3D [None, None]
> +
> +        for i, (name, use_sstate) in enumerate(
> +                                 (('reproducibleA', self.build_from_ssta=
te),
> +                                 ('reproducibleB-extended', False))):
> +            if self.save_results:
> +                output_log_path =3D os.path.join(save_dir, "bitbake_%s.l=
og" % name)
> +                output_log =3D bb.msg.logger_create("bitbake_%s" % name,
> +                                                  output=3Dopen(output_l=
og_path, mode=3D"w", encoding=3D"utf-8"),
> +                                                  preserve_handlers=3DTr=
ue)
> +            (variables, bitbake_failure_count) =3D self.do_test_build(
> +                name, use_sstate, output_log=3Doutput_log)
> +            if bitbake_failure_count > 0:
> +                self.logger.info('%s build failed. Trying to compute bui=
lt packages differences but the test will fail.' % name)
> +                fails.append("Bitbake %s failure" % name)
> +            else:
> +                if self.save_results:
> +                    # Remove full logs if bitbake was successful
> +                    del output_log
> +                    os.remove(output_log_path)
> +            vars_list[i] =3D variables
>
> +        vars_A, vars_B =3D vars_list
>          # NOTE: The temp directories from the reproducible build are pur=
posely
>          # kept after the build so it can be diffed for debugging.
>
> -        fails =3D []
> -
>          for c in self.package_classes:
>              with self.subTest(package_class=3Dc):
>                  package_class =3D 'package_' + c
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205101): https://lists.openembedded.org/g/openembedde=
d-core/message/205101
> Mute This Topic: https://lists.openembedded.org/mt/108732482/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

