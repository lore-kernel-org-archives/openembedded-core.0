Return-Path: <david.zuhn@sonos.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696EBC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 22:49:16 +0000 (UTC)
Received: from mx0b-0003c201.pphosted.com (mx0b-0003c201.pphosted.com [205.220.183.22])
 by mx.groups.io with SMTP id smtpd.web10.3575.1704754148971296102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 14:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sonos.com header.s=pps1 header.b=d+r42GD6;
 dkim=pass header.i=@sonos.com header.s=google header.b=bTIWzEfm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: sonos.com, ip: 205.220.183.22, mailfrom: prvs=7737ed8f84=david.zuhn@sonos.com)
Received: from pps.filterd (m0299973.ppops.net [127.0.0.1])
	by mx0b-0003c201.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 408MKeAu016185
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Jan 2024 22:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonos.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pps1; bh=HeBoGXkZOoadVef07Q/3lBJgT
	lQV/7iHc8SEZXF9Q1E=; b=d+r42GD6eXTHuC9J3CH4Bqn30UlhcyUc9N27516wu
	Nvsw9dtU8CQ+xffE31WJaoLKJgVeUIJGfCQCGeDtwcAj2J1sTFW1PlK6V2ReiS5c
	YiXyK3IJdtiub3PRbJYTP0+L0JFQ/er9EnxJKxnH1nuosv6pSAIlWwfHdokvQEfL
	WLWRIZsx3YpiWpek6ZYvvd8nmnNu7lA30n/r7jh8N/EjLlxIvrVgDgsmznRONkVJ
	8U/UVdZ6v1bN1Sm95XMxvOUZg2gRM5N8o4xqG1jRPMqN8mPnQX/XK2UX91EZY1mD
	pQ74MS2Oli7twLV7kIJDl+Y91+yrGZAW6NkU+dBD3W+dA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0b-0003c201.pphosted.com (PPS) with ESMTPS id 3vf17ujcpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 22:49:07 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-35fd46fe86aso23524825ab.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sonos.com; s=google; t=1704754146; x=1705358946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HeBoGXkZOoadVef07Q/3lBJgTlQV/7iHc8SEZXF9Q1E=;
        b=bTIWzEfmSEFPRMV+/jN7cEgxrEvCadDkJA7asZtBWfmRj/P9w4g4TU1/rk9hANZbJl
         aZ4mtNMNGzVqAA3QRF6XjSErWO7uv1xzkMa2B+MgEwz+zS02clNtul0R6bOMGQPK7pBK
         aavyNSnuAX585cAGNYm+eRxrutaugyEqwKwyLoMej8SCdg60KFupBMFc5YNR2MCaBLeU
         i8L8tpEgTdZ6SpTQjX3eCldU0MSa9bMUsteIEKf0Zx3ZwQyoF7zZxzJJLNu5DLuZ7aSQ
         GvveEdDisWKXgASQ6nZJG3uRwqXk+Xj61stI0HChpdceBP8KFYpeSty4rXBNjo/lhSZ5
         iWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704754146; x=1705358946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeBoGXkZOoadVef07Q/3lBJgTlQV/7iHc8SEZXF9Q1E=;
        b=cPm8Pjc3eokY1ULb4nwU3l/KJGgg2w2vqAV1twasTMsMt8nuf9pUuHVrqhDp3GvzHE
         Pe6ScJgsaldU5gc7ZJiF2koFgXcx06KqyBHTfrx/cRmcw2hnJX3sIYOhjqfd2NkjZzF/
         ITw0Ga86X63vhsaVhqnIX59iHCdnTeKFhipHxXzqLer5zRVRQC9pOCaCIE4qhjxZzEGV
         iZtTby5B0Bpwt3XXTdH6tNkL17s3nMqPhkKmbvD/P0brUI40hOi+IDnaoDdeO30I9NPP
         awif57hJKVf06rpSIZ+T18PtMSodivEBqomW/Q2sLUbD/emDHk/wvMbim7BzCvhT7xJq
         LcEQ==
X-Gm-Message-State: AOJu0YztxjCb25QPBLAopg6EhDhc4eTQlP+ZZkGfUuhv3n9PYVbvn8u+
	GoqT5v4B5Rps0DAM0TflMEKL9NlxJOxkPA9RTOV1VVPn8qz8q4gK1yWtFKNMFR0OPOlNTmMeQGa
	HzG3bmF1D9KwVYPRFrFt4Po7L/d9ZGX8X9YS0tsiZ/YMGUU7fDUfZDS8p
X-Received: by 2002:a05:6e02:3387:b0:360:7652:4106 with SMTP id bn7-20020a056e02338700b0036076524106mr4319777ilb.108.1704754146620;
        Mon, 08 Jan 2024 14:49:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHQe9I8WJXoCOOKfPXt8MAZHmgmCnU2dWmAeKO5dyjv6kEzOy5T0dsanA96NiqBHasnFKZrQ==
X-Received: by 2002:a05:6e02:3387:b0:360:7652:4106 with SMTP id bn7-20020a056e02338700b0036076524106mr4319773ilb.108.1704754146428;
        Mon, 08 Jan 2024 14:49:06 -0800 (PST)
Received: from roebling.sonos.com (97-116-45-192.mpls.qwest.net. [97.116.45.192])
        by smtp.gmail.com with ESMTPSA id i40-20020a056638402800b0046b6238d7b1sm248325jai.121.2024.01.08.14.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 14:49:06 -0800 (PST)
From: david d zuhn <david.zuhn@sonos.com>
To: openembedded-core@lists.openembedded.org
Cc: david d zuhn <david.zuhn@sonos.com>
Subject: [PATCH 0/1] rng-tools: remove unneeded build time dependency
Date: Mon,  8 Jan 2024 16:49:02 -0600
Message-Id: <20240108224903.4086308-1-david.zuhn@sonos.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xBXFFjxu4COIxSRUwq98l8mt-ccqiLco
X-Proofpoint-GUID: xBXFFjxu4COIxSRUwq98l8mt-ccqiLco
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_27,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=394 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 22:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193435

rng-tools used to depend on libsysfs, but has since been changed
to read directly from the /sys filesystem.  The build time
dependency on sysfsutils is no longer needed.

david d zuhn (1):
  rng-tools: remove obsolete build time dependency on sysfsutils

 meta/recipes-support/rng-tools/rng-tools_6.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.26.2


