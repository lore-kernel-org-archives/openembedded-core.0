Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76039C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 13:48:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8249.1719496108367176174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 06:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBE58367;
	Thu, 27 Jun 2024 06:48:52 -0700 (PDT)
Received: from [10.1.36.164] (e133390.arm.com [10.1.36.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 169CC3F766;
	Thu, 27 Jun 2024 06:48:26 -0700 (PDT)
Message-ID: <ac5a017e-7ae4-4762-a4c8-263e0604d55f@arm.com>
Date: Thu, 27 Jun 2024 14:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] testimage: Gate artifact collection with
 variable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <Ross.Burton@arm.com>,
 ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240626094130.255905-1-peter.hoyes@arm.com>
 <dc373ddf53eddf0ef3103d9f08a9bb72bbd00550.camel@linuxfoundation.org>
 <00A67594-956C-4E0F-BA5A-CE113EFFB153@arm.com>
 <4c9ada58477ef36f4022972b74140e0f14f2bc6a.camel@linuxfoundation.org>
Content-Language: en-US
From: Peter Hoyes <peter.hoyes@arm.com>
In-Reply-To: <4c9ada58477ef36f4022972b74140e0f14f2bc6a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 13:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201205

On 6/27/24 14:31, Richard Purdie wrote:
> On Thu, 2024-06-27 at 12:34 +0000, Ross Burton wrote:
>> On 27 Jun 2024, at 13:02, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Wed, 2024-06-26 at 10:41 +0100, Peter Hoyes via
>>> lists.openembedded.org wrote:
>>>> It does not always make sense to collect artifacts and data from
>>>> the
>>>> target on failure, e.g. if testing firmware or if the target is
>>>> not
>>>> running an SSH server.
>>>>
>>>> Introduce the variable TESTIMAGE_RUN_FAILURE_POST_ACTIONS, which
>>>> defaults to "1". If this variable is not true, skip the failed
>>>> test post
>>>> actions.
>>>>
>>>> Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
>>>> ---
>>>>  =C2=A0meta/classes-recipe/testimage.bbclass | 10 ++++++----
>>>>  =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
>>> Is there a reason you can't just set TESTIMAGE_FAILED_QA ARTIFACTS
>>> =3D "=E2=80=9D
>>> ?
>> Answering for Peter because I asked the same question: the next step
>> after list_and_fetch_failed_tests_artifacts() is
>> get_target_disk_usage() which does a target.run() so causes a SSH
>> call.
> Rather than call this RUN_FAILURE_POST_ACTIONS could we have something
> like TESTIMAGE_SSH_AVAILABLE and then test against that in the
> appropriate places?
>
> Cheers,
>
> Richard

In our test suite at least, SSH is sometimes available and we use SSH=20
where it makes sense. We just can't guarantee that SSH is available in=20
all failure scenarios (e.g. if the firmware failed to boot), and many of=20
our test cases run pre-Linux shell.

Peter


