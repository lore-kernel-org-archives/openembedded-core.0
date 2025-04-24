Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403CDC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 09:12:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.10939.1745485923064286949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 02:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=a+6b2HZd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F8w3010284
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=73Qx4rP9bZJb75m0S6ITZMXI
	tNnGcky6RkdtLGy/ORU=; b=a+6b2HZdT6LecfYXzTtwhYEMR1rAAeURd98rU1pb
	pCaORPZgRbh5DmfYSufTcBO/sSkjEJ1nZVGxQXEDDLB/KNB+xWHBEjCpjQT2zTow
	j1Xx9IjLbeBobv71xAI3t6oPzQu23ePdj/EdTjy5m3rqrCdeKPyT9/zDtDYqvEvX
	wtx5OxpzjOSG3m/wleZ0BHY9FLgf0tWQiff8R7hKmO2iMs0ZHkFFbAhNmOHT4KGx
	5cOFMuq8vCynkWbyRRxcBLU9dpPF3w05S3FkX0IzxC79bov63JvP64pibBRr5RQ7
	aAMuChUA23mvAl1ePRUKS+2Ncyb8rqiDw3jspt7IWNx6TQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mwug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:12:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so149298185a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 02:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745485921; x=1746090721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73Qx4rP9bZJb75m0S6ITZMXItNnGcky6RkdtLGy/ORU=;
        b=Fy8ZXQ1Fb2w+2Fp/XS5vHcgzz78WWkosd4s9SfkV+k5L0fb6tVBt+4j5fTXe2sVVDB
         XDhUQo1Qp0G/26RNWLVdHgrH0NGswikPUGXsyClW3gOC40uYKOFh+7hKif44WoOoaFdF
         tyODokABc5niBDcaiAlgzQg+YjJihdzStUEV7Vo+WJ7WYeqPx/Wzurip9mDUkKkvOAkD
         wS63E/hR8dl7moQo+vaYWK01dCfAdKrNL9lum+HmLMb+hYxyzDMnHrrpQePu4EgV8Ujn
         7WTa5Lkl/GpVSUaf890kDQ7YoJZhYHRn7DZX8/GI80cDWrTVQADy9qBknvKAM/3wpW3H
         Ax3A==
X-Gm-Message-State: AOJu0Yy4JXh/gQc8KDxXq8d+8zHJIALF5OIq+FAP+OQI1eUVTQ+yjIfi
	ZCr6GLLxDN7sne9uhbYRAoLWnb/AYQEw8gTx3uwsSpzIXg4DBFk/NcuxchraltBLmfpE2OwpN51
	aTI1XWy+DuzYSXDHdTkXG/A3aPp/KGEUQ6jJZ29fJbs0fGGjhmr9iUGlHbDmvOU/TW9STeQch4a
	VLOmhLy+IgGPo=
X-Gm-Gg: ASbGncv+3Tnl5XxKW05B8UFVaJnA59yUaZiwOQNRHWiwpyx7B9+Azjh7moZISmrcBsh
	m3MG9gTsCC2quHOXBL/NuDb6+91QhBSAmk+hdMy4N5CCkbZDkVqxonpBmi/HXufspJxJsuOtm1s
	U9qplNssj2k231mjE+vd3t5gclH8P2VekV1BZYOityyhewVG0GaJ0/hjPrfrD8Ok9Y3KS2KQYSD
	QnbmQkECAl1kT4FTgKm0hKD84w2SEBjuEv1I4G5a8D+MuhgV4hIJeTD3tFoOWYR+VeF+ZXBetHW
	LVRzXTYx9oQMzLQdqwROklhcdGuw+ZIi1wkUnxqvfmm6kGd4mTtux16WHHVdm5FUhlJ5fNdg8v8
	=
X-Received: by 2002:a05:620a:1d02:b0:7c5:4b91:6a42 with SMTP id af79cd13be357-7c956ea66d6mr335957185a.17.1745485920875;
        Thu, 24 Apr 2025 02:12:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHybrvLhAbjONWonx6cN/m2QCHDl3wGSLRMrJ4LCIxXFCh5J2QxgxGbHpqp6sD737D2rqJ7nA==
X-Received: by 2002:a05:620a:1d02:b0:7c5:4b91:6a42 with SMTP id af79cd13be357-7c956ea66d6mr335954485a.17.1745485920532;
        Thu, 24 Apr 2025 02:12:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d0019668sm1725221fa.58.2025.04.24.02.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:11:59 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:11:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/11] sstatesig: Handle special case of
 llvm-project-source shared-workdir
Message-ID: <jjntalgntiaaqnhc4ctbxexkyunovdoe3jiq2ra4hhg4qpakyo@ljcbt3opbeje>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-10-5a492a8461aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-clang-merge-v1-10-5a492a8461aa@gmail.com>
X-Proofpoint-ORIG-GUID: LoADb1WHjiiFJp7RbnglGEMNrSQNWga_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MCBTYWx0ZWRfX+/fcJDzg8/QF s0ULDpFN75k1RlfjNQk1y4xKz668b2QCbD0coeFoVW/2fBwXdLoWYXAWR96XQYW52/dlnsJ6A3i B23As9P1itJloqo7kmgJIBhIohL8Y2lM0M1Z/ShmKsU//aKMyiRtOdE/SOERfFacdqH3Ljo2ECM
 +SzUTR4I987Eo/PqNeq8My9dIveRsXXjuILhm4UhFD536AxTpNJl5kZUOASV0hHFaeAhJz0f2HC JVPVYdKs+NwPbp65HjTLAKAEnsQUYgJ1yehdbCId2UUUwkSaxrGyWqkTOfD45pHB7vFbPApCmIw yKATB4CEZFHm2ilJLDFCJsZ2UE5Qdwfsk0CB715nUS903vh0v2XQJ9ze/g3c5RJBFAFRbVDTvQI
 3R2Ii2ZCExpg5Dspgkdh3l9dK3/8LjYdOOQYICK5kHCBNhVApGY9TQEDzPlDJSz12VqsxxdC
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a0062 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=fCpfu3AjiAJWzP6DWXcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LoADb1WHjiiFJp7RbnglGEMNrSQNWga_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=901 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215343

On Thu, Apr 24, 2025 at 12:20:44AM -0700, Khem Raj wrote:
> bitbake-dumpsig or bitbake-diffsig tools do not work on any of tasks
> exposed by llvm-project-source recipe. This is due to it being a
> shared-workdir recipe.
> 
> Fixes
> 
> bitbake-diffsigs -t llvm-project-source-20.1.2 do_preconfigure
> NOTE: Starting bitbake server...
> ERROR: No sigdata files found matching llvm-project-source-20.1.2 do_preconfigure

If anybody runs git bisect on top of OE-Core, they might face issues if
this patch (and the next one) come after actual clang recipe. I think it
makes sense to rearrange them to come before the clang recipe
introduction, so that at each stage the tree can be built without
issues.

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/lib/oe/sstatesig.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 1f976067631f80d637ba803f49813323d17e7c70..826549948e24571ef57acbe6bc5a2442d6c49f13 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -418,6 +418,9 @@ def find_siginfo(pn, taskname, taskhashlist, d):
>      if pn.startswith("gcc-source"):
>          # gcc-source shared workdir is a special case :(
>          stamp = localdata.expand("${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}")
> +    elif pn.startswith("llvm-project-source"):
> +        # llvm-project-source shared workdir is also a special case :*(
> +        stamp = localdata.expand("${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}")
>  
>      filespec = '%s.%s.sigdata.*' % (stamp, taskname)
>      foundall = False
> 
> -- 
> 2.49.0
> 
> 

-- 
With best wishes
Dmitry

