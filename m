Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3652BC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 18:24:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4381.1686075883120801380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 11:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=JyJEWylF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55213cef27=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356CMRpB017050
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 11:24:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=zYF05XLpISO4yrPsPHP/IKsUBes0oMz+2+x7HI73yic=;
 b=JyJEWylFR2IuHHBo1o3NsHuU3OIybAf740JVG4NGdWEJs8n+59nL10yKNtvlo1MiWEAc
 EfqUrcWDhcY+J21DdyeOqVe5lKuwATDVkt/M/Q5cFHuw8PeBXRuOY9cyZ5otN418XXTK
 1EYWW81uLiIg2FhtkeD44AxkpAe9S7ejgBn6kOU3EX2b3BM/BsB0TbDCz7T7hB4YKhT0
 8JQo3ahCuLU9+0+zPVg9+S/RMBIV//aEa91DqiZIFrTwyKjmkCQ42A2tJzzgUS/9dvw3
 xI/u78+sFfN3r/N9GG9wP1QToybGKPlo1UXE5qE47JayJ+PIGNPKFGnUKCbUUDFOgfgJ tA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r051jafh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 11:24:42 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356IM7Lg009972
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 11:24:42 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r051jafh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 11:24:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4oSlcNgyawcJGKFtcJGt4u9R6sVMCf37xnt7QtZ03APZfruv17jxozyw3DN50KUMeGVWnm3w8NCt+CqVN+t15zAN+GOO12bmdgIniaoucjJtA6UkbcXup+NAch3XgPzDErTlwUL3DH0tMi+q3Ss85wVEVLQvdGNGGZMUdeOeoeE9KDHzVKivUkEI5j96uccVEq51JKnGGRN+qT4sIoqeLyiMd/cyOsZKE/PtdNbY+64BGPk6TmKWKx/0jhJ7JfTwnAJNFLW9pkW1/QdtVcBiOz0ZOCKr5YzxQ5tycrO+y9gUiUxlcyvAPq5TSOUzxum760l01PjEF08yw5wiHL+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYF05XLpISO4yrPsPHP/IKsUBes0oMz+2+x7HI73yic=;
 b=ZUF/uExEXePIOHX0wojRByH7Rl+ANRpypCvUpKjlzO4PMFdrLQJ9vGnpHAL9Alil9ZBW9+8Pzy8WO6m6/NTqofwMJlK+SBpD9ZFERnDqesSuOazvkhzxd+Gy+kd3Nbo42EL/bPiuLlA3TwJUJddWrRCuTVp9fGpzImT7XeDixrn3iPei64d4bSckoeK+5qHYgYsvpp8jr2EurMYB+iD3KFTO8s+g6NbqQhM0MlmH9AEiHq5bCs+61paHi5yg0mVe1mXeGn9fp58ibGfMxN9L8HiLgPO+lmQLelQHVHaEB5dhh+7EPUsy7mQI0IvGsuZkgOcyR35ZOL989fwXstNdYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA1PR11MB6688.namprd11.prod.outlook.com (2603:10b6:806:25b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 18:24:36 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::63:b999:7c4e:c2a8]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::63:b999:7c4e:c2a8%3]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 18:24:36 +0000
Content-Type: multipart/alternative;
 boundary="------------brI4LHzLkmTRV2jEiVZYmlRT"
Message-ID: <91f02897-1a53-3458-d493-7cbb44016951@windriver.com>
Date: Tue, 6 Jun 2023 14:24:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe-core][kirkstone][PATCH 1/1] perl: Fix CVE-2023-31486
Content-Language: en-CA
To: soumya.sambu@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20230605032300.2325425-1-soumya.sambu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230605032300.2325425-1-soumya.sambu@windriver.com>
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA1PR11MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: b4495c03-cfc2-41c8-9218-08db66bb4840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KQrQQxPA1ejLufSV43jvJV8mEjPtL185sPnzxGccaxMgJDPQo9rnWi/Gr3eeGe4lDqP5ItWRssIBsggAuZYRVaneXugT5uph0AnHza8RRH+5clP7lA0Z/Kq7nN1GMNAsBRiTEZ+Xg6rGa9wEk8+0BDmC+H9ZxbrZn4I65Q2T5Nvi3KnNZlBsSO+Eh1K15yE8E9nQppVcrbXg686fmM79mnpN2IoZ5+/2rNyRe5Iyy1IizPxpboZLJ7a/9CzGysLjiNhGey/Qgy3wXjQ65vEuzjXJXw8+IPfHV+awyj4on+5w1mRPr1fd6AaBomnoLsJhp5PqkBx6bbRIaMlMkZdN1uKjc2oXZu14YHMQ3PnhZqPaxyNYenvZqo2JQuJ8wRxbKrwJ8HEybK2ylVbmsili+3dOl4SBUWcbkzhhiyeibhQzmznJeiPr8Hzw+u1kkkAcD7ab3tqPmytP1Cj+Nht9r0HnhMS0emv3ZnAbSUiDVgcaCd35NhTuN7BpB4hQifguDyyYaikuDqcfHcbErk9cipP3dSi7rtIYmgc+Go82+1QQuDsXkcE+UbRoeZ0NqH+06p5qTarmtcR531jtKG9AGjnOgu1xMA/ociSa1d0U6RKrB+pa0v6FYPRXF/jxQEIXjzfHg5RayQMWqDpjveSGww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39850400004)(451199021)(478600001)(33964004)(2616005)(6512007)(83380400001)(186003)(36756003)(6506007)(26005)(53546011)(966005)(6666004)(6486002)(316002)(166002)(41300700001)(66946007)(6916009)(66556008)(66476007)(86362001)(21615005)(31696002)(30864003)(2906002)(31686004)(5660300002)(8936002)(8676002)(66899021)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c1ZVZWZxeVllNVZGMGdIZTdVZlorM1hNRlY0MHI1aHFnbnp6RVk2L2VvRHlT?=
 =?utf-8?B?WWI5dkpVdGljVWk2MGVPK21YU1kydHdLSmhFaSs0NlJFM1pjMDdUQnJkbXVZ?=
 =?utf-8?B?KytqTDE5WEk4UFo3d0pPRGd5bG5RR3N4NFBnMHBGQVNmSFh5MlQzd2JDdE5n?=
 =?utf-8?B?bTBEb2plaFBkaWNwSTB1Qmg0a05abUNIem9RbVV1MDIyZ1VzQUM1eXppQmRT?=
 =?utf-8?B?bjRoZlRocS8zSWk4SHB5V3RKbGpHY28wOWJ2TXJ6c0NUbEJaK0NnWUJ3Z1VI?=
 =?utf-8?B?QUluKzY4QzB3QWdjNUdVWFVsZUF2V3ltYml3UVZXYnZSc2lCaWlyUlBwdFZ4?=
 =?utf-8?B?OXUxOXgreFl6aGNrNjRzQkFad2hzanA2OTZTMzBSWENlNkVGbEl5Qm9JNnJL?=
 =?utf-8?B?Tjg0eUptTjFiK0tnTm4yL2FUSmFkaGFwaVM5MUZUdHNpclhCSVRRVXR2U1Bn?=
 =?utf-8?B?cWVFOUlScFRqN1ZJbVM1SnRsUGFHQ0wzaXdJdXVoTStEM1o0NXdYd2pWdG8v?=
 =?utf-8?B?bURTY0JvcXlZV0FiSm5jdnMwVkZFeVpEdEluVndDbTQrVks5UWNXTVJoNUNZ?=
 =?utf-8?B?SnlYODVVbTRsMFEvbll3SEt3RC9nT1dzeTdUUld1cndlZ2FQK3lHK2VkVmd0?=
 =?utf-8?B?Mno5TnkvdUNsRk43ck9sVXQxQ3lZN3YzQ2NXVHdzSEl5RDYxVzNmT0RweE0y?=
 =?utf-8?B?YjhZS3h4T3RvOXJiWVE4MXhyR0lRYmJRNThtR29Ta1FoeXpyUU9zUmRhd25i?=
 =?utf-8?B?SWU3NDZiNWhqdnNXZytCcVZmQ2NoeE4vMzdwZm42RzVmZWZCelFoQnArTkw4?=
 =?utf-8?B?WG1VSUx3YU1mbGlLMS9ybmt4R1hPZVEyaEFmNHNUSXlncmRIeFJkcjloQXhh?=
 =?utf-8?B?OW5qbmlCRFNRRnZtYzZ0TDZ1YUZ4TCtNczRtazRaTnYxVkJwdzRoWVo3REZN?=
 =?utf-8?B?aDYrZEdCV3pIRHVWRHhzaldnTXNqdGlrUS8wM2lHbjBkWUUvVTh6TzVxdkdS?=
 =?utf-8?B?aW1lRjR2QktoblBFQWRJa0FPMUpDSjNrS245alBSNm5ka3RLNDgzZ3o1cHdN?=
 =?utf-8?B?Z3JUTE8wcEh3QkhwOFBhdVJZZjNnRDFwS0NxdXExSngyQnlmR0s0dTREWVor?=
 =?utf-8?B?Q2JyNE1seEw2dFI1Tk11SEZsTzNyQzZwUGk4Q1ZKdE05Um9ZTFJPb0tHWHNm?=
 =?utf-8?B?RmZvUHZ6cytNKzJHeC96NktvVjgyamM3SERhZUwxL084SElBckJXMG1OS2Ew?=
 =?utf-8?B?a1VYZWNwZ0dWTUgvK3hLaUF3cjRadW0wZHZyeWliSytPelE4aWF5TE04R2RI?=
 =?utf-8?B?ZC9lQUtzVVZuYUh0Yjc1RngvOFExR09WUnBKeHgwTkg1KzJ6ejI2bWZnY0tM?=
 =?utf-8?B?eVFQd0R2dGg4bEUxNkFlb2xjUXFCTmMwRUgxdVVrai93OVNudHNxUW44ck9F?=
 =?utf-8?B?TGdRTkZOOHNVbGViZE13bVBOdnFnTlpHOGM3cU85eWhKU0N3Wkptd0QrMzZE?=
 =?utf-8?B?eTFRNSsyVVJnbnR2UXUzdVI1d2gvVW9yaDY2cURFd3ExajcyblNFZVVsakxH?=
 =?utf-8?B?SjNMeGJVRmo1eVRkMGRJVUNaSkVaRmkvK05WL3Nqa0RvR2lrdi95VGtST2N1?=
 =?utf-8?B?S1F2aUlyV3hDd2t4SmNIWlUrTncvOUlyMS93bHc5YldXdlBhcHFSMjFUZ1V1?=
 =?utf-8?B?eUhPU0J2SVJ0THlkRFMzM1Ria3dRT2c3NG0vckIyZ1RBYzRpSlNwK0xNVmdW?=
 =?utf-8?B?SlJWc0FzQlZOTkpRQTByQ1MrclpCTnU4VkZBWnhKUmlrRDNkNE94MHp1TkY1?=
 =?utf-8?B?T05GVDBtanFXeWRQVFFIVDNydGlVYlFKU284WnhTYmxrNERzZUkvdWMrL3VH?=
 =?utf-8?B?cEpFRFdtMVIwZ1F6ODBpdytDMjlFWUJndFRtSWNwYk1rSEhJU2E1bjZRQnhO?=
 =?utf-8?B?RC9HVnR5Mjl1MDJMUXRXcnAvN0gzNkVTbGpzN21NZEc3ZkpreUV5T1IyMlE1?=
 =?utf-8?B?N2J4bmRrZjIxczk2eXpwcUwxd1AzWGRvZ2hTaWN0THdkdENyNkYweHRvQk9W?=
 =?utf-8?B?OU15Y3N3TlRvS1hFb1d0ckMvVlhVRlg4QTZFeEZSZlQzK1dDNEtwU1F1N0p5?=
 =?utf-8?B?OThRbnVVNXdmb0RTK2xIbThkN0VZSkhkSGl3TzQ4ZlErVDZpcnRYVGRyZVAz?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4495c03-cfc2-41c8-9218-08db66bb4840
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 18:24:36.7309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3diHQFKs8cZXWuAUm9A76I5efAL+PtfxQ0Y5zMtj58u98kV8QgmpkXQf0+Fxl9gWuBcELchjj2HS94Z0vWFJPfgVeP50pIdKrkOdrIRfOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6688
X-Proofpoint-ORIG-GUID: QOMtuVKsWKSN-QB7af8nHiw40StkIPDp
X-Proofpoint-GUID: sKI6zvFjrE9klLV_zstMmM9IFiiCVPcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_13,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 18:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182449

--------------brI4LHzLkmTRV2jEiVZYmlRT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 356CMRpB017050

On 2023-06-04 23:23, Soumya via lists.openembedded.org wrote:
> HTTP::Tiny 0.082, a Perl core module since 5.13.9 and available standal=
one on CPAN,
> has an insecure default TLS configuration where users must opt in to ve=
rify certificates.
>
> Signed-off-by: Soumya<soumya.sambu@windriver.com>
> ---
>   .../perl/files/CVE-2023-31486.patch           | 89 ++++++++++++++++++=
+
>   meta/recipes-devtools/perl/perl_5.34.1.bb     |  1 +
>   2 files changed, 90 insertions(+)
>   create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486.pa=
tch
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486.patch b/me=
ta/recipes-devtools/perl/files/CVE-2023-31486.patch
> new file mode 100644
> index 0000000000..55c4bd1d47
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2023-31486.patch
> @@ -0,0 +1,89 @@
> +From 1490431e40e22052f75a0b3449f1f53cbd27ba92 Mon Sep 17 00:00:00 2001
> +From: Dominic Hargreaves<dom@earth.li>
> +Date: Thu, 21 May 2020 22:53:37 +0100
> +Subject: [PATCH] Enable SSL by default in HTTP::Tiny
> +
> +Gbp-Pq: Topic debian
> +Gbp-Pq: Name http-tiny-ssl.diff
> +
> +CVE: CVE-2023-31486
> +
> +Upstream-Status: Backport [https://salsa.debian.org/perl-team/interpre=
ter/perl/-/commit/1490431e40e22052f75a0b3449f1f53cbd27ba92.patch]


The upstream for the YP Perl recipe is not Debian but rather:

https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dper=
l

-> https://www.perl.org/get.html

-> https://dev.perl.org/perl5/source.html

 =C2=A0 git clone https://github.com/Perl/perl5.git perl


Please find the equivalent patch if it's available there and re-submit.

If the patch isn't there, there is a (not very active) maint-5.34 branch =
so
we should send a PR there and change the Upstream-Status for the oe-core=20
commit as needed.

../Randy

> +
> +Signed-off-by: Soumya<soumya.sambu@windriver.com>
> +---
> + cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 20 +++++++++-----------
> + 1 file changed, 9 insertions(+), 11 deletions(-)
> +
> +diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP=
/Tiny.pm
> +index 5803e45..88ba514 100644
> +--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
> ++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
> +@@ -40,7 +40,7 @@ sub _croak { require Carp; Carp::croak(@_) }
> + #pod * C<timeout> =E2=80=94 Request timeout in seconds (default is 60=
) If a socket open,
> + #pod   read or write takes longer than the timeout, an exception is t=
hrown.
> + #pod * C<verify_SSL> =E2=80=94 A boolean that indicates whether to va=
lidate the SSL
> +-#pod   certificate of an C<https> =E2=80=94 connection (default is fa=
lse)
> ++#pod   certificate of an C<https> =E2=80=94 connection (default is tr=
ue)
> + #pod * C<SSL_options> =E2=80=94 A hashref of C<SSL_*> =E2=80=94 optio=
ns to pass through to
> + #pod   L<IO::Socket::SSL>
> + #pod
> +@@ -112,7 +112,7 @@ sub new {
> +         max_redirect =3D> 5,
> +         timeout      =3D> defined $args{timeout} ? $args{timeout} : 6=
0,
> +         keep_alive   =3D> 1,
> +-        verify_SSL   =3D> $args{verify_SSL} || $args{verify_ssl} || 0=
, # no verification by default
> ++        verify_SSL   =3D> $args{verify_SSL} // $args{verify_ssl} // 1=
, # verification by default
> +         no_proxy     =3D> $ENV{no_proxy},
> +     };
> +
> +@@ -1038,7 +1038,7 @@ sub new {
> +         timeout          =3D> 60,
> +         max_line_size    =3D> 16384,
> +         max_header_lines =3D> 64,
> +-        verify_SSL       =3D> 0,
> ++        verify_SSL       =3D> 1,
> +         SSL_options      =3D> {},
> +         %args
> +     }, $class;
> +@@ -1765,7 +1765,7 @@ C<timeout> =E2=80=94 Request timeout in seconds =
(default is 60) If a socket open, read
> +
> + =3Ditem *
> +
> +-C<verify_SSL> =E2=80=94 A boolean that indicates whether to validate =
the SSL certificate of an C<https> =E2=80=94 connection (default is false=
)
> ++C<verify_SSL> =E2=80=94 A boolean that indicates whether to validate =
the SSL certificate of an C<https> =E2=80=94 connection (default is true)
> +
> + =3Ditem *
> +
> +@@ -2035,7 +2035,7 @@ Verification of server identity
> +
> + =3Dback
> +
> +-B<By default, HTTP::Tiny does not verify server identity>.
> ++B<By default, HTTP::Tiny in Debian verifies server identity.
> +
> + Server identity verification is controversial and potentially tricky =
because it
> + depends on a (usually paid) third-party Certificate Authority (CA) tr=
ust model
> +@@ -2043,16 +2043,14 @@ to validate a certificate as legitimate.  This=
 discriminates against servers
> + with self-signed certificates or certificates signed by free, communi=
ty-driven
> + CA's such as L<CAcert.org|http://cacert.org>.
> +
> +-By default, HTTP::Tiny does not make any assumptions about your trust=
 model,
> +-threat level or risk tolerance.  It just aims to give you an encrypte=
d channel
> +-when you need one.
> +-
> + Setting the C<verify_SSL> attribute to a true value will make HTTP::T=
iny verify
> + that an SSL connection has a valid SSL certificate corresponding to t=
he host
> + name of the connection and that the SSL certificate has been verified=
 by a CA.
> + Assuming you trust the CA, this will protect against a L<man-in-the-m=
iddle
> +-attack|http://en.wikipedia.org/wiki/Man-in-the-middle_attack>.  If yo=
u are
> +-concerned about security, you should enable this option.
> ++attack|http://en.wikipedia.org/wiki/Man-in-the-middle_attack>.
> ++
> ++If you are not concerned about security, and this default in Debian c=
auses
> ++problems, you should disable this option.
> +
> + Certificate verification requires a file containing trusted CA certif=
icates.
> +
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-d=
evtools/perl/perl_5.34.1.bb
> index 42bcb8b1bc..af4660091b 100644
> --- a/meta/recipes-devtools/perl/perl_5.34.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D"https://www.cpan.org/src/5.0/perl-${PV}.t=
ar.gz;name=3Dperl \=20
> file://determinism.patch \=20
> file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch=20
> \ file://0001-Fix-build-with-gcc-12.patch \ +=20
> file://CVE-2023-31486.patch \ "
>   SRC_URI:append:class-native =3D " \
>              file://perl-configpm-switch.patch  \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182370):https://lists.openembedded.org/g/openembedd=
ed-core/message/182370
> Mute This Topic:https://lists.openembedded.org/mt/99333636/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------brI4LHzLkmTRV2jEiVZYmlRT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 356CMRpB017050

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-06-04 23:23, Soumya via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230605032300.2325425-1-soumya=
.sambu@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">HTTP::Tiny 0.082, a Perl cor=
e module since 5.13.9 and available standalone on CPAN,
has an insecure default TLS configuration where users must opt in to veri=
fy certificates.

Signed-off-by: Soumya <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:s=
oumya.sambu@windriver.com">&lt;soumya.sambu@windriver.com&gt;</a>
---
 .../perl/files/CVE-2023-31486.patch           | 89 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.1.bb     |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486.patch b/meta=
/recipes-devtools/perl/files/CVE-2023-31486.patch
new file mode 100644
index 0000000000..55c4bd1d47
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31486.patch
@@ -0,0 +1,89 @@
+From 1490431e40e22052f75a0b3449f1f53cbd27ba92 Mon Sep 17 00:00:00 2001
+From: Dominic Hargreaves <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:dom@earth.li">&lt;dom@earth.li&gt;</a>
+Date: Thu, 21 May 2020 22:53:37 +0100
+Subject: [PATCH] Enable SSL by default in HTTP::Tiny
+
+Gbp-Pq: Topic debian
+Gbp-Pq: Name http-tiny-ssl.diff
+
+CVE: CVE-2023-31486
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://salsa.debian.org/perl-team/interpreter/perl/-/commit/1490431e40e220=
52f75a0b3449f1f53cbd27ba92.patch">https://salsa.debian.org/perl-team/inte=
rpreter/perl/-/commit/1490431e40e22052f75a0b3449f1f53cbd27ba92.patch</a>]=
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>The upstream for the YP Perl recipe is not Debian but rather:</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://layers.openembe=
dded.org/layerindex/branch/master/recipes/?q=3Dperl">https://layers.opene=
mbedded.org/layerindex/branch/master/recipes/?q=3Dperl</a></p>
    <p>-&gt; <a class=3D"moz-txt-link-freetext" href=3D"https://www.perl.=
org/get.html">https://www.perl.org/get.html</a></p>
    <p>-&gt; <a class=3D"moz-txt-link-freetext" href=3D"https://dev.perl.=
org/perl5/source.html">https://dev.perl.org/perl5/source.html</a></p>
    <p>&nbsp; git clone <a class=3D"moz-txt-link-freetext" href=3D"https:=
//github.com/Perl/perl5.git">https://github.com/Perl/perl5.git</a> perl<b=
r>
    </p>
    <p><br>
    </p>
    <p>Please find the equivalent patch if it's available there and
      re-submit.</p>
    <p>If the patch isn't there, there is a (not very active) maint-5.34
      branch so<br>
      we should send a PR there and change the Upstream-Status for the
      oe-core commit as needed.<br>
    </p>
    <p>../Randy</p>
    <p></p>
    <blockquote type=3D"cite" cite=3D"mid:20230605032300.2325425-1-soumya=
.sambu@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
+
+Signed-off-by: Soumya <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
soumya.sambu@windriver.com">&lt;soumya.sambu@windriver.com&gt;</a>
+---
+ cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 20 +++++++++-----------
+ 1 file changed, 9 insertions(+), 11 deletions(-)
+
+diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/T=
iny.pm
+index 5803e45..88ba514 100644
+--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+@@ -40,7 +40,7 @@ sub _croak { require Carp; Carp::croak(@_) }
+ #pod * C&lt;timeout&gt; =E2=80=94 Request timeout in seconds (default i=
s 60) If a socket open,
+ #pod   read or write takes longer than the timeout, an exception is thr=
own.
+ #pod * C&lt;verify_SSL&gt; =E2=80=94 A boolean that indicates whether t=
o validate the SSL
+-#pod   certificate of an C&lt;https&gt; =E2=80=94 connection (default i=
s false)
++#pod   certificate of an C&lt;https&gt; =E2=80=94 connection (default i=
s true)
+ #pod * C&lt;SSL_options&gt; =E2=80=94 A hashref of C&lt;SSL_*&gt; =E2=80=
=94 options to pass through to
+ #pod   L&lt;IO::Socket::SSL&gt;
+ #pod
+@@ -112,7 +112,7 @@ sub new {
+         max_redirect =3D&gt; 5,
+         timeout      =3D&gt; defined $args{timeout} ? $args{timeout} : =
60,
+         keep_alive   =3D&gt; 1,
+-        verify_SSL   =3D&gt; $args{verify_SSL} || $args{verify_ssl} || =
0, # no verification by default
++        verify_SSL   =3D&gt; $args{verify_SSL} // $args{verify_ssl} // =
1, # verification by default
+         no_proxy     =3D&gt; $ENV{no_proxy},
+     };
+
+@@ -1038,7 +1038,7 @@ sub new {
+         timeout          =3D&gt; 60,
+         max_line_size    =3D&gt; 16384,
+         max_header_lines =3D&gt; 64,
+-        verify_SSL       =3D&gt; 0,
++        verify_SSL       =3D&gt; 1,
+         SSL_options      =3D&gt; {},
+         %args
+     }, $class;
+@@ -1765,7 +1765,7 @@ C&lt;timeout&gt; =E2=80=94 Request timeout in seco=
nds (default is 60) If a socket open, read
+
+ =3Ditem *
+
+-C&lt;verify_SSL&gt; =E2=80=94 A boolean that indicates whether to valid=
ate the SSL certificate of an C&lt;https&gt; =E2=80=94 connection (defaul=
t is false)
++C&lt;verify_SSL&gt; =E2=80=94 A boolean that indicates whether to valid=
ate the SSL certificate of an C&lt;https&gt; =E2=80=94 connection (defaul=
t is true)
+
+ =3Ditem *
+
+@@ -2035,7 +2035,7 @@ Verification of server identity
+
+ =3Dback
+
+-B&lt;By default, HTTP::Tiny does not verify server identity&gt;.
++B&lt;By default, HTTP::Tiny in Debian verifies server identity.
+
+ Server identity verification is controversial and potentially tricky be=
cause it
+ depends on a (usually paid) third-party Certificate Authority (CA) trus=
t model
+@@ -2043,16 +2043,14 @@ to validate a certificate as legitimate.  This d=
iscriminates against servers
+ with self-signed certificates or certificates signed by free, community=
-driven
+ CA's such as L&lt;CAcert.org|<a class=3D"moz-txt-link-freetext" href=3D=
"http://cacert.org">http://cacert.org</a>&gt;.
+
+-By default, HTTP::Tiny does not make any assumptions about your trust m=
odel,
+-threat level or risk tolerance.  It just aims to give you an encrypted =
channel
+-when you need one.
+-
+ Setting the C&lt;verify_SSL&gt; attribute to a true value will make HTT=
P::Tiny verify
+ that an SSL connection has a valid SSL certificate corresponding to the=
 host
+ name of the connection and that the SSL certificate has been verified b=
y a CA.
+ Assuming you trust the CA, this will protect against a L&lt;man-in-the-=
middle
+-attack|<a class=3D"moz-txt-link-freetext" href=3D"http://en.wikipedia.o=
rg/wiki/Man-in-the-middle_attack">http://en.wikipedia.org/wiki/Man-in-the=
-middle_attack</a>&gt;.  If you are
+-concerned about security, you should enable this option.
++attack|<a class=3D"moz-txt-link-freetext" href=3D"http://en.wikipedia.o=
rg/wiki/Man-in-the-middle_attack">http://en.wikipedia.org/wiki/Man-in-the=
-middle_attack</a>&gt;.
++
++If you are not concerned about security, and this default in Debian cau=
ses
++problems, you should disable this option.
+
+ Certificate verification requires a file containing trusted CA certific=
ates.
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-dev=
tools/perl/perl_5.34.1.bb
index 42bcb8b1bc..af4660091b 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=3Dperl\file://determi=
nism.patch\file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-dete=
rm.patch\file://0001-Fix-build-with-gcc-12.patch\+file://CVE-2023-31486.p=
atch\">&quot;https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=3Dperl \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-det=
erm.patch \
            file://0001-Fix-build-with-gcc-12.patch \
+           file://CVE-2023-31486.patch \
            &quot;</a>
 SRC_URI:append:class-native =3D &quot; \
            <a class=3D"moz-txt-link-freetext" href=3D"file://perl-config=
pm-switch.patch">file://perl-configpm-switch.patch</a> \
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#182370): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/182370">https:/=
/lists.openembedded.org/g/openembedded-core/message/182370</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/99333636/3616765">https://lists.openembedded.org/mt/=
99333636/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------brI4LHzLkmTRV2jEiVZYmlRT--

