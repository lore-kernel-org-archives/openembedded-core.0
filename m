Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E820C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 13:04:15 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35586.1787835848660100395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 06:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=T3bWgIkK;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Iy+NmP/0;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 86B9DEC022B;
	Thu, 27 Aug 2026 09:04:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 27 Aug 2026 09:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787835847;
	 x=1787922247; bh=gtAffwj2/7uKfB01uk/jbH+wdWAOA+n1S33uZaw63sc=; b=
	T3bWgIkKfBcRjlgs/RAq7Fs4B4aC7gxs0fFHOEYsZiOx8nWvm4mW3Zuag70o/UB4
	2A19CFN2q7LIzQOxCA55qnQTsw0k5HKDLyHP0RXyqyBIM9gGk6GCwgvYYuAJM4gC
	k3XC+vQkxvpmKN45RkOec6ch8gQD5TqygZuB63bcADCNy93+YRYF8EOmTDnJlVWC
	PvSreRbjPApivIFarEGNInaHOxgS9DC9oFkDNtHFNW0u7OYiSJgW9L0sv88XZnB/
	1UsPFqJaeTJYbXrLEyMvelAHASsaJi1lFo7fs3/eiYkNdFDxNykhCArIQ8AgBRrn
	UmW0I9gsiJKgzSQ/w+dnAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787835847; x=1787922247; bh=g
	tAffwj2/7uKfB01uk/jbH+wdWAOA+n1S33uZaw63sc=; b=Iy+NmP/0+zL9qzF3g
	Kg01owEiW+uYCQSAbkEIyQ8GNmHNoMDiSnMN4jNggROjDgXNLwvawMsApZDcMG4H
	odoDnnGhK/HOpjm4YHPjDQ96Y5xGcrTWsgP8ztBmF7wO/HnMLyMvInerY09Ahihj
	fJulV1v9KJ+Dx+ygWvgS7DPYpAwVpiSg1Rcu3qWMtztsWrUm/F6f2EH+L9VfjKKS
	EY0D1o7LCyANDrD3xCE3JLRIXG9Dt3j9G4Z0ozqEI522VojlDjmO5aab1nOx6lKa
	EFsmopR2LgN0gXDps2YBK0KvmcqzKi9aNeYbFKizyjMUTzXV86kfhDU/M7gOP+hG
	Iil0g==
X-ME-Sender: <xms:xzWQavZoFZVYpGRKsir1O46rzyguozAbG7OPz9Uywtj_E-B9YithOQ>
    <xme:xzWQasX9DPVy99TwH5XrwZAupyTzwYnyLp81LhiAqx70ag0jqGuoMGYXB37dtk5T_
    2ws47JTGyALqgxuo7lFm1ZmadxppULvzw9Yad8QFOCVMMnB2UdoIHs>
X-ME-Received: <xmr:xzWQapiI6bOJmqSYatiloI10iL_L0OffN12v3gXjMlXdmzZNyMPuqjrgB96VxfV477n117wSs-5X5Q8AHsSfyekGY_CG3EtTpv7ki2Y>
X-ME-Proxy-Cause: dmFkZTEOwiqBulqbB1tCZlROg2OtgTZOyoqa+9kpxU5p5+TNHsmL50QLQ3689DPurzI6X+
    Alk8QYsD6Hjba1yI2pprwKh/MuHQaNBjIMmhzZnHwFASQf+ZLYgavldjxEhfmYWV2WR5UL
    IYiXzm0QkiK2MDVmrqqhcbf9NznSYUfibTFyfhYHndTkhHI9JcIQtGuYadsNQPi01pxxJs
    AVZlbZY6lMQsLd52YzVeQB+ZY80szRkUcL9H4KtMdrA5cQz91AGwApyjnTBNqK8o1Ye+MH
    fmcWFQQjKfrBtafzlGs1y8SZlcAj0kfZsBdGpt7pbh/rR7dm9x6m75rRqmteUQRsWmrXku
    LbiE8gxZIpvi0W0OSAVT9XpzajcgprA97JvL397iJFAsb0PddlfJxt6vpk0Yq5ggZZ2g4i
    usLPpALL7ZAZpifyMAn9FQgsw9FGUwZY1msM1u+lrgIXpe5Kscc1Pj86MDefHY5irtthJV
    Zbod9TorJv/Os16EngWIL2dhSkzDdmMWBImmOr7rbz7aUNGfhBJAEgD471TFSRr9YiXALf
    wUoTDaw8c3ggXhBoz+eqVVZv4ZNJC/B+S3N46QX+R2/TWysyuQ+cXGER3iZhqDvTTIbIRb
    5hYdSPw47T4LvvZ1USq3/tHBFCTafXL2H7Rw2t+phZgC9LVuhluyXU+LLdlw
X-ME-Proxy: <xmx:xzWQaiWk38RWV1UP3kGU0x3yfi8t-44CxMbVys43ox_7cOYqRrBsLg>
    <xmx:xzWQaoPUYgT4Ed2Br-42sqpwsxoUtQVtyb94oJU-FpnmmC43yBuVVg>
    <xmx:xzWQamYlmN0CsDrTGfj2eutjS5FDhogr8y-SMEM-lgnb6dH8CH5XTg>
    <xmx:xzWQasqY5y3fvEMjxdZwDCzogHOuwaUjW1b2111tbF7l7vsRD_oOtQ>
    <xmx:xzWQalfate-D6SlaJGg9z71FRbKAoQKsTCAhsu7Q83SSrwTxdoG939QF>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 09:04:06 -0400 (EDT)
Message-ID: <be4ca49544e914642e9e4824f2cbd001d42535b0.camel@pbarker.dev>
Subject: Re: [PATCH] initramfs-framework: support LABEL with root-only udev
 trigger
From: Paul Barker <paul@pbarker.dev>
To: Wenwen Fu <wenwfu@qti.qualcomm.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2026 14:04:05 +0100
In-Reply-To: <20260826092522.1618546-1-wenwfu@qti.qualcomm.com>
References: <20260826092522.1618546-1-wenwfu@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 13:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244487

On Wed, 2026-08-26 at 17:25 +0800, Wenwen Fu wrote:
> Filesystem labels are not available in kernel uevents. Enable the
> BusyBox findfs applet and use it to resolve root=3DLABEL=3D to a device.
> Read the kernel-provided PARTUUID from sysfs and trigger only that
> partition. Fall back to the full trigger when the label cannot be
> resolved safely.
>=20
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---
>  meta/recipes-core/busybox/busybox/defconfig          |  2 +-
>  .../initrdscripts/initramfs-framework/udev           | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-c=
ore/busybox/busybox/defconfig
> index 1f4b5e3d1e..a282370a8f 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -634,7 +634,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=3Dy
>  # CONFIG_FEATURE_OSF_LABEL is not set
>  # CONFIG_FEATURE_GPT_LABEL is not set
>  # CONFIG_FEATURE_FDISK_ADVANCED is not set
> -# CONFIG_FINDFS is not set
> +CONFIG_FINDFS=3Dy

Does this really need enabling in the defconfig, i.e. for all users? We
try to keep the default busybox configuration small.

Best regards,

--=20
Paul Barker


