Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E55C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 21:02:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.19040.1743282157969657225
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 14:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XM/qoUX8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52TKjvin006290
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 21:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FB7MmOhbdSZahdBzuDc6TmHl
	0YksXW1dfBYVKRKN9Gg=; b=XM/qoUX8k6/SrgK2dWLqKX0rWY8xfQ2/SHByj1BE
	09DBBlHjw7pGLXXof4ta8nFKF3nAMwc7F2ZBdv8OgRe+j1wtxohFDMs9Av34sKDT
	J7dAGsDxDz7zy0SMff85SLKNn5/dvrFVrBlLVLyD4hvulbIjrxc84cvrDYyIFIqj
	e0I4st9u/OyNoZuRyy4VjOGzLHloLMjEJHbAoemuoL5YIGCQFE1XuIW8w9AUI7BR
	6APjINFLL7CsLnCCj+d3xEGIc7i5mjJ+dQ2lsLaq9rouBk6s3piDg9IxWJs7Aibk
	6pe+AePs1h3uY71mNSrfBPRZ9oZja7ZYln4l227fqUtn2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1ns7hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 21:02:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7bb849aa5fbso666646485a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 14:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743282156; x=1743886956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FB7MmOhbdSZahdBzuDc6TmHl0YksXW1dfBYVKRKN9Gg=;
        b=dJCI0QDouGlewGOiUPN/bK/ful6ahV8L9U8a6ZczrO+4A3eil4AOe+A1xjP9in0LTQ
         On2HphD7m0cxTkesAItRDDG3QxeFVgm6j4/+pvvI2mYli4s/9b8fkymyzZUjyhhd+EWX
         MGkDf2DXe/echOiDL/Zwn7b+AJdSSjNC10uBgUL46hTMk4QKTxvhaiI+LKW3sJmrzAJC
         YVPomLRLytmOcboaPsWqLwKdy2+v+J5a/kF9FyOBmrd6Tjaa+IqxkFaVcw4HGLmm9cN6
         Pi3bR2TGgVShpcT9soq5VWSFZM4ya2mHvVVOxslRcQ6UjBWqntsAsfCVWM4yNX035i/c
         Ojyg==
X-Gm-Message-State: AOJu0YytSn23w8AWQZOOHqB+0BH84t6iBwRuPIzsygMuLt+m1f7Swk1K
	p8KCeKn931KHIZOvIKSMF8QWXEM9/AqO2427lRVHJ1nznIGPooCcrGBXwLa5Mr5GyV/5KfVRnWd
	p804LHK8gw4CmRTU2V7w4Aq0jwErOn264+rEONJj7/iLUUl4I4xpwxkrX01cZPolzFQNQcrIhcr
	BQLm0=
X-Gm-Gg: ASbGnctJOhrJtkMQXUE18UvlDJ5sEmX8UG3HahwcIdFTXkXKfEfo4nZh7XNk6AWik57
	JfspvC2mhkp8jaM7whqll6RC1eNhXaL9SaOO6CO0LRolx9fDZqDMmR4FhNlhbq2jbtU7X388q8s
	iSZy90Is53b7bVYBZoOMSE/h6TVCrXl++U9H++us/mOsLG06Pk1J5FMD1pbUICmYJXTroxzsMN5
	iSnu8bf+V0xE+ZBMivueCPyaJVpRYk8j4u3H8L7WOyahn8IVOh+3NQLw1vhyBLlG04vLfNP0lC8
	uRMOa+g88cwUV1ec+PDPjvGu0L4qlUKNFqEEf24QKo3H1PlNcWF3MNb9487UC5KRpQTcTLyIwQg
	hjw0=
X-Received: by 2002:a05:620a:24ce:b0:7c5:48bc:8c77 with SMTP id af79cd13be357-7c6862e5a34mr580749885a.12.1743282155905;
        Sat, 29 Mar 2025 14:02:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB9lI8M2fhUXLUPvoo4sDi14dDLm5W2rINi8tGwGjdCuaoUEtNCPBxhkTFWNYmGxhAll/D7A==
X-Received: by 2002:a05:620a:24ce:b0:7c5:48bc:8c77 with SMTP id af79cd13be357-7c6862e5a34mr580745785a.12.1743282155487;
        Sat, 29 Mar 2025 14:02:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b5983fsm8316971fa.98.2025.03.29.14.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 14:02:33 -0700 (PDT)
Date: Sat, 29 Mar 2025 23:02:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patchtest results for [PATCH v3 6/9] llvm: add
 SPIRV-LLVM-Translator support
Message-ID: <u6qn7il6fp6yuy3nu3cf73axw62fyuznfnipnbvx2yjp42u5qj@g6e52xzpvzpw>
References: <20250329-mesa-25-v3-6-f4d0328eb867@oss.qualcomm.com>
 <01010195e3a53476-6b385675-36a3-46c1-a888-56ae92e7657e-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01010195e3a53476-6b385675-36a3-46c1-a888-56ae92e7657e-000000@us-west-2.amazonses.com>
X-Proofpoint-ORIG-GUID: zPVJYz-UzcCfzbB_OnZkI1KN8x9ltGzq
X-Proofpoint-GUID: zPVJYz-UzcCfzbB_OnZkI1KN8x9ltGzq
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67e85fed cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=iGHA9ds3AAAA:8 a=OmQg1XK9loyA-OjW1fMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503290153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 21:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213906

On Sat, Mar 29, 2025 at 08:43:29PM +0000, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
> 
> ---
> Testing patch /home/patchtest/share/mboxes/v3-6-9-llvm-add-SPIRV-LLVM-Translator-support.patch
> 
> FAIL: test Upstream-Status presence: Upstream-Status is Submitted, but it is not mentioned where (test_patch.TestPatch.test_upstream_status_presence_format)

This is a fail positive.

Upstream-Status: Pending [will be submitted upstream after internal clearance]

> 
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
> 
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> 
> ---
> 
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!



-- 
With best wishes
Dmitry

