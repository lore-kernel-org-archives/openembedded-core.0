Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40436C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 09:14:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.9084.1637658877859659495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 01:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 90F09C0019;
	Tue, 23 Nov 2021 09:14:35 +0000 (UTC)
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] dev-manual: how to purge duplicate sstate cache
 files
To: docs@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
References: <16B8C24F834E3318.24748@lists.openembedded.org>
 <16B8FE3872AB92F9.32206@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1731b51b-da96-50b2-923b-3ae95b8911d6@bootlin.com>
Date: Tue, 23 Nov 2021 10:14:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16B8FE3872AB92F9.32206@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 09:14:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158598

Greetings,

On 11/19/21 5:06 PM, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 25 ++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 3eead147a3..37612c84b7 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -6242,8 +6242,11 @@ Changing the listed common targets is as easy as editing your version of
>  ``conf-notes.txt`` in your custom template configuration directory and
>  making sure you have ``TEMPLATECONF`` set to your directory.
>  
> +Conserving Disk Space
> +=====================
> +
>  Conserving Disk Space During Builds
> -===================================
> +-----------------------------------
>  
>  To help conserve disk space during builds, you can add the following
>  statement to your project's ``local.conf`` configuration file found in
> @@ -6257,6 +6260,26 @@ building a recipe once the recipe is built. For more information on
>  :ref:`rm_work <ref-classes-rm-work>` class in the
>  Yocto Project Reference Manual.
>  
> +Purging Duplicate Shared State Cache Files
> +-------------------------------------------
> +
> +After multiple build iterations, the Shared State (sstate) cache can contain
> +duplicate cache files for a given package, while only the most recent one
> +is likely to be reusable. The following command purges all but the
> +newest sstate cache file for each package::
> +
> +   sstate-cache-management.sh --remove-duplicated --cache-dir=build/sstate-cache
> +
> +This command will ask you to confirm the deletions it identifies.
> +
> +Note::
> +
> +   The duplicated sstate cache files of one package must have the same
> +   architecture, which means that sstate cache files with multiple
> +   architectures are not considered as duplicate.
> +
> +Run ``sstate-cache-management.sh`` for more details about this script.
> +
>  Working with Packages
>  =====================
>  

Did anyone have time to have a look at what I wrote ? There may be
better ways to purge the sstate cache files.
Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


