Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.69])
 by mx.groups.io with SMTP id smtpd.web12.29587.1612155215569249776
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 20:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mfAlbJJ1;
 spf=pass (domain: windriver.com, ip: 40.107.243.69, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C45O8rr2Gd8ULVq7FgY7ITYIrnTHvbbXvp/ReAJScWXyHAEq4wdjfxyD4mIj1QJXz680m1gUI6hnO1Yz2UM+nDknjxdFaH2mxRSOw0085BkZvxay+dVWALpMvF2XsG6a9mDD9qdYkW7QrROFqFsv5Evrgwaoj/Q8NM8/B7YrPA/2pnB6eeqvwkcoTCfE0pC9VZhNSaMdT7ChaLaGHVO5qpWsRi77hBHqFEysgcxUSaBGnCAjYiMnUaeEkYPrmKXEMZHq0i2N9bWmWQ8PrBuN8fiKXf3AGThwH9VLgdEk4ckF0eL9IfzCBdhMKj3XeyJi/EqVF5nTH5uwSiii+HbWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8EJCztEPR3elFRNoLzhDLvu3DTokzl0hYgs36DW+1Q=;
 b=TD1ikQw59yuzseiO+ivlYcGyjvBmlJA9IsvSeP55C07F6b0e2BrtUY5lromIjedlyzBrN39Kmh2WHC4jIwk/PSQe1c44Tf4gbpxhukjjCQjsNF/YmKpBxeq4qx86oQEuC/l28RxTaLghlKgGetrE9E7xi7T4xqC99D/u9VKcPSP6Z0GYy+Umdci30HtKTJxt1m/8/8tyzQJG+rBpc7yl8s474oSp+2DjeWK2yv7OzuPHQMrFHV1yOJavmuhUe3lAlO88oL3FDlzKmOxG55jQ/zkDzorfeOlLpKBJJTzDPyKypmBgteXuSrvvF0tl/mmRdYt7f0SH7YFGtmNdcxEGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8EJCztEPR3elFRNoLzhDLvu3DTokzl0hYgs36DW+1Q=;
 b=mfAlbJJ1+PlmWYKUpqSd0RgzMgCzpVyBagPoYtks3UPBgKdAj9pIWa+gY2hezxmQYaJBeSmyYMhVLR9GCrdyBaQaT7P7CouHevjvDogpqIrgSGXNwBZW+rMCkIwzCcCDGuAhcNEo692paXE5n0JgQ7pMTQeoPtsxqGLqxmhiShQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Mon, 1 Feb
 2021 04:53:34 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3805.026; Mon, 1 Feb 2021
 04:53:34 +0000
Subject: Re: [OE-core] [PATCH] oe-pkgdata-util: Check if environment script is initialized
To: Dorinda <dorindabassey@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210201034344.5661-1-dorindabassey@gmail.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <adbac703-82b4-a3d7-734e-2ef23c03dd81@windriver.com>
Date: Mon, 1 Feb 2021 13:02:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20210201034344.5661-1-dorindabassey@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:d0::16) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HKAPR04CA0006.apcprd04.prod.outlook.com (2603:1096:203:d0::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3805.16 via Frontend Transport; Mon, 1 Feb 2021 04:53:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b03a08fa-44ed-4200-0226-08d8c66d53e6
X-MS-TrafficTypeDiagnostic: BYAPR11MB2632:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26329C7F5E2C812974E420DFEDB69@BYAPR11MB2632.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IBE5bRfSWTbgtt9AH7coIHyjlAKRgw0EzphGPgkTX/+bMrr6PNnZmZEXRn3thRYMVq/kXCT2CM5eE55bB6rARR92F2ZOeiKRcbt5eTHfgxIUem2f3tBikL2WetVXnLZe43o4Bkq31v1P/wNr3BTOCO+9cydwqhvDhTu/45Sz+NbJ1TE4fQ7xRxEvV1fRnW/VtnH3FcCfkcRZeId0bPdl6yMvO6knWHplT2fc6HYMY54vTcf2oJnh1F5qk88DqIc6ctWIB6p7G8Vn6ttSxauu5mMfpMkKiCBt3y5kHkLiOt9pZb3cF1ptx8FAAAFI3OO+Ll2BgRAf0ORz4k35cKpBC7qk1C8viRDhS4AJKzkD/6tB6FBES2CcF7k3aR6OfzX5giXXt0PtsSAThDy6fK/KSmieLj6aynyWYUdTHwdmk53vQeblvRF0KL/yY601sZPK5ClNn0CxVhVMxgF0MVjl+zvvEJW11P+njDpnkVDgbpFk8Edh36kZ042xT3WD9/uZtjR67cQY1dqxzsSQB5E6Lod7tnQ7Nihc9Xwj7gIvaSy83lF2AhfodiloxiFVVD+FchzFJosPO2HaTuHBG8IfYMs+fuW1/eQCfnkgDijJvNKZSJ38qukGPLuk5KStFKPOxFIbkCny3XJPoUn2R7yBRNxBoWK8qYs/lPoFL0Uw/FgjBwwN4Ie53dFY7MPw5UhOxbDWKK87R6gqYlWBxQNe/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39840400004)(346002)(396003)(366004)(66556008)(2906002)(66946007)(36756003)(66476007)(186003)(52116002)(16526019)(53546011)(166002)(966005)(83380400001)(31686004)(8936002)(2616005)(86362001)(26005)(33964004)(31696002)(5660300002)(478600001)(6486002)(8676002)(956004)(16576012)(316002)(6706004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WU9kMmRvMEhKZ3ljakMxanZjUEdJM3hPNW5hY2F3ZVc2amh3SHY5cTBxL3Bj?=
 =?utf-8?B?VHFtc3ZuejdTckovM0ZUQmZwclh4VGRyS1pFajBrcHhXd3VIQ1JkZ0M0YjFx?=
 =?utf-8?B?TmFYYnlBR1dFeHJYbEdWQ3BPRGxLaDIvSk1LWlppOGt2TVcwYXh2d1RoVExI?=
 =?utf-8?B?RSszT2cxUDhqN3E5ZFZ4OXJ4anpSSHJxaGVXMTZpR25Ic0hqY1dZOUtJK1Mz?=
 =?utf-8?B?R0dkVE5uaE5lc0tPc1djQVdYZmFsS2NFYTkzSWpKUSs1aDcvbk5ialhQSE56?=
 =?utf-8?B?WGZ4UXpyN2xJM29uTktEbG9mL3p6U0s3REY3ek5IaW5YSkVHMkRZYVk4a2Zv?=
 =?utf-8?B?bzJzVHpYR2cxVExvTDcvZFlMSWdOMlNhTVVXM3FWZm4yVk96WDlycm9PUEdJ?=
 =?utf-8?B?VlY0TGFBRUlLNzl4NEU5MGxLb1phcDNqTExWc0FpL042YU5oQ0NjYUlRdlRQ?=
 =?utf-8?B?VXZ5RGVHOHQyY1Q0cFpWSmJCV05vSFBLWmVzQlIxWGcyamlTRmZMMEFNQXlV?=
 =?utf-8?B?MlBBditqUW1LWDB3dE5Va2R3Y0NrSUNBbmRncmtwSU9XbEhMVkNQTFJuaFhy?=
 =?utf-8?B?UEpkOVRwdjlsZDVSdkJQMmxiTHhlams5QTgyVUN4Zk40K1p1Y1NYd0dOZDdp?=
 =?utf-8?B?SnNWODlFSGJnV250OTcrWDZ6VVYzYWZnZ0FsaW9EQ0plc1pLOUk3V3pvNmZ4?=
 =?utf-8?B?cmJDTjNKaHFndjY0bGZMa2p0b0g1VHBGWjNTajJzU0pKNWtZOENLTHJ0MEdr?=
 =?utf-8?B?UW9kRUxwL013U0tJZ0QySENHc1MrVkxjaUtSYmpRZHRsbzRtNnNpbng3bUZk?=
 =?utf-8?B?bTBsK2RsdkxPdGwxWll4Yk9uVHRzeXdscWEwTGYwQ2t5eFE2dUk5WXJGOVhI?=
 =?utf-8?B?SGsrbkVXVFl5Q004Y0tuNHlmbnZqR0ZaVnYySytBU1VWWkMvR2hxNnIyNHp4?=
 =?utf-8?B?L25KN0h3YWIzbjRkUWFYOVU1Y2R6T1NJdXQzM01BK1I3ZXVrZ2ZpeW8wUWtq?=
 =?utf-8?B?QlVNeU9hbGRkYUx6SlptcjJha25BLzJuckdzVEVWc1lIeG05Z0pMZFNrRDVa?=
 =?utf-8?B?bmRNUFIrUGV4a0xFeitMbVZmUEZMWW05UDIrRm95VDJtSmowZ09keTRMM0M5?=
 =?utf-8?B?aHI0Z2tGbTRlRW1ic2NWaGMvb2hGWWxMaW1xdmg1cCt6emsxUmJxNS9tZS9q?=
 =?utf-8?B?YXhZbGwxNG1OT292eFNqSkNnenJUc1VVOHFtOGlrRXdLalp6eDZoY2l6dlYx?=
 =?utf-8?B?VzdKTVZhS3k4NVZoajV4MFFReThISWdHbE02SHhpZjFLTk8wZkFRaW0zYkdu?=
 =?utf-8?B?cHJiMmMxMUsrSEpxZ2pYZkE2Ujl6NnhjcEU0eFVZOE91dFh5Q1BmL0ppMW5x?=
 =?utf-8?B?cU14dVhydm9VdzRacm92R2tZUDBuaTlKOVlJaCtHeG5FYzFMOCszblZRMGxN?=
 =?utf-8?Q?rXDbO4QL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b03a08fa-44ed-4200-0226-08d8c66d53e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 04:53:33.9849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ut9rpuEMPnXNUGSoRxxK9X+d32OPooTM8KUUNY7Z+KelmgEEmqCcjMwt5C8HnAWQ0IrkX3QeG+sCORyBL4sUeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2632
Content-Type: multipart/alternative;
 boundary="------------8CC5043FEF5DE44A6E69DAE6"

--------------8CC5043FEF5DE44A6E69DAE6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

There's a '-p' option. It should error out only when it cannot determine 
the pkdata dir.

Regards,
Chen Qi

On 02/01/2021 11:43 AM, Dorinda wrote:
> [YOCTO #12096]
>
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>   scripts/oe-pkgdata-util | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 93220e3617..169908638d 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -513,6 +513,11 @@ def find_path(args):
>   
>   
>   def main():
> +
> +    if not os.environ.get('BUILDDIR', ''):
> +        logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
> +        sys.exit(1)
> +
>       parser = argparse_oe.ArgumentParser(description="OpenEmbedded pkgdata tool - queries the pkgdata files written out during do_package",
>                                           epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
>       parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
>
>
> 
>


--------------8CC5043FEF5DE44A6E69DAE6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">There's a '-p' option. It should error
      out only when it cannot determine the pkdata dir.<br>
      <br>
      Regards,<br>
      Chen Qi<br>
      <br>
      On 02/01/2021 11:43 AM, Dorinda wrote:<br>
    </div>
    <blockquote cite="mid:20210201034344.5661-1-dorindabassey@gmail.com" type="cite">
      <pre wrap="">[YOCTO #12096]

Signed-off-by: Dorinda Bassey <a class="moz-txt-link-rfc2396E" href="mailto:dorindabassey@gmail.com">&lt;dorindabassey@gmail.com&gt;</a>
---
 scripts/oe-pkgdata-util | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 93220e3617..169908638d 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -513,6 +513,11 @@ def find_path(args):
 
 
 def main():
+
+    if not os.environ.get('BUILDDIR', ''):
+        logger.error(&quot;This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)&quot;)
+        sys.exit(1)
+
     parser = argparse_oe.ArgumentParser(description=&quot;OpenEmbedded pkgdata tool - queries the pkgdata files written out during do_package&quot;,
                                         epilog=&quot;Use %(prog)s &lt;subcommand&gt; --help to get help on a specific command&quot;)
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------8CC5043FEF5DE44A6E69DAE6--
