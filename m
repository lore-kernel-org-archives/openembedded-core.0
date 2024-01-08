Return-Path: <david.zuhn@sonos.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367E5C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 22:09:16 +0000 (UTC)
Received: from mx0a-0003c201.pphosted.com (mx0a-0003c201.pphosted.com [205.220.171.22])
 by mx.groups.io with SMTP id smtpd.web10.2569.1704751752179838778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 14:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sonos.com header.s=pps1 header.b=PgGCBKTx;
 dkim=pass header.i=@sonos.com header.s=google header.b=ZwJovWbi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: sonos.com, ip: 205.220.171.22, mailfrom: prvs=7737ed8f84=david.zuhn@sonos.com)
Received: from pps.filterd (m0299972.ppops.net [127.0.0.1])
	by mx0a-0003c201.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 408GoVsb013107
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Jan 2024 14:09:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonos.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pps1; bh=HeBoGXkZOoadVef07Q/3lBJgT
	lQV/7iHc8SEZXF9Q1E=; b=PgGCBKTxtTgS9kuYdeDfwHDvbik4XI6aUPirpwqxO
	o/8KDHsB9YNHOJskjIcXxbT0Dzgrgo8yQCiBVx3qd72WIXuykwb+cC7EFCLWm+ik
	fij/LnxHWWicwBKY4pBIE4U5bFppV1jSf2IEhbBPlxulDh8AIwsADkEPoWqGHbP9
	Gposkq8/Nc4Jy05+4CHrotTRIYUKzWSvV1gpFl7Y94BHWgw2ksyaSpDjG7lB+MYb
	9PZbh4Yf4htjUAvkZW151FiluCQHJDymbxNSUvanmkzIjcdv2Il24zLYPwD4aeC0
	HETIwMTIte1srgM8gLah73jlsXz0nzLfIuJuptPuYfe8w==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0003c201.pphosted.com (PPS) with ESMTPS id 3vf3ag29hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:09:11 -0800 (PST)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7bb4c1f2947so104299339f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sonos.com; s=google; t=1704751749; x=1705356549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HeBoGXkZOoadVef07Q/3lBJgTlQV/7iHc8SEZXF9Q1E=;
        b=ZwJovWbiT4sFgbM+1Mc+eTg3hMJ89Q+jA/arUPcVWC8vWEtOtZymQjUkWyoygKPigl
         GIL8GYEXr02wigy2hv1tygNfznfxCve+i3mPWMlS+4wYxHGZ1jmW6CJWDloaqkl55m0K
         rH+tyeFO29bs1tX78pqi+gRXBLfJo9LQyJbNFMkKch5Cqme5x0VtkP3CdtlqYXwmtAXo
         Bmj43xSlFrNsnmk+9En96HHEaZ1KDpgi1k47hDHcBFWTo8M+RDMhTn8+0ysr7YbysBVy
         onpleSI7Jrzb3xEtAtC+tO1WA2C++xLRBAOpEZBnKcp5nDLblI9Dtk2t0KzS+N7FU5cT
         Wr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704751749; x=1705356549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeBoGXkZOoadVef07Q/3lBJgTlQV/7iHc8SEZXF9Q1E=;
        b=spXGA8obYwryz1uI7rguWCNx7gRLC1ZbHkJcHgt8x18DAb6QrZoe4fwxG57aEHVixr
         BK5QEvftVuCXEcPA5I75Yr1h2TZxZTp57p/y4kk6hf4sDNGvcMIBzJ0ymGeULZ081+xi
         gVIbOTcNKg8SXfJdcB2FB6W38jM9AsyvBKoM9l1HzigKxkl9F35pa7s8JYdmL9v5Wb7o
         xheCmVawsO3JgL8UyxniyOZTARNokDIta5wXakvHcb+G3ktL/+OB45y2peg2x7Z/nCbo
         zrcOwQ0BJ1dnA5CoUWMgTwEUfXEQQkABk5mqvspi/zv39RfllvIX2HByVRshAYp9T7iL
         p16w==
X-Gm-Message-State: AOJu0YwJafQH85I1b4EZ7Qk3H1cKKQeVCLU0iIb5mcHVsaieS73ELcrG
	N2Ki6GVHQSbK06b/X2MDiY0SMzSAVzpUJKvoqlodAY371lFginy+Ov51rKzb/SNeAsaTqGiu6E4
	ptRpfrJlkmqcyMhvlirNQCOUykx4k+/qsoTJplXvAbhf7+wM2ep1cRkO3
X-Received: by 2002:a5d:9598:0:b0:7bb:dd24:3f42 with SMTP id a24-20020a5d9598000000b007bbdd243f42mr331219ioo.11.1704751749600;
        Mon, 08 Jan 2024 14:09:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRarOC5JcvFQ5gdB/iSYiAXts9fqwA5RkcNH0vvOXQGfgE5IcG6orAwFNQJUXVqsw4SCMq4g==
X-Received: by 2002:a5d:9598:0:b0:7bb:dd24:3f42 with SMTP id a24-20020a5d9598000000b007bbdd243f42mr331216ioo.11.1704751749335;
        Mon, 08 Jan 2024 14:09:09 -0800 (PST)
Received: from roebling.sonos.com (97-116-45-192.mpls.qwest.net. [97.116.45.192])
        by smtp.gmail.com with ESMTPSA id u10-20020a02aa8a000000b0046dda6b83c1sm225803jai.25.2024.01.08.14.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 14:09:09 -0800 (PST)
From: david d zuhn <david.zuhn@sonos.com>
To: openembedded-core@lists.openembedded.org
Cc: david d zuhn <david.zuhn@sonos.com>
Subject: [PATCH 0/1] rng-tools: remove unneeded build time dependency
Date: Mon,  8 Jan 2024 16:09:02 -0600
Message-Id: <20240108220903.4086110-1-david.zuhn@sonos.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W1WW-YcFbogqp1cf_83yONxBw_IvvlBQ
X-Proofpoint-ORIG-GUID: W1WW-YcFbogqp1cf_83yONxBw_IvvlBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_27,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=394 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 22:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193431

rng-tools used to depend on libsysfs, but has since been changed
to read directly from the /sys filesystem.  The build time
dependency on sysfsutils is no longer needed.

david d zuhn (1):
  rng-tools: remove obsolete build time dependency on sysfsutils

 meta/recipes-support/rng-tools/rng-tools_6.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.26.2


