Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C12EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 11:47:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5565.1687175259431260773
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 04:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F3BC12FC;
	Mon, 19 Jun 2023 04:48:22 -0700 (PDT)
Received: from [10.57.86.49] (unknown [10.57.86.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA66C3F64C;
	Mon, 19 Jun 2023 04:47:37 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------698Pa4evPQ3hbiUcTQOw0JDZ"
Message-ID: <88d7eb23-d5e1-71db-f789-1c9dff4fcf47@arm.com>
Date: Mon, 19 Jun 2023 12:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Set vardeps for
 write_image_test_data
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230517162906.2395999-1-peter.hoyes@arm.com>
 <F3C8EF1B-E5EA-4357-8977-1FCC0F5E553D@arm.com>
 <a87d5dd9-4128-6d02-eda2-c0c15f5a52fc@arm.com>
 <b4852d5295cc250431cf375ba4677c9cc5cbbfc1.camel@linuxfoundation.org>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <b4852d5295cc250431cf375ba4677c9cc5cbbfc1.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 11:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183101

This is a multi-part message in MIME format.
--------------698Pa4evPQ3hbiUcTQOw0JDZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13/06/2023 12:33, Richard Purdie wrote:
> On Tue, 2023-06-13 at 10:55 +0100, Peter Hoyes wrote:
>> On 23/05/2023 18:06, Ross Burton wrote:
>>> On 17 May 2023, at 17:29, Peter Hoyes via lists.openembedded.org
>>> <peter.hoyes=3Darm.com@lists.openembedded.org>  wrote:
>>>> The testdata.json file generated as part of the rootfs
>>>> postprocess
>>>> commands contains almost all Bitbake variables and is used by
>>>> OEQA test
>>>> cases to inspect the build environment. However it is only
>>>> regenerated
>>>> when the rootfs task is otherwise retriggered, complicating the
>>>> process
>>>> of developing OEQA test cases.
>>> I=E2=80=99m about to run for dinner, but would it make more sense for=
 this
>>> function to be a separate task inside testimage.bbclass that
>>> happens after rootfs?  This will stop the explosion of variable
>>> dependencies causing rootfs to re-run.
>>>
>>> Ross
>> Thanks for the suggestion - I have implemented this for consideration
>> in
>> https://lists.openembedded.org/g/openembedded-core/topic/patch_1_2/995=
01785
> Making it a separate task is fine, the challenge is that it needs to
> run at the same time as image processing so that DATE/TIME are
> consistent and the image names are correct.
>
> That implies that it has to be before do_image_complete which means any
> change in variables will retrigger the image creation :(.
>
> I think we need to try and fix this differently and stop exporting
> every variable.
>
> Cheers,
>
> Richard

If I understand correctly...

It sounds like moving testdata creation to a separate task doesn't bring=20
much benefit so I'll revert to something based off this patch.

It looks like a relatively small number of variables are actually used=20
by OEQA tests in OE-core:

  * IMAGE
  * ARCH
  * MACHINE
  * PACKAGE_FEED_GPG_NAME
  * VIRTUAL-RUNTIME_init_manager
  * WORKDIR
  * DISTRO_FEATURES
  * PTEST_EXPECT_FAILURE
  * TEST_LOG_DIR
  * libdir
  * T
  * MULTILIB_VARIANTS
  * SDKPATH
  * SDK_DEPLOY
  * TOOLCHAINEXT_OUTPUTNAME
  * QEMU_USE_KVM
  * DL_DIR

Notably, DATE/TIME do not seem to be referenced at all (apart from a=20
comment in oeqa/runtime/cases/ptest.py recommending *not* using DATETIME=20
for test output). Additionally, DL_DIR and WORKDIR are updated on each=20
testimage execution using TESTIMAGE_UPDATE_VARS.

How about introducing a new variable, e.g. TESTIMAGE_EXPORT_VARS,=20
containing just the list above (to which other variables could=20
optionally be appended in other layers)?

Peter

--------------698Pa4evPQ3hbiUcTQOw0JDZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 13/06/2023 12:33, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:b4852d5295cc250431cf375ba4677c9cc5cbbfc1.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, 2023-06-13 at 10:55 =
+0100, Peter Hoyes wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 23/05/2023 18:06, Ross =
Burton wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On 17 May 2023, at 17:29=
, Peter Hoyes via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:peter.hoyes=3Darm.com@l=
ists.openembedded.org">&lt;peter.hoyes=3Darm.com@lists.openembedded.org&g=
t;</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">The testdata.json file=
 generated as part of the rootfs
postprocess
commands contains almost all Bitbake variables and is used by
OEQA test
cases to inspect the build environment. However it is only
regenerated
when the rootfs task is otherwise retriggered, complicating the
process
of developing OEQA test cases.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">I=E2=80=99m about to run=
 for dinner, but would it make more sense for this
function to be a separate task inside testimage.bbclass that
happens after rootfs?  This will stop the explosion of variable
dependencies causing rootfs to re-run.

Ross
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Thanks for the suggestion - I have implemented this for consideration
in=20
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedded.org=
/g/openembedded-core/topic/patch_1_2/99501785">https://lists.openembedded=
.org/g/openembedded-core/topic/patch_1_2/99501785</a>
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Making it a separate task is fine, the challenge is that it needs to
run at the same time as image processing so that DATE/TIME are
consistent and the image names are correct.

That implies that it has to be before do_image_complete which means any
change in variables will retrigger the image creation :(.

I think we need to try and fix this differently and stop exporting
every variable.

Cheers,

Richard
</pre>
    </blockquote>
    <p>If I understand correctly...<br>
    </p>
    <p>It sounds like moving testdata creation to a separate task
      doesn't bring much benefit so I'll revert to something based off
      this patch.<br>
    </p>
    <p>It looks like a relatively small number of variables are actually
      used by OEQA tests in OE-core:</p>
    <ul>
      <li>IMAGE</li>
      <li>ARCH</li>
      <li>MACHINE</li>
      <li>PACKAGE_FEED_GPG_NAME</li>
      <li>VIRTUAL-RUNTIME_init_manager</li>
      <li>WORKDIR</li>
      <li>DISTRO_FEATURES</li>
      <li>PTEST_EXPECT_FAILURE</li>
      <li>TEST_LOG_DIR</li>
      <li>libdir</li>
      <li>T</li>
      <li>MULTILIB_VARIANTS</li>
      <li>SDKPATH</li>
      <li>SDK_DEPLOY</li>
      <li>TOOLCHAINEXT_OUTPUTNAME</li>
      <li>QEMU_USE_KVM<br>
      </li>
      <li>DL_DIR<br>
      </li>
    </ul>
    <p>Notably, DATE/TIME do not seem to be referenced at all (apart
      from a comment in oeqa/runtime/cases/ptest.py recommending *not*
      using DATETIME for test output). Additionally, DL_DIR and WORKDIR
      are updated on each testimage execution using
      TESTIMAGE_UPDATE_VARS.<br>
    </p>
    <p>How about introducing a new variable, e.g. TESTIMAGE_EXPORT_VARS,
      containing just the list above (to which other variables could
      optionally be appended in other layers)?</p>
    <p>Peter<br>
    </p>
  </body>
</html>

--------------698Pa4evPQ3hbiUcTQOw0JDZ--

