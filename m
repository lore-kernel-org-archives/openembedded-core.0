Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.115])
 by mx.groups.io with SMTP id smtpd.web12.6887.1593768576290594011
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=kNQ5OEH0;
 spf=pass (domain: prevas.dk, ip: 40.107.22.115, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+MrLUiKMph71WAIdJHH9m2eGfUU57vXP7TMfUuiRCj6BUpXu/BYNY/hq5tBapFI69eYjJzRjaKcwo7fvgID5YVe+7BVEF8WRbcRuZiRpfTlTTzoXsGGSEFBSUCfi2xbhNReqi/hmJ6UZJJ9D5IZV1qN95rm3QhemV0NVH8iUt7RnmMyXEJ7B3NxW9CZ9qBj5vqZLKRiRRfUE7anxKcbt6GZqU50/4OtPIHqrZNEDK6RGB2kx/dTXSjknl7yNx9gI0UA52w5j41wtITEAK3vUf66UwAvGk9OZoBbGI/Fl7GzmXbolghtCZ1LfVjwu+HifI4xr98+ih8KXV5u0g34VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8KGnD0usroZDng8sBPkT7qFyZtqX8f+hL+vzO7TtDw=;
 b=cQksClPDFRjW+Ib0XvrPjEk2+/b9losCzqR4cbWMOWL9SSAB/BR1O7b2vDP8QVsa9pmNhadiXLZiNfQjds+xrObei4HQnl70SwviR3m95glvA7ovKnmQyKN0KpY7hznKNLRA60GArBWtHnvIl/9n0S6L4lqzDmVqT+4Bh0QWUf/F61mdRFZheKZVbYCpMC6vBxWioNXomSMfBUWa/wy6QBmMHyMuarqOiaFMhq4cyKF/A3/5sJl6C383gBASeeG8poz6A73F/CFzS9n5B0cNZLPR3sy3dEYnayTlUyEaM/XPXriJTMNbcw2hwn0GKgcXSUYXwE2r/piS8uQPDb2lTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8KGnD0usroZDng8sBPkT7qFyZtqX8f+hL+vzO7TtDw=;
 b=kNQ5OEH02LzEnZgEygoopsIEzxnirpNnYhRwKkMwrezrfs5HjmBaoazxt1p9vfy0Ld8MpbGgQxTcE3Qzm1OlikzAgmfTAf1W9sp+Cg7h94y/+kdSDzQYugzw6qMBuj9Q2XIQnUbNDa77NOQRntyIjI2RqDOd06wVSgidwFTTy/o=
Authentication-Results: stusta.de; dkim=none (message not signed)
 header.d=none;stusta.de; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3297.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:182::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Fri, 3 Jul
 2020 09:29:34 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663%7]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 09:29:34 +0000
Subject: Re: [PATCH][dunfell] coreutils: don't split stdbuf to own package with single-binary
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Adrian Bunk <bunk@stusta.de>
References: <20200703073631.16530-1-rasmus.villemoes@prevas.dk>
 <64b8f2c4fbc20ea866a83844d117816de59082dc.camel@linuxfoundation.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <ee34bd95-2dcf-cbea-2b3f-e5c11f95e5e2@prevas.dk>
Date: Fri, 3 Jul 2020 11:29:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <64b8f2c4fbc20ea866a83844d117816de59082dc.camel@linuxfoundation.org>
X-ClientProxiedBy: AM4PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:205::33)
 To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.11.153] (81.216.59.226) by AM4PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:205::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Fri, 3 Jul 2020 09:29:33 +0000
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1b2ec58-b134-4e99-a43d-08d81f3398bc
X-MS-TrafficTypeDiagnostic: AM0PR10MB3297:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB3297CCD1DBE01798029EB4B1936A0@AM0PR10MB3297.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NjUj11d+Qaa7lpujHdpEgjqTQI+ySFvu0LH2VyK1c8n7B3Yy9/caZy06WXst1mxaOJvRpX0ZTj7cA+sCKJHIAsjmF7aYLqq+Suyw+xFbR68YDfCNNVdLTHL977ivtnZ/Qlj+POn4phGgNmzYsXpDpckHZHEGqV99xIZcNGqnIfC8wXmPEqysnbCUNLYglesCbDhH9qhTFa0hPRRpzMRLwq/k+b8BUp2UuQ3CKFt2HC/7LMBWP63ZUxuo9A44alcuo/iKS3cxa8SEPRa5I9mtxJELcjth72vxp1TVV0RLKaPrlYDIuN6hN6aXAyEz5/qIVcqtKte7dOA+q994Cxjv1BR1LS0YlbcLruKYh8Oc4bzfm8SjydF50S/Sv31X1eBC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(396003)(39840400004)(136003)(8936002)(4326008)(8976002)(2906002)(86362001)(31686004)(31696002)(36756003)(2616005)(66476007)(66556008)(44832011)(66946007)(956004)(52116002)(26005)(8676002)(186003)(16526019)(6486002)(5660300002)(316002)(16576012)(478600001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	4rIbvEBZisXu4au+FQvNvKZDZL2rY3l1P+xw2q9LEyAssW0+rPf4Q1daSoN+7l4hVsHPrB1HJN6VP5/7AXKaVSAPAY7PeRj5cK/RBPRkWE+T9OGgcEOS0c7Ma4pTXBxuCwYaOMbkb3J/uQVIUkVaQVDGTVdCMkkbeSBDEjT0MiRXpE3wlP1MwRo9UvBvOqVJr2PHIaWwbk4u8zi4bcG/fvdA6LOERidW9Icb0dLgE42Nbn6ezsL5maSbJ8q/KTae6HlD+hhJrxIkjwPVkuOHrWZmPRlhBedDvNKn9I4ZrSd6+RK84HEtJYOdjeKoYmcW8Ewnit6wyMBlyUzVJ7DHFeOIRIj+bsAUN+W1WPsrWEPo8Z0STuf3T6MExnKfmnYZlqcJ0pjK0fGopY1IfhZjA6RBxhrWC5RPSsqZ6PPD3fSIM7yq27KkqAxsZ78ZK/mdteeJ42Rk495Tzw5wBhkUM2YtHcAsQVMy8G8ouYiAaAE=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b2ec58-b134-4e99-a43d-08d81f3398bc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 09:29:34.0627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkwm5oTfXuzViCnQjt4j7JstCktvDRVs4M5Xal/8HOLxcFO0BWALvYNV3ybijJ1cQflDFXlZOamrF1YqwQ9AoA9IfXkHJX1c3WOmZgu28XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3297
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/07/2020 11.19, Richard Purdie wrote:
> On Fri, 2020-07-03 at 09:36 +0200, Rasmus Villemoes wrote:
>> Commit 992cec44 (coreutils: Move stdbuf into an own package
>> coreutils-stdbuf) breaks package-qa when the single-binary
>> PACKAGECONFIG is used:
>>
>> ERROR: coreutils-8.31-r0 do_package_qa: QA Issue: /usr/bin/stdbuf
>> contained in package coreutils-stdbuf requires /usr/bin/coreutils,
>> but no providers found in RDEPENDS_coreutils-stdbuf? [file-rdeps]
>> ERROR: coreutils-8.31-r0 do_package_qa: QA run found fatal errors.
>> Please consider fixing them.
> 
> Does this problem exist for other packages in coreutils?

What other packages? stdbuf is the only one being split to its own package:

coreutils/8.31-r0$ ls -l packages-split/
total 32
drwxr-xr-x 4 ravi abcdef 4096 Jul  3 09:49 coreutils
drwxr-xr-x 3 ravi abcdef 4096 Jul  3 09:50 coreutils-dbg
drwxr-xr-x 2 ravi abcdef 4096 Jul  3 09:49 coreutils-dev
drwxr-xr-x 3 ravi abcdef 4096 Jul  3 09:49 coreutils-doc
drwxr-xr-x 2 ravi abcdef 4096 Jul  3 09:49 coreutils-locale
-rw-r--r-- 1 ravi abcdef   48 Jul  3 09:49 coreutils.shlibdeps
drwxr-xr-x 3 ravi abcdef 4096 Jul  3 09:50 coreutils-src
drwxr-xr-x 2 ravi abcdef 4096 Jul  3 09:49 coreutils-staticdev


> I'd suspect it
> does in which case why is stdbuf special?

Because it's the only util that gets special packaging treatment. Unless
there's some magic 'please auto-split all utils to their own packages'
that I don't know about and which we don't happen to set.

> Whilst I realise there is a problem here is the correct fix not:
> 
> RDEPENDS_coreutils-stdbuf_class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils', d)}"
> 
> ?

[Well, the coreutils should be in the true branch of that.] I dunno, it
creates a cyclic rdepends between coreutils and coreutils-stdbuf. Is
that ok? Seems a bit ugly to me, even if it would work.

> As Alex says, this would need to be merged in master before we can even
> consider it for dunfell.

I'll do it for master once I know which way you want to fix it.

Rasmus
