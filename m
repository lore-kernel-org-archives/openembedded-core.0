Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF3BCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 12:11:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56952.1790597503118416975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 05:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=psVY9T+S;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=U/6wm3Gt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SC4XRE038626
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 12:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c4dqVV0etdJ6dhvv9ui+GU/J
	EpZE2ZvNbmmqzTCB8aY=; b=psVY9T+S7lH2CenM3MZ7QOQangkRq0SBolfVLc1W
	PvqN+E8jzRZU173FriITu1ggrNKMorTQf6wn6x37CP/9TB+H4oPMqVpT0caNQndM
	YT20sxOU2/IlsROpWrkR4mHP1gZimZDKKtGfKfmrlJ5r0jjBcqJdMT4AcKGJi67x
	6OJFCR1k6qhq0JQZR/jDsGC8uIXjlr3R42VTTIjwQojS8r3pILyEgwlmqdkAjRus
	2ZYIEgHAvUHeZsucfzfNCbxi5/2RQE/MdajoAL4Jamsb7thYKnVaJ/Ux95wT0C94
	XsFBvyzuJ6rWwInTkR8vO9zY76/khQaS96psMIZ6Bs//YQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx380u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 12:11:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc795ad1f5aso1372674a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 05:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597502; cv=none;
        d=google.com; s=arc-20260327;
        b=Yt7JidOuHrqrlHXaseOTYb76ouBIJQeOPfOXlzeDLuWW61xUojYXnz0zz8p5NbNO9r
         O5cKOa1fTnozSyGN5oVoT/MAVqJiJHLUsWAfuRSxHVyrVmXKoQ304Vchr9p1tSbI/7L3
         zWJiXg3wfAPgBIzPzTgXepV/NdwpU5IFICTa+dTnfqzdtLh9YhE+1akgTSBJ2x64ww42
         FCQUN9pbp35DzluXHQ/kLUPwz6hloEwFVbMmkQXd+UqUyyNQRIdVDNeGZjKq/qQpMgTo
         XOQAp/oJosM0+JozR4JsF9+zSr78nvJ/ZWSlqhDdjL4qpY1+1TFeG0/gYs0WNJISGEyu
         6C2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c4dqVV0etdJ6dhvv9ui+GU/JEpZE2ZvNbmmqzTCB8aY=;
        fh=L+hSxwScffKHTYDun5mmRaaioMq9QiPQ4Z2T7OU7Pkc=;
        b=T0o78FbKzT6bTXgVz06B7AZeaeBteV6PRNsN3vMg9UKyesORXzf2GYsEeMlHVT1Qpx
         yI4vAN0JFtZaK3N3djw2ZGxpqLOpeIbaBGX07q5PEMX/sncnDxik9ohQRYTZWpFg1bhO
         50nLWwUZgMffQbnKQHol3w/peYgSIBGGX1R77FKahNA1ABBFTidNhm2SX1jOPPinbcRI
         9eC99gF2IWfNANYlume+Z5RYni5bEXiE9TAKF3PhX8bfl67U72OkvCEj3ORywA1fif+e
         q33a3A5+tm4BZyMJjsdBParUtBGimUzfbbGTBZ9PaKdhlxVCfdh9i3DsWR3tFehMDAdN
         ez8w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790597502; x=1791202302; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4dqVV0etdJ6dhvv9ui+GU/JEpZE2ZvNbmmqzTCB8aY=;
        b=U/6wm3GtHAw0frEcmTaXERLu8uAVFV1Ne8ow9YpQ2CU071495r6CsvVB8LFUn+i1bf
         MlJyHruTan032oXMUVHG/4cwl+3oq/zw12mD6V+PrSWHMkC1ftLqXt5qbnPJLHb6GLk6
         +pPdyeCA5ZmQJVbey1CxGpJFDjMG1yZG5y6941r7Wmq0PGIxDf3mSYHwQEKozFZBBKhE
         zeLRW9eEFOVmurQ6KJZ8Q4o/FpWjEBnlc/5X+YxYrTLcJ5I14GcB1p8rnqVTgp2N36md
         jxG84ypGiFpac8/BQGJ4XPVzXguBv15Zu0C8LnRlIT/1JHlsMncjIcOx7wdpr4hroGXN
         QXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597502; x=1791202302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c4dqVV0etdJ6dhvv9ui+GU/JEpZE2ZvNbmmqzTCB8aY=;
        b=GTsCmSXdnhOvty2HpXLvONBUDaDZDsTAdmvXkJTennG+WYKWr3J8bSiQbq/HMnLpPB
         p/tl7ojXob6X3LoDF+ciVSv7vxnbwrOhgjoAFFlFIVgRU20Zm4XOeTxly62hdytyACfF
         S/wsg2Qt6oUl8fbysbtK7Bjcls2xeIpqaI+KdNl9Hl3fb90vid9aPwfhtNhT8Gmplat0
         wERUU6qEBgFE9p8QQ2nWIHhE+TtnTuVDhaAnkwVtl58pSlGc0bcG6/8kg/Z91l7HrTBe
         oO0ascsf663jsZ4v+JXgEPlf8+DRl7hKPnGVDM77JlAM/tpmqsJ7qd4lwgIEJHFQFzs0
         xvtQ==
X-Gm-Message-State: AFuF++nC8x89r79vSSCRTy8vIam7fAYBQv9xR28/9mfISRr6q3v91L1/
	a9xW5F8X8Botj4o8tLv+b/bii+mUka2Ku+lT0vZB4dMs34sZAPssh949bGN6oIRIfolD2kIkzP0
	C4jbwVc8sNbTs/oHJgmderuSP/F0DK6RD/Lch9/Tneilq2QG419q+c8J15MhKBnT3fGpXy/4B1Y
	qEwdu01b3Pl7yyqCPlnQtQwWjXkcqZnCn4fqGIgF6kaLrJvyHy0LZBIhK6yQ==
X-Gm-Gg: AYBFou3d88/k87QTcWTLncGvPnuzDqjXI1EVMwHNiFDZVn0ctlmeSlOgwkZb0fdYf33
	iRGCofFtOzCEsyaDFJ2Lb9p3giZLq4BjwBoFVW1HehjdTvfNfW9rt4H/tn/Pevu+QlseZwqWJPd
	sd01zmKS+ZZx1HY+f2D85Fn4lutVj9JWm21vMdHFNITn552lUYzCDeB7Fu+Q==
X-Received: by 2002:a05:6a20:5491:b0:3de:4f56:cf01 with SMTP id adf61e73a8af0-3de4f56ea7fmr4784328637.58.1790597501655;
        Mon, 28 Sep 2026 05:11:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:5491:b0:3de:4f56:cf01 with SMTP id
 adf61e73a8af0-3de4f56ea7fmr4784301637.58.1790597501028; Mon, 28 Sep 2026
 05:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260928085924.3023725-1-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20260928085924.3023725-1-viswanath.kraleti@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:11:29 +0300
X-Gm-Features: AclHuK-1TIxwYmopcD5xWoa3qIzGTVyhNkofQe_dhL8zwm76OuHqgt5XJL6GQmc
Message-ID: <CAO9ioeUb1izMERRcYOHmE_Tpmkyu4TfrLa-hZ0gm_H_cmU8Lbw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] linux-firmware: package qcom-shikra-wifi firmware
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0OCBTYWx0ZWRfX52Fo0o1I+CDM
 XxinAKqFORU/qjgvb/420wSEuJbwHoblVpeOo05efcamZjgRIK0KjO3SaMdpm8hzZKuGBF+j0li
 AsJte7RpRgixbebVOY6c9EqfzFe3L87ykKt2+D3UOrjR+rSuw9Y3CPQyrdwIKiPFtsllFXm7Cda
 WPixNqMKPrmkg8JHP/D4423RrWcyuhARo+IgmRRd/KQ5CQbYvJmmCNZCSerwmsmhuc5WjeICUGM
 /gwWR7DbR0wIng48Vjrx+lWJYZZPJ4gMK3yiaDH9+1ZJCW+5/NsMg7FWO4pKq5UdwXs+Yj3mkaM
 ML8ChPamHAluSzYt/r+Bj61aIU3FsbvoYF/XvTyzft1OoNTHKgXxBCXNLmgXN7SNhLw1j4aA3Tj
 8OBiI27FFGFSRSIAFejgytiI0nRNXy5BATGba0PjmBpEUNMhL98XlV8JH//9FKtKHhz1qJ+/bHP
 eLuqPECANxjRasKP0kA==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6aba597e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=9lHaKil3BFSzk0MhzIAA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: _6SxQkUCaE-K0HBBf_Fu9HJiHYry5dsf
X-Proofpoint-GUID: _6SxQkUCaE-K0HBBf_Fu9HJiHYry5dsf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0OCBTYWx0ZWRfX4soIW2s2x8qO
 SoO7CCMYpd56mu9uu7TTclpDpsv8e5bP5Br933pA8I9FqoLQD85R7NSLwnuR2Wjz+wr/37Z3Nfz
 6sjCjc0yDLgjvj4GM1G/dd+EYKV7E4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 12:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246759

On Mon, 28 Sept 2026 at 11:59, Viswanath Kraleti
<viswanath.kraleti@oss.qualcomm.com> wrote:
>
> Split the Shikra-specific ath10k WCN3990 hw1.0 WiFi firmware out
> of the generic linux-firmware-ath10k-wcn3990 package into its own
> linux-firmware-qcom-shikra-wifi package, matching the existing
> per-board split already done for QCM2290/QRB4210.

If you are touching WiFi for Shikra, you can also backport a patch
from linux-firmware adding a missing L: claude.

>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
>  meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb | 4 ++++
>  1 file changed, 4 insertions(+)



-- 
With best wishes
Dmitry

