Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5BFC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:55:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16786.1644198922554810272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Gi62Hvbi;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9037c3f122=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2171s4L0015463
	for <openembedded-core@lists.openembedded.org>;
 Sun, 6 Feb 2022 17:55:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=em0rbd+xRK04UBrHtdnv0Q3eW6QiVweB8A0obKDKuwo=;
 b=Gi62HvbitABBm2FWwIR1SkJtAvCqThZcz53qGstEJS/SgAHXF8/2KyHDHh2MXSIniUeI
 IeF4SFA8r4X/aukNvE6fWFt+XHnuF7iViqr9yUh6xkqKnkAPlEWGtwqGyTWmY9LI9Ffo
 2RstzIbhMLSy0+t7aWX9HY59GW5g0jsb6nfCV/spCsCOVT8nFvaCaYKLVx3aJcRthC8o
 czupOlRXuDElxuRnat2k42dlneui796QHeKCp4xiHwF6YrUpbpQ0ymsaol8Tji1taVPQ
 9jimF/cmCtPPsDYmOLIXnncPYoBUXJdcfpkPNwIdkvAahJymOuIZuN039xJD4aLMvUGg wg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e1nd68wnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:55:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw91/WvSpuNWd2lvE/FbPbcnafXrYsV09SHkCJkx+uqry9VZ+m+ruphkl/D+Hjx+yBdGEwb7cHPmvzZBVmbGGA03VbEEXjnQMIwf0XOtm+CpmNFrRXIQTkP5sVfqxRh7EXPA5wC6KEx1dVAzOZkNOjEd5DFvE/1jaYRkbSqJm4ulvkuESex5AA1RDB4c0cUhx3wBesxjvNcvGrfSJBiFfDr83UoZk6FomOjzR+BMmk/7QX/eBAxiidfxMK6A7eAd4Jay4WfSCpxf4og+ffReyZhRjPM6pKeSEKxCU+FM9UQRyvOrG2h8FLEu5BosOajHk5mt6odsJSHqz4mkpRguUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=em0rbd+xRK04UBrHtdnv0Q3eW6QiVweB8A0obKDKuwo=;
 b=ZYksmppxgsFiAiFVE6xNFLaypS1piVYTPMTad5AZ1bnlNs0ydJluoNHdsoI2xjlLVZJ9Wxgqnw9BvmYf/aAjgYn/hvLcRAiG3fqRXJPfJ9U1Xm4db88uVEtQ3OiMWvf7Wvmgzq9P7G0tf8/r+H6/VWOcR9ML10WReI5DVMt9aaqqA3SWNuGUHC+neXm+gCiV7SuS7vLv2qpq+7REWYXDse+yT32yYnNdBkalOJpuYegIbKq4d9NnDpoY1O8zRBYiO9xptM04dqDEHtYm4AErBg0iltoxvXZYChzQPgG1RSICzYTrqkj9u0mYdARXobbzgbS2zEL4XlFZ4Y4Prv9Tyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN6PR11MB3342.namprd11.prod.outlook.com (2603:10b6:805:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 01:55:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%8]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 01:55:19 +0000
Subject: Re: [OE-core][PATCH V2] mdadm: install mdcheck
From: ChenQi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <16CDBF9B1327A14F.24088@lists.openembedded.org>
Message-ID: <b1e330e4-c72b-24a1-08fd-8df4f904b642@windriver.com>
Date: Mon, 7 Feb 2022 09:55:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16CDBF9B1327A14F.24088@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------1B9A4DE49EF6BE064C9C4275"
Content-Language: en-US
X-ClientProxiedBy: BYAPR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:a03:54::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a8bc56-57a1-43b1-9e92-08d9e9dce482
X-MS-TrafficTypeDiagnostic: SN6PR11MB3342:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3342842D1E4D01D4F3CFAE42ED2C9@SN6PR11MB3342.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FxmeW+4rD/vphyhGxty3M1nIEJoH34rW/Znb7aZC8g9xRGqTXrAWqClk4gvSaQaWLMskUKhCRMWuRhQAZKyWDy67Ai7FJ6K4+cRfH6ypti7Sn2LWFphVibubVIpg6Qs4ZN+FnSKjAjowrBwVDOKhxzwTZG/7/PGiSpzWD0ngUewPMPQOaiTdEJ359xLpaLcuFxKRCC1zyOOZT7W88VRxiiofz/4YDFLF4J1vYwL5KWJzT46U3s1wV+EHNo6Kq/u3ZM1iQxJJb/Et8IjFb4mljZpHOuIjfJMfk3Hit0ykRxgy13OT0Ch+k+C1MK9f/EB3waoAlAD3x9uT0923jc8imyEP4PJK2NCHGYFSID6yWf6QBepv9qWp8DG/CYWaceUD/iX/T28HrIpWtoewhoi1CMiB+PD4afND6qVjOV62ZBo4oxZi6Gf0WN/Rckhln0NPfOJL6+6IOmgG45acjfr80ziRPotUPdlildv9dNel9rVFw7ZmsxgmlacsTqB7o9F/Ud4Q4cc5wvLmLhE7QM2lHFcLzhGUyz9uY2oBwi6xiE+vsxWCL3KIhBs55jhJxNkobhEC18rTwsRydR1vtSryWHkslZFKVAsFE/i6iFAG8DALC8yQ4k4cempjAVt+GBaJF1cGapD5bKTl5KVzVu2UauhU6s3tdLFd1R+Wuvr+yx7E8SSZDABeOQW1+6yL6FO0LE/go1ah/AI3/ogR2Bzmpn2kji0crAiaXd6wdbjn3Z7k7kbotVuRRj1mudnn45Y0pJpqMAW/cd1Sjh7z2wDemCG0epYpZlc5eTrSpgKJX6FbM9XH63swcpiFiWdmpw0iCM/FWqfdX1Cp3SwbOrgSyTOFFm6LHuZGI1QFFuKEHMuWbORjmOpiAt95PjPHSCr/ikAwemgwUCc2EB8K/hT326u7GOsS8ZxTub4OV12Dc8w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(166002)(66556008)(38350700002)(66476007)(36756003)(38100700002)(316002)(8676002)(66946007)(6916009)(508600001)(5660300002)(2906002)(83380400001)(26005)(186003)(6666004)(33964004)(52116002)(966005)(6486002)(2616005)(31686004)(6512007)(31696002)(86362001)(6506007)(53546011)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2g2VGV2V2EvZGhLcnMrY2MwOVBMZys2OEx0TVRJb2ZhR0xkM2s3ZDNKVUd4?=
 =?utf-8?B?ZEYwRFFhTEMvRXhzQkJGdGxUekVBYkpqYk1mZ0pyMTl5aTZFMk1iZzBwQ0dE?=
 =?utf-8?B?Vm95OXcxWnBFSnZZTVNQcDBTMVhkbWpDN3ROc1p0NjRCV1NTODA1OVFJOFRi?=
 =?utf-8?B?UzJ2L3g0VEZPZk5UTW52TGpING5tNFN3WnEvaVZFV2dSWDg2NklVMnlGdzhy?=
 =?utf-8?B?cnNVdXFhTUVCVzV1bjVncnBwV0RLcUY1SkJkK3g1bGlmQ3V1d1FsanpQZ0Fr?=
 =?utf-8?B?dytMVXV6Rkt3V2R6RHV2UEsxbTBNMFhEeUhHemR1Mi8vRUZGTmN6RkxUbGhR?=
 =?utf-8?B?NGlzVmRrRUlmR05oOU4zdm5TcDFKRHFvUmZVQUJDTjRxcUUrSUlqTWxPSllN?=
 =?utf-8?B?UTdXdkF1UEwydnRIRDVyU2dmRjdmNEIzdVJhc0t2aEZXM0NpZmVQa3hEaGZU?=
 =?utf-8?B?UHQ5T2VSQk5HTFZEU1BCWHMyTm9sYk9EQXBDTnpqcUoxa1RnOXpyMnkzeG81?=
 =?utf-8?B?R2RqdEJRcXZBRlhXNGJsTmFEL1FHbjhJVmhTS3ZPMFlBMzIrV05sVTFHNzcw?=
 =?utf-8?B?THYxT3Qrb2p6MlpRMFU0Y0RkMStpTkQ0RnVBc2gzanpYNEJHa2NMcWpiY2hB?=
 =?utf-8?B?TWZ4Rkh2aTh3dCs3VzlGWDJnTmEzOWxnSWI3Uzk3K3dlNVRJbWpqbDRhb1pM?=
 =?utf-8?B?U0JIdVR1Q3JzdE1vTWJxR05COW5hT2VCOHRBVkw4WGZaQmcxSi9ROEV0ZmFl?=
 =?utf-8?B?MTRyWWdFZVRRUm5HWVU0U3cveUljNXdYOURWK24yZWY5WlV5dnlBS1VyNi9C?=
 =?utf-8?B?dldwWHpoN3A2UVJ0d0IwNm9ueTdzVlI3MUl6cXhUWnFtZG5ZUkEyTHJiR2Ez?=
 =?utf-8?B?ZTlqQkg1bVJxWVBGRGp4TDhFdG5FSDIrVVRJbkFyU0xjdHp6aE9VU2lKRysr?=
 =?utf-8?B?YUNxRDR5ZDlkMDRZNkxhOVZQcGUyQkVLWW9jOFZFckdPVHpvdzM1cDlTQURl?=
 =?utf-8?B?TkRNSlQyNE5ybmtISVdSc0R3R3BpQ3AwTWdDUW10VG9uTDNkUHJBRGJHYkNR?=
 =?utf-8?B?bVZ0aS84eFZkKzhiVDdSQ1MxckxXVUYwNUVDTTNvSWl2T2tpR1VNVVZQNEtQ?=
 =?utf-8?B?NVNlbkdBUkxSMDZ5ajh4dG5vczF1YUVOci9oYUZzaWFzWTFuODlMYkRrMXN6?=
 =?utf-8?B?RG5JZUFwYnVOdGo1ODN4UUtXVzZPbDN1TVZlU1hER1lkVGVaczZnZVJWY1dR?=
 =?utf-8?B?Q0lVc2VraGd1SkdtalUyLzU1UUdyMlNNKzJYYStGeUFuNXdBbnhLMGQvRTkz?=
 =?utf-8?B?YXZOQm44QTJTYkFhM3lBVVdKZkhVVWFzQVZwWHlsNW5pQ0h0VXVkY3JFK041?=
 =?utf-8?B?cUFPc09QNkhsRW9KeXVrdlJNNGlkdE1lV3EyRGNXVGRpUDdRSVpuT2JpTWt5?=
 =?utf-8?B?SDgxNkFFZGdLQkVlQXVNZVRQSmpERkpiL1c5eGJuTGEyM1B0bnVSRUw3VmJ6?=
 =?utf-8?B?REdiTzczMTRrVGpvc3hwcUg1Vkc4S2h1c1RvMXc1ZHFaZUt6S1I4WjYvQXFX?=
 =?utf-8?B?Zm8vNGVPUnZ0aTJoYXBSZFFyZkM3UVVpaElZWjRxK1MveW90VXBaZ1FlTWhu?=
 =?utf-8?B?NVJPdHpyd2VkRXU5ZUNhUVhDcXFmV0tYb2I1dzVoSkFPWGRldFVOVzJzZUEz?=
 =?utf-8?B?ZDFNYU1UT1RaTmJKNGpGZDgzVzZFTTBRN1FnSnN1V0YxUlFJYjNoNzFuUFhW?=
 =?utf-8?B?VVBaOHN4M1oxZ0JVL2M1S0hHakxiS2lxTmNGeDJDNEhneitQMUdkbVRUNmpl?=
 =?utf-8?B?RzhZZjZtVHpGaXFTbjM2TE91ZVdTNUNBNkhxMFVIUUwrK1ZuNFlzbms2L2hF?=
 =?utf-8?B?RlltMUJ3aGlBdlE1YlFyVWZ4WHV0UVlGeFJlL3kxcHJvMFVTSEQ1VnVCeTIy?=
 =?utf-8?B?VTFEd3UybGJ6Qk9VNlJ1VXVyS3RjakNBU1ZaVlBHVitIdGo0OUs0VUhtUERp?=
 =?utf-8?B?UXM0M0V1a281U1VCRzRIdXplK2VHbXRuTjdFUTVkMW9DaTNCQUE1cDl5S0Yx?=
 =?utf-8?B?ZytkRXpZWFBVaWVQZ0QxSytHTTZCRHp2Yzl6QXlGb2ZKSkFjM3ZCbDNXcVNU?=
 =?utf-8?B?L3RqQ2xLVDRRSmRGY0E3OUF4MGlZWTJ5ZWREeXRaZ3YrZ0lvdUZhZDBNUWFl?=
 =?utf-8?Q?1/wGHzIZZcjqPUNerLriabo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 74a8bc56-57a1-43b1-9e92-08d9e9dce482
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 01:55:19.0008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6EGnNd2Ya4m/IAOdbDc7hV6LaDMtoUMWQ/cxMELJmZWZ43rjNs9h76GQg377AJ/cI8RF1VdO0F8DmRMQRfXDBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3342
X-Proofpoint-GUID: LrbifKBRT5gyVo_RlTjz4-5IcSO87Zp8
X-Proofpoint-ORIG-GUID: LrbifKBRT5gyVo_RlTjz4-5IcSO87Zp8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-06_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:55:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161438

--------------1B9A4DE49EF6BE064C9C4275
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 1/26/22 2:54 PM, Chen Qi wrote:
> This script is used in mdcheck_xxx.service files. So we need to
> install it. Also, as it requires bash, we add bash to RDEPENDS.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../files/0001-Makefile-install-mdcheck.patch | 30 +++++++++++++++++++
>   meta/recipes-extended/mdadm/mdadm_4.2.bb      |  2 ++
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
>
> diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
> new file mode 100644
> index 0000000000..3f76ef54d8
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
> @@ -0,0 +1,30 @@
> +From 97e776724ab9763c5bca9816370bb1635b7a8232 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 25 Jan 2022 16:25:01 +0800
> +Subject: [PATCH] Makefile: install mdcheck
> +
> +The mdcheck_xxx.service files use mdcheck, but it's not installed.
> +We need to install this script.
> +
> +Upstream-Status: Submitted [Sent patch to maintainer]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + Makefile | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 2a51d813..db40c7fd 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -303,6 +303,7 @@ install-systemd: systemd/mdmon@.service
> + install-bin: mdadm mdmon
> + 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
> + 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
> ++	$(INSTALL) -D -m 755 misc/mdcheck $(DESTDIR)/usr/share/mdadm/mdcheck
> +
> + uninstall:
> + 	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> index fa51364283..e15f8aadab 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> @@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
>              file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
>              file://include_sysmacros.patch \
>              file://0001-mdadm-skip-test-11spare-migration.patch \
> +           file://0001-Makefile-install-mdcheck.patch \
>              "
>   
>   SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
> @@ -92,6 +93,7 @@ do_install_ptest() {
>   	done
>   }
>   
> +RDEPENDS:${PN} += "bash"
>   RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
>   RRECOMMENDS:${PN}-ptest += " \
>       coreutils \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160959): https://lists.openembedded.org/g/openembedded-core/message/160959
> Mute This Topic: https://lists.openembedded.org/mt/88691711/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--------------1B9A4DE49EF6BE064C9C4275
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">ping<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 1/26/22 2:54 PM, Chen Qi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16CDBF9B1327A14F.24088@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">This script is used in mdcheck_xxx.service files. So we need to
install it. Also, as it requires bash, we add bash to RDEPENDS.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 .../files/0001-Makefile-install-mdcheck.patch | 30 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
new file mode 100644
index 0000000000..3f76ef54d8
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
@@ -0,0 +1,30 @@
+From 97e776724ab9763c5bca9816370bb1635b7a8232 Mon Sep 17 00:00:00 2001
+From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+Date: Tue, 25 Jan 2022 16:25:01 +0800
+Subject: [PATCH] Makefile: install mdcheck
+
+The mdcheck_xxx.service files use mdcheck, but it's not installed.
+We need to install this script.
+
+Upstream-Status: Submitted [Sent patch to maintainer]
+
+Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 2a51d813..db40c7fd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -303,6 +303,7 @@ install-systemd: <a class="moz-txt-link-abbreviated" href="mailto:systemd/mdmon@.service">systemd/mdmon@.service</a>
+ install-bin: mdadm mdmon
+ 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
+ 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
++	$(INSTALL) -D -m 755 misc/mdcheck $(DESTDIR)/usr/share/mdadm/mdcheck
+ 
+ uninstall:
+ 	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index fa51364283..e15f8aadab 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -22,6 +22,7 @@ SRC_URI = &quot;${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch">file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch</a> \
            <a class="moz-txt-link-freetext" href="file://include_sysmacros.patch">file://include_sysmacros.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-mdadm-skip-test-11spare-migration.patch">file://0001-mdadm-skip-test-11spare-migration.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-Makefile-install-mdcheck.patch">file://0001-Makefile-install-mdcheck.patch</a> \
            &quot;
 
 SRC_URI[sha256sum] = &quot;461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d&quot;
@@ -92,6 +93,7 @@ do_install_ptest() {
 	done
 }
 
+RDEPENDS:${PN} += &quot;bash&quot;
 RDEPENDS:${PN}-ptest += &quot;bash e2fsprogs-mke2fs&quot;
 RRECOMMENDS:${PN}-ptest += &quot; \
     coreutils \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#160959): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/160959">https://lists.openembedded.org/g/openembedded-core/message/160959</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88691711/3618072">https://lists.openembedded.org/mt/88691711/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------1B9A4DE49EF6BE064C9C4275--

