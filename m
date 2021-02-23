Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.50])
 by mx.groups.io with SMTP id smtpd.web12.11833.1614095608003523701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=H1p4gUM+;
 spf=pass (domain: windriver.com, ip: 40.107.77.50, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1zy43PijJKywg9sUBRGVESweFo+4WZHDh1wCZAcdEouzO+rIgEBDjLHpecswfcU2bzp24Litq/R7FjxL2H/BoLl0b6lcGcVLBfunO526yjRnqK3Q8ocSyMEo+P4x2wmq7X7GNRzSdU/J+F9jyTdx229swMskJo/sg8NnVAAZ6svXmt/sbAbqHDAecXeLGvoa2hFfz45PSdAfckTr+v2TuWYBkrgw9agnF0FBzcXY0GyKuPzJdjsXnMuX0M6rfw8eJ6SZVlep1VGzzQkO7+tinTbscjgibSwCd4eqVUC90lIDelN1Aw93hBeChTgfo0TGRzhOCx3L3S3pnPcZeTQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcU6ATbXzzfuvgZCQsuOQ0EX1zf9YW6Y/EKyBAhmBao=;
 b=Pi2ReV+P6w+88HD/XSN0Y0pgS55BFTu00H3qM5fn7VrSe29FNHna6yGeuAuFslqUYUVr17YlNbmDTD6s2N12zf0VnldcOpfRUnh07/O1BNO74Y12Jivtnzk/7eyyLxY1QQBDGAnA+0BC1vIbVN/uy8jR2EY0ekK/Hpk9Wwxb9M8piKXEb/VqxH47sd8DCCSRxYJlmQcM1UY0axIcBe1UrxpoVLpLzG54A8FghDX0Q1cEmu9tIAQyS5xwDoK2PGlzXJAeU8hkHCCf3XXjiPlfVNPtlgflH8VqTb3MCC4vt+l5Ixmg9FX54IKVozWzOuseXZ2JlZzxtqhwFwnrBDTffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcU6ATbXzzfuvgZCQsuOQ0EX1zf9YW6Y/EKyBAhmBao=;
 b=H1p4gUM+5cedTjX4x+6y2mHHzYTS9GnqXYsjjYV8Yn5kn3omM83/I+Wy45ymnBaZn5eSaU+wsjUimTE9Iz2xLOc/xtqbVnsUYZI+uEAzouWtBfwabhDaJEBHJurMNNkJ0LzUSzhrv9cRVqpzDLrT0P36Lr7wWL0tVEWSyxKjFqU=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR1101MB2085.namprd11.prod.outlook.com (2603:10b6:910:20::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 23 Feb
 2021 15:53:25 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484%4]) with mapi id 15.20.3890.019; Tue, 23 Feb 2021
 15:53:25 +0000
Subject: Re: [PATCH v2] cups: set rundir to /run/cups if systemd is used
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-core@lists.openembedded.org
References: <20210221204702.504297-1-open.source@oleksandr-kravchuk.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <c9e67e2a-0b02-73e9-97cd-029443ad03d3@windriver.com>
Date: Tue, 23 Feb 2021 23:53:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210221204702.504297-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0011.apcprd04.prod.outlook.com
 (2603:1096:202:2::21) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR0401CA0011.apcprd04.prod.outlook.com (2603:1096:202:2::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 15:53:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64cf4ec4-ccec-437b-6e41-08d8d81327b1
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2085:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB20859CA9721D68F0D86BE59595809@CY4PR1101MB2085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q3NPeOqmpLFhW598Gcz/FprMUxivIghWzAWvaxoYmNgw/jo1WSvUUZERju1Au7JZLtPg/lM5zNxHhmxFJ5FXnSCx8OYhd6VskSRdDFSyP0uzFMW8M96FNlEGjmNNL7jeCyP0KNhi01yOGwHzCE+wfhQ8cIzkkgD9B+rD4VPcsuXJ/VmGpG23If8inNGxxSymByFDL9KvtL+5ObqZlNDZzAxMntdr73CYK8H4Uj0Hn7GG4wiFJjnObjTOGzEuqo+BrmOkZfQxcoG2/dI+ieIGl5gAtaQhTd9IgzDcWtQOikw/wgGUoTeC0SVJPhCRXV3Vu4IbVn/EWTTynX4Ay75A76BKrt5hFvXNrLXwS7PJdFH70nTL6BrOPgGLfwFJSbMbgWACDvXz1RjusSpVE+0Vl1ZhwA+OoEWxkrtOLiTTgFRxKVPOp9e/hvA/MbjMLE+6QVKEIOlGEdWc4T3OecUXI2US9bSrWROrD4HuRgOng1ZEtAzkAoMxymm/zqwjpFWHak801ZcM7PzDBG9qKU+ODFMu7oik+aNirEeGOOpBAWx9yYhLRlSdK5z98rCqZ+F95e5lzFzzQukNxdyN3h0Syx50B5q75Iu5gtNUbE4y/urK5Wl1snxCy1cS5+iuVR4v
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39850400004)(366004)(186003)(66946007)(16576012)(16526019)(31686004)(86362001)(26005)(31696002)(5660300002)(478600001)(8936002)(36756003)(316002)(956004)(2616005)(6486002)(83380400001)(66556008)(53546011)(6666004)(66476007)(2906002)(8676002)(52116002)(6706004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?R2s0eTBCczFlN3BYNGFKQ0JtRU5KZzNNRTgxUWdQbjhjZXJJT2JBMUpxNDVG?=
 =?utf-8?B?QzNUMVI4Rkl2c253K2hrNVoxS2k5SUdUSzJ1aVBtdnpWU2Y3dm1XTDRSMFdo?=
 =?utf-8?B?NkxNMUxQM3gvOGNBVVYvUnk3NW83d3EzTUcwMzd6M0E2Y3VXaGd2bC9wczdp?=
 =?utf-8?B?YmM0ei9QWXNoTjBUY0tqa1pSYytPdVE0Sk9vNXZBSE1MM3gySnRoOGErTllG?=
 =?utf-8?B?aCtwMXVOUHpDdUFNMUdTUENtK0Y1R2trQ2oxSHdiOTh0Y0Z5QmtxS3U0SXNp?=
 =?utf-8?B?OXRaa2xnK3FwckRvQjN0dU5ZUTdQVWdIcDcyS3NuZjNtN2l3UmpVSUVySk1s?=
 =?utf-8?B?WEloUHRyMWZyYXFIUEZRYU1neS91UmZzOGFXdGdvWlkzdE1hQWdCTnRVQ3Js?=
 =?utf-8?B?ajB1SjZXamxxRlZ5ZjBOVzZvdStucjVDNW9qdGpMaTZyZDlCai9POGxMdWpZ?=
 =?utf-8?B?YXl6bHh3NENWaHg5VlZWS29kUEJwQ21mUHhPRHdJdFFXUHVnaFNlMmhIYjNw?=
 =?utf-8?B?N3ZWMlc5aGE3SjF3K3dCc2RNOWxBcmQzTWFDRW50aHJSNVhkUG5URWFPQlZE?=
 =?utf-8?B?QUY0ODk2RGVwUTFBSm5sQVMxbFRyOVloTzNwL0Z1RUJmU3hNbDA1TzB3cEM0?=
 =?utf-8?B?bnVSSTNBNWYxckdnc0ZjRmJ5dUp0Yy95dll3dVdXMms3c1o1ZzJiR1dzQzFW?=
 =?utf-8?B?UW1tWFJseEVrZXdwbU5SVXZHR3RwTlp0YXJMNlU3VlVMY1psK2VRZnVzZFhQ?=
 =?utf-8?B?Z2lseTBpVHo4THB2a3Q2dmp1d1Y2VFM1TWxoZEp1NzhXMHI5ekhLNW9xK0xl?=
 =?utf-8?B?NXdVTVdNS1U5L1I4LzNRUzY2dS9TMWI1bnFaTFFQcGhEZWllNHp5SnZmcy9w?=
 =?utf-8?B?RjVUSmdhak4yQVFQQXovSytrVVFUdW15SEhvVE9Sb3N0ZURsWmVFaHI0MURG?=
 =?utf-8?B?dnZaTVJtdmtkdmY1dEtFS21WV2dBL080TWpWK0dxNWhZZ1JaY0YrU0hrTWJt?=
 =?utf-8?B?eTVpb3lNWEJEeUp0N2FzamgzbTF5Yk41N3VhR0RZQTJpRDBNVTV1WUJBNXk2?=
 =?utf-8?B?Y0pUQWk2SXAvU3RkbkFoNC91ZVhveTh3azBuR0JkeHo0ZUFIMVR5clNHSllz?=
 =?utf-8?B?b3NqbXdRYzEyOVBURlZDWFNNSGx5WWI1WFVOWm83VVNmdVliKzR0eTBkaTVQ?=
 =?utf-8?B?LzQxRXFmMDdpS3RMbVRCMHQ2ZjBrbzNxY2doVWVCOXpEVWw3cE84d0FRMmZn?=
 =?utf-8?B?YlJuaVVRSlFqR0VSSW1DQktoY29US2xRQjNmK2NTaTNrYW0vWDltZmZCWDhn?=
 =?utf-8?B?NURPdFZieVpCSjBsdzdLaTRKOWJnazRjNmRMaGdJREtGUkVuSCtVSWcrODMw?=
 =?utf-8?B?bXhUSVVGRzBNbUJlVzFVaWw0SG56TWVYUFQrSnhRZDFYQTNKRXhyOUpuUmRr?=
 =?utf-8?B?Wkcvd1dCSUZ4dnc2Y1RhaTdZL3liUUUwNHh5anlrTVBWOEUxV0wrMFR3MHgx?=
 =?utf-8?B?WVRoWmdGZW53eEFWWVFXYkZKYm10aUEyRE5GRUFtdnYrbU1QMXVacmwvUWJX?=
 =?utf-8?B?NTdDRmkyaDBrME4xZ2tCd2x6V0NmRDhKMWNYWEtGWTFQSE5oM2t3aURpd2JC?=
 =?utf-8?B?bXZLREdQSU5EUnJKY0dobGtHbzFxcXFPM0ZCSlBRZkxkcUNUN0V1aVBld09u?=
 =?utf-8?B?MWlmaHBRMlhuK2V5blIxSU5yR2gyYmppU1dOempqL005ejlnNCtwdG0rdjBj?=
 =?utf-8?Q?p7Ye55wVHDpY3luNOpplnTnK/DkfA4SNWZVE3rK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cf4ec4-ccec-437b-6e41-08d8d81327b1
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 15:53:25.7291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSbO5s5dFRhvN85asW68RkUJmO5mFcyYJZoLdYm5mj8kdtkmkvb6Cq1d8ixpaMjX/d9g5bHw3uuowySb8fs93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2085
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2/22/21 4:47 AM, Oleksandr Kravchuk wrote:
> When running under systemd, cups needs to be configured with
> '--with-rundir=/run/cups', as systemd takes an exception to the
> activation socket being under /var/run and relocates it.
>
> This leads to fd duplication in cupsd and an inadvertent closure of the
> activation socket when the daemon exits due to inactivity, so that the
> daemon cannot be activated again.

Hi Oleksandr,

Did you test it with qemu image? The app "Manage Printing" of the sato 
image could not be launched. And I update the cupsd.conf with

Listen 0.0.0.0:631

But it can not access from outside. Any suggestion please?

Regards,
Kai

> [YOCTO #14152]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   meta/recipes-extended/cups/cups.inc | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
> index e7a704134c..ff1ab70be9 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -56,8 +56,11 @@ EXTRA_OECONF = " \
>                  --enable-libusb \
>                  --with-domainsocket=/run/cups/cups.sock \
>                  DSOFLAGS='${LDFLAGS}' \
> +               ${EXTRA_OECONF_SYSTEMD} \
>                  "
>   
> +EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-rundir=/run/cups','',d)}"
> +
>   EXTRA_AUTORECONF += "--exclude=autoheader"
>   
>   do_compile () {
> @@ -77,6 +80,7 @@ do_install () {
>   
>   	# Remove /var/run from package as cupsd will populate it on startup
>   	rm -fr ${D}/${localstatedir}/run
> +	rm -rf ${D}/run
>   	rm -fr ${D}/${localstatedir}/log
>   	rmdir ${D}/${libexecdir}/${BPN}/driver
>   
> @@ -97,6 +101,11 @@ do_install () {
>   	    install -m 0644 ${WORKDIR}/volatiles.99_cups \
>   		    ${D}${sysconfdir}/default/volatiles/99_cups
>   	fi
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +        install -d ${D}${sysconfdir}/tmpfiles.d
> +        echo "d /run/${BPN}/cert 0755 - - - -" > ${D}${sysconfdir}/tmpfiles.d/cups.conf
> +    fi
>   }
>   
>   PACKAGES =+ "${PN}-lib ${PN}-libimage"


-- 
Kai Kang
Wind River Linux

