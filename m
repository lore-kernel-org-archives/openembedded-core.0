Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9F1D116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 14:13:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16778.1764339198708140882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 06:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Fd4FyNEj;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ixpzhDjp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PCC03919419
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 14:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qYy46Vuf08p9XJ5Z+q6MhdDC
	MhDaWJG/ShjrC9KB6cM=; b=Fd4FyNEjil0cwSlAEc5Oa4GtvXy7Lbo6KrOVk+3q
	GJnRHuAOfuywOZPGzmNcH1eS0QlVI/OgZO17iJ0lkY4ZLzeqFVz6+4maK1TBGaxh
	2ctPPglqg6endKbWNCPv2ABcCUs2FLRsjOZyu16jLHILFD1/05guq9NfuEchF4m3
	oFPtXO8XaeJPiVAxxj2yWuHxP6rj5ExQXsYONLkCdMpn/YLtkTvq1ag8QXnlQfiF
	apgVNyqFXEPlRKwOdp/7tlZSNOblBQMowFpbWvv0E9AOAJ2zKXtiKmpVCm8J4xR/
	ExuhQeU0UrhJzbakw7O4mfPhGMZ7CZozrXLtA3g2hHuIkA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apq66k5qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 14:13:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9371b5e8035so691823241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764339197; x=1764943997; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYy46Vuf08p9XJ5Z+q6MhdDCMhDaWJG/ShjrC9KB6cM=;
        b=ixpzhDjpGa7HfQyk6+5m6GjV7qIRX5R4bixFHqMOMO6D/X+Ar4ssWkgw7uI9yvIG59
         NxB4xOoMk7gF769sa+aBcAAdpg2UPEZTJIQIni/FKs4SD2xbCM90MVMP4+L3pcPNk+5i
         +9b3E82FjJblgUFg1M6OkxBaicgFhpq6fZgshXiTF5PwKTsndmU6gj2af9gbihyHOaQG
         /LzSI0OiQOuXGTesYjQ7Iv/dc0vRiPZ3IcomGSs2VMB5dbExJRIwsNuu6kE5n2N/skRd
         6gVidjPR6J8UiOI6bWOvfMdn03zU2g4UZh8jO6nzDsN1qzoh55OVpHhD3lYOiJTNe1z3
         R53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764339197; x=1764943997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYy46Vuf08p9XJ5Z+q6MhdDCMhDaWJG/ShjrC9KB6cM=;
        b=kMO9dqvesbLDbDrAi2fAgIuqRuYLy1tGn0he/1tl+UXsHYOxtZ9v/Acw6Gnng66L1k
         QS+91nh3yXMX7fZQNPIW4NMKc3xvQcL0lnF0DV1PwOo/4JFNNDMeUuqTcJ6jQC2jZefn
         G/bEdJAncqgZlJ1Cj6wIh1gsrsDKGh6qnqzjNXt1B6sLrGRw5Hpczoss1flbSNrD7hTf
         U7Rdx/FiLUj9K3jfWzoNbALthKWfmdqck2pR+piuJSnBrj46cleWRVuPunz3j4qYJsM4
         W55GRZanxvoANFvXvL3KgpQsndu+bXecAVVPyo4TDMB7TGT92VWORq/HB4qNGQ75/rWH
         QfAA==
X-Gm-Message-State: AOJu0YzWqqWfic1vfn7RSo8VV4g0FEv6N7+327cz9IsOQHxNkB3okDrb
	uM6Qy6CRdDqYiLGFGmqHHDivVAhv5T5bEPF3D8mxOYZRCjC5Ew0TCoKQQy5Dk4UEyRF+8cJHyoi
	jPNaMsp1JrlDrVPP2WvAZZgS8dQZqn0K0VKa1ZOzA1L7qjJQXODgnEb9+QvkeZVqBMZTpQs7SMA
	t/o16XDEM=
X-Gm-Gg: ASbGncsM77BLGecILzO8RTaw8pMghz33hOM45VXw1CIPXBhqJ4qRqwbN8UjaYve5gyC
	jK/hYA5VyJcBRjobB3IbXON1cs1QNUd/kWkV0aztn7vDGr7FFtBLD+W1Pn/DcQQDoP9H/DEdqks
	2hWM1J2hhbz+xwM8vBtMyPjEJKHMONUhZAZBYDI9n7DXNOhdJW1hcgxTViFNLA/acwqP16v9gft
	0OeDiPPLfK1e9XxI3QEjg3mCiFjRZzX79a5zzu0jI1HFGwWasad82aV+Z6Byo/w4H4siT9xqudN
	r8l/BvG8fxmT1CzIrGEVrMfhCGfnQGqq44/V0J11ljgesW/njrHZc1vnsVcYxGAyAXsJ8r6Ku+H
	l5kNH8bR1OW6z9nE9Z2TlKCE9UqSORQ/gT8DbrCP1iVRIAx5SVPXYFgd7ZJFzUfDI8P6nWotuTh
	uhj5Z3iUIO6R5J2YrRCPWA8rs=
X-Received: by 2002:a05:6122:608b:b0:54a:a178:3c9f with SMTP id 71dfb90a1353d-55b8d7a12femr8836541e0c.15.1764339196031;
        Fri, 28 Nov 2025 06:13:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkGpQcaxt2TVvvEj75OKOYCXkZW19Tst8OnX1SoMxDDw31CvCO+pECaejzUEq68j2fsDt0vg==
X-Received: by 2002:a05:6122:608b:b0:54a:a178:3c9f with SMTP id 71dfb90a1353d-55b8d7a12femr8836168e0c.15.1764339193693;
        Fri, 28 Nov 2025 06:13:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48c16sm1228792e87.73.2025.11.28.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 06:13:12 -0800 (PST)
Date: Fri, 28 Nov 2025 16:13:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Jouni Malinen <jouni@qca.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, miaoqing.pan@oss.qualcomm.com
Subject: Re: [OE-core] [PATCH v3 1/4] wpa-supplicant: restore use of packaged
 defconfig
Message-ID: <k7wkcthzxnplpgtg5l7dam2djwthltfybp6jez7se3nd54x4vc@bksd3rgjf2qc>
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
 <20251128013628.2187455-2-miaoqing.pan@oss.qualcomm.com>
 <187C300838343AAE.236385@lists.openembedded.org>
 <CANNYZj-41tXqMX2D=bUU2Q8E7=qAC8=5M_3uvMFcmq0aKV_sRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-41tXqMX2D=bUU2Q8E7=qAC8=5M_3uvMFcmq0aKV_sRA@mail.gmail.com>
X-Proofpoint-GUID: FlRmHWAOQ-XImuUcbW-w6O30l2RE2hOM
X-Proofpoint-ORIG-GUID: FlRmHWAOQ-XImuUcbW-w6O30l2RE2hOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDEwNCBTYWx0ZWRfX/f9TaTYWKTvf
 Po850blqKJ63yr1d1EWZhgVx2235x2UMseJjcnvrNjnNWRd1+ssgFvzxXCusXo2ZDbwWMTgztN+
 nYFfYoGV1hft4WMIuowzzyMO8LRg2gdpaZtV7USHLNouzuDI+RykOWyvZZbCjcfT3/4+LBMp82H
 nmu1EmZzCzB+jtEQL+vBLfmK+LsIR/ADNl2ejruCkDr+bccZ0xY0ni/Q8HgDpecx6E4OVdCj/yx
 KHfe1O622vsCfaqk3s6VvVMfqdjnGBeuEHo5jGrdWp7zzKKj/7tPOpJEm4lRVmuknxvGlP90OQ7
 Kg5g0N3gB4EHshF71SGIb0LIkWsoQ4bz68Iy2OFnB3rfi0H7FzQLaCrb9rQLJNSsEbbhChBzWN9
 sakbLk3R2JDbEZ9KhaLsBYiee8Q8WQ==
X-Authority-Analysis: v=2.4 cv=BYHVE7t2 c=1 sm=1 tr=0 ts=6929adfd cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yaAG3qJ-AAAA:8 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=fTMM45yhicAnkpHYWaUA:9 a=W7WeN97V9vU_l5Eb:21
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=oLVlbjkABFOu4cUI0CGI:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 14:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226916

On Fri, Nov 28, 2025 at 02:57:59PM +0100, Alexander Kanavin wrote:
> I went and read the commit you reference:
> 
>     wpa-supplicant: Use upstream defconfig
> 
>     The copy of defconfig we were carrying was from 2014 and very out of
>     date; drop it and use the upstream version with appropriate edits for
>     our PACKAGECONFIG.
> 
> So this was done for exactly the reasons I mentioned. Let's not go back there.

Other distros (e.g. Debian) also carry their own versions of
wpa-supplicant and hostapd configs. Added our WiFi expert to CC in hope
to get comments from him.

> 
> Alex
> 
> 
> On Fri, 28 Nov 2025 at 14:52, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> >
> > I am sorry, but copying such long configurations into oe-core
> > introduces a significant maintenance burden, and needs a far better
> > justification. What is the origin of this file? Was it modified? How
> > is it going to be maintained and kept in sync?
> >
> > From what I can see, it's basically a copy of
> > https://git.w1.fi/cgit/hostap/tree/wpa_supplicant/defconfig
> >
> > So why can't we use that directly? If the file isn't enabling options
> > you need, then please send fixes upstream, and meanwhile patch the
> > file from the recipe.
> >
> > Alex
> >
> > On Fri, 28 Nov 2025 at 02:37, Miaoqing Pan via lists.openembedded.org
> > <miaoqing.pan=oss.qualcomm.com@lists.openembedded.org> wrote:
> > >
> > > Commit d97bedd8bdcc ("wpa-supplicant: Use upstream defconfig")
> > > switched to the upstream defconfig, but the upstream file is only
> > > an example and is not intended for builds. It may change or fail
> > > to reflect a stable baseline configuration.
> > >
> > > Restore the packaged defconfig from version 2.11 to ensure a
> > > consistent baseline and simplify enabling additional options.
> > >
> > > Fixes: d97bedd8bdcc ("wpa-supplicant: Use upstream defconfig")
> > > Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> > > ---
> > >  .../wpa-supplicant/wpa-supplicant/defconfig   | 688 ++++++++++++++++++
> > >  .../wpa-supplicant/wpa-supplicant_2.11.bb     |   5 +-
> > >  2 files changed, 692 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> > >
> > > diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> > > new file mode 100644
> > > index 0000000000..52befd8f15
> > > --- /dev/null
> > > +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> > > @@ -0,0 +1,688 @@
> > > +# Example wpa_supplicant build time configuration
> > > +#
> > > +# This file lists the configuration options that are used when building the
> > > +# wpa_supplicant binary. All lines starting with # are ignored. Configuration
> > > +# option lines must be commented out complete, if they are not to be included,
> > > +# i.e., just setting VARIABLE=n is not disabling that variable.
> > > +#
> > > +# This file is included in Makefile, so variables like CFLAGS and LIBS can also
> > > +# be modified from here. In most cases, these lines should use += in order not
> > > +# to override previous values of the variables.
> > > +
> > > +
> > > +# Uncomment following two lines and fix the paths if you have installed OpenSSL
> > > +# or GnuTLS in non-default location
> > > +#CFLAGS += -I/usr/local/openssl/include
> > > +#LIBS += -L/usr/local/openssl/lib
> > > +
> > > +# Some Red Hat versions seem to include kerberos header files from OpenSSL, but
> > > +# the kerberos files are not in the default include path. Following line can be
> > > +# used to fix build issues on such systems (krb5.h not found).
> > > +#CFLAGS += -I/usr/include/kerberos
> > > +
> > > +# Driver interface for generic Linux wireless extensions
> > > +# Note: WEXT is deprecated in the current Linux kernel version and no new
> > > +# functionality is added to it. nl80211-based interface is the new
> > > +# replacement for WEXT and its use allows wpa_supplicant to properly control
> > > +# the driver to improve existing functionality like roaming and to support new
> > > +# functionality.
> > > +CONFIG_DRIVER_WEXT=y
> > > +
> > > +# Driver interface for Linux drivers using the nl80211 kernel interface
> > > +CONFIG_DRIVER_NL80211=y
> > > +
> > > +# QCA vendor extensions to nl80211
> > > +#CONFIG_DRIVER_NL80211_QCA=y
> > > +
> > > +# driver_nl80211.c requires libnl. If you are compiling it yourself
> > > +# you may need to point hostapd to your version of libnl.
> > > +#
> > > +#CFLAGS += -I$<path to libnl include files>
> > > +#LIBS += -L$<path to libnl library files>
> > > +
> > > +# Use libnl v2.0 (or 3.0) libraries.
> > > +#CONFIG_LIBNL20=y
> > > +
> > > +# Use libnl 3.2 libraries (if this is selected, CONFIG_LIBNL20 is ignored)
> > > +CONFIG_LIBNL32=y
> > > +
> > > +
> > > +# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
> > > +#CONFIG_DRIVER_BSD=y
> > > +#CFLAGS += -I/usr/local/include
> > > +#LIBS += -L/usr/local/lib
> > > +#LIBS_p += -L/usr/local/lib
> > > +#LIBS_c += -L/usr/local/lib
> > > +
> > > +# Driver interface for Windows NDIS
> > > +#CONFIG_DRIVER_NDIS=y
> > > +#CFLAGS += -I/usr/include/w32api/ddk
> > > +#LIBS += -L/usr/local/lib
> > > +# For native build using mingw
> > > +#CONFIG_NATIVE_WINDOWS=y
> > > +# Additional directories for cross-compilation on Linux host for mingw target
> > > +#CFLAGS += -I/opt/mingw/mingw32/include/ddk
> > > +#LIBS += -L/opt/mingw/mingw32/lib
> > > +#CC=mingw32-gcc
> > > +# By default, driver_ndis uses WinPcap for low-level operations. This can be
> > > +# replaced with the following option which replaces WinPcap calls with NDISUIO.
> > > +# However, this requires that WZC is disabled (net stop wzcsvc) before starting
> > > +# wpa_supplicant.
> > > +# CONFIG_USE_NDISUIO=y
> > > +
> > > +# Driver interface for wired Ethernet drivers
> > > +CONFIG_DRIVER_WIRED=y
> > > +
> > > +# Driver interface for MACsec capable Qualcomm Atheros drivers
> > > +#CONFIG_DRIVER_MACSEC_QCA=y
> > > +
> > > +# Driver interface for Linux MACsec drivers
> > > +CONFIG_DRIVER_MACSEC_LINUX=y
> > > +
> > > +# Driver interface for the Broadcom RoboSwitch family
> > > +#CONFIG_DRIVER_ROBOSWITCH=y
> > > +
> > > +# Driver interface for no driver (e.g., WPS ER only)
> > > +#CONFIG_DRIVER_NONE=y
> > > +
> > > +# Solaris libraries
> > > +#LIBS += -lsocket -ldlpi -lnsl
> > > +#LIBS_c += -lsocket
> > > +
> > > +# Enable IEEE 802.1X Supplicant (automatically included if any EAP method or
> > > +# MACsec is included)
> > > +CONFIG_IEEE8021X_EAPOL=y
> > > +
> > > +# EAP-MD5
> > > +CONFIG_EAP_MD5=y
> > > +
> > > +# EAP-MSCHAPv2
> > > +CONFIG_EAP_MSCHAPV2=y
> > > +
> > > +# EAP-TLS
> > > +CONFIG_EAP_TLS=y
> > > +# Enable EAP-TLSv1.3 support by default (currently disabled unless explicitly
> > > +# enabled in network configuration)
> > > +#CONFIG_EAP_TLSV1_3=y
> > > +
> > > +# EAL-PEAP
> > > +CONFIG_EAP_PEAP=y
> > > +
> > > +# EAP-TTLS
> > > +CONFIG_EAP_TTLS=y
> > > +
> > > +# EAP-FAST
> > > +CONFIG_EAP_FAST=y
> > > +
> > > +# EAP-TEAP
> > > +# Note: The current EAP-TEAP implementation is experimental and should not be
> > > +# enabled for production use. The IETF RFC 7170 that defines EAP-TEAP has number
> > > +# of conflicting statements and missing details and the implementation has
> > > +# vendor specific workarounds for those and as such, may not interoperate with
> > > +# any other implementation. This should not be used for anything else than
> > > +# experimentation and interoperability testing until those issues has been
> > > +# resolved.
> > > +#CONFIG_EAP_TEAP=y
> > > +
> > > +# EAP-GTC
> > > +CONFIG_EAP_GTC=y
> > > +
> > > +# EAP-OTP
> > > +CONFIG_EAP_OTP=y
> > > +
> > > +# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
> > > +#CONFIG_EAP_SIM=y
> > > +
> > > +# Enable SIM simulator (Milenage) for EAP-SIM
> > > +#CONFIG_SIM_SIMULATOR=y
> > > +
> > > +# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
> > > +#CONFIG_EAP_PSK=y
> > > +
> > > +# EAP-pwd (secure authentication using only a password)
> > > +CONFIG_EAP_PWD=y
> > > +
> > > +# EAP-PAX
> > > +CONFIG_EAP_PAX=y
> > > +
> > > +# LEAP
> > > +CONFIG_EAP_LEAP=y
> > > +
> > > +# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
> > > +#CONFIG_EAP_AKA=y
> > > +
> > > +# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
> > > +# This requires CONFIG_EAP_AKA to be enabled, too.
> > > +#CONFIG_EAP_AKA_PRIME=y
> > > +
> > > +# Enable USIM simulator (Milenage) for EAP-AKA
> > > +#CONFIG_USIM_SIMULATOR=y
> > > +
> > > +# EAP-SAKE
> > > +CONFIG_EAP_SAKE=y
> > > +
> > > +# EAP-GPSK
> > > +CONFIG_EAP_GPSK=y
> > > +# Include support for optional SHA256 cipher suite in EAP-GPSK
> > > +CONFIG_EAP_GPSK_SHA256=y
> > > +
> > > +# EAP-TNC and related Trusted Network Connect support (experimental)
> > > +CONFIG_EAP_TNC=y
> > > +
> > > +# Wi-Fi Protected Setup (WPS)
> > > +CONFIG_WPS=y
> > > +# Enable WPS external registrar functionality
> > > +#CONFIG_WPS_ER=y
> > > +# Disable credentials for an open network by default when acting as a WPS
> > > +# registrar.
> > > +#CONFIG_WPS_REG_DISABLE_OPEN=y
> > > +# Enable WPS support with NFC config method
> > > +#CONFIG_WPS_NFC=y
> > > +
> > > +# EAP-IKEv2
> > > +CONFIG_EAP_IKEV2=y
> > > +
> > > +# EAP-EKE
> > > +#CONFIG_EAP_EKE=y
> > > +
> > > +# MACsec
> > > +CONFIG_MACSEC=y
> > > +
> > > +# PKCS#12 (PFX) support (used to read private key and certificate file from
> > > +# a file that usually has extension .p12 or .pfx)
> > > +CONFIG_PKCS12=y
> > > +
> > > +# Smartcard support (i.e., private key on a smartcard), e.g., with openssl
> > > +# engine.
> > > +CONFIG_SMARTCARD=y
> > > +
> > > +# PC/SC interface for smartcards (USIM, GSM SIM)
> > > +# Enable this if EAP-SIM or EAP-AKA is included
> > > +#CONFIG_PCSC=y
> > > +
> > > +# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
> > > +#CONFIG_HT_OVERRIDES=y
> > > +
> > > +# Support VHT overrides (disable VHT, mask MCS rates, etc.)
> > > +#CONFIG_VHT_OVERRIDES=y
> > > +
> > > +# Support HE overrides
> > > +#CONFIG_HE_OVERRIDES=y
> > > +
> > > +# Development testing
> > > +#CONFIG_EAPOL_TEST=y
> > > +
> > > +# Support IPv6
> > > +CONFIG_IPV6=y
> > > +
> > > +# Select control interface backend for external programs, e.g, wpa_cli:
> > > +# unix = UNIX domain sockets (default for Linux/*BSD)
> > > +# udp = UDP sockets using localhost (127.0.0.1)
> > > +# udp6 = UDP IPv6 sockets using localhost (::1)
> > > +# named_pipe = Windows Named Pipe (default for Windows)
> > > +# udp-remote = UDP sockets with remote access (only for tests systems/purpose)
> > > +# udp6-remote = UDP IPv6 sockets with remote access (only for tests purpose)
> > > +# y = use default (backwards compatibility)
> > > +# If this option is commented out, control interface is not included in the
> > > +# build.
> > > +CONFIG_CTRL_IFACE=y
> > > +
> > > +# Include support for GNU Readline and History Libraries in wpa_cli.
> > > +# When building a wpa_cli binary for distribution, please note that these
> > > +# libraries are licensed under GPL and as such, BSD license may not apply for
> > > +# the resulting binary.
> > > +#CONFIG_READLINE=y
> > > +
> > > +# Include internal line edit mode in wpa_cli. This can be used as a replacement
> > > +# for GNU Readline to provide limited command line editing and history support.
> > > +#CONFIG_WPA_CLI_EDIT=y
> > > +
> > > +# Remove debugging code that is printing out debug message to stdout.
> > > +# This can be used to reduce the size of the wpa_supplicant considerably
> > > +# if debugging code is not needed. The size reduction can be around 35%
> > > +# (e.g., 90 kB).
> > > +#CONFIG_NO_STDOUT_DEBUG=y
> > > +
> > > +# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to save
> > > +# 35-50 kB in code size.
> > > +#CONFIG_NO_WPA=y
> > > +
> > > +# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
> > > +# This option can be used to reduce code size by removing support for
> > > +# converting ASCII passphrases into PSK. If this functionality is removed, the
> > > +# PSK can only be configured as the 64-octet hexstring (e.g., from
> > > +# wpa_passphrase). This saves about 0.5 kB in code size.
> > > +#CONFIG_NO_WPA_PASSPHRASE=y
> > > +
> > > +# Simultaneous Authentication of Equals (SAE), WPA3-Personal
> > > +CONFIG_SAE=y
> > > +
> > > +# SAE Public Key, WPA3-Personal
> > > +#CONFIG_SAE_PK=y
> > > +
> > > +# Disable scan result processing (ap_scan=1) to save code size by about 1 kB.
> > > +# This can be used if ap_scan=1 mode is never enabled.
> > > +#CONFIG_NO_SCAN_PROCESSING=y
> > > +
> > > +# Select configuration backend:
> > > +# file = text file (e.g., wpa_supplicant.conf; note: the configuration file
> > > +#      path is given on command line, not here; this option is just used to
> > > +#      select the backend that allows configuration files to be used)
> > > +# winreg = Windows registry (see win_example.reg for an example)
> > > +CONFIG_BACKEND=file
> > > +
> > > +# Remove configuration write functionality (i.e., to allow the configuration
> > > +# file to be updated based on runtime configuration changes). The runtime
> > > +# configuration can still be changed, the changes are just not going to be
> > > +# persistent over restarts. This option can be used to reduce code size by
> > > +# about 3.5 kB.
> > > +#CONFIG_NO_CONFIG_WRITE=y
> > > +
> > > +# Remove support for configuration blobs to reduce code size by about 1.5 kB.
> > > +#CONFIG_NO_CONFIG_BLOBS=y
> > > +
> > > +# Select program entry point implementation:
> > > +# main = UNIX/POSIX like main() function (default)
> > > +# main_winsvc = Windows service (read parameters from registry)
> > > +# main_none = Very basic example (development use only)
> > > +#CONFIG_MAIN=main
> > > +
> > > +# Select wrapper for operating system and C library specific functions
> > > +# unix = UNIX/POSIX like systems (default)
> > > +# win32 = Windows systems
> > > +# none = Empty template
> > > +#CONFIG_OS=unix
> > > +
> > > +# Select event loop implementation
> > > +# eloop = select() loop (default)
> > > +# eloop_win = Windows events and WaitForMultipleObject() loop
> > > +#CONFIG_ELOOP=eloop
> > > +
> > > +# Should we use poll instead of select? Select is used by default.
> > > +#CONFIG_ELOOP_POLL=y
> > > +
> > > +# Should we use epoll instead of select? Select is used by default.
> > > +#CONFIG_ELOOP_EPOLL=y
> > > +
> > > +# Should we use kqueue instead of select? Select is used by default.
> > > +#CONFIG_ELOOP_KQUEUE=y
> > > +
> > > +# Select layer 2 packet implementation
> > > +# linux = Linux packet socket (default)
> > > +# pcap = libpcap/libdnet/WinPcap
> > > +# freebsd = FreeBSD libpcap
> > > +# winpcap = WinPcap with receive thread
> > > +# ndis = Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=y)
> > > +# none = Empty template
> > > +#CONFIG_L2_PACKET=linux
> > > +
> > > +# Disable Linux packet socket workaround applicable for station interface
> > > +# in a bridge for EAPOL frames. This should be uncommented only if the kernel
> > > +# is known to not have the regression issue in packet socket behavior with
> > > +# bridge interfaces (commit 'bridge: respect RFC2863 operational state')').
> > > +#CONFIG_NO_LINUX_PACKET_SOCKET_WAR=y
> > > +
> > > +# Support Operating Channel Validation
> > > +#CONFIG_OCV=y
> > > +
> > > +# Select TLS implementation
> > > +# openssl = OpenSSL (default)
> > > +# gnutls = GnuTLS
> > > +# internal = Internal TLSv1 implementation (experimental)
> > > +# linux = Linux kernel AF_ALG and internal TLSv1 implementation (experimental)
> > > +# none = Empty template
> > > +#CONFIG_TLS=openssl
> > > +
> > > +# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.1)
> > > +# can be enabled to get a stronger construction of messages when block ciphers
> > > +# are used. It should be noted that some existing TLS v1.0 -based
> > > +# implementation may not be compatible with TLS v1.1 message (ClientHello is
> > > +# sent prior to negotiating which version will be used)
> > > +#CONFIG_TLSV11=y
> > > +
> > > +# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.2)
> > > +# can be enabled to enable use of stronger crypto algorithms. It should be
> > > +# noted that some existing TLS v1.0 -based implementation may not be compatible
> > > +# with TLS v1.2 message (ClientHello is sent prior to negotiating which version
> > > +# will be used)
> > > +#CONFIG_TLSV12=y
> > > +
> > > +# Select which ciphers to use by default with OpenSSL if the user does not
> > > +# specify them.
> > > +#CONFIG_TLS_DEFAULT_CIPHERS="DEFAULT:!EXP:!LOW"
> > > +
> > > +# If CONFIG_TLS=internal is used, additional library and include paths are
> > > +# needed for LibTomMath. Alternatively, an integrated, minimal version of
> > > +# LibTomMath can be used. See beginning of libtommath.c for details on benefits
> > > +# and drawbacks of this option.
> > > +#CONFIG_INTERNAL_LIBTOMMATH=y
> > > +#ifndef CONFIG_INTERNAL_LIBTOMMATH
> > > +#LTM_PATH=/usr/src/libtommath-0.39
> > > +#CFLAGS += -I$(LTM_PATH)
> > > +#LIBS += -L$(LTM_PATH)
> > > +#LIBS_p += -L$(LTM_PATH)
> > > +#endif
> > > +# At the cost of about 4 kB of additional binary size, the internal LibTomMath
> > > +# can be configured to include faster routines for exptmod, sqr, and div to
> > > +# speed up DH and RSA calculation considerably
> > > +#CONFIG_INTERNAL_LIBTOMMATH_FAST=y
> > > +
> > > +# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
> > > +# This is only for Windows builds and requires WMI-related header files and
> > > +# WbemUuid.Lib from Platform SDK even when building with MinGW.
> > > +#CONFIG_NDIS_EVENTS_INTEGRATED=y
> > > +#PLATFORMSDKLIB="/opt/Program Files/Microsoft Platform SDK/Lib"
> > > +
> > > +# Add support for new DBus control interface
> > > +# (fi.w1.wpa_supplicant1)
> > > +CONFIG_CTRL_IFACE_DBUS_NEW=y
> > > +
> > > +# Add introspection support for new DBus control interface
> > > +CONFIG_CTRL_IFACE_DBUS_INTRO=y
> > > +
> > > +# Add support for loading EAP methods dynamically as shared libraries.
> > > +# When this option is enabled, each EAP method can be either included
> > > +# statically (CONFIG_EAP_<method>=y) or dynamically (CONFIG_EAP_<method>=dyn).
> > > +# Dynamic EAP methods are build as shared objects (eap_*.so) and they need to
> > > +# be loaded in the beginning of the wpa_supplicant configuration file
> > > +# (see load_dynamic_eap parameter in the example file) before being used in
> > > +# the network blocks.
> > > +#
> > > +# Note that some shared parts of EAP methods are included in the main program
> > > +# and in order to be able to use dynamic EAP methods using these parts, the
> > > +# main program must have been build with the EAP method enabled (=y or =dyn).
> > > +# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libraries
> > > +# unless at least one of them was included in the main build to force inclusion
> > > +# of the shared code. Similarly, at least one of EAP-SIM/AKA must be included
> > > +# in the main build to be able to load these methods dynamically.
> > > +#
> > > +# Please also note that using dynamic libraries will increase the total binary
> > > +# size. Thus, it may not be the best option for targets that have limited
> > > +# amount of memory/flash.
> > > +#CONFIG_DYNAMIC_EAP_METHODS=y
> > > +
> > > +# Dynamic library loading
> > > +
> > > +# Add the ability to configure libraries to load at compile time.
> > > +# If set, these disable dynamic configuration.
> > > +#CONFIG_PKCS11_ENGINE_PATH - pkcs11_engine library location.
> > > +#CONFIG_PKCS11_MODULE_PATH - pkcs11_module library location.
> > > +#CONFIG_OPENSC_ENGINE_PATH - opensc_engine library location.
> > > +#
> > > +# Prevent library loading at runtime
> > > +#CONFIG_NO_PKCS11_ENGINE_PATH=y # prevents loading pkcs11_engine library.
> > > +#CONFIG_NO_PKCS11_MODULE_PATH=y # prevents loading pkcs11_module library.
> > > +# CONFIG_NO_OPENSC_ENGINE_PATH=y # prevents loading opensc_engine library.
> > > +
> > > +# Prevents loading EAP libraries at runtime
> > > +#CONFIG_NO_LOAD_DYNAMIC_EAP=y
> > > +
> > > +# IEEE Std 802.11r-2008 (Fast BSS Transition) for station mode
> > > +CONFIG_IEEE80211R=y
> > > +
> > > +# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#.txt)
> > > +CONFIG_DEBUG_FILE=y
> > > +
> > > +# Send debug messages to syslog instead of stdout
> > > +CONFIG_DEBUG_SYSLOG=y
> > > +# Set syslog facility for debug messages
> > > +#CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
> > > +
> > > +# Add support for sending all debug messages (regardless of debug verbosity)
> > > +# to the Linux kernel tracing facility. This helps debug the entire stack by
> > > +# making it easy to record everything happening from the driver up into the
> > > +# same file, e.g., using trace-cmd.
> > > +#CONFIG_DEBUG_LINUX_TRACING=y
> > > +
> > > +# Add support for writing debug log to Android logcat instead of standard
> > > +# output
> > > +#CONFIG_ANDROID_LOG=y
> > > +
> > > +# Enable privilege separation (see README 'Privilege separation' for details)
> > > +#CONFIG_PRIVSEP=y
> > > +
> > > +# Enable mitigation against certain attacks against TKIP by delaying Michael
> > > +# MIC error reports by a random amount of time between 0 and 60 seconds
> > > +#CONFIG_DELAYED_MIC_ERROR_REPORT=y
> > > +
> > > +# Enable tracing code for developer debugging
> > > +# This tracks use of memory allocations and other registrations and reports
> > > +# incorrect use with a backtrace of call (or allocation) location.
> > > +#CONFIG_WPA_TRACE=y
> > > +# For BSD, uncomment these.
> > > +#LIBS += -lexecinfo
> > > +#LIBS_p += -lexecinfo
> > > +#LIBS_c += -lexecinfo
> > > +
> > > +# Use libbfd to get more details for developer debugging
> > > +# This enables use of libbfd to get more detailed symbols for the backtraces
> > > +# generated by CONFIG_WPA_TRACE=y.
> > > +#CONFIG_WPA_TRACE_BFD=y
> > > +# For BSD, uncomment these.
> > > +#LIBS += -lbfd -liberty -lz
> > > +#LIBS_p += -lbfd -liberty -lz
> > > +#LIBS_c += -lbfd -liberty -lz
> > > +
> > > +# wpa_supplicant depends on strong random number generation being available
> > > +# from the operating system. os_get_random() function is used to fetch random
> > > +# data when needed, e.g., for key generation. On Linux and BSD systems, this
> > > +# works by reading /dev/urandom. It should be noted that the OS entropy pool
> > > +# needs to be properly initialized before wpa_supplicant is started. This is
> > > +# important especially on embedded devices that do not have a hardware random
> > > +# number generator and may by default start up with minimal entropy available
> > > +# for random number generation.
> > > +#
> > > +# As a safety net, wpa_supplicant is by default trying to internally collect
> > > +# additional entropy for generating random data to mix in with the data fetched
> > > +# from the OS. This by itself is not considered to be very strong, but it may
> > > +# help in cases where the system pool is not initialized properly. However, it
> > > +# is very strongly recommended that the system pool is initialized with enough
> > > +# entropy either by using hardware assisted random number generator or by
> > > +# storing state over device reboots.
> > > +#
> > > +# wpa_supplicant can be configured to maintain its own entropy store over
> > > +# restarts to enhance random number generation. This is not perfect, but it is
> > > +# much more secure than using the same sequence of random numbers after every
> > > +# reboot. This can be enabled with -e<entropy file> command line option. The
> > > +# specified file needs to be readable and writable by wpa_supplicant.
> > > +#
> > > +# If the os_get_random() is known to provide strong random data (e.g., on
> > > +# Linux/BSD, the board in question is known to have reliable source of random
> > > +# data from /dev/urandom), the internal wpa_supplicant random pool can be
> > > +# disabled. This will save some in binary size and CPU use. However, this
> > > +# should only be considered for builds that are known to be used on devices
> > > +# that meet the requirements described above.
> > > +#CONFIG_NO_RANDOM_POOL=y
> > > +
> > > +# Should we attempt to use the getrandom(2) call that provides more reliable
> > > +# yet secure randomness source than /dev/random on Linux 3.17 and newer.
> > > +# Requires glibc 2.25 to build, falls back to /dev/random if unavailable.
> > > +#CONFIG_GETRANDOM=y
> > > +
> > > +# IEEE 802.11ac (Very High Throughput) support (mainly for AP mode)
> > > +CONFIG_IEEE80211AC=y
> > > +
> > > +# IEEE 802.11ax HE support (mainly for AP mode)
> > > +CONFIG_IEEE80211AX=y
> > > +
> > > +# IEEE 802.11be EHT support (mainly for AP mode)
> > > +# CONFIG_IEEE80211AX is mandatory for setting CONFIG_IEEE80211BE.
> > > +# Note: This is experimental and work in progress. The definitions are still
> > > +# subject to change and this should not be expected to interoperate with the
> > > +# final IEEE 802.11be version.
> > > +#CONFIG_IEEE80211BE=y
> > > +
> > > +# Wireless Network Management (IEEE Std 802.11v-2011)
> > > +# Note: This is experimental and not complete implementation.
> > > +#CONFIG_WNM=y
> > > +
> > > +# Interworking (IEEE 802.11u)
> > > +# This can be used to enable functionality to improve interworking with
> > > +# external networks (GAS/ANQP to learn more about the networks and network
> > > +# selection based on available credentials).
> > > +CONFIG_INTERWORKING=y
> > > +
> > > +# Hotspot 2.0
> > > +CONFIG_HS20=y
> > > +
> > > +# Enable interface matching in wpa_supplicant
> > > +#CONFIG_MATCH_IFACE=y
> > > +
> > > +# Disable roaming in wpa_supplicant
> > > +#CONFIG_NO_ROAMING=y
> > > +
> > > +# AP mode operations with wpa_supplicant
> > > +# This can be used for controlling AP mode operations with wpa_supplicant. It
> > > +# should be noted that this is mainly aimed at simple cases like
> > > +# WPA2-Personal while more complex configurations like WPA2-Enterprise with an
> > > +# external RADIUS server can be supported with hostapd.
> > > +CONFIG_AP=y
> > > +
> > > +# P2P (Wi-Fi Direct)
> > > +# This can be used to enable P2P support in wpa_supplicant. See README-P2P for
> > > +# more information on P2P operations.
> > > +CONFIG_P2P=y
> > > +
> > > +# Enable TDLS support
> > > +CONFIG_TDLS=y
> > > +
> > > +# Wi-Fi Display
> > > +# This can be used to enable Wi-Fi Display extensions for P2P using an external
> > > +# program to control the additional information exchanges in the messages.
> > > +CONFIG_WIFI_DISPLAY=y
> > > +
> > > +# Autoscan
> > > +# This can be used to enable automatic scan support in wpa_supplicant.
> > > +# See wpa_supplicant.conf for more information on autoscan usage.
> > > +#
> > > +# Enabling directly a module will enable autoscan support.
> > > +# For exponential module:
> > > +#CONFIG_AUTOSCAN_EXPONENTIAL=y
> > > +# For periodic module:
> > > +#CONFIG_AUTOSCAN_PERIODIC=y
> > > +
> > > +# Password (and passphrase, etc.) backend for external storage
> > > +# These optional mechanisms can be used to add support for storing passwords
> > > +# and other secrets in external (to wpa_supplicant) location. This allows, for
> > > +# example, operating system specific key storage to be used
> > > +#
> > > +# External password backend for testing purposes (developer use)
> > > +#CONFIG_EXT_PASSWORD_TEST=y
> > > +# File-based backend to read passwords from an external file.
> > > +#CONFIG_EXT_PASSWORD_FILE=y
> > > +
> > > +# Enable Fast Session Transfer (FST)
> > > +#CONFIG_FST=y
> > > +
> > > +# Enable CLI commands for FST testing
> > > +#CONFIG_FST_TEST=y
> > > +
> > > +# OS X builds. This is only for building eapol_test.
> > > +#CONFIG_OSX=y
> > > +
> > > +# Automatic Channel Selection
> > > +# This will allow wpa_supplicant to pick the channel automatically when channel
> > > +# is set to "0".
> > > +#
> > > +# TODO: Extend parser to be able to parse "channel=acs_survey" as an alternative
> > > +# to "channel=0". This would enable us to eventually add other ACS algorithms in
> > > +# similar way.
> > > +#
> > > +# Automatic selection is currently only done through initialization, later on
> > > +# we hope to do background checks to keep us moving to more ideal channels as
> > > +# time goes by. ACS is currently only supported through the nl80211 driver and
> > > +# your driver must have survey dump capability that is filled by the driver
> > > +# during scanning.
> > > +#
> > > +# TODO: In analogy to hostapd be able to customize the ACS survey algorithm with
> > > +# a newly to create wpa_supplicant.conf variable acs_num_scans.
> > > +#
> > > +# Supported ACS drivers:
> > > +# * ath9k
> > > +# * ath5k
> > > +# * ath10k
> > > +#
> > > +# For more details refer to:
> > > +# http://wireless.kernel.org/en/users/Documentation/acs
> > > +#CONFIG_ACS=y
> > > +
> > > +# Support Multi Band Operation
> > > +#CONFIG_MBO=y
> > > +
> > > +# Fast Initial Link Setup (FILS) (IEEE 802.11ai)
> > > +#CONFIG_FILS=y
> > > +# FILS shared key authentication with PFS
> > > +#CONFIG_FILS_SK_PFS=y
> > > +
> > > +# Support RSN on IBSS networks
> > > +# This is needed to be able to use mode=1 network profile with proto=RSN and
> > > +# key_mgmt=WPA-PSK (i.e., full key management instead of WPA-None).
> > > +CONFIG_IBSS_RSN=y
> > > +
> > > +# External PMKSA cache control
> > > +# This can be used to enable control interface commands that allow the current
> > > +# PMKSA cache entries to be fetched and new entries to be added.
> > > +#CONFIG_PMKSA_CACHE_EXTERNAL=y
> > > +
> > > +# Mesh Networking (IEEE 802.11s)
> > > +#CONFIG_MESH=y
> > > +
> > > +# Background scanning modules
> > > +# These can be used to request wpa_supplicant to perform background scanning
> > > +# operations for roaming within an ESS (same SSID). See the bgscan parameter in
> > > +# the wpa_supplicant.conf file for more details.
> > > +# Periodic background scans based on signal strength
> > > +CONFIG_BGSCAN_SIMPLE=y
> > > +# Learn channels used by the network and try to avoid bgscans on other
> > > +# channels (experimental)
> > > +#CONFIG_BGSCAN_LEARN=y
> > > +
> > > +# Opportunistic Wireless Encryption (OWE)
> > > +# Experimental implementation of draft-harkins-owe-07.txt
> > > +#CONFIG_OWE=y
> > > +
> > > +# Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Connect)
> > > +CONFIG_DPP=y
> > > +# DPP version 2 support
> > > +CONFIG_DPP2=y
> > > +# DPP version 3 support (experimental and still changing; do not enable for
> > > +# production use)
> > > +#CONFIG_DPP3=y
> > > +
> > > +# Wired equivalent privacy (WEP)
> > > +# WEP is an obsolete cryptographic data confidentiality algorithm that is not
> > > +# considered secure. It should not be used for anything anymore. The
> > > +# functionality needed to use WEP is available in the current wpa_supplicant
> > > +# release under this optional build parameter. This functionality is subject to
> > > +# be completely removed in a future release.
> > > +#CONFIG_WEP=y
> > > +
> > > +# Remove all TKIP functionality
> > > +# TKIP is an old cryptographic data confidentiality algorithm that is not
> > > +# considered secure. It should not be used anymore for anything else than a
> > > +# backwards compatibility option as a group cipher when connecting to APs that
> > > +# use WPA+WPA2 mixed mode. For now, the default wpa_supplicant build includes
> > > +# support for this by default, but that functionality is subject to be removed
> > > +# in the future.
> > > +#CONFIG_NO_TKIP=y
> > > +
> > > +# Pre-Association Security Negotiation (PASN)
> > > +# Experimental implementation based on IEEE P802.11z/D2.6 and the protocol
> > > +# design is still subject to change. As such, this should not yet be enabled in
> > > +# production use.
> > > +#CONFIG_PASN=y
> > > +
> > > +# Disable support for Radio Measurement (IEEE 802.11k) and supported operating
> > > +# class indication. Removing these is not recommended since they can help the
> > > +# AP manage the network and STA steering.
> > > +#CONFIG_NO_RRM=y
> > > +
> > > +# Disable support for Robust AV streaming for consumer and enterprise Wi-Fi
> > > +# applications; IEEE Std 802.11-2020, 4.3.24; SCS, MSCS, QoS Management
> > > +#CONFIG_NO_ROBUST_AV=y
> > > +
> > > +# Disable support for WMM admission control
> > > +#CONFIG_NO_WMM_AC=y
> > > +
> > > +# Wi-Fi Aware unsynchronized service discovery (NAN USD)
> > > +#CONFIG_NAN_USD=y
> > > diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> > > index ffb1cf617d..b9a8964439 100644
> > > --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> > > +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> > > @@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5ebcb90236d1ad640558c3d3cd3035df \
> > >  DEPENDS = "dbus libnl"
> > >
> > >  SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
> > > +           file://defconfig \
> > >             file://wpa-supplicant.sh \
> > >             file://wpa_supplicant.conf \
> > >             file://wpa_supplicant.conf-sane \
> > > @@ -37,7 +38,9 @@ EXTRA_OEMAKE = "'LIBDIR=${libdir}' 'INCDIR=${includedir}' 'BINDIR=${sbindir}'"
> > >
> > >  do_configure () {
> > >         ${MAKE} -C wpa_supplicant clean
> > > -       sed -e '/^CONFIG_TLS=/d' <wpa_supplicant/defconfig >wpa_supplicant/.config
> > > +       install -m 0755 ${UNPACKDIR}/defconfig wpa_supplicant/.config
> > > +
> > > +       sed -i '/CONFIG_TLS=/d' wpa_supplicant/.config
> > >
> > >         if ${@ bb.utils.contains('PACKAGECONFIG', 'openssl', 'true', 'false', d) }; then
> > >                 echo 'CONFIG_TLS=openssl' >>wpa_supplicant/.config
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#226912): https://lists.openembedded.org/g/openembedded-core/message/226912
> > Mute This Topic: https://lists.openembedded.org/mt/116508467/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> 

-- 
With best wishes
Dmitry

