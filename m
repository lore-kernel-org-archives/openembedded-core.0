Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6537BC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 17:25:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.11922.1745601910028634392
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 10:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cMw6Uyd1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwTs011506
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LST8t3NLOWNp5VJTutTK1vwd
	ND0FFht60/5J1BrpZqI=; b=cMw6Uyd1ZBYMx9veOIQnQ55Jiqj/bNRdEEHWEzsU
	63UuUOp1s+m9RKK53yBByHj80DmkoSPKDsHf8bxLLZSGYnz2/qYyllb7Z6PQUs3V
	K2ebDwb4Hz7Y+OX+dXmxQm0kx9YhiktBdesBbp0vuw1dPe6UsSYrI1LPkEaddJcC
	zqOso3/JnLIsD51996jYumgRNqfgiboy2rNsypJNfkZaQwZm4tAAZ+7xknuH0SyD
	9FJ394TrOBT0PvQVRWpyPB2X3FkTVsPPeD+aEGCwJ2ziaPbPfNYi2A9+LqbVifwl
	Onw0Q3V9Xxs+ffIVyv728Sj4LiVkIrRqnVemqdF2bQx3Og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3srns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:25:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c579d37eeeso371370785a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 10:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745601908; x=1746206708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LST8t3NLOWNp5VJTutTK1vwdND0FFht60/5J1BrpZqI=;
        b=Tjx3ho+eCq93qJk8NmOHL7OHd3p6+lenw5Jb3KRahjTl7FRmFrykMjRV9hzFQXB7WW
         rjwpXXOLpI6KP6954gx2clRe5mdp3RFA/7tHdSOebppwgSxdlPMaHyAcsjtsVbakdits
         K0TddXyX4npacs8JR6eKl0RxP7aXn0h8Ut0N3K7cnOKA7RhHey8Ql52KkY5Rv6ZomCSN
         OlcUw0kfPYo2fJFktBEt9KwUqQi9EVncSik0fgYd8UTzMqwFOT23EegSkc1Lzj22IkTj
         UcjxyfzCDvkoKnf+AKIxYOwvP3HyQIoYMqZCAG1JJVIp10dZsXBk5lLg2LNlrLnZHnvT
         C3YA==
X-Gm-Message-State: AOJu0YwZ5vjWSV04xgxmG6YItrb5cVNNy5iWYHPUv31QGF4djQ1W+i4W
	LAiksHlmTp15kn/yN2RCL8vkHs1t06XflCfNxnBH3mJbY6FcJ6EMwYVwSTumA/rAA18nSjROVRU
	fzSuJdCFCMRlxvuNlLn9t+ceXvxwa9CTkYvqc/DNzB8sgtc5ar9qGs3CS31kflY0UDzao5l2KAR
	XEn8CwbHOuyhk=
X-Gm-Gg: ASbGnct3tI/nwj/b2pztiTqVIuBe/sjwnJ7Fb/NOMhKwjs1lU+ExZFwtJjzQHy0iO4x
	vB7XYn227W2SVj2j53CfUN2vmqfzPRqFdxKZo8r/x7srSuw19EKN8h1jA3U5dBxkrHn14u4/GK7
	cIqzESaSHaCQsRJGpSai+v5Ks2cL9aAFAtOo0STBQb2mqSy37vUpZ6MsF9qvGip4O5GjlJiWhC5
	0yMHzY/bWM6NEZ7cKvz4aqlg/yyJzzvuwbF6emMuwkBZzVVcjIa4AOThE+VqLI516KYa40WIoGf
	cDfRsQjCo+/9Z8ak7mvRYUZrFM+lPDPZFiRq4BlxD6KXoMAt4DOjp7UZqG+7CmabnmkWuyi3DBQ
	=
X-Received: by 2002:a05:620a:2989:b0:7c9:245f:bacd with SMTP id af79cd13be357-7c9668d64eemr65370385a.58.1745601907628;
        Fri, 25 Apr 2025 10:25:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/D8S0Qo4qJfDfjzL1X3lLB0Qi2S5FK49Q9tB3YbIZzeiR8ZBHAX5Whv0bKyjuArHTe2FWgg==
X-Received: by 2002:a05:620a:2989:b0:7c9:245f:bacd with SMTP id af79cd13be357-7c9668d64eemr65364485a.58.1745601907117;
        Fri, 25 Apr 2025 10:25:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2586esm675370e87.37.2025.04.25.10.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:25:06 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:25:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/11] clang: Merge llvm/clang family recipes from
 meta-clang
Message-ID: <w3wiv33zo4iq6eggct4ndzid75cjs5c5pjmtuamt6eb5bykk4h@vjdxhx5ejo5l>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-4-5a492a8461aa@gmail.com>
 <dc33o5zfonkcdpo2aiysfqdscradhjofwmmzqvbst2qle3jp6r@4owhwxoyqnq2>
 <15f9090e-c10a-4985-8ddf-28876c4bc964@gmail.com>
 <r5ckieoedu56jjzufc2cvbufb557z62bcjsredjb6552ywaktk@sictodhm4k4u>
 <d022bc5a-c1c0-4b74-a3f1-079a8311a0a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d022bc5a-c1c0-4b74-a3f1-079a8311a0a5@gmail.com>
X-Proofpoint-ORIG-GUID: UyfspFtftBfFtzUKFyyeXp4otiKQeaZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfX5fYwpSsVIjxV oIuSCw9e6yNwcP5HkrogxZ5q6sCVSedPpsXfFotb6JkvigEfuCk6RalwVn3mWEGcwaQkfDkzK1t pzI64ZoPD+YcwAKYB1ViNtTDTFP1xK6K8sAyW3PEnYgtmE/9kXZ/+8iBD6OlH1d+FQF4Sb+IrT6
 eZmtOnZWbWkIu6NGhnPGMwqn3y5QQ588U4RyCQvFjVBqMYgpou9k0Wv+AqqeoISoNgRfMTV1X5K +waQQk0T0eh75WcZObWUr+7gLobbMQJsYiWnpDarrzHiaVsdN5KNCsNDSHlGizwId9XFmUccdbB ClXx3EYmbc+4wkTbM7pbXDiLvgHnK8gt+kAmQhoVwagLOF+XD+HseKeEcEn+VsbWDPoEUXYElvY
 U2tsfT9mkhdudF3F31wg2ijgMlAu8VMH6h8495gUhReWJp3uA30JXx8eXRxMpN5aOwccBzma
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bc574 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=l4XH84iDAOAcUYOmqGIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: UyfspFtftBfFtzUKFyyeXp4otiKQeaZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215486

On Fri, Apr 25, 2025 at 07:46:58AM -0700, Khem Raj wrote:
> On 4/25/25 1:42 AM, Dmitry Baryshkov wrote:
> > On Thu, Apr 24, 2025 at 06:29:53PM -0700, Khem Raj wrote:
> > > Thanks for detailed review, it is quite helpful.
> > > 
> > > On 4/24/25 2:05 AM, Dmitry Baryshkov wrote:
> > > > On Thu, Apr 24, 2025 at 12:20:38AM -0700, Khem Raj wrote:
> > > > > This can ensure that meta-clang does not carry them and can rely on core layer
> > > > > while mesa can use them too.
> > > > > 
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ---
> > > > > +
> > > > > +PROVIDES:append:class-native = " llvm-native libclc-native spirv-llvm-translator-native"
> > > > > +PROVIDES:append:class-target = " llvm libclc spirv-llvm-translator"
> > > > > +PROVIDES:append:class-nativesdk = " nativesdk-llvm nativesdk-libclc nativesdk-spirv-llvm-translator"
> > > > > +
> > > > > +PACKAGES =+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc ${PN}-spirv \
> > > > > +             libclang lldb lldb-server liblldb llvm-linker-tools"
> > > > > +
> > > > > +
> > > > > +BBCLASSEXTEND = "native nativesdk"
> > > > > +
> > > > > +RDEPENDS:lldb += "${PN}-lldb-python lldb-server"
> > > > > +
> > > > > +RDEPENDS:${PN}-tools += "\
> > > > > +  perl-module-digest-md5 \
> > > > > +  perl-module-file-basename \
> > > > > +  perl-module-file-copy \
> > > > > +  perl-module-file-find \
> > > > > +  perl-module-file-path \
> > > > > +  perl-module-findbin \
> > > > > +  perl-module-hash-util \
> > > > > +  perl-module-sys-hostname \
> > > > > +  perl-module-term-ansicolor \
> > > > > +"
> > > > > +
> > > > > +RRECOMMENDS:${PN}-tidy += "${PN}-tools"
> > > > > +
> > > > > +FILES:llvm-linker-tools = "${libdir}/LLVMgold* ${libdir}/libLTO.so.* ${libdir}/LLVMPolly*"
> > > > > +
> > > > > +FILES:${PN}-libclang-cpp = "${libdir}/libclang-cpp.so.*"
> > > > > +
> > > > > +FILES:${PN}-lldb-python = "${libdir}/python*/site-packages/lldb/*"
> > > > > +
> > > > > +FILES:${PN}-tidy = "${bindir}/*clang-tidy*"
> > > > > +FILES:${PN}-format = "${bindir}/*clang-format*"
> > > > > +
> > > > > +FILES:${PN}-tools = "${bindir}/analyze-build \
> > > > > +  ${bindir}/c-index-test \
> > > > > +  ${bindir}/clang-apply-replacements \
> > > > > +  ${bindir}/clang-change-namespace \
> > > > > +  ${bindir}/clang-check \
> > > > > +  ${bindir}/clang-doc \
> > > > > +  ${bindir}/clang-extdef-mapping \
> > > > > +  ${bindir}/clang-include-fixer \
> > > > > +  ${bindir}/clang-linker-wrapper \
> > > > > +  ${bindir}/clang-move \
> > > > > +  ${bindir}/clang-nvlink-wrapper \
> > > > > +  ${bindir}/clang-offload-bundler \
> > > > > +  ${bindir}/clang-offload-packager \
> > > > > +  ${bindir}/clang-pseudo* \
> > > > > +  ${bindir}/clang-query \
> > > > > +  ${bindir}/clang-refactor \
> > > > > +  ${bindir}/clang-rename* \
> > > > > +  ${bindir}/clang-reorder-fields \
> > > > > +  ${bindir}/clang-repl \
> > > > > +  ${bindir}/clang-scan-deps \
> > > > > +  ${bindir}/diagtool \
> > > > > +  ${bindir}/find-all-symbols \
> > > > > +  ${bindir}/hmaptool \
> > > > > +  ${bindir}/hwasan_symbolize \
> > > > > +  ${bindir}/intercept-build \
> > > > > +  ${bindir}/modularize \
> > > > > +  ${bindir}/pp-trace \
> > > > > +  ${bindir}/sancov \
> > > > > +  ${bindir}/scan-build \
> > > > > +  ${bindir}/scan-build-py \
> > > > > +  ${bindir}/scan-view \
> > > > > +  ${bindir}/split-file \
> > > > > +  ${libdir}/libscanbuild/* \
> > > > > +  ${libdir}/libear/* \
> > > > > +  ${libexecdir}/analyze-c++ \
> > > > > +  ${libexecdir}/analyze-cc \
> > > > > +  ${libexecdir}/c++-analyzer \
> > > > > +  ${libexecdir}/ccc-analyzer \
> > > > > +  ${libexecdir}/intercept-c++ \
> > > > > +  ${libexecdir}/intercept-cc \
> > > > > +  ${datadir}/scan-build/* \
> > > > > +  ${datadir}/scan-view/* \
> > > > > +  ${datadir}/opt-viewer/* \
> > > > > +  ${datadir}/clang/* \
> > > > > +"
> > > > > +
> > > > > +FILES:${PN} += "\
> > > > > +  ${bindir}/clang-cl \
> > > > > +  ${libdir}/BugpointPasses.so \
> > > > > +  ${libdir}/LLVMHello.so \
> > > > > +  ${libdir}/*Plugin.so \
> > > > > +  ${libdir}/${BPN} \
> > > > > +  ${nonarch_libdir}/${BPN}/*/include/ \
> > > > > +"
> > > > > +
> > > > > +FILES:${PN}-clc += "${datadir}/clc"
> > > > > +
> > > > > +FILES:${PN}-spirv = " \
> > > > > +    ${bindir}/llvm-spirv \
> > > > > +    ${includedir}/LLVMSPIRVLib \
> > > > > +    ${libdir}/pkgconfig/LLVMSPIRVLib.pc \
> > > > > +    ${libdir}/libLLVMSPIRV* \
> > > > > +"
> > > > 
> > > > You've dropped RPROVIDES for ${PN}-clc and ${PN}-spirv here. Is there a
> > > > reason for that? It breaks OpenCL builds of mesa:
> > > > 
> > > 
> > > They were not needed since the libclc and splirv-llvm-translator recipes
> > > from meta-clang are gone. and clang recipe does add them to PROVIDES.
> > 
> > However mesa uses libclc and spirv-llvm-translator package names. It
> > makes it more future-proof, if at some point we'd decide to split clc /
> > spirv-llvm-translator to separate recipes again (especially the spirv
> > one).
> > 
> 
> Agreed. they are already provided now by clang recipe using PROVIDES since
> they are build time dependencies in mesa so it will pull them along since
> clang is in DEPENDS too and they are separated at PACKAGE level shlibs will
> pull needed shlib dependencies for libclc and spirv automatically. I still
> do not see why we should add RDEPENDS

This is easy:

RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"

As far as I understand, libclc provides runtime files, so there is no
shared object dependency. Not sure about the spirv-tools and
spirv-llvm-translator.

> 
> > > > ERROR: Required build target 'nativesdk-mesa' has no buildable providers.
> > > > Missing or unbuildable dependency chain was: ['nativesdk-mesa', 'nativesdk-spirv-llvm-translator']
> > > > 
> > > > ERROR: Required build target 'mesa' has no buildable providers.
> > > > Missing or unbuildable dependency chain was: ['mesa', 'libclc']
> > > > 
> > > 
> > > I am not sure how I can repeoduce it, but I did try explicitly adding the
> > > packageconfig to nativesdk-mesa and it built fine.
> > > 
> > > If you can share the changes to reproduce it, might be helpful
> > 
> > I was doing poky / qemuarm64 build with the following lines in
> > local.conf:
> > 
> > PACKAGECONFIG:append:pn-mesa = " opencl libclc gallium-llvm "
> > PACKAGECONFIG:append:pn-mesa-native = " opencl libclc gallium-llvm "
> > PACKAGECONFIG:append:pn-nativesdk-mesa = " opencl libclc gallium-llvm "
> > 
> 
> 
> I have added
> PACKAGECONFIG:append:class-nativesdk = " opencl libclc gallium-llvm "
> in the mesa recipe here and the build went fine for qemux86-64 so maybe its
> reproducible when using qemuarm64, I will try that.
> 
> Secondly, this is not default config yet so perhaps we can fix it along the
> way.

Granted that the fix for this issue is as easy as two RPROVIDES lines...
Maybe it's better to get it in from the beginning.

> 
> > > > > diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..bb152d2c566a6c61b95be2e7922cfe9c64a27afa
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-devtools/clang/common-clang.inc
> > > > > @@ -0,0 +1,24 @@
> > > > > +LLVM_RELEASE = ""
> > > > > +LLVM_DIR = "llvm${LLVM_RELEASE}"
> > > > > +
> > > > > +LLVM_HTTP ?= "https://github.com/llvm"
> > > > > +
> > > > > +MAJOR_VER = "20"
> > > > > +MINOR_VER = "1"
> > > > > +PATCH_VER = "2"
> > > > 
> > > > These should be set from ${PV}, not the other way around
> > > > 
> > > 
> > > Its other way around here, I have scripts to upgrade recipes and manipulate
> > > these vars, they are used to construct PV below and also package certain
> > > solibs which have MAJ.MIN format. Moreover, when building main clang branch
> > > it helps since VER_SUFFIX comes into picture as well. I will like to stick
> > > with this.
> > 
> > Ack
> > 
> > > 
> > > > > +# could be 'rcX' or 'git' or empty ( for release )
> > > > > +VER_SUFFIX = ""
> > > > > +
> > > > > +PV = "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
> > > > > +
> > > > > +LLVMMD5SUM = "8a15a0759ef07f2682d2ba4b893c9afe"
> > > > > +CLANGMD5SUM = "ff42885ed2ab98f1ecb8c1fc41205343"
> > > > > +LLDMD5SUM = "ae7dc7c027b1fa89b5b013d391d3ee2b"
> > > > > +LLDBMD5SUM = "2e0d44968471fcde980034dbb826bea9"
> > > > > +
> > > > > +LLVM_LIBDIR_SUFFIX = "${@d.getVar('baselib').replace('lib', '')}"
> > > > > +
> > > > > +# set the default pigz thread
> > > > > +export PIGZ = "-p ${@oe.utils.cpu_count(at_least=2)}"
> > > > > +
> > > > > +require common.inc
> > > > > diff --git a/meta/recipes-devtools/clang/common-source.inc b/meta/recipes-devtools/clang/common-source.inc
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..d8a0f68175cf5effe72d2be4ae847eba122f94e8
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-devtools/clang/common-source.inc
> > > > > @@ -0,0 +1,17 @@
> > > > > +do_fetch() {
> > > > > +        :
> > > > > +}
> > > > > +do_fetch[noexec] = "1"
> > > > > +deltask do_unpack
> > > > > +deltask do_patch
> > > > > +
> > > > > +SRC_URI = ""
> > > > > +
> > > > > +do_configure[depends] += "llvm-project-source-${PV}:do_preconfigure"
> > > > > +do_populate_lic[depends] += "llvm-project-source-${PV}:do_unpack"
> > > > > +do_create_spdx[depends] += "llvm-project-source-${PV}:do_preconfigure"
> > > > > +
> > > > > +# spdx shared workdir detection fails as not WORKDIR is altered but S and B
> > > > > +# return always true to fix that
> > > > > +def is_work_shared_spdx(d):
> > > > > +    return True
> > > > > diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..f77a3eea0ec7af3de8bc7f075cd8ba88b77f6beb
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-devtools/clang/common.inc
> > > > > @@ -0,0 +1,85 @@
> > > > > +FILESEXTRAPATHS =. "${FILE_DIRNAME}/clang:"
> > > > > +
> > > > > +LIC_FILES_CHKSUM = "file://llvm/LICENSE.TXT;md5=${LLVMMD5SUM} \
> > > > > +                    file://clang/LICENSE.TXT;md5=${CLANGMD5SUM} \
> > > > > +"
> > > > > +LICENSE = "Apache-2.0-with-LLVM-exception"
> > > > > +
> > > > > +# Snapshot
> > > > > +#RELEASE ?= "a69568efe6c4972e71af295c6577b3412dd57c22"
> > > > > +#BASEURI ?= "https://api.github.com/repos/llvm/llvm-project/tarball/${RELEASE};downloadfilename=llvm-${PV}-${RELEASE}.tar.gz"
> > > > > +#SOURCEDIR ?= "llvm-llvm-project-${@'${RELEASE}'[0:7]}"
> > > > > +#SRC_URI[sha256sum] = "aed4f66cd72867b36cc55a0588436933c3d58d3e61ca782b6bf57605d3fdcb09"
> > > > > +
> > > > > +# GA Release
> > > > > +RELEASE ?= "${PV}"
> > > > > +BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz"
> > > > > +SOURCEDIR ?= "llvm-project-${PV}.src"
> > > > > +SRC_URI[sha256sum] = "f0a4a240aabc9b056142d14d5478bb6d962aeac549cbd75b809f5499240a8b38"
> > > > > +
> > > > > +SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
> > > > > +SRCREV_spirvheaders = "09913f088a1197aba4aefd300a876b2ebbaa3391"
> > > > > +SRCREV_FORMAT .= "spirv_spirvheaders"
> > > > > +# pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
> > > > > +SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
> > > > > +SPIRVURI = " \
> > > > > +    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH};destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator \
> > > > > +    git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers;name=spirvheaders;branch=main \
> > > > 
> > > > Please use SPIR-V headers from the spirv-headers recipe rather than
> > > > injecting them here.
> > > > 
> > > 
> > > I thought about it and decided against it, because those headers are more
> > > aligned with spirv-tools and can be bumped independently, which could break
> > > clang. Its a complex recipe and it is better to have less source level
> > > dependencies coming from elsewhere.
> > 
> > It's a standard conflict between vendoring an external tree vs depending
> > on it. I'd say, it makes it harder to manage upgrades. With clang being
> > a part of OE-Core, autobuilder will catch upgrade issues.
> > 
> 
> Yes, indeed but I think this is a good compromize here for stability. Since
> spirv in not yet part of clang monolithic it does have tendancy to break, I
> have seen that with clang upgrade often.
> 
> > Anyway, I think after these patches land, we should split
> > spirv-llvm-translator back to a separate recipe (it is a separate tree
> > anyway), then upgrading SPIRV headers won't have any effect on LLVM.
> > 
> 
> yes that would be a good thing to do.
> 
> > > 
> > > > > +    file://spirv-internal-build.patch \
> > > > > +    file://spirv-shared-library.patch \
> > > > > +"
> > > > > +
> > > > > +SRC_URI = "\
> > > > > +    ${BASEURI} \
> > > > > +    ${SPIRVURI} \
> > 
> > [...]
> > 
> > > > > +
> > > > > +RDEPENDS:${PN}-dev += "${PN}-staticdev"
> > > > > +
> > > > > +BBCLASSEXTEND = "native nativesdk"
> > > > > +
> > > > > +ALLOW_EMPTY:${PN} = "1"
> > > > > +ALLOW_EMPTY:${PN}-dev = "1"
> > > > 
> > > > Why?
> > > > 
> > > 
> > > compiler-rt is a static library + headers package, that ends in -staticdev
> > > so PN is empty but PN-dev does have orc c_api.h file atleast for x86-64,
> > > compiler-rt needs to get into SDKs and thats why it is added.
> > > I have removed PN-dev in v2.
> > 
> > Would be nice to have a short comment here.
> 
> yeah whenever we do ALLOW_EMPTY usually this is the only reason. Regardless
> I will add a comment if and when we respin v3.
> 
> > 






-- 
With best wishes
Dmitry

