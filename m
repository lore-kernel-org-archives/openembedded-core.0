Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5B8C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:12:22 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.88])
 by mx.groups.io with SMTP id smtpd.web10.15136.1672931538723037605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 07:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=zOT1KX8w;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.92.88, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URun8Q19GEyAb5hYDsO0F+GHxmFOSJeAeR7OpP+jJr7/t66GU3bNF2atM2GmmWPslwqbIr+5i/gYzrK9MI5wSetGLLDtzsMCAhfXjqVeU0oU+Ze+AIvfISifXElAaScq3XHKoon4lFZpLeYr0KIrQGZGIUb7DatvAchBV5xkXeMb5N+uDDHQr1rtoMn8lWAwxqEfIUCDFPhTmPll2KNTccI0oOJO+7kpE4cupozaVaYxQsAPUjL9yn5rEIU087BxgW7PCGC6jG9uTkT0Uuk/YUn/TTJkIHMgNvgEB86nybvTVzMkFjhaFCxeJ0ACnHnVhHgKvoU1b2Wd6KFviWQU+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3JfU+qXSDvztiqM+RuUAdVf1Jm+bscIXfB9D2xOJGM=;
 b=JbqhX5jE/51C7V8v+xwjwuRYGlFpb8AcY4O+AHf/0qmN8dHSZwBbLSnzxsC5+bpKREtFHklRjiG12RChIajRE0633BGbd+u5Hz0eDD9XhxcMYdwnEp4yKURO8sFNKD0LrQ+7hW3TDZVwPpzFgrMRQ1eJoFFPuqrZpGKA/csi926S17fI2AvQU+dStmm3f9sSncD87zqI4Tz+5gR8eoCF1JvnLxwnJOCNGnBUr9Z7fnlm3/bXtasWkwBnjNXCi6rlQftcEKOmm3xNhKVFdJYPCuJMfzSBa41cKMsp9wvfveoyYeUyQa5pFT24Cp2tiIvvj9DWc1YObhw7uQYyJrmFqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3JfU+qXSDvztiqM+RuUAdVf1Jm+bscIXfB9D2xOJGM=;
 b=zOT1KX8wOUdq8INtR90rXYFnzgOgMmmfkGX+0Qc3kLJDYR88id2zXgxf7h+aZhNZtci1wURlcAYpA21SB4sMiBg9pbzL0Hw92f3KSCK12EB/hNEXhOEu2svG+BYz9Ll+tJL5w+BS6cILB/sj8zJlLNxNYr16iKs8qkb577SkBtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by MW3PR12MB4443.namprd12.prod.outlook.com (2603:10b6:303:2d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 15:12:15 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752%5]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 15:12:15 +0000
Message-ID: <8554af7b-b111-d5f6-de6d-135c0fbeecb7@amd.com>
Date: Thu, 5 Jan 2023 08:12:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [OE-core][PATCH v2 1/2] kernel-fitimage: Adjust order of dtb/dtbo
 files
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
References: <20230104220902.1530659-1-sandeep.gundlupet-raju@amd.com>
 <6ade9c89-7e12-2f1c-c9d4-0d7beb4f3853@bootlin.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <6ade9c89-7e12-2f1c-c9d4-0d7beb4f3853@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:180::49) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|MW3PR12MB4443:EE_
X-MS-Office365-Filtering-Correlation-Id: 8687fc4a-d818-4314-6911-08daef2f3ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z7iPt/kZJZoeMWBinZQEPumrrJ0N6DDuEFpIVzmtDf2CqzZdsF8p9npaE+3V3Dnugv4aLS3cndteyCe8hlS8hRm3JGfo/Re79F7GbM4Z94+EBEZaIa+2g3o8OP95eiiXU2iksVAKgsyjz3z+QLflT3Lbczi4ww9RmugnzOczlONs7IZIiHVuVEu+VIYCe3hdveCLL9zCIPba6NWl1hhAkQ7TrU2uN+6jIFDbSzmd5ga4Ocn9WAmwSvrqbmoULrKks8avCNbEQutCFUL7FMMQGJaesnmXU7WOSLOoH6d6+9hIVyx0HrAMK4psUjDJYFoUX1ZIQiAU5qtjYGemRRBNVeLAWBTqhvbUtQDdL5qqAiTVCcSX6vQKM3MdpgHSSa/C5a5A/n1hEAD8sJjWNcLFir5KyIyNVFi3o3LzQlRAPQwJ6q5E9Pl+ITnGbBXF6crQ0qkw35LYwwq7zmyzTB3wSY0nTEvCISUXYJyzXSuZ3KKOAZzOHmOUb1QWa7oL7fn8DM6U9i4C9/DYvZvYoh81bwBvoQ50xiiJI+5E03FMcE1eWZmo8Hmkt0tHjrlxuWjg3J1FEFyzvrvMQgNc2zRwDdnbLKtqcyZzBbnb+sw2xMxBCURQpCobvU7YXwkZkuSKG+4s7/5VwwKN/qQgvtnW9ptkZLMnv+lBQr9cGEqkLcMrkapUEpiY2BgveXUxpONF7wT/bJ+WXThs5JLg7/oF0J9hFRHJEKo/6uZbM+RsQEXP2UYl02Cwmm3pXdli5w10
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199015)(186003)(83380400001)(26005)(6512007)(2616005)(31696002)(86362001)(36756003)(38100700002)(54906003)(2906002)(6916009)(31686004)(4326008)(8676002)(66946007)(41300700001)(8936002)(5660300002)(316002)(66476007)(6666004)(478600001)(6486002)(66556008)(53546011)(966005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o3blswViO6O1rjYBTdo7lvdkE5unbqBY0HFAtxDQctS6IqQ0a54wFYzXbuee?=
 =?us-ascii?Q?q+spKj2du0wPps1NRdv+seoDzrWLuvpsiQXCr037BatZQ7cHDyKwPzYYihgA?=
 =?us-ascii?Q?zY/p8HZ4nu8Abk1yvs5K8g4gLdvBZPPtHEuW9u32R7sx4S2rB8olUunmpDdn?=
 =?us-ascii?Q?h68vM6ylDXTR3TpWK0mN8ZQqDtaw8CDxOEy3M/l0bFV9JjDjY3tW33Q3KQr2?=
 =?us-ascii?Q?nOV0ocY6OA4ZDnmuGDzWekRY9oGUGG3Nsl9g5xtB4ZC6MNAd1ZzeLaX17csC?=
 =?us-ascii?Q?rcrtNcD8RYejpQEus+KsBI4sGK8aOiknkPmhLMuiTb0LO7wFQ55jVCzIlBIN?=
 =?us-ascii?Q?GntusNh1Fx5SfxpaEHLtRq6ZcbjyXsLmZ9pwengjNF6D+1xKepCn7J/gw5MT?=
 =?us-ascii?Q?3ctNW7HNzRf4yjP2ptmLC4CakjZRO4002zeC/okGJMQogz5RQdjvXhZOGkYl?=
 =?us-ascii?Q?q3zhZ5GYeH7KOh1ywoqLGHjehVUNwo2CEP1nHuhawxgO8sMRXRmUh7m9ryzV?=
 =?us-ascii?Q?2uh6+IuRQTRLDE06RTkiAdNqpihvH+CHv3d4s9sI6qlk0Rxu7kgO2OUJh8s5?=
 =?us-ascii?Q?+SVdpIq5c0I3uk5NrDvWKEoTWikhOf4isxYTV2CM0WQXHgkcJDzVuVn37EoS?=
 =?us-ascii?Q?1xVhX927vuX6oWM11X9ssxoD8idRpJmXnFgag/LbKWWaawCEAQ5+LO5cFFLl?=
 =?us-ascii?Q?n6akQyQZYC1m2UdRDMe0fMWMabty5jGY9Ve5IHTMbLFdRqjt67QDWLYRCf9t?=
 =?us-ascii?Q?8h+g6qTXHzufvQgb9lXOLX0E5il9bwSdsrsfznr0vn+dZenZV5MD67JVdQof?=
 =?us-ascii?Q?melXTxLFam9ItLtUimII4w2j+nOmU9tun1nMGNMDvEn46OQRBn5YigZ9yH5B?=
 =?us-ascii?Q?eZ4qD8yWdLjf53UF30ZOKnn8QXyia6EeyDne/HrZWh72OrQK8rCnZ+9e2ScP?=
 =?us-ascii?Q?97Ej8PvFahTsE5SX+jQVZrX1MdgxWixEmZLrHwmmG7kfWBC4zZeNNGznb+wj?=
 =?us-ascii?Q?YsJDr3qyYqhVXnUupzct2RzkJtrcij6tQMb88s1fz1mqkQKdfGV+tlnQDSMA?=
 =?us-ascii?Q?8XZOSle6LVMgqDQBWlNys4rjJiogX5KVeEUtV2oF9iWUasxr/1MHGebpVUwX?=
 =?us-ascii?Q?Rs4s8oNl42Xjz+1u6FK7Gtgpf6itGAaUY7YhcjMpAnjid4IS7BgjYfvOOu7Q?=
 =?us-ascii?Q?VA1sX5ZgaupO0OF1d5NNCCOvfkOgRpCO9s5wWa1OJ886Y9uhLVol1tzY2Xt6?=
 =?us-ascii?Q?aUTkY52nDVjyxNNeSem2p4syJx/765ROmTNNhbMJBixjWKiMZVDvnxhLwuAy?=
 =?us-ascii?Q?GtYHlmdAQpD5Y0stwc2hmTTImQXaxEYy6uS2SLd6Lro+rZBtOZfAFRDbRLGP?=
 =?us-ascii?Q?mZ50EYw/WepFYP0S4eX5zSLILqeE0Lg99hc31T28eDa5MlVMqFf+EJYC+rMV?=
 =?us-ascii?Q?bJgAoqka7UMsjru14ujIOOcV+OYSYZdLdHzeUhO6m6m+U0dswQ4TB8Pp9ZYG?=
 =?us-ascii?Q?PDjslPcnvwJuE7vEUe5MuSErcKKV3PHjWPKKDHjeRKbgTp3Est4O4A0gzIu9?=
 =?us-ascii?Q?REHt0V2fQHT6HNsGtymwQxdXIObng1Waphpm+Pli?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8687fc4a-d818-4314-6911-08daef2f3ad7
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 15:12:15.8074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QC2fBkXC/52Cisz4Pl6GIi6lVVHb2hhtDxQPrjVf6k+KUoz1c9hmKMzDqgzM8XXjq0lTAeIq+VALVpz+Lpp6VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4443
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 15:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175539

Hi Michael,

On 1/5/2023 2:12 AM, Michael Opdenacker wrote:
> Hi Sandeep
>
> Am 04.01.23 um 23:09 schrieb Sandeep Gundlupet Raju via
> lists.openembedded.org:
>> The dtb files must be before the dtbo files, otherwise the overlays may
>> not be applied correctly.
> ...
>
> Thanks for the patch updates!
>
> There's a problem with the way your patches are received on the Yocto
> Project mailing lists though. I used to have it too.
>
> If I apply your patch through "git am", the author of the commit will be:
> Sandeep Gundlupet Raju via lists.openembedded.org
> <sandeep.gundlupet-raju=3Damd.com@lists.openembedded.org>
> instead of
> Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>

[Sandeep]: Even I was wondering why I'm receiving multiple copy of patch=20
when I sent, Interesting I didn't face this issue with other mailing list.

MAIL FROM:<sandeep.gundlupet-raju@amd.com>
RCPT TO:<openembedded-core@lists.openembedded.org>
RCPT TO:<bruce.ashfield@gmail.com>
RCPT TO:<mark.hatle@kernel.crashing.org>
RCPT TO:<sandeep.gundlupet-raju@amd.com>
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: openembedded-core@lists.openembedded.org,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bruce.ashfield@gmail.com
Cc: mark.hatle@kernel.crashing.org,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Sandeep Gundlupet Raju <sandeep=
.gundlupet-raju@amd.com>
Subject: [OE-core][PATCH v2 1/2] kernel-fitimage: Adjust order of=20
dtb/dtbo files
Date: Wed,=C2=A0 4 Jan 2023 15:09:01 -0700
Message-Id: <20230104220902.1530659-1-sandeep.gundlupet-raju@amd.com>

> That's because of the configuration of the Yocto Project mailing lists,
> if I understood correctly.
>
> Because of this issue, the maintainer has to manually fix this field
> when accepting your patch. Worse, if he doesn't catch this, that's
> harder to fix afterwards.
>
> You should be able to fix this by running:
> git config --global sendemail.from "sandeep.gundlupet-raju@amd.com"
[Sandeep]: I just checked with ~/.gitconfig and it was still using my=20
xilinx id sandeep.gundlupet-raju@xilinx.com, Now I've fixed it.
>
> This should add a "From" field to the sent patch which "git am" should
> be able to match with your name.
> At least this worked for me. See
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#S=
ending_using_git-send-email
>
> Could you try to send an update (don't hesitate to send a private one to
> me first)?
[Sandeep]: Sure I sent a private one, if everything looks ok then will=20
send it to mailing list.
>
> Thanks in advance
> Michael.
>

