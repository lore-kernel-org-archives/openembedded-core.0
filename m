Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE25C36010
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 10:55:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.8419.1743159323279532000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 03:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Rz8IbL2/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S5P5ad002247
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1EflF8YPWy3ZmBo6VbC/SFKX
	eoJxgIXuZkyaxJ0BidI=; b=Rz8IbL2/XcF96Yv8EOcOK2LHVRK+dY7W/QO4Kqlr
	+G87FU11H89Dj+fEUBvDHDisiOVwmMDDOKgGcHNAhCdjtvr5FIhWuKTaRur1nkMn
	fcKcJDufnbefOJXw1GsXcKO8NNy8XZn4yTvDLZkFX7Rc0/W6Ch0DlYTMrCoxY3nI
	kpNKFGOTsdSZxqWkKkKfoRulcTOAWUBu95UVxD7vBwPUfnImQHkXdRkxf+tmOd4R
	yCc9qYYOQLcKBQpT+sKx6GLDfejZUCn5RvstiD3Hb6BQPgvTDv0woi8OM1mB7z/e
	KGLfA92UFdc6zIRLxEPiCqZGnWi046GOk8R8IajB2UQcTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xe1fp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:55:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ac559cbaso336829185a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 03:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159321; x=1743764121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EflF8YPWy3ZmBo6VbC/SFKXeoJxgIXuZkyaxJ0BidI=;
        b=xF6ho84Yx2BMhdM0g6RMDyCk7RXrdSJmv1innEDSVsYEOy9Stswd/LhQZ1QTWEoQQx
         Q5ZbwHUb0u22TL6j66JBL6dzRS2KMmM6690E7yB/CJU1vFsroHmDNlQ38syMfOo2ptPI
         52W46MGnf6h6zTuimmafaCCqfXN8hONgsNUGMzxV7dqDQhVZ7g/bAbDObJ/YQVge6QVX
         nu0VGHpQLF9jjh3W7sZo7vehhzpnN4Tbe7GopQBoO7khNKQy1Vl23dZzgXlPXnKhnN3j
         10ldar3bzRG9C5ZfGHAk3pTIngIsAZGG9HTP0fQVztR3TG/OcUWdecVM97Xr8oaRChcX
         v9vQ==
X-Gm-Message-State: AOJu0YzD+SoU9SybIcVDhHaILriM5i2LhaJQovD+CrrRjaXB6LaBN4ma
	+MQfWx/hdX9lVomSDawnXqgIMqT655XTjoq6D8hvfemzzc92dcauJ4/0m/HBuE6Eak0y64adwaI
	5HHeS3hlxOZSMYDBWUwfG6GJyZQzcU2DDIb43/vl9mm8+5QxA6jBMFmMfJwV2mB4u4HIqJTQL9W
	dgQgc=
X-Gm-Gg: ASbGncve9Y1tHHF9bVv4Y+ErDGHcSmIuh5M74QZ00cPbswWeY//IZJN/f8XWsQjeo5U
	Pg0g5UxwIAb8j/YrEiG5Jcne8lZEQfBgqPpAoal/YrOZd63dORQa22yDJ2Cnpi2K3Rsedj4bSGz
	++KqvJk6ZIxm5EHIRfW9rE5Qcy2RukeFGa96u1z+hq+vTuxskBO4fmitpZIC06m50ZqacpfI6sx
	MjHhyDL1nKCHPyOnA87cW+Rp6UqGjiMz/6R8uLGpkesX8iTAyViuBHa0/yrVfoY9bWuvI4vv5Bc
	qovQYxkQx7/YSnk+A3b61bMM5tjQjCDwR1YmdsI8BZ0b7RKFNRS3mbHv+Ax/ICCG9BzpRFP8WMa
	tHV4=
X-Received: by 2002:a05:620a:2608:b0:7c5:46e4:480b with SMTP id af79cd13be357-7c5ed9f53f0mr989764085a.22.1743159321329;
        Fri, 28 Mar 2025 03:55:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6MKGpyhE0VkqrvsfIGoFjTlN8cBXE7EMibf6ueV+Bh1k1BTbFUQvCOJlU5sKjpn3jFN6Yrg==
X-Received: by 2002:a05:620a:2608:b0:7c5:46e4:480b with SMTP id af79cd13be357-7c5ed9f53f0mr989760485a.22.1743159320701;
        Fri, 28 Mar 2025 03:55:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a090csm262338e87.228.2025.03.28.03.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:55:18 -0700 (PDT)
Date: Fri, 28 Mar 2025 12:55:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/7] llvm: support building libclc
Message-ID: <topj74a24moa3p6cl3w6nky35wkhisb773ogczfw3schsgybcp@5m3cjhkzpyxw>
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250327221807.2551544-4-dmitry.baryshkov@oss.qualcomm.com>
 <CANNYZj-hV3C1L6QYJhk0kq_Bj8PkjsWmjnyi16FbSqW1sRP70g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-hV3C1L6QYJhk0kq_Bj8PkjsWmjnyi16FbSqW1sRP70g@mail.gmail.com>
X-Proofpoint-ORIG-GUID: czDVLshqgm1NZ7j9UHmSsCxUXoxJvs3D
X-Proofpoint-GUID: czDVLshqgm1NZ7j9UHmSsCxUXoxJvs3D
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e6801a cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=Twlkf-z8AAAA:8 a=Q4-j1AaZAAAA:8 a=sRVOIjmuW8TvGFsoP8oA:9 a=CjuIK1q_8ugA:10 a=a97rIl97qucA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=-74SuR6ZdpOK_LpdRCUo:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=953 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213826

On Fri, Mar 28, 2025 at 10:35:37AM +0100, Alexander Kanavin wrote:
> On Thu, 27 Mar 2025 at 23:18, Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> > +Fix variables being passed to cmake when generating NATIVE build dir.
> > +
> > +Upstream-Status: Inappropriate [OE-Specific build-system fix]
> 
> Please write a better, detailed explanation of what the patch does.
> Why do we need it in the first place?

ack

> 
> > -LLVM_TARGETS ?= "AMDGPU;${@get_llvm_host_arch(bb, d)}"
> > +LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
> 
> Why this addition? Needs to be explained in commit message.

ack, I'll split it to a separate patch

> 
> > +LLVM_PROJECTS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'clang;libclc', '', d)}"
> > +
> 
> Same.

Well... This is kind of described in the commit message, but I will
expand the clang part.

> 
> > +                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
> > +                  -DLLVM_NATIVE_TRIPLE='${BUILD_SYS}' \
> > +                  -DLLVM_NATIVE_C_COMPILER=\'${@ d.getVar('BUILD_CC').replace('ccache', '').strip()}\' \
> > +                  -DLLVM_NATIVE_CXX_COMPILER=\'${@ d.getVar('BUILD_CXX').replace('ccache', '').strip()}\' \
> > +                  -DLLVM_NATIVE_C_FLAGS='${BUILD_CFLAGS}' \
> > +                  -DLLVM_NATIVE_CXX_FLAGS='${BUILD_CXXFLAGS}' \
> > +                  -DLLVM_NATIVE_LD_FLAGS='${BUILD_LDFLAGS}' \
> 
> Same.
> 
> >  EXTRA_OECMAKE:append:class-target = "\
> > @@ -89,6 +101,8 @@ EXTRA_OECMAKE:append:class-target = "\
> >                    -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
> >                    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
> >                    -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
> > +                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
> > +                  -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
> 
> Same.
> 
> >  EXTRA_OECMAKE:append:class-nativesdk = "\
> > @@ -96,6 +110,8 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
> >                    -DLLVM_HOST_TRIPLE=${SDK_SYS} \
> >                    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
> >                    -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
> > +                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
> > +                  -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
> 
> Same.
> 
> >  # patch out build host paths for reproducibility
> > @@ -124,11 +140,26 @@ do_install() {
> >
> >          # Remove opt-viewer: https://llvm.org/docs/Remarks.html
> >          rm -rf ${D}${datadir}/opt-viewer
> > -        rmdir ${D}${datadir}
> > +        rmdir ${D}${datadir} || true
> 
> Same.

Ack

> 
> > +    # Remove clang bits from target packages, we are not providing it for the system
> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
> > +       [ "${CLASSOVERRIDE}" != "class-native" ] ; then
> > +        rm -f  ${D}${bindir}/clang*
> > +        rm -fr ${D}${libdir}/clang
> > +        rm -fr ${D}${datadir}/clang
> > +
> > +        rm -f  ${D}${bindir}/scan*
> > +        rm -fr ${D}${libdir}/libscanbuild
> > +        rm -fr ${D}${datadir}/scan-build
> > +        rm -fr ${D}${datadir}/scan-view
> > +
> > +        rm -fr ${D}${libdir}/libear
> > +    fi
> 
> Why does this need to be done, if we're only adding libclc? Is it
> dependent on those bits being built?

This definitely is described in the commit message: 'Don't install clang
into the target system, it is only used during the build process.'

> 
> > +PROVIDES = "libclc"
> > +RPROVIDES:${PN}-clc += "libclc"
> 
> Why these additions?
> 
> Alex
> 

-- 
With best wishes
Dmitry

