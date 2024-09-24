Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44051CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:30:43 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web11.11507.1727177435807239200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ECtF0PhU;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ECtF0PhU;
 spf=pass (domain: arm.com, ip: 40.107.22.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=k/JehuUPd8F8YN83PG79y8xfZkPikzitL3DKUcC53VMB/mEg9UcyYn7WLqD/+l86SdbquQYAjXJqhM7DM5EYC7v4Rw4bNOAqEobjRak+wyl6Ah9neHXS0fvtX0W2AgRkzvA+FchtkTodHp4IhloMJwHDQzR41kzPqHfmdO8Jkn6psUjTQr5LJ3zDWqs0vNSlBCV4x/h0ia3AblCmx16xuXizjyF1WAQqExE9/MFhndvTEmKrBguXbCx2xp2pOMF6txUmTzBnKQWJvIduwYfEMemd1FxmWx4eMKYiPmXn9xkiKpZGsv+F7gf/K7TgeeYaJD7KmPYuUPPxI5eidOnbQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNlTQFjztaa8YSD2AI9K7cpwx/WmmfJfH50dFM8Sn8I=;
 b=WXaUTm9GMcuyNBNUPO/3G3PgoB4rmAjQBpcbIx9lYCfThYDItwBB7+ezHUc8HgYQ0PqkpvC1WBHmTsAEm5NfQ7QF1TDYlc18+o++YCSMCeuiUcNiAFO2DpRPzgO3fyRmZV0iQyUOHtVmJwGv5CJd9gyEjDwcGYZfnSXfXdocDZD3ybX2BR+47XG+099c1HR6NjFp6b1OlrSpEJwqYWlq6QnW098R2wxuq03XIEKIIAlc4YojDKQLN3gzFnTJ7ze0xQciNaX7j8YL9HbNLqxmEK8FVpWdI38xcJzwB1jt9nAN9mC0Kebp4Fk5wHJw7XLPDtc1tIEqbrkNg0AYiqTY7w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNlTQFjztaa8YSD2AI9K7cpwx/WmmfJfH50dFM8Sn8I=;
 b=ECtF0PhUda5xnF5VhohncCHfcqFJy6fwNnJOZ1YRiVtRP2LN2NpvNMDXwcsZ/n/I8lZAeeUkS5DdLnQGwSFP8mh3yrFjn0JxEsAu3brD1TEAXULVDw3He1uP2q+5gKCEB098DxOiEi34cDGdm8gR/be0+rALrjIRMtZXAxtFFQQ=
Received: from AS4P189CA0003.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::8)
 by AM7PR08MB5462.eurprd08.prod.outlook.com (2603:10a6:20b:10b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 11:30:30 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::4c) by AS4P189CA0003.outlook.office365.com
 (2603:10a6:20b:5d7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27 via Frontend
 Transport; Tue, 24 Sep 2024 11:30:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 24 Sep 2024 11:30:28 +0000
Received: ("Tessian outbound e9f81699740c:v465"); Tue, 24 Sep 2024 11:30:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d378e910c33736c1
X-TessianGatewayMetadata: KaPb7CegTowsHveG5BD0UkIH0RApg1HF3ILjZQWMUqm/1cMleCnf6RXE+eM6gyoGAc0nmCDwznvwKerIdRjEQO+n2cJZpfJdr9trAlr1GHpCmdYvh8sReU9NXoZiLDbNzxEUVWggAx00I5diabFvb1LaCD3tGg2lzr+HpAYUyWE=
X-CR-MTA-TID: 64aa7808
Received: from L3e5471931f35.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1504B67B-5F5A-4235-98B3-D59190772648.1;
	Tue, 24 Sep 2024 11:30:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L3e5471931f35.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Sep 2024 11:30:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4VRZTu4TEOqAkY5AugViuH8t8GZ6OzpzRu/aw64e36YWceAjKJgxf7V6wQlgPKDS7M4ZZcLbOQdtlpyqrC248kw1r/OG+y1mG1FeXaRh9k60Vl8aQINiyhEQiaKI/PGt5z6RPVH9jydCjUw8lK1vVaaoM/1myUHwTV8C1nz2tZqSKASMZL7ryZCpnpz0/XVLk2Z6gP/plrf+3IgVkDqF4Lih6s6eiewNnlTGpBd8D2S+mX8wv+wu3+VPjj10ZwymMpelpIbTfaJQd0PXhtoEgUFoju6/IHEDBjx/C+HsJve8K2QP9nsFOawU7i9w3RKcVSWPmAxn4BNV+mPS6VMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNlTQFjztaa8YSD2AI9K7cpwx/WmmfJfH50dFM8Sn8I=;
 b=gkhkeSIzuOp0/DIoUkBHdXnqsGaIUtfoeNkC25YVe4jwca+nv9HrJAavf0DQ3cRUhSm+166dFQcXTW7vGA81XzJtv1CGnFs0QDBFjFrEXCyWR5iDuUrkMFzE7C6GZjACKjVQpxKV0ePsLSEbZpCfKedleUmI806E6T5YkO6atr01LWRkxbcQExMl0vxFqyIQSKgT7Jx+l+cg0COorUbdgI1MYgYWBueuMcjGn0zy7DfFeBkWqJ3Bgsc1gCuTf4LItAIMBVW5DYCySChDGA3X1fE+jd2Fhk08EAGogz8Bi3O9PRjGRr0wgdAK3iGM9Qh8/s1qeWKhE50jxxjx01oumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNlTQFjztaa8YSD2AI9K7cpwx/WmmfJfH50dFM8Sn8I=;
 b=ECtF0PhUda5xnF5VhohncCHfcqFJy6fwNnJOZ1YRiVtRP2LN2NpvNMDXwcsZ/n/I8lZAeeUkS5DdLnQGwSFP8mh3yrFjn0JxEsAu3brD1TEAXULVDw3He1uP2q+5gKCEB098DxOiEi34cDGdm8gR/be0+rALrjIRMtZXAxtFFQQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6099.eurprd08.prod.outlook.com (2603:10a6:20b:286::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 11:30:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 11:30:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "aleksandar.nikolic010@gmail.com" <aleksandar.nikolic010@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] scripts/install-buildtools: Update to
 4.0.21
Thread-Topic: [OE-core] [PATCH 4/4] scripts/install-buildtools: Update to
 4.0.21
Thread-Index: AQHbDZcqcHLoqlW6WEGiVxvGy35cULJlFH6AgAF/FgCAADtwAA==
Date: Tue, 24 Sep 2024 11:30:15 +0000
Message-ID: <289C5BB3-5EEC-4C28-B85C-F4148FE5DE41@arm.com>
References: 
 <CANPvuRktR9NbXAzFOJsusgctrXcmeHxoHpXO5882+tNsgyJvwQ@mail.gmail.com>
 <15848.1727164640820287502@lists.openembedded.org>
In-Reply-To: <15848.1727164640820287502@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6099:EE_|AMS0EPF0000019B:EE_|AM7PR08MB5462:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c35574-7fdf-4886-fd45-08dcdc8c4aba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?NXgvtR4O1J6H6ciFBnFMIW9M13fPRvbARMlT4wio8BjUeDolHHttozhIP532?=
 =?us-ascii?Q?zj8GjCcTbIo6OZiSVBrxF0fqDZnLOalfc4SeDhEyfLCyIZUI7xq+4YUP/XIi?=
 =?us-ascii?Q?TRYn6pYl5iiCNl1pP+x2r4u2tPurooXGSXOSTN0ZV2NljJ2VA9L3dTDjtSgY?=
 =?us-ascii?Q?dOj2wkU5swsKHhR783cVwd4QCitf8HRe+jBnh5Ql9obAPnHmlEP+5l6GY0dL?=
 =?us-ascii?Q?ZceG2Cqlf3y6Rc4q2Bc3BT3r35lg9FVK/h2wusASENmVUaCUuWsULUzfby2+?=
 =?us-ascii?Q?OMLV8oH0oiGpitUxmrvNItAblMz1SS6246/9+ypAakOd+hr138B45KINdHXx?=
 =?us-ascii?Q?PvEcmgAjJvLd62YfJbrfBAY5ulMCB5Xx5sEFuk9Cx7kh6OYS3xMiwHa38aUs?=
 =?us-ascii?Q?u6LMMkAjyofFU5zvEjhweSocAq7ab1QJD8JqWQS15wpQG6qziMYgaRk7d5oP?=
 =?us-ascii?Q?MzS4wrLwOUasCABWyhhFa5v+pCpHvZB9MXgI9EOvSxQWlD8fh8kE7KQcMky5?=
 =?us-ascii?Q?lHUfVGjfaZBA8OSEithMQyvgk55WgwZf5o7nGqy7D2CvVJ1ibmZJRpI8kxqJ?=
 =?us-ascii?Q?ZRpqmfvGpSnhKMZ4QwmnxfHs2CXIIHoXvFZR0z6CftsJsUPwNzy310U+gOZ2?=
 =?us-ascii?Q?M5AJTFFlagInrT9sLULtS1MDONsT71mreoFRAH8N3aPnUXDuB9BW0Z6yegQZ?=
 =?us-ascii?Q?HqQLD1Pqz67E0gEiK+XL6co48dRX/Kuzq5bNTVlEfcsYWjL9R1NZYcGfMNV4?=
 =?us-ascii?Q?gw8JV7T6PF3EHlaeaA6Zj8djcAFqttoVNM/EqmFDxNN9+WrU+Yz7IYEKrKM3?=
 =?us-ascii?Q?b3bpiqTZWRs3fzCy3hxwI09OJ4T6oRDZkbAyalbtAlvcXReb4Y/F59hV8QLd?=
 =?us-ascii?Q?LW1sZ2mod2KajBE+UeVBVZsndfIS3E444SvS2E9OIjdnLJjUbJh5G4xAf5a2?=
 =?us-ascii?Q?zV0ouSArRlyRl4Ps4Xj9PPvJRhi4iEJPkpaLylPShm6OC/6qkRux+ZPHMBPn?=
 =?us-ascii?Q?fLFIAg4btBeB2jFBsRoSdCDklV2aQflMTlILMDvczijiIb9oDfeRv+dNJv5g?=
 =?us-ascii?Q?KI6IF91Wg4jROeS+Qtcg3IGAV654QMrkhrcXa40V3TRYRtlmcv8wgD3L6YHH?=
 =?us-ascii?Q?Piz6UdwoUlEMB09bITENZRPuC46zVMW12I0qD774odH7L0/7Z8/IFdD/qQ73?=
 =?us-ascii?Q?vRD7cjPD7QWrUr9DuaesN1G+HkHIf3ZOzhlUMUgLB5AUUxO5IqMJIKk99DDG?=
 =?us-ascii?Q?u7FnxkBgFk/hvXvQLNpr1lyCiut26Dk37CdZsCBZnLH2ADK/r2VKUElKzOeY?=
 =?us-ascii?Q?P5Pwcm4gnWzx6/sAMtaKlnsVlsGlFg6+83WNxupiGovLaGWZGR+nG8RV9Qy9?=
 =?us-ascii?Q?Xcu9tBn0lof9RBbPPWpm3KV6JogTqdCA0f5HvvtOCGH65PD4rg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F889F1E90B1EB4DAA488C155CC6474C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6099
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	00771549-f3b6-484b-9742-08dcdc8c42b0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?s/RbYT9ssDcI7/MvaQj471sfoJjW43uLOzwmLwtkV08TH+DZRl1sbOyAhy8i?=
 =?us-ascii?Q?uI0IhBISDszgAXWcEQnvOXnqXEwekMwCHaTdlKOpEGZ66AS8VD4Nd00gH5Jd?=
 =?us-ascii?Q?TVV+Jw+9kcr90URE0wNkfV6f4KP2JNav3qho8n4o4iZr0yORnP4S/wQSyQHq?=
 =?us-ascii?Q?MCPLghoUPqeHt0q3gvrrPhdZRfeO6gWfZap5/e5wMqUIfIUj66dbthF8Xoce?=
 =?us-ascii?Q?MbLNEZ+o5uK/D3GPqgS4BbULvVnES9nvWNh3+eDby4x/0ZPLAk/4BwLMOBQx?=
 =?us-ascii?Q?q2EmXFghjriGbUQgusSUs5FivaV2VFg571pkc9y8BbtcXoSXTfVC2qCpPIxB?=
 =?us-ascii?Q?POkYk0Er4QTLnCZpSmB9WZirr4DLk/0fTv3GTq3GicxK2WTVLdZJTDaERtF9?=
 =?us-ascii?Q?wd2rd61FoyeLCJauYjhDU7pAaJEZI1thVZFZbKlByjnq6Ew/kzGyggbtYEUI?=
 =?us-ascii?Q?dufeQaYqBnU/iflDmo09AfWuM8RTufery1uQx2patCjlReoJqp6iDwiFfbFD?=
 =?us-ascii?Q?qEUlG+M4d7gsoJOnXYMRzM2PIbEnnX5T1P6JRudGTtJVAKUZADdnLfoNhE9O?=
 =?us-ascii?Q?ahA8RAgsE+gaNl8mhEeMOA8rcAXo3tmzQkSwlIWpncY/okskgiKVgh6REYgA?=
 =?us-ascii?Q?tSkcMet/0DA3nccXLTXzMQdhlq7DmIPwwAxKUJOrkEL32PkVz1k4E0vH23es?=
 =?us-ascii?Q?LHnLV9QQNbpujeyLuECipG0DKEZ/3ReGMZ1mbT0Is4F+mmD2RbP3K3GrTojq?=
 =?us-ascii?Q?OSR7tnH1WIwfxvO7+B5KpdER0mriQ68jLytYyew9BkXlU6AjfMAGQCPx9F0/?=
 =?us-ascii?Q?gBWnoVZgY8cPBETZeLHSkTjbUpJz7+P98WsAIRgQFZg+AWS+eKAhSP44OW5S?=
 =?us-ascii?Q?FuiVGPJ9k5j4SAzzqDBaXkKasWvGCliayEoTvmG2M7o6p/ndqON2aeUqX6dV?=
 =?us-ascii?Q?cGzGES8pdJ6O6UBgyMGkDTsetx/on9tAs4NWGMd+od/F2XSMfzTg8n4DWaJO?=
 =?us-ascii?Q?KRD/9N/KxFJf9wpBblBJp+Mi4w6Si9HGQPH45L5tWxyy05QZNqm/1yg2PS/m?=
 =?us-ascii?Q?Yk7lbd0ZoUB54qlvG36Gf5Cw+pu6/Tu/BFDQu5udQUb+w9ito4cuL7dU3BGL?=
 =?us-ascii?Q?K/5ik6nquiSyq/tpfKVdIqdlx+jrJX46dc7+HlZFHH9WbAGzXlCTWBGJLE5+?=
 =?us-ascii?Q?Wxosn2tAoBsD11YP3v06zGt6bok3KpemUy+jk130irNy+AiXZjzJrqfsMYPA?=
 =?us-ascii?Q?8RP01ZYEAau/e9ifo0e0H/2uGCkDP2ScozcdGtxHJ5GLtW9JG/dmf6e36Pq6?=
 =?us-ascii?Q?cOvKjQHE6jbncLO8EISM2q6Aso0mClve/3ak9pJ7hp/+hQUfOyLrdjSpL51q?=
 =?us-ascii?Q?TyQxdknKETj3EvQGGBpQFnkkxClf?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 11:30:28.6599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c35574-7fdf-4886-fd45-08dcdc8c4aba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204845

On 24 Sep 2024, at 08:57, Aleksandar Nikolic via lists.openembedded.org <al=
eksandar.nikolic010=3Dgmail.com@lists.openembedded.org> wrote:
>    I was thinking since 4.1 (and higher versions) are EOL and since this =
is the kirkstone branch, the buildtools should also reflect the latest avai=
lable release on the kirkstone branch, which is 4.0.21. But I am not really=
 sure what's the right solution here, if someone else could chime in, I'd b=
e thankful.

If these patches are for a stable branch then please make that obvious by p=
utting [kirkstone] in the subject.

Ross=

