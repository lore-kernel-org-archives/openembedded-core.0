Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832F2C27C47
	for <webhook@archiver.kernel.org>; Sat, 28 Oct 2023 01:17:30 +0000 (UTC)
Received: from mx0b-0003c201.pphosted.com (mx0b-0003c201.pphosted.com [205.220.183.22])
 by mx.groups.io with SMTP id smtpd.web11.16463.1698437056250780281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 13:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sonos.com header.s=pps1 header.b=G9O6a99A;
 dkim=pass header.i=@sonos.com header.s=google header.b=ZaNZ2hMw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: sonos.com, ip: 205.220.183.22, mailfrom: prvs=466465f2d0=david.zuhn@sonos.com)
Received: from pps.filterd (m0299973.ppops.net [127.0.0.1])
	by mx0b-0003c201.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39RHeMCk019436
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 20:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonos.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pps1; bh=jkXuNr8dirVvGXHUXr3SSxiKr
	53l6D6lWtiCBbgfEQo=; b=G9O6a99ACQtiJmMZSNI2UEa+LUejKIrbmJTSJ/cgM
	Xxd1r6F4LdCI0T80nbvUcwsNYPGjL4tfaRti3l7uIHqWeWZJMDTZW30OVksUqXtL
	OFlLb/XPbppM1JwEVUto1OpEvywI1q/x/fwhjVchD+8C3Wis/CAZER/z7SbVzMla
	Cvgqa6rfvDAaXKlBgybzv0Wy4Re4lX5rgcxKSrRVDB0O4D2+AY5NaflvqVFoC8jA
	V8bH9C6Mp0kabfDDhw2RVNbUcGi5p2Vp4dcDWVsDya0e4J2cXpnk9rD3Y9hj9isi
	fa1oVp0samS7gHitZynVpvI8wlgncmY/1nlWK3FAlnRcA==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0b-0003c201.pphosted.com (PPS) with ESMTPS id 3tywv7skmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 20:04:15 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7a6869ce307so193507439f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 13:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sonos.com; s=google; t=1698437054; x=1699041854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jkXuNr8dirVvGXHUXr3SSxiKr53l6D6lWtiCBbgfEQo=;
        b=ZaNZ2hMwldbhJ9c8x3KmaD1GF9vJb1ap/dOcMkU/0RfLhXDL21UguAKmfADeZzJn8t
         WB7fArSI1Xej2cw21G71zai1N97/wbtHoiI9gdK9q/WMgbUq0UthsC0zjKSD1+KmpkgS
         DfDuGTgozQ9nUu2hroZ8kjiTvKcbi034t3ZAZnXCM7DO21MUyvDXaRfCxFri1EKk9CRw
         RQb0NdTz3IieKvGjGukOHZVrjDg7Fg4W6krF5xnLTVtcWAfOKygY195dZWYtaOHJz9Vx
         Zhe5VoDS3UlspeQxLLFytXY1JADmO0yNMHFftViPfVaFqzDeW/MigM9DAafRYzkpm0iP
         kT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698437054; x=1699041854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkXuNr8dirVvGXHUXr3SSxiKr53l6D6lWtiCBbgfEQo=;
        b=unn86+be9UAmX5LQXz2jj5/67LA202iqLGk1KzRBtARSJ/TQkU/2fgqS4TD4sUmOMf
         mchOl1y+2xPbq3ZxNScnSH6ISkaiAzH8vv9n1q7pHlnzbxd9Q/3No2mx7INYTkcafRb1
         XCdVhgkkwBDvFGi3nsMP5eGCKSvQ2D1lBzNZMuEP0RKDYVnfR3ZDXolkH6LpX2cxEIQv
         3xruzvIjNH9eiL+YgDjgLH9nNyznkBUaqXjh960sNxUYIaL/aehVZLXXFfYwkt3fwvro
         lzcErY7jdbf1JqRtcJ95L1NGs2nfwx6XNv8oIThwbfJG4IGBAFQ1lm3cjYQoTB3hVMGR
         /oGA==
X-Gm-Message-State: AOJu0Yyip/ZMa/xzUnEHOareCB3JLMxnt/gCQlrKuu3TqM2GgQSsLs+J
	zYY2vG9MFuPuX8aDU3dC9cgYcYBnzNgx+/9te5ymuAGth3ptspxzJe0ZxhKV501uJflYN7oel8X
	rQa2Sy6twSQq+VR8ZemDFb7xeGFRfqDnv2mEbdq6/lnwRRe2U
X-Received: by 2002:a05:6e02:1563:b0:357:9fc9:eae0 with SMTP id k3-20020a056e02156300b003579fc9eae0mr5549923ilu.20.1698437053944;
        Fri, 27 Oct 2023 13:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOW1YAeAi7kU/J0IybE8LmYVWITOniLxmhHJx0v8IRqxvl22HFDtGalSUTl3WpK+7ctY2Kpg==
X-Received: by 2002:a05:6e02:1563:b0:357:9fc9:eae0 with SMTP id k3-20020a056e02156300b003579fc9eae0mr5549909ilu.20.1698437053685;
        Fri, 27 Oct 2023 13:04:13 -0700 (PDT)
Received: from roebling.sonos.com (97-116-51-195.mpls.qwest.net. [97.116.51.195])
        by smtp.gmail.com with ESMTPSA id cr9-20020a056e023a8900b0035134f1a240sm663963ilb.86.2023.10.27.13.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 13:04:13 -0700 (PDT)
From: "david zuhn" <david.zuhn@sonos.com>
To: openembedded-core@lists.openembedded.org
Cc: david d zuhn <david.zuhn@sonos.com>
Subject: [PATCH 0/1] ccache no longer supports FORTRAN, so remove it from the compiler specification
Date: Fri, 27 Oct 2023 15:03:50 -0500
Message-Id: <20231027200351.3717801-1-david.zuhn@sonos.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: yp0FFUns31_by4FxGHpBfqgbm7PKZGYh
X-Proofpoint-GUID: yp0FFUns31_by4FxGHpBfqgbm7PKZGYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_19,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 malwarescore=0 mlxscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 mlxlogscore=748 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310270174
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 01:17:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189757

For a time, ccache did support FORTRAN (versions 3.3-3.6), but that support was
removed.   As of this patch, the version of ccache in use in OE-core is 4.8.3.

david d zuhn (1):
  bitbake.conf: remove ${CCACHE} from FORTRAN compiler

 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.26.2


