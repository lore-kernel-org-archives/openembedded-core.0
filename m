Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5D6C77B6F
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 09:31:40 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.5079.1681464693412746763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 02:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z58Rgi+h;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D2C04240009;
	Fri, 14 Apr 2023 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681464691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gcw3bJsscXdEgeDMzS7ayDQ4JKmFXnqXfoDprr/JtHQ=;
	b=Z58Rgi+h/f18zYeG0R3llUv4HuT/BEX1COOuDC3sByhO0fv5vr2XNPxJTUHjVwPp6NbpH1
	CEUKOaCyipOZvYEKDmyPZaShrI9Q+xxUl8piMNTgQnZ/FUfVi+1WvfFRnDYpWIHrzi4OpU
	x0Hz12hxhXuf6gvW9L8pepOTY841xqwRQe9mQP0wk9t7tCmTzBEA1UVOk6TP749n3LQ266
	89d6PdzjRIlaAq8V2tUoFd/FFfD1OVS008BQLnqJHU2hERAzGaMhYbUrAWC8gE03jxQRA/
	8KM06cG62tYEUeTpCYpwDaO0vE7NcborKKVuERlcBW9e6PAHQ+MU1dPt84QVwQ==
Date: Fri, 14 Apr 2023 11:31:29 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] report-error: make it catch ParseError error
Message-ID: <20230414113129.12a7b652@booty>
In-Reply-To: <20230414020838.2696639-1-mingli.yu@eng.windriver.com>
References: <20230414020838.2696639-1-mingli.yu@eng.windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 09:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179994

Hi Mingli,

I'm taking this patch for AB testing, however I have a couple remarks
that might turn into a new version of your patch or in a follow-up
cleanup patch, see below.

On Fri, 14 Apr 2023 10:08:38 +0800
"Yu, Mingli" <mingli.yu@eng.windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Make the report-error catch ParseError error as below and then
> we can check it directly via error report web.
> 
> ParseError at /build/layers/oe-core/meta/recipes-support/curl/curl_7.88.1.bb:32: unparsed line: 'PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver'
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/classes/report-error.bbclass | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
> index 2b2ad56514..041db44941 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -132,6 +132,30 @@ python errorreport_handler () {
>              errorreport_savedata(e, data, "error-report.txt")
>              bb.utils.unlockfile(lock)
>  
> +        elif isinstance(e, bb.event.ParseError):
> +            bb.utils.mkdirhier(logpath)
> +            data = {}
> +            machine = e.data.getVar("MACHINE")
> +            data['machine'] = machine

These two lines could become one line, removing the 'machine' variable:

  data['machine'] = e.data.getVar("MACHINE")

I see you used the same pattern as other if/elif branches in the
surrounding code, so they could also be simplified.

> +            data['build_sys'] = e.data.getVar("BUILD_SYS")
> +            data['nativelsb'] = nativelsb()
> +            data['distro'] = e.data.getVar("DISTRO")
> +            data['target_sys'] = e.data.getVar("TARGET_SYS")
> +            data['failures'] = []
> +            data['component'] = "parse"
> +            data['branch_commit'] = str(oe.buildcfg.detect_branch(e.data)) + ": " + str(oe.buildcfg.detect_revision(e.data))
> +            data['bitbake_version'] = e.data.getVar("BB_VERSION")
> +            data['layer_version'] = get_layers_branch_rev(e.data)
> +            data['local_conf'] = get_conf_data(e, 'local.conf')
> +            data['auto_conf'] = get_conf_data(e, 'auto.conf')
> +            taskdata={}
> +            taskdata['log'] = str(e._msg)
> +            taskdata['task'] = str(e._msg)
> +            data['failures'].append(taskdata)
> +            lock = bb.utils.lockfile(datafile + '.lock')
> +            errorreport_savedata(e, data, "error-report.txt")
> +            bb.utils.unlockfile(lock)

Most of this code is already duplicated in two branches already, and
with your patch there will be three copies. Can the common lines be
moved to a helper function?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

