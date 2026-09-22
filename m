Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D25C982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 12:17:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8672.1790079419883680156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 05:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KVbE8gJF;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EyNA5bfO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBQ06B2870508
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 12:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ElUj7GHgbC3Jnx4+jMPtrWNT
	9qdGVGYkNZk/GTyr4fM=; b=KVbE8gJFwPEyUXpbOF0IDOjz37/wBYcgHnByF20Y
	5IyNwyxoGyDSApboSSJCI01xWQzycEojP6KGJntDn5kDZiTVDebi33bbhxXgSfEO
	BOyQoEPtriOUk7EDKmME8hqkEVAMCdlQBHUgvRS30vzBJDOCeAwqeGUDDfSwbfgd
	NyyaYqPEm05iu6cyzjLxoBuE3/TJzk22TQ1zVQDxag/MDrnSSsxIcRYkfDx3p0l1
	Px5+MD/DpydGl9SgHXateUs4gkIGnmbj2iZ39Q5t4GTpm70CEjzY0yB3cLj41wj7
	ISfyWctz2be9HJw8H8oZCsQn8y9qvurdfNaEo9Sj5kXu9w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj111vp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 12:16:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e768af628so3248699241.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 05:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790079418; x=1790684218; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ElUj7GHgbC3Jnx4+jMPtrWNT9qdGVGYkNZk/GTyr4fM=;
        b=EyNA5bfONCeKP8oyEw0NqWB2aY3y1pi1IC/sz3ckdZb08JV51VeNNosgQYlx682mgL
         BAf4nLS9OxlfHtV/p29t9kitIq0E+Xikxqdu5i0YdKTZ3hChMMe03/6aGF4z6Uw6DW8K
         /GRr9KgXGatIGppG1DC+RfIzUliHtGfo9bbW7KjoJLrAgta/XJGf1tZaX/166M4WC/dy
         fDK9wHpsZ3u8eq8A+2WaNDuKSkNJpMkBW/CW+eyBRueOW3X2RGp2yiFKsETYft/UkweO
         fsTp360yYHCe2DNiwDCKbmc7uHMoS6gvLgtprmwO9ECpjFP3c9/dry1W1CJC/i5CCjh5
         Gomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079418; x=1790684218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElUj7GHgbC3Jnx4+jMPtrWNT9qdGVGYkNZk/GTyr4fM=;
        b=kxtJPlnjROi2+oGRcdvRLurgQPc7b7n8lBC6jno/imB85jGv1s7/4TpZpSz5ACxpsA
         97HO9W8X1mp5O9K/zkxEEP7bVvp4Rm07V+VQH9oGfpUh+7K/ix5D5NjUGjv7CmhCFEYY
         CYonTblE0icBY9mOJgJs1z+4MONfLmoin1TfploUiHlkXTcagmup3pBpIBMYbyEWfo9p
         CAWfJcxKmUWblvZ+EAj39upidrjJGb6366SwOtH2S4sNCfOLXrUzMAroM49gPRomYWO7
         ip9ZgEjL+GIG8oZVqVRllM0dwJ4W3/g/aU6NZoV0wK2RNdT5tbm3EYmsjk/b7Tz1T5ON
         594g==
X-Gm-Message-State: AFuF++mwCbOXWuCYkrWktYHy2yOPG7X/gyVOEfipbR0QX+K/8/msVMJu
	VVX/BU3Jd+T61VYWZ/O4dC8vog1k46bdWuM/nBVZWb828zkSJzUoOORdxalwBeRv+KTFyBzl6LU
	YlfoMN4M3zQN8LXUIFOqnSdewM1u8G5U2A38BCnPSxz7JeaBRhGwP8kcoSi6RP+dZ8Rp6kzOioC
	7/R7RkPvI=
X-Gm-Gg: AYBFou0dZ8DxvA7EI52lhhj2EhHNqBKVQDuPlIFzXS3VVAVvoPVLEyw3Mhb7kU0WKo4
	sWgZpm+rkxd0pOR5udwrQDeuHDEsrKgv9jzZ28CmwdXkCmsh+wtVJEt07/U8qwa7iZdp1VSmeRg
	skTkYktWEKnQEn0qHKYECeoqZfZLlmh0Rp5fz14AUbrrtGDEV9RDHFmnqz5DB+FNlI37UMDeadt
	c9u1qznqq8GSncVhunwQAqlPj2ri9tQPP/6/VlkIiZqRbpLEVSv0BX09PI7rWzlFikJbdOcmeVR
	p20GktF3YA7RqrWF91jxVPQGzxtvoeCuyc9Fo2FxyX2fl81nExjcTxjc3JRr6B4yns+Ui89iiQe
	HMekqzz42FGpBdLAVOUqCemUFj1qrxC3Icf3PrnHvhOhkKfJCQwGrmmOvR2AsnJK9vZJAcDG8XZ
	DjuU2yx/lxzLL3
X-Received: by 2002:a05:6102:3914:b0:7a1:f7c3:3a47 with SMTP id ada2fe7eead31-7a55ce7ee91mr7233584137.20.1790079418048;
        Tue, 22 Sep 2026 05:16:58 -0700 (PDT)
X-Received: by 2002:a05:6102:3914:b0:7a1:f7c3:3a47 with SMTP id ada2fe7eead31-7a55ce7ee91mr7233539137.20.1790079417532;
        Tue, 22 Sep 2026 05:16:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a627d816c1sm5177611fa.33.2026.09.22.05.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:16:55 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:16:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: upgrade 20260910 -> 20260916
Message-ID: <lv7isfvflpoqilayk3tnllgtjq354wkuncafefw5omfjtfgkau@u6zvwhooyijd>
References: <20260922105941.981995-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922105941.981995-1-vpuar@qti.qualcomm.com>
X-Proofpoint-GUID: fVBJfy6f9q-6liAVsnl0EIBvmfpu1cHq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3NyBTYWx0ZWRfX3HgaQmd/dhvd
 GBO2dxXauc3FhFbAhWPjjUobfyYJcM+CjcoVcgtrzqQHCEG9F8iAWWKY20YFdrBDAHJ29V7LddL
 WorTgMdV71abg/GG8E+AQgz3vXEf488=
X-Proofpoint-ORIG-GUID: fVBJfy6f9q-6liAVsnl0EIBvmfpu1cHq
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab271bb cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0egSyqfb6J8GS74xgUMA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3NyBTYWx0ZWRfX2uomXZf9YxlG
 d4U4aknpKLVWOgenq2q5gQNUOpZrrWvLpVIxFkY2HgixuaY7UZUwsauroO1kgdIhZBC/Cw11HJb
 A6OLVwjvO5vXr5/jHHc/CQqdta7b6gmF23nZgrfDL/z4a5afCzojfiSCEi1Koit5lcfZuBGicvz
 mbC/nZhYUgcRBevy9hn1K7WP+rrytO997wZgUZbS7HRA80ryWQABeLm1Yd7q+3IFB/9oqfCAQ+B
 lP5SU3FA42qMF0kuaBO52tpE5bRr2vvkWvLzBeln8wTicmhhuhaSRFU/xcrEU7nXk2di/cwHi9j
 WmDLaEH4W4wrAI+yjIOhqMbRUnwXtF5ZMTJUV4tzdMaxvzNKaDaYDAW4+iuHtxm5k619aN08JmJ
 wSAI66e8yvS+/SLsE04XPVekgoEkBa0SRJdkamDQQgm5GLd8ic7LJ71eqH3hM68LqTDCzZe6yu6
 8CMKD2Gnp0CfHr+xhuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 12:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246407

On Tue, Sep 22, 2026 at 04:29:41PM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add firmware
> for RTL8261d. Add ADSP firmware for Qualcomm Maili platform.
> Add SHIFT6mq modem and WLAN firmware packages, which reuse
> files already available in linux-firmware through upstream symlinks.
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20260910.bb => linux-firmware_20260916.bb} | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260910.bb => linux-firmware_20260916.bb} (99%)
> 
> @@ -2633,6 +2644,8 @@ FILES:${PN}-qcom-sdm845-compute = "${firmwaredir}/qcom/sdm845/cdsp*.*"
>  FILES:${PN}-qcom-sdm845-modem = "${firmwaredir}/qcom/sdm845/mba.mbn* ${firmwaredir}/qcom/sdm845/modem*.* ${firmwaredir}/qcom/sdm845/wlanmdsp.mbn* ${firmwaredir}/qcom/sdm845/notice.txt_wlanmdsp* \
>                                   ${firmwaredir}/ath10k/WCN3990/hw1.0/wlanmdsp.mbn* ${firmwaredir}/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
>  FILES:${PN}-qcom-sdm845-shift6mq-adreno = "${firmwaredir}/qcom/sdm845/SHIFT/axolotl/a630_zap.mbn*"
> +FILES:${PN}-qcom-sdm845-shift6mq-modem = "${firmwaredir}/qcom/sdm845/SHIFT/axolotl/mba.mbn* ${firmwaredir}/qcom/sdm845/mba.mbn*"
> +FILES:${PN}-qcom-sdm845-shift6mq-wifi = "${firmwaredir}/qcom/sdm845/SHIFT/axolotl/wlanmdsp.mbn* ${firmwaredir}/ath10k/WCN3990/hw1.0/wlanmdsp.mbn*"

This will break it for every other SDM845 platftom. No, SHIFT6mq only
needs the axolotl-specific files, the rest must be pulled via
dependencies.

>  FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${firmwaredir}/qcom/sdm845/Thundercomm/db845c/slpi*.*"
>  FILES:${PN}-qcom-sdx35-foxconn-firehose = "${firmwaredir}/qcom/sdx35/foxconn/xbl_s_devprg_ns.melf*"
>  FILES:${PN}-qcom-sdx61-foxconn-firehose = "${firmwaredir}/qcom/sdx61/foxconn/prog_firehose_lite.elf*"

-- 
With best wishes
Dmitry

