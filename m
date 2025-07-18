Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53F7C83F34
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 09:15:41 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.16545.1752830132036787984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 02:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=B9g3lVtV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I3CXiv027070
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 09:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=ruE5T
	eaqNZVS2SCPQknZs9SaatoWvkW2bgzBTv5C+dA=; b=B9g3lVtV6/YnutEWV7YMf
	+LnjMnc/LmZDaeGOj4GRvy2I9vCkHXA84ilYkylBRKuNhG8TMtOeK3pFmarbjHTm
	gO39ua0e4D8JERgQ/T4q/FfbN09eh6SdibuNMWJqXkT+4qH//GD9Daur34N6P/0B
	K07lgYoRzpryiKLMbQJvJwbZRwhdzvv/75HEcxUsqB0OQIhSpP0dOiGEHjsGpGPO
	YMQWl0dS1HVcOTHw5PT1UOiGhAZeYyjQSFiVoMo5HgqSGgSTN6NM5TZLLhSfx/Q2
	rjX3VUvd2bH0cz7Vsh4kT+n89z6RRFEuZKsAJGjQQMu51uy1iWHvwn7sdn0ArwTt
	g==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232] (may be forged))
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 47xjve6790-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 09:15:30 +0000 (GMT)
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Fri, 18 Jul
 2025 11:15:29 +0200
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Fri, 18 Jul 2025 11:15:29 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 0/1] Add traditional-activation PACKAGECONFIG to DBus recipe.
Date: Fri, 18 Jul 2025 11:15:17 +0200
Message-ID: <20250718091518.1608493-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX/d9UkFmUOhx/
 OT4Nhl8Hg9xIW2jv710NGt8PggcYuxbOXuQJ+H5KV1Qm54/JpaTVNzgO4m65FbGC1WZgEGDb/h8
 Nb443kD6CzZkrJ3/TG9WT8IkDTGnVR8jwSqghpacTORavXumn45CGcG+Zg2NgvlE6uFYkNeMkDB
 AU/qGlq6JWiS5u3kZBMja153gsDrl/B8gxRFEnfbOcQHAVwTodOuiy7IFoQWFDsz6e69hVfiKlx
 Jyt97GdbozET0zsZEAl/GPUnGPcEWdZjtcz2vO53hPz5+4PJvKNnyu7qV+X3yVtmVexQ5QDRv2I
 TxhCOFLKY9wEzQgY9VO03ltUqUjZeo2FS0S0m1vywUEJOumyt5sA6O6vI1aGzDn2BVrCDzky7Gv
 CageAfOxZpStZpqfaPWiw4hHrDJ4dgE/soOc8UblUwlI04+0oRT5RqloWka2Y0ZBOhQhk/RO
X-Authority-Analysis: v=2.4 cv=NNTV+16g c=1 sm=1 tr=0 ts=687a10b2 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Wb1JkmetP80A:10 a=oEWvZoLHSYrMM10x3dYA:9
X-Proofpoint-GUID: djhxqjj-dbI58rtK8Qv8J0DjewNuFlON
X-Proofpoint-ORIG-GUID: djhxqjj-dbI58rtK8Qv8J0DjewNuFlON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 09:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220590


Weisser, Pascal (1):
  dbus: add traditional-activation PACKAGECONFIG

 meta/recipes-core/dbus/dbus_1.16.2.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.50.1


