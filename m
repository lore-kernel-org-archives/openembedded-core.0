Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B39CD132B1
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 11:25:52 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.55411.1730719547846917113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 03:25:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RLRcKvu7;
 spf=pass (domain: smile.fr, ip: 209.85.167.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f1292a9bso4543141e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 03:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1730719545; x=1731324345; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vgLQ39IPJSjMV4/4nfJjamJUvCzJe5a1mLcVpYNl31w=;
        b=RLRcKvu7Kk5V+HY9G0P4Jpr2c/u5lpDmKPypo9WvQn8cIrvbfnfqBBSuJRj5wJtzBO
         5j5UVGLdGiv3TTmGHiECxc/vKHEdSNPq3kbI8oOw923yb/nCnQYuxaB1NVeHc6Nn6zlh
         ZLx1aBbuLJ+Mwx6AFbyhep2+KyxamDbKPaGhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730719545; x=1731324345;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgLQ39IPJSjMV4/4nfJjamJUvCzJe5a1mLcVpYNl31w=;
        b=GP8x2g8J2AlMNTyAT9YvhqdKWJBt+EsV7818c8wvgM3XkNQDvWXHa+i0EPECL5lw3d
         YsfLNyYyIODu30SJ/w5ugCh4p7rqxK4A/03YnZSHcdTDMeY2YZkNsRDYEEC1lCzJefnl
         01XuwIil55n3OWpZWGbEzSZhwUPVNPwIBegkvXumV6VWMVUS+VTvSEoG8SRJmBUNNwDZ
         t9Mb460fs7HFovAuAjGNO7DCTzz0NlKXSjQeJ4oD5kSCji3jQOvjWCzsAIdmllLWVGqm
         gV0ZcvnnaGjkPbp5p1v+VAqkByiGwczpPFZKXVQ9CCKPhDE3kLpio3k4JCzDObC8s61l
         ejSw==
X-Gm-Message-State: AOJu0YwXdsyAS0pXRH30Fl/ZRyv0URbqPhn9SWv7/yAG7tv4nVeRVU+p
	yyqdhdyr7l8xabrZMkd1QnTmtE+On0O+y1XBh1Ge06HaNLaY4juYqNzrzIg/EQeqfvZjIExYtaZ
	r
X-Google-Smtp-Source: AGHT+IEw9LvmJvdhQu0/dVjtr01VS+qtBDgIW7b3PyK2N1+HZxQOwvvt5W2XnHjTKcNU5llPC/LliA==
X-Received: by 2002:a05:6512:baa:b0:539:f1ad:b7a6 with SMTP id 2adb3069b0e04-53b3491c819mr14903209e87.37.1730719544887;
        Mon, 04 Nov 2024 03:25:44 -0800 (PST)
Received: from [192.168.0.27] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e853esm184654605e9.8.2024.11.04.03.25.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:25:44 -0800 (PST)
Message-ID: <66ff6a8c-ee3d-47d9-8361-f3de38163e22@smile.fr>
Date: Mon, 4 Nov 2024 12:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3] reproducibility: continue testing in case of
 build failure
To: openembedded-core@lists.openembedded.org
References: <20241029100912.138924-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20241029100912.138924-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 11:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206677

Hi,


Le 29/10/2024 à 11:09, Yoann Congal a écrit :
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
> 
>   <snip>
>   2024-10-01 23:09:33,977 - oe-selftest - INFO - test_reproducible_builds (reproducible.ReproducibleTests.test_reproducible_builds)
>   2024-10-01 23:10:39,093 - oe-selftest - INFO - Non-reproducible packages will be copied to <snip>/yocto/repro_output/oe-reproducible-20241001-ng43_hzd
>   2024-10-01 23:10:39,094 - oe-selftest - INFO - Building reproducibleA (sstate allowed)...
>   2024-10-01 23:18:12,378 - oe-selftest - ERROR - Bitbake failed! but keep going... Log:
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     Command 'bitbake  --continue bash hello-norepro hello-fail' returned non-zero exit status 1:
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     ... (last 20 lines of output)
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: Running task 976 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_qa)
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_populate_sysroot: Started
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Started
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_populate_sysroot: Succeeded
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: Running setscene task 342 of 343 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_package_spdx_setscene)
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx_setscene: Started
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx_setscene: Succeeded
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: Running setscene task 343 of 343 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_spdx_setscene)
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Started
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Succeeded
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Succeeded
>   2024-10-01 23:18:12,379 - oe-selftest - INFO -     NOTE: Running noexec task 979 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_build)
>   2024-10-01 23:18:12,380 - oe-selftest - INFO -     NOTE: Tasks Summary: Attempted 979 tasks of which 841 didn't need to be rerun and 1 failed.
>   2024-10-01 23:18:12,380 - oe-selftest - INFO -     NOTE: Generating JSON CVE summary
>   2024-10-01 23:18:12,380 - oe-selftest - INFO -     Complete CVE JSON report summary created at: <snip>/yocto/poky/build-master-st/reproducibleA/tmp/log/cve/cve-summary.json
>   2024-10-01 23:18:12,380 - oe-selftest - INFO -
>   2024-10-01 23:18:12,380 - oe-selftest - INFO -     Summary: 1 task failed:
>   2024-10-01 23:18:12,380 - oe-selftest - INFO -       <snip>/yocto/poky/meta/recipes-core/hello-single/hello-fail_1.0.bb:do_compile
>   2024-10-01 23:18:12,380 - oe-selftest - INFO -         log: <snip>/yocto/poky/build-master-st/reproducibleA/tmp/work/core2-64-poky-linux/hello-fail/1.0/temp/log.do_compile.3221257
>   2024-10-01 23:18:12,380 - oe-selftest - INFO -     Summary: There was 1 ERROR message, returning a non-zero exit code.
>   2024-10-01 23:18:12,380 - oe-selftest - ERROR - reproducibleA build failed. Trying to compute built packages differences but the test will fail.
>   2024-10-01 23:18:12,382 - oe-selftest - INFO - Building reproducibleB-extended (sstate NOT allowed)...
>   2024-10-01 23:46:58,451 - oe-selftest - ERROR - Bitbake failed! but keep going... Log:
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     Command 'bitbake  --continue bash hello-norepro hello-fail' returned non-zero exit status 1:
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     ... (last 20 lines of output)
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_ipk: Started
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Started
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_spdx: Succeeded
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: Running task 978 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_package_spdx)
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx: Started
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_create_package_spdx: Succeeded
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_qa: Succeeded
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_deb: Succeeded
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_ipk: Succeeded
>   2024-10-01 23:46:58,463 - oe-selftest - INFO -     NOTE: recipe bash-5.2.32-r0: task do_package_write_rpm: Succeeded
>   2024-10-01 23:46:58,464 - oe-selftest - INFO -     NOTE: Running noexec task 979 of 990 (<snip>/yocto/poky/meta/recipes-extended/bash/bash_5.2.32.bb:do_build)
>   2024-10-01 23:46:58,464 - oe-selftest - INFO -     NOTE: Tasks Summary: Attempted 979 tasks of which 2 didn't need to be rerun and 1 failed.
>   2024-10-01 23:46:58,464 - oe-selftest - INFO -     NOTE: Generating JSON CVE summary
>   2024-10-01 23:46:58,464 - oe-selftest - INFO -     Complete CVE JSON report summary created at: <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/log/cve/cve-summary.json
>   2024-10-01 23:46:58,464 - oe-selftest - INFO -
>   2024-10-01 23:46:58,464 - oe-selftest - INFO -     Summary: 1 task failed:
>   2024-10-01 23:46:58,464 - oe-selftest - INFO -       <snip>/yocto/poky/meta/recipes-core/hello-single/hello-fail_1.0.bb:do_compile
>   2024-10-01 23:46:58,464 - oe-selftest - INFO -         log: <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/work/core2-64-poky-linux/hello-fail/1.0/temp/log.do_compile.4136075
>   2024-10-01 23:46:58,464 - oe-selftest - INFO -     Summary: There were 5 WARNING messages.
>   2024-10-01 23:46:58,464 - oe-selftest - INFO -     Summary: There was 1 ERROR message, returning a non-zero exit code.
>   2024-10-01 23:46:58,467 - oe-selftest - ERROR - reproducibleB-extended build failed. Trying to compute built packages differences but the test will fail.
>   2024-10-01 23:46:58,481 - oe-selftest - INFO - Checking deb packages for differences...
>   2024-10-01 23:46:58,586 - oe-selftest - INFO - Reproducibility summary for deb: same=52 different=1 different_excluded=0 missing=0 total=53
>   unused_exclusions=[]
>   2024-10-01 23:46:58,588 - oe-selftest - INFO - Checking ipk packages for differences...
>   2024-10-01 23:46:58,658 - oe-selftest - INFO - Reproducibility summary for ipk: same=52 different=1 different_excluded=0 missing=0 total=53
>   unused_exclusions=[]
>   2024-10-01 23:46:58,659 - oe-selftest - INFO - Checking rpm packages for differences...
>   2024-10-01 23:46:58,691 - oe-selftest - INFO - Reproducibility summary for rpm: same=52 different=1 different_excluded=0 missing=0 total=53
>   unused_exclusions=[]
>   2024-10-01 23:46:58,692 - oe-selftest - INFO - Running diffoscope
>   2024-10-01 23:46:59,765 - oe-selftest - INFO -  ... FAIL
>   2024-10-01 23:46:59,766 - oe-selftest - INFO - Traceback (most recent call last):
>     File "<snip>/yocto/poky/meta/lib/oeqa/selftest/cases/reproducible.py", line 380, in test_reproducible_builds
>       self.fail('\n'.join(fails))
>   AssertionError: Bitbake reproducibleA failure
>   Bitbake reproducibleB-extended failure
>   The following deb packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb
>   The following ipk packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/hello-norepro_1.0-r0_core2-64.ipk
>   The following rpm packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/hello-norepro-1.0-r0.core2_64.rpm
> 
>   2024-10-01 23:46:59,769 - oe-selftest - INFO - ======================================================================
>   2024-10-01 23:46:59,770 - oe-selftest - INFO - FAIL: test_reproducible_builds (reproducible.ReproducibleTests.test_reproducible_builds)
>   2024-10-01 23:46:59,770 - oe-selftest - INFO - ----------------------------------------------------------------------
>   2024-10-01 23:46:59,770 - oe-selftest - INFO - Traceback (most recent call last):
>     File "<snip>/yocto/poky/meta/lib/oeqa/selftest/cases/reproducible.py", line 380, in test_reproducible_builds
>       self.fail('\n'.join(fails))
>   AssertionError: Bitbake reproducibleA failure
>   Bitbake reproducibleB-extended failure
>   The following deb packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb
>   The following ipk packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/hello-norepro_1.0-r0_core2-64.ipk
>   The following rpm packages are different and not in exclusion list:
>   <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/hello-norepro-1.0-r0.core2_64.rpm
> 
>   2024-10-01 23:46:59,770 - oe-selftest - INFO - ----------------------------------------------------------------------
>   2024-10-01 23:46:59,770 - oe-selftest - INFO - Ran 1 test in 2246.039s
>   2024-10-01 23:46:59,770 - oe-selftest - INFO - FAILED
>   2024-10-01 23:46:59,770 - oe-selftest - INFO -  (failures=1)
>   2024-10-01 23:47:03,200 - oe-selftest - INFO - RESULTS:
>   2024-10-01 23:47:03,200 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: FAILED (2245.79s)
>   2024-10-01 23:47:03,203 - oe-selftest - INFO - SUMMARY:
>   2024-10-01 23:47:03,203 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 2246.040s
>   2024-10-01 23:47:03,203 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed (successes=0, skipped=0, failures=1, errors=0)
> 
> => Test failed but hello-norepro is displayed as non-reproducible.
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
>                                   "reference": "<snip>/yocto/poky/build-master-st/reproducibleA/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb",
>                                   "test": "<snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb"
>                               }
>                           ],
>                           "different_excluded": [],
>                           "missing": [],
>                           "same": [
>                               <snip>
>                               {
>                                   "reference": "<snip>/yocto/poky/build-master-st/reproducibleA/tmp/deploy/deb/./core2-64/bash_5.2.32-r0_amd64.deb",
>                                   "test": "<snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/bash_5.2.32-r0_amd64.deb"
>                               },
>                               <snip>
>                           ]
>                       },
>                       "package_ipk": { <same as deb> },
>                       "package_rpm": { <same as deb> }
>                   }
>               },
>               "reproducible.ReproducibleTests.test_reproducible_builds": {
>                   "duration": 2146.5671875476837,
>                   "log": "Traceback (most recent call last):\n  File \"<snip>/yocto/poky/meta/lib/oeqa/selftest/cases/reproducible.py\", line 380, in test_reproducible_builds\n    self.fail('\\n'.join(fails))\nAssertionError: Bitbake reproducibleA failure\nBitbake reproducibleB-extended failure\nThe following deb packages are different and not in exclusion list:\n<snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb\nThe following ipk packages are different and not in exclusion list:\n<snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/hello-norepro_1.0-r0_core2-64.ipk\nThe following rpm packages are different and not in exclusion list:\n<snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/hello-norepro-1.0-r0.core2_64.rpm\n",
>                   "status": "FAILED"
>               },
>               "reproducible.rawlogs": {
>                   "log": "DIFFERENT: <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/hello-norepro_1.0-r0_amd64.deb\nSAME: <snip>/yocto/poky/build-master-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/bash_5.2.32-r0_amd64.deb\n<snip>"
>               }
>           }
>       }
>   }
> 
> => "reproducible.ReproducibleTests.test_reproducible_builds".status is
> correctly "FAILED" but the reproducibility of bash and hello-norepro is
> tested.
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> v2->v3:
> * Added a missing end of line in config concatenation
> 
> v1->v2:
> * Upgrade some log from INFO to ERROR in the failing case to make it
>   more visible in the logs.
> Richard Purdie review:
> * Simplify log handling
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 56 ++++++++++++++++----
>  1 file changed, 47 insertions(+), 9 deletions(-)

That did not work in the https://valkyrie.yoctoproject.org/#/builders/87
builder :
https://valkyrie.yoctoproject.org/#/builders/87/builds/17/steps/40/logs/stdio
Sorry about that :(

I'll look into this as soon as possible but I would totally understand
if this patch is reverted in the meantime.


> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> index 3d3f30eebc..a68f72ff23 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -221,7 +221,6 @@ class ReproducibleTests(OESelftestTestCase):
>          tmpdir = os.path.join(self.topdir, name, 'tmp')
>          if os.path.exists(tmpdir):
>              bb.utils.remove(tmpdir, recurse=True)
> -
>          config = textwrap.dedent('''\
>              PACKAGE_CLASSES = "{package_classes}"
>              TMPDIR = "{tmpdir}"
> @@ -234,11 +233,24 @@ class ReproducibleTests(OESelftestTestCase):
>              ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
>                          tmpdir=tmpdir)
>  
> +        # Export BB_CONSOLELOG to the calling function and make it constant to
> +        # avoid a case where bitbake would get a timestamp-based filename but
> +        # oe-selftest would, later, get another.
> +        capture_vars.append("BB_CONSOLELOG")
> +        config += 'BB_CONSOLELOG = "${LOG_DIR}/cooker/${MACHINE}/console.log"\n'
> +
> +        bitbake_failure_count = 0
>          if not use_sstate:
>              if self.sstate_targets:
>                 self.logger.info("Building prebuild for %s (sstate allowed)..." % (name))
>                 self.write_config(config)
> -               bitbake(' '.join(self.sstate_targets))
> +               try:
> +                   bitbake("--continue "+' '.join(self.sstate_targets), limit_exc_output=20)
> +               except AssertionError as e:
> +                   bitbake_failure_count += 1
> +                   self.logger.error("Bitbake failed! but keep going... Log:")
> +                   for line in str(e).split("\n"):
> +                       self.logger.info("    "+line)
>  
>              # This config fragment will disable using shared and the sstate
>              # mirror, forcing a complete build from scratch
> @@ -251,8 +263,25 @@ class ReproducibleTests(OESelftestTestCase):
>          self.write_config(config)
>          d = get_bb_vars(capture_vars)
>          # targets used to be called images
> -        bitbake(' '.join(getattr(self, 'images', self.targets)))
> -        return d
> +        try:
> +            bitbake("--continue "+' '.join(getattr(self, 'images', self.targets)), limit_exc_output=20)
> +        except AssertionError as e:
> +            bitbake_failure_count += 1
> +
> +            self.logger.error("Bitbake failed! but keep going... Log:")
> +            for line in str(e).split("\n"):
> +                self.logger.info("    "+line)
> +
> +            # The calling function expects the existence of the deploy
> +            # directories containing the packages.
> +            # If bitbake failed to create them, do it manually
> +            for c in self.package_classes:
> +                deploy = d['DEPLOY_DIR_' + c.upper()]
> +                if not os.path.exists(deploy):
> +                    self.logger.info("Manually creating %s" % deploy)
> +                    bb.utils.mkdirhier(deploy)
> +
> +        return (d, bitbake_failure_count)
>  
>      def test_reproducible_builds(self):
>          def strip_topdir(s):
> @@ -278,15 +307,24 @@ class ReproducibleTests(OESelftestTestCase):
>          # https://bugzilla.yoctoproject.org/show_bug.cgi?id=15554
>          # So, the reproducibleA & reproducibleB directories are changed to reproducibleA & reproducibleB-extended to have different size.
>  
> -        vars_A = self.do_test_build('reproducibleA', self.build_from_sstate)
> -
> -        vars_B = self.do_test_build('reproducibleB-extended', False)
> +        fails = []
> +        vars_list = [None, None]
> +
> +        for i, (name, use_sstate) in enumerate(
> +                                 (('reproducibleA', self.build_from_sstate),
> +                                 ('reproducibleB-extended', False))):
> +            (variables, bitbake_failure_count) = self.do_test_build(name, use_sstate)
> +            if bitbake_failure_count > 0:
> +                self.logger.error('%s build failed. Trying to compute built packages differences but the test will fail.' % name)
> +                fails.append("Bitbake %s failure" % name)
> +                if self.save_results:
> +                    self.copy_file(variables["BB_CONSOLELOG"], os.path.join(save_dir, "bitbake-%s.log" % name))
> +            vars_list[i] = variables
>  
> +        vars_A, vars_B = vars_list
>          # NOTE: The temp directories from the reproducible build are purposely
>          # kept after the build so it can be diffed for debugging.
>  
> -        fails = []
> -
>          for c in self.package_classes:
>              with self.subTest(package_class=c):
>                  package_class = 'package_' + c

-- 
Yoann Congal
Smile ECS - Tech Expert

