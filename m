Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB948CD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:05:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40965.1781167643167095565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ue253IVN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=f5iRrs9s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: hangtian.zhu@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GGof3863242
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OwXT7T+mFhRaFVPJj37ZU8azSBMfqpfJlUq
	GxsJLXos=; b=Ue253IVNgQ9Zth8q67KpVNVzlArSqsIh/gNBgaarBR+U0Zeolt8
	hDlgtZFPCpfaqWbq6NFobITnUq/FsATK+ELMrtKgmqmXGPwth0uBCZ76ab9iBiR/
	mKV6bNXMtRprKlx5EyNZGgHyykrcxUdC8IKTyQCT6b7icwpvXMt+DG8hBKZy3rte
	EtJZqfR1Cr65aR6h7RA6l+CZBOHgVN3ihYOU9vwdNa7Atn9CW9YUgxVcOVdJrXv8
	YeoEUNMsKF76WRn3VnQQ6BKcpRB+3j4LG0070TcQRyNu9zzR8aM5LWhKhqQBvOcR
	mG7xxG2zR+ndno/kJVzKB/N3+PNdFW8YOYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjfah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:17:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3772b6b31b4so570887a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 01:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781165858; x=1781770658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OwXT7T+mFhRaFVPJj37ZU8azSBMfqpfJlUqGxsJLXos=;
        b=f5iRrs9sbbc9CXRI2LarcY4LwCeZMaEKfvm3uRBB0H7GMSSzkIl2PePrWR2DhqLkGc
         BiA6q5tqEoJaFe53hPRnP/WqkhYuo+8cKL826MBBTk++LL5kYVKt5zki21FIH8M/0o0b
         GEmb/p1L9RdiwaBayKEtfYBHh9Rh8JrcIMlByrUNRt4F26w9bacoOa+Bhi4t3eUyXr8/
         zFJ10cM5iHAdXtJjZAOxTegnUOA/Ws2UQxUfucynZfych20etaagnaSDgOtczb+3evqw
         siH6OJx5RPk1EwQ4MllwKivvpt3Bh/yKxKFdzz2vDnVhq1/jumkghEwZi+beppS8OQVD
         5zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165858; x=1781770658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwXT7T+mFhRaFVPJj37ZU8azSBMfqpfJlUqGxsJLXos=;
        b=anCp7u1aO3jEMPYh2wLS6xq73PLiWKNfpnEJ+kNrAmCc7tzFtMwB0gAjGVqi1esHkI
         +pmmFCtruM1oFSKe6ablN3JAIeE+ah3B7SnQhy0kWojD3q/FTpjtosni04Pn3ej12/TE
         ScD54TbFAjFTIat9ri51FwoyPxKY+vifCgErXBVKdtXGaghaJCVEiXUcWSTAbrNkCdRM
         w5sCiY2Im4DJatSjQf9b0Ln8Nredur4dcg6Zb9u/MpD+OXKIye1iDGpEQ1El/KM/J0FX
         o/C4N7/nqYU9J9SvysoHm9YpNUbJDY1Cf0FZx264LYONFUi3J0N1EgusZCEwYyMMowuQ
         Nviw==
X-Gm-Message-State: AOJu0Yw53vJ5ZexH0JJ4TiIQ5Cet5SJKSJxrH2prFXIjEv04tPMQ7yjP
	OYgort0ct+2+IiE4FWSuvuV/nnR3q21yH88JcsrjS1yFGf8SqYyLgTzY+dfVkfyxSehuwllOIi5
	gX08CGzeztUnPg+fs1vd3/RvFkGLYoTqmKFtaJ2fIWPC6pxS46VAUh1X+ksRo6G+ofBITpqJzl4
	QLvAPbAdDlDpzOi3LGvw==
X-Gm-Gg: Acq92OHtRwcYl3RuTaKagDvfaxbCwfFACPiJbKmmu4MnmLc12/kNFXYcx2E/qEUHYXV
	Fdn5Su3uHAlgypEz+WOBu67QRkCnAV/G2w6Fg+Y0Ao76yM1KuAJxND4jQ0oTOTo8++cG0NM8uDv
	SYVjAp+k6YqpNh+qULgh9a34QowRGj/HZ5NF1QEFQ+Od/y3/uGKDI/jbmDCkYdIBTs7McC/qc9O
	8IVyE1MkQty6fiboq0OZkOOWkg/vIeQ2L/qqzDrXESIhdSPfLr3ggoMARiErSnHmQDx11oqZirB
	AUWN50f8Cn+C/HZFADFQ50KorH0m+kk7LGQ39m0QkNxVHbSjNliEM3kB+5tCR/1kkSVNjn+d+3U
	8IuVqbQaxqQIu6pnZaiSE2tX16dpKV7U8LBPEzv25TTMy8XaqStmQ2GR7VxNVYeGCH0m8ZPBwZi
	l8cO1IXXY3frrsPGZfZv2l
X-Received: by 2002:a17:90b:2751:b0:36d:b680:3029 with SMTP id 98e67ed59e1d1-3779beb2b6cmr2065067a91.1.1781165858055;
        Thu, 11 Jun 2026 01:17:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2751:b0:36d:b680:3029 with SMTP id 98e67ed59e1d1-3779beb2b6cmr2065024a91.1.1781165857506;
        Thu, 11 Jun 2026 01:17:37 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377a9194afesm1140088a91.2.2026.06.11.01.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:17:37 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: miaoqing.pan@oss.qualcomm.com, gaole.zhang@oss.qualcomm.com,
        ndechesn@quicinc.com, jouni.malinen@oss.qualcomm.com
Subject: [PATCH] wpa-supplicant: add PACKAGECONFIG controls for suiteb, wnm, and mbo
Date: Thu, 11 Jun 2026 16:17:33 +0800
Message-Id: <20260611081733.875753-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-GUID: TiAw8wV-MNX8r7gt05eKvRxJBjbPId2s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4MCBTYWx0ZWRfX8SmcJpIZM1M7
 KNPvoD7BrHJc3gH1KCGmtcOOPZD/uWKfkdiV3Y4PKRMBXb+cjA9kQB80QGjlR+Ucoev3+dXFEt7
 vRCUKfoPegib6xPeZJ7wxEXjFT0HUUk=
X-Proofpoint-ORIG-GUID: TiAw8wV-MNX8r7gt05eKvRxJBjbPId2s
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a6f23 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=S9PWtUsRgIVsDFoORi8A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4MCBTYWx0ZWRfXwxhEKPyofzEh
 ZPLOXAUcQ0NPQClriU8v0h0swIOy0E32rCAqoKTdbJLv4t7nyBdfWU+kYwMIEVXw/OWpFx5MDgg
 Z+Ct/R9pSXRXL8qaNYmQEjc2eUyRMrmB8PsBR4hY9YnkiZEBq3ttZwLAE3MgupPyBU/fyw/bRAm
 Lq1q6PDlArEqI7oIhYWwIF2cFyiDk0El6ArH5tlmHjILX8N2ywluz4mxD8aMO1QJRLAbLXyHETB
 +cQjjFBzwvzk8KQaqCOwVnKiAgW82XImqT0FU11Iff/0ZbCwiZOwtNWHCXSlmCpfadqGItlhdz1
 R6SohYXFNbw5ERm6sAW5BphO1P/vO3qWzGYmPD3EZLI0vXr5AHgsHqRPKGcF9gQlB05iSm4sL+E
 j30xCAUQ4SbyBUDt9a1HCAyXxRyKoe8FaMRE1t5Znz/d1Jpnd4m+BgAcoA/qWeg0EdTpxTKVrFj
 bjdNSfvagPdKQb15gOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110080
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238447

Add optional PACKAGECONFIG entries for suiteb, wnm, and mbo and map
these to the corresponding upstream build flags:

- suiteb: enable CONFIG_SUITEB and CONFIG_SUITEB192 for
  WPA-EAP-SUITE-B/WPA-EAP-SUITE-B-192 enterprise modes
- wnm: enable CONFIG_WNM for IEEE 802.11v Wireless Network Management
- mbo: enable CONFIG_MBO for Multi Band Operation extensions used with
  BSS Transition Management

Upstream hostap configuration keeps these as optional capabilities.
Exposing them as PACKAGECONFIG options lets distros opt in for
enterprise and roaming use cases without changing the default oe-core
feature set.

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 .../wpa-supplicant/wpa-supplicant_2.11.bb        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 558065f03a..adb8467786 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -32,6 +32,9 @@ inherit pkgconfig systemd
 PACKAGECONFIG ?= "openssl"
 PACKAGECONFIG[gnutls] = ",,gnutls libgcrypt"
 PACKAGECONFIG[openssl] = ",,openssl"
+PACKAGECONFIG[suiteb] = ",,"
+PACKAGECONFIG[wnm] = ",,"
+PACKAGECONFIG[mbo] = ",,"
 
 CVE_PRODUCT = "wpa_supplicant"
 
@@ -53,6 +56,19 @@ do_configure () {
 		    -e 's/\(^CONFIG_OWE=\)/#\1/' wpa_supplicant/.config
 	fi
 
+	if ${@ bb.utils.contains('PACKAGECONFIG', 'suiteb', 'true', 'false', d) }; then
+		echo 'CONFIG_SUITEB=y' >>wpa_supplicant/.config
+		echo 'CONFIG_SUITEB192=y' >>wpa_supplicant/.config
+	fi
+
+	if ${@ bb.utils.contains('PACKAGECONFIG', 'wnm', 'true', 'false', d) }; then
+		echo 'CONFIG_WNM=y' >>wpa_supplicant/.config
+	fi
+
+	if ${@ bb.utils.contains('PACKAGECONFIG', 'mbo', 'true', 'false', d) }; then
+		echo 'CONFIG_MBO=y' >>wpa_supplicant/.config
+	fi
+
 	# For rebuild
 	rm -f wpa_supplicant/*.d wpa_supplicant/dbus/*.d
 }

base-commit: b5c24e1491dcb9ab0f782df6be6582fbd2151724
-- 
2.25.1


