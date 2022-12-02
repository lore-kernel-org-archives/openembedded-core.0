Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8351EC4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 21:51:54 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.89135.1670017912009204286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 13:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2B2LpoHk006107
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Dec 2022 15:51:51 -0600
Message-ID: <bd084165-8628-fb24-2025-bf2385f1cb44@kernel.crashing.org>
Date: Fri, 2 Dec 2022 15:51:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [OE-core] [master,langdale][PATCH] qemurunner.py: Support
 fallback to older QEMU qmp library
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <1729AFCC6EFF7CE9.24096@lists.openembedded.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <1729AFCC6EFF7CE9.24096@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 21:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174246

Ping, any comments on this?

On 11/21/22 1:20 PM, Mark Hatle wrote:
> From: Mark Hatle <mark.hatle@amd.com>
> 
> Some vendor versions of QEMU may be on older versions that do not have
> qmp.legacy, but instead of qmp.  Default to the integrated library
> versions, fall back to the older one and then if neither is available
> catch the exception and provide a more human readable error.
> 
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>   meta/lib/oeqa/utils/qemurunner.py | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index f175f8a1de..436caef273 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -328,8 +328,14 @@ class QemuRunner:
>           try:
>               os.chdir(os.path.dirname(qmp_port))
>               try:
> -               from qmp.legacy import QEMUMonitorProtocol
> +               try:
> +                   from qmp.legacy import QEMUMonitorProtocol
> +               except ModuleNotFoundError:
> +                   from qmp import QEMUMonitorProtocol
>                  self.qmp = QEMUMonitorProtocol(os.path.basename(qmp_port))
> +            except ModuleNotFoundError as msg:
> +                self.logger.warning("Failed to load QEMUMonitorProtocol from qmp.legacy or qmp: %s" % (msg))
> +                return False
>               except OSError as msg:
>                   self.logger.warning("Failed to initialize qemu monitor socket: %s File: %s" % (msg, msg.filename))
>                   return False
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173661): https://lists.openembedded.org/g/openembedded-core/message/173661
> Mute This Topic: https://lists.openembedded.org/mt/95180018/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

