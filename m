Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAD2CA5FF3
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 06:46:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30283.1768805183575866728
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jan 2026 22:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cxhJskFr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XhYAA8/L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ILGR8e3749193
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 06:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kqLqPuNeQ9LoUKY2rls1wS7J
	IycwWLBY+0fG8YdZGV8=; b=cxhJskFrBcmEfdGbTMXG/nZzGVMkA3UTVk3XM4xu
	rOTWegEj8hs3xREB0j0sAUoKzbxHbXawdC0DFbDrNWYQSeJrfCh3j1m7XpJRCQQz
	1OSisMn8N/5JDHud8xBsZG7O4Bf3dtPJZQoDb+3kEwrN8MZ/j8+jdrBYMq2/q43Q
	Lx8Xj07w+eitG6mSx7F8Fr24Pts1XoF/rOCT6k6+Va7kZuNIHRQu8C+toewIdSvf
	99h6F3Hnim6O1qW81dxwtLQUUg9e3y3vsy7jEm3aM4RevxdtX+pTK5cJDY5XR2Lc
	MvZ/tru4V7TFiz/uVEcLnhJnq32R1tS1+NPzDhnVOdK7bw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79eh00s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 06:46:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a291e7faso428321185a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jan 2026 22:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768805182; x=1769409982; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kqLqPuNeQ9LoUKY2rls1wS7JIycwWLBY+0fG8YdZGV8=;
        b=XhYAA8/LcaeOfg3HilteHU1DWHx2ZZN0JelJ5RTeY+e9fVw6xh1X/liaMmv82bm/45
         VeLCdZw4+0FEkJWTgLyEj+94M9+HdtBjRo+K5Z8eaWCz3HdFBz65U+J09slR/A5pa+FU
         CTZuZweYpWuOPSYJ+Pb2klCS7suhzVqbpjbkodrSllxJp5VjTUdDUZuwmfoAygD9i6Ep
         wlRiOvXc0vGB3gBFo8gTwMEuNrKzpCIoK8XpW73a8Fy0Zc9AUUfms9/6SI4+Hh68tD33
         OgxSAqyN8TxYgbqRISSoEdUW1xvmXboLo1FVDZxJcs35SpLHobJEWaydTyd+9OQrZDtb
         oy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768805182; x=1769409982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kqLqPuNeQ9LoUKY2rls1wS7JIycwWLBY+0fG8YdZGV8=;
        b=d9qeiI6FcHp7MRT23qupi6rH9llymrd5BQkpRcMpPs7shp6y5zqbwCRnMATZuvTrBd
         tKTQKGND447406YDFRXegE7Q7TFn9ZGkgRteP55dtbPUwhG7s9uRXEqFc705JZwnu0gp
         ezSEPalqu2+dXkqrHBiNZLKvs6t5kB/lxmCKipfg7itOtUeQ8wFt1AEIUaemVf2pJgXQ
         xDLnQ7zdNM+kFXXcZrGoVYv77D18TB5QkpEi5zhEH/Z4X1sGZSegtWaOcYXS/Qyu9RTK
         cOUfk5Q/7J2qrTfJs/1wAPCmU72kv070zd1qcBEt1Tt5MP4qtKiDWZ8bpagpqNPJQIPA
         C69Q==
X-Gm-Message-State: AOJu0YwaLcQ6YiShqil1mJoRqjQMXmQU+5R72e3I7OmFnnz306tB84bI
	bqlEhOzyHKEGegt1lVERLXUgIOjUFxtGqXKaweb2NkA9lQ1IgUlsW9VStUuU+D6ivHd4xUUIkhI
	Wzf2CWvd151D6/AqFmrXfAnsyMr79vTplkFAvpvxCvgyTLVZDNQkRD7i/YcG0+CO3dRFkYcOK/G
	NK725zddCJDkNmkig=
X-Gm-Gg: AY/fxX5GbTpvYquCgMB0ZrrOPxQeji9LteAu6nagw5B2L/i2eGg0zIsuM68TKwe8kKm
	XkdgrHniIENoY/mi4R7hV+mSy2g3zhVP11Rp/BN30a2Pj1wBZmwzO4CGOYl1ju0DcM9ekz9gMYp
	lwA05+zGMbeL33wMgRXwWNOrFOWLSsOQVtzPNjRyhaj1SexnhdDWifJSZyWcDFo0REk/h9om2c5
	khODGT7XzEynClZMmmAFIk84XbKThHd23q+V/r9CKKZDkSI0e+Ag8mC56ZYPew0mSfX798NXApA
	RmMFgxNLymczB6pp+j4K1UARGIYLsdpEuR7Ckb/EwmPpc5Hb5lQSzXzI4PzDFvhzBXa4Ndjn065
	KsKoDfzhuOYOXJgJGJB9nMhrhCr2ECfVyChMzEKe5MGe2z3MomL0n1vefmT0+7O2uyqfm5UPhvo
	ViVxgq9j5bRZV5ZzkJQVjX+wY=
X-Received: by 2002:a05:620a:404c:b0:8b2:f9ac:a893 with SMTP id af79cd13be357-8c6a6963888mr1330329285a.66.1768805181824;
        Sun, 18 Jan 2026 22:46:21 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8b2:f9ac:a893 with SMTP id af79cd13be357-8c6a6963888mr1330327885a.66.1768805181230;
        Sun, 18 Jan 2026 22:46:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d3dc63sm30726041fa.8.2026.01.18.22.46.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:46:20 -0800 (PST)
Date: Mon, 19 Jan 2026 08:46:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uki.bbclass: fix building of UKI images with multiple
 initramfs fstypes
Message-ID: <qatgc5yvubfyokn5iav6ftmwwx25j7bbn422u64g5v5xdu7pjr@nisbj4cwtbxt>
References: <20260107042345.2264330-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107042345.2264330-1-dmitry.baryshkov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1NCBTYWx0ZWRfX8sUEuyDFyLLa
 oJ48HcrOac0Me10ai40T/9xJEKkeoxAVcXmVsHImOptc5Aldfg1fIYjmGAoGn/NeuYU0Uz9a0Ez
 nWFd2zl0q4yVs57ERbvmtzI4m00vsJQp8o07/Mh78mWlfV6JnDDTQ4Yrqq9caLLx/P+tpVQitp6
 qt2ylH4dQnCZASwSjynN3Bl84JN4wJcEbhP4e+ymQ11x0boy+ah/cqJ1xVHASBHvSV69AS4JO+f
 TltRI7xxcDlAK0+u01kJZ1vgSuQ8OPPlJ3WgivwBpLMx0JZVy2jGxd3ai7rNf2eqMwZe35P3QjO
 Vdg8M0/axwlqS+ewu7RlboFJdFyOA+u0eQepM2MndOHRoagMsPchkzOoVZ7PXpBzAiddnx1MaN1
 lNn8WU7ZwBrzspf643BD+8NOox69zneyt0HE/vdd97yAZuKjNCInGvjJ9nNunFS6bEKKkXGhSO4
 mhpO+hb2Vkzo1PxIPnA==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696dd33f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NP7X1p83suDfSimL37UA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: uf7EjF6Hx2iNXijUQrIN7-TwNAXCmvmD
X-Proofpoint-GUID: uf7EjF6Hx2iNXijUQrIN7-TwNAXCmvmD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 06:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229592

On Wed, Jan 07, 2026 at 06:23:45AM +0200, Dmitry Baryshkov wrote:
> If INITRAMFS_FSTYPES contains more than one entry, ukify build command
> will fail as INITRD_ARCHIVE will contain extra strings. Use only the
> first initramfs type, letting the user to specify other fstypes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/classes-recipe/uki.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

And gracious ping. This was sent almost two weeks ago with no feedback
to it up to now.

-- 
With best wishes
Dmitry

