Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7850C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 11:04:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.10211.1699959838344359673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 03:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CkWjC/T5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EE79240008;
	Tue, 14 Nov 2023 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699959836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUaHXUyBkzdQWyQbHQASDDxJUIx7vDp+wn8wXb9rvWg=;
	b=CkWjC/T5CECq/MvcYwr1tI56SBkTNJwgXDL1j+WljsF1mjDvNsnA8qQzRxzj6c731Tijd8
	0+zdcNvOFyQcu9S+0EM5dSbd80fM68iwqL/gd3n1+ZbXQj9Z0nvaxthjjuwFlEsuDJtNnt
	iPLACA2e+0fDod4+qYQXYudYrM/eHIY+OjLh3F45H+awRQjcg9fm0g8yS+jSlFNVel0Qv7
	bmeLngDnti4vyrGteEA7GtK333toola8qvuKwFZQREx7BZgijslRaPafPFudQsPpRDQmEf
	xhf7jQ59VWiEiobE+6ziOsNwKZIVe3Ta36NWcYrSqAuZ2+aM6gGWAJVnzQSqWw==
Date: Tue, 14 Nov 2023 12:03:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org,
	Malte Schmidt <malte.schmidt@weidmueller.com>
Subject: Re: [OE-Core][PATCH 1/1] wic: extend empty plugin with options to
 write zeros to partiton
Message-ID: <202311141103555a7e06f9@mail.local>
References: <cover.1699885520.git.lukas.funke@weidmueller.com>
 <084355e0fe303a8322111da4b84f3a3a6c2048d9.1699885520.git.lukas.funke@weidmueller.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <084355e0fe303a8322111da4b84f3a3a6c2048d9.1699885520.git.lukas.funke@weidmueller.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 11:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190497

Hello Lukas,

On 14/11/2023 09:13:32+0100, Lukas Funke wrote:
> From: Malte Schmidt <malte.schmidt@weidmueller.com>
> 
> Adds features to explicitly write zeros to the start of the
> partition. This is useful to overwrite old content like
> filesystem signatures which may be re-recognized otherwise.
> 
> The new features can be enabled with
> '--soucreparams="[fill|size=<N>[S|s|K|k|M|G]][,][bs=<N>[S|s|K|k|M|G]]"'
> Conflicting or missing options throw errors.
> 
> The features are:
> - fill
>   Fill the entire partition with zeros. Requires '--fixed-size' option
>   to be set.
> - size=<N>[S|s|K|k|M|G]
>   Set the first N bytes of the partition to zero. Default unit is 'K'.
> - bs=<N>[S|s|K|k|M|G]
>   Write at most N bytes at a time during source file creation.
>   Defaults to '1M'. Default unit is 'K'.
> 
> Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>

We need your SoB here

> ---
>  scripts/lib/wic/plugins/source/empty.py | 57 ++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/empty.py b/scripts/lib/wic/plugins/source/empty.py
> index 041617d648..f7581a0298 100644
> --- a/scripts/lib/wic/plugins/source/empty.py
> +++ b/scripts/lib/wic/plugins/source/empty.py
> @@ -7,9 +7,19 @@
>  # To use it you must pass "empty" as argument for the "--source" parameter in
>  # the wks file. For example:
>  # part foo --source empty --ondisk sda --size="1024" --align 1024
> +#
> +# The plugin supports writing zeros to the start of the
> +# partition. This is useful to overwrite old content like
> +# filesystem signatures which may be re-recognized otherwise.
> +# This feature can be enabled with
> +# '--soucreparams="[fill|size=<N>[S|s|K|k|M|G]][,][bs=<N>[S|s|K|k|M|G]]"'
> +# Conflicting or missing options throw errors.
>  
>  import logging
> +import os
>  
> +from wic import WicError
> +from wic.ksparser import sizetype
>  from wic.pluginbase import SourcePlugin
>  
>  logger = logging.getLogger('wic')
> @@ -17,6 +27,16 @@ logger = logging.getLogger('wic')
>  class EmptyPartitionPlugin(SourcePlugin):
>      """
>      Populate unformatted empty partition.
> +
> +    The following sourceparams are supported:
> +    - fill
> +      Fill the entire partition with zeros. Requires '--fixed-size' option
> +      to be set.
> +    - size=<N>[S|s|K|k|M|G]
> +      Set the first N bytes of the partition to zero. Default unit is 'K'.
> +    - bs=<N>[S|s|K|k|M|G]
> +      Write at most N bytes at a time during source file creation.
> +      Defaults to '1M'. Default unit is 'K'.
>      """
>  
>      name = 'empty'
> @@ -29,4 +49,39 @@ class EmptyPartitionPlugin(SourcePlugin):
>          Called to do the actual content population for a partition i.e. it
>          'prepares' the partition to be incorporated into the image.
>          """
> -        return
> +        get_byte_count = sizetype('K', True)
> +        size = 0
> +
> +        if 'fill' in source_params and 'size' in source_params:
> +            raise WicError("Conflicting source parameters 'fill' and 'size' specified, exiting.")
> +
> +        # Set the size of the zeros to be written to the partition
> +        if 'fill' in source_params:
> +            if part.fixed_size == 0:
> +                raise WicError("Source parameter 'fill' only works with the '--fixed-size' option, exiting.")
> +            size = part.fixed_size
> +        elif 'size' in source_params:
> +            size = get_byte_count(source_params['size'])
> +
> +        if size == 0:
> +            # Nothing to do, create empty partition
> +            return
> +
> +        if 'bs' in source_params:
> +            bs = get_byte_count(source_params['bs'])
> +        else:
> +            bs = get_byte_count('1M')
> +
> +        # Create a binary file of the requested size filled with zeros
> +        source_file = os.path.join(cr_workdir, 'empty-plugin-zeros%s.bin' % part.lineno)
> +        if not os.path.exists(os.path.dirname(source_file)):
> +            os.makedirs(os.path.dirname(source_file))
> +
> +        quotient, remainder = divmod(size, bs)
> +        with open(source_file, 'wb') as file:
> +            for _ in range(quotient):
> +                file.write(bytearray(bs))
> +            file.write(bytearray(remainder))
> +
> +        part.size = (size + 1024 - 1) // 1024  # size in KB rounded up
> +        part.source_file = source_file
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190489): https://lists.openembedded.org/g/openembedded-core/message/190489
> Mute This Topic: https://lists.openembedded.org/mt/102579765/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

