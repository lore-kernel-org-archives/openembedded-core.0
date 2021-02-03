Received: from mail29.static.mailgun.info (mail29.static.mailgun.info [104.130.122.29])
 by mx.groups.io with SMTP id smtpd.web11.11623.1612369454418120543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 08:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=P82kGoub;
 spf=pass (domain: mg.codeaurora.org, ip: 104.130.122.29, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612369455; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=e928B2+xXosWqdb93gv7GFIq4ZcozI87oIJTcZl01zA=;
 b=P82kGoubQZIFiTKHAwhibUKqdcd7WOdHtOoK7sCY0Z6videooSiQjNeYUOeQeuZ4z2N3jQKr
 sd4aLSmUt8a7LL7+/GDBrHqAYUxUeCu34HmTXd1vvkjFV4dmXUXPNgarVUPnL5wW4qd+0WYw
 DhBzn/TjAgGWjKEy8lAkveFom6s=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 601ace285a2f264828e48f3c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Feb 2021 16:24:08
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 45459C433ED; Wed,  3 Feb 2021 16:24:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E1166C433CA;
	Wed,  3 Feb 2021 16:24:07 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 03 Feb 2021 21:54:07 +0530
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
Cc: vkraleti@codeaurora.org, ndeche@codeaurora.org, himalg@codeaurora.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [Dunfell][PATCH] layer.conf: fix sanity error for PATH variable in extensible SDK workflow
In-Reply-To: <1612369223-5608-1-git-send-email-sbanerje@codeaurora.org>
References: <1612369223-5608-1-git-send-email-sbanerje@codeaurora.org>
Message-ID: <c26b70b89acf21df70c8be98c1797baf@codeaurora.org>
X-Sender: sbanerje@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2021-02-03 21:50, Sourabh Banerjee wrote:
> Sanity checker reports following error for the PATH variable,
> when bitbake -e <recipe> command is run in an extensible SDK workspace.
>    PATH contains '.', './' or '' (empty element), which will break the 
> build
> 
> In case of extensible SDK, PATH variable is formed with two consecutive 
> ':'
> as bb.utils.which(d.getVar('PATH'),'bitbake') call returns an empty 
> string.
> 
> This change adds ':' if BITBAKEPATH is a non empty string.
> 
> (From OE-Core rev: 05a87be51b44608ce4f77ac332df90a3cd2445ef)
> 
> Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/layer.conf | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index d593492..2d9cd05 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -102,4 +102,6 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
>  SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
> 
>  # We need to keep bitbake tools in PATH
> -PATH :=
> "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
> +# Avoid empty path entries
> +BITBAKEPATH :=
> "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
> +PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' is not '' else
> ''}${HOSTTOOLS_DIR}"

Hi Steve,

This is a backport from from master to Dunfell.

Regards,
Sourabh


-- 
Regards,
Sourabh
