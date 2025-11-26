Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AAFD116F8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 12:46:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14503.1764168713653785043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 06:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HrrIYo/A;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GZEpc5+/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ9wFt63317325
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 14:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aq1f6wTZ0Vn
	qdEO7wkzk7nSs3hPuQGzJgPjREBj1/lg=; b=HrrIYo/AJ671JsoG5fF43UbjSqj
	Wh7pxnI2nZP92SXmrvXxDucox4k1Q1+gNHdqBLDGNC48rev2p86QnXS6kenEvpM5
	fdUIhmPjp0otd4s4/L6E9Pf2rVHiZqfSJTCx8vHEWJcFbNI5pJ6FdP7WV3Wl8dqE
	SLig9JZwRVT24eH5es5dl5caK0W50Hy+1g6H55iyRuOGPdZV0fY55/ArW558Fk6F
	o08ayfMQVRtQIm3u+CVBWlUZsdq7rnnnCE4rsjxEf8n1WOTURGGdNHDPHS+45Ls1
	iqqg3Xl6CIBMaHufz3129JagqDZ1sZulRUoD5qgPRVnmC34iBWsR5QNZo/A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qksfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 14:07:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7c1df71b076so13059597b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764166046; x=1764770846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aq1f6wTZ0VnqdEO7wkzk7nSs3hPuQGzJgPjREBj1/lg=;
        b=GZEpc5+/hZkCYdE8ODLUPCBK0U0ZZAeCqXTUMdSSwQmWcXF90ILEorMV+a7BSpz4De
         S7F7gEX2YCkaNmmUUmciKCb+MY5hEdX8GIKk6ij1zChMbKDmvkeAVi/G/1S11LGUgUSO
         ABH990A53B4i7k7VjtA/OflWFuZgUFWsSjUtfJdTcdz5EE4aU3CoRAh9rTogrdG8ECQP
         KuJvEngMj82OAlw+nw9X2S93uNVzfgT1+bSs+d1JvBG0AMauoUGcaQYOhkYL0bMIKqss
         BgwViGqy15hmORRrpjmptTZ+fNHWe/ZP+qTQYFdBGmfBJ6BI07LMTtH1G8AmfpDCX77h
         Ot4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166046; x=1764770846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aq1f6wTZ0VnqdEO7wkzk7nSs3hPuQGzJgPjREBj1/lg=;
        b=vE1n1q5GjI5utRLBXJAWkYrQOtTfFpFpFZymQDq6icfEYgos7LvmE1o62NidKabBZc
         TDwij4LFFROMuOz5A6sZZ8qtTf3WspVBYrs93XhMGXiH491yGKfhO1kFpr8dupbNALPE
         3CzUfunG6iBohRXryZOUgeFx2pzb2T9Pug4h9Qdcq3Uq4u4nIejmECGlcOnDQG53MVuG
         B9aaxFuFKGn+lJ8wRqk1wgFBAi1nzu/wQTbVpVX5uA3Yyp+P2CXMMCL0voCryg0zty4w
         phgXZ/4C9G5/XKf+LSQP7Ne9CGE5MFrD3B2w4mBxSFKcuOqJLc3uJSwEIMU+TyC0Mshw
         6+HQ==
X-Gm-Message-State: AOJu0Yz/Olrgarcx6a1xKfwh1fmqWrl3U6Ui7iXC/UfJILTF/9l5tv+0
	ctJxtCMTDY31ENSaiod9l66M0YTHjResm8HzHBDm9bMc5fGOTwFmeOcrZdDmVWmG6zhdl+gIfvd
	XHXHf34bMQIPrfA9RIr22UGeaYxdEL9dFFnNlrke8hu/YetU2piNwkgac+cU/c7NzREi/T/Ih+D
	1UFAvBI7iFp1n/QCZfBA==
X-Gm-Gg: ASbGncuzlV9mF2AjX7LKrDHbow1Xbp4EXvZcm+OkkluZ8UVjqQOWGR9PoqceRxPodjE
	bRUioFQqwSbIorVvPB2RFtkI5U9sxWlmg81tlkv/VNzQylnbnMQ0zaQAJ3Qc6bd42H3dlHjfIfP
	igGEGfDAQQGjICm/3MXcfxKYDrlOdVZLDXOH/aTJVzmp9Yy4YxvXyo7nEI0QRwROF/c/wnwPUcl
	tus5n8QtEDRpLFUAGcWD1TnYfWLSwKSy4x+BKqD1XljYyA49o8suyu/tjomGFX1h33eobO6kF8F
	bYs/mwz3UgLNvsr8VjfPNdLAGEPD0gln3XGzouGgLktjHuNsY7G/sKuccNf0/1ZqzQ/VQMy0qzv
	zb81X+pddtBa/AJah25hXtR9AD8nxUVYnCt1+t3vutUHqFivQrl9Bn51MSZxCi9R/Sbpj
X-Received: by 2002:a05:6a00:1812:b0:7ad:e4c5:2d5f with SMTP id d2e1a72fcca58-7c58c2ab975mr21293300b3a.3.1764166045076;
        Wed, 26 Nov 2025 06:07:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENY8sesXLed57AljtLK1jV9ZYB2ESwhSnGkubGWfNYKSTx8stKye8zXUmw95YqK0NOaHAzdw==
X-Received: by 2002:a05:6a00:1812:b0:7ad:e4c5:2d5f with SMTP id d2e1a72fcca58-7c58c2ab975mr21293238b3a.3.1764166044012;
        Wed, 26 Nov 2025 06:07:24 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63dbcsm21624961b3a.50.2025.11.26.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:07:23 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH 1/4] wpa-supplicant: restore use of packaged defconfig
Date: Wed, 26 Nov 2025 22:07:10 +0800
Message-Id: <20251126140713.1414484-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com>
References: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDExNiBTYWx0ZWRfX3JmnBmqqXcZs
 LWbt9o5fUDeCWKwG0QIqJdpNexvHIGDvNtrxGo7b0AU/nwFlJ6rMzD89f2Svx0KxGwWco66ZTFF
 cyDP5HYhh+qS1GvC+m00k8PB2wOgAxGNPBG1HZ6+RB9hpBSnX4pft4m03ka1SHHmi5MTuKHRO14
 OlvJsM/GXw2bwpvgXT7nuaA1cT3PtsFXRvhFQFJsQyRcBtCx58PqBGyW3oGcnv1cBtHbul43tGl
 lzSwFnQfHq0jH419caUBHRS7U61gcc8kD/uPVVV9lcIORiSf9+y5NlB5X/sm4sfUntcXzf6mCX8
 1cOFbffNSqcexhkKXgJYY1KIC9RE5Z9Jcl2QnnSwoHq+OtpbeNxlSD0OPIeliO4tbzM4/+taeFq
 aFG4No24cPROZqpx8GPt6pVq09GOZw==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=6927099f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yaAG3qJ-AAAA:8 a=EUspDBNiAAAA:8 a=Fx-A0zb3zkyeuN0FhHIA:9
 a=W7WeN97V9vU_l5Eb:21 a=IoOABgeZipijB_acs4fv:22 a=oLVlbjkABFOu4cUI0CGI:22
X-Proofpoint-ORIG-GUID: EWMYJ9GaEF0HO993Cwi3SyDnTwho8o3B
X-Proofpoint-GUID: EWMYJ9GaEF0HO993Cwi3SyDnTwho8o3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1011 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260116
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 12:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226842

commit d97bedd8bdcc ("wpa-supplicant: Use upstream defconfig") switched
to using the upstream defconfig, which made it cumbersome to enable new
CONFIG options because the upstream file does not include our custom
defaults.

This patch restores the use of the packaged defconfig from version 2.11
to simplify enabling additional options while keeping our baseline
configuration consistent.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../wpa-supplicant/wpa-supplicant/defconfig   | 688 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |   5 +-
 2 files changed, 692 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
new file mode 100644
index 0000000000..52befd8f15
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -0,0 +1,688 @@
+# Example wpa_supplicant build time configuration
+#
+# This file lists the configuration options that are used when building the
+# wpa_supplicant binary. All lines starting with # are ignored. Configuration
+# option lines must be commented out complete, if they are not to be included,
+# i.e., just setting VARIABLE=n is not disabling that variable.
+#
+# This file is included in Makefile, so variables like CFLAGS and LIBS can also
+# be modified from here. In most cases, these lines should use += in order not
+# to override previous values of the variables.
+
+
+# Uncomment following two lines and fix the paths if you have installed OpenSSL
+# or GnuTLS in non-default location
+#CFLAGS += -I/usr/local/openssl/include
+#LIBS += -L/usr/local/openssl/lib
+
+# Some Red Hat versions seem to include kerberos header files from OpenSSL, but
+# the kerberos files are not in the default include path. Following line can be
+# used to fix build issues on such systems (krb5.h not found).
+#CFLAGS += -I/usr/include/kerberos
+
+# Driver interface for generic Linux wireless extensions
+# Note: WEXT is deprecated in the current Linux kernel version and no new
+# functionality is added to it. nl80211-based interface is the new
+# replacement for WEXT and its use allows wpa_supplicant to properly control
+# the driver to improve existing functionality like roaming and to support new
+# functionality.
+CONFIG_DRIVER_WEXT=y
+
+# Driver interface for Linux drivers using the nl80211 kernel interface
+CONFIG_DRIVER_NL80211=y
+
+# QCA vendor extensions to nl80211
+#CONFIG_DRIVER_NL80211_QCA=y
+
+# driver_nl80211.c requires libnl. If you are compiling it yourself
+# you may need to point hostapd to your version of libnl.
+#
+#CFLAGS += -I$<path to libnl include files>
+#LIBS += -L$<path to libnl library files>
+
+# Use libnl v2.0 (or 3.0) libraries.
+#CONFIG_LIBNL20=y
+
+# Use libnl 3.2 libraries (if this is selected, CONFIG_LIBNL20 is ignored)
+CONFIG_LIBNL32=y
+
+
+# Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
+#CONFIG_DRIVER_BSD=y
+#CFLAGS += -I/usr/local/include
+#LIBS += -L/usr/local/lib
+#LIBS_p += -L/usr/local/lib
+#LIBS_c += -L/usr/local/lib
+
+# Driver interface for Windows NDIS
+#CONFIG_DRIVER_NDIS=y
+#CFLAGS += -I/usr/include/w32api/ddk
+#LIBS += -L/usr/local/lib
+# For native build using mingw
+#CONFIG_NATIVE_WINDOWS=y
+# Additional directories for cross-compilation on Linux host for mingw target
+#CFLAGS += -I/opt/mingw/mingw32/include/ddk
+#LIBS += -L/opt/mingw/mingw32/lib
+#CC=mingw32-gcc
+# By default, driver_ndis uses WinPcap for low-level operations. This can be
+# replaced with the following option which replaces WinPcap calls with NDISUIO.
+# However, this requires that WZC is disabled (net stop wzcsvc) before starting
+# wpa_supplicant.
+# CONFIG_USE_NDISUIO=y
+
+# Driver interface for wired Ethernet drivers
+CONFIG_DRIVER_WIRED=y
+
+# Driver interface for MACsec capable Qualcomm Atheros drivers
+#CONFIG_DRIVER_MACSEC_QCA=y
+
+# Driver interface for Linux MACsec drivers
+CONFIG_DRIVER_MACSEC_LINUX=y
+
+# Driver interface for the Broadcom RoboSwitch family
+#CONFIG_DRIVER_ROBOSWITCH=y
+
+# Driver interface for no driver (e.g., WPS ER only)
+#CONFIG_DRIVER_NONE=y
+
+# Solaris libraries
+#LIBS += -lsocket -ldlpi -lnsl
+#LIBS_c += -lsocket
+
+# Enable IEEE 802.1X Supplicant (automatically included if any EAP method or
+# MACsec is included)
+CONFIG_IEEE8021X_EAPOL=y
+
+# EAP-MD5
+CONFIG_EAP_MD5=y
+
+# EAP-MSCHAPv2
+CONFIG_EAP_MSCHAPV2=y
+
+# EAP-TLS
+CONFIG_EAP_TLS=y
+# Enable EAP-TLSv1.3 support by default (currently disabled unless explicitly
+# enabled in network configuration)
+#CONFIG_EAP_TLSV1_3=y
+
+# EAL-PEAP
+CONFIG_EAP_PEAP=y
+
+# EAP-TTLS
+CONFIG_EAP_TTLS=y
+
+# EAP-FAST
+CONFIG_EAP_FAST=y
+
+# EAP-TEAP
+# Note: The current EAP-TEAP implementation is experimental and should not be
+# enabled for production use. The IETF RFC 7170 that defines EAP-TEAP has number
+# of conflicting statements and missing details and the implementation has
+# vendor specific workarounds for those and as such, may not interoperate with
+# any other implementation. This should not be used for anything else than
+# experimentation and interoperability testing until those issues has been
+# resolved.
+#CONFIG_EAP_TEAP=y
+
+# EAP-GTC
+CONFIG_EAP_GTC=y
+
+# EAP-OTP
+CONFIG_EAP_OTP=y
+
+# EAP-SIM (enable CONFIG_PCSC, if EAP-SIM is used)
+#CONFIG_EAP_SIM=y
+
+# Enable SIM simulator (Milenage) for EAP-SIM
+#CONFIG_SIM_SIMULATOR=y
+
+# EAP-PSK (experimental; this is _not_ needed for WPA-PSK)
+#CONFIG_EAP_PSK=y
+
+# EAP-pwd (secure authentication using only a password)
+CONFIG_EAP_PWD=y
+
+# EAP-PAX
+CONFIG_EAP_PAX=y
+
+# LEAP
+CONFIG_EAP_LEAP=y
+
+# EAP-AKA (enable CONFIG_PCSC, if EAP-AKA is used)
+#CONFIG_EAP_AKA=y
+
+# EAP-AKA' (enable CONFIG_PCSC, if EAP-AKA' is used).
+# This requires CONFIG_EAP_AKA to be enabled, too.
+#CONFIG_EAP_AKA_PRIME=y
+
+# Enable USIM simulator (Milenage) for EAP-AKA
+#CONFIG_USIM_SIMULATOR=y
+
+# EAP-SAKE
+CONFIG_EAP_SAKE=y
+
+# EAP-GPSK
+CONFIG_EAP_GPSK=y
+# Include support for optional SHA256 cipher suite in EAP-GPSK
+CONFIG_EAP_GPSK_SHA256=y
+
+# EAP-TNC and related Trusted Network Connect support (experimental)
+CONFIG_EAP_TNC=y
+
+# Wi-Fi Protected Setup (WPS)
+CONFIG_WPS=y
+# Enable WPS external registrar functionality
+#CONFIG_WPS_ER=y
+# Disable credentials for an open network by default when acting as a WPS
+# registrar.
+#CONFIG_WPS_REG_DISABLE_OPEN=y
+# Enable WPS support with NFC config method
+#CONFIG_WPS_NFC=y
+
+# EAP-IKEv2
+CONFIG_EAP_IKEV2=y
+
+# EAP-EKE
+#CONFIG_EAP_EKE=y
+
+# MACsec
+CONFIG_MACSEC=y
+
+# PKCS#12 (PFX) support (used to read private key and certificate file from
+# a file that usually has extension .p12 or .pfx)
+CONFIG_PKCS12=y
+
+# Smartcard support (i.e., private key on a smartcard), e.g., with openssl
+# engine.
+CONFIG_SMARTCARD=y
+
+# PC/SC interface for smartcards (USIM, GSM SIM)
+# Enable this if EAP-SIM or EAP-AKA is included
+#CONFIG_PCSC=y
+
+# Support HT overrides (disable HT/HT40, mask MCS rates, etc.)
+#CONFIG_HT_OVERRIDES=y
+
+# Support VHT overrides (disable VHT, mask MCS rates, etc.)
+#CONFIG_VHT_OVERRIDES=y
+
+# Support HE overrides
+#CONFIG_HE_OVERRIDES=y
+
+# Development testing
+#CONFIG_EAPOL_TEST=y
+
+# Support IPv6
+CONFIG_IPV6=y
+
+# Select control interface backend for external programs, e.g, wpa_cli:
+# unix = UNIX domain sockets (default for Linux/*BSD)
+# udp = UDP sockets using localhost (127.0.0.1)
+# udp6 = UDP IPv6 sockets using localhost (::1)
+# named_pipe = Windows Named Pipe (default for Windows)
+# udp-remote = UDP sockets with remote access (only for tests systems/purpose)
+# udp6-remote = UDP IPv6 sockets with remote access (only for tests purpose)
+# y = use default (backwards compatibility)
+# If this option is commented out, control interface is not included in the
+# build.
+CONFIG_CTRL_IFACE=y
+
+# Include support for GNU Readline and History Libraries in wpa_cli.
+# When building a wpa_cli binary for distribution, please note that these
+# libraries are licensed under GPL and as such, BSD license may not apply for
+# the resulting binary.
+#CONFIG_READLINE=y
+
+# Include internal line edit mode in wpa_cli. This can be used as a replacement
+# for GNU Readline to provide limited command line editing and history support.
+#CONFIG_WPA_CLI_EDIT=y
+
+# Remove debugging code that is printing out debug message to stdout.
+# This can be used to reduce the size of the wpa_supplicant considerably
+# if debugging code is not needed. The size reduction can be around 35%
+# (e.g., 90 kB).
+#CONFIG_NO_STDOUT_DEBUG=y
+
+# Remove WPA support, e.g., for wired-only IEEE 802.1X supplicant, to save
+# 35-50 kB in code size.
+#CONFIG_NO_WPA=y
+
+# Remove IEEE 802.11i/WPA-Personal ASCII passphrase support
+# This option can be used to reduce code size by removing support for
+# converting ASCII passphrases into PSK. If this functionality is removed, the
+# PSK can only be configured as the 64-octet hexstring (e.g., from
+# wpa_passphrase). This saves about 0.5 kB in code size.
+#CONFIG_NO_WPA_PASSPHRASE=y
+
+# Simultaneous Authentication of Equals (SAE), WPA3-Personal
+CONFIG_SAE=y
+
+# SAE Public Key, WPA3-Personal
+#CONFIG_SAE_PK=y
+
+# Disable scan result processing (ap_scan=1) to save code size by about 1 kB.
+# This can be used if ap_scan=1 mode is never enabled.
+#CONFIG_NO_SCAN_PROCESSING=y
+
+# Select configuration backend:
+# file = text file (e.g., wpa_supplicant.conf; note: the configuration file
+#	path is given on command line, not here; this option is just used to
+#	select the backend that allows configuration files to be used)
+# winreg = Windows registry (see win_example.reg for an example)
+CONFIG_BACKEND=file
+
+# Remove configuration write functionality (i.e., to allow the configuration
+# file to be updated based on runtime configuration changes). The runtime
+# configuration can still be changed, the changes are just not going to be
+# persistent over restarts. This option can be used to reduce code size by
+# about 3.5 kB.
+#CONFIG_NO_CONFIG_WRITE=y
+
+# Remove support for configuration blobs to reduce code size by about 1.5 kB.
+#CONFIG_NO_CONFIG_BLOBS=y
+
+# Select program entry point implementation:
+# main = UNIX/POSIX like main() function (default)
+# main_winsvc = Windows service (read parameters from registry)
+# main_none = Very basic example (development use only)
+#CONFIG_MAIN=main
+
+# Select wrapper for operating system and C library specific functions
+# unix = UNIX/POSIX like systems (default)
+# win32 = Windows systems
+# none = Empty template
+#CONFIG_OS=unix
+
+# Select event loop implementation
+# eloop = select() loop (default)
+# eloop_win = Windows events and WaitForMultipleObject() loop
+#CONFIG_ELOOP=eloop
+
+# Should we use poll instead of select? Select is used by default.
+#CONFIG_ELOOP_POLL=y
+
+# Should we use epoll instead of select? Select is used by default.
+#CONFIG_ELOOP_EPOLL=y
+
+# Should we use kqueue instead of select? Select is used by default.
+#CONFIG_ELOOP_KQUEUE=y
+
+# Select layer 2 packet implementation
+# linux = Linux packet socket (default)
+# pcap = libpcap/libdnet/WinPcap
+# freebsd = FreeBSD libpcap
+# winpcap = WinPcap with receive thread
+# ndis = Windows NDISUIO (note: requires CONFIG_USE_NDISUIO=y)
+# none = Empty template
+#CONFIG_L2_PACKET=linux
+
+# Disable Linux packet socket workaround applicable for station interface
+# in a bridge for EAPOL frames. This should be uncommented only if the kernel
+# is known to not have the regression issue in packet socket behavior with
+# bridge interfaces (commit 'bridge: respect RFC2863 operational state')').
+#CONFIG_NO_LINUX_PACKET_SOCKET_WAR=y
+
+# Support Operating Channel Validation
+#CONFIG_OCV=y
+
+# Select TLS implementation
+# openssl = OpenSSL (default)
+# gnutls = GnuTLS
+# internal = Internal TLSv1 implementation (experimental)
+# linux = Linux kernel AF_ALG and internal TLSv1 implementation (experimental)
+# none = Empty template
+#CONFIG_TLS=openssl
+
+# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.1)
+# can be enabled to get a stronger construction of messages when block ciphers
+# are used. It should be noted that some existing TLS v1.0 -based
+# implementation may not be compatible with TLS v1.1 message (ClientHello is
+# sent prior to negotiating which version will be used)
+#CONFIG_TLSV11=y
+
+# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.2)
+# can be enabled to enable use of stronger crypto algorithms. It should be
+# noted that some existing TLS v1.0 -based implementation may not be compatible
+# with TLS v1.2 message (ClientHello is sent prior to negotiating which version
+# will be used)
+#CONFIG_TLSV12=y
+
+# Select which ciphers to use by default with OpenSSL if the user does not
+# specify them.
+#CONFIG_TLS_DEFAULT_CIPHERS="DEFAULT:!EXP:!LOW"
+
+# If CONFIG_TLS=internal is used, additional library and include paths are
+# needed for LibTomMath. Alternatively, an integrated, minimal version of
+# LibTomMath can be used. See beginning of libtommath.c for details on benefits
+# and drawbacks of this option.
+#CONFIG_INTERNAL_LIBTOMMATH=y
+#ifndef CONFIG_INTERNAL_LIBTOMMATH
+#LTM_PATH=/usr/src/libtommath-0.39
+#CFLAGS += -I$(LTM_PATH)
+#LIBS += -L$(LTM_PATH)
+#LIBS_p += -L$(LTM_PATH)
+#endif
+# At the cost of about 4 kB of additional binary size, the internal LibTomMath
+# can be configured to include faster routines for exptmod, sqr, and div to
+# speed up DH and RSA calculation considerably
+#CONFIG_INTERNAL_LIBTOMMATH_FAST=y
+
+# Include NDIS event processing through WMI into wpa_supplicant/wpasvc.
+# This is only for Windows builds and requires WMI-related header files and
+# WbemUuid.Lib from Platform SDK even when building with MinGW.
+#CONFIG_NDIS_EVENTS_INTEGRATED=y
+#PLATFORMSDKLIB="/opt/Program Files/Microsoft Platform SDK/Lib"
+
+# Add support for new DBus control interface
+# (fi.w1.wpa_supplicant1)
+CONFIG_CTRL_IFACE_DBUS_NEW=y
+
+# Add introspection support for new DBus control interface
+CONFIG_CTRL_IFACE_DBUS_INTRO=y
+
+# Add support for loading EAP methods dynamically as shared libraries.
+# When this option is enabled, each EAP method can be either included
+# statically (CONFIG_EAP_<method>=y) or dynamically (CONFIG_EAP_<method>=dyn).
+# Dynamic EAP methods are build as shared objects (eap_*.so) and they need to
+# be loaded in the beginning of the wpa_supplicant configuration file
+# (see load_dynamic_eap parameter in the example file) before being used in
+# the network blocks.
+#
+# Note that some shared parts of EAP methods are included in the main program
+# and in order to be able to use dynamic EAP methods using these parts, the
+# main program must have been build with the EAP method enabled (=y or =dyn).
+# This means that EAP-TLS/PEAP/TTLS/FAST cannot be added as dynamic libraries
+# unless at least one of them was included in the main build to force inclusion
+# of the shared code. Similarly, at least one of EAP-SIM/AKA must be included
+# in the main build to be able to load these methods dynamically.
+#
+# Please also note that using dynamic libraries will increase the total binary
+# size. Thus, it may not be the best option for targets that have limited
+# amount of memory/flash.
+#CONFIG_DYNAMIC_EAP_METHODS=y
+
+# Dynamic library loading
+
+# Add the ability to configure libraries to load at compile time.
+# If set, these disable dynamic configuration.
+#CONFIG_PKCS11_ENGINE_PATH - pkcs11_engine library location.
+#CONFIG_PKCS11_MODULE_PATH - pkcs11_module library location.
+#CONFIG_OPENSC_ENGINE_PATH - opensc_engine library location.
+#
+# Prevent library loading at runtime
+#CONFIG_NO_PKCS11_ENGINE_PATH=y # prevents loading pkcs11_engine library.
+#CONFIG_NO_PKCS11_MODULE_PATH=y # prevents loading pkcs11_module library.
+# CONFIG_NO_OPENSC_ENGINE_PATH=y # prevents loading opensc_engine library.
+
+# Prevents loading EAP libraries at runtime
+#CONFIG_NO_LOAD_DYNAMIC_EAP=y
+
+# IEEE Std 802.11r-2008 (Fast BSS Transition) for station mode
+CONFIG_IEEE80211R=y
+
+# Add support for writing debug log to a file (/tmp/wpa_supplicant-log-#.txt)
+CONFIG_DEBUG_FILE=y
+
+# Send debug messages to syslog instead of stdout
+CONFIG_DEBUG_SYSLOG=y
+# Set syslog facility for debug messages
+#CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
+
+# Add support for sending all debug messages (regardless of debug verbosity)
+# to the Linux kernel tracing facility. This helps debug the entire stack by
+# making it easy to record everything happening from the driver up into the
+# same file, e.g., using trace-cmd.
+#CONFIG_DEBUG_LINUX_TRACING=y
+
+# Add support for writing debug log to Android logcat instead of standard
+# output
+#CONFIG_ANDROID_LOG=y
+
+# Enable privilege separation (see README 'Privilege separation' for details)
+#CONFIG_PRIVSEP=y
+
+# Enable mitigation against certain attacks against TKIP by delaying Michael
+# MIC error reports by a random amount of time between 0 and 60 seconds
+#CONFIG_DELAYED_MIC_ERROR_REPORT=y
+
+# Enable tracing code for developer debugging
+# This tracks use of memory allocations and other registrations and reports
+# incorrect use with a backtrace of call (or allocation) location.
+#CONFIG_WPA_TRACE=y
+# For BSD, uncomment these.
+#LIBS += -lexecinfo
+#LIBS_p += -lexecinfo
+#LIBS_c += -lexecinfo
+
+# Use libbfd to get more details for developer debugging
+# This enables use of libbfd to get more detailed symbols for the backtraces
+# generated by CONFIG_WPA_TRACE=y.
+#CONFIG_WPA_TRACE_BFD=y
+# For BSD, uncomment these.
+#LIBS += -lbfd -liberty -lz
+#LIBS_p += -lbfd -liberty -lz
+#LIBS_c += -lbfd -liberty -lz
+
+# wpa_supplicant depends on strong random number generation being available
+# from the operating system. os_get_random() function is used to fetch random
+# data when needed, e.g., for key generation. On Linux and BSD systems, this
+# works by reading /dev/urandom. It should be noted that the OS entropy pool
+# needs to be properly initialized before wpa_supplicant is started. This is
+# important especially on embedded devices that do not have a hardware random
+# number generator and may by default start up with minimal entropy available
+# for random number generation.
+#
+# As a safety net, wpa_supplicant is by default trying to internally collect
+# additional entropy for generating random data to mix in with the data fetched
+# from the OS. This by itself is not considered to be very strong, but it may
+# help in cases where the system pool is not initialized properly. However, it
+# is very strongly recommended that the system pool is initialized with enough
+# entropy either by using hardware assisted random number generator or by
+# storing state over device reboots.
+#
+# wpa_supplicant can be configured to maintain its own entropy store over
+# restarts to enhance random number generation. This is not perfect, but it is
+# much more secure than using the same sequence of random numbers after every
+# reboot. This can be enabled with -e<entropy file> command line option. The
+# specified file needs to be readable and writable by wpa_supplicant.
+#
+# If the os_get_random() is known to provide strong random data (e.g., on
+# Linux/BSD, the board in question is known to have reliable source of random
+# data from /dev/urandom), the internal wpa_supplicant random pool can be
+# disabled. This will save some in binary size and CPU use. However, this
+# should only be considered for builds that are known to be used on devices
+# that meet the requirements described above.
+#CONFIG_NO_RANDOM_POOL=y
+
+# Should we attempt to use the getrandom(2) call that provides more reliable
+# yet secure randomness source than /dev/random on Linux 3.17 and newer.
+# Requires glibc 2.25 to build, falls back to /dev/random if unavailable.
+#CONFIG_GETRANDOM=y
+
+# IEEE 802.11ac (Very High Throughput) support (mainly for AP mode)
+CONFIG_IEEE80211AC=y
+
+# IEEE 802.11ax HE support (mainly for AP mode)
+CONFIG_IEEE80211AX=y
+
+# IEEE 802.11be EHT support (mainly for AP mode)
+# CONFIG_IEEE80211AX is mandatory for setting CONFIG_IEEE80211BE.
+# Note: This is experimental and work in progress. The definitions are still
+# subject to change and this should not be expected to interoperate with the
+# final IEEE 802.11be version.
+#CONFIG_IEEE80211BE=y
+
+# Wireless Network Management (IEEE Std 802.11v-2011)
+# Note: This is experimental and not complete implementation.
+#CONFIG_WNM=y
+
+# Interworking (IEEE 802.11u)
+# This can be used to enable functionality to improve interworking with
+# external networks (GAS/ANQP to learn more about the networks and network
+# selection based on available credentials).
+CONFIG_INTERWORKING=y
+
+# Hotspot 2.0
+CONFIG_HS20=y
+
+# Enable interface matching in wpa_supplicant
+#CONFIG_MATCH_IFACE=y
+
+# Disable roaming in wpa_supplicant
+#CONFIG_NO_ROAMING=y
+
+# AP mode operations with wpa_supplicant
+# This can be used for controlling AP mode operations with wpa_supplicant. It
+# should be noted that this is mainly aimed at simple cases like
+# WPA2-Personal while more complex configurations like WPA2-Enterprise with an
+# external RADIUS server can be supported with hostapd.
+CONFIG_AP=y
+
+# P2P (Wi-Fi Direct)
+# This can be used to enable P2P support in wpa_supplicant. See README-P2P for
+# more information on P2P operations.
+CONFIG_P2P=y
+
+# Enable TDLS support
+CONFIG_TDLS=y
+
+# Wi-Fi Display
+# This can be used to enable Wi-Fi Display extensions for P2P using an external
+# program to control the additional information exchanges in the messages.
+CONFIG_WIFI_DISPLAY=y
+
+# Autoscan
+# This can be used to enable automatic scan support in wpa_supplicant.
+# See wpa_supplicant.conf for more information on autoscan usage.
+#
+# Enabling directly a module will enable autoscan support.
+# For exponential module:
+#CONFIG_AUTOSCAN_EXPONENTIAL=y
+# For periodic module:
+#CONFIG_AUTOSCAN_PERIODIC=y
+
+# Password (and passphrase, etc.) backend for external storage
+# These optional mechanisms can be used to add support for storing passwords
+# and other secrets in external (to wpa_supplicant) location. This allows, for
+# example, operating system specific key storage to be used
+#
+# External password backend for testing purposes (developer use)
+#CONFIG_EXT_PASSWORD_TEST=y
+# File-based backend to read passwords from an external file.
+#CONFIG_EXT_PASSWORD_FILE=y
+
+# Enable Fast Session Transfer (FST)
+#CONFIG_FST=y
+
+# Enable CLI commands for FST testing
+#CONFIG_FST_TEST=y
+
+# OS X builds. This is only for building eapol_test.
+#CONFIG_OSX=y
+
+# Automatic Channel Selection
+# This will allow wpa_supplicant to pick the channel automatically when channel
+# is set to "0".
+#
+# TODO: Extend parser to be able to parse "channel=acs_survey" as an alternative
+# to "channel=0". This would enable us to eventually add other ACS algorithms in
+# similar way.
+#
+# Automatic selection is currently only done through initialization, later on
+# we hope to do background checks to keep us moving to more ideal channels as
+# time goes by. ACS is currently only supported through the nl80211 driver and
+# your driver must have survey dump capability that is filled by the driver
+# during scanning.
+#
+# TODO: In analogy to hostapd be able to customize the ACS survey algorithm with
+# a newly to create wpa_supplicant.conf variable acs_num_scans.
+#
+# Supported ACS drivers:
+# * ath9k
+# * ath5k
+# * ath10k
+#
+# For more details refer to:
+# http://wireless.kernel.org/en/users/Documentation/acs
+#CONFIG_ACS=y
+
+# Support Multi Band Operation
+#CONFIG_MBO=y
+
+# Fast Initial Link Setup (FILS) (IEEE 802.11ai)
+#CONFIG_FILS=y
+# FILS shared key authentication with PFS
+#CONFIG_FILS_SK_PFS=y
+
+# Support RSN on IBSS networks
+# This is needed to be able to use mode=1 network profile with proto=RSN and
+# key_mgmt=WPA-PSK (i.e., full key management instead of WPA-None).
+CONFIG_IBSS_RSN=y
+
+# External PMKSA cache control
+# This can be used to enable control interface commands that allow the current
+# PMKSA cache entries to be fetched and new entries to be added.
+#CONFIG_PMKSA_CACHE_EXTERNAL=y
+
+# Mesh Networking (IEEE 802.11s)
+#CONFIG_MESH=y
+
+# Background scanning modules
+# These can be used to request wpa_supplicant to perform background scanning
+# operations for roaming within an ESS (same SSID). See the bgscan parameter in
+# the wpa_supplicant.conf file for more details.
+# Periodic background scans based on signal strength
+CONFIG_BGSCAN_SIMPLE=y
+# Learn channels used by the network and try to avoid bgscans on other
+# channels (experimental)
+#CONFIG_BGSCAN_LEARN=y
+
+# Opportunistic Wireless Encryption (OWE)
+# Experimental implementation of draft-harkins-owe-07.txt
+#CONFIG_OWE=y
+
+# Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Connect)
+CONFIG_DPP=y
+# DPP version 2 support
+CONFIG_DPP2=y
+# DPP version 3 support (experimental and still changing; do not enable for
+# production use)
+#CONFIG_DPP3=y
+
+# Wired equivalent privacy (WEP)
+# WEP is an obsolete cryptographic data confidentiality algorithm that is not
+# considered secure. It should not be used for anything anymore. The
+# functionality needed to use WEP is available in the current wpa_supplicant
+# release under this optional build parameter. This functionality is subject to
+# be completely removed in a future release.
+#CONFIG_WEP=y
+
+# Remove all TKIP functionality
+# TKIP is an old cryptographic data confidentiality algorithm that is not
+# considered secure. It should not be used anymore for anything else than a
+# backwards compatibility option as a group cipher when connecting to APs that
+# use WPA+WPA2 mixed mode. For now, the default wpa_supplicant build includes
+# support for this by default, but that functionality is subject to be removed
+# in the future.
+#CONFIG_NO_TKIP=y
+
+# Pre-Association Security Negotiation (PASN)
+# Experimental implementation based on IEEE P802.11z/D2.6 and the protocol
+# design is still subject to change. As such, this should not yet be enabled in
+# production use.
+#CONFIG_PASN=y
+
+# Disable support for Radio Measurement (IEEE 802.11k) and supported operating
+# class indication. Removing these is not recommended since they can help the
+# AP manage the network and STA steering.
+#CONFIG_NO_RRM=y
+
+# Disable support for Robust AV streaming for consumer and enterprise Wi-Fi
+# applications; IEEE Std 802.11-2020, 4.3.24; SCS, MSCS, QoS Management
+#CONFIG_NO_ROBUST_AV=y
+
+# Disable support for WMM admission control
+#CONFIG_NO_WMM_AC=y
+
+# Wi-Fi Aware unsynchronized service discovery (NAN USD)
+#CONFIG_NAN_USD=y
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index ffb1cf617d..b9a8964439 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5ebcb90236d1ad640558c3d3cd3035df \
 DEPENDS = "dbus libnl"
 
 SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
+           file://defconfig \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
@@ -37,7 +38,9 @@ EXTRA_OEMAKE = "'LIBDIR=${libdir}' 'INCDIR=${includedir}' 'BINDIR=${sbindir}'"
 
 do_configure () {
 	${MAKE} -C wpa_supplicant clean
-	sed -e '/^CONFIG_TLS=/d' <wpa_supplicant/defconfig >wpa_supplicant/.config
+	install -m 0755 ${UNPACKDIR}/defconfig wpa_supplicant/.config
+
+	sed -i '/CONFIG_TLS=/d' wpa_supplicant/.config
 
 	if ${@ bb.utils.contains('PACKAGECONFIG', 'openssl', 'true', 'false', d) }; then
 		echo 'CONFIG_TLS=openssl' >>wpa_supplicant/.config
-- 
2.34.1


