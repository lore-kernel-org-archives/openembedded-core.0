Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A483CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 07:58:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26694.1778811892162867488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 19:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DNmc3NBb;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=aQv6MZfe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jinwang.li@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpvNl719635
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 02:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7aGAooFeN8PJwlSzWHxDN+wm1duR9t/Y6YXJwTLWhg=; b=DNmc3NBbojzsdUar
	54GNmz2BB0hRGkP9xy3BMYGDZmKJKgVOHFgbjJDINB4DSYxipIakqo3fjylVR8pB
	S/2bm9Yn8tfA66IpP7EhYlhzsL+AgjA00H9UPykqmpOGDEgDasn50a5K4qJOwNAK
	DgOZQeHf9IZSC4w9BraOXOuPjQraGNfIsMceUnsTy8WqDw/0eoVM5Gf58F4cJx2X
	q3Uyw93MSX9ZhggWVEhcPtl5zvG/hNaY/1r7eNEVvBSh2+J9YorOo69zweIRFCBv
	f59nY5Fpyy9ChVNXXpwp2KWRYMxt4FaeWAJ/LnXH8aqQ1CZcy5pBGHN2xbTMRDty
	SUqg9g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1x135w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 02:01:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdd327d970so272529eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778810501; x=1779415301; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7aGAooFeN8PJwlSzWHxDN+wm1duR9t/Y6YXJwTLWhg=;
        b=aQv6MZfetXU8xnINOtRGlWo89sSHxKvGNGRyCw/t1uu3KhGSPyhVobthIOgykbBeOo
         HbyDGk6lAFUSyFE6ca5UjuOx5q0SGFecw6Yx5Q2X0eBkk0sUj9n0dgtUZldLEUNp4UAS
         4tBpg6Z9ixAAU8OwJDjukzlnqg8aW25WL4yeOfavfEtVq540iVgFBA9WMR7UPxj+lmwo
         Io5BhM+/WjBoFSHHPCyqKb3QxvLssAKSZ1AETLdGkslLEWWC1oaUh9TCnwmj7vSDqUCl
         aB6gWkiDn6JH+bmRqw70K+6hapCBpIhoBFlHNCdlkby2gakH8mJ82lnRbj50bt2seHqv
         FGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778810501; x=1779415301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7aGAooFeN8PJwlSzWHxDN+wm1duR9t/Y6YXJwTLWhg=;
        b=cZmh3j6JoT95L29MJA800tcel0GqlIDTxZtzmBrkgne/ZO7qNrcfDxlfZ1CyD7P3w9
         DR5gjs5E2jhi0kSCv/A4wDgTpUUsLy7hhz7X1c/Wxag7VXPAgQ7+tVHCYZilbKv0oQY3
         9flKnKkINBbj465m7PesqalelKryygGBWtZVsEJB0k5Iyd8CblFbRBqECz3B2FLXw7h+
         v0D80mKzOZnmmZFtUb4fRs1J0vDNZqXP5ewcbTZQDBnvuifWEpjKnBp/YOw5whKXJkM7
         60pWU3iHqS0bSz9pnuTOsIdPhiaMj/y1d6XBEJEk/i7wz+dyqs2cYRLzdtuGdOnWywOb
         55pA==
X-Gm-Message-State: AOJu0YxdOn7F/wsn5DgZJIzckNsdg6d/yLnptbpYyOoo8HoVKgT1d2yC
	LQOnBoWbkJzwUV59wN0mDZzmEcTqDNgVUw/v8ByLJLKOq4kNTttu8Vxmx/Pt+uVH87l18XeYolG
	2IJMRnFzlGjhYfpqDKia5AibQQMNZdO3PGmEzLOjUIhrQ0Ufp3PNt+tLYXRxD7sTz23YwGlxVU1
	nr3UuMZ3+bKxG+/ww=
X-Gm-Gg: Acq92OEKUEpK6PWWc+i1tOaRPQv2Y1ZsNM0r3lHOzc+e7dpuTlRoPRkGcUypXVVjH7v
	dA4dpT1oOdJfnzIe1jKHZAY0y7g72ECe7v2Z/CzqzUwYqWw2nqRJh9hn+S1u3uC776gekS+/GC9
	WBgNMOG981wPgtjzGtpWKNbIGNdvLvRsuh8sO3VqERdAd8B6Qnei1Rhz7LlxGRRgUpRQa9m9Xdc
	LJDS018KMUWa78MBbz8ZUlsRAELmUqo3S5vlITDeaeK0aEUEEJlFM6/fdaILO60oZGWFhERINDp
	j7KM2jwZARypPIwMQ+vhD5JFYu/8ev/WXt0GMGDoJXUgXnVbHCZ43A80HMJxnq1Oe/B7hbv6gDi
	UoCfeMsOjnRheC+iAksOBVnPLzxeArxuAzYHxuW02lWc=
X-Received: by 2002:a05:7300:dc8d:b0:2d9:1c9d:fc22 with SMTP id 5a478bee46e88-3026302f90fmr3557531eec.21.1778810500759;
        Thu, 14 May 2026 19:01:40 -0700 (PDT)
X-Received: by 2002:a05:7300:dc8d:b0:2d9:1c9d:fc22 with SMTP id 5a478bee46e88-3026302f90fmr3557509eec.21.1778810500020;
        Thu, 14 May 2026 19:01:40 -0700 (PDT)
Received: from [10.239.97.100] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea78sm5356501eec.6.2026.05.14.19.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 19:01:39 -0700 (PDT)
Message-ID: <8466c150-c7d4-4146-95de-06171c3f8c9f@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:01:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bluez5: add patches to fix 8.56 gatt issue
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260514120028.1765275-1-jinwang.li@oss.qualcomm.com>
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
In-Reply-To: <20260514120028.1765275-1-jinwang.li@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAxNyBTYWx0ZWRfX7QNqNb3GZAhe
 pGZjRo89Kwp9fedFxRp7CVMYbFGXDvTAfnFzP6qoe4j4gsqbPW9XEE959tClFAB/gCtBx7Tcarj
 S8DxsV2DryQK3WYesuMSBDpZLzJ2HTdINBQZPX8rEE7L34EofImhS+ZmRw6wAtryhJ8dZpiKRGg
 8UjCq/5AElAtUtl19I9oWKOVYi/m6DsXcIJ8e5WLX0J9Foox2Mu4sjwqrdhPogDXdIdlxciDYJH
 xJT7dwCplkYkqet2ISBeePU6ch/f5jlPpgtnEFY9HHQzcQWGMLyVbu2jIuGLSMPbNVPEatIdEKL
 GiC31puKwpRgWJzkNhh5Y+yovJvowP20Kd37qpKCDlpRIzhetHglQgS3UyyCaxE5gUm7GDIX5RH
 DhZB1+VDNi7E9YZSt9zUAzRu6nRCEko/a17mAo6aFTGv2S+2ri4DGv1WrEtblVk7uhcREbZ9+O0
 JLmGSpGYVhJBQEPFRcw==
X-Proofpoint-GUID: qD_sp57ZZORbZzIZ5gF_UvsoYsKyhADm
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a067e85 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=g5274Ok1GKLsrKzMD-IA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: qD_sp57ZZORbZzIZ5gF_UvsoYsKyhADm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150017
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 07:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237068



On 5/14/2026 8:00 PM, Jinwang Li wrote:
> btd_gatt_client_service_removed() can be called reentrantly via
> bt_gatt_client_unref() after the services queue has already been freed,
> resulting in a use-after-free.
> 
> Reset client->ready to false before destroying the services queue to
> prevent reentrant calls from dereferencing freed memory.
> 
> Upstream-Status: Backport [bluez/bluez@d01616f]
> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>

This change is intended for the wrynose branch.

> ---
>   meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>   ...use-after-free-caused-by-reentrant-c.patch | 59 +++++++++++++++++++
>   2 files changed, 60 insertions(+)
>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch
> 
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 843e36b..c792cc9 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -70,6 +70,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>              file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
>              file://0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch \
>              file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
> +           file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
>              "
>   S = "${UNPACKDIR}/bluez-${PV}"
>   
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch
> new file mode 100644
> index 0000000..0fcbc08
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch
> @@ -0,0 +1,59 @@
> +From 45c167591d04e2dfecf5b4642168e54c23abbd40 Mon Sep 17 00:00:00 2001
> +From: Jinwang Li <jinwang.li@oss.qualcomm.com>
> +Date: Sun, 26 Apr 2026 21:25:15 +0800
> +Subject: [PATCH 2/2] gatt-client: Fix use-after-free caused by reentrant
> + client teardown
> +
> +btd_gatt_client_service_removed() can be called reentrantly via
> +bt_gatt_client_unref() after the services queue has already been freed,
> +resulting in a use-after-free.
> +
> +Reset client->ready to false before destroying the services queue to
> +prevent reentrant calls from dereferencing freed memory.
> +
> +This was found with the following backtrace:
> +
> +    #0  match_service_handle ()
> +    #1  queue_remove_if ()
> +    #2  queue_remove_all ()
> +    #3  btd_gatt_client_service_removed ()
> +    #4  gatt_service_removed ()
> +    #5  handle_notify ()
> +    #6  queue_foreach ()
> +    #7  notify_service_changed ()
> +    #8  gatt_db_service_destroy ()
> +    #9  queue_remove_all ()
> +    #10 gatt_db_clear_range ()
> +    #11 service_changed_failure ()
> +    #12 discovery_op_unref ()
> +    #13 bt_gatt_request_unref ()
> +    #14 bt_gatt_client_cancel_all ()
> +    #15 bt_gatt_client_free ()
> +    #16 bt_gatt_client_unref ()
> +    #17 bt_gatt_client_free ()
> +    #18 bt_gatt_client_unref ()
> +    #19 btd_gatt_client_destroy ()
> +    #20 device_free ()
> +
> +Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> +Upstream-Status: Backport [commit d01616f0c276a441dad8afe4e8f7bb261b26ba0a]
> +---
> + src/gatt-client.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/gatt-client.c b/src/gatt-client.c
> +index 374e67c..3baf95c 100644
> +--- a/src/gatt-client.c
> ++++ b/src/gatt-client.c
> +@@ -2261,6 +2261,8 @@ void btd_gatt_client_destroy(struct btd_gatt_client *client)
> + 	if (!client)
> + 		return;
> +
> ++	client->ready = false;
> ++
> + 	queue_destroy(client->services, unregister_service);
> + 	queue_destroy(client->all_notify_clients, NULL);
> + 	queue_destroy(client->ios, NULL);
> +--
> +2.34.1
> +


