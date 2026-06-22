Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC63DCDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 23:04:04 +0000 (UTC)
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com [205.220.173.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9331.1782169444285689223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 16:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=LjWz1gXQ;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=WN9WDZXf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.173.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187216.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MLwKMZ2933715
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 16:04:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	8w6FN98vcZwC38jwDcZGY7iqn5KcvexEUNIwcdOGs6c=; b=LjWz1gXQ/5j5Tj/i
	cL9i8Scttdnlx8J7VsmFg7w2h/RjP6+tNmNWrmt2C9efuF2bpyhw784b6PB4vOpe
	WmKaXeo5QX3awK85VchVh2voxfQ649mnUyi/uICrDFTN6+LFeN7e0cvx/oyQF00K
	22KNr0l5nxRJG5LoNfv8HrMB/jMv7cytDQc6SInVyv/glXuo2dQGANX0HCFD3ZDb
	9/m+hHY3+z6C5C2Ar2Uw1nmIv1rGHaAgQB9pOCmrPh/jDZQYH+mwF/CRtZK/dKVR
	exB9tFtc+3Kt6+8dejl3g9d9Rh8UsCOi9/T4gvbQUoCS+6UXfrEp4xXTUpdFsRFc
	DUZVzg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4ey9cmgyg8-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 16:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKFwEKuJttAtYLRFGH69u9xgbRoRghMG9HNdPdDoiA9Bmh3Q7ktgFtAni8enaxNVV16yNJtfTDDmXci67fyb9B2SEyVWRaSetnp+pd+RizeNiGd44osG+PfTB+VLjUDq5i9/v8Ene+o4/Xw53bgMmjIJvnfJ4WcruSytpBjqy56ikttwxkQ29JPaO4RO77lbjAdkxlnaUkf6tRi/D9WkRwX1TILjWbuMhGKFc9PJnnlNoNKHN6dadms0Tb96w1SBkAuFew/bCCXHNZ3kg4PO20Oe506g5u+CADQWIEA3vjuGkI882FErgG6tUW1/lJu34NI0BVmP45jKJW0yLmbn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8w6FN98vcZwC38jwDcZGY7iqn5KcvexEUNIwcdOGs6c=;
 b=efJfXAgQpu0vKWfdqOT79/VmoTepK08Hw6owfdvHZSkE367i3EiLuKHoQn5bKF6t702+qZnMEXcZbljuDYMrKe8UePoaginWigeeZx8CRC9omA+63Bed3ILNpdYvvhgm6jD988sUAksH5H2tG88ZNMp8jfWtnwj1rXlKGTX1+r8vEuuKqzYvpEBCEW7v5K+krvVg+Tj7HZhCfklnaGTfashBHLlT8pMYeo/W7wF+xMwBL+mvwBIjvug5Z/5EJ4urHy4UMYyHU9dkn97xFUvhxNfS2FjwNizmTSvV2PIKDJnech83L56MrlGj3vez/H71aJiLnDdzZDpR9vn/v9COSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8w6FN98vcZwC38jwDcZGY7iqn5KcvexEUNIwcdOGs6c=;
 b=WN9WDZXfBPIZ9bFMace3JmMBp/NgQCfhrheV9TRSr5n8rKdOau3hu4B+LuIH+z6r9gD9sj1Iowa2G1f8ZQ8hJ9AHHtNukjYSK9TvM5ucHBg7BIFAkrEwSqYK8rx1tuktdv3GicU8rEmfOPWefaQ5UVLYJSIpwDKMFgjUQeIGn6s=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by SA1PR17MB5717.namprd17.prod.outlook.com (2603:10b6:806:1cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 23:04:01 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 23:04:01 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v3 2/2] go-vendor.bbclass: Remove vendor symlink
Date: Mon, 22 Jun 2026 17:03:30 -0600
Message-ID: <20260622230331.3754496-2-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622230331.3754496-1-john.ripple@keysight.com>
References: <20260622230331.3754496-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5P221CA0142.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:6a::17) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|SA1PR17MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: 04bb78c1-3d7d-4562-c64f-08ded0b28c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	0giZ1k3mVlTCADqytHIGOXadsxl72aDCpgjtPHrFLYcVmbvTfoHRLVh5iIWazIiYRl8OMRUUldoe5+VEisfMoWxqlf08CF2ccE9SMho7kFa/6y4RrnvXVAiZztEpI+gD6m1bk5YtZ5TsOgeu7YpvMaAcdTagaVsYYmyx5DZ+Sd3W/nhVU9kS3M0ehZW5BnfgNFNGkM5IdC1q0B6BRWMK8lB6WAg797pIEg1bDNEhKKhzlnQANQsqEKBxxwXf/FUEKRt5TyEYQI5kwS8tmekKYOcNZ05kbBWjkhPI2xzX+qnw4UMrZxl1UGj12NEQqWfZCxf5y8UjHYIVEQllc9XqTX9s8OKjhEZNj6+hwVX6onO9LS4RHRWljT5srFUW606BAoGyYA5xr69CbkIBnFZUhHAqHRkUjw8eTRTbjry/bazGBr4DU+8wfgz9sG3BP3ljLBh9JNuLzPi2aSCNk8CRT+aXh/rbTZe2ivFsK9WPXnubR/yKRn6rj79rjKFhkRdm2tfza2uXNXFISk7fh6qOrNaVeNlJD603nA+q1n8GpRW8EVNFpTmGrhE40zIrEqoN3BUVswsrgmGtAUKnq8g0+n36+Ij2ANFpsynevF0cBXcQ6OjF56JfJchMl1oYzgH+xDBQ+1oIkSgBwtmfiDYJp2zVVnBG1uYz+xKDA6Ynl3U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qqOji+GxcKDRMrF9c565+yFUZL4EMgF05hMfY/6YqTWAaCZs/TnGvcA8sIX2?=
 =?us-ascii?Q?XXmlNcdEUIC50NUbDAIonrOotvfWw3FGfEiPgI9RGw1ymHZxSyo3BVWIfkKR?=
 =?us-ascii?Q?5i/uIHADqgV5deuOX/Fl6R69+/sNav/typLT4PQ/7IYi/we+VAC7FCI5fyTe?=
 =?us-ascii?Q?CMu7MnhZEz0gWk6+FD2Rzi16zYqXyYVx0ENYZ6JZvhYoUdR6wSwkURJ4Le8c?=
 =?us-ascii?Q?mmqHq8yhSpgH0Abyf7SNApELy5w/M5a3f3RmYBUdLSmmIrEWvN1IAhvc+Ipx?=
 =?us-ascii?Q?P0Bt+gcLltPRTkCd6C66MzU70MZWmHlzH4Iioutml8PwZrIKq3TrOOW+naEx?=
 =?us-ascii?Q?cg3AwAn38KJ/5DH+o1rE40tdKdOpZxw7gCwNoVjzOqgraJBUBHog2Q/wuGg+?=
 =?us-ascii?Q?OVLDAJGiW1Mzsj/uAFoFCmbM5LZdMsJCB8w8MGKn1bZrsvHWotXdJ1chrpyr?=
 =?us-ascii?Q?6mG8wJbYw8bZyPPhweesil8XlhFuLEvWS0znKFvTbbAoPPJcmiqV7qVdnyHN?=
 =?us-ascii?Q?xhF+XLNa0rteHg4YdWxtL0vlhDLB05tHRQqlE4j6cx+ucI/20JDLRr5tkIKI?=
 =?us-ascii?Q?J9vjmwioXg3meLBbMi+lAcNosNaooSHzq5lgrdTcsRXcw7gYP5kqWq9fK75t?=
 =?us-ascii?Q?/vyW/URpanCVzIGZ2AT0EriZfh/INCUphsCrvKwdagW5zUIeL0hfBDCtshX+?=
 =?us-ascii?Q?05f27d+zVDj5YYu17UgNV2+dejo+f1vZNLmGYhWMRd9I8XAFWJHOx23WyG5t?=
 =?us-ascii?Q?WveHYwA0V/JDGTtZzqY8M5lNy3/AhDYofi08n1BIC8wGA3Y49FAe6crIqWac?=
 =?us-ascii?Q?Rz+vXcv2kOFvz8PQ/xFQHM2V9/suqEHVjZ93AEVkuly9XCVISF1QeuU3aCe4?=
 =?us-ascii?Q?RMcel8HGwqYrFWTJst0dnS9m6/MJmYIYgu8t8aio+1NyQ/VXyg6X7+ZxaPkq?=
 =?us-ascii?Q?DasUzdxIy7biQUc+AkQ4JX6n4CzZKgEViXERIYxGDBIGj53kPiZRCDPOtsXJ?=
 =?us-ascii?Q?IvABQT9G23qsNCdRBwlzTYWi7Vg7kqVrAxu65wqpElEBWFZriEY1H2LvpMvG?=
 =?us-ascii?Q?SMCLArXm6WAn3XvvE/ppXi7V+v6/LytvIBQNxKRsSucB0SISj3w9NTTuboWz?=
 =?us-ascii?Q?Aq+ITdnyQhcCU77dun1xJoe3ha60Uc2kDmXTfsbke3N5MK4mgrvmWUQS17Sg?=
 =?us-ascii?Q?xtsEOEJbt6HUqmFdA6cG6gAA5dyzilFxuM1C6zck/oJC8MUCG0XEdQJLgbh5?=
 =?us-ascii?Q?SNPp/j/QvNAW2dIqqSY4OQ/7MKKxcYLRTToMRG5w9LzPl+MUSl+sFSuk+ZgD?=
 =?us-ascii?Q?hWWl45fF+sGCW8N7LYRHU1fqR4M3bdjrUglbjiI7gG9yJ7u0irehXEDf40Sc?=
 =?us-ascii?Q?iNOkl5KZEuTSkru8hE5LNiSaJnlewM+YTAYT4JVlZIsl+eY/eKKPlIm1SQDU?=
 =?us-ascii?Q?RveQ9+3LsCyVtAFSMwuRgMSdykM43VWdXrJzfnJawpXiTWTimcee22uxHllD?=
 =?us-ascii?Q?QXR+HFVZWlzxlpElyDKT8cRTD4ZkM3AyRdcEf48fIJKL8D8lJkLwvJWS5DfF?=
 =?us-ascii?Q?czm4iJV0uDnlIdEbXsGv+FnbVaaLlIXl6GRWspifSW4gsxlQK9G+B3CDS4mH?=
 =?us-ascii?Q?68b6BRmTUsxyhG9VIPdjml9ZvhUSu4H/9AL7s0OiHqAS6kAC+rcBdzzshJgy?=
 =?us-ascii?Q?SFeOvb1o/NXJGIectWmPRIkaCTjG9+y3cM/O7P/Og4vW1tZZVjA3pyXtT+WL?=
 =?us-ascii?Q?FnDK2O1HZg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Dbvgdtjx6P7Ro0DvfSCjUiV5zLw87KCNWN8WG2EG/gl8SW8L3sTv9iC/uCeiTx4xWAJUWI7Qr2/xqE5FStnjkaPEQegMIkQLyWjVRsTNjFegzc6H4yFdvHcdA9KgJoPaWd1pZQMdvHAH47j/eyjnYQku400SdeY3AjrdMBoF3RFIKcQrW8td1Lz7M1f9ZscVkkSZ+QC0HSwYknv9VBkvLzO0DIT5vJ419bXeVO0hiQbVuCzjKuPq8hSCfILBmqBSO4JVZduQI/f7HU6TC9gCg6PjxFIYDP5uDy4sxREAMKKQPbglK0L8HBZWXp3MjKDIgxie5aeXfzE8QBCt4oZsrw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rZEkSDQZ+AfHdvCtuF2+GAc8h0++xJZUZ7NzeyJnlRJOPuR6ddvwKKTjqxkGvCiBR4Pe1aPj6CMkPS8nruBX3zezZavh0KxPSCaSxuE0e7zONTGYPeujfF+U8kGlP3jem3ldk0g4r9z7uovfUmh3rw0oozCnNQQrI+8o2LekqMyVw6KEFp5v+YY/ik0v8UeBhJBaacBZy/p9CdjnYZw24vhTgFh1609okZ3DqqBP746RD77/2jK3UuM4aRDK0MaG4VXQFLa8f+gvHvOe9z18QNptD+hCJ6BYCZ6xnBIzFZhRm+W37/6voKIdXJZ+qW3gQFNvs4cXMtulrrqeiV6bkq8RO/zcdvRZlE/qwUDQHMrn4nahG3y8G6rCKOZg2mHpUA5cN6vnQHztzaKE0+76LEQmFGlqts6mu6abDXHpeFt7KIsZleZy8hJ9jpKhdVnUfMZ0dD183xw2BUZ7yWTTB44pS3pWvVitfCB5tvF654Zj838cyxTvVlrbcQtbmcMEayILHwwN3ndiywNn6mvkrc6LpMpzPS0F7zrsm0nzyDcav3xkUBcLOBpPiyPHQh2EGsfqqRyE2HsBTYQZ8hmc8j9aR/E4QLcAoB4LKBcC/xQO1Y3MuCkpItGD9Ku+TJrG
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bb78c1-3d7d-4562-c64f-08ded0b28c2f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 23:04:00.9344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHk+YWqCg4uaUWs4qG9XSQnRQ016BM1QTBgrcrfgyVsh3PP1SBp2fROLrEVHQEimebbPoP5eDYq59dh7QMHo1ws02nVPJDCO8qHVjJhxFOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR17MB5717
X-Proofpoint-GUID: d9Gz2rRbtriAPdkfYkfDi4HaIJ1KjQ6z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIyMiBTYWx0ZWRfX08ypH6xmVQ2V
 dlrgqRstRGO5/3ublZcoCc5A81BQJ+qaYzIdqICzfQaMZQAdLBZpxDQobC/BwPl0lgn1QkL9uO3
 OtyZ9q6d3Fmu2gZb3SmFZM2Zuaf+nFo3+bmMvv4487VlOHrr7qWw
X-Proofpoint-ORIG-GUID: d9Gz2rRbtriAPdkfYkfDi4HaIJ1KjQ6z
X-Authority-Analysis: v=2.4 cv=RY2gzVtv c=1 sm=1 tr=0 ts=6a39bf63 cx=c_pps
 a=H9d2Io+6O/etw3jU54J+0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=ylRlBDd5bHdllK8znExr:22
 a=F6MVbVVLAAAA:8 a=EQFWiQNSZTnAtbWslLYA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIyMiBTYWx0ZWRfXyJzxR7SfO7oA
 kP4/6goi5AOwX42rw6G1wxR5+YVCvf1gtmUuLAJ/VfvZF2F8MACt0MghaqsUnfuclRV2JwhKDmo
 Ecm6ukP+82XATS7zrNEO/6JRQQ4A5WXGqJyIkzfzHbMYx2COjRi9T3eDLWHIN9fQuRAB+X2X8uD
 6ZMb1Wide6BnFzHsmVPpnUFC6IBFW0ceWdJTz2rSN2tQqkSzcqt9cA0AXltNzV/xwfMe0bKvmtt
 sqmIqWx6YSX9g/urx3GRMgkm7YCvTOp4Df1G1fg40soCIvvmM8+7A8iCe52dKu7zgDOHvb4/5Pv
 N3yMb+wALiQo3S4xPyiYQiVZWLF1FXsouykyzMB37UTgHuZdICzwWgW5ppFSI1dP5PY+OaWlHXo
 U47JuF2JknsKknPO9FOYTaQjbo7RXjRR1EFLbFD1/9ELufE20VZThJ5+uPtGsMN0btXHkzyhbxE
 QG0vzx5RIrS+BQdAr9g==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11825
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220222
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 23:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239323

The go-vendor class creates a symlink at the end of do_go_vendor between
the vendor.fetch location and the vendor folder used by go to find
vendored sources. The do_vendor_unlink task originally removed the
symlink created in the S directory but only after it had already been
copied to the D directory.

The do_go_vendor and do_vendor_unlink tasks were never tied together.
This caused file not found errors on subsequent builds where the
do_vendor_unlink task was re-run without the do_go_vendor task being
re-run. Leaving the symlink in S and only deleting the symlink copied to
D fixes this issue.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index f854d14bdf..e879d629a8 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -42,10 +42,9 @@ def go_src_uri(repo, version, path=None, subdir=None, \
 
 python do_vendor_unlink() {
     go_import = d.getVar('GO_IMPORT')
-    source_dir = d.getVar('S')
-    linkname = os.path.join(source_dir, *['src', go_import, 'vendor'])
-
-    os.unlink(linkname)
+    linkname = os.path.join(d.getVar('D') + d.getVar('libdir'), 'go', 'src', go_import, 'vendor')
+    if os.path.islink(linkname):
+        os.unlink(linkname)
 }
 
 addtask vendor_unlink before do_package after do_install
@@ -209,8 +208,7 @@ python do_go_vendor() {
         os.symlink(relative_symlink_target, symlink_name)
 
     # Create a symlink to the actual directory
-    relative_vendor_dir = os.path.relpath(vendor_dir, os.path.dirname(linkname))
-    os.symlink(relative_vendor_dir, linkname)
+    oe.path.relsymlink(vendor_dir, linkname)
 }
 
 addtask go_vendor before do_patch after do_unpack

