Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C0AC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 11:44:44 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.22])
 by mx.groups.io with SMTP id smtpd.web10.46549.1752752676064493349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 04:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tQ2PI2P3;
 spf=pass (domain: est.tech, ip: 52.101.69.22, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnnlZeNLxD15KkOzogDT2o3FQaOuZpddEZYZsuiLstowr9Qr49oITuXNrSNW7H7wjjcOI36i0zV8s8Cn6wgVLDHRbSgrAhefIWMQk+w1Yljd8gW3KKw9ZqtwuGyi9Zd17oZ45D8eR4nZpqq+PJuGqdRJdgHj4znLfZjLLx4l1a4XQjyX6xznl5GQ7OLUr+i5VOZmHa71pJJrdbHaS2jX+JFrvCwEw74fLwu9SMJTlRfPHFx3uGZ7c6ux+rBOgMgL1RiUeh3x19ShjZOucpiqbV9wpuE+WRlbS+y34ulpfBUXQeRMUHfwoTJ3U7RT+z8ZT3VY+I6xb3ABVyQs4CfCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/DSg5i/b6kasib6hZh+TXmIZDxcBKAEIr4rsWAgBIc=;
 b=BU9VVGZqajJhBuzXEgXS/cz8Bz7d8PiE+IhCotayP4Y1j62UVhy46wJgHkwAZRfvSDoGBYEDzrLX/Q3G+SgJwp3L6mv7fLfaZ+54D9zgJZaShK/3I6uP6No7MM84/B6vd5nDJ4eeG/HNxaK6qpMTqHP6v/OyShCLaF1j48KEO1mTITMy+HmdDauRqT4O1gXyh8TqMk4Bt/cu/VcwLls4LlHp6ZoVXwVba9SXCoEA8A3a0LwsKojYt802XMSwG7F4rCrUO0wgsjM9VnnV9kyCXLKP4Trv9pb2DQ7fS/529kV0fzYHawW3bluj9IuZsdOiu0C8binuY6rzG0AF4skATA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/DSg5i/b6kasib6hZh+TXmIZDxcBKAEIr4rsWAgBIc=;
 b=tQ2PI2P3nccdI1GxFDuX5r+jKPaSdShmApUKhIH2VGEgOFP96btbLubV2s7LonAozOzyWTCguACOclyNAZVw6x5LdCLSF+qQbxKPT5nH334NDv5L4tIlT51wWYzAf4iBYIdEUO/vapDihh9oN5rt1EcNv1Nl1DyRh5Cj7AjyLabpCF/XIdLHA5KmF21dT+FZO8IuMn6F+b31fZL6z8QHeWiRS/7MbZjSBg7gtySDXPrUTEBBs9z3WejMtQ3Gp+svaTSKTRipBDTTkhCwRd8v2xLRn4BQCxcQqTseq9G5X+87ST7zs69cnEToPGuSrOE9JgEjTnD0f2j7ptN4ihQXjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by AS8P189MB2093.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:521::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 11:44:31 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07%3]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 11:44:31 +0000
From: roland.kovacs@est.tech
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Roland Kovacs <roland.kovacs@est.tech>
Subject: [scarthgap][PATCH v2 0/1] libxml2: fix CVE-2025-49795
Date: Thu, 17 Jul 2025 13:44:12 +0200
Message-ID: <20250717114412.13075-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0287.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::22) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|AS8P189MB2093:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8c7bec-55dc-4212-28f4-08ddc5274b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cRjQWIsrdZNUZU50YXWOoTKub1pNLuCwiqySwRvDN3B3nqUBq60Yo+/Cc3Us?=
 =?us-ascii?Q?5UpU2DiwN+SovXGuzqhaTCy6//7A4Cq40yIvDDI5vrtQbQQxM1YyJ5nbxujh?=
 =?us-ascii?Q?pOV9eyUWgtNabO+WHFvlD1Q7eQBYhFtBc32vAGRlwLyDckm1URYeywOf4P9n?=
 =?us-ascii?Q?/HwOkABwb2n50/LJoVYxUaN1SYcMmY55vNLXTeqkC8kyMA4QovbkBEqDfbkm?=
 =?us-ascii?Q?SsS9DwshKwpgQ7zOAdnr8QJ6Rly0BJ4T8KBmf0Krql16L5kD+VKOoZPHuAqq?=
 =?us-ascii?Q?hs9JWlUL5pdgopE3Wj2vvGMLhUSZXQLY/NRrY2rD+gYiv1+bQ5JlJEOKSGM1?=
 =?us-ascii?Q?Ag4USILZmx3hsEozZm0BUHzthNB6wxF8CE0Lfb3uF277KPn7DOZFjG7Te80I?=
 =?us-ascii?Q?RmuGB5nUadlC1NFUOgxEn04Bg6pf7gxALk34RWsWVtvMJVLL9esaehIlGND7?=
 =?us-ascii?Q?/QHFjC/RzuawxjV4gO1iWv8ebiISZhkew/oFjo8+z0QsNHl4TyE2tgaQsGEo?=
 =?us-ascii?Q?ADrOa1s5XiBcVt91AS5qXj4+/T5iGlXSnj1OrhXrEyXLZZ0xXhJIFi/Y5JJA?=
 =?us-ascii?Q?OQ+S/+k9dXaYewb62ZOyl0VbzdAXA7GpaxoDTFGm3XoAEEO8wDKsw30P22nd?=
 =?us-ascii?Q?gVu+UPM7VAhBiuwiPSk+4olyUEOWC0QIlW/3yWTIriTAeoxyC6bxkV6virfB?=
 =?us-ascii?Q?muICqremSlHPrDdC7+/0iqJrUwnSgLrlEJNHG+oo2B6pEznGriFTBuBY49CW?=
 =?us-ascii?Q?5vDvY84BveF2qMVfU6choCg/LySCS4sx8o01mHrxb0BCiWbTx9UYJyvMAi8R?=
 =?us-ascii?Q?Js+kgFEyxCx9O+A8JkdYF5EtlLbZY2G6l/LG8I5Yp4K6l1FyMBL+9P3fDcNs?=
 =?us-ascii?Q?tqZnAqcTuhO2yeC9caaaLl5b33i4CnTwW/6nAXktwcneAetMYt+ixqvL/JW4?=
 =?us-ascii?Q?2gP0t8wUJWfvcVAWo+QOkhnSom0CYfuSwueW/cz/6ZLeuIIunYvuLpUp4ec/?=
 =?us-ascii?Q?ajs/CXqph02A+lackMMROOtxz7u8L8rZWS1EblW1ykXje6qCgfmSZbt0EYYa?=
 =?us-ascii?Q?EkkK3xUZANMC4WMLP2hxHoNYtgcDidn2eQ4ueEXS+DY8E9zmwPZDGuSBVIbY?=
 =?us-ascii?Q?Gna4f1q1qFK8GCwYmqVGT2yd2os4RV0rqTOK3U8TU8fo2B0fITEgglHkMJBR?=
 =?us-ascii?Q?t62WF0vVlWLWMC0EDYRpirl18Vj3X0QqwNZWcQLbctstjHFPlKEVkeULasX+?=
 =?us-ascii?Q?UJZc1gKJEqDRxmBmV/4Dk6s5YQfVDmAEcquPAB1MS6O3njHjLkFLyn/yldTK?=
 =?us-ascii?Q?SP7pwJkSOGZEnUDyP/uSv5Zsw/vjLn7LPXHHmZVObiIo0wN5BOHolJy6ax8J?=
 =?us-ascii?Q?j7uUznaqMhVfXGByZQGEBJQ1JFstP0cgygsC2/gl10C59uqxmxPu6hEFVIrf?=
 =?us-ascii?Q?R9JfZAg600Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1hRB8oGMzah3mR6SnnlpIXuECsZ6MLG1YvZKvfA8DD1Eb+DnCS4gTGyORcfJ?=
 =?us-ascii?Q?aAGgdhIS2eRpeiX5x0uPICXKuw1CYFgL78U1xbnFGTq1gcIpv2H3VTasCM82?=
 =?us-ascii?Q?FMXpl1pMI7IyFDuPxD+zUd62ubR0FLor4IflhF1nbSQtSJSxCJ3jjkYBqZeK?=
 =?us-ascii?Q?yqFsjUUjmJzHDo1e+XolNiwP62aNJet9h1xFE5Y8pzxnOPDv0Mv1e7xe7zgh?=
 =?us-ascii?Q?aFaNWmwRF5xkqTwmpYuadtz6kV+fUCr/0ZV+LlPK08CGBStCzwxM1U5j6fTJ?=
 =?us-ascii?Q?A70Y67j3omAT2KFbRdXgkjjsCBODvQIYfd0Hp2bKiiplsZvWNEMkwlliWXga?=
 =?us-ascii?Q?ezYthg0xrpxArMNH9bFUqDjPKHIT7cVQJKCMuPfwS6m/T4eweCUxHbE1nCx2?=
 =?us-ascii?Q?kOzA2dS2sGQ9ybZIjlnNBOaI/uMccFkYwWgewmnrBT4JGyYyypgxbBOl+YJ2?=
 =?us-ascii?Q?2ALx4T4TPgpClEofLtpqVHb9TUnNO8/vCeUNGZKlGFkYjGpCn3UsYGJ5T7O9?=
 =?us-ascii?Q?ErZ7mboRM7tQHVnTUF8Uwy8d64eRNDpx9DGBzp2IOC6AY8tOv0NZEtAX7krn?=
 =?us-ascii?Q?DKo6/VnF1k0Kia5gJnMnKl92ZOoQkxc1AL7nEvsoGvz94kF+xjswSXPHixkn?=
 =?us-ascii?Q?QlZdvaY8LJpZi08aTzLPQhycrhp527DvnvSn07vOPOW+0MR6LOVOAqqGfS4w?=
 =?us-ascii?Q?A+Im9dLkE5JUxooCZnqOl+8TGXs7BQBr1PXWADrRdrol5qcHRa9XhPmaogVP?=
 =?us-ascii?Q?1O2HcBI+MqTQStUUyKrYbW9VXhP+d4okkpBfJhbY67K2cdqcng7HQ8n1Ofdn?=
 =?us-ascii?Q?uYtxJlPN0fdkqu/lFaQNDI4rnvRm7Creuquna1BVHPZmS/3VzkHVn7AJuFia?=
 =?us-ascii?Q?aBafIkxD1HoZltBYuqqyE0S/7IUmRsJtCf9zzAVA/1mdse3G/ClmVBEu84qo?=
 =?us-ascii?Q?0QgrJPWEYCWuzNIIuUnAYaNX7tAgjfuG0KDoVYyEILGBBE+3xxzrSOoPnE3U?=
 =?us-ascii?Q?SROqNjmI0PJw5F8HUsx1npwRi1PNmvVMGhLbo1JKnHLmWQiWuXnokojThFTZ?=
 =?us-ascii?Q?5AaXYV1m7ocB+TdCWp53kxjlNoLl+xUBOSkkae4Vm4ZgJhoQxdlrarNnNjHp?=
 =?us-ascii?Q?dopOqp7AH5zfR1DQRdLBfTzUggJZNE9im8hwoGREhRgEVnqxPcYeaLM2rAGd?=
 =?us-ascii?Q?EPMYjn9VpCfQiUnKyTlEiRIE2ZnWY1+X1tqp0jSt1qw2j+Me+G8F5c25Lufg?=
 =?us-ascii?Q?lClDm0qiDAMXs94tnxjAUOHIBA1rHRbtTd91OqIlZOjU662gu0vtmp+QEfTP?=
 =?us-ascii?Q?GRYBfedrpsHok+G+lZyUxjOumtsKbqCptBVuHftHRU/iieXkfjwe6UCIcp/3?=
 =?us-ascii?Q?Z/lFTK5fjBl+FNwdn+4z73D8uLYwH2GEOzJefztSFhj2fTG9dNahrB2mHoGW?=
 =?us-ascii?Q?q/SCV9wXHVgl3ItTtZWJ4fs5faNCZt51OJanTGx9rpgf0KkDPIE7gnNWVulL?=
 =?us-ascii?Q?II0hhse0zSmAAJMcq3gvZIOiVxGaMIPMCDW+6JN7gak4ZExbL8eIo4J1+j6V?=
 =?us-ascii?Q?BKQAEwMJJQPgkuYNZxEdtBRyV4LTwN7Inb5/OuDw?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8c7bec-55dc-4212-28f4-08ddc5274b51
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 11:44:31.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09wIR6sMukJoMvlZlvQNfvT7jI1vtFDa+T2ElGSSmEQyTqVZSfNVGy4cx+yvdx3TDKG6mvjSwjizq20a8K9w5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 11:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220533

From: Roland Kovacs <roland.kovacs@est.tech>

In v1, the patch included the C implementation of the schematron test
runner; compared to the old test runner - still used in v2.12.10 - the C
implementation expects a different test format. Of course, I did not
update the test cases, causing ptest to fail...

This version skips the C test runner for the schematron and instead
changed the newly added test case to work with the old runner.=20

Roland Kovacs (1):
  libxml2: fix CVE-2025-49795

 .../libxml/libxml2/CVE-2025-49795.patch       | 92 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch

--=20
2.34.1


