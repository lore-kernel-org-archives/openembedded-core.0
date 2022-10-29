Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF51C38A02
	for <webhook@archiver.kernel.org>; Sat, 29 Oct 2022 01:04:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1967.1667005486225757432
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 18:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=E+ViU5Jw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83011fc69f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29T12gwI012388
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 18:04:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nYOs1+gbmMf8qFkd7tYpYgo8cDpdVPjn+wdJvpcBu88=;
 b=E+ViU5JwzGolV0jMN9TuKk6aWqD9U4gxwcIMrUNndnKMUNgStcwbB8ToJ5sXTaTIYSEG
 J1tuyxRlVd4pTzmJS3qqB9NTx6QO5HcOS49nBAFRYrh40AjUOQFdcMu9/B7C9ZENGiby
 gs6/saqTPmCYrgaB8AoU6mdsyqr5r0n3VnWkSeVvY4nLVzWNMci/ffzXLDJS0rmOtVrm
 Td8WTjSkc+rfbm/np6qI64PH3ob7Lxx4JbRQCjlxqeCji0TbmVX/3MOnYspLCq2fudu2
 5Adi/zAvLveZWpiFc0uWL9tZhTK57AEajopMQQHXOwZxoDw8q7vuCdScvBaWWLNNQrw1 gg== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg0r21g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 18:04:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8ewU3s4iWXZFw8IbNn7XZfVjSZ2rtaJ0SxWQh72TMVJcwUY+1kSdPDroLrEEdoKPPX5ea9HCazmKRa4ooMk5F/YKQ2cLWiY7SyQ1OSFp1IqZSBLiL9mEHhoAIiUiO07WksrRjl+2JGIzFvGaghLpJU7omlaf2Iok/UGrpndiraUnVMXhzcgvCtVv8v6oxqS7tbjofOUDiG6TfhJvISuBvqIhexSROp27/1n1ADBN0vVVAVLV0d9jhslvCVViTAT43B6psDpl6U/LstjtJP9mkeVvntieX3XTUViNRJRV6TrvVZvPPH2tlqeFbk4ecw24fAq7J5jONp2nTtJTZtjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYOs1+gbmMf8qFkd7tYpYgo8cDpdVPjn+wdJvpcBu88=;
 b=b7mUSPyQxO9n87caQmle1CqZjON7PER+m4Q6aoHzPWZzJlA8Ol9TxZl0o8BsJWQRKTdYMFOQoE6YAZp7mpLYMTpqlI/5o0mJwxqew2qN9sVfGtzvStF8g4Q0i5eA4PuumWW0ubC0VjA/1svOvS9fpNs247mLTEL+GZQOHI3uv4iZxJBvNMQR90/AzizJQV1mqDUe+4YwWZZTTjoJNJ6wgjEUAw8ZA4qeyDyEOiYXnBVSYLqoMyfin6V3wia1stkUUSk+wRzTLZEcD4tqdUcv7jRBZ+7Z4EiWGWz90H3DAFpAC4VT5sYL49Id0tS/nWMZYVDrgLBxp1FwgGQIt4geTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Sat, 29 Oct
 2022 01:04:42 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043%6]) with mapi id 15.20.5769.015; Sat, 29 Oct 2022
 01:04:42 +0000
Message-ID: <1525bd58-edbe-6ab5-e000-75ad992ab12e@windriver.com>
Date: Fri, 28 Oct 2022 21:04:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-secure-core][PATCH 1/1] libpam: fix CVE-2022-28321
Content-Language: en-CA
To: Archana Polampalli <archana.polampalli@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Hari.GPillai@windriver.com, narpat.mali@windriver.com
References: <20221028164946.2494540-1-archana.polampalli@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221028164946.2494540-1-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY5PR17CA0067.namprd17.prod.outlook.com
 (2603:10b6:a03:167::44) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: fe138508-afa7-480a-af46-08dab9498f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M3bpD1ruCLIcb5Oma39dHdl6q56crOUs0f2bwXyPBZQIaCdedWA96DClOcOqyNtir9DngV7kly4hm549K3TTu1pNWzne/dAHwRZKVAgZv7nyo05nLij1U6wyrBpDJcozEy5F2F8R06ZOUfPvx91/6/bAaWrPmP+2ENqVcLdkxXIuNaYOrYReqcUKmix0lJ6d5uSeOELk4N5rre/j1fZ4Lh8/khTZp4uYwoSYx+3rY7l1gmAdCg1+TKsIwGh/hK30Tivvw+DHJPmRbeMYym8IHq56mAVQkXSbs0tTKMMiHVeZRy42JoNoNe03T4dEqSQmygVTdbryswqyje0jDMQXj2Y4voycfAYAISjDHEcvGMcLnjYV+A0pG5fye+bjrZ3b4iDGohcQE0OMt1jAM97dK4/vZpaFNFRxGjqD69hncQQNKRJ73q5hasAWQeLjNk02+zw24T0KByxxZHdsIKZNhC+l2w4/ZwKmCGvQtNIGbcIehSJTrtHVjsxdyIxUoHbsrrbWwTcnMnw08VnUFssk6+7ooeuejrPPndzbX5dlPw46JisiZ1GXQAy49Bck+kgK8RR4siaCU1tZDgziyEg+SqsePH+ujoHShGi7Jq3X/l8S/e1jqycg4UJ6/dbf6CwrGR3S3IIGV7OrKiqfG6LwKt/VuakjSTt6ZBs9+bJnKZi8SpacDSU276X6irrUoiZ+ahSvcF4t5xg6rCgrlohNXwTYb48pazFWFM1aP2wA3Sug82N8o1o6zK7BcMzsCX7bXJ0qHyfPdKDzgfolRtDyLOiyt9pTR201MgJffrpEng3O/36iqcSLnREYRr3jUlrD+0RtxTXvO2okuugFkxHHZHsHSaygbMkH+GoQ3C/16x6gica/6kha816GWr/SMLSv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(136003)(346002)(376002)(396003)(451199015)(8936002)(2906002)(4001150100001)(316002)(66946007)(38100700002)(66556008)(41300700001)(5660300002)(66476007)(4326008)(8676002)(66574015)(2616005)(186003)(83380400001)(86362001)(31696002)(478600001)(966005)(6486002)(53546011)(6506007)(6512007)(26005)(6666004)(107886003)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1I3YnJONGpmbXB2WEVHVlBheVlydXlnSXpRQVF2TGpmVWRsNmVneUpydUNO?=
 =?utf-8?B?elBkdGJBZ2xCa3orM2tZaHpzTlBDaFFQMnNCSWlQUlJHVkdWMFlXNDhyQjBI?=
 =?utf-8?B?a3Z4dndhRjVPRXkzL0ZFZ1lzRTN3ODVsRDUyMnJLeFlmOE45cFBVeE03UFd0?=
 =?utf-8?B?akYvWHNKeFprNTB4V25jeVRjZjd6aEs3S1ZobXpKZG1ia1VSVk9vaVVVYUgr?=
 =?utf-8?B?Qjc2VjBEYnBjZzdkNi9pSTJwMjNDZGN0c0VuSWxFRlRsTmN4RTlRbFVoZ0tT?=
 =?utf-8?B?RitXZUI3ZHBDZVpycjU2dW5YR2NOSmRRcmtvUGNXUWNmcGJ0VWZNVzZGYnVJ?=
 =?utf-8?B?RHFtT0ErNWZ5dEZvYVdINUJ5cVpEZy9BOVFDR1FOVlN3WFIxVVYrWGRReUJX?=
 =?utf-8?B?eHhnRndZeDNwcDl5SkhJcmJMblVZd3NydlpLYzhrNGxMS2xmeXFiTktVaG1Q?=
 =?utf-8?B?MW8zNFdYRlBBREptQUpZa0FuTldTMmVkd1ZOS1JNTEpzSUR5UkJGc3d1Uy8y?=
 =?utf-8?B?MEhVSzRFUVhaYmh1L0l3ODRPbDBQS1hvTVlyYkRvbDVkMVFzekJyYXkrckd6?=
 =?utf-8?B?T284NlRlWlVPZ2Yyb3QyM2p2OFA0WEx5Vm9oc3lVR1drNHczK3F5Qm1Dbi9W?=
 =?utf-8?B?TmVHWHdzcWJub1dIY29Kc2dYcExQblJVWmM3NUFxNVI3MFpjSSsxVFN6UStj?=
 =?utf-8?B?dzdNTFd1K0F1endkL0xYV0dwQjVaaHUwZ1FSTkdjU3VuMVErUDFHdWxtZ2lK?=
 =?utf-8?B?ZzJia0F3TVJaSWN0ZEwzNVpidjZnWU1XV2tyc2g2dTVkVnlmbXlsbHFuaEJS?=
 =?utf-8?B?OGM2anRGYWRGOUpNaTZneUw5WU1UVWcySm5OSGZORFB4bDV4ZkE2ZFQra0RD?=
 =?utf-8?B?azEySGlyY2tJMHV3YSsyN21ZSkVDSVR4T0tCRHNNY0FrOUJxK2RYZFVDZGJF?=
 =?utf-8?B?aU9LU2FiY0l6T1FuWjBWUm9PbjU4MTFtYVp4dHRjTEpwWGU2azhyZDQwckRR?=
 =?utf-8?B?anhnMXF6VmFseVlyd2ZMeWlXMEJ6MEJ0aXlMdU5PQlAxVzFGSmpWa3BnOE9n?=
 =?utf-8?B?RDV5OTlCVVpDdVE3VjRXQXVpc3Nrd1lMcGxxRE03T2pRMStSeWhIK2FZcUFL?=
 =?utf-8?B?WDVaTHM0bDZkNWthYjhPLytsS3cwdnJIcHhzTWRCeDRTQ2ZoVmJVTk9xbkhB?=
 =?utf-8?B?Y0JkUTlTODlGYjJOc2xFTUcwcDVTQkpyQW5KKzVPcFNxZVArQ3pLZ3Q2bmJH?=
 =?utf-8?B?Zk5rN3h4SEFIVjRkVDlIQ3NwUWRUWlZibTdnYTc0andxa2l2T2hvdDBDdTNP?=
 =?utf-8?B?TjBHTU9qUTF0bndHOFFIdkdndjJOSGlZMDY3VnZpbGZleWxLajI2bDZEaDYv?=
 =?utf-8?B?ZlpnY1lTM3dBUC8yWFhWZ0JTMnl0ZG5PeVRrVGtBeWRlRjBlWG1ISGpsTThR?=
 =?utf-8?B?TmNWRjRQcXpYNUVMM3BoTWkvZW9RZEtMb0hSOWlvSWZZaGVzK2RkZkRNR3pr?=
 =?utf-8?B?bnptQStuQUlnT013Y1U0bTVkZjdyekdxbVlidHYzYkI2QlloazQrVG5BZWRI?=
 =?utf-8?B?cGFUMjZiZit0TktFUGZzaWM0UndLQ1laOXNzRUZmQXY5RWtqUTlCdDRQeUNz?=
 =?utf-8?B?YnpyU3d1NWswN1dVUXdnelUxOERva1FBZEluS1B3R3F0WndQTkxHaHlzbThR?=
 =?utf-8?B?WnRMVll6MnFROElEV1dXak4vcDN1QjRvQUpyS1cyOGJ6cU1WaGhVSXBVUVRE?=
 =?utf-8?B?L2dJZHBLYWtFSG11WC9OdDJ1Y2pjcFI0S1ExS25HQjVPUndGOGRoZ2pLK1Ft?=
 =?utf-8?B?L0x6V0N4aVhBOTdaL1YvYk9mZjF5VUpTS3FsVjFWVFR1NTlnSnNJR3c0Ukd5?=
 =?utf-8?B?OUlWLzF3akJUNklkaXp5K2lyaEQ1K2FvSVN5cDh5d1BuTXhBWmtrL2txS09R?=
 =?utf-8?B?cG9VQldlUUsrdDZwdk90VTlYcTRnRUZuYWMxdk1lRUxjMFBqUk44blVsakh0?=
 =?utf-8?B?a1ovUmo2V2Z1dmJwbDVhcWlMZWcwb2Q1RWVnL0lCQjNVYXdBeDNWdlVFNVJJ?=
 =?utf-8?B?MjIvNWVNc1k2ZjRPUE1CVHNuRGNIVDVyam5pQXVjbkRQQ1dybkRIdUJCb0RO?=
 =?utf-8?B?dTdtY25aSXh0aHRIb1QzSkNzY2dCVytzS2V1VkxwNG40RXV3dVZGcUNZMTgx?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe138508-afa7-480a-af46-08dab9498f5c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 01:04:41.6876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DKUmxpjk8ZNxMCbQ7D5MiKYoQ0fo8/SkVcDZox84LeL18gKME4p6h1D+vrntgI2AbPPAXggRB+Y+tpR+y9UoKGXx9QylrGlSpM/8mUT9OY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
X-Proofpoint-GUID: u5LNvepXB2ziXHUVvXbS-ocw5wvrCk8M
X-Proofpoint-ORIG-GUID: u5LNvepXB2ziXHUVvXbS-ocw5wvrCk8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_10,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210290004
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 29T12gwI012388
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Oct 2022 01:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172276

Subject:
 =C2=A0=C2=A0 Re: [meta-secure-core][PATCH 1/1] libpam: fix CVE-2022-2832=
1

but,=C2=A0 this recipe is in oe-core.

Please ignore this CVE fix as well.

Archana is learning how all these layers work.

../Randy


On 2022-10-28 12:49, Archana Polampalli wrote:
> The Linux-PAM package before 1.5.2-6.1 for openSUSE Tumbleweed allows
> authentication bypass for SSH logins. The pam_access.so module doesn't
> correctly restrict login if a user tries to connect from an IP address
> that is not resolvable via DNS. In such conditions, a user with denied
> access to a machine can still get access. NOTE: the relevance of this
> issue is largely limited to openSUSE Tumbleweed and openSUSE Factory;
> it does not affect Linux-PAM upstream.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-28321
>
> Upstream patches:
> https://github.com/linux-pam/linux-pam/commit/08992030c56c940c0707ccbc4=
42b1c325aa01e6d
> https://github.com/linux-pam/linux-pam/commit/23393bef92c1e768eda329813=
d7af55481c6ca9f
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>   .../pam/libpam/CVE-2022-28321-0002.patch      | 205 +++++++++++++++++=
+
>   meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
>   2 files changed, 206 insertions(+)
>   create mode 100644 meta/recipes-extended/pam/libpam/CVE-2022-28321-00=
02.patch
>
> diff --git a/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch=
 b/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
> new file mode 100644
> index 0000000000..e7bf03f9f7
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
> @@ -0,0 +1,205 @@
> +From 23393bef92c1e768eda329813d7af55481c6ca9f Mon Sep 17 00:00:00 2001
> +From: Thorsten Kukuk <kukuk@suse.com>
> +Date: Thu, 24 Feb 2022 10:37:32 +0100
> +Subject: [PATCH 2/2] pam_access: handle hostnames in access.conf
> +
> +According to the manual page, the following entry is valid but does no=
t
> +work:
> +-:root:ALL EXCEPT localhost
> +
> +See https://bugzilla.suse.com/show_bug.cgi?id=3D1019866
> +
> +Patched is based on PR#226 from Josef Moellers
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-28321
> +
> +Reference to upstream patch:
> +[https://github.com/linux-pam/linux-pam/commit/23393bef92c1e768eda3298=
13d7af55481c6ca9f]
> +
> +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> +---
> + modules/pam_access/pam_access.c | 95 ++++++++++++++++++++++++++------=
-
> + 1 file changed, 76 insertions(+), 19 deletions(-)
> +
> +diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_=
access.c
> +index 277192b..bca424f 100644
> +--- a/modules/pam_access/pam_access.c
> ++++ b/modules/pam_access/pam_access.c
> +@@ -637,7 +637,7 @@ remote_match (pam_handle_t *pamh, char *tok, struc=
t login_info *item)
> +       if ((str_len =3D strlen(string)) > tok_len
> + 	  && strcasecmp(tok, string + str_len - tok_len) =3D=3D 0)
> + 	return YES;
> +-    } else if (tok[tok_len - 1] =3D=3D '.') {
> ++    } else if (tok[tok_len - 1] =3D=3D '.') {       /* internet netwo=
rk numbers (end with ".") */
> +       struct addrinfo hint;
> +
> +       memset (&hint, '\0', sizeof (hint));
> +@@ -678,7 +678,7 @@ remote_match (pam_handle_t *pamh, char *tok, struc=
t login_info *item)
> +       return NO;
> +     }
> +
> +-    /* Assume network/netmask with an IP of a host.  */
> ++    /* Assume network/netmask, IP address or hostname.  */
> +     return network_netmask_match(pamh, tok, string, item);
> + }
> +
> +@@ -696,7 +696,7 @@ string_match (pam_handle_t *pamh, const char *tok,=
 const char *string,
> +     /*
> +      * If the token has the magic value "ALL" the match always succee=
ds.
> +      * Otherwise, return YES if the token fully matches the string.
> +-	 * "NONE" token matches NULL string.
> ++     * "NONE" token matches NULL string.
> +      */
> +
> +     if (strcasecmp(tok, "ALL") =3D=3D 0) {		/* all: always matches */
> +@@ -714,7 +714,8 @@ string_match (pam_handle_t *pamh, const char *tok,=
 const char *string,
> +
> + /* network_netmask_match - match a string against one token
> +  * where string is a hostname or ip (v4,v6) address and tok
> +- * represents either a single ip (v4,v6) address or a network/netmask
> ++ * represents either a hostname, a single ip (v4,v6) address
> ++ * or a network/netmask
> +  */
> + static int
> + network_netmask_match (pam_handle_t *pamh,
> +@@ -723,10 +724,12 @@ network_netmask_match (pam_handle_t *pamh,
> +     char *netmask_ptr;
> +     char netmask_string[MAXHOSTNAMELEN + 1];
> +     int addr_type;
> ++    struct addrinfo *ai =3D NULL;
> +
> +     if (item->debug)
> +-    pam_syslog (pamh, LOG_DEBUG,
> ++      pam_syslog (pamh, LOG_DEBUG,
> + 		"network_netmask_match: tok=3D%s, item=3D%s", tok, string);
> ++
> +     /* OK, check if tok is of type addr/mask */
> +     if ((netmask_ptr =3D strchr(tok, '/')) !=3D NULL)
> +       {
> +@@ -760,54 +763,108 @@ network_netmask_match (pam_handle_t *pamh,
> + 	    netmask_ptr =3D number_to_netmask(netmask, addr_type,
> + 		netmask_string, MAXHOSTNAMELEN);
> + 	  }
> +-	}
> ++
> ++        /*
> ++         * Construct an addrinfo list from the IP address.
> ++         * This should not fail as the input is a correct IP address.=
..
> ++         */
> ++	if (getaddrinfo (tok, NULL, NULL, &ai) !=3D 0)
> ++	  {
> ++	    return NO;
> ++	  }
> ++      }
> +     else
> +-	/* NO, then check if it is only an addr */
> +-	if (isipaddr(tok, NULL, NULL) !=3D YES)
> ++      {
> ++        /*
> ++	 * It is either an IP address or a hostname.
> ++	 * Let getaddrinfo sort everything out
> ++	 */
> ++	if (getaddrinfo (tok, NULL, NULL, &ai) !=3D 0)
> + 	  {
> ++	    pam_syslog(pamh, LOG_ERR, "cannot resolve hostname \"%s\"", tok)=
;
> ++
> + 	    return NO;
> + 	  }
> ++	netmask_ptr =3D NULL;
> ++      }
> +
> +     if (isipaddr(string, NULL, NULL) !=3D YES)
> +       {
> +-	/* Assume network/netmask with a name of a host.  */
> + 	struct addrinfo hint;
> +
> ++	/* Assume network/netmask with a name of a host.  */
> + 	memset (&hint, '\0', sizeof (hint));
> + 	hint.ai_flags =3D AI_CANONNAME;
> + 	hint.ai_family =3D AF_UNSPEC;
> +
> + 	if (item->gai_rv !=3D 0)
> ++	  {
> ++	    freeaddrinfo(ai);
> + 	    return NO;
> ++	  }
> + 	else if (!item->res &&
> + 		(item->gai_rv =3D getaddrinfo (string, NULL, &hint, &item->res)) !=3D=
 0)
> ++	  {
> ++	    freeaddrinfo(ai);
> + 	    return NO;
> ++	  }
> +         else
> + 	  {
> + 	    struct addrinfo *runp =3D item->res;
> ++	    struct addrinfo *runp1;
> +
> + 	    while (runp !=3D NULL)
> + 	      {
> + 		char buf[INET6_ADDRSTRLEN];
> +
> +-		DIAG_PUSH_IGNORE_CAST_ALIGN;
> +-		inet_ntop (runp->ai_family,
> +-			runp->ai_family =3D=3D AF_INET
> +-			? (void *) &((struct sockaddr_in *) runp->ai_addr)->sin_addr
> +-			: (void *) &((struct sockaddr_in6 *) runp->ai_addr)->sin6_addr,
> +-			buf, sizeof (buf));
> +-		DIAG_POP_IGNORE_CAST_ALIGN;
> ++		if (getnameinfo (runp->ai_addr, runp->ai_addrlen, buf, sizeof (buf)=
, NULL, 0, NI_NUMERICHOST) !=3D 0)
> ++		  {
> ++		    freeaddrinfo(ai);
> ++		    return NO;
> ++		  }
> +
> +-		if (are_addresses_equal(buf, tok, netmask_ptr))
> ++		for (runp1 =3D ai; runp1 !=3D NULL; runp1 =3D runp1->ai_next)
> + 		  {
> +-		    return YES;
> ++                    char buf1[INET6_ADDRSTRLEN];
> ++
> ++                    if (runp->ai_family !=3D runp1->ai_family)
> ++                      continue;
> ++
> ++                    if (getnameinfo (runp1->ai_addr, runp1->ai_addrle=
n, buf1, sizeof (buf1), NULL, 0, NI_NUMERICHOST) !=3D 0)
> ++		      {
> ++			freeaddrinfo(ai);
> ++			return NO;
> ++		      }
> ++
> ++                    if (are_addresses_equal (buf, buf1, netmask_ptr))
> ++                      {
> ++                        freeaddrinfo(ai);
> ++                        return YES;
> ++                      }
> + 		  }
> + 		runp =3D runp->ai_next;
> + 	      }
> + 	  }
> +       }
> +     else
> +-      return (are_addresses_equal(string, tok, netmask_ptr));
> ++      {
> ++       struct addrinfo *runp1;
> ++
> ++       for (runp1 =3D ai; runp1 !=3D NULL; runp1 =3D runp1->ai_next)
> ++         {
> ++           char buf1[INET6_ADDRSTRLEN];
> ++
> ++           (void) getnameinfo (runp1->ai_addr, runp1->ai_addrlen, buf=
1, sizeof (buf1), NULL, 0, NI_NUMERICHOST);
> ++
> ++           if (are_addresses_equal(string, buf1, netmask_ptr))
> ++             {
> ++               freeaddrinfo(ai);
> ++               return YES;
> ++             }
> ++         }
> ++      }
> ++
> ++  freeaddrinfo(ai);
> +
> +   return NO;
> + }
> +--
> +2.37.3
> +
> diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-e=
xtended/pam/libpam_1.5.2.bb
> index 081986ef43..dabd3256c8 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.2.bb
> +++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D "https://github.com/linux-pam/linux-pam/r=
eleases/download/v${PV}/Linux
>              file://0001-run-xtests.sh-check-whether-files-exist.patch =
\
>              file://run-ptest \
>              file://pam-volatiles.conf \
> +           file://CVE-2022-28321-0002.patch \
>              "
>  =20
>   SRC_URI[sha256sum] =3D "e4ec7131a91da44512574268f493c6d8ca105c8709169=
1b8e9b56ca685d4f94d"


--=20
# Randy MacLeod
# Wind River Linux


