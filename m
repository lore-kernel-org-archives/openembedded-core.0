Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20281ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:31:14 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.40])
 by mx.groups.io with SMTP id smtpd.web12.8948.1663947069017921263
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 08:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=yzCv0q9i;
 spf=pass (domain: arm.com, ip: 40.107.6.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AYDzbai4Cc10l5Tm7CmCPszjN2HkVl78MOucCccqe46+4k754T5TCt6F9+TFoDqJGgBZxrX4IWZt+N2bVfMvWxPxHr54PlH5YfKNUfRDbAPP/SruDur7Y58D+xReWp1apHXZOU6GdcVp0ZMRhCdNLF3xZk5X9tqBkfRP+lyb2kZxEH8YWL4J5pibjpY/r5yDy0G4fH8SHxyFxO278YUmVKrtVwq/0EDyTJvyyjSZyIIXSHoi8XDeCXq8zu6azl3ntUGRDqvnWoDU8c44BPm3dG+vkF5ZMMFq3V5f8FodxZEOMUAYLksMjjbk+yXLgLTAyKjkcsUAcdaoyEAOfxyszg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAwA+0v0zLl98P105R5Bb1yyT9DuiRIkKUfCO2b2Iic=;
 b=AffS7rzh+fvSvnvchIoApUQnqqFtcX1Tt6kwkk3hZlPebraauRqvpXGrGONzhK5d2qgoAa6R5wpBWBoMJoZE7dwSH457CXD0dkgdreTZ4h2S4rfWhnPQWrCyo9OcOBdTsL3RILoddAQ9QlIYGI5TfCc54br8Toh8Cto05p5fDkrgB0hoEzPqDxNOKte3PWrUxtEacEhoXlBTMXBIEdIire40gYlzaPxeEUzKxiDDvNZHc8+y6IB9D7H+8Nz+pzzMuSTBsgpF72omOnCjL9V+y96VqfZJaMgK0wCLxAUjuEx4OU+a/HB9R2I7jhmvwGLICtlAmrW9TJdVo8fd2aXnSA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAwA+0v0zLl98P105R5Bb1yyT9DuiRIkKUfCO2b2Iic=;
 b=yzCv0q9iWFJA/G1MwvENqiJoTmnDP3vIRkGM9HA+An99tjwxPUDBW7B65n3LKx1yIxQOYtdVmpUsBbnazc5csCchZUsmzhDHnKEFUAMV6lC56gE7PYqWAYtJPbEvmJ7OrFRlVIYy2NJ772HnoznrPdY32eBsiuKWWd483sELZ+M=
Received: from AS8P251CA0019.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::22)
 by PR3PR08MB5754.eurprd08.prod.outlook.com (2603:10a6:102:91::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Fri, 23 Sep
 2022 15:31:05 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::31) by AS8P251CA0019.outlook.office365.com
 (2603:10a6:20b:2f2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 15:31:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 15:31:05 +0000
Received: ("Tessian outbound e2c58cd9a6bb:v124");
 Fri, 23 Sep 2022 15:31:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7e38dc256b26666b
X-CR-MTA-TID: 64aa7808
Received: from ce756406908d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A72ECBD-D8F4-4199-A23C-64F50E42626A.1;
	Fri, 23 Sep 2022 15:30:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 ce756406908d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 23 Sep 2022 15:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enbyQ2tiRWCYWtCGV7NsLbcVlshDyqQwT7MwlVZnWZSMJSmf/OGrugkoqzTCHh7mX2jIlbtAlMJMwnssALIB55iLqcAAot1bg2H0uAVQIKImHFL8Zjk8Zw7fgZXKIRwk4BanIu7dFugF2ViLXhAt3z/KKyNz7dvh4sd6cnVTQjs6s8JpMl7jIhD4snZfZT4JkmnCFI5w1B437nC+eyaLnLP37hW6nBVmXuwNw2biRtGjfZqGUgzKyo5sqAFNW3Lt7JMRA7dCofucMsZJhnn2n33ENRK4mASFZBjlmNGVXLFxUokDhiy2IjJinHG1e5IF8OH5SpUO5rxod4vf1c5QfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAwA+0v0zLl98P105R5Bb1yyT9DuiRIkKUfCO2b2Iic=;
 b=Gov4WBhdbounzlD5Z0MunENxFZJDKuXqch/H8cX2nwJH6Lv7htsD8tRZAp+nkP59WmQ4dQ62GVJVlrqd6rTBxlwCodOHAxj205EtjmXHt1gItK7tR8R35DucFz805ZlHCRjyw0Y2BmaoSVgNyHe5uFc51HORuefHSBtQR/Roz7UKNrdOUgZZK69q23EcN/G3sS0MhaSAv4CUL2G/+fA6LL8GMfW+YRWohSXnO73xUu3o6E5k/+9JFu3h9PE9esnW0mrXwM0FH7Sz8Hr/hSAWN8iYiaGIs8JWBZKlXU811eH7u4wsH6DsqVhV6VpyUZMU3moBsXtdk7KQCKYtT4CZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAwA+0v0zLl98P105R5Bb1yyT9DuiRIkKUfCO2b2Iic=;
 b=yzCv0q9iWFJA/G1MwvENqiJoTmnDP3vIRkGM9HA+An99tjwxPUDBW7B65n3LKx1yIxQOYtdVmpUsBbnazc5csCchZUsmzhDHnKEFUAMV6lC56gE7PYqWAYtJPbEvmJ7OrFRlVIYy2NJ772HnoznrPdY32eBsiuKWWd483sELZ+M=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6505.eurprd08.prod.outlook.com (2603:10a6:10:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 15:30:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::559c:f19f:f674:b553%4]) with mapi id 15.20.5654.018; Fri, 23 Sep 2022
 15:30:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] binutils: handle symlink files for gprofng
Thread-Topic: [OE-core] [PATCH v3] binutils: handle symlink files for gprofng
Thread-Index: AQHYzlz4P7uzJNyqCEOHNk/wrDvBz63tJjeA
Date: Fri, 23 Sep 2022 15:30:55 +0000
Message-ID: <C355BFD2-1F04-4F16-98DD-23101750B29E@arm.com>
References: <20220922082545.40540-1-kai.kang@windriver.com>
In-Reply-To: <20220922082545.40540-1-kai.kang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6505:EE_|AM7EUR03FT004:EE_|PR3PR08MB5754:EE_
X-MS-Office365-Filtering-Correlation-Id: 60fc4432-55d6-4b2b-f572-08da9d78a149
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 H7AhYVWDxPXQpZ1S63wyXDgpOLCX25rmG+AQ8k94/X03KURRwa2Wy/NubmQOU1PXud93is0vlXyC8vtbQayE5XXxN3X7VugD/dDcGb7ZjVKldKnrGsoZkEy6NvO1lKEC+0Xyok5Au652lYYKxy4OKw3+lW3Uq2EI/c+FF0P5C4YYGULBOjJbRikrtbtVpxfnrAACbgwdy+AGvkE2ZDuC2itM2CYF2mNtI9p/txg8mgJWTSEzCY/Bcie27lLkJsMW6cyp/HBQ8Cm8kRdA+AvPcpRYAUEqzOn58f1do8rL/r8ipBmQGNBb/OcdUMim0eEKMohh8NpcN2dIjbrMKDDCfytf+iTBLiJqJJbbFAjhBc5HiSLo6WZpFJ/UXY1/A0bZJOyVN1gb8oASdcWj5OajBMT0nB1qF0Fj82vtZ2NLG9Tl3FxAZ/RkrOxKHH/yN5hG4Xn9qRM4kryQWRIV72k1eWIZKDx6NgpSIdzOAPbbjvxgw76CHYzc//9ROKjsFBVPRyv2C1L8kLA1t5N7UKrU8LB1xcyVNT0yOAJzuQFQv71VkwgzOGy7qzy0hA0NaRJ70Y/HhSpYjabfq7FarTF0qSN9e5ezTJlPw2u7+jcp9S+vU0czQeGz3Rw7140kqArmp7AO3X7bClXBdbx4hGsPeexLkcuenk8y/oyvshIAO9B521ev1aFBGCXzdWOkrXYsXR0gN05l2hIFZUJFOpSjMBoyhS4teQWKSEp0lNkLv5GfQ8/YEn6czFNKDpI+0zWzt7aGNKP2wEgBFcg60W+RZ3y1U6wuSDw7FXYQusK67JmNnmw03TsF76niMcdLgc1d
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199015)(478600001)(966005)(53546011)(6512007)(26005)(38100700002)(6506007)(2906002)(41300700001)(122000001)(76116006)(66556008)(91956017)(4326008)(66476007)(64756008)(66446008)(38070700005)(66946007)(316002)(6916009)(54906003)(8676002)(5660300002)(33656002)(6486002)(36756003)(8936002)(71200400001)(2616005)(186003)(86362001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E2B7085BF038B54BBD2F30BA394EA3A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6505
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cbbf3ce7-ca88-46d4-37be-08da9d789b6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JjlXazLHJYNfRuCeV7HPLiG9FsnL760z0FsNW9Xevrizwv+fAiagBBaMhCEjl/mwhml4d1Dnplolv6FUJDeCzTA/T/rElbzhyyJEH4YjTGbWyyY0F+//V3nhRpm3PZeLLzAfhx4int4VhyY3Th5dCueqttTsjE1vFuNBG1WzdcRysQV6FqHpflgwSAWfNvM8Y1PCTt1VzU/hcld+hyC/IJlbNRlNIl7MgnWLEZ/6W9SRrsTeoAaMjhJkRTfbK3P5l6vM74pwXA/Q40/aG1MPXjCJjTDJcFH8cygzA7NVihcLsfH8HnoaxMXQAeSG7XB78xJ3+ztmmcQS4n8TFWGwcWAB7L4Paxo6fS0HybBz8+JVTjNTX9nOrzvLobCN1Yumh7ZmzhJgdWwRCfI6bNKZ93szDkMPafk2ip+nDKvmHqtyyZ/Z0J52jAOH3xMbnuixCYYi6f7t8hyzr6oWTJpzBEVbKL0i+cBMKBvgsNlDid2ot3CRN/VCH9LyIdM1XRpdPIrFdErlPpznpMNMl8JBd9pTljeoD32ncs0BqGJ75St7CmC0KAiPJQ3n6dLuYbOiylM+b26SUQkTElXUNZP8gy4TG/vc7hOfw+RTzrsS6x8W+NRWm2wQzaXNSN99kQC6U9MT7L+eD9c6cN+TDz8RVFi80Nk7uVCoerv5usGmjtEb1Kuu6ZduFta3dNxv9JQ0IaDD8gOCW5EJMDfFmpfeg2X7sDgU12kom/qjDVyz+SO9+4WfZrMuCYSTEdxTwpt805M/bF1eCx//8KuoIOR2oyS8UQSkOpfUngCjVisjCfo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(70586007)(54906003)(41300700001)(6512007)(2906002)(33656002)(316002)(86362001)(70206006)(36860700001)(40460700003)(966005)(478600001)(6486002)(82740400003)(186003)(8676002)(2616005)(6862004)(82310400005)(356005)(5660300002)(36756003)(53546011)(4326008)(6506007)(47076005)(40480700001)(81166007)(83380400001)(8936002)(336012)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 15:31:05.3336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60fc4432-55d6-4b2b-f572-08da9d78a149
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5754
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Sep 2022 15:31:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170999

This is making our CI explode, I suspect the trigger is having meta-clang p=
resent and enabled:

WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative prov=
ide /usr/bin/gp-archive: /usr/bin/aarch64-poky-linux-gp-archive does not ex=
ist
WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative prov=
ide /usr/bin/gp-collect-app: /usr/bin/aarch64-poky-linux-gp-collect-app doe=
s not exist
WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative prov=
ide /usr/bin/gp-display-html: /usr/bin/aarch64-poky-linux-gp-display-html d=
oes not exist
WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative prov=
ide /usr/bin/gp-display-src: /usr/bin/aarch64-poky-linux-gp-display-src doe=
s not exist
WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative prov=
ide /usr/bin/gp-display-text: /usr/bin/aarch64-poky-linux-gp-display-text d=
oes not exist
WARNING: binutils-2.39-r0 do_package: binutils: NOT adding alternative prov=
ide /usr/bin/gprofng: /usr/bin/aarch64-poky-linux-gprofng does not exist

Ross

> On 22 Sep 2022, at 09:25, kai via lists.openembedded.org <kai.kang=3Dwind=
river.com@lists.openembedded.org> wrote:
>=20
> From: Kai Kang <kai.kang@windriver.com>
>=20
> It provides gprofng by binutils 2.39 for x86, x86_64 and aarch64
> according to configure.ac:
>=20
> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dconfigure.a=
c;h=3Da5555a9c91b42214afc46a0ab8b629e4c6fedcc0;hb=3DHEAD#l401
>=20
> Add them to USE_ALTERNATIVES_FOR the same as others to handle symlink
> files via update-alternative mechanism. And it disables gprofng for
> clang and musl in .bb file, so clear GPROFNG_ALTS for them too.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> v3:
> * clear GPROFNG_ALTS for clang and musl
>=20
> meta/recipes-devtools/binutils/binutils.inc | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index 789c8bec21..4dde387a8a 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -36,6 +36,23 @@ FILES:${PN}-dev =3D " \
> # Rather than duplicating multiple entries for these, make one
> # list and reuse it.
>=20
> +GPROFNGS =3D " \
> +	gp-archive \
> +	gp-collect-app \
> +	gp-display-html \
> +	gp-display-src \
> +	gp-display-text \
> +	gprofng \
> +"
> +GPROFNG_ALTS ?=3D ""
> +GPROFNG_ALTS:x86 =3D "${GPROFNGS}"
> +GPROFNG_ALTS:x86-64 =3D "${GPROFNGS}"
> +GPROFNG_ALTS:aarch64 =3D "${GPROFNGS}"
> +
> +# it disables gprofng for clang and musl in the bb file
> +GPROFNG_ALTS:toolchain-clang =3D ""
> +GPROFNG_ALTS:libc-musl =3D ""
> +
> LDGOLD_ALTS ?=3D "ld.gold dwp"
> LDGOLD_ALTS:riscv64 =3D ""
> LDGOLD_ALTS:riscv32 =3D ""
> @@ -48,6 +65,7 @@ USE_ALTERNATIVES_FOR =3D " \
> 	c++filt \
> 	elfedit \
> 	gprof \
> +	${GPROFNG_ALTS} \
> 	ld \
> 	ld.bfd \
> 	${LDGOLD_ALTS} \
> --=20
> 2.17.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170965): https://lists.openembedded.org/g/openembedde=
d-core/message/170965
> Mute This Topic: https://lists.openembedded.org/mt/93844412/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


