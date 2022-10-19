Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C30C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 21:07:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2211.1666213629284425347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 14:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=fyYmVL5/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7291f7dd93=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29JJmu5N017012
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 14:07:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ATDcKgPHvMIyxxUbd6O5fRPBWVq7P3oWm+rkn7wFYgM=;
 b=fyYmVL5/a2VdE2HfD+MaDjLY2SIllgLbPpx5v/sK854w8rmJa7xLApCsZK7w4hOqFMC+
 6rfrrGFLnZqKOb2w2cKcZtRWct8XuR7lXVVQsCeQtWKZwaOntvr2a2hLwF4YaPteZpDF
 j/DdCHnPUHhEJPzmNLwxnkVXlIeOXkS/azC6C66sVqoPG4exfdP7temLI4He5XO5S5i2
 UPllmH6fd1e6gflFHfj4Zmh9NypAHrVhrYwDkzWJt2IrLLZJOd0H+2ydGbgVPsPYH1t9
 uDsTsZLxoKgaEn1yEojauqwooUNoeGt6DHCDFAei4273Vt7R/DLC3imeLelpVBfTjgEH dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7vckmv13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 14:07:08 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JL78sG023650
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 14:07:08 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7vckmv10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 14:07:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZIdh5HiKv6E+koLVwmi+F8AT8uKA+73u0PFojGU0qPx3Y1JgXh4WbPWzHJKOuuA02hC4x6gBBTVrV0E/ko2jN3jgyA58ed1qjK05KrI9ZeiRYo6ODNUten/1sgoYJAYj2f8u7NEqwXITk0+9hdTuR/y/UkhpaoTXIn6yJ0wTEkyxkPNRatvj/ByrIinXzbSkQRJeb0ep8FjuKjmBSFczpS/Ma3tC2VoPSd3/W9KPILxU1HukDZXXFYnlX1bWOrcaWodvXidOe4QT6MimdRsrKrf2hh3DWJSz0uLg/WSPwel5D9GaCcB2fWAp8ZA6NBWbqYnBEgpDFyp6ZuIDfyHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATDcKgPHvMIyxxUbd6O5fRPBWVq7P3oWm+rkn7wFYgM=;
 b=jYUL5X1ID7AOsN1jcm1wWpHXsxfhCOiEXIQmKQjJ+LFnFy/BOIonwfaYKD+lIZCYF1qCu7FNoXsyKOHPtKC2eg/4ei4DpaYuHTgg662E+HeXbk/QyrTXYjZURsTAOLHuwkpXcn1oubEioo+2S7i3C+zrW4jg5VcvfsFfEjy/JaSLVW4z7iMjda5ZuqMAM/AZuqi9bT0o9DCU95Wv3hGfzBbF1/UjsoRPEumETUjvqEkIqxMsXgHMI/HpStFigiIUrYhxQyc/KLKMVzuW3npYqlS3sgRInUrDvEiYNq34QNYVE0qajkLuMzyZw1wQ5gF9juzoURZKUEQ847pwLAOgcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH0PR11MB5561.namprd11.prod.outlook.com (2603:10b6:610:d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 21:07:05 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2a19:1d60:6710:ac8]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2a19:1d60:6710:ac8%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 21:07:05 +0000
Message-ID: <c6e185bd-d5c6-ba11-db59-1e05b49b284b@windriver.com>
Date: Wed, 19 Oct 2022 17:06:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core][kirkstone][PATCH 2/2] tiff: backport fix for
 CVE-2022-2953
Content-Language: en-CA
To: "Qiu, Zheng" <Zheng.Qiu@windriver.com>,
        "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220929083319.2225406-1-jay.shen.teoh@intel.com>
 <20220929083319.2225406-2-jay.shen.teoh@intel.com>
 <DM4PR11MB5536C6540613140ACF826C1FE62B9@DM4PR11MB5536.namprd11.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <DM4PR11MB5536C6540613140ACF826C1FE62B9@DM4PR11MB5536.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH0PR11MB5561:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f6dc6a-0619-435d-a36c-08dab215e04a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YhLHxTqYuCtJj3+hz4U0LS647kb1obZvWMdEIfgotwHmhp7w1KMZr2SPOMFfr3HI26Gabi3IVwhg6PFe5V0ytYrVcB2WFnppwu3CsnBtGegC3VJgo7xJIfZ7d8cIVIl7FOr0F7xJGk3+7U9Xj+NLSwFspV2DpJcl4JyTobHPLs14ZMKpUOGLklSnd8gxKfgkGJQ7nCRMkaiUuObc1d6ewZNDii917GxiH0uIM9nKbmffqFY4JNqbIZsmb7uWsCQ+OC8UQ6VvATa7GrN2nSA7dMHOkPAQXSgnX4+fh2eOG8fZ+hXKuWtuPG9kJk71IHk3Mfy5Ff4uuY3DpvUqJlOmX3ArBlv8Nh3T0JwpIn8T8fGslgpQ8WY87GFxS2OlHasCBQoeI55dBUnPMb9Qf7N88xpIh7u4xp3aayWZ6R5IwSTVGDK/hKFnG6AlC2/zoftUR1Bb0fb/t2kBmzslvNoVWUP+TQ18TGu+oNyJ3k6UQnvhZsaaMFpXZMWgtqxMqmMZywRx0ep8KCsw5wGwIdMsgj6e0YsG7spvExX949mPvrO4/2PHhBMclCvbKvm8D3QeEenMRACfAGdQmM/GjZO+xgLaVIqARMj9qqjKmPaCgmE+JwEmpBZt7rZcftKrB77cn4goAKsXiHLcJ06dZEuusadc5qSHwI0unCJ5iA4zNXIpZgg5OJvwpU0PYejgjrB3I7TSlazB6k7QSht3DPWJLZgqLnHvTnkPclD8dE5VqkrSKGp9nz5nYhdgyxk2CBOS0P7sKpsWHtOoDnAnMQZT3cYtF1EPMv67/EvgQ9cRqv0V/Gwd9+SS2jt7eP9/ifJjPjUMjKU6SfQcnkixVDrkrh1bZZcmlsKCP70sC73SZEw0xZdDBR7tgVJBpA1Yo4QPsbiHDgsilzBWZqaX/bpa1w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(376002)(366004)(136003)(396003)(451199015)(31686004)(84970400001)(36756003)(110136005)(316002)(41300700001)(38100700002)(83380400001)(8676002)(4001150100001)(66946007)(2906002)(8936002)(5660300002)(4326008)(40140700001)(30864003)(66556008)(66476007)(186003)(2616005)(6512007)(6666004)(26005)(6486002)(966005)(86362001)(31696002)(66899015)(53546011)(6506007)(478600001)(45980500001)(43740500002)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHM0dmFyenlEVFJhNmZERHhyYWRhcGxmVWFYZ3BXN25qQjZqeHBIcDNjaU90?=
 =?utf-8?B?Z1FkWk9Ca2ZwSENZaWExc1RSWGRjK1dvcGJhRlpZdW84S2tmQUE3QzFIdzJU?=
 =?utf-8?B?NGRrVy9kMFhzbnRBNXMxRFlzQlIrczZ0NTZSTnFSb2dyeWxsL2w3OW04MFp2?=
 =?utf-8?B?cEJXQi9WWlNUWjMzbGgyV3NZaWdJbXJMY0pwRU81TC9EZFgxQnliekFBWkxD?=
 =?utf-8?B?S016bHRXZ0svaVFPYnYwMWlObHp2cWZHeFJERkg4Wi8zMG1GVmNJbnhvRUpX?=
 =?utf-8?B?azlvc1pNVXp3Ukk5WjlVQWFYS0Eydk8yaWhTVVZqaldRZHJWeFVqVDNjR0Fa?=
 =?utf-8?B?a3REaW54YzJ3dDJWaGwzMUxhM1ZGYk9aVWl3WmNLcUorcW5Tc3I2aStMTTFS?=
 =?utf-8?B?dmdWYUgraGJ6c20wMHp4K0NibjFLUmR2eXViaGRxK3pWb3VlaGcrNktzd09H?=
 =?utf-8?B?MEpvb2duM2lHdVVBa1hmV09TbS91VWZUaUV4dU04ZnpldVY1TlZpbzNiZVJJ?=
 =?utf-8?B?UE5zT1crdWlsRENPcjBXNjVjdGozbVdSSjhjQU1VNC80STdpam9UbGVGVytV?=
 =?utf-8?B?Sk1TNGhQL0w4NHcveFpJdGdkRjdrZStNb01WcTZEKzZNUk10YWU4ZjgrbE9u?=
 =?utf-8?B?YU9TY1JFR3pwSExhZ3IxUjBLQlFHTU5qR0pJdHhZVjJNdXp6VWRmMzJGK3Zl?=
 =?utf-8?B?ZVZ2QkM5bkRLd01lRktwa0tFMVNkVUVHNlNmVVpZWEI0N1dMM3RXSXIwcnVD?=
 =?utf-8?B?RzFVc1IyYiszeVl4cnBvNjNnTm02NkZ3RnVHeFN2UVI4c0g1enE0cXU2eS92?=
 =?utf-8?B?NG5vMmdCaEE5elpiQXFELzhuNHJlV2dxSEo4MmxYT0Q1aVJtUmFuTWR5bGRF?=
 =?utf-8?B?Y3EvenNaWDN2d2hmZ1NqL0d0N3pGZjhXOGhZY0VXZTA3YkJrbnBoRDBJNjlB?=
 =?utf-8?B?eEt3bjBSSE1PSHZ1aVVwa3pBeW9ZMys0WlhqSEJKclFxdm1DQVF5cXo4aVN1?=
 =?utf-8?B?QklDdkRsbkhYMldrcGhBeWprc2RmRVdiNytBYmFIeWVabnpMK0NSYklPamZt?=
 =?utf-8?B?TXFDeGJtUlhDa0NyZ0Y0N29VS2VweUZaZjRZZkdHdXV2VlhHeEVKT0JYN21y?=
 =?utf-8?B?NmJ5YUM1aWNzU1NLaHF0aWlzNk5nTC9oVHhFV3E4UzhyV09QeFFHV08zMHFr?=
 =?utf-8?B?aGo2Q1VZMGloSHAydDhlekM1T2RsY0dmT1dLTVRCT1N2a1dKSW4yRWQ5MnJO?=
 =?utf-8?B?b2c0eXBNZHVVenNZdEtKR2JsZG4vQ2h3enBMbVQ5T0pPUHhPZ2dRWjZLcFdt?=
 =?utf-8?B?MWtpV3MweFA1bXpqcTJ2QkNQWkdHS0p6Tm0yN3JPS0hJcExGMzl0enpKcE5h?=
 =?utf-8?B?U0FvcDJIcHltcUN1d2grQzE2Q0lnRm5uZ3ZzcU5pZURiYUFIT2ExclRFS2tC?=
 =?utf-8?B?TVJnNWFRTWRKNElhU2VQZkJYQjRWZjk1anFZWGdiT0hBQlZiK1NZd0JZeVBN?=
 =?utf-8?B?end4cjZJSUFUdTQ2R3l1aTNVbWZYalFRZTd1Y1E3UURNMXMwbVNmQkQ2d2lt?=
 =?utf-8?B?eENiQm02RERUY24rd01DNkxiZHU4R3lTRGRqSUh2bmR3dTUwY3A0NGF4SlJN?=
 =?utf-8?B?OWtKTzU3Tk9wajdoZlpic0IveUJOOXNscUtmUG8vUUNscVJHRjNFRUswM2hm?=
 =?utf-8?B?c1JCeUJaYUdDVGl3SnNmZVBNTEltd3puRUZTYytsengyVi93a3p3SmJKZ0o2?=
 =?utf-8?B?dlhPQnJuYlFZekhjaDVhVW1wTEU0KzRFQ0hFUkh3Zmt3WG5aNmhpdFN4cmkr?=
 =?utf-8?B?NjZlV0RKSEpVZjZlZW05dklObnlHNkFJMlJRRWNmUTY4c29Uam1sQ0xSR2E5?=
 =?utf-8?B?OVFDbVUvcnV4WmRTaXFUNGFpRU9ob3g4NUFoSzd1Z09ic3JpdTVxWU91S3di?=
 =?utf-8?B?U0tpKzFsZzZvMGJaeTBydS9YNGZ1SmxleXVmVnF1WUdSRGVYUFBJdjBGNWcv?=
 =?utf-8?B?T1U5Ukk2dHpGKzNBcm5BU21nWXM4RFNWbDR0cEQ1UzZ6RHFCM0Y0SnlManZn?=
 =?utf-8?B?VE5uM3Vla2tsU0lLWHYvcHRhUmdKakdqak4vZTB5YytWbnYwY2lUa21rU2cx?=
 =?utf-8?B?ZktLYTVqb0syWVlwR2FoZGIwTlVJdkRWd3RqNmlHUGk1eDlvOGlFck1KK3pt?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f6dc6a-0619-435d-a36c-08dab215e04a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 21:07:05.6360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/YPPfyhmrrLudz4gw81bv3yyXRct0EySeNcw9hL+E2eAFqoKOfdN/L6+wOog8ry8co6QCprSlD6M7SIOUpxC9zSZ3NNdfU3XiP+3gj6n5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5561
X-Proofpoint-ORIG-GUID: uVKxDl1i7f1DpkCXBJRgzf2LJ0mH-LWw
X-Proofpoint-GUID: deoVdW08pQp_50NIbHQsslvzTv-3ClUA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_12,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210190118
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 29JJmu5N017012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 21:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171983

On 2022-10-19 15:32, Qiu, Zheng wrote:
> kirkstone now has tiff version 4.3.0.
>
> As described in https://nvd.nist.gov/vuln/detail/CVE-2022-2953, this is=
sue is reported here: https://gitlab.com/libtiff/libtiff/-/issues/414
>
> Tested with libtiff source code on version 4.3.0 by using " /libtiff$ g=
it checkout v3.3.0", and follow the step listed in the bug report, cannot=
 reproduce the bug.
>
> Use " /libtiff$ git checkout b51bb157", is able to reproduce the proble=
m following step listed above. That confirms the issue occurred after v3.=
3.0, and the commit that brings the bug is not on kirkstone, which means =
the issue/fix is not applicable for kirkstone.

Hold on...

We also checked, because I'm paranoid, by doing:

$ cd .../poky-contrib.git
$ git checkout stable/kirkstone-nut
$ git pull
$ cd ...
$ .=C2=A0 ../poky-contrib.git/tiff-patches
$ bitbake -c patch tiff

$ mkdir cp-tiff-patch-by-bb-kirkstone-nut
$ cp -a tmp/work/core2-64-poky-linux/tiff/4.3.0-r0=20
cp-tiff-patch-by-bb-kirkstone-nut/
$ cd cp-tiff-patch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0
$ ./autogen.sh
$ CFLAGS=3D"-g -fsanitize=3Daddress -fno-omit-frame-pointer" CXXFLAGS=3D"=
-g=20
-fsanitize=3Daddress -fno-omit-frame-pointer" ./configure=20
--prefix=3D$PWD/build_asan --disable-shared
$ make -j; make install; make clean
$ wget=20
https://gitlab.com/libtiff/libtiff/uploads/54e5139c4d9d6b740f537c691aad2b=
03/poc
$ ./build_asan/bin/tiffcrop -Z 1:4,3:3 -R 90 -H 300=C2=A0 -S 2:2=C2=A0 -i=
 poc /tmp/foo

and a very similar issue still occurs.

See log below. We'll investigate more and send a patch as needed.

We will enable the address sanitizer and check if the issue
is reproducible in qemux86-64.

../Randy


...

loadImage: Image lacks Photometric interpretation tag.
TIFFFillStrip: Read error on strip 0; got 672 bytes, expected 1142418.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D269609=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addres=
s=20
0x7fd1864ff695 at pc 0x55de6ca63f9a bp 0x7ffe727049a0 sp 0x7ffe72704990
READ of size 1 at 0x7fd1864ff695 thread T0
 =C2=A0=C2=A0=C2=A0 #0 0x55de6ca63f99 in extractImageSection=20
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:6897
 =C2=A0=C2=A0=C2=A0 #1 0x55de6ca6515a in writeImageSections=20
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:7085
 =C2=A0=C2=A0=C2=A0 #2 0x55de6ca4abe9 in main=20
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:2453
 =C2=A0=C2=A0=C2=A0 #3 0x7fd189b39d8f in __libc_start_call_main=20
../sysdeps/nptl/libc_start_call_main.h:58
 =C2=A0=C2=A0=C2=A0 #4 0x7fd189b39e3f in __libc_start_main_impl ../csu/li=
bc-start.c:392
 =C2=A0=C2=A0=C2=A0 #5 0x55de6ca413a4 in _start=20
(/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-=
patch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/build_asan/bin/tiffcrop+0x2=
a3a4)

0x7fd1864ff695 is located 0 bytes to the right of 1142421-byte region=20
[0x7fd1863e8800,0x7fd1864ff695)
allocated by thread T0 here:
 =C2=A0=C2=A0=C2=A0 #0 0x7fd18a0a1867 in __interceptor_malloc=20
../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:145
 =C2=A0=C2=A0=C2=A0 #1 0x55de6cadcd83 in _TIFFmalloc=20
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/libtiff/tif_unix.c:314
 =C2=A0=C2=A0=C2=A0 #2 0x55de6ca41543 in limitMalloc=20
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:627
 =C2=A0=C2=A0=C2=A0 #3 0x55de6ca61299 in loadImage=20
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:6212
 =C2=A0=C2=A0=C2=A0 #4 0x55de6ca4a4a1 in main=20
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:2376
 =C2=A0=C2=A0=C2=A0 #5 0x7fd189b39d8f in __libc_start_call_main=20
../sysdeps/nptl/libc_start_call_main.h:58

SUMMARY: AddressSanitizer: heap-buffer-overflow=20
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/tiff-patches/cp-tiff-p=
atch-by-bb-kirkstone-nut/4.3.0-r0/tiff-4.3.0/tools/tiffcrop.c:6897=20
in extractImageSection
Shadow bytes around the buggy address:
 =C2=A0 0x0ffab0c97e80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 =C2=A0 0x0ffab0c97e90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 =C2=A0 0x0ffab0c97ea0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 =C2=A0 0x0ffab0c97eb0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 =C2=A0 0x0ffab0c97ec0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
=3D>0x0ffab0c97ed0: 00 00[05]fa fa fa fa fa fa fa fa fa fa fa fa fa
 =C2=A0 0x0ffab0c97ee0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
 =C2=A0 0x0ffab0c97ef0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
 =C2=A0 0x0ffab0c97f00: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
 =C2=A0 0x0ffab0c97f10: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
 =C2=A0 0x0ffab0c97f20: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
Shadow byte legend (one shadow byte represents 8 application bytes):
 =C2=A0 Addressable:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 00
 =C2=A0 Partially addressable: 01 02 03 04 05 06 07
 =C2=A0 Heap left redzone:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fa
 =C2=A0 Freed heap region:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd
 =C2=A0 Stack left redzone:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f1
 =C2=A0 Stack mid redzone:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f2
 =C2=A0 Stack right redzone:=C2=A0=C2=A0=C2=A0=C2=A0 f3
 =C2=A0 Stack after return:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f5
 =C2=A0 Stack use after scope:=C2=A0=C2=A0 f8
 =C2=A0 Global redzone:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 f9
 =C2=A0 Global init order:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f6
 =C2=A0 Poisoned by user:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f7
 =C2=A0 Container overflow:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fc
 =C2=A0 Array cookie:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ac
 =C2=A0 Intra object redzone:=C2=A0=C2=A0=C2=A0 bb
 =C2=A0 ASan internal:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fe
 =C2=A0 Left alloca redzone:=C2=A0=C2=A0=C2=A0=C2=A0 ca
 =C2=A0 Right alloca redzone:=C2=A0=C2=A0=C2=A0 cb
 =C2=A0 Shadow gap:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cc
=3D=3D269609=3D=3DABORTING


> Zheng Qiu
> Linux Developer
> _______________
> Wind River
> M/=C2=A0(437) 341-1849
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Teoh, Jay Shen
>> Sent: Thursday, September 29, 2022 4:33 AM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core][kirkstone][PATCH 2/2] tiff: backport fix for CVE-20=
22-2953
>>
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
>>
>> Link for the patch : https://gitlab.com/libtiff/libtiff/-
>> /commit/48d6ece8389b01129e7d357f0985c8f938ce3da3
>>
>> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
>> ---
>> .../libtiff/tiff/CVE-2022-2953.patch          | 86 +++++++++++++++++++
>> meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
>> 2 files changed, 87 insertions(+)
>> create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-
>> 2953.patch
>>
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
>> b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
>> new file mode 100644
>> index 0000000000..2122b46566
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
>> @@ -0,0 +1,86 @@
>> +CVE: CVE-2022-2953
>> +Upstream-Status: Backport
>> +Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
>> +
>> +From 8fe3735942ea1d90d8cef843b55b3efe8ab6feaf Mon Sep 17 00:00:00
>> 2001
>> +From: Su_Laus <sulau@freenet.de>
>> +Date: Mon, 15 Aug 2022 22:11:03 +0200
>> +Subject: [PATCH]
>> +=3D?UTF-8?q?According=3D20to=3D20Richard=3D20Nolde=3D20https://gitl?=3D
>> +
>> +=3D?UTF-8?q?ab.com/libtiff/libtiff/-/issues/401#note=3D5F877637400=3D=
20the=3D20
>> +ti?=3D
>> +=3D?UTF-8?q?ffcrop=3D20option=3D20=3DE2=3D80=3D9E-
>> S=3DE2=3D80=3D9C=3D20is=3D20also=3D20mutually
>> +?=3D
>> +=3D?UTF-8?q?=3D20exclusive=3D20to=3D20the=3D20other=3D20crop=3D20opti=
ons=3D20(-X|-
>> Y),=3D2
>> +0-?=3D
>> + =3D?UTF-8?q?Z=3D20and=3D20-z.?=3D
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +This is now checked and ends tiffcrop if those arguments are not mutu=
ally
>> exclusive.
>> +
>> +This MR will fix the following tiffcrop issues: #349, #414, #422, #42=
3,
>> +#424
>> +---
>> + tools/tiffcrop.c | 31 ++++++++++++++++---------------
>> + 1 file changed, 16 insertions(+), 15 deletions(-)
>> +
>> +diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c index
>> +90286a5e..c3b758ec 100644
>> +--- a/tools/tiffcrop.c
>> ++++ b/tools/tiffcrop.c
>> +@@ -173,12 +173,12 @@ static   char tiffcrop_rev_date[] =3D "02-09-20=
22";
>> + #define ROTATECW_270 32
>> + #define ROTATE_ANY (ROTATECW_90 | ROTATECW_180 | ROTATECW_270)
>> +
>> +-#define CROP_NONE     0
>> +-#define CROP_MARGINS  1
>> +-#define CROP_WIDTH    2
>> +-#define CROP_LENGTH   4
>> +-#define CROP_ZONES    8
>> +-#define CROP_REGIONS 16
>> ++#define CROP_NONE     0     /* "-S" -> Page_MODE_ROWSCOLS and page-
>>> rows/->cols !=3D 0 */
>> ++#define CROP_MARGINS  1     /* "-m" */
>> ++#define CROP_WIDTH    2     /* "-X" */
>> ++#define CROP_LENGTH   4     /* "-Y" */
>> ++#define CROP_ZONES    8     /* "-Z" */
>> ++#define CROP_REGIONS 16     /* "-z" */
>> + #define CROP_ROTATE  32
>> + #define CROP_MIRROR  64
>> + #define CROP_INVERT 128
>> +@@ -316,7 +316,7 @@ struct crop_mask {
>> + #define PAGE_MODE_RESOLUTION   1
>> + #define PAGE_MODE_PAPERSIZE    2
>> + #define PAGE_MODE_MARGINS      4
>> +-#define PAGE_MODE_ROWSCOLS     8
>> ++#define PAGE_MODE_ROWSCOLS     8    /* for -S option */
>> +
>> + #define INVERT_DATA_ONLY      10
>> + #define INVERT_DATA_AND_TAG   11
>> +@@ -781,7 +781,7 @@ static const char usage_info[] =3D
>> + "             The four debug/dump options are independent, though it=
 makes
>> little sense to\n"
>> + "             specify a dump file without specifying a detail level.=
\n"
>> + "\n"
>> +-"Note:        The (-X|-Y), -Z and -z options are mutually exclusive.=
\n"
>> ++"Note:        The (-X|-Y), -Z, -z and -S options are mutually exclus=
ive.\n"
>> + "             In no case should the options be applied to a given se=
lection
>> successively.\n"
>> + "\n"
>> + ;
>> +@@ -2131,13 +2131,14 @@ void  process_command_opts (int argc, char
>> *argv[], char *mp, char *mode, uint32
>> +               /*NOTREACHED*/
>> +       }
>> +     }
>> +-    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and =
-z are
>> mutually exclusive) --*/
>> +-    char XY, Z, R;
>> ++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z =
and -S are
>> mutually exclusive) --*/
>> ++    char XY, Z, R, S;
>> +     XY =3D ((crop_data->crop_mode & CROP_WIDTH) || (crop_data-
>>> crop_mode & CROP_LENGTH));
>> +     Z =3D (crop_data->crop_mode & CROP_ZONES);
>> +     R =3D (crop_data->crop_mode & CROP_REGIONS);
>> +-    if ((XY && Z) || (XY && R) || (Z && R)) {
>> +-        TIFFError("tiffcrop input error", "The crop options(-X|-Y), =
-Z and -z are
>> mutually exclusive.->Exit");
>> ++    S =3D (page->mode & PAGE_MODE_ROWSCOLS);
>> ++    if ((XY && Z) || (XY && R) || (XY && S) || (Z && R) || (Z && S) =
|| (R && S))
>> {
>> ++        TIFFError("tiffcrop input error", "The crop options(-X|-Y),
>> ++ -Z, -z and -S are mutually exclusive.->Exit");
>> +         exit(EXIT_FAILURE);
>> +     }
>> +   }  /* end process_command_opts */
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/reci=
pes-
>> multimedia/libtiff/tiff_4.4.0.bb
>> index e30df0b3e9..caf6f60479 100644
>> --- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
>> +++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
>> @@ -11,6 +11,7 @@ CVE_PRODUCT =3D "libtiff"
>> SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>>             file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch =
\
>>             file://CVE-2022-34526.patch \
>> +           file://CVE-2022-2953.patch \
>>             "
>>
>> SRC_URI[sha256sum] =3D
>> "917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed
>> "
>> --
>> 2.37.3
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171978): https://lists.openembedded.org/g/openembed=
ded-core/message/171978
> Mute This Topic: https://lists.openembedded.org/mt/93990330/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


