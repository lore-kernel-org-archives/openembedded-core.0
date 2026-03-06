Return-Path: <mohammad.rafi.shaik@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0ACBFCB61B
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:52:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72126.1772812329381520362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EOe2c5px;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Zf4g5Ovh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fph2D2004797
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Mar 2026 15:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDqE2bg+IOFP4ku1BBJ7HEw/tplET3t6wCC9FVzyMrA=; b=EOe2c5pxRu7oU7Ds
	A+gv1qCjyDVzQ4p4rrt8vAphOLF5+mF9mykCkDZ9aTXV6NjBDZmC3NhbYGNDgZNf
	iTAywLdyBp0WM+d6BS8MWIzoj0SpvDbK/LWvtJvStijvXzlo/989TuI/pqZo+Csu
	6Botf3QLtKJ5F4/FPOxvqdRhw6iXlH9hXKommkE9eSThVuBhyeVrIykRy9BwTfrI
	O9bieDnRoYKE8VS6seJxXGhsxQPPui6SWbT1/sr9XkY9ikOXzQbyZkAXW//UOd0j
	8LOGNzd+TfxQ0tiOwaSVIuS/UNMOFB2QSy+rmD2cOPk1pawgkWmr2kaoeMf5/P6f
	hgZwbg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ah6sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 15:52:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8299c57642cso5076777b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812327; x=1773417127; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDqE2bg+IOFP4ku1BBJ7HEw/tplET3t6wCC9FVzyMrA=;
        b=Zf4g5OvhQwViVSwojDbR3RNP2rLgqlpnTOJ/+r3CwywwKpZzde1PckIxYxkp+LqC27
         WY5lWYIzaKlGFeShZnYRJMspj5MD3Rj4obPmftv+yoSnXSVOa5HnOCejMtXq+xgvBvNC
         5N2ZaD0K/+eZZelEGXuK0ciB++hxpTHQl58BLEJs+58PIbYc2hjO64TXl4oLi5YuVYwr
         /40lT7bQ1Sxuo1zFZGE9QJi4v5qy4+/PapJCaYi/ooBCKyaVul3hQtKIBW5/qy4QLFNS
         /YoRm+6lb06/bh/D9eZiKCgT29JG1+c7eM9ydjT8C+pqvNs3MZrPWRWz+BS9iTNKTDW+
         S21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812327; x=1773417127;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDqE2bg+IOFP4ku1BBJ7HEw/tplET3t6wCC9FVzyMrA=;
        b=NoPEoYAQd9KE8hjC0Sz4EVJ7GE+AJ1+ojFblw7GsAvVn/6EeYu0tbqxLyKTv8iohm3
         riWjfHpY1KfKg//dM+lyo2enYbMMiUF8L6QBY9vGhxGJqUYO0XlE4ITshBqMiuuGeLR/
         aLF/6NnwCkHMTT4z82L38qJeIl8MtpDWD3vUhbKsvtwLDswkD8ourMbjPF4JFZMghMEU
         vWqoGsC67wna7Pe1UHNmrRT/YeW36JT4O8lkGkODj/tbeYU0zOR+x4cJ1NnrRK+JVmhr
         XNCPt2QrPtEhc6aFm0grkPcUmA6tv4ifuFRUV7BjWrgFNowDB7rhLUyuoJ8abJXQLF7S
         CJGg==
X-Gm-Message-State: AOJu0Yx95NbJ3Ouxz6MMZGx6BE0Und1uXe9LqniOzyHpZsjqLw+yu4pI
	xJlT4fqTVSM8Sza3MDgzKvk0KC38UUaYNwqowLowLJQI/n2Wi9u2OD9DMKVe3jQMmg4s537bpfP
	aexCx08qDQ3fCMA3CWeS8uJRUHnt2DqfAKa5eqQUcm+2I5xxW6zQtDI7+6TdEICvK8ghZxuWCtl
	kvzJhL2bF8NFMzGtA=
X-Gm-Gg: ATEYQzwiP8Tp0GgQEXoMBn4uVddrqbMmF+FwZC3n0s8/bD6TIbg2js6g1/AWfVyAYQc
	hny3oXTC7cQ3+fH5OiAVbJm44IsBvUHRwR49DbX2Cj/AYwUdn+aKBoqRU1DR5cOYQkXzVh8eQNk
	74wRc8H2oew3QlrHOqrzQnPRps5uoKx8ZvrVErQolyb+Pfxv/9lO2Ccd34T6a51m+OSYFARI/ex
	AM+ejN3mylBPO9DY3YUjWjlmlDJ1MRciHNG8HA3V/sk8YytdnvvQSqOx8AXsirtoopjYYj4SacJ
	3wbGrAfz2gkk490nvhiA4vzZy5KyiXVcWsmMuz9lkVEWwVumgidDc4qJdYvs13GERZwz8YlSgwT
	Ko/RRNDsF390rYqgtNUyjRh0u+q2LvxGY+4mLKU/aVUhEkQQ6Yvz0Jxify/Fz
X-Received: by 2002:a05:6a00:ae0c:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-829a2f6f3a3mr1865954b3a.50.1772812326834;
        Fri, 06 Mar 2026 07:52:06 -0800 (PST)
X-Received: by 2002:a05:6a00:ae0c:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-829a2f6f3a3mr1865934b3a.50.1772812326167;
        Fri, 06 Mar 2026 07:52:06 -0800 (PST)
Received: from [192.168.1.5] ([122.175.110.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d372esm2188938b3a.61.2026.03.06.07.52.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 07:52:05 -0800 (PST)
Message-ID: <73b3908f-6249-469e-875d-f15589ddf425@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 21:22:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core v1] alsa-ucm-conf: Backport the channel fix Qualcomm
 lemans and monaco boards
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
References: <20260306060139.3642888-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260306060139.3642888-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TuxECXr5SnjsHNozcGE5dfczegzgjSl9
X-Proofpoint-ORIG-GUID: TuxECXr5SnjsHNozcGE5dfczegzgjSl9
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69aaf828 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=kEcnu3wEAd4ym9W5l1AmfA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=foHCeV_ZAAAA:8 a=EUspDBNiAAAA:8 a=62-ws019K3vVuyyPPT8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=h8a9FgHX5U4dIE3jaWyr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NyBTYWx0ZWRfXzxbVfurGNsdv
 EhjwUz9/WqB538zlDpfrU4Etm8FizHaJt2tPGUZkrwqxc6vW+1UU7FpXpaIrQnje9y9SQOqQ8cq
 Y1j0pT5OXUDWmmyfhlzMJ69SzSk538jArYjJF137enUg8IF2fXJbZa+m5/kXeQB4oIQIGG75RJ4
 N+O8/THi0VCP3WfPYkTeresolYajMBXfFQ/P4r7AranpM8f8sp2qHEYZ+p5FRUP4xmmEfBpE+WL
 pd52hE9zLOSG35lL9HZ/eTrGwZ27ch8UlWQpyRzNjL2oWBjtmngqiAR6h4IuK5jDcGlfHL5b9D7
 OUtV0r6pjT0F4hV1mynMpHNJLyb4wy/AX9HSKGYzwSkcTYno80tmMwuTmaOWdmHhB2+J/Xjz3FB
 XyHB+F/O4rKocLdq/FppmVBxVvAVaOzr4DVXXJQCUuDR6YIeN5SveotL2E74Gcf4V1yZB6YkJ7B
 p9y+d6iYYPvrn3RVBag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 15:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232580



On 3/6/2026 11:31 AM, Mohammad Rafi Shaik wrote:
> Remove Fixed channel setting for Qualcomm lemans and monaco boards to support
> stereo capture.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Please ignore this patch, subject Prefix not proper.

Best Regards,
Rafi.

> ---
>   ...8775p-Remove-Fixed-channel-setting-f.patch | 32 +++++++++++++++++++
>   ...s8300-Remove-Fixed-channel-setting-f.patch | 32 +++++++++++++++++++
>   .../alsa/alsa-ucm-conf_1.2.15.3.bb            |  2 ++
>   3 files changed, 66 insertions(+)
>   create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
>   create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch
> 
> diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
> new file mode 100644
> index 0000000000..6ebc4f04c2
> --- /dev/null
> +++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch
> @@ -0,0 +1,32 @@
> +From ba4126955f3e145d3a70171b5e8a23aafa157052 Mon Sep 17 00:00:00 2001
> +From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> +Date: Fri, 23 Jan 2026 15:26:17 +0530
> +Subject: [PATCH 01/02] ucm2: Qualcomm: sa8775p: Remove Fixed channel setting
> + for lemans-evk
> +
> +Remove Fixed channel setting for lemans-evk to support stereo
> +capture.
> +
> +Upstream-Status: Backport
> +[https://github.com/alsa-project/alsa-ucm-conf/commit/ba4126955f3e145d3a70171b5e8a23aafa157052]
> +Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/694
> +Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> +Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> +---
> + ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf b/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
> +index 5915d1c..f2be928 100644
> +--- a/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
> ++++ b/ucm2/Qualcomm/sa8775p/lemans-evk/HiFi.conf
> +@@ -25,6 +25,5 @@ SectionDevice."Mic" {
> + 	Value {
> + 		CapturePriority 100
> + 		CapturePCM "hw:${CardId},1"
> +-		CaptureChannels 1
> + 	}
> + }
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch
> new file mode 100644
> index 0000000000..db561cdd55
> --- /dev/null
> +++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch
> @@ -0,0 +1,32 @@
> +From 5c7b40c96b6cefd4d1d545d89b6d030248f0bb1c Mon Sep 17 00:00:00 2001
> +From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> +Date: Fri, 23 Jan 2026 15:31:34 +0530
> +Subject: [PATCH 02/02] ucm2: Qualcomm: qcs8300: Remove Fixed channel setting
> + for monaco-evk
> +
> +Remove Fixed channel setting for monaco-evk to support stereo
> +capture.
> +
> +Upstream-Status: Backport
> +[https://github.com/alsa-project/alsa-ucm-conf/commit/5c7b40c96b6cefd4d1d545d89b6d030248f0bb1c]
> +Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/694
> +Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> +Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> +---
> + ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf b/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
> +index 8345129..b60a310 100644
> +--- a/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
> ++++ b/ucm2/Qualcomm/qcs8300/monaco-evk/HiFi.conf
> +@@ -25,6 +25,5 @@ SectionDevice."Mic" {
> + 	Value {
> + 		CapturePriority 100
> + 		CapturePCM "hw:${CardId},1"
> +-		CaptureChannels 1
> + 	}
> + }
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
> index 0ac51b6c5d..1fbf7b8c03 100644
> --- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
> @@ -8,6 +8,8 @@ LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
>   
>   SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
> +SRC_URI += "file://0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch"
> +SRC_URI += "file://0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch"
>   SRC_URI[sha256sum] = "9f79e813c08fc86cfa46dd75c4fcda1a4a51b482db2607e1fcfaafb92f588a31"
>   # Something went wrong at upstream tarballing
>   


