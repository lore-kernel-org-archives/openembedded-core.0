Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03170CAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 22:34:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.20782.1759703683345646925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 15:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MqKFayAm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Hl5op024204
	for <openembedded-core@lists.openembedded.org>; Sun, 5 Oct 2025 22:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PLVdRDRYcRd7mSM50RIR81FI
	CkN7vpadq5BrGPO8UGM=; b=MqKFayAmEjAcBSanxjLvNL5iImORHs9KpJ3ZLEQ5
	P4ph8H149e9wU0/09zFCewimn25xUGd8HeiRlwyfzFMH4+OXxhZJd8LMqqXfSCET
	7osgB3jJZHMLNGqO4z8sIkxhc84qf7Bw91Qx4GwPIxL0mh46s/VRS62TIfgI+fop
	xwECwIyebTT3LreotcFpqGNvHdURkWgSPkUzdaN7ULNb+OmHkxh/PrIG5hzj0snE
	smLtZoTDu3YRhw5Y51MbnHj1lgkg8eY+b7+3/+1OFfMYUHMC8KwlP1I/cwHPIdzO
	J6KjZdXKGq6sz8Kzr/n//1oUQso3rEa4gUmJAibmkneulQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgjn2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:34:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-87561645c1cso1050039185a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 15:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759703681; x=1760308481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLVdRDRYcRd7mSM50RIR81FICkN7vpadq5BrGPO8UGM=;
        b=fVG6M8owBLds8XsPZ7erKT5BhWqMCf0B+MjvoHL+u1VY60l4yQaZEZAfSCyRC6oFBG
         kKHLgSZ1bkvcP0DRtTKhPchmFBiUf5FMKoKMaQa1dRBZNAxSUCWaXdcB9OWVRFF14JwQ
         Mpn7ECvcoN/CIr05sDNDAl63Vz3n8nI+RNuGUFpftEaIAnnyoEsSFDVeWTTB42DOmlMM
         0zOjqgt/Ni7Cz/16llEEAVTcXbBvr//RSg9Vy+q/nVLfLbpFyZBF508jeQQ0QCqI63nf
         7jKGajovRZjssyyWSNMx7SFAG29WnY0A9nLWm2u5thgYv91wA0NZ/udmGEvrd6q62np4
         uWDQ==
X-Gm-Message-State: AOJu0YzBYhL/fVSrQgBsIAkLoRDwXEnEuU2k6ZXcy+XR5JyXJ6J2a5eT
	6bcjNfSRS9R0lUX8/dvXva69cVBPYrUslmtDesEMam3ScIHsmyFrCBFPlPgt6Zvm+N1+J2OfJ4t
	nmd7U8XbF8AHhVoIzJZv7PN8vyAkaJsztLUAaeFexS9BC/ekDvy79jkm/fG28umohrI5jRjFjEx
	B0PZaH6Ak=
X-Gm-Gg: ASbGncvTuqGMeG3ztbfIwrdS7OTfe96DQ53T+UmA9z82r3eylXVC7TjD+ptcyNGN6q/
	Z74IELPQIJmHb8zaM0KmkPyMffDO1ayDc0Ab7b1/aLW2vbpqIi+DxZQNJB+A5lj7opk/cO/Jyzo
	ul23kfmghrZBoJ1HQedK4QhS8C/l2juukCL6ZDBmuk6GmDzc5YV/96mvcG0AVj3WlrR2cxJsD1o
	xASCrlDhb0Cn6GKrog/OT5jreXYy9x2245gJIGFGX+d+OJk39fn6a2p2nGjs9dQE90m6eu6Tqwb
	BQp1ckOc66QkTkep3hceLrABjfiEwGiuPiYCsWE6zDka+j9FMYn1YHGRFhf5etj9pYn4JKzhe8d
	fHC7gf6kTxX6dnzg/dguoEGI8BYPpl+IaMZ132ytMJEcfBI4XhToWtfVE4g==
X-Received: by 2002:a05:622a:90a:b0:4b7:8235:1eaf with SMTP id d75a77b69052e-4e576ae683fmr143790441cf.39.1759703681284;
        Sun, 05 Oct 2025 15:34:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGhDgiXSMBEcby6Jothop9YR8z8adCTzRpd6CaASP9dUkCCbvjXh7yerOOj831dx1gmNq3Lw==
X-Received: by 2002:a05:622a:90a:b0:4b7:8235:1eaf with SMTP id d75a77b69052e-4e576ae683fmr143790241cf.39.1759703680755;
        Sun, 05 Oct 2025 15:34:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011243fcsm4369602e87.9.2025.10.05.15.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:34:38 -0700 (PDT)
Date: Mon, 6 Oct 2025 01:34:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kavinaya S <kavinaya@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org,
        Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [PATCH v4 1/1] fitimage: Add support for custom compatible
 string via optional parameter
Message-ID: <gahunfldkpx3p453csdcoxnosrvbcnnzoeamsmxvzxxesvyls4@v4eicwchoz3p>
References: <20250930065117.2625998-1-kavinaya@qti.qualcomm.com>
 <20250930065117.2625998-2-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930065117.2625998-2-kavinaya@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX98CHMno+SlUu
 /Vn1aVME1+rZwP5kFj5rYJxCAsIalNzEQB5rsko41bZCH6aQKQJwXeewNLZOKsjZ5XMmGI+WgQc
 Pbsj2Xo5RhhjZyreipOHc2zASrDLNkm5L4GxHOFFaKN973uHi61gU0C+qY5a9yYgr1qzGn9c1nA
 I2jGU/lAbImtkHhUl5XOxhsOlkxLIHEocjbvft8uOehthxq/CD11ThC77kRCJpab2tFq6hHYHmy
 QZ5lm80dOieJggCmjpxk7q0neys85W5JaKM6tCQ55MH7aCWH+REe/MYyp/tEfPL5T8LIXmklHUY
 cpLzOht4LjyIL80l+8k3VmeiqR/ufLYnmKFoLxhrq2H0HB187NXCEFwDXFic9rXjTvbtQXpZOZq
 RNfJEgEF5ucVva0AVPNaMZd47qdVbQ==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e2f282 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=WGJCAPhIeh4PmRkSBIQA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: T-EuOEwGi-8hPTWM9bbqfaGsbnCEHR0H
X-Proofpoint-ORIG-GUID: T-EuOEwGi-8hPTWM9bbqfaGsbnCEHR0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224453

On Tue, Sep 30, 2025 at 12:21:17PM +0530, Kavinaya S wrote:
> Currently, fitimage_emit_section_dtb() always derives the 'compatible'
> property from the DTB using fdtget when add_compatible=True. In some
> cases, it is desirable to override this with a custom compatible string

In which cases? Could you please be more specific here?

> defined in the build metadata.
> 
> 1.The compatible string format that we require is different from what
>   dynamic generation allows. The format that we rely on is:
> 
>    compatible = "qcom,<SoC>[-<soc_version>][-<foundry_id>]-<board>
>    [/<subtype>][-<pmic>][-<board_version>]"
> 
>   This structure enables precise identification of the appropriate DTB
>   for each board variant.
> 
> 2.As in the upstream kernel Makefile for QCOM platforms

QCOM->Qualcomm

> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/Makefile ), overlays are used to generate composite DTBs:

You should have gotten a warning from check-patch / b4 here.

> 
>    dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>    qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
>    qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
> 
>    In the above cases, the base DTB remains the same, but the
>    overlays differ. In such cases,we cannot assign unique compatible
>    strings to these variants.

Of course you can.

> 
> This patch introduces an optional 'custom_compatible' parameter to

s/This patch//

> fitimage_emit_section_dtb(). When provided, this value is used instead
> of extracting from the DTB. The parameter accepts either a space-
> separated string or a list of strings, which are split into the

Can't you seetle on one format? Whitespace-separated string should be
fine, it's the format that is commonly accepted by other routines.

> compatible array for the ITS node.
> 
> This patch also updates test_get_compatible_from_dtb() to check that the
> FIT_DTB_COMPATIBLE_OVERRIDE_<dtb>.dtb variable is applied correctly.
> 
> Suggested-By: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> ---
>  meta/classes-recipe/kernel-fit-image.bbclass |  3 ++-
>  meta/conf/image-fitimage.conf                |  6 ++++++
>  meta/lib/oe/fitimage.py                      | 12 +++++++++---
>  meta/lib/oeqa/selftest/cases/fitimage.py     |  8 ++++++++
>  4 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
> index f04aee1807..de0f3c332e 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -84,8 +84,9 @@ python do_compile() {
>  
>              # Copy the dtb or dtbo file into the FIT image assembly directory
>              shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
> +            custom_compatible_str = d.getVar(f"FIT_DTB_COMPATIBLE_OVERRIDE_{dtb_name}") or None

Would it be better to use VarFlags instead of a var? Also I think you
need to declare dependency on the corresponding variable.

>              root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
> -                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
> +                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"), True, custom_compatible=custom_compatible_str)

The string is too long, split it.

>  
>      if external_kernel_devicetree:
>          # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
> diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
> index 090ee148f4..f685948c3b 100644
> --- a/meta/conf/image-fitimage.conf
> +++ b/meta/conf/image-fitimage.conf
> @@ -65,3 +65,9 @@ FIT_ADDRESS_CELLS ?= "1"
>  # Machine configurations needing such a script file should include it in the
>  # SRC_URI of the kernel recipe and set the FIT_UBOOT_ENV parameter.
>  FIT_UBOOT_ENV ?= ""
> +
> +
> +# To override the DTB 'compatible' string in the FIT image, add in your
> +# machine.conf or local.conf:
> +#
> +#  FIT_DTB_COMPATIBLE_OVERRIDE_qcs6490-rb3gen2-vision-mezzanine.dtb = "qcom,qcs6490-rb-subtype2"

Also no need for .dtb here. What about:

FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine]

> diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
> index f303799155..54baba28bc 100644
> --- a/meta/lib/oe/fitimage.py
> +++ b/meta/lib/oe/fitimage.py
> @@ -289,7 +289,7 @@ class ItsNodeRootKernel(ItsNode):
>          self._kernel = kernel_node
>  
>      def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None,
> -                                  dtbo_loadaddress=None, add_compatible=False):
> +                                  dtbo_loadaddress=None, add_compatible=False, custom_compatible=None):

Also too long

>          """Emit the fitImage ITS DTB section"""
>          load=None
>          dtb_ext = os.path.splitext(dtb_path)[1]
> @@ -309,7 +309,10 @@ class ItsNodeRootKernel(ItsNode):
>          # Preserve the DTB's compatible string to be added to the configuration node
>          compatible = None
>          if add_compatible:
> -            compatible = get_compatible_from_dtb(dtb_path)
> +            if custom_compatible:
> +                compatible = str(custom_compatible).split()
> +            else:
> +                compatible = get_compatible_from_dtb(dtb_path)
>  
>          dtb_node = self.its_add_node_dtb(
>              "fdt-" + dtb_id,
> @@ -326,7 +329,10 @@ class ItsNodeRootKernel(ItsNode):
>          # Preserve the DTB's compatible string to be added to the configuration node
>          compatible = None
>          if add_compatible:
> -            compatible = get_compatible_from_dtb(dtb_path)
> +            if custom_compatible:
> +                compatible = str(custom_compatible).split()
> +            else:
> +                compatible = get_compatible_from_dtb(dtb_path)
>  
>          dtb_id = os.path.basename(dtb_path)
>          dtb_alias_node = ItsNodeDtbAlias("fdt-" + dtb_id, dtb_alias_id, compatible)
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
> index 3c40857747..1ca55a7706 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -778,6 +778,8 @@ FIT_CONF_PREFIX = "foo-"
>          1. bitbake bbb-dtbs-as-ext
>          2. Check if symlink_points_below returns the path to the DTB
>          3. Check if the expected compatible string is found by get_compatible_from_dtb()
> +        4. Verify that a custom compatible string can be passed
> +
>          """
>          DTB_RECIPE = "bbb-dtbs-as-ext"
>          DTB_FILE = "am335x-bonegreen-ext.dtb"
> @@ -788,6 +790,7 @@ FIT_CONF_PREFIX = "foo-"
>          config = """
>  DISTRO = "poky"
>  MACHINE = "beaglebone-yocto"
> +FIT_DTB_COMPATIBLE_OVERRIDE_am335x-bonegreen-ext.dtb = "custom,board custom,variant"
>  """
>          self.write_config(config)
>  
> @@ -819,6 +822,11 @@ MACHINE = "beaglebone-yocto"
>          # The alias is a symlink, therefore the compatible string is equal
>          self.assertEqual(comp_alias, comp)
>  
> +        # Test custom compatible string override via FIT_DTB_COMPATIBLE_OVERRIDE variable
> +        custom_override = get_bb_var("FIT_DTB_COMPATIBLE_OVERRIDE_am335x-bonegreen-ext.dtb", DTB_RECIPE)
> +        self.assertTrue(custom_override)
> +        self.assertEqual(str(custom_override).split(), ["custom,board", "custom,variant"])
> +
>      def test_fit_image_ext_dtb_dtbo(self):
>          """
>          Summary:     Check if FIT image and Image Tree Source (its) are created correctly.
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

