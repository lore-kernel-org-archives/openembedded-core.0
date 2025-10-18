Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A0ACCD193
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 22:34:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.14638.1760826856871537118
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Oct 2025 15:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=I7uhfEE8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ILlFRX004163
	for <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 22:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YVD8E4QUDq/yONGJRaSPrGMZ
	x/UNWv47V2vPj2CvbeI=; b=I7uhfEE8fvYaCcFBta+nI6pquKe3CLtNhSDy+X6D
	l+iOdIKbq6YRD99P5td1vA1dlr4WlVwiZ/QtAmjTS1Ri5wq3qj+wW9cjdNVfppwq
	GDACZLIUDWMuVeeqpJT9WbJa4oHYWvloyAv6MMs4+kvnG9M0CjWc0BancIwwjjhM
	ZUv/POpCmpI8xUMvPiMmKW0x638P2rUzUd3kabRkknk3B5bXgm2A91dV2+ysLYu2
	Q0ngh1GFdE3foku1kwkkV7L1SY9riZ8yHBcCplUP2/i6wvmAu1pNeqoAni9hB3MG
	R+iA5UQCEAQAu6pYMr8LAaR5EhT/jkozD5RhBnstAO+ndw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k1ae6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 22:34:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-890801794b9so454357985a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 15:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760826855; x=1761431655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVD8E4QUDq/yONGJRaSPrGMZx/UNWv47V2vPj2CvbeI=;
        b=q4iQz5LuiryCoSydVZB1Guuysc+VA6gVsib8wb5NSNtvt+F6OSAKHxQmHmDL06kbrE
         O+QWRroQdvTOraVIIosFrO5JGP5SSeFbdlt4liVTmyIsxS4I4w6IsoPlKl3mI0t1B685
         ZQn58bxcOR5gp23uXoqtMtdFbcOE08wxRhIIFyQIHxLD4jS8Sbh1UL9u1sYhywViP89e
         fthWF7oG7L4K2Nw4ZYBcAD3EPjrI0NVv3eXpCZO/84p8Fu+Vh+e/1qnhawK87urWOYbe
         UiSkkKGdM9JBANml+YVhSr+1RbjNdyn77uuc78paV9yi1rGNuxzGzyRp/iq371H+tJjU
         KCtg==
X-Gm-Message-State: AOJu0YxPmYNpGJMXvCAACvKTVv7Ub7OMncUhsD8uWEAFx85nmF8xuDqb
	/bnEr6Y8sD1bZl5uoOehzyW6uSkOEzVIgv2recTQ6y6jyl5WE3ZEyIPUbyuJ0yuKhiwIKM28fMM
	qLXhDHa5RN8ytEBPZLAcOBwGREoWjLTrBwS8iSYk+1ppef9UqfODZiTzsWpTYrswtttO4mYsvWQ
	MdtAmj+UU=
X-Gm-Gg: ASbGnctuEnauMME0Rpkx8jab6WS7DrqcEehaDgInbDO6iZyOHxFix0r1acvO1L0zEzI
	qei0EIFBwYRMypVpZuKZfV5er1QTeJkwqQi9eg3Mp48+uOVXRLqgBO2HHSzwPeQerGyoR/ikiEk
	BzEL0Q3JaRaRsX3QPRRCckVCLa2uUQ1QDbTRz3cQkBfdYk9OLfmor8uK4FlFYPtURwxkWfc6E+e
	uLlTmGMnOgQAr25SKvEJQw9YYzPiI8Qomynd7lZaGF0LlcN0K/4dMuvRw65lqwr7bYo5BAhSBlc
	7DnnZm8FkkaU7MbbqdJQw0eRmklfjFiKyHeDLzf2RpkgkodkmnVMRirugirx+wSwUra7sozYuPZ
	KOrQCX/pMxadd8ZTy4Bb070vxwg2/RTEfOBqIKCjVdvCNzFhsuMciB1YtJgNv+a+wMmpxz+kWX7
	hcstKcAXXU4K4=
X-Received: by 2002:a05:622a:d:b0:4b7:aa52:a6f3 with SMTP id d75a77b69052e-4e89d371344mr110196391cf.39.1760826854905;
        Sat, 18 Oct 2025 15:34:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxF8nm2Wmg+w8EVC+fl4N7pZXM5DeJNFyopbYo4JPwr0hcbj35VnAZ9d7IM6dX+lKl70Sfhg==
X-Received: by 2002:a05:622a:d:b0:4b7:aa52:a6f3 with SMTP id d75a77b69052e-4e89d371344mr110196101cf.39.1760826854338;
        Sat, 18 Oct 2025 15:34:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1b0c3sm1058663e87.77.2025.10.18.15.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 15:34:12 -0700 (PDT)
Date: Sun, 19 Oct 2025 01:34:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] wpa-supplicant: enable 802.11be, MBO, OWE, and SuiteB
 support
Message-ID: <aPQV4Qy78RWUnImJ@umbar.lan>
References: <20250718030452.3459203-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718030452.3459203-1-miaoqing.pan@oss.qualcomm.com>
X-Proofpoint-GUID: Tf_3mcTSUOIwahmmCngVQbKLhKqAAG9l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX3+agijWbU6sk
 IybOVyCpep6zcCTdhRwh1l4drYg1/MGsANexOewVe/gJRNKB/mOXQTOS7paT7HrLmoF60bWCn2h
 5WSaip+cq+Wi4T+xN+UFtUvB+1G1z37pn7j/fZc71yszWzgMjn4j9VVYYdFTb0gQlTwD+htnAA5
 xyg0cg5brWqhySr/kjJk8cDGm8eA2v8XyL++62Sj5LwRZ+Ued8QxKPbAbf7S4Gw8NVmD1iyV47B
 c8W6UuVJq2l/iiAglTo9JyFb1ccN117+qfYvm8t1Zx4ng935f89zHBGGcrgVmUthJ6YBrcstcoc
 JiBAtMqlcc9omVQiI7wsdk3VkZIoPlyupSMKLROxtpwkDehdfDGhuHrcpvdr91bKfJVsqSBqXMI
 9++bkC/Hu8JxvgmhnM133W7J41Wtpw==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f415e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=mE_bIinh_DoMfPGrpYYA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Tf_3mcTSUOIwahmmCngVQbKLhKqAAG9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 22:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225078

On Fri, Jul 18, 2025 at 11:04:52AM +0800, Miaoqing Pan wrote:
> wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
> years. With growing market demand for Wi-Fi 7, it is now an
> appropriate time to enable IEEE 802.11be Extremely High Throughput
> (EHT) support - mainly for AP mode.
> 
> This patch also enables the following features in defconfig:
> Opportunistic Wireless Encryption (OWE)
> Suite B and Suite B 192
> Multi Band Operation (MBO)
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
> v2: update prefix and commit message.
> ---
>  .../wpa-supplicant/wpa-supplicant_2.11.bb                   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> index 6dc76494f7..440d3a5c94 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> @@ -37,6 +37,12 @@ do_configure () {
>  	${MAKE} -C wpa_supplicant clean
>  	sed -e '/^CONFIG_TLS=/d' <wpa_supplicant/defconfig >wpa_supplicant/.config
>  
> +	sed -i -e 's/^#\(CONFIG_IEEE80211BE=y\)/\1/' \
> +	       -e 's/^#\(CONFIG_MBO=y\)/\1/' \
> +	       -e 's/^#\(CONFIG_OWE=y\)/\1/' \
> +	       -e 's/^#\(CONFIG_SUITEB=y\)/\1/' \
> +	       -e 's/^#\(CONFIG_SUITEB192=y\)/\1/' wpa_supplicant/.config

I was pointed out to this patch. Is there any reason why you don't
extend the previous line, which also patches the .config file?

> +
>  	if ${@ bb.utils.contains('PACKAGECONFIG', 'openssl', 'true', 'false', d) }; then
>  		echo 'CONFIG_TLS=openssl' >>wpa_supplicant/.config
>  	elif ${@ bb.utils.contains('PACKAGECONFIG', 'gnutls', 'true', 'false', d) }; then
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

