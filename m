Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A63CCF9E3
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 21:14:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.520.1761858880107388734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 14:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3B65D40C83;
	Thu, 30 Oct 2025 21:14:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbF5hVrgOgMa; Thu, 30 Oct 2025 21:14:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 173F340B13;
	Thu, 30 Oct 2025 21:14:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2AFE516F0CF; Thu, 30 Oct 2025 17:14:37 -0400 (EDT)
Date: Thu, 30 Oct 2025 17:14:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: michael.haener@siemens.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [scarthgap][PATCH] oeqa/runtime/ping: don't bother
 trying to ping localhost
Message-ID: <20251030211437.GI3125@denix.org>
References: <20251015204131.14992-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015204131.14992-1-michael.haener@siemens.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 21:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225519

On Wed, Oct 15, 2025 at 10:41:31PM +0200, Michael Haener via lists.openembedded.org wrote:
> If SLIRP is being used instead of TAP for networking to the guest then
> the target IP will be localhost.  There's no point in pinging localhost
> to see if the target is up but whilst you'd think it is harmless, in
> some containers ping doesn't actually have enough rights to work:
> 
>   ping: socktype: SOCK_RAW
>   ping: socket: Operation not permitted
>   ping: => missing cap_net_raw+p capability or setuid?
> 
> Look at the target address and if it's localhost or 127.0.0.* return
> immediately.
> 
> (Backport from OE-Core rev: a06ef43d2a50e16c32bd6edbdc7b32c3528687d5)
> 
> Signed-off-by: Michael Haener <michael.haener@siemens.com>
> ---
>  meta/lib/oeqa/runtime/cases/ping.py | 7 +++++++
>  test                                | 0
>  2 files changed, 7 insertions(+)
>  create mode 100644 test
> 
> diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
> index f72460e7f3..bc543f6c41 100644
> --- a/meta/lib/oeqa/runtime/cases/ping.py
> +++ b/meta/lib/oeqa/runtime/cases/ping.py
> @@ -18,6 +18,13 @@ class PingTest(OERuntimeTestCase):
>          output = ''
>          count = 0
>          self.assertNotEqual(len(self.target.ip), 0, msg="No target IP address set")
> +
> +        # If the target IP is localhost (because user-space networking is being used),
> +        # then there's no point in pinging it.
> +        if self.target.ip.startswith("127.0.0.") or self.target.ip in ("localhost", "::1"):
> +            print("runtime/ping: localhost detected, not pinging")
> +            return
> +
>          try:
>              while count < 5:
>                  cmd = 'ping -c 1 %s' % self.target.ip
> diff --git a/test b/test
> new file mode 100644
> index 0000000000..e69de29bb2

Should there be an empty "test" file in the root directory of OE-Core?

-- 
Denys

