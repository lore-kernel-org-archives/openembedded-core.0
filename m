Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7622D715F8
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 20:33:27 +0000 (UTC)
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26753.1769286804778485330
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jan 2026 12:33:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=cBt9Awry;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.246, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 46D6F92167D;
	Sat, 24 Jan 2026 20:33:24 +0000 (UTC)
Received: from de-fra-smtpout9.hostinger.io (trex-green-5.trex.outbound.svc.cluster.local [100.116.80.177])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 70B53920BA5;
	Sat, 24 Jan 2026 20:33:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1769286803;
	b=pV84t79zAUJj4kE7bvrV5JunzPzYwZ4wXANWEw8jlkTpg+koBjwTYQcMgNnhM9UsC67KsW
	a9zuLRex86igofpjTATNfFRI1iRggKgsgBzrkOs7v2v765vA9Tyo+73Tc16Gq+Y4hjrXPS
	//eRC7BH6RsPswIGF9Jf/AhPz1RDkwqnNZwd4EgXc1u8KDDxStPPwEck73RSVQ7KdM/axg
	hqHlxb+K/+6WKxRDSyA1DfXzvyVtdrAAZvGuFuBk2QFCluw/2PfDZcP+EflDaUC1haeSdI
	buMa61UJ+TwLxLiWDV+e9JMY0Z2nxLGepCANVQsbZg3SxG/9GG0WSX1VahMEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1769286803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=mgpB3SdsDWUHd4rQMOgRbPUav8GqQET3mfgMJb2PMbs=;
	b=9LuM/zB9QZIv6iTPN5rUt6dAKnnGvC9wAaDWbTYE9jRdGOr8A3SREmRkTZ4JZfuoIzAHKy
	XFJPjqi4NFhWnl37PhMuk8r9HtD8oksqdwCEslu0093Zn//aZ9MMmz2LcWrlds0vQQcTRR
	bMlIPg2YuVvzglaflfRSaeuoKhrchORzSjwZTekGvtefaiJA2d3JdXuDFjRDbr7NdTFlHo
	Dj5mAZNVDmae+idYcLUPVsEYPinxJTLO6aO/lPWiXP8lkhgPVOo4ipv1PigArwJguIreR1
	P973GtEy4m+wBgetyvYDiRVlyY3I8MvXIvwtZ2TeWCvTnUyM0jE6Z7lR4OnOGw==
ARC-Authentication-Results: i=1;
	rspamd-5cbb8c6dcc-9czcm;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Glossy-Zesty: 6e1c65f86b72af33_1769286804166_267794600
X-MC-Loop-Signature: 1769286804165:3524861971
X-MC-Ingress-Time: 1769286804165
Received: from de-fra-smtpout9.hostinger.io (de-fra-smtpout9.hostinger.io
 [148.222.55.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.116.80.177 (trex/7.1.3);
	Sat, 24 Jan 2026 20:33:24 +0000
Received: from [IPV6:2001:861:4450:d360:a02d:502d:b853:da37] (unknown [IPv6:2001:861:4450:d360:a02d:502d:b853:da37])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dz6292cYqz3xF5;
	Sat, 24 Jan 2026 20:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1769286801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgpB3SdsDWUHd4rQMOgRbPUav8GqQET3mfgMJb2PMbs=;
	b=cBt9AwryY+nSBD5CzTW7oubMTabFyGCjOi6kUba96yHcle/O1RRooWI0FBSsJIizzjj8dg
	tcXYBsmFdFHupGKjK4WXJ+wfJaWHLVx08wNG2MiYaOBxrqXXBGlCfEHZ0bhELi0Dqlbjrb
	gXbOexysvRJVaSvN1y0tOluTSo2z5zEGUubr+13E2TMjp2UN3s4LMK8iExeQLBvVLfIvAD
	rwMgHyvN8U3QQwnXzIM0OkW6uRK512oG3b7y9yqpSruxYvL48HaXWZkIh+qxUOJL8awFtQ
	GDs7dzPCQHRq/Oq4UVsB5F7xIxQ7077TdCuVSGU9splBckRRQs4X2VQGpFp+GA==
Message-ID: <0c3c18a3-c3af-4458-a843-2041ffc6650e@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [OE-core] [PATCH 1/5] alsa-lib: upgrade 1.2.15.2 -> 1.2.15.3
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
References: <20260122090513.888-1-wangmy@fujitsu.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260122090513.888-1-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 24 Jan 2026 20:33:21 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=69752c91 a=+g6tKCGzLSkO/Q+yF6g+4A==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8 a=PZZK4-DerkTEqitZnKAA:9 a=QEXdDO2ut3YA:10 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-CM-Envelope: MS4xfNMqe1KT8WVTiXcg3rs3Z2rtv63VnvFaJbLZczLPz+2s39fmMvVFTp6oqvKzpX5FH8FP3Qpgg7zqdU7sw8slPkhIcnPL/cUuGDSM4SJW2PfWim2H+RVO XLhXZwQ8ji7+3T9BLG2WG3rbQfTWUCQXtrHAJyAvSchRTZ6JNvmEN9SRSpltEHkpl19Bk6PBdUjl5Urm5nmq+0hRkDeiGFmFmK785aETjQTW3+w7un1SX5k4 x7XpvqXbvIDYl4JejpzLc1V+AOVzbXy2TmDaZhcEdvrAHQd6I/0oFzt3ed/IOXj+k100t1gsWewK5b2EaMgB4VuBp1W34yUHO7tV4SJWmXpQY9n9FIKacsXM rawmc3C7OO6Lik/LKVxQ7mN3t/CZ+mVuJEIVhIVA5KlvJf6MPqf2KdxMbXL37xQKo/v9SQdI
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jan 2026 20:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229923

Hi Wang

Thanks for this second patch,

On 1/22/26 10:05 AM, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Here again, you should mention the upstream changes:
https://www.alsa-project.org/wiki/Changes_v1.2.15.2_v1.2.15.3

Reviewed-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cheers
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


