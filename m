Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AA7E9E300
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:33:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18057.1770813231051446464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=He46C1F1;
 spf=pass (domain: est.tech, ip: 52.101.83.30, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4rYMuIGW2XQKs5Kby3GgfhMDe1u+e9zYTVzEZO7y5eZcidPLXS5tjzrz4dS3yT6i/jvm+s5DozVYuirzHF9R92yOKgFakuT8HZmlvuCknWmejVp7qISNTyLgusiNSBK1+LNm2coJ3fyt6KGFJvAD1m5WNiiNVoQW6Sl4F3M9e0RI78m1cpbeItFwbiGXRG2pkkTUqamuGo2jFUNSPtrCgWqJTTAwDdJISZUA6xXojVZm0hxTKd1sOEd2W9KtHMKZjIqIVb76pssu3Wnhy9XxVhDdNMRdqrgGf21uKBG7ULJnqERu1euauRrsqFAFuQ7R6kNKyWGcUZuv3UZbScQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vds51jnLRo6lbM+udKob3FTzdldHrS9tX3yfMqjVsGA=;
 b=hHh+sIkC/p9fuO1+rcXA6RxU5JbxirMX+3F9JqavZy+0SXtxjmk4X82ejN2YEwn1iyv49iJfg4HmqZBiWhx31No3TvTJFapQ4RbkHtfmLTKkDvGRNMwM3Pule6hV7OdW9nhuO7LsvApBs3eZczGbcLoc8OUH1wiNb0aYEpFDVLq1IemQvXE3vE2Vmh6Hc3fZ6Mz7MRSOzcXc7KAyAFDzfd4Pzjdj/2EugixgrhcDRmbYk7l5KXkP8hUKi5qiZFikbxU5wdNAL5nFE2UR78xydxpOdx57kYenrdgrpqRn2cDdUawUu3SPuM9FLWqPamwQ4ppus1W+FtjHOUDMb6qmAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vds51jnLRo6lbM+udKob3FTzdldHrS9tX3yfMqjVsGA=;
 b=He46C1F1EZF1djiZKeiCPLNyIehq7notW1tVcHZtby+VHbuzF7BkZp1Qaot/o1tJngj8THU7VG9aa+mMAtcmUIyuuC/DVPKAVbLn+ZqZtLQH94ZqDJWFt/QHRmD4LP542BiLzJOm3pEsbjqavIJ2etnhlEgtkz8mPpT6vZcr3pq3TN7YPz6ucYjBNsly85kxJ/uomcaf4Dhj3OfPisjZntb6g13mMPvm80tyFuqU4Fl9XWeZhBRlAWTLS68B/86Qzez1BHAX56Ad3qlSXWiWKzH96au3meJx2MMkWuaRVu7QbICO9aqb2Xra/8t2H7IG5xUHF4SLVSYYAyNhmuUu4Q==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DB4P189MB2216.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:37b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 12:33:46 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 12:33:46 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v2] libsolv: add ptest support
Thread-Topic: [OE-core][PATCH v2] libsolv: add ptest support
Thread-Index: AQHcmr3zVywSuy+C/kSWvcKXb8pZ7rV9aUUAgAAGb4Y=
Date: Wed, 11 Feb 2026 12:33:46 +0000
Message-ID: 
 <GV2P189MB30051458CAAEAB3070FB16D8FE63A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260202223606.19978-1-pratik.farkase@est.tech>
 <20260210184908.7373-1-pratik.farkase@est.tech>
 <DGC4ED9DGD9G.2PAQXZDB5E8VY@bootlin.com>
In-Reply-To: <DGC4ED9DGD9G.2PAQXZDB5E8VY@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|DB4P189MB2216:EE_
x-ms-office365-filtering-correlation-id: 864bdfb1-a084-4c8d-f5d8-08de6969ccfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?HY7ZKBZjnZxxx2N9k5rN6ZlO+603W6lm0YKDvvdwV+x2nHpGE+ygNdo0LBv7?=
 =?us-ascii?Q?elBdt1/uAb5PecEjjCa1GTa2BDnx0R/iKlSb6uX5tzozJ35e339USyomCvYf?=
 =?us-ascii?Q?s89IeEwILD2srsnXtFwOYBl+hIiPD5CEEVZa5PSFH+GP4EBU214XZIqfa+Hl?=
 =?us-ascii?Q?EVNKAn2ss17EjXuuh1Jfz8yzT7lIHN0lr0sqLw/3+wbqCvgM1OakT+vr6EtA?=
 =?us-ascii?Q?D711SmL4AhDWUpeHGXZ14jAxQADfJhmFXx2V9OY9BEzJu2g4Dh4ZEzXCF0vP?=
 =?us-ascii?Q?YVbNKjYYX4Px1ca0E0eakDp8mYz5B34auGec5tgRBM6dYQl636zlGdwiNNDq?=
 =?us-ascii?Q?3F25+CdGg6Rs3Hi1FPtU6KARsYjIwSyyd5CVLN5FZQlXy0SPsmAwyKXgkVXK?=
 =?us-ascii?Q?IvoSp7fxWM2K+T4s5UiooDf9Tv1a2sSsJ/hQKRQD/LYLCpCHJ//3oXJjcaz+?=
 =?us-ascii?Q?UJhVD1qEDrlg83O8jj7olOj+L5358rG0JG3FJEymyI+lRmXw1lM/JvaJFPv2?=
 =?us-ascii?Q?qwiemTJY3ZLxLMrKaHHcg5xYOlNO3a/K7+1ga1XxhHuDBARpyLSteEtUAVVt?=
 =?us-ascii?Q?YBz+f9lSTvLrXMGGOHUXtwuOyDVv1AeoeW/fI2QabgZXrLR+MAPDJ8PFQrXR?=
 =?us-ascii?Q?bxGujFRsPzg28ul/LwWrlfcU04U20rEqrj4vWdyxCPhbPHP+RqangvdLwBk+?=
 =?us-ascii?Q?sXm/JzYCIa8eFzU65cN5gCRYUlvzuiH7N3S0eUYBiftmYoXM2W8pt/3h41Gw?=
 =?us-ascii?Q?VqHUE8OZHbO6cwPxoL9XXQp7PHH0AvQMCPkweqafuB6WN34lymz5xyi4dOBK?=
 =?us-ascii?Q?ig9XQWS6WRaHsM4/eD0eQdEhp2ZbIw2EKQvl6+u6RBPpiWQU7gxeUoJ2m9Cs?=
 =?us-ascii?Q?WYPQIDT/pckvy4CxhEo7h+WweQnio1uJCKajCtfAhKYy9gRabEoNoYxX2omD?=
 =?us-ascii?Q?qCfGA9cofVqFTBkYClFpwafmqAarErUelnpc+iuV+cOY/CkGFf/PimdNgPym?=
 =?us-ascii?Q?RONoVAnx/wuDffg0zzIZHR2KtlgeGoJqEKkGZIHv2KtzLotjf+obOvxD57C8?=
 =?us-ascii?Q?b3/2FpBHe3DX0pk+OYhkc+FDY/XIalyccBsQv8X+ckbJ6eOwqRVs/hoK4aqf?=
 =?us-ascii?Q?Iw8SWBnJOqWyps3gfq5UiE/R3yZKSk1oonkSWjATX6JQVLX46oIjR0LgleGI?=
 =?us-ascii?Q?neCpIzQ8uKIp7sW9xGYfmLHAGwwDtjLv4s6f3k5EkbbJ8NHSJZrRWMQ44sZ8?=
 =?us-ascii?Q?t6MhVCJ53lE9VTk7gGhLwS67+SFeBvk2JFAikiib7VP7EneLLhcnlABfu9NQ?=
 =?us-ascii?Q?s25YksMDfqNTxA5jLuAkEViC2QuwS3gDJuK+7WrM0THgKNx9itNqxqfo/2jY?=
 =?us-ascii?Q?kQOgKtS5owbuxp75VCwDGEpAQUQqVdatWBppQYxrfy24f6gvUrUWG8ZYK8Vc?=
 =?us-ascii?Q?04j+Xv0f5UggIv7zj+hAZXx0MHrxPkQ3D/V4QXaCUPoSHHLq0hTuyLPRN29h?=
 =?us-ascii?Q?2Qb2bMJTylgXKYcsKbsG9Fy+SPBmQ6ZvzqpmpnRBti8NE5it6ScL2h0JXkiB?=
 =?us-ascii?Q?6it5IwKj6R0I8b9+n3M=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KdFyfFU6+h8mM6c6JLrda+77jsnVbdxiSwKRqs06cCCiqkvA2M26rCjqIJu5?=
 =?us-ascii?Q?QUT5Cy+P9/9jJGe6iTXIy5K1sO0lqR8l03fv/GQIs+tQc8b7z3kW49cUPyGA?=
 =?us-ascii?Q?dBZYt9UEtVwfKTuXqqetpcRpTJj2WL3REdCIgr2PGXJCUwcNEZ/k5obEThfv?=
 =?us-ascii?Q?KvTGZG4R81O7EQi7Kpy/VPFPnLqO+DZfADldK9gYYnUWMsgqzlVbjDHoTidX?=
 =?us-ascii?Q?5tpL4iE/4IJyAaI3TEiO4viaiSOmfOYVN/HE9O1z0d50papUb/coEvqLLP8U?=
 =?us-ascii?Q?MmBbvzHGM/9RUMtvdDBvU49uM+r3wXKQer5/Feq6ID/+tbgHd/uujSFP3M9q?=
 =?us-ascii?Q?RiR2jd8I+LF2H97nBrH88CKxjHLJ9MtqbuSzKwTwygIsBtfqFT71W2zNkmqw?=
 =?us-ascii?Q?r2up6uaJrNY2yG7u1r/sSVHofbMXoWsXLHo9+mgoFVT4xGfqmgRVtofgjb0a?=
 =?us-ascii?Q?BZNrS2WOhCacTrV8ZWVRYzjsIrielh4QQyTh2ckWSiNETYbCuqzUt9O3QvsY?=
 =?us-ascii?Q?v1k16NQrmQyaSTL9XnmAaJNVvgF1YnjVp3dNclA07YMjb8S8uBz/bmfS9nZe?=
 =?us-ascii?Q?NmMejlbXe33YsIGwP9gncRjzVame7JfXrea5lWPnVQo6WpFSTsugW2P+JnaP?=
 =?us-ascii?Q?Uu73qmzLJNn8GfQh5qmKSDFwxVg4nsvjxzVbkybbGkirjQHk0Ba5EL9KL8aZ?=
 =?us-ascii?Q?fLTZYdtnA2ID4ooXjUwTrr/pez8KVSj4plwsWPM2xFzKYIUEjInstGNxrc/2?=
 =?us-ascii?Q?kHiJseQjpkPeF7Ed1DfKVpPnV5821bODnbGztE5csRvwj4v3//z/xV3KMfHE?=
 =?us-ascii?Q?mBxX3vPpenCBT9L/wAxarOGm0uVohvOHSut5OQ4W/oyPhqqP0EC1GWYTykB3?=
 =?us-ascii?Q?oia9IIkH6KzPMI/JYgZkLBb2Xx9/MS14j/0URPkaN7BIiybMgzcFapH8xoS9?=
 =?us-ascii?Q?eAEO8wfG0hDYSIWJRSGjXF2+oCKBQN10AqkNk6ud1S4d3zVawH71iKk3EPC7?=
 =?us-ascii?Q?+lxVmfprpNXkcJG90vePhvc+9dYD1Jyvkx28jEj9y52ZUd430jnNm/0KBNlg?=
 =?us-ascii?Q?q2kff/fWS/yRwMAa6474+b6sRa0GEt4svNhWQ1Q/52WhxUp/zkDZt8FS0fF3?=
 =?us-ascii?Q?13X8SLJA6LjntgOv+cKrcXcKcruL/aEL4iJu0jKuOhVDEL0PdKQNd2OtRa+W?=
 =?us-ascii?Q?l9nECDcWv8+S7kqxVoRVxSe4EuQU9sXOfr7rjJzW+dJb4WMOf5tCvZ4U8y/J?=
 =?us-ascii?Q?WB7IXxF3JZ4OJkEsAUEhPfBIhlHMTe/7Mn22EYuZQg78i7sYcCiYUR1TukEF?=
 =?us-ascii?Q?Tg5QTgUJ0nBzHt2zqfeByQ4vgnRIsTeTkz6skqqZ7bL/QFRcHZnLHxyLvwpm?=
 =?us-ascii?Q?XUkAURQmJ9Kv+Tjl8skEYa0d6mw8VKHA7V4jmw9H+xYHJckJbu5REap+ae38?=
 =?us-ascii?Q?0CTGK1YvJlR6tqBPreA06+h43t/epAU3To955tBY+6/ssVllQN/T9rPKL6ng?=
 =?us-ascii?Q?zDd7sY4CggHqenBZMMK6POdBFIqKDKZXuhHgmU6KHEnlb2a6MYZa0hngsqoh?=
 =?us-ascii?Q?YAnQqJe2jdrgGh6R/7KT+dLyge/mf09By8L8OxzvDSYNKJH95G/AwTeO/vZD?=
 =?us-ascii?Q?eYlqDP+Iy6MQss0BJ2lDG/Ze/bRl/wAg3kizptHIUwANjWIOMAyNujPvCTIh?=
 =?us-ascii?Q?xvyLmXLB5zmnGsyOj57Uus6FV6s1TiLFOsDFGKHryYECzhvkZGDDaFsrsDf8?=
 =?us-ascii?Q?0XlTNaNTag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 864bdfb1-a084-4c8d-f5d8-08de6969ccfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 12:33:46.4197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cBodiwZbzjBKtA1iz7b+Rjxl7DxpOp0RIf0hnisXq49uquR+ck6gGQmqm0DpS2+ztvUnY5YzFIrhxQJXIsrEgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2216
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 12:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230986

Hi Mathieu,

Sent a new commit here : https://lists.openembedded.org/g/openembedded-core=
/message/230983

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, February 11, 2026 1:10 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v2] libsolv: add ptest support

On Tue Feb 10, 2026 at 7:49 PM CET, Pratik Farkase wrote:
> Add ptest support to enable automated testing of libsolv
> using ptest-runner.
>
> The implementation uses upstream's test infrastructure:
> testsolv binary, runtestcases.sh script, and testcase data.
> The test suite runs 28 test categories covering solver
> functionality, package dependencies, and repository handling.
>

Hi Pratik,

Thanks for the new version, as Ross said, the previous one got merged.

Still your changes are valuable.Can you send them as another commit on
top on the current master branch?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


