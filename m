Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900D9C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 08:20:01 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.26627.1683620395954363036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 01:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dgTez4Ay;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8311CC000D;
	Tue,  9 May 2023 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683620394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ODSR71UL+v7R2HSuUWOLMcQw/YBcmqBoMmN0LewLbyA=;
	b=dgTez4AyXdbZAcv2sG2ns5oAVRTQ6frCUCKDRpvTyN6f0OXS8/K5b0z00j85lK9lwKIRAI
	GlsEChp2dG5IcylQURD/XrWaXo3MFdLt6iUf8LMdUHMpvYRbx1qr2L1y1YyBv/YHSxNmJE
	WToAiOuPhPqxfd35UKuPnKnd4l6DQndAbgNBrZH+lVptjBYOGll/ZdVE30p1SUlPtQ31uy
	m8Xq/1iPp9p6bUvGge8ZGUAbXgyblzbwwZIvg5OmQl2DByjtRZz7yJ5SKTTENg8WRilFXi
	NbkR5ELv+ZDe3RzlZkOej2o+94AD1i4o+pYQq6iFVNaLiwWU3uiSwhIDzpJl1Q==
Message-ID: <a4e187fe-3754-5754-ee33-0a9e03895614@bootlin.com>
Date: Tue, 9 May 2023 10:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] cve-check: add option to add additional patched
 CVEs
Content-Language: en-US
To: andrej.valek@siemens.com
References: <20230505111814.491483-1-andrej.valek@siemens.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230505111814.491483-1-andrej.valek@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 08:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181035

Hi Andrej,

On 05.05.23 at 13:18, Andrej Valek via lists.openembedded.org wrote:
> CVE_CHECK_PATCHED - should contains an additional CVEs which have been
> fixed and shouldn't be mark as vulnerable nor ignored.
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>   meta/classes/cve-check.bbclass | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index bd9e7e7445c..957ea0130dc 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -78,6 +78,11 @@ CVE_CHECK_SKIP_RECIPE ?= ""
>   #
>   CVE_CHECK_IGNORE ?= ""
>   
> +# Usually a CVE gets treated as patched when a patch with the name of the CVE
> +# gets applied. Basically this variable should not be used. But if there are
> +# other reasons to mark a CVE as patched it can be added to this list.
> +CVE_CHECK_PATCHED ?= ""
> +
>   # Layers to be excluded
>   CVE_CHECK_LAYER_EXCLUDELIST ??= ""
>   
> @@ -284,6 +289,9 @@ def check_cves(d, patched_cves):
>   
>       cve_ignore = d.getVar("CVE_CHECK_IGNORE").split()
>   
> +    # add additional patched CVEs into existing patched list
> +    patched_cves.update(d.getVar("CVE_CHECK_PATCHED").split())
> +
>       import sqlite3
>       db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
>       conn = sqlite3.connect(db_file, uri=True)


Thanks for the patch!
However, we'd need you to add one thing to your git configuration, so 
that your patches are given an "Author" field which matches your 
"Signed-off-by" information. See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity 
for details.

Don't hesitate to send a patch test directly to me, if you wish.
Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


