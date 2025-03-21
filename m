Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73922C36001
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 00:57:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.20728.1742562588411132305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=m/YvWAmu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCSdmZ026093
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xjeex5hKgcDkEjt6seeiyk7i
	rQ04vaxIdL/sb6YXhY8=; b=m/YvWAmuJD3XVogftZN6i4dfZ3dX6/0pK0kx5EAJ
	TeQeLfs9dferqu5mejqZcE1gbdm6uLFK1F4fia105XYLc3RjzeNKqc4HWbXb9QGg
	dR1sdjWaQHOc4Hi65I18B2NGrJ+NC/fHIJ11HqJ9z3L7aSbjc4IL+O/xE17c7Uw8
	emRV3oYGpAI1H8UiUwlJXk6lWxXX9FQKL55jMja9WPSWPdl6PN1v5U6/8ZmQMZKS
	W5SxWG+IITS3tHpB5NAMJD8Xz9GGwx40/6G9+2voD/6k/IrqT55MlS8+oxTn37ZT
	RtXYj5e3QkC4F9WCk5MHWPxWNNgmj1b+U9xREB7TAHiiEQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h854g3v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:09:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff68033070so2962004a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562587; x=1743167387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjeex5hKgcDkEjt6seeiyk7irQ04vaxIdL/sb6YXhY8=;
        b=AdvSFXM9pvOa+ZNYwEgN3pNEA30laB2nzFRT0cu1flGLjd9HqNNIIeaddzqXTIChQB
         Hg6BB7Apo6TivVOj9VcHnr/Jni9G9HG1snsyWhKQEcpfwOL/hwUkMK6yCe096/DI8eUZ
         DXwey/l8gJZZc9FXmtGQaCaM8OsCu3E8xmcevCRnb7RUPR96NaoUlFs8qEhEqJ4LFXhK
         gxq873R0jZmKA+1UWnE884VoIKxGZyry4PAnri199KXSbO5ALt/vI7LXG0yOwACkGyae
         gFjc6wqjyB9iXEsP24AjME1gudkTueFtx4mK/bRF/6aHIFN0aos0ZWej3MHgWPe+xOnX
         l21A==
X-Gm-Message-State: AOJu0YxXp2WbNXzLb6PK3Bsum9qu5rhfT/bOvObQDPazEdf6ZShPuyGk
	pumN7W/Qs5UyS7Xd9jq4eXsSK4PHmT/w83BmzrJoOnnN9KDAtLutUrYqme5x7+2kGlZvsRzx79S
	RrRZ8xV3H3IylEQ+ylYCNhi112Gfvp8Ai+mpRyJGPXtVzddo7Sn97BBS3JpbXODpik1I3KW7F2h
	9JmYmk2kfoZG845WxcrUdPJQsjL2TRg4P2hB0sd49mje88lgj2GNBYcQ==
X-Gm-Gg: ASbGnctdgbo48L0fOE3qA/YJ/1WrF3F1hmWQlhMRwnAhIFNBwNJ1akeGdnTZ5RzjHOF
	uXd/7txUH76BmzhXPI16kEZuK6+l4OyC3ksKzqsXFRUAox8r8+v/fakI2Rx9HZNdkKHS/ip6J+e
	6IHx2R/jAvwjTXva1h09+m8Yc2ODAg
X-Received: by 2002:a17:90b:1811:b0:2fe:d766:ad95 with SMTP id 98e67ed59e1d1-3030fe89e3bmr4869998a91.9.1742562586658;
        Fri, 21 Mar 2025 06:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZmJ03YamwPYtXaqJDnGe+fdxsRkh8usxt0oRy4zyLA3LsXHfaLU+Whz1vqdVSzJEYPJHJJ1xbGbs5oAXbN9A=
X-Received: by 2002:a17:90b:1811:b0:2fe:d766:ad95 with SMTP id
 98e67ed59e1d1-3030fe89e3bmr4869967a91.9.1742562586198; Fri, 21 Mar 2025
 06:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250320121533.39356-1-peter.marko@siemens.com>
 <exidjcjvhfkvob7yns4tubsqeuajetel5ezaa3gu7aezbksvp3@fuknr23vph64> <AS1PR10MB56971AE062D6D2F26A6BFA7BFDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56971AE062D6D2F26A6BFA7BFDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 15:09:35 +0200
X-Gm-Features: AQ5f1Jophav3V6H2gvI-laKmfK8imNO6lqV4KyvlId7OKA7JGGqnmSwj9vQKWfU
Message-ID: <CAO9ioeWYGPC0nvsRocPPiJ-ZVicVsoX3oL5-RvGJ33kAXdp==w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] spdx30: handle links to inaccessible locations
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
X-Proofpoint-ORIG-GUID: RDjwEltYZ_IhHQR1q9CoJG9EnYUjkFZx
X-Authority-Analysis: v=2.4 cv=ZtHtK87G c=1 sm=1 tr=0 ts=67dd651b cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=a_U1oVfrAAAA:8 a=EUspDBNiAAAA:8 a=Q4-j1AaZAAAA:8 a=NohTf2-OhClZ1b--xSYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: RDjwEltYZ_IhHQR1q9CoJG9EnYUjkFZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210097
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Mar 2025 00:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213491

On Fri, 21 Mar 2025 at 14:58, Marko, Peter <Peter.Marko@siemens.com> wrote:
>
> I think there is something else breaking your build.
>
> My commit changed function create_rootfs_spdx.
> That should not influence recipe spdx code...
> Did you try a build with my commit reverted?

As I wrote, reverting it makes the error disappear.

>
> Peter
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Sent: Friday, March 21, 2025 13:38
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH] spdx30: handle links to inaccessible locations
> >
> > On Thu, Mar 20, 2025 at 01:15:33PM +0100, Peter Marko wrote:
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > This is the same as e105befbe4ee0d85e94c2048a744f0373e2dbcdf on
> > > additional place in the code.
> > >
> > > When a link is pointing to location inaccessible to build user (e.g.
> > "/root/something"),
> > > filepath.is_file() throws "PermissionError: [Errno 13] Permission denied".
> > > Fix this by first checking if it is a link.
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  meta/lib/oe/spdx30_tasks.py | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > This commit breaks building recipes here:
> >
> > ERROR: quilt-native-0.68-r0 do_create_spdx: Error executing a python function in
> > exec_func_python() autogenerated:
> >
> > The stack trace of python calls that resulted in this exception/failure was:
> > File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
> >      0001:
> >  *** 0002:do_create_spdx(d)
> >      0003:
> > File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-
> > core/meta/classes/create-spdx-3.0.bbclass', lineno: 135, function: do_create_spdx
> >      0131:    "
> >      0132:
> >      0133:python do_create_spdx() {
> >      0134:    import oe.spdx30_tasks
> >  *** 0135:    oe.spdx30_tasks.create_spdx(d)
> >      0136:}
> >      0137:do_create_spdx[vardeps] += "\
> >      0138:    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
> >      0139:    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
> > File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-
> > core/meta/lib/oe/spdx30_tasks.py', lineno: 537, function: create_spdx
> >      0533:            )
> >      0534:
> >      0535:    cpe_ids = oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"),
> > d.getVar("CVE_VERSION"))
> >      0536:
> >  *** 0537:    source_files = add_download_files(d, build_objset)
> >      0538:    build_inputs |= source_files
> >      0539:
> >      0540:    recipe_spdx_license = add_license_expression(
> >      0541:        d, build_objset, d.getVar("LICENSE"), license_data
> > File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-
> > core/meta/lib/oe/spdx30_tasks.py', lineno: 408, function: add_download_files
> >      0404:                    creationInfo=objset.doc.creationInfo,
> >      0405:                    name=file_name,
> >      0406:                    software_primaryPurpose=primary_purpose,
> >      0407:
> > software_downloadLocation=oe.spdx_common.fetch_data_to_uri(
> >  *** 0408:                        fd, fd.name
> >      0409:                    ),
> >      0410:                )
> >      0411:            )
> >      0412:
> > Exception: AttributeError: 'FetchData' object has no attribute 'name'
> >
> > ERROR: Logfile of failure stored in: /home/lumag/Projects/RPB/build-rpb/tmp-
> > nodistro/work/x86_64-linux/quilt-native/0.68/temp/log.do_create_spdx.3116916
> > ERROR: Task (/home/lumag/Projects/RPB/build-
> > rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-
> > native_0.68.bb:do_create_spdx) failed with exit code '1'
> >
> > Reverting this commit makes the error disappear.
> >
> > >
> > > diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> > > index 0618f2f139..bba11ae930 100644
> > > --- a/meta/lib/oe/spdx30_tasks.py
> > > +++ b/meta/lib/oe/spdx30_tasks.py
> > > @@ -1068,7 +1068,7 @@ def create_rootfs_spdx(d):
> > >          filenames.sort()
> > >          for fn in filenames:
> > >              fpath = Path(dirpath) / fn
> > > -            if not fpath.is_file() or fpath.is_symlink():
> > > +            if fpath.is_symlink() or not fpath.is_file():
> > >                  continue
> > >
> > >              relpath = str(fpath.relative_to(image_rootfs))
> > >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

