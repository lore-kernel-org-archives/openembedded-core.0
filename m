Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6811ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 03:28:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2214.1663126074308194886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 20:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VRZhzk2w;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6256f4cbec=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28E3NQuo007502
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 20:27:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=xjYRBtGaUZxXYYD4rigTVdXRy7ZapKvq06LPsQalwy4=;
 b=VRZhzk2wCBa339RO/IgEMJvFxFVk0ZbbpjLBt6ftZtww676l+WBEYFEmzdd1lp5G749P
 O87COm9CrAGDAlZea36IH7RaKORW7EMPqRYo5K3BIQHgkFigmmqLwU6rVGgs+riFjaMc
 IG0xn+qFqcHiIBS45IBofj6+Att6IYVTxomhkgb6UDmEuoSKCcpmXJMQHurM6k386e12
 bXhpxrd6FujUV9v4aKtFPsp9zZXRUPGqFA3VSM1Nl/LXvkYR7Gp4F1hz6ESrMjR4rwPY
 4Q8pOV51OIeTNl4l7+hdviZRJnjb0wx7AlX+MCfIx3F5eDyHzVf8TAK0CGfbzxrC/KJu 5w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4pdr45t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 20:27:53 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28E3RrIM017397
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 20:27:53 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4pdr45r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 20:27:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agMHrp3wQGUQjm8pY+1PTgzjHF+m61PAMeO0Yb92ZfKDMa7lj5mCbr2GKt8Hmle5W2vg+DK6zNgL9+LBrxJFfUZ1FO85VT6cMclSYShmTyvnXOKvzX0HO2oZD4n0pHrFQvQJ9uVwSRNc6Jx8ySrupkE41neKHNEAA65l+3Bxim6T6eMC7aY3GgdVAf/kF4ezeFm0YcSxZPXu+xAIExAgTRZwmFsMc2hjdTYaUPzpipn0QkCZSDnKEeUcikLPT44D1AXm638J24rUuxZkiJjtR83rxORCr2rhiZD2ots2UMZMmBgfywAudQQmhe69XiWvysFH75ufc2QAKSlpPlZtwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjYRBtGaUZxXYYD4rigTVdXRy7ZapKvq06LPsQalwy4=;
 b=XGgUTW5vnccWzB4bEPrczUXkal7FEauEGGMqFfrX6TJS3f3kLTtjACIY/+bd311eZi2XKCDNJPxbO1DE+a96vwutBq5uBGb1lc9YEJvvRGUcKDOJBDbs2LbwbJGZdK+ECJ2P3DuHOCv0Jsdc4Hwifmn3vnZaHog3JUc/95S8QGp1i3WGD14k7UJkrv13KUMO31tAdQSNRH7gydcQ7LyZTVstGb1k6yV44y0J9P7/USx5euJGS5OJtsgP8LtiwmVTWLS1TOVzEBUgNZS+x1ikG56B4+CfLEAkeiXhTc2S3nQqGyTJk9LLoLOvnuLY0tPQ+nxZYVVjrZGupkhDfng1Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB6765.namprd11.prod.outlook.com (2603:10b6:a03:47b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 03:27:51 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 03:27:50 +0000
Message-ID: <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
Date: Wed, 14 Sep 2022 11:27:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220831111401.3330342-1-alex@linutronix.de>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20220831111401.3330342-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: d04adfda-0788-4608-dd5f-08da96011a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iFH0TWP1DnZgzJbFL7X34xUToySxdKUyTEQrDJIUjPKMsBmzD4fxinPotcr7SCLLmRLWAbxBhftYpQe4v0ooNMx6Ni/umpgadTra9Rj+DE7jZN/fG2M2Be5/CHDfMBAIBMh9bozIg9T377PeXElYQp90bo+uhoDdonFjcSjuM9KZpaVYF4dvGgSMWFIt0Dfb+Fqpu7P4WGH3NWDOiHMiOTN+kf/Qvyixw00tDd78cc6IZ4vg6vd1OKLBctmvwCqi8H3wxXTrBzHyt051BkhrIKOcSb9d7ioUMSygDz51wctwbnSdC8POtzbzLHQMwfus+LxX8HNoa8Z/IBgZ0on5K3jn69juU2g14tgbCcggf62oXR8Jtck7cRHTh/4bLH3Btkr//9J23RwBl5hh6ElCIMl/Yj2bVq6eEW2iVJNtKBVt76XpK3a1vMA2QvI6SaDMp/J4cl35XrtB/NrzWzlolQ6avdGz62YOAupqR+yYzlbakkaPiwZQAcjrbEAiALT3lCQiPXc2PCe/vcTAyTALbLbks9TKf0GH/Al0/Tan/es6L4hDSQxXvWNu9Hic5e/SlXfhxgGqmG29rwUy+H4HqtbXrFg8wfcl6MvBuv9Uub18EJ9JRslRILpKm/UukUy2rba63DJerwlpDa9st0VV2nTgDmRDVTdmfl9emxE4MT6z4Ie/x1fqiptbsFlTzBU4T1WWp4DnuJeznCbpnEZtvnQWB9fUAX9LjOjd+qI2MDfdxnixLWwRZGHLfeQjOL7hBCHAuJxvcwNmgjIlarTVCDg9uY3PuGqEFP+oU+N99Zc8tHzP3taWfald6yd8z+PiYzoPlIaOi/KK8hkgMu4wT2RV7fVidM6H8BhkWwEtbew=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(366004)(396003)(136003)(346002)(451199015)(6506007)(66476007)(31686004)(8676002)(83380400001)(66946007)(66556008)(4326008)(478600001)(2616005)(2906002)(966005)(6486002)(38100700002)(6512007)(186003)(316002)(5660300002)(41300700001)(6666004)(26005)(8936002)(86362001)(53546011)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MVRCaW5MMGMrOFJMcTMxeVNqSFFWNzFsVmprd21odG5QQlgyMWtGbHVpeWVi?=
 =?utf-8?B?clo1VjBYOWNiUjNpK0h5VWZFY211M292SEFXNGJWQUdSYXd0QWcxNjc1NzFW?=
 =?utf-8?B?R3lSN3E3NE9kUjVVWmhoUE5mQ0RZRklScytNQ05za0pWTmpBQnVoMnRRUEpN?=
 =?utf-8?B?L2tRTHljT2h6ZmdLaWJYMkxSRmErUlQ0UkNBZ25Na21FWUhSVGJhOGpWUFZo?=
 =?utf-8?B?d2RQanZYZEpET1pOelVIbld4YVVoYzJQT1JRcVJaY1c1TUxFT2V6eTFlVjRp?=
 =?utf-8?B?bmZmVHQvVG91eGx5K1JGSVBHNEk3dWtDMm1uRERVUXlkNGlNZkRjNzgwVnVF?=
 =?utf-8?B?eFFBNUM0MkZheHViZHBwc01xYjNCYlE3am5RbmRQNmlIZ2xONnU2ZGtraFpx?=
 =?utf-8?B?MHdWWGlrcFVQdHZDSFEwcUIvS25xRFBtZGlNbmhWcEIwZjNMNW1CeU1US1Rh?=
 =?utf-8?B?TDNjWDRQelArWkxKWEhDSWVxZ0lnZnluV1FGNVhtajVZanRXbSthUSsxRjNT?=
 =?utf-8?B?a0w1NTdMRkEwbFREd2xZWURwb1RtU0hKR3FhbC9nd3Vyb0UvaGM5L2FTVzY1?=
 =?utf-8?B?OGx5dUVFVktBMmVuY04zWndWNS9BaFlEQ29TV2U1SjJReE9TdHZhaDBtd3Vn?=
 =?utf-8?B?Yzk2TFp2OXFZS21pdHpNQi9NNHB3SkduZ20zVk42QlIra3RTQ1JTZEJnWXVw?=
 =?utf-8?B?WkZmL0RNZWlaSW5FVWV4NmpiWVo3MnAvcmoxUHhCdmN0alFZMGZROExuYkFE?=
 =?utf-8?B?ZDZDMmRvRDROK3lWTzdYVi9zdE50TG5jdFp0bUhwK1lyY1VMUVpzR1puanFG?=
 =?utf-8?B?QmVjRnB5aS9mMUpKT2d1RlpTOWpPOFozbEYrSm04TjdDbU8wem1XL3lwdm5j?=
 =?utf-8?B?UEcrZi8yR0ZQRis5d2ZjNVE2R0UyMDVSSkdTampwbW0rL3JzZnh0ejZScWFM?=
 =?utf-8?B?aVRKcXNvTkVxRlp6QkViYXVmUjUxeUpGWEdIZUtHUDh1U1ErNUI3Vnp5aTA2?=
 =?utf-8?B?RWErRGNzYkwrQjdyZ3BxdVJMSmFNOC8rOUQ3OERXQTh3c3NiOG9CVVZ0U2V4?=
 =?utf-8?B?clZLSjdVTVNES1RYSHNBdjZvOG0yVk5tUUlYOWorc2NiVldkVUVTZXJKTzdS?=
 =?utf-8?B?UFNaRWdacGJsOGdEYXI0TlJPSTFTdGV2WjlpYlBvNVQ5RVlVV1JVWEovaG9B?=
 =?utf-8?B?TVlpTzdXNHo2Mjd0c1NlM0l5d1dLK2xnRzNnOHFMVXlKSGRoVDVBOTJLY2Ju?=
 =?utf-8?B?aGlJODBZbGZXbzdpRTZFenZNY3ZpcUN5ZzN1WUFEVzg3Qkx5czVnOU5SaTZS?=
 =?utf-8?B?OXF6c1ZaVGhhRHozV2VTN3NrRld6U3VtaStuUEhZQUh0VHZaYWM4RUFsUlhX?=
 =?utf-8?B?MkVHRVMzd3pNMVpEbHNkSEJoS2VNWitEckY3ciswMm5VSGV0VWt4RmNuLzVn?=
 =?utf-8?B?a0hrelFnekNRV0pnSjFyOWlqa3QrSzlzekRuOGFoSGZpK3FyMXBRbG9QM3Ex?=
 =?utf-8?B?MXBmTGdxNE1reXg5TkFmbVhEWGk1N3gwMzl4RGhLbExaZ3NOeCthMGl3ekRS?=
 =?utf-8?B?Yk9GWWxsd2pOOTdBb3gvVVdwYXlZZTN4ckVUQ0JNbXhEVi9ZUE9qZzdlK2hD?=
 =?utf-8?B?a2ZYZlcxQ1M0amxZSXRzVm9yV1hucjNPVkEwT0FOazYzRk53aHJ3b1psc1pJ?=
 =?utf-8?B?V2xMdTM1UzQwMjdiVUVuZTFDSE1aZ3gvZmNjSUFtaTNuYm8zVlVvYVc3VW9x?=
 =?utf-8?B?cCtCeEtxRnVJcTVEbFdKb0o4QUN2Zmd2U2w5dlYyRm9xZzkwMnV5cXloL0Vv?=
 =?utf-8?B?cXdVQytjbVpKamVSY0JvUXFIR2JycXJBamJtN3h6c25qTzhySzduNzZLdExN?=
 =?utf-8?B?M0grcm5hNUNlb1VTS3cwSEsvUk5rd2taNlN0VE5ZOU56R0NnK3U4REFjd1F0?=
 =?utf-8?B?WnA2Qzk3eUpweTgzMzZBN1pDV0hySGdhZXBReGlxTUNHV0ZYUzFDVWtsWEw3?=
 =?utf-8?B?WXhlTEJtT2hYOXpRQk9hZ3VwcjVYRlNaZXZaYXlYVkFIU3d6ZG1MZlFnemdh?=
 =?utf-8?B?MXArdWJrWnZIQUh5Rjl4ZHArUUJRODRUNHc2S25Xc2tseXVRYmM5bXZwdlhQ?=
 =?utf-8?Q?eKdVGx6HRBSqqFz4OK4Btgaal?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d04adfda-0788-4608-dd5f-08da96011a04
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 03:27:50.8410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hXJN9V8iU9BaNI/G2Ou+luQQlYHBMH8IlW/3mo+8D+zluCxyB1cZJ68L3GZFd2goOqnSsjfMM5sJz9P+oAwcyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6765
X-Proofpoint-ORIG-GUID: Kgkxdia6077nmqo3DCdBD3d-1Zl37Rp4
X-Proofpoint-GUID: DkaT1BAQX-mLTiJisV8jbI-0xFYFepX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_12,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 03:28:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170630

Hi Alex,

Why must TEMPLATECONF be under a layer?

Regards,
Qi

On 8/31/22 19:13, Alexander Kanavin wrote:
> specifically that ../../layer.conf exists, and that second-from-last
> component in the path is 'templates'.
>
> This requires tweaking template.conf creation in eSDK bbclass, as
> we need to ensure that the path in it is valid, and exists
> (which may not be the case if the SDK is poky-based).
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/classes-recipe/populate_sdk_ext.bbclass | 3 ++-
>   scripts/oe-setup-builddir                    | 5 +++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
> index 56e24c4eed..925cb313fc 100644
> --- a/meta/classes-recipe/populate_sdk_ext.bbclass
> +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
> @@ -438,7 +438,8 @@ python copy_buildsystem () {
>       else:
>           # Write a templateconf.cfg
>           with open(baseoutpath + '/conf/templateconf.cfg', 'w') as f:
> -            f.write('meta/conf\n')
> +            f.write('meta/conf/templates/default\n')
> +        os.makedirs(os.path.join(baseoutpath, core_meta_subdir, 'conf/templates/default'), exist_ok=True)
>   
>       # Ensure any variables set from the external environment (by way of
>       # BB_ENV_PASSTHROUGH_ADDITIONS) are set in the SDK's configuration
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 5d644168cb..bf832ee0ca 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -61,6 +61,11 @@ if [ -n "$TEMPLATECONF" ]; then
>               echo >&2 "Error: TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
>               exit 1
>           fi
> +        templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
> +        if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir != "templates" ]; then
> +            echo >&2 "Error: TEMPLATECONF value (which is $TEMPLATECONF) must point to meta-some-layer/conf/templates/template-name"
> +            exit 1
> +        fi
>       fi
>       OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
>       OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170101): https://lists.openembedded.org/g/openembedded-core/message/170101
> Mute This Topic: https://lists.openembedded.org/mt/93368468/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


