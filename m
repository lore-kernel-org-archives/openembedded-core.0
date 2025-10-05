Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE729CCA470
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 22:36:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.20812.1759703777247141416
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 15:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=o/2LSNOd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595MXqUB022857
	for <openembedded-core@lists.openembedded.org>; Sun, 5 Oct 2025 22:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P/dqYjBH6H5RtovGEYSS9DSF
	Ym9UOOkZ38ns8dh7SVE=; b=o/2LSNOdH6rlAVT4tCYVi2iuXIv32Jodt3CM8vHb
	tuMEA8CKqbKBelDwru3eDBKvL++vT3eQRtBabBokgGXHgpJibGE+Dt8SRTyMjI7W
	oiolnBulWMdBbCC3tnhmprdILZIUdjLOk3SfA+EJ3vgAm9g2ppnhVxzlZNia9f59
	6wnJlPetCYQ+AHnieLk390YuqesTYZ/JTwtGb3qeriYO75TpcCNRfdTLXzCrFevk
	1VhsrhymeIWsgWl/sgxlwMUKG4wkeURSwucZgP+jiuHdSgGxP4guX0F65YSRry1/
	wDcI/Dpz9fQdb74iAlqSnaBAY0fPT0SukrShuzAdHdD8XA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6tgd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:36:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d7f90350f3so93321241cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 15:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759703775; x=1760308575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/dqYjBH6H5RtovGEYSS9DSFYm9UOOkZ38ns8dh7SVE=;
        b=RxDb2hqPjY9oLtQBXL4N7kYEXF0RspQqaULuUY4foEKKeL195wWt2zQ5wOmCqotmDu
         zVocB/ZZkcvOKXewnuHKyutdzIsfjnbG7mPAWRPwuHji+SLMd8ca/QNExZE2sEQwaFJt
         Gju6DInPD8yfabnal5ieMsx5H9Jwta7sKfhxflyB75TpIjAev66f4MLceNzqYmeBLOTa
         rxFQlxxD0DcHzOleve67Nwx8kzV8afOlE5A6w0Oe2ybfQntX9ouZaQedEUIGOC5mbvv9
         mTIyW9LxzNVWkO1iEWfEtqJV2Wid7A9vqUCVIepwHa621r6h2l7D7lttFkvGmD9vZHVW
         u4MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUufYw/ykKET8xJqRKQa8a2cVmqWr+35SsKz/EaIgX/K5X+YVM499y3X8G8xJI/ZB8eeQlk6DlOHFupVOLq5/HLeA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4gE7C37dpmoDkg4oIgcCFSrxqH/04ufJGLI8LJMvXZgOZD8W1
	hN6nrnJ5vKobfN0C6uv7PchphYNkP7HmLu7kQM3+EWPWo4sa7SdbSKU/WhuK+XuosWKkKtp57U8
	BMkbTQblseBiWc/ZbuDxIePUyisGL/phoAmOKrhvnO4Mb7THg9vUplo1G1m0r8Ip5u+z9zvbRrE
	8WyvDLPQO25nDW15g=
X-Gm-Gg: ASbGncvcn+Z/GEzgPPWulAk3v4Nz4qcpKLFCcfZ2cR3/Rq+AlNtQ4CakGye+J/QAVdr
	L5LiEKfDw2gtTRnChPBjomY3WgspnnQTLhKmxtIM/I4YPnx/FweQ2oO1bHG3tydMB2WQWiaNLH3
	q9bbMfu8SH/fxs922y5eHWvJvBRT2o30J3iic00ZoJuBtmEShyAHkDcVWnoyK5JjpRdpLMgiG5u
	eK/m40nj/vF/8JEqchlGnMOqHgGIC333jj/MPnGWCGt+ji3woLmtqFjPkNaTRqYqYTrzEpGNtjr
	mg9Jhje1fBtrXoS+lzdvv1AW3cB7og9tQVTjRuLPegkJT8HqCUEAzYa5rYCPbQzASE0CfET4yHQ
	mRoXloIklvFBRFOWJEdeOfdN6fJ8f4z1IQ5JvHy48NLkkNs2/EAw8N9vt2Q==
X-Received: by 2002:a05:622a:148e:b0:4b7:a6f4:b46a with SMTP id d75a77b69052e-4e5611d516cmr203901271cf.6.1759703774799;
        Sun, 05 Oct 2025 15:36:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmqnz3oCMR0U0cfWJ5JtCIjxa3kdQLQjMEIBd5kpeSQg+9vH0KkZiWZPPaqD/0RYrW43445w==
X-Received: by 2002:a05:622a:148e:b0:4b7:a6f4:b46a with SMTP id d75a77b69052e-4e5611d516cmr203901061cf.6.1759703774270;
        Sun, 05 Oct 2025 15:36:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011b094csm4384980e87.127.2025.10.05.15.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:36:12 -0700 (PDT)
Date: Mon, 6 Oct 2025 01:36:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Kavinaya S <kavinaya@qti.qualcomm.com>,
        openembedded-core@lists.openembedded.org,
        Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [PATCH v4 1/1] fitimage: Add support for custom compatible
 string via optional parameter
Message-ID: <gvjt5sewd5iatyphqym2jhnkxkwxme7xwihcgzci2uj3zeqc65@corw2yixlfir>
References: <20250930065117.2625998-1-kavinaya@qti.qualcomm.com>
 <20250930065117.2625998-2-kavinaya@qti.qualcomm.com>
 <CANNYZj_x87wtyYxT3jh0VkGYSViM05=tPy0wAALNCAMrqsNGRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_x87wtyYxT3jh0VkGYSViM05=tPy0wAALNCAMrqsNGRw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e2f2e0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=P-kBPB1vGOnp13xVBfUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: kmm9y5YOR6zqJeVEGXVtWtFaZCtmy9rv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX4HTycBRyaF2x
 IKKzd3LHeTo7wJvaLvtZeZBUNQb8VE8RnnzGZ2cNgAe7M8vMt3V+Mae4eJrmg9OGdG419Hxrjjo
 HtukBGram++NeECk581LD4/xd78PimzHAimv9lqUlFKRDtPtSFgR79pWKv1lW+NtsiPdjrKuf2Y
 Ym1u5GseZMJ0bBzYajH3jAfQLS4U2Ad08R4ZdjVNo6V5DnRYOjCq+MWBCh75ecd0LCz1n+UQnmd
 rKJow51NZy207R+uheb19PyLoqWNVqgoWRY2/hVYSIaR0LuxJ2woRvml8Xax8kRstRELBOFiHMN
 uFFj+5Wk2xsR6IkAFRDrvt4ZNNSQFQPTxocjkGBwWT3/Pm5ikTjQVSV9o3XuvQ3IGkjYrJk66AH
 uJGaRoO0+ldv5EPt9jOt9pI63Vlniw==
X-Proofpoint-ORIG-GUID: kmm9y5YOR6zqJeVEGXVtWtFaZCtmy9rv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224454

On Tue, Sep 30, 2025 at 01:01:45PM +0200, Alexander Kanavin wrote:
> On Tue, 30 Sept 2025 at 08:51, Kavinaya S <kavinaya@qti.qualcomm.com> wrote:
> 
> > --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> > +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> > @@ -778,6 +778,8 @@ FIT_CONF_PREFIX = "foo-"
> >          1. bitbake bbb-dtbs-as-ext
> >          2. Check if symlink_points_below returns the path to the DTB
> >          3. Check if the expected compatible string is found by get_compatible_from_dtb()
> > +        4. Verify that a custom compatible string can be passed
> > +
> >          """
> >          DTB_RECIPE = "bbb-dtbs-as-ext"
> >          DTB_FILE = "am335x-bonegreen-ext.dtb"
> > @@ -788,6 +790,7 @@ FIT_CONF_PREFIX = "foo-"
> >          config = """
> >  DISTRO = "poky"
> >  MACHINE = "beaglebone-yocto"
> > +FIT_DTB_COMPATIBLE_OVERRIDE_am335x-bonegreen-ext.dtb = "custom,board custom,variant"
> >  """
> >          self.write_config(config)
> >
> > @@ -819,6 +822,11 @@ MACHINE = "beaglebone-yocto"
> >          # The alias is a symlink, therefore the compatible string is equal
> >          self.assertEqual(comp_alias, comp)
> >
> > +        # Test custom compatible string override via FIT_DTB_COMPATIBLE_OVERRIDE variable
> > +        custom_override = get_bb_var("FIT_DTB_COMPATIBLE_OVERRIDE_am335x-bonegreen-ext.dtb", DTB_RECIPE)
> > +        self.assertTrue(custom_override)
> > +        self.assertEqual(str(custom_override).split(), ["custom,board", "custom,variant"])
> > +
> 
> I took a closer look at the selftest, and actually this is not right.
> This modifies a test that is intended specifically for testing
> get_compatible_from_dtb() (so it's not the right test to modify), and
> it doesn't check that passing in a custom compatible will result in a
> correct .its output, it only checks that getting a bitbake variable
> (after it's been set) works ok - not a useful check.

Yes. I would suggest starting from the test, making sure that it
documents the expected behaviour (and fails without your changes) and
then implementing the python changes on top to make the test pass.

> Rather, I think you should take a look at test_fitimage_py_default()
> and test_fitimage_py_default_dtb(), and add one more test that sets
> the custom compatible. Adrian could probably give more authoritative
> advice.

-- 
With best wishes
Dmitry

