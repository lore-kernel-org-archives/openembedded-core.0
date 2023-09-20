Return-Path: <stephan.wurm@a-eberle.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E7ACE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 05:58:50 +0000 (UTC)
Received: from mx-relay100-hz2.antispameurope.com (mx-relay100-hz2.antispameurope.com [94.100.136.201])
 by mx.groups.io with SMTP id smtpd.web10.30688.1695189525149949494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 22:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-aeberlede-onmicrosoft-com._domainkey.aeberlede.onmicrosoft.com on 127.0.0.1:53: no such host" header.i=@aeberlede.onmicrosoft.com header.s=selector1-aeberlede-onmicrosoft-com header.b=k9UWEixL;
 spf=pass (domain: a-eberle.de, ip: 94.100.136.201, mailfrom: prvs=0620f471bb=stephan.wurm@a-eberle.de)
Received: from mail-db5eur02lp2104.outbound.protection.outlook.com ([104.47.11.104]) by mx-relay100-hz2.antispameurope.com;
 Wed, 20 Sep 2023 07:58:42 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/0g4oGExurV75KIBwCuNJPWBETqrISymoi3fB+S32g56KO/9haj+OEyPMSHBSKgrhJpMjsZ9+YsnSVasQOcWGK+hbsIKmQRJr8QXJQqJIpdoKDqnTzGNUdj0De6tQqb+j1rfiDH596gCdKL6nObNyCz7qDBc40JQTI6RzVICzFIVnyhHBcc1bXLGoYH9QGwaPV4je5/Nowp4L+Vlddnf1dj7TJ4C6mqp8n1XuYwxvHwpjWM3YLrXdXorNZXXM24PvvXPjQwVrydtVRTOqtBXcRa883fWsz78Zdoi3CDGf0S8ULZABAGuPj8jkewSVFWuLMucAgMLBC1oVFyTMXjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kFGDSMCY9AV3cgssXBbw5VCSaHZxRMdl9ViXj4B/cw=;
 b=mTYqCcKvfyEwP7UD5Noj4h9KUVadC5/tugwTxfPDZicWyxSHI2rl/90cRFpxpDlL72epxo2jKuXAD79qO4QUkdlacFM44ETLg01ZImyW5DPk+5BURDYrO/lP/ZzIRYv8Oa5lS9ESY5BBNT0sbgzAirqsZtTJM+4lt0TLlgZJlAj6dCzoohl1C+gvPY7tOCai8UuoHx076MqLa8vubIULhD+6Gmxqq9e5pxMnJUzb234RAO3fi3+S4/MfCABGWCLGRhBa+OOdzJJy+9cG4Ho1lQh23ujZ5QmBck6dCjM30LaJD5MYMPXEaxn8bHc7XOU6BVZVSBZ4m5GtHRANG2sGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=a-eberle.de; dmarc=pass action=none header.from=a-eberle.de;
 dkim=pass header.d=a-eberle.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aeberlede.onmicrosoft.com; s=selector1-aeberlede-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kFGDSMCY9AV3cgssXBbw5VCSaHZxRMdl9ViXj4B/cw=;
 b=k9UWEixLXuisujQhyPOsMc8r3AUWBeIg0/vWURvQlNTwDmQUvrb80/4VamsqV/sYfzEIOtGmcuuE2m5kXz34kc+X+tMnWj7YTZJ+6vaMh+FlduuqTbG82DdKWzkNOFUvF29OOiCVQAratXe7M2CQUaOmEgOXJBla+9uGTZq3/d0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=a-eberle.de;
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:424::5)
 by GVXPR10MB5861.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:69::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 05:58:26 +0000
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b756:521a:4e29:ebac]) by DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b756:521a:4e29:ebac%3]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 05:58:26 +0000
From: Stephan Wurm <stephan.wurm@a-eberle.de>
Subject: [PATCH v2 0/2] python3-jsonschema: Fix rfc3339 validation
 dependencies in #kirkstone
Date: Wed, 20 Sep 2023 07:58:18 +0200
Message-Id: <20230920-fix-python3-jsonschema-deps-v2-0-7c58f77c19d4@a-eberle.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqJCmUC/zWOQQ6CMBBFr0K6dghtUcGV9zAsCgy2BlrSAZQQ7
 u5I4vL9xXt/E4TRIYlbsomIiyMXPIM6JaKxxj8RXMssVKZ0VsozdO4D4zrZ4DW8KHhqLA4GWhw
 JclnKQuW56bQUbKgNIdTR+Mayw899z+MYkR1H8lExW0dTiOvxYJG/9R/TMs8KXabqemFzBhJow
 pFfpe85DncDWGPsMW1RVPu+fwFTX8xOzAAAAA==
To: openembedded-core@lists.openembedded.org, 
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Stephan Wurm <stephan.wurm@a-eberle.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695189504; l=1223;
 i=stephan.wurm@a-eberle.de; s=20230317; h=from:subject:message-id;
 bh=FgPQXGlnecHiWBeAazWKY+zUMvvxByz7kCy7nW34tmk=;
 b=thpYSa6YOF2ZXCAaypHKMZkzkKrR4Scv4K0PRwVrYVu5V+9DbV4ZExa5AZTSafMkVKA5AAPgY
 KhXjkcwf1lbCvce+0BUic+FpiHbroXs69/M7f1uESOl2XAwuEQq/SWZ
X-Developer-Key: i=stephan.wurm@a-eberle.de; a=ed25519;
 pk=4W7OL09LxOkN/pLfarMpGFwTa1iy/s2+DvRJOl3RQG8=
X-ClientProxiedBy: FR4P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::16) To DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:424::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB7436:EE_|GVXPR10MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: fccbe431-c84e-4290-4733-08dbb99e9b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iEGNa+qIccO9wNOWxyfgL1Hcne2+4SXBP6/aTRSHV17nMRRaUFz3/7Ys+cpo1abI7Lq6nSkgMNoopaGXfD3z6vgUqX8cUWQpIq2AL6KTumTEu0O0ZtUikIMMbf2DNfehx5TEOYYHyBRKp+Jx8DYKLCJOSxdrzfn2kEo9eOXYsz4FYMqQLly/SOHmtkx8fwfjKQsOQHiNZmOw31nA1LnXm2RuMdxcLdoYZ6zfM8Jf1RIM15BvjaucXTuq4Kiga//EsuQ/hOgyB5voLGSzt+6rnRo2Q1ZmA035PT85YNznxABOPy4O24D3KC2aetv3/ED5djHtmHuXAAXkWOyQ9iLEl/MpOH6FiTmMG2KX307ex7tplNjfkINsDq02R38D8bo+i2W+Rr8dqdm5GfBm1gSdbH8EOPSreqgVjdMbK82q4sKuWpbBTezyKBBkAP+V/8TqUK7R9E29K2ewuYjEkdLnKX7kVbGEniawnCieSY0Tyb1uSOcOjM++qfv2GbPXs1TAWoyq48ieLweGo6DmmDWzBg/Vm45Lx3rOhKY57C4Pn0M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39840400004)(346002)(366004)(396003)(1800799009)(186009)(451199024)(107886003)(2616005)(44832011)(5660300002)(8936002)(8676002)(4326008)(6506007)(6486002)(6512007)(83380400001)(478600001)(6666004)(966005)(316002)(6916009)(66946007)(41300700001)(66556008)(66476007)(86362001)(36756003)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?anVpaXBrY3FDSC92K0RGMzlqM2xWUWNaaEliUy9ncW8wR2NMZGNkc0E2K3Ix?=
 =?utf-8?B?VjlzaDVFOTNHaTlYSExaM1NwdVhiS2pTSWp6Q28xY0NVaVBzQmxITGxFT0ll?=
 =?utf-8?B?SWJFL2xXRTEwSEE3OXVPZEhVc3RRNy9QdkhMY3lpR1ltdFhSbDdtVjEzR3dW?=
 =?utf-8?B?c0FVaFYwSEhXUWFyUkVkZE1WbjdaK3ozRWp4T0hsVFMzQnB6bEREV3h6WmJK?=
 =?utf-8?B?Nlk1L0FTSnQ5c1RnaTd1QlEvdmE1TVp0R3dhYWtJUXZuYnArN1hpR00yN3JR?=
 =?utf-8?B?bzNKdjNvY2t2N3Flb0lWNHh6VGR1WkZ3aXlGNTd0YzNZbWJLQWh6bGNDK1RE?=
 =?utf-8?B?eThqOVRhd3cvYVIvbTZkZS91WXlNQVgra1huNWdOTmVoZ0JzOXprWitxMDBR?=
 =?utf-8?B?Q3RhditTZWI1S2xTWXBGWWZ5WWVkeDlHYlQzekRlQWUrQzloalAzN1MwVFpj?=
 =?utf-8?B?VWRQbENma3lkTU9pMWV2ZFpTN0o1aE0rcWZQaU5VY3JGT1JDemlqNTk5L2Rk?=
 =?utf-8?B?ZWJ6UXkwQThHOWpTdStUMDlJdGRvdFF2UDZqcTVPYjhScythRHdnMi91d2s5?=
 =?utf-8?B?WXNSc2FDaENKdmxPM0gzMEEzM1JCckh6d2dhaDM4RkN6a2VzSFkvODBxUWZI?=
 =?utf-8?B?T0lnN29KR2lhY0s5TzNIUVc4UUlGNjFtVnlWcEpvTDJtelBRbEQ2RjV6MDN0?=
 =?utf-8?B?THhodmdtaVpzM2VObjZWemw2dFBYa09RWFZjZ2VET2sraXhJUzV3U3BvSUJV?=
 =?utf-8?B?dDh3NWhjNWM2TjUzbldTMnJLa0ttSWtaRndDeVNwdFkwbFhVZi9HYWxVRTVL?=
 =?utf-8?B?SFdCM0o5OVAyTnh6M3dZTEl6NDVKVXB6QkhMMFZlRnIwaFRLVEgzTWdHVlJB?=
 =?utf-8?B?T1hscGN3TC9UVHJZMm5TZ00xUnZzU0xkVFpNaE9vSW9ESzlIR2h3RVFhanhF?=
 =?utf-8?B?aXFlM0hVT0pRcTlZcW5aSVZHaGp0Vm44S2ZUaWhsZWh0S0FtU1lOKzZEdkp2?=
 =?utf-8?B?VUZheDQxOWRISnhYZExaVlcrT1JlNW9ENUgvSU4xblpSWkVnazd6d2FVeFVp?=
 =?utf-8?B?WDFlY09hZDBNd1licmdXOFFJRVBnMEdQOEIwNGZ6MWljb2hNYW9Ib3Y2TU0y?=
 =?utf-8?B?WjUzOFZjZ3pueTNyUzJyOVFudWJhekF6RWw0QmFVMmE5aXA5OW4rMUJUVG5M?=
 =?utf-8?B?SXIxUTVjLzk0Rlo4bnRJbEFXUVRkN3FEZjQvbllFay9iUXc4K0w3Vzdnb2FE?=
 =?utf-8?B?M3BHYUk3dEg5UVBPZjF2b1dyWFBmQ3F1SStUeEtHS2lCZkRUUkpoOWxHQ3BO?=
 =?utf-8?B?QzdZbC9nWldTOFp2MTVENGRVcFFZdUtlYy9mSzB0Q3JVdVVoanBHSnFva2Z3?=
 =?utf-8?B?VzdQM1kzUy9NZ1dXRkNXZ1ovOUJtb0o5YlM2WkdXc1lKZ3JEb0ZTcnB5NW95?=
 =?utf-8?B?QXg4VitIZmltaTRHMG8vZXBmcHArajJRVEMyaDZLR0tDZ2JBdTAvY0huTGtN?=
 =?utf-8?B?MTdUSVRtWnF1Z2JnbEpvUnRRRmtxRWFZaWt5bzVUU29WeWVGenpuYWRqZEhR?=
 =?utf-8?B?VFV1YS9mVndOQzB1bFNYZ21ibXdsb2xTeHVHQk4vd0tXVXlPVStZRFJNUEFK?=
 =?utf-8?B?YWZORVJkQkdXR09Gd1ZmalNBL0ZxK3BuU3NGTklqaW5ySnJnOU52K1ozUHJh?=
 =?utf-8?B?VytYK3l3RGEzbHg5TDUxQkpSMzF2Q3BDT2MvQTFJVWJHKy9KKzg1dEhoY2pW?=
 =?utf-8?B?MHhhWkhzOUxmWm56emtTUEhEMkxNdlJXYkwyWmRtWVhSRXZCYmoxVjVyeDV6?=
 =?utf-8?B?NXZNUXU2aEpvNW9HMnZEWTdmM1lOQkMyZTl3MmlFUE90a05JelVPb01UY1k2?=
 =?utf-8?B?Qmp4VzZyTVZxc2I0S2swNFRML0l4dzB5dzlLdDVSWjJmLzlmZTNPTkU4ZFl2?=
 =?utf-8?B?YTdWdmZYTmJjWGRVbnZHbTlDSjFrenpHYUJtZkl4blV2aGZORzNOZ2tEYWVn?=
 =?utf-8?B?bVZ1aXVpaEpSQ2dkSDFXOTVsNmdBRU1nVDhBRjRkaW9LeG1tRStDWnlFcW8y?=
 =?utf-8?B?UXBKYmhrUTg2SHo3TmpiVjhjNWVpaVFJWmFvZWxtYU4rY0FRZzNUQ3BrTlNa?=
 =?utf-8?B?T2c0NHljUW5DVXA4SWxzMlVSSlNsOFpHbXNwYjRyRDlPMml5QUs4RWk2QlRx?=
 =?utf-8?B?ZVZuTWlNN2hJM09sSGNlY3cxZ3FleDFsVkpIS2pjci9BeDU3SHl4d1FaMndJ?=
 =?utf-8?B?VVhzR3RMcFJUUmVHK3JTMmo2Q3hBPT0=?=
X-OriginatorOrg: a-eberle.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fccbe431-c84e-4290-4733-08dbb99e9b53
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:58:26.6805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2996bb3-18ea-41df-986b-e80d19297774
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUDx8+srwz6cxJ/i1KAfhOvJF/2LoWnbiQQ+fRfEpjfD04kMc4Ik8v1efBY9EWDfK92+T03DgaH8fXBkBRv5xBi9t8/BtTLZ5CdxddvR2GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5861
X-cloud-security-sender: stephan.wurm@a-eberle.de
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: stephan.wurm@a-eberle.de
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay100-hz2.antispameurope.com with A507116002F6
X-cloud-security-connect: mail-db5eur02lp2104.outbound.protection.outlook.com[104.47.11.104], TLS=1, IP=104.47.11.104
X-cloud-security-Digest: bb4c4bc46a339a2aa2d467b7256f86fb
X-cloud-security: scantime:1.538
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 05:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187895

The project changed its dependency for rfc3339 validation from package
"python3-strict-rfc3339" to package "python3-rfc3339-validation" after
v3.2.0.
But the v4.4.0 recipe in #kirkstone does not reflect this change and
still depends on package "python3-strict-rfc3339" when "format" is set
in PACKAGECONFIG.

Newer branches are not affected; "python3-strict-rfc3339" was even
removed completely.

Additionally, this patch updates the homepage URL.

PS: Sorry for the resend, forgot to add the maintainer in my first try.

Signed-off-by: Stephan Wurm <stephan.wurm@a-eberle.de>
---
Changes in v2:
- No code changes
- Explicitly added maintainer as recipient
- Improved cover letter
- Link to v1: https://lists.openembedded.org/g/openembedded-core/message/187591

---
Stephan Wurm (2):
      python3-jsonschema: Update homepage URL
      python3-jsonschema: Fix rfc3339 validation dependencies

 meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 47a1dd7f389e3cf4ac2dc5fc21dccc870aafab4a
change-id: 20230915-fix-python3-jsonschema-deps-41918244af31

Best regards,
-- 
Stephan Wurm <stephan.wurm@a-eberle.de>


