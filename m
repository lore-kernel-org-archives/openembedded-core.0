Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 15730781D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 16:30:03 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 6so4704925wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1vizeu9bJJupwgO8wPV4zdQb9pfeJshZakz4NMAExrc=;
	b=m29zmKHw6HqOXW1Oj1WKS0gpeiVc4tvODyiM/cjXbsY2TkKBBUUx/XGa0UO4/FnZei
	ObZiB+V0uQhUdejFLeYF8DXaT/sukDOA8dAdmxX5ogLX/4lWfKrjJ6riddiXMg1uzW12
	zhcZC8dvUqySPRyRjGGBC8yMSTk2zDUW58Xq0x3KDKQloX39xZ+2Ro1c/imQmZI9JsOP
	XfTZntS/r75F7TsLYXhixUbtSIFLtjzjLdzlwy2G/S0i2qDegZB5grpAYnFFlIfo837g
	z3P6OyaoGb0EtGtPaaGrI3tJzCR15CeRpMuEP3v0UKUWrdArM6DP1HdoL2tG1CD+YTLv
	w3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1vizeu9bJJupwgO8wPV4zdQb9pfeJshZakz4NMAExrc=;
	b=lQRNs8d0QicpvQiELbhREeMINFDNdFlg0eJ6fRST7cuM9CUOm9XBN6qab+6IPoxG+5
	vdUaYZDy3DGr6CdYH7e54M3dV6Kk4VGoA3tL06kIqYtzDmYKBPXp1TTW+yZ03EyAixV6
	ZkeV0/+Ylzq7uPYgIfzY66ZCUb95rh4g1ARp4saMmT0qqx7rPrU+hdL3xlbFWuxCWskw
	LW+gVWtkAr203OkwwM3SU+LqAiEjedGHMZ+5sKwzsMF+QcYSYPUvMiohvyEHfcEpx5K5
	EUU43/Y3q/ewLXrbPA4Zph5P28pBHLtUSvbuydKcV4yCbmaq9lu8QwMCnvomGLhx1U6N
	N/RA==
X-Gm-Message-State: AODbwcC7ZjzTjQVhyRoEjFW2aS2EIRk3TOPJu3b34aqimE1r1F/hAKq3
	XOQMXconE2Rs2Ndgs147qAQabRIr4w==
X-Received: by 10.223.152.227 with SMTP id w90mr8393518wrb.151.1496161804393; 
	Tue, 30 May 2017 09:30:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.148 with HTTP; Tue, 30 May 2017 09:30:03 -0700 (PDT)
In-Reply-To: <3feaadad-607b-0ae4-61b4-158f86816786@windriver.com>
References: <20170530080836.25342-1-Martin.Jansa@gmail.com>
	<CAJ86T=XbqdaxFrWzd1RN-5Y0E8B+Ndj9fHAy8XU0v+q1OYMp6Q@mail.gmail.com>
	<3feaadad-607b-0ae4-61b4-158f86816786@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 30 May 2017 09:30:03 -0700
Message-ID: <CAJ86T=W=pf1ie8TEe6+pnHU_JaHf1wb-5Odv73=6em2iQYX98w@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode, links"
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
X-List-Received-Date: Tue, 30 May 2017 16:30:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 30, 2017 at 8:41 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 5/30/17 9:45 AM, Andre McCurdy wrote:
>> On Tue, May 30, 2017 at 1:08 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> * Using "cp -a" leaks UID of user running the builds, causing
>>>   many QA warnings.
>>> * See this thread for details:
>>>   http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112904.html
>>
>> Using "cp -av --no-preserve=ownership" is a slightly cleaner solution.
>
> I personally prefer Martin's version since '-a' is not supported everywhere.
> (Unless you using gnu cp, which 99% of the Linux world uses.. but non-Linux
> systems rarely do.)

Which versions of cp do you know of that support
"--preserve=mode,links" without supporting "-a" ?

A quick google of manpages suggests that FreeBSD supports "-a" but not
"--preserve=XXX". OpenBSD doesn't seem to support either.

Which non-Linux host systems does OE support?

> --Mark
>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>  meta/recipes-core/coreutils/coreutils_8.27.bb       | 2 +-
>>>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb | 4 ++--
>>>  meta/recipes-extended/mdadm/mdadm_4.0.bb            | 2 +-
>>>  3 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/coreutils/coreutils_8.27.bb b/meta/recipes-core/coreutils/coreutils_8.27.bb
>>> index 667e0af560..ea8740a2d1 100644
>>> --- a/meta/recipes-core/coreutils/coreutils_8.27.bb
>>> +++ b/meta/recipes-core/coreutils/coreutils_8.27.bb
>>> @@ -99,7 +99,7 @@ do_install_append() {
>>>         install -t ${D}/${mandir}/man1 ${S}/man/*.1
>>>         # prebuilt man pages don't do a separate man page for [ vs test.
>>>         # see comment above r.e. sed and update-alternatives
>>> -       cp -a ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
>>> +       cp -R --no-dereference --preserve=mode,links -v ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
>>>  }
>>>
>>>  inherit update-alternatives
>>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
>>> index 5216c7027c..7c8809a41e 100644
>>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
>>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
>>> @@ -106,7 +106,7 @@ do_compile_ptest() {
>>>  }
>>>
>>>  do_install_ptest() {
>>> -       cp -a ${B}/tests ${D}${PTEST_PATH}/test
>>> -       cp -a ${S}/tests/* ${D}${PTEST_PATH}/test
>>> +       cp -R --no-dereference --preserve=mode,links -v ${B}/tests ${D}${PTEST_PATH}/test
>>> +       cp -R --no-dereference --preserve=mode,links -v ${S}/tests/* ${D}${PTEST_PATH}/test
>>>         sed -e 's!../e2fsck/e2fsck!e2fsck!g' -i ${D}${PTEST_PATH}/test/*/expect*
>>>  }
>>> diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
>>> index 98a10a8b15..506b0bc315 100644
>>> --- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
>>> +++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
>>> @@ -55,7 +55,7 @@ do_compile_ptest() {
>>>  }
>>>
>>>  do_install_ptest() {
>>> -       cp -a ${S}/tests ${D}${PTEST_PATH}/tests
>>> +       cp -R --no-dereference --preserve=mode,links -v ${S}/tests ${D}${PTEST_PATH}/tests
>>>         cp ${S}/test ${D}${PTEST_PATH}
>>>         sed -e 's!sleep 0.*!sleep 1!g; s!/var/tmp!/!g' -i ${D}${PTEST_PATH}/test
>>>         ln -s ${base_sbindir}/mdadm ${D}${PTEST_PATH}/mdadm
>>> --
>>> 2.13.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

