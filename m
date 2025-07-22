Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345F3C83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 11:33:03 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.10368.1753183977416945131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 04:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=k4Ui9Gpt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M9Wo54018524
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 11:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=ruE5T
	eaqNZVS2SCPQknZs9SaatoWvkW2bgzBTv5C+dA=; b=k4Ui9Gpt+QFGDq84c6DeP
	TnN47R6NJqsnJl5PXZTaBeYIGEZmO7uNarqINiY2nggWy16kPEMt5idgNJt6Mzou
	t7Vwz2Zsr9VXWHz+dq9zAaVE9BbV3aDC0hB46c45E+cYLYvGc6cKVzHC1jeK+QPU
	hBPLI/OQ+O9k4hrEkVdk3K9xTfetGUNXccI0zghF8oBWNy3vbDdPWVIGZaX096aQ
	r7j7HCtRUbISZOkTJQCShMPdFBp1hrTY225S4rCfuyfP+yabPEdY1qmcSkk0QcKB
	QsL8e3HBbTFPafP5OBBWVphvekNLLnKGCtovcyRnL6uzDYiVghrsEujIcVQ6f0Wr
	g==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4804fmrev1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 11:32:55 +0000 (GMT)
Received: from TUT-EX20-PV.KSTG.corp (10.0.10.224) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Tue, 22 Jul
 2025 13:32:54 +0200
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX20-PV.KSTG.corp
 (10.0.10.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Tue, 22 Jul
 2025 13:32:54 +0200
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Tue, 22 Jul 2025 13:32:54 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH v2 0/1] Add traditional-activation PACKAGECONFIG to DBus recipe.
Date: Tue, 22 Jul 2025 13:32:49 +0200
Message-ID: <20250722113250.255487-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=687f76e7 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Wb1JkmetP80A:10 a=oEWvZoLHSYrMM10x3dYA:9
X-Proofpoint-ORIG-GUID: aeWJeNNTvC5Y4gv1c6d57WGJuGk7uj15
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5NCBTYWx0ZWRfX/ffg2Gs8gZc0
 0U0MRjLJdw1GKffiVnHN70RpHBl3DXrEqiYQ5TcGrt9HWow2mF9khZ/CiaSih9Rb0uzhbV3OF1v
 Q7F/jShXUS3DkNEJvrxlwQMxWDidIjsdmI3AiFEx5L/tlDcErkz8OGdg6e3PI8HR7xZ5ZSARDqk
 /z/DHsaScOhZTETZP697SWgE/9hcQ6jrnGrHsvdSHi89wYz3qHo551+nEwPFClPe4M8ISoYYY3V
 8V4BDiJf2uoH2yuh1OYKzY0U1XIKiQcVogDiB3dByhHExMC3E2Y66QTuO0qadieliNze2Ks7j+Y
 LzJ+zYifpg9q1gy8T/dEoX+GuJgpsDkUFBhBkEmsEcmUfrXEeUDMj/P810cKkAe2Lv3U/03jKKT
 bVnkHAUDQ7Z1i38KoFlBnXoUpMy2P5P8DcXPbNBg9dOXnjMlWc3uC+dss0D5fuS/NPzAG1gF
X-Proofpoint-GUID: aeWJeNNTvC5Y4gv1c6d57WGJuGk7uj15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 11:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220734


Weisser, Pascal (1):
  dbus: add traditional-activation PACKAGECONFIG

 meta/recipes-core/dbus/dbus_1.16.2.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.50.1


