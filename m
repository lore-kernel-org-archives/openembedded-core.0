Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.73])
 by mx.groups.io with SMTP id smtpd.web09.2286.1605067829997589833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 20:10:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PKKZARbu;
 spf=pass (domain: windriver.com, ip: 40.107.94.73, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fyg5AawhovHZHIAhcyx7ycxl2LHYf2GVOADFd/H3zDF2BmBug2bME/m2HPb5YrqHAm2ipSJomTsLLasJpW5GUBDXNVXN/9nU3J3KxJE6Lv4X0f4IeNUr6VsCeOUUrJDT/Dvr7DvZ9vgtzOIVnamoEup/+fDIjmW83yYtLVlNQDc7whWBVp1ISVVp4tso6aqe1iiuuNvhIDviuD6bLL5ymaO8Fz+QFqVBVQieWSOPvFEmlSjae6JRhdZSpEs089nUUs6OwHS6PUTje7hyU/YfGPrkmzhifiJM+iMMT7l0rEvTQmmWt9mbyYWxr2tJGW3jR86YSKgMneBJbkWMMC7LAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Zfth9DzfZqG/1WpNBsJNiI3tge+vWzU/118MBSDg78=;
 b=fgeDezELwyt7F/NVNp+Mw1uTE7tmM7wNXiZBrDitGmYsR+THWaD8MNOm0nW9IpQuyS3pRlGqlcDYIutJl+L0K5uOdQZ6xYqo5QiRyUeZOONdvr9qbJGyHu9b32vfXSKM9DHAXXKdQkGEgV8dmQv/M9Kvv2pAGkrGXBEsY0QEfw0aQsTyfWNkQ7DZjhjU0aKtmq4EMEh4TCrTUxXUBJxKAcFsQoGyrHlnhFcd1cZdbRmIyswZW4yRv9fmMZO/UYxJrzHYIDySXSNbYfhbFB4Z3uN3IwKmmLm9UUkyTeHdyqYi206v9Gi2h6HzXp0JE2iAq+eokalsTxjco/6FG4Tt5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Zfth9DzfZqG/1WpNBsJNiI3tge+vWzU/118MBSDg78=;
 b=PKKZARbuaWuhyugn0+PRvNwPk31+J7xuPeHADh5VyUdle0fAF7FegqBthqNwb6LfeYlMc4bpqovsnt5IyXb6l2j/7ut09WNtNQJgNJtTRY4IrgSnHN9WjLMYZhT6Q8OGDjsOc4Jz1m65nvfZBTeToi8wjD4MC2/riR9bPs+FMfE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19)
 by BN7PR11MB2546.namprd11.prod.outlook.com (2603:10b6:406:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Wed, 11 Nov
 2020 04:10:27 +0000
Received: from BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::9c14:1cd3:1db:46e5]) by BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::9c14:1cd3:1db:46e5%8]) with mapi id 15.20.3541.023; Wed, 11 Nov 2020
 04:10:27 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [WIP v2 0/1] Add Qemu Monitor Support
Date: Tue, 10 Nov 2020 20:10:00 -0800
Message-ID: <20201111041003.864509-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: BYAPR06CA0041.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::18) To BN6PR11MB1873.namprd11.prod.outlook.com
 (2603:10b6:404:106::19)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by BYAPR06CA0041.namprd06.prod.outlook.com (2603:10b6:a03:14b::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Wed, 11 Nov 2020 04:10:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1821bcf3-00f9-43bf-30d4-08d885f7b83a
X-MS-TrafficTypeDiagnostic: BN7PR11MB2546:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2546B4B9BFE7CACE0C90C0B5EEE80@BN7PR11MB2546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y6lB+CJ188ML/6HieLW9vImT44srY4vySB/jHrYjGsFGsJ+wxKixhANDMGmhYLsaYS+aifqzWvtedx4M3kdm6eLFf8D+hXotRjlTzhNOnzJ0a1J6dqe22vtjo4DF0JhWM5m72vQbYlAhvfWzhQIUuxYtX1nBHnG+TepGt5U+UPzJUEijSoRCZBSukD8WvP6kIJObcFgKAkjDlUynQHXRBQf5v/1BI7te/2+ibOH2lkkNsLcJLymD4tlQzWudDGh8BiDZelTK79HKtKxH8IC3Sp5ok3ds1y0QQqwEzIe5EMHfNf3VmoRK98pspT6mx27PEF+XfF74PD0yb6IDv8wJ6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1873.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39830400003)(376002)(396003)(366004)(346002)(83380400001)(66946007)(6512007)(5660300002)(2906002)(86362001)(44832011)(16526019)(186003)(26005)(6506007)(1076003)(6486002)(8936002)(8676002)(66556008)(52116002)(66476007)(316002)(36756003)(478600001)(2616005)(6916009)(956004)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	W3Co/6KBJhK2boqAQBtVaELs6yqzAHE6cGIMjATTvMA8ncykqvfMuTDQ0Wbk2/VN+nGlGlw7QuguoQP4Q2Lz+PZDEhDA867iVvKUntb/InNk3exY6/biCCiMgcHkX/giOUhGsq0FJLWMkEA2aZQCJha+iljd7R6ZHaO8mP75efD8bReQ/DtYKetYZrcp2HWrvmn4PXpzJWvbKhY864uigH6K9yEul9Ze3MWzM0h52WoORcJvJXtNWqSKPse7ctFvjXqcRwj+/Xu1khGITTYseke+4faiHLkvA6n0w3gkyZj7zNIyZ4pVf1fRpT7izlW/u7Wj1bd31mCJLsdBmvJeqxkQsKjx/F+QHfwt8r1o3W7znYM/aGpeIrnUfC6wHACSPbKuXQcp/fIPDX5KWYQYMocfJdBEjDC5c5vdfe92MWRPRrnr0eyxyys3bByKAABO2afFR+DLkLsTZZJ1ag/nkfcTUwJClNAQR1OWfmwO3yACoRwX2giSV8zz+KwBsf3NUu7Uo2AwTBHhDmd05uYOLwLym1ZVyGFR5AWCCUPcYA5Sg0jInKlXlKH12UuniKHGel540n8UXjm/4Ol5XlCmvQbLwT+ebY4wphzf/n+nabLCWnXcPKInwpNzhAT2/OwVRC2A3bpbpm1HI2roxT6S/A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1821bcf3-00f9-43bf-30d4-08d885f7b83a
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1873.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 04:10:26.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L77wEMXywjUlMnTIcEC2QoE91X5O3E5IvrwBkddBsxg2pfwhfs2hG8g2db4gkLzFjpo1ylZFvXjgypFWcgfZ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2546
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Version 2!

I figured out that I was saving the monitor_dumper in the wrong
class, so moved where it's saved into the OESSHTarget code, it still
needs to be created in the OEQemuTarget since that's where the runner
is available.

Currently we interact with the JSON (which is new to me) interface of
qmp and right now the write/read is just raw with no JSON dump, that
might be why I am seeing the erros after the first one.  I did try an
empty run_monitor("") between commands, but that did not help. The=20
run_monitor() may need to be reworked to deal with JSON.

Also, I still have the static port of 4444 for the telnet/cli version=20
of the monitor and the possible race for the generated port as I have=20
not found a solution for that yet.

Sau!

The output goes into files as follows:
::::::::::::::
tmp/log/runtime-hostdump/202011101608_qmp/unknown_00_qemu_monitor
::::::::::::::=20
'{"execute":"status"}\n'
{"timestamp": {"seconds": 1605053296, "microseconds": 645339}, "event": "NI=
C_RX_FILTER
_CHANGED", "data": {"path": "/machine/peripheral-anon/device[0]/virtio-back=
end"}}
::::::::::::::
tmp/log/runtime-hostdump/202011101608_qmp/unknown_01_qemu_monitor
::::::::::::::
'{"execute":"query-status"}\n'
{"error": {"class": "GenericError", "desc": "QMP input must be a JSON objec=
t"}}
::::::::::::::
tmp/log/runtime-hostdump/202011101608_qmp/unknown_02_qemu_monitor
::::::::::::::
'{"execute":"query-block"}\n'
{"error": {"class": "GenericError", "desc": "QMP input must be a JSON objec=
t"}}


Saul Wold (1):
  qemurunner: add support for qmp cmds

 meta/classes/testimage.bbclass    |  7 ++++
 meta/lib/oeqa/core/target/qemu.py |  6 +++
 meta/lib/oeqa/core/target/ssh.py  | 22 ++++++++--
 meta/lib/oeqa/targetcontrol.py    |  5 +++
 meta/lib/oeqa/utils/dump.py       | 20 +++++++++
 meta/lib/oeqa/utils/qemurunner.py | 70 ++++++++++++++++++++++++++++++-
 6 files changed, 126 insertions(+), 4 deletions(-)

--=20
2.25.1

