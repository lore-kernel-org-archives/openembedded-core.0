Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02185C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 09:32:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8847.1720517519061656936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 02:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73BB31042;
	Tue,  9 Jul 2024 02:32:23 -0700 (PDT)
Received: from [10.1.30.143] (e133390.arm.com [10.1.30.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA2A93F766;
	Tue,  9 Jul 2024 02:31:57 -0700 (PDT)
Message-ID: <5003b8c9-22d1-4fa6-8fae-5ef9f276a2d4@arm.com>
Date: Tue, 9 Jul 2024 10:31:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] testimage/postactions: Allow artifact collection to be
 skipped
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20240708165616.349661-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Peter Hoyes <peter.hoyes@arm.com>
In-Reply-To: <20240708165616.349661-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 09:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201651

On 7/8/24 17:56, Richard Purdie wrote:
> It does not always make sense to collect artifacts and data from the
> target on failure, e.g. if testing firmware or if the target is not
> running an SSH server.
>
> Allow this by setting TESTIMAGE_FAILED_QA_ARTIFACTS to an empty
> value.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/lib/oeqa/utils/postactions.py | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
> index 2a08129d6c0..15f423218eb 100644
> --- a/meta/lib/oeqa/utils/postactions.py
> +++ b/meta/lib/oeqa/utils/postactions.py
> @@ -86,6 +86,11 @@ def list_and_fetch_failed_tests_artifacts(d, tc):
>   ##################################################################
>   
>   def run_failed_tests_post_actions(d, tc):
> +    artifacts = d.getVar("TESTIMAGE_FAILED_QA_ARTIFACTS")
> +    # Allow all the code to be disabled by having no artifacts set, e.g. for systems with no ssh support
> +    if not artifacts:
> +        return
> +
>       post_actions=[
>           create_artifacts_directory,
>           list_and_fetch_failed_tests_artifacts,

Thanks, that does the trick.

Peter


