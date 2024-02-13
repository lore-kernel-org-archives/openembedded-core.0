Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549D4C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 18:12:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19050.1707847935866498911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 10:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=FfCcLC7r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27731d4e0c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41DI7gYm021124
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:12:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=VJTbNtNGGuMbomOPN8n
	uS+o9Zyz3yhSYsBMfL74NkKM=; b=FfCcLC7rdHdSPao0IjJtAtgTN8F3MSqKIlz
	nUJ8eAO3Pof0GVAVrBWdXPwrCTW/6BaCF5ZpTO/gIOHEwOGV00XRqasfhm/tKp68
	c62lZwB2mHd+4B3ft58jtkrIFPjDjMIXem65+HSl3RgFV3xlYq4B6WLgO3cYrV5H
	UwVvLCY++lM1F+16EgxBoD+0ancmacQRIZvwhOX3GWOALiR8czZORFMHs5TqpxhN
	lkGLLsgeGqCDbzsGthawdpQkXPaO28m+jJWM2PtAlhvJWD2gbejrfTk1ghzamaLc
	N3GEOY5dllGzpeH55ebN3H/UGVFhftu2nJc0u+9S+yjHYcsRIjw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w69hm2nwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:12:15 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41DIBV35026425
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:12:14 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w69hm2nwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 10:12:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXIXm/X7LqKb2whsCtG9lYJa2dqPXpgmM2egxTCYFZUT943QUtOfkArceFeKAvG37JrzdvxWmkcXTq7232qB8Bj++bw1XtKS5yL8RumOTRvMFK4/3k+0q40bUB8qX8xQPSQ0rnZ0PiEp5ra3f2qjeQAW9uIQiGTqZkuOw27fh6UBG4tk3oNh01WvNVi1oHLjViC9WTAihhofSvqTqB3vHwj7zocGM9k0LzsQvY/s5SzvfDDVAdFmiR/dkQS82362em+XPs4W7Tj+M+5T/rjJHKbJDAObJj9I0nrYKj8j+GtsxvThlkIPnpaX5Tw0qy/MbWqCwZUNMt01QhLQmijmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJTbNtNGGuMbomOPN8nuS+o9Zyz3yhSYsBMfL74NkKM=;
 b=kqnKZkRUXgNBrjNVjfvsBKkIfCMcm8KtfxKXpeJaFJ/ZHodNJjRcHerfmdDHvP9cgEQdMCA5XEYwO8Y8W+ndALBeDPVNU+lhIpv45NE/6wrUfRKtcXrALms3exgW5MvO7Vytox8gKrVIwYiMGPVs3hiGf8i88zpRYFZeWvRzQlI4CkDTKKZx36wjlq8PkKIPf10PZ4fMkl2U/LDA5UyZFJFVNV0Vi+53n9fcIycJBWJ/8QgVNM66gFR6SeYJeYIAT5aCJ7xHQIRKs0dOZiJmV8r2qqDdDTH5zOdaS3sX5UIpU7q3uXVRSLQ8kqMf0GIT0SNZSCSGNmc2hoSXxfsCjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Tue, 13 Feb
 2024 18:12:08 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 18:12:08 +0000
Content-Type: multipart/alternative;
 boundary="------------eEZp03K0M0Gc3XJoBWgLRVSm"
Message-ID: <0a8900ca-34e0-4c2d-af94-bf6b54f18956@windriver.com>
Date: Tue, 13 Feb 2024 13:12:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Oe-selftest error log on console when it fails.
Content-Language: en-CA
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Joshua Watt <JPEWhacker@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240213130404.3285564-1-Yash.Shinde@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240213130404.3285564-1-Yash.Shinde@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a3f2813-a2fb-40e4-67ec-08dc2cbf4a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KwKxVgAtBZruy5KiGk/BozZL5rtYxasQipO+Ory40NygTEh7P3Im9agwguBj48uTcxM/t9meBM0jGiPKdY8JrP6oeqrqSwUaY7xQf5zlsluKYPfguThNBP8qaLJdqHhTWaK8t6Xhd9cy4YYcQou8RsaWYGDYtdUVut5SSu5fNCy64pg2qn9Lwu0JF2ixx30kfGJSOlPevZLzT8PsiHBEEDHhwy1UmDS17cK9eqSiNGynZLbNeNYk3/a9ibJCIl6V5DXhH1eaB5Z/MKEGGYkcQtqwwUPQBDzL/3BpSNHSF9U7dokIWCm1aUJnmOH+bmUv2GowxrrVMUP3ODEp+OgBOvD4YUDEknBH9oyk5GYxMH73fdZt0RmaPyPTl3yvzYhyuZGbHFnQ8kqg4WY64uUevx4hSFX7STdnqTQ6erZpBzwA/qBflTF7dsN6VD/AEnV2JfIWwsK/jpqbMhck2wOg9FFepnWs+zJ8b1rms83AP5C0c/MU6G39hL2LaZll3rbMRNP0pOikrBee6c/eWtS/1YyuWFQYEaYz7FIhTRIeRDQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(136003)(396003)(346002)(376002)(230922051799003)(230273577357003)(64100799003)(1800799012)(186009)(451199024)(6512007)(966005)(478600001)(6486002)(31686004)(41300700001)(33964004)(8676002)(4326008)(8936002)(5660300002)(2906002)(66556008)(6666004)(66476007)(54906003)(66946007)(316002)(6506007)(31696002)(53546011)(2616005)(83380400001)(86362001)(26005)(166002)(36756003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eEFnN0ljMGd2MTRBWW5QK3dKSEVMalUrYWZyUkFRQnRHODNzS0h5S3dlclF2?=
 =?utf-8?B?V3d3Q3BoK3pnWVlNc1lZUXJ1b1YweHoyYXdaN1piL08wTlR3dys0Um5EbmdD?=
 =?utf-8?B?MTI5K3ZaRWVmaUxiZWE5STMxT1ZkaE9zU2w0MUJyeHc1R1BGUUN3OWZ1cEt5?=
 =?utf-8?B?L2JlVGpGbUc0K0NKblNCU2phbVZzdTdQelRhS2t3NWdoOGxRQVBPSEE0NzVM?=
 =?utf-8?B?aHR1Y01rdE84Vm1weG9GVUdmWWlhaGw0T0NaMW1nM1JveFNGZVR3VVBCR1NI?=
 =?utf-8?B?bmo2YS9RYWhTYVd5UDZRTlZxUnREVTR6eGZFdVRJOGVTaGh4SitHbVF6cTBw?=
 =?utf-8?B?dk5vQ1R3ZFVPL3VPTDUyR0lPNmVMV3ZMcXIzeWoyd0pVSmF1ZXFWQmJsQ0Rw?=
 =?utf-8?B?Z1MreGNFUGFraDZpcEJNQkpaaE92bm01Y1Q1dStNK1gvUk9vQ1crcW5ZSC8w?=
 =?utf-8?B?aGVLSytRT24rSmIraXZ2Y3ZKMnQ3Wlo4WWdabEpUUGV0OEg3ZUYrdFQzZWZO?=
 =?utf-8?B?c29BaC9jVFFyV2NmUHM3Z3NEblUyMGVWT2ZyR29zM3NrNHFGZW5UZmpIb2xm?=
 =?utf-8?B?SWhnaU1URE5IR2k3UGc4b0FEUkdwdUc3Mk10dVM5TEhmZ1dRNmQzdzU4WEJS?=
 =?utf-8?B?UEgvQVB5ajZhb0hHS0pZMUpHS2l2YUpLRHg4R2RjTmxwSUxRNlVyZFBRVmZM?=
 =?utf-8?B?YmFJaHJBbDE1anRDT3E5S3VzRnBoSUg4MkFJSWs5dzhCa3pQVlA5dDh2ZUJV?=
 =?utf-8?B?dHZPQ3lrSmI1d0tOYXVpRStFZUM0bkZ0ZUVpR0M0dFNBZFpaTm02Vlc3bkJh?=
 =?utf-8?B?dys3VTlXZUlpdThzYXlBRkkwWkRwdk1KYjFyZFVaUkJac3ZzaWs4TGxpNG4r?=
 =?utf-8?B?WElyN3dLL3E2S0krbGpTblNLRzgvN3Z6dit1a2NqazVIWW9sQXgwbjVHWVNw?=
 =?utf-8?B?T1lIWk1WcTZlcDZqc2NXTUZhZU55SFZlY091TGIwMXpOUnFmVVRaT0JzQVpP?=
 =?utf-8?B?eVBpMGZmWWdoNUVCN2hlWmJxTlU4dytvU0d1aDlzNzNGME8waTFQRlZydXMz?=
 =?utf-8?B?TUZQZVlPRlVDUDVOc2MrRS9nQWV0eGZ1R3lnT2hMQythL3ZieS9lNUp0Mi9t?=
 =?utf-8?B?anVlZmIrT2M2Vmo0cXpVZW5QUS95TFZzUWhRS0hYUHVEUGtjTmtPV0lHaUlI?=
 =?utf-8?B?L2w0L05BdUxURUNISUR6Qy9Ja2hKTHRrMnQ4YzBTTnV2UEZXYXVrMUhlSVQy?=
 =?utf-8?B?WlJ5QVFrSEdiQVJoaGNlbnl6amJ5RnhDeXpUdDlHU3RsOVdET3g2Zi9TY1Zh?=
 =?utf-8?B?VVRvZTEvby8wUVZMZ3huOEVQREY2T1JYOFdzMEZ4VWJvcU9TRURmcm1NUHpm?=
 =?utf-8?B?WjNJV0lHS0dIakNFTEEwR1pmZWUrVzhlc0hrcG5jSFQ4eDFqOHJzdmFpcGow?=
 =?utf-8?B?ZUlKZU5hQS9vdnlhNGJBQTlBakMzbHV4SHA4SVN0ZmxWUDVpYVQxYkxwelFk?=
 =?utf-8?B?YzhieWRkeWl5UTJrcUhBZkdvdi9QeE9sU2VpZXFqTVpMdExxS3o0SURTZFVj?=
 =?utf-8?B?b0JmTkdGSWlmN1g3SG94TkdsaDZvMHZiWnZrUjZjVUd6cS9sT1FCcWpIUDl4?=
 =?utf-8?B?US9OL0RSWjFOYXl5NHJsWTNLRUJRT0ZTSEpXek9sb3BXZlJRRnU2cW1JU1NW?=
 =?utf-8?B?bzNlOHhkRFVLNXhlZmFjbHE4a2RzZHdWNS9rTW53bVhJYW1zT0w4VnFqRGJT?=
 =?utf-8?B?dThOSzJ5TUtwRzNxM1l6VW1zdm1xQVhkeUJVTGFsT3ZpUWtlNTJRNE9IcmpC?=
 =?utf-8?B?dzYvNU9qeDVPVWozU3A5OEdyODlZL2RsTkhvdFYzby9rSlc5WDFLY1pwTlhu?=
 =?utf-8?B?VGhHOGRtWDhoOFo2eHJWK2VlQmpROU9oMkE4NTduS1NvQjd4OGM5NG90RzZh?=
 =?utf-8?B?d1BGUDJOM20vM3FkMXFBN3BmWFZZWGVDWStPdHVxcVlGQ3lzc3p2MnRFdEpv?=
 =?utf-8?B?SlpDQnNnNDk2OWxTQWl1UzFxemRuVFIydWw3eWc1N2RWTG01UWNBcEtkNjlF?=
 =?utf-8?B?TEFDMGFZRTYySW5uc1BNa3ZudGdiV0tqdnorSjJVSzFpci80MHUyUWpmSGk5?=
 =?utf-8?B?KzNFSnozZEkwcXJwc1I4Vlp6dzdYaS9kckRIUkdiQ3hkU2JNMUJoTlFPWkE3?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3f2813-a2fb-40e4-67ec-08dc2cbf4a75
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 18:12:08.1116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3aBBqlFadTVoO7/Df3LsXzwLMOwmVRDETCsATYedSfLko3YeJa777ukGIkGr5RKAbS5Fgrop+xU2Qq7HSUBlUmsnGZYoxHJ2P2AYHLYRx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-ORIG-GUID: 3UCKIXtQegOTf2gx5rU6n62uiYK48E0t
X-Proofpoint-GUID: C85R_-G8E0FkY2Op60yQS79Kb0LSfkFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_10,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 18:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195424

--------------eEZp03K0M0Gc3XJoBWgLRVSm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41DI7gYm021124

On 2024-02-13 8:04 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> The rust oe-selftest output error log doesn't show any information on c=
onsole when it fails.
> The following changes emit stderr logs in terminal along with re-direct=
ing stdout and stderr to "summary.txt" file.
>
> Changes made::
> - cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --t=
arget %s > summary.txt 2>&1;" % (builddir, testargs, targetsys)
> + cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --t=
arget %s  > summary.txt 2> >(tee summary.txt >&2);" % (builddir, testargs=
, targetsys)
>
>> summary.txt:                  Redirects the standard output (stdout) o=
f the command to a file 'summary.txt'
> 2> >(tee summary.txt >&2):      Redirects stderr & stdout to summary.tx=
t & writes stderr on terminal
>
> The overall effect is that both stdout and stderr are captured in the s=
ummary.txt file, while stderr still being displayed in the terminal.
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/lib/oeqa/selftest/cases/rust.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selft=
est/cases/rust.py
> index 164ad11ecd..07f1b5706c 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -213,7 +213,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase=
, OEPTestResultTestCase):
>               cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rust-targets=
;" % rustlibpath
>               # Trigger testing.
>               cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";" =
% qemu.ip
> -            cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py =
test %s --target %s > summary.txt 2>&1;" % (builddir, testargs, targetsys=
)
> +            cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py =
test %s --target %s  > summary.txt 2> >(tee summary.txt >&2);" % (builddi=
r, testargs, targetsys)
>               runCmd(cmd)
>               end_time =3D time.time()
>  =20

Hi Yash,

We talked about this change and decided that it's just too odd a shell=20
pipeline to merge!

Also, it depends on the bash shell as you can tell by pasting:

 =C2=A0=C2=A0 #!/bin/sh
 =C2=A0=C2=A0 python3 src/bootstrap/bootstrap.py test %s --target %s=C2=A0=
 >=20
summary.txt 2> >(tee summary.txt >&2);

into https://www.shellcheck.net/ . You'll see the following log and error=
:

$ shellcheck myscript

Line 2:
python3 src/bootstrap/bootstrap.py test %s --target %s =C2=A0> summary.tx=
t 2>=20
 >(tee summary.txt >&2);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^-- SC2094=20
<https://www.shellcheck.net/wiki/SC2094> (info): Make sure not to read=20
and write the same file in the same pipeline.
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^--  SC3001 <https:=
//www.shellcheck.net/wiki/SC3001> (warning): In POSIX=20
sh, process substitution is undefined.
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0^--  SC2094 <https://www.shellcheck.net/wiki/SC2094> (info=
): Make sure not=20
to read and write the same file in the same pipeline.


The YP goal / requirement is to avoid bash dependencies since user may=20
be using dash or some other shell for /bin/sh.


I think that the command is being run locally (not on target), and we=20
are already in a python context so
it seems that we would have a simpler solution if we handle the IO=20
redirection from python.

Perhaps Richard or Joshua can recommend some code that you can reference=20
when making this change.

Did you have time to look at the log file handling in runCmd()

https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/c=
ommands.py#n168

Please do some analysis and reply here every day or so as=C2=A0 you learn=
=20
things or have questions.


Thanks,

../Randy



--=20
# Randy MacLeod
# Wind River Linux

--------------eEZp03K0M0Gc3XJoBWgLRVSm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-02-13 8:04 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240213130404.3285564-1-Yash.Shinde@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

The rust oe-selftest output error log doesn't show any information on console when it fails.
The following changes emit stderr logs in terminal along with re-directing stdout and stderr to &quot;summary.txt&quot; file.

Changes made::
- cmd = cmd + &quot; cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s &gt; summary.txt 2&gt;&amp;1;&quot; % (builddir, testargs, targetsys)
+ cmd = cmd + &quot; cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s  &gt; summary.txt 2&gt; &gt;(tee summary.txt &gt;&amp;2);&quot; % (builddir, testargs, targetsys)

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">summary.txt:                  Redirects the standard output (stdout) of the command to a file 'summary.txt'
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">2&gt; &gt;(tee summary.txt &gt;&amp;2):      Redirects stderr &amp; stdout to summary.txt &amp; writes stderr on terminal

The overall effect is that both stdout and stderr are captured in the summary.txt file, while stderr still being displayed in the terminal.

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 164ad11ecd..07f1b5706c 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -213,7 +213,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             cmd = cmd + &quot; export RUST_TARGET_PATH=%s/rust-targets;&quot; % rustlibpath
             # Trigger testing.
             cmd = cmd + &quot; export TEST_DEVICE_ADDR=\&quot;%s:12345\&quot;;&quot; % qemu.ip
-            cmd = cmd + &quot; cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s &gt; summary.txt 2&gt;&amp;1;&quot; % (builddir, testargs, targetsys)
+            cmd = cmd + &quot; cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s  &gt; summary.txt 2&gt; &gt;(tee summary.txt &gt;&amp;2);&quot; % (builddir, testargs, targetsys)
             runCmd(cmd)
             end_time = time.time()
 
</pre>
    </blockquote>
    <p>Hi Yash,&nbsp;</p>
    <p>We talked about this change and decided that it's just too odd a
      shell pipeline to merge!</p>
    <p>Also, it depends on the bash shell as you can tell by pasting:<br>
    </p>
    <p>&nbsp;&nbsp; #!/bin/sh<br>
      &nbsp;&nbsp; python3 src/bootstrap/bootstrap.py test %s --target %s&nbsp; &gt;
      summary.txt 2&gt; &gt;(tee summary.txt &gt;&amp;2);</p>
    <p>into <a class="moz-txt-link-freetext" href="https://www.shellcheck.net/">https://www.shellcheck.net/</a> . You'll see the following log
      and error:<br>
    </p>
    <p>$ shellcheck myscript<br>
      &nbsp;<br>
      <a class="linelink">Line 2:</a><br>
      <span class="sourceline">python3 src/bootstrap/bootstrap.py test
        %s --target %s &nbsp;&gt; summary.txt 2&gt; &gt;(tee summary.txt
        &gt;&amp;2);</span><br>
      <span class="info pointer"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^--
        </span><a href="https://www.shellcheck.net/wiki/SC2094" target="_blank" class="wikilink">SC2094</a> (info): <span>Make
          sure not to read and write the same file in the same pipeline.</span></span><br>
      <span class="warning pointer"><span>&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^--
        </span><a href="https://www.shellcheck.net/wiki/SC3001" target="_blank" class="wikilink">SC3001</a> (warning): <span>In
          POSIX sh, process substitution is undefined.</span></span><br>
      <span class="info pointer"><span>&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^--
        </span><a href="https://www.shellcheck.net/wiki/SC2094" target="_blank" class="wikilink">SC2094</a> (info): <span>Make
          sure not to read and write the same file in the same pipeline.</span></span><br>
    </p>
    <p><br>
    </p>
    <p>The YP goal / requirement is to avoid bash dependencies since
      user may be using dash or some other shell for /bin/sh.<br>
    </p>
    <p><br>
    </p>
    <p>I think that the command is being run locally (not on target),
      and we are already in a python context so<br>
      it seems that we would have a simpler solution if we handle the IO
      redirection from python.<br>
    </p>
    Perhaps Richard or Joshua can recommend some code that you can
    reference when making this change.<br>
    <p>Did you have time to look at the log file handling in runCmd()<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/commands.py#n168">https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/commands.py#n168</a></p>
    <p>Please do some analysis and reply here every day or so as&nbsp; you
      learn things or have questions.</p>
    <p><br>
    </p>
    <p>Thanks,<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <br>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------eEZp03K0M0Gc3XJoBWgLRVSm--

