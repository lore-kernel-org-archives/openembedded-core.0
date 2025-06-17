Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741B4C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 07:41:59 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.19])
 by mx.groups.io with SMTP id smtpd.web10.12875.1750146116259760054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 00:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=Ism7s2b+;
 spf=pass (domain: prevas.dk, ip: 52.101.70.19, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqA1k8DYDC7IfybX+j0JCH2lRsNnxhVrQkzoNS/AR8uVj/rsAVFnCgNXmOy/t0C0Z0Unmr+HOy3ccPbWXCNI1A5M1eAhSj7QDusxPlXIuNpJjyx2yfm6nqhVfeErhLuu3INBNn8nEuco9rRaYyFL6UbrxzuwfgKuP8avhVnyO+9Y73u8aNrQygZ0eEMveEurYQxT0z1UdyKz0wLI4h4G839ZZ0SIFTuxqwykRaPooxGr5q8UCNwLtT9nbV02XzXiq2Evq/KWQZlIZoWm4uQc4ho9znJYZC4eynTPlPF2Csz0L0yrd5aBgEUa5BU7kI57Jj6tqTMiotfoSK/lmFE+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ka3KQVg5o8jqnjzDPxlisgPt8FZS6bYJhd+g9FVYMCs=;
 b=DpS1zEBwgFa7bxenpIBe/zFAHkQYqZ5CGpXLUkzNWT0FTMcI7oLL0FP134Dqi15lCj+cabOyAY1rS2k0snl754iluGL7uGE4plypZ4Lflm5qS0Cft2J7Dmh6U2Eh9gufpoTOtw22Z8RHT2bttij3+kRVYTbvRb5re7i/FofdhYQqbT+ZNQIAjVS/dY9JbgWq9+AMmv5cS81jiMbxnbJdnGkpk444CEbJSXYZEy922ujtNkosH0gulD8g8AxLHgow2ghU2LitOywXSJRhWDA9T1rVN8lG1Yo7kzlGSCC/oi+tLIvhyg23U5RoSjWjbTnRCxtRX05mBqQsjOaXgw4JSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka3KQVg5o8jqnjzDPxlisgPt8FZS6bYJhd+g9FVYMCs=;
 b=Ism7s2b+CnsZIN0n3pkE1GzB/xhWqglu0GzpY5nOpa+wU1BJcRNAIGQrogmr8hLbkca3KL20JNFgVvvzozTpWMJ4h2NVIexvvGFoIyMACYOEVZNu4u+2/WDcWIgccoWWtLGRWZS301YG8q47ne7kgLZbIbi5WyiK57Q1uvLewmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by AM0PR10MB3298.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 07:41:51 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%6]) with mapi id 15.20.8769.025; Tue, 17 Jun 2025
 07:41:51 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: "Richard Purdie via lists.openembedded.org"
 <richard.purdie=linuxfoundation.org@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org,
  richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH] sstate.bbclass: apply proper umask when
 fetching from SSTATE_MIRROR
In-Reply-To: <0088740e272e5c9a1181de3f258c7ace3f7f3e17.camel@linuxfoundation.org>
	(Richard Purdie via lists openembedded org's message of "Sun, 15 Jun
	2025 22:17:04 +0100")
References: <20250606093905.2715221-1-ravi@prevas.dk>
	<0088740e272e5c9a1181de3f258c7ace3f7f3e17.camel@linuxfoundation.org>
Date: Tue, 17 Jun 2025 09:41:49 +0200
Message-ID: <87ikkuzuf6.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0070.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::29) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|AM0PR10MB3298:EE_
X-MS-Office365-Filtering-Correlation-Id: 146d3648-6e1c-4177-2bc4-08ddad726c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8FpOPzYZPntPBRDXXE0is2VI3iKtaBPfUh+b6VO5BPPDCZBtHe18aC7ya5Vn?=
 =?us-ascii?Q?INPcWTbpOEOFlLJLzvRU9isIcq5SZE8jqm+j8YqpSpNSwlhUpqNnF1j37BlC?=
 =?us-ascii?Q?BN5IB7zNUQCNnbuywvKiBAYETYX+67yALEw+d7rxwhGFe6hFwErqViUqAxZi?=
 =?us-ascii?Q?aJuf3hBh40gZglr2mbOyPd1esgPO+VIdabTQ6871qKjx0MSV3ZnCj4NjAZ1k?=
 =?us-ascii?Q?db4urbGWhGiPeibuoVVFbe4htUhRjl0kyc13qkTWUI/y0X0KZCpoMpMGyt9F?=
 =?us-ascii?Q?56azyatmItBjixOeQlGchieeWNeXW/PRtk6bgwRUm8zw6sMEq/J6S8ruwNuK?=
 =?us-ascii?Q?CNaJDuCEOcRgU213qgsxWjj9pPQ7ts7qGKw4RJG35riNDLaO/tF8GAyI9CeT?=
 =?us-ascii?Q?eyjJgRW/hjHusiX8sjzVTMbyC5kcu2hZRq1qVhguhV8jvkPybBXywBR+zfYh?=
 =?us-ascii?Q?wGSQOLr53uITy6mDCOpRjwwubsKHIV/ONW2NW21Deb/24+e68J/gi1j9dIiT?=
 =?us-ascii?Q?Qds+HCSZ67iSu9I0kRburmsbCF2Hq/NLl4fSVdyohfQuz9WK4SdZNWPWUuqe?=
 =?us-ascii?Q?Ncr5Xoxvq1Z3PZmMBOO+uQicGigsfsHj6ayDsWgVEuphoNwidOLXWIYt4GUc?=
 =?us-ascii?Q?lLxH/2re3JBpLerSzl3y0/UO+2IIkq4OiCFjP3PCCVVaTVJniBy1697JIgC7?=
 =?us-ascii?Q?XSq5xhVj+XAnLC04VaQChWRFrEFptbEGCvaaL7n7NExcJczixieCIjqQYre3?=
 =?us-ascii?Q?0XgWCroDfTAUX/zLt73z6xXwtgJ0W51jvmDdHUGNgBuacm/+bAdS652yXi0o?=
 =?us-ascii?Q?7JKXfxHI629SeygYdRKVobqWP8lyxdquiD1DMf/J5CZ7LIwsH33c0Y0zkCX5?=
 =?us-ascii?Q?b3AXlmYngslsqZdboIjEUx3rjt3CzwtKnxQ4tfwoGXlyAnCE4ciMMXwTbyQV?=
 =?us-ascii?Q?BmtaJlUc6KL3HJSGRBgDTIX4VYz9RtKCOcabSoLYnuGvCLay9FiohPC28ZrL?=
 =?us-ascii?Q?5YF0Nk/rllauKyN+4ddtdyjrGS9MgGAGRmbtWQjvENcDxdTpOkMod+Zw2GNK?=
 =?us-ascii?Q?KAv3ZEKmUC57JURENKc8R1m/a+H/wOYkXFIvQ6UAjfpQEsmlKPy/6zwe2kai?=
 =?us-ascii?Q?Z1K8Kpf+cduAabu9wIJnqjmkcuhP41d1ekokFZF/MeJY3FX9AoP+QCpAkOcv?=
 =?us-ascii?Q?i3sg2cBOcAUbAPnyuUvzuf76TWBZ4GjwidGBrmCl4oIwKbgFx7ZhZ3gpZfSm?=
 =?us-ascii?Q?jxkl0Tr/tkHAwlNK9oHTtl4yzOpXYFpYcQaOdVzDCnwBJsGg1ka4PDDmsOGl?=
 =?us-ascii?Q?3GPTy1iZy8HrqV5oBNYJAOHDuE3AooBXkwKMAvJUY+XuYY9iGnUHbbdmQJ0j?=
 =?us-ascii?Q?OjQPfajjbGJd+TW8BZoplRcBcMGB9NbeA07bfuGY3k5xY+KED4HpPN0eRCIv?=
 =?us-ascii?Q?yuLPpZFrB1Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qFtGfFKF++4O8eH0MfbzELIKTaDc/kaXdjbPa1WhxErtuwxc7h3h600hXiW0?=
 =?us-ascii?Q?wLA+T4YGHAbpoTIZSI/1lLxKX9/s0gj0m3IMe+vc8YSvO8cYzK0yhTnilrY8?=
 =?us-ascii?Q?JpE1yQRdskd8Kue2TX2u1AE2y03fpxoVgKRZqjib1B1JJ2WjgkErrBa3Okq0?=
 =?us-ascii?Q?F54XIKQMEkCsueX8LY53xjHSXzC61ezvm9Dku5tAfim6AyrwwXoz+hC2UtDk?=
 =?us-ascii?Q?V7eD5bjW7jxnJDg/dycE5pt3JkofhmaWV0IdTZ8UJBDPCkJtPSXyCjyDiARQ?=
 =?us-ascii?Q?RPWIPGVTyroNVxHqb8bUIRI6MyOo+fS6JBnKkcdsfJavTiaTEsUIHcV5kI/b?=
 =?us-ascii?Q?W98HCBGhbqyRcUT8pDUihb5zYwleCgNYYtb0ZmiFWC2Rf5cs+BpIPar7q8dx?=
 =?us-ascii?Q?pre776lnt0edKVgwwuf0XQ8HR5HuVNYer0jmyVsxt6w0Z8Y84SRqkQq2p3Vp?=
 =?us-ascii?Q?wv+uSrbG75vnQgBKPFgfRG6iCVW1Uh4D9QnxW8SvYl4n+DvO2L0K63MDWTit?=
 =?us-ascii?Q?xzJT+vglosvFoHG+2qjL8E1iTE/gzPMzrFWdNDnrjRJ1CtvmoNLltG/jBThP?=
 =?us-ascii?Q?Evf9CUsjJWNRHmjwiLmSW3QxYvCxo9JisQkeXr0ukvLqeODavrQqwOkYeDGj?=
 =?us-ascii?Q?NY/8cR6JKdgLKWaulQQppVCX5lezyDO86k95X5fHLgo1mwo6gQj43jh3PQdN?=
 =?us-ascii?Q?a3O4FIGEMSc9p4Wn0ON9WhNU7dWUThV8IWzLVi6ZWf2BcdeAA3f7lsdnsfID?=
 =?us-ascii?Q?Fb2hYkU7DkZVUp0k3baKCoBowRjOtrs7R+s1etlA8Kx6ztX6TnyJhGbsYP/Z?=
 =?us-ascii?Q?56X7e0u33JhIsmAR+K5cTZ8ToQ27ESagNHx2jDaK+YTYbbGiiqq4AZKPkLn0?=
 =?us-ascii?Q?tKmBbb9eIey8hsow7J/T5m+YW4FEbJg02hjeR4uLexj1uvMumpYYOEwFIGpU?=
 =?us-ascii?Q?QyJ/4xRG9Ec7BkV3lWQhOcbZboYvv3fpYjbOn98OAEd3nWGWyTOFzu+M352S?=
 =?us-ascii?Q?aZlZqhxpWlU2t28fqHpvBwsAxWZ/Y16TPlXHAv2dsF+G8jdSzpgnAOOqm0jD?=
 =?us-ascii?Q?Clnv1a4JjaFOx4H4MZL8mkfaRSPQncjBCf/VQVtiTVSA5Pkcq5uK4tUY+Pmz?=
 =?us-ascii?Q?bpRSwbxIuWvV6+njadOmTWWVglCAFTWPNTjXMF25JpOFRAL5NHlEgv64JQlZ?=
 =?us-ascii?Q?qP64uKGTYqWd7Qk6AnlZXa4PRMnRVipt3lGBgkBy4kvMcXdBpbLk1UvbDj6E?=
 =?us-ascii?Q?Xb1ae6d9DdMaAj11qyFxYwXoBk5u0rD2ZpgzfExeVmn64dJ4sx2o9i/WfvV2?=
 =?us-ascii?Q?ajR/a6rTgypG0QAMBblQ7ZzhLMGzDwKaSGi7eRq/A7ZWkWJVbX7eYIPytTZY?=
 =?us-ascii?Q?h1cagIzjqeAm7zb9YFgElaoWtpyzsKilPJ6oAob6XTT3sTLE/cTYNQm5zDnf?=
 =?us-ascii?Q?gN9kBMHEHbEYOEyZvNpKM7vIVRt5ELhYJ22+91oQC589NFk4FuLJqfS/Hfqh?=
 =?us-ascii?Q?MjNb5GbDn1tBX1PeIq6mRDmSOQmqgOHOtWQ0j3z01D3YHP1WM1bk4MR9X6kc?=
 =?us-ascii?Q?3xQlAQSHJGAZtRv4S72bOxVlbM1rLk7fBuisjIcaVST036MJsn7PzBtu7AyY?=
 =?us-ascii?Q?Vg=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 146d3648-6e1c-4177-2bc4-08ddad726c20
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:41:51.0138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtbCbRfJtSyVd38a6FVzkoyxESsu0g7tNG+YFnL1EmqmRQsuPhnQueUMfa8ttNPBf3V056XzDlNubnebRiv6Dmz1tAP5FYOeIp4MNgpxlXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3298
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 07:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218856

On Sun, Jun 15 2025, "Richard Purdie via lists.openembedded.org" <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:

> On Fri, 2025-06-06 at 11:39 +0200, Rasmus Villemoes wrote:
>> From: Rasmus Villemoes <ravi@prevas.dk>
>> 
>> Currently, files and directories created under ${SSTATE_DIR} when
>> fetching from an sstate mirror are not created with group write,
>> unlike when the sstate artifacts are generated locally. That's
>> inconsistent, and problematic when the local sstate dir is shared
>> among multiple users.
>> 
>> Wrap the fetching in a bb.utils.umask() context manager, and for simplicity
>> move the mkdir of SSTATE_DIR inside that.
>> 

> I appreciate this sounds crazy but this is causing some kind of
> regression being reported in our automated testing. Specifically,
> running:
>
> oe-selftest -r sstatetests.SStateCreation -j 1
>
> fails for me locally with this applied, as it does here in CI:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1767
>
> Worryingly, if I run:
>
> oeselftest -r sstatetests.SStateCreation.test_sstate_creation_distro_specific_pass -j 1
>
> i.e. a specific failing test, that fails even without the patch
> applied, and it shouldn't so there is something odd going on here even
> before the patch.
>
> We're going to have to get to the bottom of this before I can merge the
> patch.

Fair enough.

I'm not sure I can help much, but looking at that test code, something
feels a little fishy:

        # Now we'll walk the tree to check the mode and see if things are incorrect.
        badperms = []
        for root, dirs, files in os.walk(self.sstate_path):
            for directory in dirs:
                if (os.stat(os.path.join(root, directory)).st_mode & 0o777) != 0o775:
                    badperms.append(os.path.join(root, directory))

        # Return to original umask
        os.umask(orig_umask)

        if should_pass:
            self.assertTrue(badperms , msg="Found sstate directories with the wrong permissions: %s (found %s)" % (', '.join(map(str, targets)), str(badperms)))

So badperms is a list of stuff we've found that has ended up with wrong
permissions. But AFAICT, we assert that badperms is 'truish',
i.e. non-empty.

Just guessing: Perhaps the reason that passes on CI is exactly because
it always ends up getting the artifacts from an SSTATE_MIRROR (thus with
"wrong" permissions in the current state of the sstate mirror fetching),
while perhaps you don't when you run it locally, and thus you do see the
failure because your local dirs end up being created with the right 0775
perms, and badperms ends up empty?

While in there, the current_umask() helper seems redundant; just doing

  orig_umask = os.umask(0o022)

would do exactly what one wants.

Rasmus

