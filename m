Return-Path: <l.stach@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3C6C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 09:03:38 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web09.4383.1660208614857095535
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 02:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: l.stach@pengutronix.de)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1oM46G-00074n-MI; Thu, 11 Aug 2022 11:03:32 +0200
Message-ID: <0aa804c7ad0822cf943eee3118309e11707a8021.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH] perf: sort-pmuevents: really keep array
 terminators
From: Lucas Stach <l.stach@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Max Krummenacher
	 <max.oss.09@gmail.com>
Date: Thu, 11 Aug 2022 11:03:31 +0200
In-Reply-To: <16FAB17DECFBADD8.5445@lists.openembedded.org>
References: <16FAB17DECFBADD8.5445@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 09:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169238

Hi all,

gentle ping with some people CC'ed.

Regards,
Lucas

Am Dienstag, dem 21.06.2022 um 19:02 +0200 schrieb Lucas Stach:
> Commit e1382583cd50 ("perf: sort-pmuevents: don't drop elements") tried
> to fix a case where the array terminator elements were dropped from the
> sorted list breaking the build, but it only worked for the case where
> the terminator is the only element of the array. When the array has other
> elements the terminator will still be silently dropped, causing invalid
> memory accesses at runtime when the perf utility iterates over the array.
> 
> Fix this by treating any unmatched entry as an array terminator and also
> add a comment to make it a little more clear how things are ending up at
> the right position in the sorted list.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  meta/recipes-kernel/perf/perf/sort-pmuevents.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
> index 09ba3328a7ab..0362f2d8fabc 100755
> --- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
> +++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
> @@ -62,7 +62,10 @@ for struct in re.findall( struct_block_regex, data ):
>              #print( "    name found: %s" % name.group(1) )
>              entry_dict[struct[2]]['fields'][name.group(1)] = entry
>  
> -        if not entry_dict[struct[2]]['fields']:
> +        # unmatched entries are most likely array terminators and
> +        # should end up as the last element in the sorted list, which
> +        # is achieved by using '0' as the key
> +        if not cpuid and not name:
>              entry_dict[struct[2]]['fields']['0'] = entry
>  
>  # created ordered dictionaries from the captured values. These are ordered by
> 



