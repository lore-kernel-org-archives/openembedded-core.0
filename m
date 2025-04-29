Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61774C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:27:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.366.1745936812524123431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=EpYAgm81;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TASPVI013029
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWcbu5Tnl9T8g9mzUipYr96CCeDTTFtNkLafi2MzNsY=; b=EpYAgm81EWm9H1JE
	xaze9rblM65K/0ARJ4xeze3XCNRpWhcQiMmXbzGqj+nEVJMblwMkrcX223P/jRun
	MQipuDVQfeX+qptkXun+yJu5Mh8YW5yr+Rj6KRFOEkp1CTl5TzKY0+DPfJAhzH03
	+R2qsVMA47fQoLHLHcwL0F7yqeF7P5+kmFGUkOPBL1XpssXMJHlxYCGwdYZz7dDc
	jJU27egAfVBUaOBQYWdDbfYbwGFxP+851Gi3OdfFP6auUC85xDQpEJd0vKF7+/fx
	fJCQY2eefnmxhscd2yYbsdcZdDB1+YLiY6csgDPvEwe3GLyWMbrGe9JVuBPcYcrB
	teoldQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn3pxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:26:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff55so192779985a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 07:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745936810; x=1746541610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWcbu5Tnl9T8g9mzUipYr96CCeDTTFtNkLafi2MzNsY=;
        b=lqAx4F1k5qnicRneKGMZ98TolhLzLd5gyzo6xorZaJFIAUmgsqQvNeJTe2i7x0dBd2
         YeSu236p54JQ0/zj9+wGjqTZM9p0JqGVj+/XNONe9ZQl8kxcDfjYUbdKJJ6CgeVAttoJ
         XE+1sCdlT54MYOXPEP1p+cj5BADtK4VFk2UvvQxzOxXqz2MfJVkhy7jSRP17JruxWiRi
         Sr/6Mej9nzTxlEHrFGZzl3SlR068C9h63/tQYThTgenQOvZNrTuuH23B7Ju/ZcPuoVDQ
         6s7LYLp2rmQ9wQ0kvpmAqCRsefLYrOgYl+4x7IWzrHtJSP3hhRf8J8HIwFH+yfSxAe/o
         pkxQ==
X-Gm-Message-State: AOJu0YxFn5FEBR0zDj3AeMImqTiA3np9BuC6oVFoBUdD2XjJ9X7YnVfc
	KfA3FvKezNTYQhxiJR0oGYZxOWtsQkqKcC5e1Ry0ik/fKV7HweIkHDCDEe16DztJsQ8nFaBjs5a
	S1OlVu7Ty1+3XPMMtldxaYPOmtd0Op4uI9CBn1Ab39Zo+8dOQqiWKa+F5IhGtteyCeBEH9O4Mso
	YWc2Y=
X-Gm-Gg: ASbGncvfqZl8BiEb0K446g5VB9/J2Cdfz3UN0FjLaSVj1qNKOXQDdvGwWF+lWLPEeQh
	2eK4ZJbUe0bLNE+8SHABI8KDnx6hLnS3hJQ/830WyP5ugrzVxxpDPA2j2/PmCv4oTCfRofdZUrJ
	6gPFJacsF6NBTIm/pkXcV9JENenmvJBCvfkQYAsJ+6pMohM6erDJTF4s6VfDl2MmzRDaH24URTv
	UxPJZ0ycjoF5gbQfbqjYJEl+kLEvMDTU3tJw/XZ1i4fWBvEPtQak2TdY76YFvAjrxq7KvOyz/di
	mmF9C7iZe4wkEtcHQBOnFKg+qSjBavQiof82zeeFC5nh//IT4tb2yfWZK5JoAdH0ZuVmQ70EMFg
	=
X-Received: by 2002:a05:620a:4049:b0:7c9:4d4d:206e with SMTP id af79cd13be357-7c96685c344mr2249253985a.6.1745936810321;
        Tue, 29 Apr 2025 07:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcI6G7J1vN0CRInlj+o0Q1rpkz+bouECCfWLszHsXWLljlv5SVs99L36xFYAkPiLsiRCyqUw==
X-Received: by 2002:a05:620a:4049:b0:7c9:4d4d:206e with SMTP id af79cd13be357-7c96685c344mr2249246185a.6.1745936809619;
        Tue, 29 Apr 2025 07:26:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2629esm1892135e87.48.2025.04.29.07.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:26:48 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:26:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 08/10] mesa: Pass needed clang flags via
 BINDGEN_EXTRA_CLANG_ARGS
Message-ID: <hh7pwioghdwq7s5hjuhwuuch4pwsxmjmmpcgk5wn3za3cqjnk7@nxocxwugmmwy>
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
 <20250426-clang-merge-v4-8-42d205904261@gmail.com>
 <tims4g3kpjke7bfqfbvx2sfc5y2avhiyixn2sm7cgvwmwt7lid@3il6kjlvkpcd>
 <CAMKF1sq=x6caiTm_ixio56zVsg_rjLR9189vKHkQKzF7hD6HDQ@mail.gmail.com>
 <CAO9ioeWvPcSRt0kRNiPpnZQU+QDfMc9kbDZ_+PgzpLuzQJSbqQ@mail.gmail.com>
 <CAMKF1spY4-3SHT85oRU30SeLzYQA7kSvKczP6-OsHjwn7LNfZw@mail.gmail.com>
 <CAO9ioeXR2JRBLMw_r-yqB4gU4=DHe-6SYLxfEP-M+Y=14-QyOg@mail.gmail.com>
 <CAMKF1sqPLaSX7wBXReQYniW9fJm1mQY26pQwH4uzgjsYWH874Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zxz6w557zvthwm4t"
Content-Disposition: inline
In-Reply-To: <CAMKF1sqPLaSX7wBXReQYniW9fJm1mQY26pQwH4uzgjsYWH874Q@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 9rKVrKe1wTAFpVWgIW8u8IJYGHl1nGAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwOCBTYWx0ZWRfX+eL9Jyc/x1zc vKH76CO6OXff0K56WfSsKn/Q77X3PoQWt4NaNsIPmkrICzlXZUIYCfkkfWhsqkNvw1oPaBNRmW6 nGwQrttOB9TYmY68KJe9TnJDs/k6BlgfLIq0BEkAEAGVi9YfS3013d2GijvFm31h4kupUZMREkQ
 d1hz/MQE2V7IGh6BOTqFWj6VxmNqjVS4lqfSF8z9mxEGkYOvxIDjA5qOeIwgWIiK42xhmwON/1p Zl/3IGJs59CWd9q/Jld/GhqpMQSVeRTwxXcHVHv2tMXMhYctuorT56R6UtU4AIw18tWFgUfM0BF pVrudcw8CKb5cjttRUHie2PZJLK2ZYcfvhxwTa5JePiwKIOrbTMOccT1YOXH2j7DUM/N+8QkEOy
 uUTeaYgWqHiVD2BIPXzIKvvRoaVEyNXYKbkeb6rBHzQnLH8cFZlGcp+Xx0CoHlwLP4WUeCRq
X-Proofpoint-GUID: 9rKVrKe1wTAFpVWgIW8u8IJYGHl1nGAk
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6810e1ab cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=OeuxIFDhAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lB_GZ0-E04m_NCTqCtsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=keFKexZyN-4PHm5qui8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=USl8sPKdY6I_7jokSFGp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=425 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215666


--zxz6w557zvthwm4t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 53TASPVI013029

On Mon, Apr 28, 2025 at 04:33:30PM -0700, Khem Raj wrote:
> On Mon, Apr 28, 2025 at 4:03=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, 28 Apr 2025 at 20:10, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Mon, Apr 28, 2025 at 7:56=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Mon, 28 Apr 2025 at 17:51, Khem Raj <raj.khem@gmail.com> wrote=
:
> > > > >
> > > > > On Mon, Apr 28, 2025 at 4:03=E2=80=AFAM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > >
> > > > > > On Sat, Apr 26, 2025 at 08:16:47PM -0700, Khem Raj wrote:
> > > > > > > This is needed for clang to find the c++ headers when invok=
ed via
> > > > > > > bindgen
> > > > > > >
> > > > > > > Fixes
> > > > > > > | /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-p=
oky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:=
17:10: fatal error: 'cassert' file not found
> > > > > > > | Unable to generate bindings: clang diagnosed error: /mnt/=
b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2=
/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: '=
cassert' file not found
> > > > > > > |
> > > > > > >
> > > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > > > Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >  meta/recipes-graphics/mesa/mesa.inc | 4 ++++
> > > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > This way we have two sets of bindgen/clang args: one added by
> > > > > > meson.bbclass, one specific for mesa which you patch up here.=
 Please
> > > > > > pick up the attached patch instead, it makes sure that there =
is only one
> > > > > > place to specify bindgen args for Clang and documents the rea=
son for SDK
> > > > > > packages requiring special handling.
> > > > >
> > > > > This is breaking mesa-native recipe. Why is bindgen invocation =
special
> > > > > for meson? we have other recipes in
> > > > > e.g. meta-openembedded which pass this variable from recipes an=
d have
> > > > > finer control over
> > > > > recipe types that way
> > > >
> > > > mesa-native worked for me, what is your build configuration?
> > >
> > > I have this
> > > PACKAGECONFIG:append:pn-mesa =3D " opencl libclc gallium-llvm "
> > > PACKAGECONFIG:append:pn-mesa-native =3D " opencl libclc gallium-llv=
m "
> > > PACKAGECONFIG:append:pn-nativesdk-mesa =3D " opencl libclc gallium-=
llvm "
> > >
> > > and I am building for qemuarm64 on x86_64 host and sdkhost.
> >
> > Yes, this is my config too. I was building poky + these entries.
> > Anything distro-specific? Maybe a clang toolchain?
>=20
> No, I am using vanilla poky too. here is my local.conf
> http://0x0.st/8W4V.conf

See the attached patch.

>=20
>=20
>=20
> >
> > >
> > > >
> > > > Putting necessary arguments to meson cross file was a recommendat=
ion
> > > > from Mesa developers. I think we should follow it instead of patc=
hing
> > > > environment variable in recipes.
> > >
> > > Is this recommendation from meson too ? I think no, so we will be
> > > carry this locally moreover, meson
> > > is uses to build more packages than mesa and adding mesa
> > > recommendation for generic meson
> > > might not be ideal.
> >
> > I'd say, it is a meson recommendation - they added an entry to the
> > cross file instead of making everybody use environment variable.
> >
> >
> > --
> > With best wishes
> > Dmitry
>=20

--=20
With best wishes
Dmitry

--zxz6w557zvthwm4t
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="v2-0001-meson-correct-bindgen_clang_argments.patch"

From b88d59727572f7f65d40cd4eeeb4e42b61254429 Mon Sep 17 00:00:00 2001
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 13:59:01 +0300
Subject: [PATCH v2] meson: correct bindgen_clang_argments

Follow the changes in Clang search paths and specify sysroot via the
TOOLCHAIN_OPTIONS, otherwise clang will fail to find system headers when
executed by bindgen.

For SDK packages TOOLCHAIN_OPTIONS don't contain full sysroot path, so
specify the correct directory explicitly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/classes-recipe/meson.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index ef45a034a767..c8b3e1ec29a9 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -62,6 +62,14 @@ def rust_tool(d, target_var):
     cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
     return "rust = %s" % repr(cmd)
 
+def bindgen_args(d):
+    args = '${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}'
+    # For SDK packages TOOLCHAIN_OPTIONS don't contain full sysroot path
+    if bb.data.inherits_class("nativesdk", d):
+        args += ' --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}${prefix_nativesdk}'
+    items = d.expand(args).split()
+    return repr(items[0] if len(items) == 1 else items)
+
 addtask write_config before do_configure
 do_write_config[vardeps] += "CC CXX AR NM STRIP READELF OBJCOPY CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED"
 do_write_config() {
@@ -93,7 +101,7 @@ cpp_link_args = ${@meson_array('LDFLAGS', d)}
 [properties]
 needs_exe_wrapper = true
 sys_root = '${STAGING_DIR_HOST}'
-bindgen_clang_arguments = ['-target', '${@d.getVar('RUST_HOST_SYS')}', '-I${STAGING_INCDIR}']
+bindgen_clang_arguments = ${@bindgen_args(d)}
 
 [host_machine]
 system = '${@meson_operating_system('HOST_OS', d)}'
-- 
2.39.5


--zxz6w557zvthwm4t--

