Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1D4D715F7
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 20:32:28 +0000 (UTC)
Received: from panther.cherry.relay.mailchannels.net (panther.cherry.relay.mailchannels.net [23.83.223.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26732.1769286742981497941
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jan 2026 12:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=Yn342NfX;
 spf=pass (domain: rootcommit.com, ip: 23.83.223.141, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 4AAFB9228D6;
	Sat, 24 Jan 2026 20:32:22 +0000 (UTC)
Received: from fr-int-smtpout22.hostinger.io (100-116-17-167.trex-nlb.outbound.svc.cluster.local [100.116.17.167])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 689BC92289F;
	Sat, 24 Jan 2026 20:32:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1769286741;
	b=gJcKY1CV4t+2f7Ifx0KL18XeJgqTjdzbtFLsaQ8EkCGAZ7JrZhGLEpqN7+oFg5PRqtUZO0
	uU7mapllokZHDt9eYA9aGJ822itISXx9gC3IhHsS3jIMjMdtld3o2DQF7iY4XR6ZvcZ1yS
	i7xIbb1MzoozJdOiybhdHWGLzxJ0bUmUmB0CoA5dL/eOelyKU64ze2hoAu4Ib3DSvI4XRG
	UDZS/L/XRXXElti7/fRTcuo//tFh2+opiS+UYLmU58Lgvv6OhP9t9ypN5lmDDmzjt6r7UR
	GMNRE7DwFrGOSq3hWyzir8eI+xGU3XOpw3Lh+Y0dssSvRIEw0/eSoXV+ikKNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1769286741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=q9ohn7Sj+anXgMxji6TRPv+9xCGxHysml/W8wQr+VVY=;
	b=PEVAlWzS83FfqijVZLkwYtsbVpBcdrkaVbWlDEdpBJCW5bfR7YZbOprEGQFQlV+Ij2Borr
	p2Y5QQVIAC+UL16b+Foqc1JeOAzDSMWkw/urijX+Vyb6GRNJUGpHli/s0/hcf+i4QEiPES
	jxmeJIuGfdgRsenZhS4WfS3H8h5K4p4YAn5GURpRRlyT1eXxhUiM2vMV3bfgtCZY2g1qzK
	YAG6WM3wqmZE67h09aj18+paG6cHwDaqxn5456D42YgDdBsWHU0rlH1HrayP0r3AKmaibS
	ZROaB3Slr6BWU7kGxpLUjX1CD7PMYia6JKu/uXsoJqeJPkBPe/Zv1MgRaa+Mcg==
ARC-Authentication-Results: i=1;
	rspamd-5cbb8c6dcc-ptrj9;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Army-Average: 25855d061a416053_1769286742089_4249793265
X-MC-Loop-Signature: 1769286742088:3738505077
X-MC-Ingress-Time: 1769286742088
Received: from fr-int-smtpout22.hostinger.io (fr-int-smtpout22.hostinger.io
 [148.222.54.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.116.17.167 (trex/7.1.3);
	Sat, 24 Jan 2026 20:32:22 +0000
Received: from [IPV6:2001:861:4450:d360:a02d:502d:b853:da37] (unknown [IPv6:2001:861:4450:d360:a02d:502d:b853:da37])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dz60Y5Y0sz10C6;
	Sat, 24 Jan 2026 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1769286718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9ohn7Sj+anXgMxji6TRPv+9xCGxHysml/W8wQr+VVY=;
	b=Yn342NfXBvCYaO5vZLDGH2QG8Pu9ZnK0FynaCSjQHnFtD3OeahtdwHW6PiMiD+tAQhseV7
	Fh0GipacfYxZcExZGi5yg2b9ztPSq0CFidXvK7N57GGfdyo2v2CqH+z1cxpKdKUhx7zqwb
	Ui8zv4ys1J04LvIdAozL83dW8vBohEr6B2IVu7uB90qyzZoivIio5oZIC1NOl/rywVxxbC
	5tLlTsHL3gp+nUPoXSeR194E4Sj44+ATN9v33G4sVH+nvs9sUAHCCrMSFwTIzWEsy3qfNj
	BHo5koBWS2Zh9o5jyeHwDYGfN4a9axfHDs0GC77M7ZQky1N9TG4DPJXYoPtN4A==
Message-ID: <627f5762-8542-4214-8efa-db30ffc3cf59@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [OE-core] [PATCH 2/5] alsa-ucm-conf: upgrade 1.2.15.2 -> 1.2.15.3
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
References: <20260122090513.888-1-wangmy@fujitsu.com>
 <20260122090513.888-2-wangmy@fujitsu.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260122090513.888-2-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Date: Sat, 24 Jan 2026 20:31:57 +0000 (UTC)
X-CM-Envelope: MS4xfDg0bWN7ekqe5VueLxmC/DAkjUvF8K3/ImC7iJPAN4RshF+VYmV1C0b4RgBgPb+8jNeaSDLrJTvQIzDjSbgfwaxdklmYCZGWcv1WLwGwP6abkyUEUXL7 5FUpWm3XlyVxPzDookhPHoU0F2x/UW5W+qczwTpLL47ddaIj8xLp81BNRa5IEZdCx50lUQFJB49oqJFaptqKt9OhWgRzgAdq0k/F0beTpiPJ84A9V6UyTjBf Vc4tbEMzbldIyJ4uH97xHz5aYkI+YOhaLxE3QW/IdVv6RBBAsOzSeMEz43z7lIeYerRs/IN90b6ZO//LLIPRXJ7ShUz38FZzUcFyWdYWF0+/p6oZcf44R0lE r11ZWa+WvYV8BD3jhQ+y4D2LsPF3Cdc1NO5MG3xBqSJ9/j6PfdmSyznvfmGUjiIwjnbEZ4LZ
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=69752c3e a=+g6tKCGzLSkO/Q+yF6g+4A==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8 a=80H4x1XVtQDe-zSli-EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jan 2026 20:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229922

Hi Wang

Thanks for the patch!

On 1/22/26 10:05 AM, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

This is good, but next time, you should include a reference to upstream=20
package changes, here:

 =C2=A0 https://www.alsa-project.org/wiki/Changes_v1.2.15.2_v1.2.15.3

... as recommend by Auto Upgrade Helper.

Reviewed-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

--=20
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


