Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B73AC369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 10:45:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.7082.1745145897541312846
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 03:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aRAgG/LZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39bf44be22fso2156237f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 03:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745145896; x=1745750696; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/EePR3fBJS/VeXInrZVEXSYJ8GvQBt7WW7Koylbgg8=;
        b=aRAgG/LZdxDVacFnA9KxdTR9LaMWBWZGN/XipzH+h29gJFd/tGN1n+HoShqNCO8W9u
         91xL6nfZZor8eUZ0Z40dbTTPvrYn+ubpXVwS3kYySkGo9+VeWGZu39raqnRZIXfmptH5
         akeKxGAtpkljWRJtkMR1G8oam0E5PdtsJRUe5yya2qSwMHSZ9YDlTJftQlWc6+71Y8eZ
         WqpkVWoKg6pc6Ukiev+hMbR9xQiTnpYPA3xnRzVlM1eNZO1JXtYIG/74lempXF4dOFWv
         t+AsLQrmdhCjlxmL03LNQ/75jXVCeolkCCy+kWZN3TgVtnl1y2ns/dRGXIBTVPFCqBTH
         L2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745145896; x=1745750696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/EePR3fBJS/VeXInrZVEXSYJ8GvQBt7WW7Koylbgg8=;
        b=NBWUBwWOFaBBGRuw6mTnWmLSlpHd78IpXsquP4gbS7TA1fQA38CsMA6ueWHGVgjtlV
         V1db71RmTBbqcRZe4C/COr3xoNMOAVn6GbN/0vAl+QS0wv5rpzccIiUuuFZjj/Sk4QC0
         IQqDua+y/Zlmacbi4yHfC9gFmWZRFrCVdKcF87pYuxlP6KjEI4yICddOXm1LXqJX32Yt
         eBiaylik8oCND9U+AwsZNfkf72c3uUqLrFE4oMxY/2r/YH9v3CevFf1q+GNflo+bYBAs
         QCJLg8qqr2cWaXVdMSDVwQnAkOgdlJKylJjVWkiV80Q7vTxrhOVAYs57UzC2IztolVTX
         y+Ng==
X-Forwarded-Encrypted: i=1; AJvYcCX/sv6afAl8T5XfDtqHl78/exaPkTD6v2ObcpCKpl5L84PO93Zzrx35EaVU2etFDGI8U2/SnNO3MWnPRtc8x3P49w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxuYFYeSO1tX6ken0JDnlA6F0YhsjlSWZj51EaikdUhnOgDBBy4
	OGXlC6TfExk5L+JjhCNMXiX750ayOq2taquLUkbN9iZlI/U5ZxXZ
X-Gm-Gg: ASbGncvqQ0BFqXR4DsQjs++908L78bD+kcITVFZLsjLgrsx/MO7ELty686xc1iQ8f70
	zzCHt0ooN/l1a9DPo/iJ33kTGF3mZVikfzTgeYHUs1UI25i7mmMqxlphZtpW6hTocZ6uHYCLjG3
	6F0dD/tLpZ1IXhfosp1UXM4j8fQXrIlWka3QgiV/pwJgj2tB037Buc5HlYjEg2bVEs082ELXdHS
	Q/DaDG01nstW03ZJFdTfPpqP3vJo/NubeHG3Qu2uKj21N/H2qbgm/zMnuEU76gofXdE6ZF/TCey
	kixtSracROVWIMDIpJl0SZcqmxXSrzEZBP3R+Lq4eLbnHHgW
X-Google-Smtp-Source: AGHT+IHS2RcF694p2EbuEXB0WI6dI4rlWIxG9/1SCxg5v47G/otqH3f/2ravZw68hyE7kMWkWmwB1w==
X-Received: by 2002:a5d:6da1:0:b0:39a:ca0c:fc90 with SMTP id ffacd0b85a97d-39efba3c6e4mr6904956f8f.14.1745145895575;
        Sun, 20 Apr 2025 03:44:55 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa420821sm8681687f8f.14.2025.04.20.03.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 03:44:55 -0700 (PDT)
Message-ID: <39feaeb4-a937-408d-9e2d-90d2460acbf9@gmail.com>
Date: Sun, 20 Apr 2025 12:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] send-error-report: improve debugging
To: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20250418133504.932848-1-thomas.perrot@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250418133504.932848-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 10:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215153

I noticed that this (or at least v1) was applied on master - would like
to call some attention to a related discussion[1] in a neighboring list,
and some patches[2][3][4] that followed it - at least [3] is a
pre-requisite for this patch (error-report-web has hardcoded the version
of the script to 0.3).

[1]: https://lists.yoctoproject.org/g/yocto/message/65184
[2]: https://lists.yoctoproject.org/g/yocto/message/65188
[3]: https://lists.yoctoproject.org/g/yocto/message/65199
[4]: https://lists.yoctoproject.org/g/yocto/message/65200

On 4/18/25 15:35, Thomas Perrot via lists.openembedded.org wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> - add a debug mode
> - print the request and the response when an error occurs.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>
> Changes in version 2:
> - Drop the redundant checks
>
> scripts/send-error-report | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/send-error-report b/scripts/send-error-report
> index cfbcaa52cbc3..9ea7160f52c4 100755
> --- a/scripts/send-error-report
> +++ b/scripts/send-error-report
> @@ -6,6 +6,7 @@
>  # Copyright (C) 2013 Intel Corporation
>  # Author: Andreea Proca <andreea.b.proca@intel.com>
>  # Author: Michael Wood <michael.g.wood@intel.com>
> +# Author: Thomas Perrot <thomas.perrot@bootlin.com>
>  #
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
> @@ -22,7 +23,7 @@ scripts_lib_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'li
>  sys.path.insert(0, scripts_lib_path)
>  import argparse_oe
>
> -version = "0.3"
> +version = "0.4"
>
>  log = logging.getLogger("send-error-report")
>  logging.basicConfig(format='%(levelname)s: %(message)s')
> @@ -140,14 +141,21 @@ def send_data(data, args):
>          url = args.protocol+args.server+"/ClientPost/"
>
>      req = urllib.request.Request(url, data=data, headers=headers)
> +
> +    log.debug(f"Request URL: {url}")
> +    log.debug(f"Request Headers: {headers}")
> +    log.debug(f"Request Data: {data.decode('utf-8')}")
> +
>      try:
>          response = urllib.request.urlopen(req)
>      except urllib.error.HTTPError as e:
> -        logging.error(str(e))
> +        log.error(f"HTTP Error {e.code}: {e.reason}")
> +        log.debug(f"Response Content: {e.read().decode('utf-8')}")
>          sys.exit(1)
>
> -    print(response.read().decode('utf-8'))
> -
> +    log.debug(f"Response Status: {response.status}")
> +    log.debug(f"Response Headers: {response.getheaders()}")
> +    log.info(response.read().decode('utf-8'))
>
>  if __name__ == '__main__':
>      arg_parse = argparse_oe.ArgumentParser(description="This scripts will send an error report to your specified error-report-web server.")
> @@ -195,13 +203,20 @@ if __name__ == '__main__':
>                             dest="protocol",
>                             action="store_const", const="http://", default="https://")
>
> -
> +    arg_parse.add_argument("-d",
> +                           "--debug",
> +                           help="Enable debug mode to print request/response details",
> +                           action="store_true")
>
>      args = arg_parse.parse_args()
>
>      if (args.json == False):
>          print("Preparing to send errors to: "+args.server)
>
> +    # Enable debugging if requested
> +    if args.debug:
> +        log.setLevel(logging.DEBUG)
> +
>      data = prepare_data(args)
>      send_data(data, args)
>
> --
> 2.49.0
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215131): https://lists.openembedded.org/g/openembedded-core/message/215131
> Mute This Topic: https://lists.openembedded.org/mt/112330994/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


