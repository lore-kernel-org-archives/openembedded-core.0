Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CA0C36002
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 00:57:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.5318.1742577473495085348
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 10:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TrepEgwM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATBjV016515
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 17:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nRiNK5ba4mISWWJfr+9g56hb
	MvJ0trcIiHyY36+oTLE=; b=TrepEgwMIdf4ZYUVC53HDuVRw31yCx/aPPsztQdL
	vJUPMPSba3JTzIilG4fSragzz/Cb+oRMffZGfkjJ9olP80dtZWVxRBkCXGlBN/Ng
	14F48aiUYOY5DpfkoFGelaV3Rd0aVtcqHodR9bcKecEgJuwNG/0CkOOFd98xmmJC
	62uUGZR24omB1I8DR0S3zpf0hjC5VWNIAEk6eujwGx0P/++EshWzZEDPSYPVViLP
	J7GSxznoAUT25dR8IYOsC4eNlbEmpCWp0ftaD863hgvxGUiPdacY/viI7hQGhDym
	XUQrc13vJMyMJAUARx7FijEi9hVHC+Jh92Z4ja30EutZ6w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd1djqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 17:17:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e917965e3eso29195236d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 10:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577471; x=1743182271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRiNK5ba4mISWWJfr+9g56hbMvJ0trcIiHyY36+oTLE=;
        b=P3SU/r84/aeXw2sSBjxBQBRVCSq9kfTbeZo1pnl8FSPimME1Xp6J9KCTttxlx+qsp0
         Cr+2EpSUsj0Po9GMZwrV0gnf4Hp6RWLduk2NozfFvPtcgLqZ+vjLWCQ5sisjrD1Rxg7n
         6MCQnQeFjpJKISNKEtKqYjLSqVnHsNlYmiReJT9ZvC/rPVPe8C2N1eLzUeT3Qgh0zxNv
         4FvX3xUO7mjQEvgvkhR1tdxJWtRNgak3gj6RfMyUqtaLBHkyySB9JHI1McWTVrOlBKCN
         EoNgeIaWVUS31yrn7IcjUqjeLFi2P1HKxxIuLQipIGVFO6MsqgHtuRjnuftBgsmRTpN6
         fa1g==
X-Gm-Message-State: AOJu0YwHW7w0CJEAjzu3VtzWVojeIaEOvmAj1jZ09B4oCq+ak5IbHECV
	xKNSqTgYIZJbli8xAZuOJSvSsi64tg04vjW5LhIE3logPdRjh6yX5x8UwfmPU1dPkmPZpYUN4g1
	+uQLU/kN92kWd2VFDJktlZgBSbXTMQXd2ugw2K6PKlrIXSZ5EBmib28mf3RAbNe5/FDaTOQUhwd
	YIEcg=
X-Gm-Gg: ASbGnct1PeluwSzSb7Ccv3sk787EC+73q5gdzHFpjNwIjPKuBR2xKHD/FZTHliBce/Q
	Bzt0FcN1Liw4cD5MSFr/Ypfqf0EmJZnNOeOsM29kIRDfY79ZLgHq2oubwn+piXBV/3hoJHTA+3m
	sFApKSEIgw5MyT6ZnoZ28jJxMqXWLWmtVjOdgmoKAbE/7+NXyK8TekGttFyY3aabcp7+PAKSa86
	eYn/pUjU1g9O7cAoa+D7HDtd3nGqCRBOebIbZZC9wSg0VwCREXm0Ij3gXhHcvgkkNAHG53Y4DBX
	TJ4PiT+Mfbu2T4lLd98z6d0Pl8nxNfxbCYLDlW8y5M94Y69Ud3+umLUdzLIiB0rMEIqkad1raO/
	IK3I=
X-Received: by 2002:a05:6214:202d:b0:6e8:8d15:2d3d with SMTP id 6a1803df08f44-6eb3f36c12fmr53590006d6.40.1742577471464;
        Fri, 21 Mar 2025 10:17:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6M0ubwJDrsgnx5o98YIgnDQb4bOEC9VNyoAvs7teBTrFbjVy2VJhi5nTZ121GSOK/JMzC4A==
X-Received: by 2002:a05:6214:202d:b0:6e8:8d15:2d3d with SMTP id 6a1803df08f44-6eb3f36c12fmr53589546d6.40.1742577470858;
        Fri, 21 Mar 2025 10:17:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7c19c3sm3061231fa.4.2025.03.21.10.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:17:50 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:17:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] spdx30: handle links to inaccessible locations
Message-ID: <r6pqdclhbby5zubgv2t6mvcyhsc24gsytafxvhu446lqbwaccr@pbttvvdejy2a>
References: <20250320121533.39356-1-peter.marko@siemens.com>
 <exidjcjvhfkvob7yns4tubsqeuajetel5ezaa3gu7aezbksvp3@fuknr23vph64>
 <AS1PR10MB56971AE062D6D2F26A6BFA7BFDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAO9ioeWYGPC0nvsRocPPiJ-ZVicVsoX3oL5-RvGJ33kAXdp==w@mail.gmail.com>
 <AS1PR10MB569770D1D3320698B188A26EFDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AS1PR10MB569770D1D3320698B188A26EFDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dd9f40 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=a_U1oVfrAAAA:8 a=gYUuNBwdICu0KR1b5QMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: E1_Wg3f5R1dd5RK7a5Y7AQR75qYLRXdG
X-Proofpoint-ORIG-GUID: E1_Wg3f5R1dd5RK7a5Y7AQR75qYLRXdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210127
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Mar 2025 00:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213492

On Fri, Mar 21, 2025 at 01:49:07PM +0000, Marko, Peter wrote:
> I believe that you have a problem with:
> * commit https://git.openembedded.org/openembedded-core/commit/?id=4859cdf97fd9a260036e148e25f0b78eb393df1e
> * commit https://git.openembedded.org/bitbake/commit/?id=2515fbd10824005fa7f34e87706000c079920366
> Using new oe-core without matching bitbake change will lead to unknown attribute name since it was changed from names to name in both commits together.
> 
> I can cleanly build core-image-minimal with spdx3 from latest poky master (which contains matching oe-core and bitbake versions).
> Maybe you have reverted whole oe-core update and not just my commit when looking for the breaking change?

Most likely I was unfortunate or there was some repo issue. Afre running
`repo sync` again, the build succeeds even without a revert. Please
excuse me for the noise.

> 
> Peter
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Sent: Friday, March 21, 2025 14:10
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH] spdx30: handle links to inaccessible locations
> > 
> > On Fri, 21 Mar 2025 at 14:58, Marko, Peter <Peter.Marko@siemens.com> wrote:
> > >
> > > I think there is something else breaking your build.
> > >
> > > My commit changed function create_rootfs_spdx.
> > > That should not influence recipe spdx code...
> > > Did you try a build with my commit reverted?
> > 
> > As I wrote, reverting it makes the error disappear.
> > 
> > >
> > > Peter
> > >
> > > > -----Original Message-----
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Sent: Friday, March 21, 2025 13:38
> > > > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > > > Cc: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core][PATCH] spdx30: handle links to inaccessible locations
> > > >
> > > > On Thu, Mar 20, 2025 at 01:15:33PM +0100, Peter Marko wrote:
> > > > > From: Peter Marko <peter.marko@siemens.com>
> > > > >
> > > > > This is the same as e105befbe4ee0d85e94c2048a744f0373e2dbcdf on
> > > > > additional place in the code.
> > > > >
> > > > > When a link is pointing to location inaccessible to build user (e.g.
> > > > "/root/something"),
> > > > > filepath.is_file() throws "PermissionError: [Errno 13] Permission denied".
> > > > > Fix this by first checking if it is a link.
> > > > >
> > > > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > > > ---
> > > > >  meta/lib/oe/spdx30_tasks.py | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > This commit breaks building recipes here:
> > > >
> > > > ERROR: quilt-native-0.68-r0 do_create_spdx: Error executing a python function
> > in
> > > > exec_func_python() autogenerated:
> > > >
> > > > The stack trace of python calls that resulted in this exception/failure was:
> > > > File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
> > > >      0001:
> > > >  *** 0002:do_create_spdx(d)
> > > >      0003:
> > > > File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-
> > > > core/meta/classes/create-spdx-3.0.bbclass', lineno: 135, function:
> > do_create_spdx
> > > >      0131:    "
> > > >      0132:
> > > >      0133:python do_create_spdx() {
> > > >      0134:    import oe.spdx30_tasks
> > > >  *** 0135:    oe.spdx30_tasks.create_spdx(d)
> > > >      0136:}
> > > >      0137:do_create_spdx[vardeps] += "\
> > > >      0138:    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
> > > >      0139:    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
> > > > File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-
> > > > core/meta/lib/oe/spdx30_tasks.py', lineno: 537, function: create_spdx
> > > >      0533:            )
> > > >      0534:
> > > >      0535:    cpe_ids = oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"),
> > > > d.getVar("CVE_VERSION"))
> > > >      0536:
> > > >  *** 0537:    source_files = add_download_files(d, build_objset)
> > > >      0538:    build_inputs |= source_files
> > > >      0539:
> > > >      0540:    recipe_spdx_license = add_license_expression(
> > > >      0541:        d, build_objset, d.getVar("LICENSE"), license_data
> > > > File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-
> > > > core/meta/lib/oe/spdx30_tasks.py', lineno: 408, function: add_download_files
> > > >      0404:                    creationInfo=objset.doc.creationInfo,
> > > >      0405:                    name=file_name,
> > > >      0406:                    software_primaryPurpose=primary_purpose,
> > > >      0407:
> > > > software_downloadLocation=oe.spdx_common.fetch_data_to_uri(
> > > >  *** 0408:                        fd, fd.name
> > > >      0409:                    ),
> > > >      0410:                )
> > > >      0411:            )
> > > >      0412:
> > > > Exception: AttributeError: 'FetchData' object has no attribute 'name'
> > > >
> > > > ERROR: Logfile of failure stored in: /home/lumag/Projects/RPB/build-rpb/tmp-
> > > > nodistro/work/x86_64-linux/quilt-native/0.68/temp/log.do_create_spdx.3116916
> > > > ERROR: Task (/home/lumag/Projects/RPB/build-
> > > > rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-
> > > > native_0.68.bb:do_create_spdx) failed with exit code '1'
> > > >
> > > > Reverting this commit makes the error disappear.
> > > >
> > > > >
> > > > > diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> > > > > index 0618f2f139..bba11ae930 100644
> > > > > --- a/meta/lib/oe/spdx30_tasks.py
> > > > > +++ b/meta/lib/oe/spdx30_tasks.py
> > > > > @@ -1068,7 +1068,7 @@ def create_rootfs_spdx(d):
> > > > >          filenames.sort()
> > > > >          for fn in filenames:
> > > > >              fpath = Path(dirpath) / fn
> > > > > -            if not fpath.is_file() or fpath.is_symlink():
> > > > > +            if fpath.is_symlink() or not fpath.is_file():
> > > > >                  continue
> > > > >
> > > > >              relpath = str(fpath.relative_to(image_rootfs))
> > > > >
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> > 
> > 
> > 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

