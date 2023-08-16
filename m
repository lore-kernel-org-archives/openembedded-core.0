Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41339C25B5E
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 20:09:51 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.119])
 by mx.groups.io with SMTP id smtpd.web11.170819.1692216585364087245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 13:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=hW4AHWy2;
 spf=pass (domain: ni.com, ip: 40.107.92.119, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLjpKG7XM54BdzGFHPuAXBWR+LhvS0BMBDM96HcuAXDk+dntldSewVc23gYAZVcvZ0IJSKbsHn2ptPi+IP9AfK3iS2VWcpuvYxbuI6Cr3MVJASmO0HDV/p1KXL9do5oNFhzR60UaZ6kbtX/KIVGF4hINM12aeo96DkNr0NZYiaMnl80AcdeSXILJtRirwc38o362IxAGnCH9VSr5ohbTtEZ7XR2dKtjh0NEfZZeTo8+dbGYWEPWo2tRyqx+aMLbb9IaYr1q6Rv8fSxM8dUW/1ogaBtA9IP9V5NyCCCC9xv+uvpzXp1PGcIybGHhkvGQfKeJMmF7X2WvXCl+bObwGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lBo9F5B1ob2yQpgGUu+Tr+m+i6RvGFoPAuDS8KyMKU=;
 b=aFXTZ8+VrSP7t8WjqH8eRC9PHI7RZytPcjOrPoWOTIF6jeXg0nQ4NU2l/h4XIR3IExYg0KmVE7pKIOKtrYkwv+wsfV19a+hkL37qHU4iT2bcg+CoA+gVnzXDnZxCSi1SwAydOdMdEDA5ZxJGE91Ds4SS5NrWWqijAm7dnPG+2YikprACAI6hKbAzLEk1yukNuE4p649OLjgsFEVUvRCxfQkjkNaJ/N6xdjSU+11qxvKCnJzkS8azN3ns3TEoSGrHusgpjT5lUNgK+vpnaOO6Sho/u74dpf/jA9bR51eLjLLtsS6BKacwm4VRZMQoHKDLURNouOa4BhvL20d8HoE09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lBo9F5B1ob2yQpgGUu+Tr+m+i6RvGFoPAuDS8KyMKU=;
 b=hW4AHWy2Ep/F9m1itTOrqhuEl4qvabcvmm2PplW8f+Z+JD6TvZMtxE21Dj2fFaKzMWKLKW9g34x9QkDmxA2zV/NKuPrRM0IsQ9VXr6ffj7qnb1RGbipdXANAghysq1OFstZFofBI0cs4ZTHGsTCF/TI/Rmo40bj5gpeVtwHmQ1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by MN2PR04MB6400.namprd04.prod.outlook.com (2603:10b6:208:1a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 20:09:41 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 20:09:41 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH v2 0/7] Add new packagefeed recipe class
Date: Wed, 16 Aug 2023 15:08:30 -0500
Message-ID: <20230816200931.2577181-1-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DM6PR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:5:120::15) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|MN2PR04MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: b72f8199-5fa1-4a77-e8fa-08db9e94ba07
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PlCHWBff6PbYVt/vkbnzmtAzDJsPg6nznU5S+R1c+sFLR2ksdTmqBVPKLErEbqhOkAJm5YjQ18xTBlJx7qYB9cshk3fSRf6GTea5wRAm1lLtyfWRBWQ6FTMNuqzYRZV0sP3dTiERlFgSUhcX/NyxiXZSz6t6fYuIkxz2m2dGAD6HMVI9f0tqd9Rm3cqJzGh57qoPh9nHP8xHzIQ1t23zG1sAmej+tl92FtwT5baS38AxA5J7lhsdcMCiYzZyxKYAv9E10eTBw/C45BT0RmIrab0a9M/6IYIfUs/QZ91W/1XNz7jqsP2xNKCYtpo8WAorKL0/OAmiQ5h8vQkzToryNTiQLjx4geMDpm54wPGugG78rxIMSXbaYYDjkDfLEyLtH+vOtqEZYt3xwWjsqFHC8PFNV1QCIRRya/q+fcdkh1axNQRYIyHyZb3oJXaQ9S1rlHohkaKYJ+JJop+8ullfMSlIO36v08qIbSgP6wfGQ716Yyc17fTqy2jgaPo8DXsq7OzVzA+TiGl1b891BJKeGTtbHkZD0Wtv/UlWAgFdscVXb9k7O47C/49SXVWSJ0Tg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(316002)(6916009)(66946007)(66556008)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(6506007)(36756003)(6666004)(1076003)(2616005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kcoUTx7qtaHbwRHi/93MpF8acRMksxYs/pEX+wd3kCFTXsHEJjlgFl/HSJR7?=
 =?us-ascii?Q?3OoP72NrieE3HHbn9bcfI3AePl68nM8wK33jLfreUBXXw18MEwvLaPBtRiqB?=
 =?us-ascii?Q?1n4op/VZpNYtfbPAkCCJnS16CGw35x1aMllrpFApoo6BgsTY/I9wlv7za9/c?=
 =?us-ascii?Q?O3ulrA1LXX3T6UsyDTMQTZW+C9tBhpBiRKCp5X7AGkQQwv9/wLAqpSaqalRp?=
 =?us-ascii?Q?0nmubVl8AOAF1GPwk8QEFrHk/g66538yLYPv1fwfYNjnIZD1e7ri7Bw8fTZW?=
 =?us-ascii?Q?vuXln/DR8CSfujXTvMCiLLQmtVt/9pCxUn2rJ8jLbOyOh9BAjsYAg6FUscgf?=
 =?us-ascii?Q?nwaz8HQj+JCmr9J95qbn08oe3nr85UuQK39gM9GVVwet6vyw1PCsyzHq3Gx5?=
 =?us-ascii?Q?YkEoe2Z0+OSNs+1M2ihcFgL/7ALTr6XKzS6vh9EA+Wq27xceCSarpXlUqkbO?=
 =?us-ascii?Q?51XE6faPjZiTSNI2FNHXCz3sajh+H9nxnyxUpn2059fzD3QNHlf2eXSLSbWx?=
 =?us-ascii?Q?IDRUqKmF8HTUtJloQuB4DM/sanHtEWC+nM+jWB6c3lZBXiHn+zTLub8YJYV+?=
 =?us-ascii?Q?ZSfVtBt0FZeGVBs7mfHifeekZ2am79byllmrzufE8yNJIWKuuQ5D82lhGXxO?=
 =?us-ascii?Q?PVaaH2F/1IhYQirVz/HVNJfDZiuus23745RZHwuZ1LtTw2gs9QLP8wsPdYio?=
 =?us-ascii?Q?87yS7x6B8VP0rsfeEc9VFdgh+/gbnqAexXOutdx0WIK0a6WevvlTAQQWR4nl?=
 =?us-ascii?Q?li7/Komr627U64GUeyMhos4Q1ZpOczDuoIqOdc3yd/1hq6m3lc4dgDogqoGD?=
 =?us-ascii?Q?+4T6aKcRc6RXyLsWJU3xMHG9Bk0VpmXHvyJ9N+4LOGCEqPgpehAVnz33yrXa?=
 =?us-ascii?Q?gHDCTsLWX9Q+rW3nTCsrlXGX2aRhVh/RaG03VXqVMBpo2+PNU9yKwRZCx9Xt?=
 =?us-ascii?Q?6qA3DiYiI5HrOPdpxeNyk4XFXzBPdSrf7L6yxKJ7ArFGftAdCxXTtmdWh4Mf?=
 =?us-ascii?Q?L4yZlYVf3XAjoegYI2o43ARKcCcet8rML3CbdC95n/gzIHb70fM7OOFb1K9q?=
 =?us-ascii?Q?659SWuzRKIz+ZmwFqiCCcgi7IChCiwOISkQRhz2igVmX5NOPXW7LMWalGWyD?=
 =?us-ascii?Q?XFB+szalTQsDAgYR5BT1S7Js8xUNGRJlAWLhzjcl2x9gxJwofD+G7t8FSqny?=
 =?us-ascii?Q?jeGpABw7g/3i6EJvk7AsVGl67OYSBgGtju97rEHdrZGvUqi9hA7fh0QQ/RLV?=
 =?us-ascii?Q?6pZ2+zfzJ05dnEvUvhuUFbnZpXL9qIEz6lY3rHMpAZUmWhS6EB1bBw2jtv4c?=
 =?us-ascii?Q?z0H+e36pQahVykGM/bxS02sFAfVCYEv7/5jCKTBX9SehxD59m5Hjgad/z8C9?=
 =?us-ascii?Q?ICjqEhAQb//u3mmux9/QcQwgzA8zg9rG6kRGVkPveohMKuVuw8uiFiCHKT0o?=
 =?us-ascii?Q?f/hxCCWDdQw+J+wirH3fIAFgSkqm4o0Xx6rGMpY6RqUCUbPZvMvdPLIeI1c6?=
 =?us-ascii?Q?ol0MNTcsWvyQiTzZlvIEqGbxDfvKd+0O7z14eApRN/Nqxn78FvDoPwt5xbCK?=
 =?us-ascii?Q?emNaCTmwqRTd6N6Skx+LB6VpFdKoJ2QQ9pY8TEWKylwTQUvO3TyiRhgFl3ms?=
 =?us-ascii?Q?iQ=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b72f8199-5fa1-4a77-e8fa-08db9e94ba07
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:09:41.7615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGwAP8P32xkelXl+yYG0d6MYabnkqJ/xEcP3lSjikWWvJ1lt2pS1ZtFYsR+LLyTYkHpmxH7vd4TIkqQBPyvZFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6400
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 20:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186143

Currently, the only way to build a feed natively in OE is to build all the =
desired packages and then manually run bitbake package-index. This approach=
 has a few drawbacks:
- The index creation methods ONLY work on the package deploy directory. If =
there are packages that are not meant to be in the feed in the deploy direc=
tory, they will be included in the package index. Also, multiple feeds cann=
ot be built in one command due to this limitation.
- If a package feed depends on another package feed being side-by-side to i=
t (that is, if packages in Feed A depend on packages in Feed B and users of=
 Feed B are required to use Feed A) a user would have to manually remove du=
plicate packages from the deploy directory before making Feed B's index.

To address this, this patch set creates a new packagefeed.bbclass that enab=
les the creation of feeds in a new deploy directory location for feeds. The=
 patch set updates existing logic in the package_manager class that was pre=
viously used to create a temporary feed when building a rootfs. That logic =
is then used to create a feed and exclude any packages which might be inclu=
ded in any provided side-by-side feeds.=20

Note that currently the class does not make use of sstate. Since the indivi=
dual packages are cached, there did not seem to be anything to be gained fr=
om the extra effort required to cache the feed. Caching the whole feed was =
not space efficient, and reworking package index creation to be compatible =
with caching didn't seem worth the effort given that operation is fairly in=
expensive.

I've tested this in oe-core by creating a few sample recipes and running wi=
th each combination of the PACKAGE_CLASSES variable. The testimage cases fo=
r dnf were also updated to use the new packagefeed creation mechanism and s=
everal images were run with testimage to confirm proper behavior.

Changes since v1:
- Added example of implementation to bbclass comments.
- Updated testimage to use do_packagefeed for dnf tests and ran testimage o=
n several images with and without dnf tests.

Changes since RFC v2:=20
- maps used to look up configurations for each package class have been upda=
ted to use nested dicts to clarify what each item is.
- DEPLOY_DIR_FEED_<pkg type> definitions now include the ${PN} in the paths=
 instead of relying on adding it in the bbclass.

Regards,
Charlie Johnston



