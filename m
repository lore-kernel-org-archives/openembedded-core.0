Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C099ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 19:19:26 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web09.1878.1663096764256829252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 12:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=f3Weg2OR;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=6255e05756=alex.stewart@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28DICWGL013909;
	Tue, 13 Sep 2022 14:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=XYKJJSLouyi8b1BSAdHMwaB4x/NyK+iUR1eAFWR443w=;
 b=f3Weg2ORyvA04CJ2oErEpSC/K2kuPS+vpHPvfTIWZD+5HoC1jBIjTnwQ+C7xgmghKCHA
 PTOAuZ/zz56exM2O5Om0CrWHXNFHzlsfSoUYJFt+8YSYrjnby0lCjXkwiyooAS6YareB
 gpyVteLhzl8sx5LSHeddOEvYNzdJHju/eXboRp/Om5kWlpA9rs6VRw10Wav5s2WTdyH0
 nwk95HgqNEK6nEsSo8vC1iRWi+scVqxPoQDPDv3C1Wc1US8Jf1hYdW/CSoCu6qXv3fEh
 ecDDZUQ2FgsDnYHhNLW/8Nyc0nIVjSQS0OgcpAJkwCh4inXbLX21RhWlkV5KFf+aKBt4 /Q==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3jjxxh04uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 14:19:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YctjZECB6dG0evL9OW1mLvXbmUWaRzdYHbdEp+5wDW1SvVvmhs26UYAcyEVvgonJWhh4DuGMUsHfKuG1M0Go3XJlUXV4TsKSqDmtIP+VUff4/Ix+fjFlSBtUqNu4LBcA5ayrlbpcs5rfXxPDzDVOeCPTv6XfqvXMHqTUA8sLjCtERXTgdg5XrFC6HBTQMHnWn267PgS9LVTzJFOvyR889gd6jTh4U2QNxjp36w1WIIGfiYr/3u/Cw7G26um20VOXvFIo39xzt9GG2mxvABDSJtha3bnuUZs4kAPY1yKPW05eu8exwnU+xB50AtCbmo9Ttn9B4bnfQysS8tDjVTpS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYKJJSLouyi8b1BSAdHMwaB4x/NyK+iUR1eAFWR443w=;
 b=fbS+3n3rztbVeEgiop8qR+COp5sgKSbcifuGJCZ21nRZFeq6fUNwItuaa8SNT9ssgt59Bz5F0fqFrCbFvNPJe7PQNJvv8v17RTGHzOrX7ruWAo7Vsm6qPpkUqdxJUryPQGgmuVylqPZ0BtRFmxnorCZabEKz1Bppg8JDzTg2PCnLEBpvRLWM1+8zSjrFQRwcPmLB1Emx1MoPFKbU+YA688wjx5CG8HlAs+/AoDYfoOBz21iRl3dqd72RQ9aYhyWK22Fe0xY9M/2KlMDsW5BF09bV22B+oE7F+hU6u0WwnuGqTwXT5jhmV1a3h3RYROJpOoBThcHv7DdVWsFTAXyeJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYKJJSLouyi8b1BSAdHMwaB4x/NyK+iUR1eAFWR443w=;
 b=bwjt2An4KNasTcSfm7N/xE+SnJlEOqI/PCGU28oohRXbiUIqDdrz5T2RiZ2wpNDlmdLw05xtGfgtwZgXUbqEb65KqGJnFn+ISnM1IMNzpXF3I5gzedHHwPcJ/eR0unEVY0TyIPkCOfGY+fUmYJgZTg1js2vAK48fGEMegf3/xQU=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by DM6PR04MB6377.namprd04.prod.outlook.com (2603:10b6:5:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Tue, 13 Sep
 2022 19:19:21 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 19:19:20 +0000
Message-ID: <a29c5799-9964-526d-d9e3-6a4f28cb1bc3@ni.com>
Date: Tue, 13 Sep 2022 14:19:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: ecordonnier@snapchat.com, openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
        Alex Feinman <afeinman@snap.com>
References: <20220913123741.3416807-1-ecordonnier@snap.com>
Content-Language: en-US
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <20220913123741.3416807-1-ecordonnier@snap.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0021.namprd21.prod.outlook.com
 (2603:10b6:805:106::31) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|DM6PR04MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f704490-935c-4e33-e368-08da95bcdc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wHaWhTWs+5nVBsz7D5XVQp3CM5EDoxayti4OyyFDQP06bPpwzmw/E/+exi8uaoqYjcexgHGuqQUTlUgrFvEhJM+LI6D6Y8x34SVp1bgv9zAp73LK8KFnWcEH9kLMKSOs27V5CFYxhkZhso/xjRMlLyzcc5O6dV3+x8phneHjp0BzwMwRlaBkaHO5bwR+k0aAdT/Ukee7TZ9UdVatTpFEEp2OMpy2QziPDUDEoCPGaVSrAFXZjixg34RuB8fgkbFTktVg6dS4DT4CvPgipF7Tm2xUUmwN0acoPhIxFDq6p5ebPeDd9Q7jU75Ce5kxsASmVHcBAYh6dnL5OXHK1diX0Nw8QbdzrveOtRwEjNwdXsRMchnfe8cdDFoZKY5t+dQJgJfeUoRaOFbWPmCwecIcfyNUjIyQj3ksIcchDv3kxymh6679M0qi0tPEAVPJ+AUzKbc8elUOzZ6Jaub3dnKwpCvTF1BNEeZydLFfcV6U4K3QCeVDwQKjCT7I9C7Qxvs9Cke6bNn3yV/s0mfArpHmkEf6xjGsYmwu5IwzfNIr2/AbYGibZPukPtRfKLLw7I1XyONXeFn8De8BgsA/dmvLClCMGYtk99vS2k5QjqkFI3Tp1Ll6xzK/dc/sB7XlhQWBm0CDK0JQV7eZ8ok7eh/yJPQ/V9UF5sZgjTjFy8b09I1DH445ibCxmu2nan8fn/IgfkLVf+Csix1WUAY+oD71ZcWcVzcHH829kffh+bFiGsbTvdHZgzwt6DXwyqihppJfbkKih5HSytEnVDi0FGYXePdWgxaB4U0W5A4W3/a8bdLUV7oYX2OsTFEHBmfIDzNOFBLWcOsvm3kD8dIhNuO85A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199015)(38100700002)(31686004)(6486002)(44832011)(2906002)(4326008)(316002)(54906003)(8676002)(6506007)(6512007)(2616005)(66476007)(83380400001)(5660300002)(53546011)(66946007)(86362001)(8936002)(66556008)(31696002)(36756003)(36916002)(966005)(26005)(478600001)(41300700001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0JYL203dTVOdnJnYVkydmdqRms4cGFXMFRlTHc5WmszcE45Ny95QnRtc2F2?=
 =?utf-8?B?a25NV0pkYWo1ZG5pTUdFZjVZaHdsdGpTVUFhdnFrUWJTSjdrU0JObGQ2Yjk5?=
 =?utf-8?B?MXpqaTJMV3BGNDd4WCtkUHRmSVN0aUxheCtxYzN5eU5aUUdGVE1ZUzBpOVJa?=
 =?utf-8?B?SWp2d3RwNjRYazljWGZvc0Z3MFhvWUx4R3VYOHg1bXFaaVhDTUxiTnYzbHBa?=
 =?utf-8?B?ajVLOGdkWjF6ZlZQdjdYY2RyaFZLMGJXci9Cam9WSVgxTWlpZEtIUXNKb3ZC?=
 =?utf-8?B?TmJoMFBBbWYvMXJ0dXpyZk85OVNJVG5aTXdPQ201YmxMbSt3L0d4SExFNnFa?=
 =?utf-8?B?cEhENS9FeGlXRU40SU5aci9wRTRFYlg4NGFaN3pXMXJPUVVTSjkwU2FsTjVr?=
 =?utf-8?B?SE16NXlaZlNncWZVODAzOWswbkd6T09xbEo4bHpMYzAxUXNxVjlZZlI5YW13?=
 =?utf-8?B?eDdONGhIOVNkVjh5cjVpQ0lYZXJKcFZ4dGRGT0I0RDdybnZKOEwvUUhVTk5n?=
 =?utf-8?B?Z3dmbWUrYkQrK3NOemNORmF4TnZRRy9vVitDVDF3VEdvcXVFL3lIYmhjWFVm?=
 =?utf-8?B?Wk5kNzN3a29iRm8rTUhld1VTNmt4dWlaTkp1UExUZlJLOGJUblkxcDlvUVpr?=
 =?utf-8?B?NkVkcTVVa0Z6ZUdaLzQzVENBWUx1SzhvamZFVlBUbzZ1YjlqNTE4aXMzZk5R?=
 =?utf-8?B?L2tkMUFnbkhBWCtSUEc1YUlvQUtMSWM5TnBOWUdkT2I4SlpDY0N2cTdEN1Ev?=
 =?utf-8?B?OEZNMXNvU1RzZW83cjhEdkVIT09Jb3NTbVo0WjNmWFZEaU9OZkJ5RmhraWxi?=
 =?utf-8?B?UXlES2RoVEdVZEVEYVk5aHBFeG1lODg3UjZmQXJickhQc25wdld4RnZDaFFs?=
 =?utf-8?B?azIzSDBXUTJBY2pvdjgydC8rL2JBS3BIUWlkV3pvNW1saGE5YWFPYmpJMU96?=
 =?utf-8?B?bFVjenJHeUJUSnpCSDc2YXNtRVZyZDd4Z2phQlllOElWSVFqU0NmWDhWejAr?=
 =?utf-8?B?VTh2WTZiazFnNlFvTWZTbktBRUxzWVZtR0ppMTVRMVV4aTBpK2NVODg1Z2xY?=
 =?utf-8?B?VXhzSlNhTnhjNUI3UGRsOG9EMSttUEpFblF5SnVkeXZrU3hmTkkvRUIvYjhD?=
 =?utf-8?B?ZnlkbWpzYThNYXhxOUFVR3NHTHlsc25KdG1aYjNxajM1ZW43c0FLVGRweHJL?=
 =?utf-8?B?cEFVL0FFVjI5NFZlVVhFNkxjNzN3dk1LOFUwMDU3OFRhZkJ2YXNndGh6bER4?=
 =?utf-8?B?dzVzUE05NGRLUXBvczVFRzVVV1JyOEd6eTN4d2NEMHFiZkFuSWpwKzRETSt2?=
 =?utf-8?B?R21xQkVvUWdieEZncU4vcFVRTmJUWHJ3VzVUeFlYdUpvWEJsNXZ0THpEaE1B?=
 =?utf-8?B?OGhmd0htejBpc3JLMWZFNnUrUG1FWXF4U09lM210VFJVU2d6Qk9wRU9UaHVU?=
 =?utf-8?B?RWU2RHVGWnpsMm0rS3hOb0Z5K0JFcXY3MXZIbEk5RUpIVFpOUisxVEU2NzRi?=
 =?utf-8?B?Vi83bGkrWmpFYUpnbDYzeHdBMXVHMzNXQkJnKzg0ZkZaZnhFUmtraUpTNDRZ?=
 =?utf-8?B?d24yRWFWcStmZzBxQUYvb2dmUk5JQWd1Smg5eWU4VTlKVWdQMHh2bjJEbDM5?=
 =?utf-8?B?TjFmd2FvS3h6WHM3d1pCUTd6N3R4MUdpUlc2eWFpSzZrUnlSR000dStTRkFH?=
 =?utf-8?B?bU9qcnNFMG82L2ZYOTVpdFhVNWs5Q0ZLYU95TlJtSFJnbFozOHF5TGRwUkRa?=
 =?utf-8?B?c1lwMnJqK1BWRVhFZW1wdmFLN3pUaWl2RTBHaEJIMDl1Z0hmL0ZrUjNXb0pq?=
 =?utf-8?B?ZzRoU0dxamZpNml3aVFPdWIydGpwa0laOGhkeFFhczM2U2N0amlJbXRqSFls?=
 =?utf-8?B?Q3ZiUzdNMzF0OUs2WHpid2FNMWNOSnIwMU1RN0ZhVXNjWERFVlFjSmJCcjFR?=
 =?utf-8?B?NHFtcWhjeDNYd0Zmc2VlQUhJSTV4NkRabi9iZXd0T2UwL0R4d01hb1l3NVpD?=
 =?utf-8?B?amVNRWluYUpYL2hCdWtlWG5ONmVpWE1EZE11bmEwN1dBQ1hMVzdueE1mUEs0?=
 =?utf-8?B?OVZDS05CMEFMOVdqaVN0TjRvNm9BQkQ3cFpJYThqem9SWVp6Y25tNTNiaFE2?=
 =?utf-8?Q?QmIyb5W/KyMRRVPN5BK9JR1Mv?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f704490-935c-4e33-e368-08da95bcdc37
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 19:19:20.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pOemnuVOngfoeK/sEp1mbavgVxhgfioeAFUd++IOmlxNRh8WKndRzQkIn744coQm10uWFfJfFUNrkQYizPXAZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6377
X-Proofpoint-ORIG-GUID: VFjhmRYCZqf7blBZ-HJOjDG_i2pl8-RE
X-Proofpoint-GUID: VFjhmRYCZqf7blBZ-HJOjDG_i2pl8-RE
Subject: Re: [OE-core] [PATCH] opkg: enable zstd support
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 bulkscore=0 mlxlogscore=779 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209130089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 19:19:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170608

ACK from me - apart from enabling zstd by default.

On 9/13/22 07:37, Etienne Cordonnier via lists.openembedded.org wrote:
> This allows the use of zstd for opkg packages by using OPKGBUILDCMD:
> OPKGBUILDCMD = "opkg-build -Z zstd"
>
> Signed-off-by: Alex Feinman <afeinman@snap.com>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>   meta/recipes-devtools/opkg/opkg_0.6.0.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> index 7b351e8123..e38d9d6f3f 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> @@ -30,7 +30,7 @@ inherit autotools pkgconfig ptest
>   target_localstatedir := "${localstatedir}"
>   OPKGLIBDIR ??= "${target_localstatedir}/lib"
>   
> -PACKAGECONFIG ??= "libsolv"
> +PACKAGECONFIG ??= "libsolv zstd"

Building in zstd support by default is a little suspect to me.

Unless I'm mistaken, OE-core will only build xz-compressed IPKs by 
default. So zstd support would be unnecessary for a distro integrator 
who just uses upstream OE-core.

For distros which use zstd compression in their packages, I think it 
would be more appropriate to overwrite the opkg PACKAGECONFIG in a 
.bbappend.

Is there something I'm not considering here?

>   
>   PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
>       gnupg gpgme libgpg-error,\
> @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
>   PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
>   PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
>   PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
> +PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
>   PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
>   
>   EXTRA_OECONF:class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170575): https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/170575__;!!FbZ0ZwI3Qg!pogpLkfpLwPy4zdzhTDEFkMT6eNuynfXzyaNvTq4OK74eYha04b285qGN5bk1t7aQmJAqnSBddI6-TD8FLOtzgtG_5PjNUviztKz$
> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded.org/mt/93654146/3616788__;!!FbZ0ZwI3Qg!pogpLkfpLwPy4zdzhTDEFkMT6eNuynfXzyaNvTq4OK74eYha04b285qGN5bk1t7aQmJAqnSBddI6-TD8FLOtzgtG_5PjNVdoKO7n$
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!pogpLkfpLwPy4zdzhTDEFkMT6eNuynfXzyaNvTq4OK74eYha04b285qGN5bk1t7aQmJAqnSBddI6-TD8FLOtzgtG_5PjNfNktoah$   [alex.stewart@ni.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


