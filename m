Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1148E6C5EE
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 03:05:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.11101.1733195128549480025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 19:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Hd11MbcY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2KMsVK010851
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 03:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8e/gcrbTuRq
	dpSIPn/fvjiIvD9toiazoGTsiE6PC76M=; b=Hd11MbcY93YkSIUFiMqzshqWg3p
	F1g04ciA53w1LGf2zruPWU+HBN8Yn8xFOntkyReu4j+Kmry2HBYa+OzbCBnaxhNJ
	uA5LfVyA6ixy1AIyFjNlRtcVhIYi6IguXWe9GevAXYBykzJzsageZzk/BYtRtVGy
	8u9/KLNiR9H9vGz/Th4JOETFAOP3rwyhxXMBIdgEx4bV8CllWufgwA1H1RYVYo8n
	a60PtmtHGz6gwMo5w10hcSW2xDtMYmeznSYUNaZ882FdRGTab3Vk4v98QyCAkY8q
	zEHPqwSALQAQ6z81jR/7fB/G7Pv7zL+WsXz3Fdo+OmvMIfyXNqam7F5o6Cw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4393mpbk0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 03:05:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-7eaac1e95ffso3868526a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 19:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733195127; x=1733799927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8e/gcrbTuRqdpSIPn/fvjiIvD9toiazoGTsiE6PC76M=;
        b=uAxNxutk/DU6I5yGSMcO4fCDn/qsHfhPwtVaBP7SX6/eNWM1i2Ud5N2Iw0OpxnOAZP
         oGh8Lo8aV2n+AtQBw51OB93ioihNtvCM8hRApWHf6nbgEwebXj4oTGABOo+KLWNSMaX8
         Z7SY1JriBpLJQ3mZRiXPi3ajqDv9aO2g2sui48N3dPqI6kAQpTWiQfOEQKkEKDbsuxQ9
         RGITKFTqW7AcpELOtyI7NEBoZXLqG8NFP/B4vroFtVgMEOznRu6TUzjXVHG4TCnMZ7Kn
         EyBzimgd8AloXA26jXnk62t4VADckFM6ZnCquLt7FTBH7s1TwaLDSoKVbNw8o9f3sXPZ
         WaUQ==
X-Gm-Message-State: AOJu0YwkCUPdCdq/UyiCJnse+87CFzQ2WDGH4iPQt4xERvEYPofKbtfT
	5dt6iYH8MuC4fXWDNdvXI8jchayvyKjd++LsaMah4NwGMNIblXOxguQ51R7J6wE6ialag2hUlbk
	ND9CZB3F18Qua8JoJ5i6xxU2DFZT3PeWuEAHQNHkcE4G2lNqaoXQ+6zfqaMQaRXRmVMz94XcqaP
	YrpjAEbOdnvRo=
X-Gm-Gg: ASbGnctr1Z34fdu8d5oZ8NxM7TKK9CWza26D8vPDviK6Q7mWb40WTanpksi+yaFbhTw
	l7cYy1pTiQUu1kHYfIJw6VkpZRLO3O/e/5Bv+oZF1zjyRNJwaBkZQbnzwwi6ht/MZ7gkgqTBMAT
	9f+1S+fcjKe7kd/GpFvVHV9Dmvbiaj1A0hhGHsCWmwU+3kWfcs3OGprB9x6WWn6YDVsqv/eMzXg
	v7M1VvA4RMO5vGpuc9H1hjk7iJ8YgPOnf9uLUi1KBsL0XCCHhqLy31HVGP5tkT21huIHaY0Pg==
X-Received: by 2002:a05:6a21:9999:b0:1e0:d51b:10c5 with SMTP id adf61e73a8af0-1e1653c81b0mr1506648637.20.1733195126910;
        Mon, 02 Dec 2024 19:05:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2zGkjGwT1jJxUApifb3+1CjTlmkfZdn/kymFmwD4zToFJkh/MQu+vWvOcjG/Se4QW+28W3A==
X-Received: by 2002:a05:6a21:9999:b0:1e0:d51b:10c5 with SMTP id adf61e73a8af0-1e1653c81b0mr1506612637.20.1733195126505;
        Mon, 02 Dec 2024 19:05:26 -0800 (PST)
Received: from evatuf.domocacupe ([187.34.86.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417612b5sm9315462b3a.30.2024.12.02.19.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 19:05:26 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com, peter.kjellerstedt@axis.com
Subject: [PATCH v2 2/3] systemd: split long line in pkg_postinst
Date: Tue,  3 Dec 2024 00:05:19 -0300
Message-Id: <20241203030520.1288256-2-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203030520.1288256-1-ricardo.salveti@oss.qualcomm.com>
References: <20241203030520.1288256-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uJKt5hEm4YBRH_8X7mM6zI4qgJbVlBqW
X-Proofpoint-GUID: uJKt5hEm4YBRH_8X7mM6zI4qgJbVlBqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=829
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 03:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208173

Cosmetic change only to avoid max line length patchset failures when
changing the target line.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
v2: separated cosmetic change to avoid max line length failures

 meta/recipes-core/systemd/systemd_256.8.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-core/systemd/systemd_256.8.bb
index 5bec9cb976f..6004d911ea8 100644
--- a/meta/recipes-core/systemd/systemd_256.8.bb
+++ b/meta/recipes-core/systemd/systemd_256.8.bb
@@ -899,7 +899,8 @@ pkg_prerm:${PN}:libc-glibc () {
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
-		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}" base_bindir="${base_bindir}"
+		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} \
+			rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}" base_bindir="${base_bindir}"
 	else
 		systemd-hwdb update
 	fi
-- 
2.34.1


