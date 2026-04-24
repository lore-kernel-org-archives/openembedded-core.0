Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEB6FE520C
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 11:17:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18106.1777027244102208933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 03:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=fzTk3H7z;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=EOQ5npu0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jiacheng.shi@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O914SB756716
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 10:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llJdZb3iYPBWKIsiWMZi7jeU40fkOAq3sUu2QXopPpw=; b=fzTk3H7zv8U8WoOU
	3z8+7fSYofg5c95YCqVtRfN0XzYVswPl4zTUP5Xd2BIIQPIebfGGNqb5sdfWWk5H
	mgOtJr3mrAiojMBH2VMKAbzeXiOduWwxgqzR0sFlocdCDFPeLI4eixbpPIX8u+Mt
	F40xaBwhrStkiWWLovhq2VTKspI+yt2IFhy/KoYp9SWcljBYni5tLFHsCWIFDi2P
	qzB7dMX/hu6oqbJM1fHvD9XmSII+o7cKMps3AADGV3JK6OOTumIm35IRtANN/gIR
	hCDc6+PD3PBcSSeRrBcFs6ICQ7BIV/XVNQWsZhol9wM4MkOFi29pe3bIOIlZ102d
	8NAPfw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bkkff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 10:40:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so3793370b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 03:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777027242; x=1777632042; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llJdZb3iYPBWKIsiWMZi7jeU40fkOAq3sUu2QXopPpw=;
        b=EOQ5npu0YN0fYPk06Yr+tzirQZBAoGCW/36kTgC3LZ8oYwdEamPIuTw8Sd8GNovsHa
         XOnfp71+DsxPiz7jqoanJrESt1DhC+e+GTc0L0IQk6vDEK+oUDGMqrqnBul7IRNY6ayW
         6YiduB2AUqXxLpXpWM1dvfIyLL9jQiG23cLKEtOhsl1qycTrsMhNNNjzKmfuTSEQVZ78
         epEAt5PvjNvK+9ELp/C08ysWd6MH3t5I94P+TvLzufBnfRYKNTTiK3UBv/y9nnVkiMpX
         hZTpwNbqgOe3gD/simx3xJ36dLmyNXz1JwTKyroUkvkHuMxy18m+JJO4autKj2V9W14T
         dSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777027242; x=1777632042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llJdZb3iYPBWKIsiWMZi7jeU40fkOAq3sUu2QXopPpw=;
        b=fthTyVVzsYgjOydJfFOtMi1fgDnuDWjXZdqiVKzUOStzO4QtS0M0D5de88l8E3C8kQ
         d/scy3Yw7syzcgb4PeF+0N+JAmTewll7iMG12rfdnFnWd3dFmhFu3iMUkPwDZb1I9F/S
         eYucCJwkXVsE8mYvPKmDtKXUV3qavPj580xd5VdVpavbC0CvukIzbNcByFJFpAwjP1We
         QM/LctdQyozGJCL5Q2Wex58ETKc5N/j4KLz4AqzAKI5KE7YUq/uNFKwm83HT8FeZG4ox
         sHYWNnbsIbcFjN9ce4+D5lblHK4jkC/d0pSJWcNpTQAeH+mibF8oYpinWsfv6HCCwLZB
         K0nQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pUNVW36sTM/nmdKqjgvtvbey+6rGu2RUdXNtGUx/bC2cBRjNuj/gW3LHI7+OgjxeDxuCP7/H09AmCDZfzM7+lLQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyafPnvEgFIB9RttBz2H4Hyp6eVfal4tzpn+D8omVpXQBunUnmA
	Y2xK0AMf1cKeTZEBm/KuRXGgAG3pERMEII0vWU1cd5/wzOw/i7bJY+FiyvN0jUgpGSRE48CY9by
	EP1JEQxRimaf03jEly9/3Sp/Sq+RntuLj0NnVnJAI3VoGW3jz9VXddKY/wCKPg0JhcGz7yZD3uc
	1fj83di5I=
X-Gm-Gg: AeBDies75fkFV089A5ZA+jXXj9Au9qIqm2SpEHJcXHPu5wwIWWbEqPANwAB/DZAhoZF
	qb2ROeCmvcBLiKuyjDIyXo5tqt6fwTx5/qyl6IaUVnTJxFF79DZeuuaTVjTQ3/+HFYrWOTX/U0+
	xi9Ekc2+FR4FRNdIewAB12+N48y5oywK7ULlbkIgj8V3QZWvitQjccTMkVxB7ewlMnli6j7AwVU
	5Abb/Z1tHGkdXahO5zUS+XTcq4dFwguS2wmXIyHtbyvjk45s11pG/1CX8shocf+NnddxJ9IOfkL
	XWK85JDDEKXry1Fg+K8gJXOErvA0w5GE3tRl8wchV1Q5deuoNVNrOZZNOW9jev23Zmc9q3g3zaS
	FeSe7sSrbzHxnpgd/eMjStC9Kdai/9fhmPWLHkEYtwttgtyEap+HjdXGJg/I=
X-Received: by 2002:a05:6a00:3cc6:b0:82c:db50:ef77 with SMTP id d2e1a72fcca58-82f8c98c45amr34345023b3a.49.1777027241906;
        Fri, 24 Apr 2026 03:40:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cc6:b0:82c:db50:ef77 with SMTP id d2e1a72fcca58-82f8c98c45amr34345000b3a.49.1777027241381;
        Fri, 24 Apr 2026 03:40:41 -0700 (PDT)
Received: from [10.239.29.59] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec037e1sm27693316b3a.54.2026.04.24.03.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:40:41 -0700 (PDT)
Message-ID: <d7dc7eb8-2e4c-4d8b-a1dd-465a5eb455c0@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 18:40:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] wpa-supplicant: add patches to support RSNE/RSNXE overriding
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com, zhi.chen@oss.qualcomm.com,
        miaoqing.pan@oss.qualcomm.com, pengfei.zhang@oss.qualcomm.com,
        gaole.zhang@oss.qualcomm.com
References: <20260424093601.1867587-1-jiacheng.shi@oss.qualcomm.com>
 <e0a1a2fa3b627a698b46cf3ef645a29bb1e98127.camel@pbarker.dev>
From: "Jiacheng Shi (Consultant)" <jiacheng.shi@oss.qualcomm.com>
In-Reply-To: <e0a1a2fa3b627a698b46cf3ef645a29bb1e98127.camel@pbarker.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMSBTYWx0ZWRfX7YD+lv4+tM02
 yofhFehhDzVTuT2VWmq02ptFWPsGTuPzg8z68QPl0msPK5waN2fb7TNYuvboy2yEeSJC+AszxqA
 MXjOTuAf1yoNuMGxRZST8A340BuBOyWwY842FqQW2N1BptPO/yTdD5/Ku6K/tqnpcDdzzDaUwlS
 3Zip+d9jnlQeHuYdbzFygelcfDN+Xia9SGTN4KF+Itp9gpOON82EGAsm/cjNJzt5ZObqEMcANjP
 NL3K+1NYWny4yDz1Ao5KgDyoLerfZQQJ8KvrJYswDGRByEgnah7JehaWnpr9JZ5hAGn+ieOSypn
 Ftp5GrLzJ0zsKAxPbhiIyLUFKJu/e7OrvxU/qBmTKOq7P479rDTxjK4jjKTv+YCC/pKeLLnjw9M
 SANqxFZi+P2JZli9jMa7rr8enOHeIi5y3Byy9Fg4lEOpda5GfU1npkbyjPpqeMWwDLGeFfE+4hH
 SYkAB1Xr9AbBzwyhf0w==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb48aa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=koynXS-pVACRZpjXEngA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: enCDjGTCySq51tknFgD6MYb3TF19zhyP
X-Proofpoint-GUID: enCDjGTCySq51tknFgD6MYb3TF19zhyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240101
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 63O914SB756716
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 11:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235859


On 4/24/2026 5:54 PM, Paul Barker wrote:
> On Fri, 2026-04-24 at 17:36 +0800, Jiacheng Shi via
> lists.openembedded.org wrote:
>> Add RSN/RSNXE override support in wpa_supplicant to pass Wi-Fi
>> certification test FC 5.2.3.3.
>>
>> During the 2EAPMSG exchange, the STA did not apply the SNonce_Cookie
>> provided by the AP as required by the test specification, resulting
>> in sniffer validation failure.
>> To address this, allow RSN/RSNX overriding in STA mode and explicitly
>> signal SNonce_Cookie=E2=80=93based override capability.
>>
>> Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
>> ---
>> v2:
>>   * Change commit message
>>
>>   ...r-specific-element-types-for-RSNE-RS.patch |  34 +
>>   ...-overriding-elements-into-IE-parsing.patch |  58 ++
>>   ...ide-element-to-override-RSNE-content.patch |  36 +
>>   ...ride-element-to-override-RSNXE-conte.patch |  36 +
>>   ...eature-flags-to-indicate-RSN-overrid.patch |  67 ++
>>   ...a-capability-flag-for-RSN-overriding.patch |  65 ++
>>   ...ions-to-access-RSNE-RSNXE-from-BSS-e.patch | 448 +++++++++++
>>   ...bilities-for-AKM-suites-available-wi.patch |  66 ++
>>   .../0013-RSNE-RSNXE-overriding-for-STA.patch  | 739 ++++++++++++++++=
++
>>   ...-Selection-element-to-indicate-which.patch | 415 ++++++++++
>>   ...cookie-to-indicate-support-for-RSN-o.patch |  84 ++
>>   .../wpa-supplicant/wpa-supplicant_2.11.bb     |  11 +
>>   12 files changed, 2059 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0005-Define-WFA-vendor-specific-element-types-for-RSNE-RS.patch
>>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0006-Add-RSN-overriding-elements-into-IE-parsing.patch
>>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0007-Allow-RSNE-Override-element-to-override-RSNE-content.patch
>>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0008-Allow-RSNXE-Override-element-to-override-RSNXE-conte.patch
>>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0009-Add-QCA-vendor-feature-flags-to-indicate-RSN-overrid.patch
>>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0010-nl80211-Add-a-capability-flag-for-RSN-overriding.patch
>>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0011-Use-helper-functions-to-access-RSNE-RSNXE-from-BSS-e.patch
>>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0012-Make-driver-capabilities-for-AKM-suites-available-wi.patch
>>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0013-RSNE-RSNXE-overriding-for-STA.patch
>>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0014-RSNO-Use-the-RSN-Selection-element-to-indicate-which.patch
>>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0015-RSNO-Use-SNonce-cookie-to-indicate-support-for-RSN-o.patch
> Hi,
>
> This is a lot to backport for a new feature. Have you tried asking
> upstream for a new release? That would be a better path forward if they
> have important new features in their development branch.
>
> Thanks,

Hi,

Since we don't have control over the upstream release schedule,
would it be possible to merge these certification-related patches first?
Once wpa_suoolicant version 2.12 is ready, we can then proceed to remove =
them accordingly.

Thanks,




