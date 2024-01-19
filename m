Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0C1C47DD3
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 03:28:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13716.1705634925112366275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 19:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=G+2oOuzz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1748b1ad81=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40J3RlFd019251
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 19:28:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=O3z6L3Krvo/YiuQsdikOnpancOWIvJCwEkX1CuoJCwM=; b=
	G+2oOuzzXS1/zy1oczRM7fvPfOXGm2/vW+PYBz4k1Ru+ECQwmszpvlrc8/BSDUDt
	suFir2S+kHgak51XMoN4dzLzbBJ8N3PBu7nS+FS61SrsQ9QY7VIliiOwYnQP4VZF
	DekGYj5JYlz6ZCEndB3gOPY7OH3CgehUoRkgGmQ82BgV3no+lymTtWS3JKHxEHk0
	lwS9JSiXGePwEZ3bbvxafdXZnQ6UCgVI5nKI7EqCDgjpRPB89iN4/xbj+VsFp3fQ
	rJ1Fb6bAB/1Y4zLzZzk9Meei8d7XNbTycBXAfjOXhZmT9r2F0gN+ExlBwQEPJJmj
	tUla86l8mpIDJr52MSPBoA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vktwkp726-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 19:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivDoS5GnyMih1ekk5yz84Qt5jganjm31gKiouFJEDkhr88zHtpGC9D08V5fbQaqUNNC6pcUgmO42F81ZUX/GP3WErZmsXrzLwoMqjNT6Yoks7SumrPtbWycfNpUcLYg7nUbeCMTGrPacCzkJCQTelup2B+zyNQHsnkz3/SQ6REPMy+EJdjW6xZJpQ9s4/FhgO2yZhdELasucxFzAAgJ2C7JCy6iLegqHcVEWko7KTQ/WiAXF9X53TZbwuewTBh7MPqaMeuNuCwO/RKD4NeDUbLK1cMHGh0Y+77jen0KV0Ku7V0UjDkYZBRlyXNpRWivsfc59BzZtvurJV5K2ruN/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3z6L3Krvo/YiuQsdikOnpancOWIvJCwEkX1CuoJCwM=;
 b=JR70LXx4bB5ZJ5ckkrYh9V85MU3qtXS7kbX0Z2osdTZsWJbZ1oNYhcYmhy5g89XlRiFTHz3x0v2WOHUoqYuRAF+zNJ3r16vA1Emx1y23QHUzt6kIifjiy/dEgsnI/z0Q6R4A8oKm92hp3oNXKd6n9uDDZUjuMpw/0XjkZdpO/PQRpd1JRABvJ9BaKOF2RVjjD17SB3Ec2/VEp2aKxt39QIFEMuvp/Yypi7URh6b6FljAyYdrmuKyvnWhtVDRhTvBQvgF5hCta6Hp4P4KDOt5uQOdq3g7p8hcYiW+yfk7yL6m0zDZwMAdY8ZogWLmrURHIj9qLGc5vVjWaJlOPNkDWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 03:28:40 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 03:28:40 +0000
Message-ID: <b79b6994-6516-4c42-46ef-7d6a583600fb@windriver.com>
Date: Fri, 19 Jan 2024 11:28:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] devtool/standard: avoid KeyError
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20231226044457.3699093-1-Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20231226044457.3699093-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0149.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::34) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: c1085cfe-1482-483f-ac8b-08dc189ebad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rEQv4Ofxd+9NtuoTbIzW8f1OQD+J3huhonRKwO7tT1MdmpYtSDqJfuNkNQR1rssnUczsPCLCA2Fx6I5jW1AYI0TOr5KjDNmdO17BGLdW9JtA9LJ5ueMorHvMbXO1M+vGjaB0Pl/26XTeEx28jfwL48vGhCQsme2m1IGCi7xFlW8EhXEk9CDRcRQUfEkz0Fq9ilVGwtrAaLySm6qXU2Bi5MGf5WlbKbvudEWZdveUckv43l8HsxRdxfa6oiplc0/VJsXmxJ90CEIT8VTQ7Hdw2M/Lm9jjujLd7349adniEZm+BRcU7XQ9yH263eExr/0unAyd4r3FESCDWyTyR7UtD5vLbtZNTLI/KSuhaPlxZyHpm1a0Qe+1Di5LgxzBfbc/ES6xV8dQAZ/JsGMaeEHeLuQDuZDWy3SoxXn2LjT4+8n5MbtKHCbQoWpvN3lBopaS9fVzFJEMldR+sYSVJ+5wk3nQahcIpbTGFVsfbJFjLPPhM4Wprh+iRQqVARZOfX6rhWW4R46Po2o6SbTZIIEqL7yg2BYs1VOHkp65b8GUdkvvDP5CQndvjH7mFzW92SBMpoB9cdKmdwBEipPZWHHu8ONKSjpWNKzH2/NNpIfqMtcnYWTaJmENIows9dQtfbFHx586JcqCUy/HGBNXrCPKS1oSJ7k2svAD64bGaMq8pPvi3Ltd7aOac5OrQNA5nJEO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(396003)(346002)(136003)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(53546011)(6512007)(2616005)(26005)(478600001)(8676002)(5660300002)(41300700001)(6666004)(6486002)(966005)(2906002)(316002)(8936002)(6916009)(66476007)(66946007)(38100700002)(66556008)(86362001)(36756003)(31696002)(6506007)(31686004)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bCtNUjc4Z2NHRlpmR1VLM0ltQSt6eHlreER1ZVhrQUZpSmNrZ05zVEhTMkZO?=
 =?utf-8?B?Q2hPT0wwS01aajZJS1Y5cmkrVUgyekN4REFFWitKTUlJckJxZEF1REZwamYy?=
 =?utf-8?B?N0p0M3Z3K0gvTHl2V0EvMGFjTUJIZFlDTmt2L0Z2Smh6a1pVTU53RkIrQ2R4?=
 =?utf-8?B?eEI2ZlV4TXJOV0gwS09rc2xobUgrdmRvdHM0aGZCMnpGU1ZJL21TZm1pZmJ5?=
 =?utf-8?B?WVpjYlhZUENOK3RzdEFlZnQvMjdGcnQwcU16ZGdBRk51SmJWTnRuNkNPaS9M?=
 =?utf-8?B?VytLcm9kNWgwa1orTjlxVkI3WjY4TFhKTmNlazNRSC9Md3RNOUkyTlNUbjNM?=
 =?utf-8?B?L1h1V3JKOUtEeW5odFhJN1ZSK1lqU0xtaDBwaHA1d1poektnTytGTDYxKzJk?=
 =?utf-8?B?RERKbC9halByU2NCczMxUXB3WjRTTWhERGdxN3U0aDF2SDhwdkV1UlFhbTg0?=
 =?utf-8?B?cCtlalQ1SHp4bXdodFE5QUFaeGUyMFBzUW9pRjF2UEVDZWZqS0E5aWl2anJL?=
 =?utf-8?B?UXN5WmhzYUF3bDY5TVpwRVBNRHBaeTgwVkQzL3ZaKzRaY3lrcTlsdGVjM2Rn?=
 =?utf-8?B?MHZ0WW9EckMyWXZodmpLWk1wcko1OTRlWlNMazNFdjh0QTZTd2xnZmhzaUhP?=
 =?utf-8?B?M0FGUGhYZWs3K1ZKd3lVYmpGVGpOS1l0ckhWNVQ1ZlA4U0czQkxWT251YzdL?=
 =?utf-8?B?M2VEdjVQREFwb3ArRVBrMzREbElsSG1CWkIvRzV4RllFUXZtOW8xV3FSU2RL?=
 =?utf-8?B?VDhvbmc5b3UyVnIwTzZRS0drd3RGdFdNVCtsZ0VZVGxLVEorNUl4T3V2STc3?=
 =?utf-8?B?MHIwVFA1ZStYRzgwZEU1c3d0eG44aFkwZ3pMVldtTjdhOFJqb1IxNkd5eVJX?=
 =?utf-8?B?czJIMkRLc1g2R0k1WFMvZ1AwdFFTNGNyOTlOV2RWU05rTVREdXBLS05wU1JJ?=
 =?utf-8?B?b0FhdkdMK0FvSzNadnd1UkJXQUNoSlgwNFJHL3Jpc0p5K2JYZEZFbmltS2Nm?=
 =?utf-8?B?T0k0bEJzWElsRi9EM0dLakVJRjFBbjBJaG1LN1d2TDZTSE15SG1yeUlJOFlh?=
 =?utf-8?B?bk9JZmVFNEJiaFRETUNBbTIrTE13RlFZVWlGb2pnWmVabmVXOG96WGtZR0Vt?=
 =?utf-8?B?QkR6eWxha0MxUGZrNno0UWhaMHIxYzZkTzZXZ3E2RE9yeHUzNmc5OW1jSHdR?=
 =?utf-8?B?aW8wb3lzb1IrNU45NFlvZTdoa1dxMzlQeCtVS3hzMzNzM0IvZ3R0cnhXU3o3?=
 =?utf-8?B?MkY2VFBQcjIyODdXK0xEa1F6MEU5aGM5aS9LR1I5ZXdCaGIvVTNiWW5xR3lF?=
 =?utf-8?B?UkIzZ1F2RTZRc3VyUWFXTkNkajNGb0NhSDlwcW0wNE82MWp2UjcvYTEvWVB0?=
 =?utf-8?B?b1JDVUtCSTB1MWdxN3E3K2xCbjQvOGhmc0hidE1YQmUwZ29XV0NnbFp3dDlX?=
 =?utf-8?B?Q2toN25QSFJXMVVFdG1UekVMbjdKZUFHcDU2UjN0cUMrUG1FYmo2WC9TYkJI?=
 =?utf-8?B?VDJpbGRQR2ZVSmxHNW9MRFNmdUhmcHBLK2xoREJaL2ZXbThCSFNSM05pMG9N?=
 =?utf-8?B?TjhJTGcxOHFkUE13Z2hXVzZEcHRLSkxCaDhjVnVpL0ZGbjg1bTNJelJhNlVE?=
 =?utf-8?B?QlJBUWdUY0VIU2d5QnAyUitNYVo5ZU0wSWpoNmFmcTRrcncxQWFVQ1pvcHZY?=
 =?utf-8?B?enRHbnV5YzJZYkxpV2ZwZnVOREFXTnhDd0RGZEU3UGpkM2xHa1ZvRGFjb3Ni?=
 =?utf-8?B?eStPZnJGQUU4VnpkU0RXUXVKY3NSWHU4cWlNUUZQWHMzencyUUVQY1p1cU8v?=
 =?utf-8?B?WkRMbFFsUkJUelVZSDkyTHd0NEQ0c3JhVzNRcEZSdEFjQXpydnE1OEVrR0ZZ?=
 =?utf-8?B?b0c3UlU1RUM4aTRFOXR6bHhZejE4Y3VtakJHM3kyUEl0WU92RllNQkk3ZUZu?=
 =?utf-8?B?aE02SzR0TnlCVkhyWmY0b2o5czBNOWR2cHRMT1lacU51MEc3YTFDQlNyYmEv?=
 =?utf-8?B?b0JvVHdCcXVjdjlFRHNic2xZOWdRbFpHaDlJMXgzT2Y3aWVpK2o4V2NwQXI2?=
 =?utf-8?B?QnNCS2xSUW0rOURKV1ZFL2F5S1Y4c042akVKNmpWbUpBV2o2NUtDVnFuSyts?=
 =?utf-8?Q?m4sJUk5smCX5WJJJXoUVl+zme?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1085cfe-1482-483f-ac8b-08dc189ebad4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 03:28:39.9246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xA3qyYXGAQ2IKaloyI2+LmtjptrAWhBe21OyTdct2nMjGE3+IBoCDQ8E38c0ezcKJTGPrcIN60kelO4okBqfdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6789
X-Proofpoint-ORIG-GUID: jXzfUWdSSmgQStDEzYyHtlL_7O2J0-pz
X-Proofpoint-GUID: jXzfUWdSSmgQStDEzYyHtlL_7O2J0-pz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_12,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=648 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401190012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 03:28:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194008

ping

On 12/26/23 12:44, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The initial_revs["."] does not have an initial value, resulting
> in the following error:
>
>    KeyError: '.'
>
> The problem could be reproduced by running:
>
>    devtool modify -n systemd </path/to/my/local/systemd/repo>
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   scripts/lib/devtool/standard.py | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
> index 559fd45676..5d9b86ed6a 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -905,6 +905,7 @@ def modify(args, config, basepath, workspace):
>                       (stdout, _) = bb.process.run('git rev-list --reverse devtool-base..HEAD', cwd=submodule_path)
>                       commits[submodule] = stdout.split()
>           else:
> +            initial_revs["."] = None
>               if os.path.exists(os.path.join(srctree, '.git')):
>                   # Check if it's a tree previously extracted by us. This is done
>                   # by ensuring that devtool-base and args.branch (devtool) exist.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192906): https://lists.openembedded.org/g/openembedded-core/message/192906
> Mute This Topic: https://lists.openembedded.org/mt/103366660/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


