Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D211C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 19:16:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.11728.1642187775337753374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 11:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kygKUIhA;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80137db44a=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20EHGfXC029491
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 19:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=HwRWCy9qdX5+2SsqoLKWR5cLZ/i8AJqZ0W46n40GqWo=;
 b=kygKUIhAb/CTe1GVx02RUzdXtJEa46/hBRKI/q53MVHqjF4hgAEKOLF8bVFrV50tTbdk
 o9z3Et+ri81etL9/iRY/nwGjTgnxG5SDz+jwvGp/YKpxcxJQNxHC8QjRQO59pz+k+3NC
 RtkPJWCJknj25nePkvP9Zax31c03bksLoBFz/WmGqGpw4fIyWuwJ/VPGHrQejvZeqAYB
 uwoveNYaq+nNGl+pZSX2ONP/wYswMzb2tNMY2ju/JnrxHTEOiqdVB0C6cc/2W6xc1bMd
 Efnp2SHwDTXiu5qDuYKTX+c5Q4WfxKPRfwtItRJxRea8DHac9e8Z4jFp+oSttOXBGHiE ZQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dk6scrc06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 19:16:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=echVycYtLk4ctMMKG3A/i3iffd4sYsMjfJdTg9MSUpCKxkUz8yS9oI8neXkm63xwsbeWSLMq5JaAtrXD2y0Au41nvc+jCkjDTVPX3WNnQ8Fu/mVsva8sJ6J9DRqrajZv14gojz3szEtkniVgDbscX+JIV3HRh6NcxmDGHDU0ruxMujkHSIiVAslhNBbpjKEyz0YnrsZ77C9R216lFHuCI4LOLKlqsZrMERug4O4kioL/y5CA741HTtP4qDlR2tr+9CbHKQ8DdY8mgvfJQQR0thnrU+n5TXxUPWiuMZ9fSTA+fZUKTNpI7cq0626b9wkfqCw995S53JhsAWQ8jupkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwRWCy9qdX5+2SsqoLKWR5cLZ/i8AJqZ0W46n40GqWo=;
 b=Cnn/AMOs7OibXiQlzoXVxN4UHWPaC+LDeqTn68qedX0mHaEcGv+dMN76Z0Gqm22+hX7P/AWW9fx6oxUUOiok/WyF7nlinMSr+F6E8Mc1QquGom6XI0lPUW6rU7DLk0Vl67rlAMkx+U22WIqfqXH0n/lDiBbeKuhqCKrHZtcdmNXlkSkLEgeYKuI9ZrOyz62sOSWCFWrzr5DZGCsjJzxmMBCpBHVN/C8Wo4e1owq/pG2iu+mkpPY2uaO7niIS9BWwPB0qXdoyJ2I3b8HQijPWX8HVObA875v0P/jGbXUM4Sutejk018oiaI/c4UKNUQwFoHF5NNpdXYCGyZ5TRt/+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by DM6PR11MB4203.namprd11.prod.outlook.com (2603:10b6:5:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Fri, 14 Jan
 2022 19:16:12 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 19:16:12 +0000
Message-ID: <a4421a37-74f3-fc36-c4e5-1db8f67d7c75@windriver.com>
Date: Fri, 14 Jan 2022 11:16:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH] create-spdx: add support for SDKs
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220112194012.873-1-abeltran@linux.microsoft.com>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: <20220112194012.873-1-abeltran@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:300:93::18) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a558409d-5444-42ee-b94d-08d9d792538f
X-MS-TrafficTypeDiagnostic: DM6PR11MB4203:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB420300E064BD3B31BAD6EDBCEE549@DM6PR11MB4203.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M6m7YAvPigAzZJobYlY0DZqBmpECuVd9IXLeMw8dy/Sz0qFeM9CFqXvzy8L0pEAAXKi12HktRZWS2h3h8Ry+sv7n3v/9JbdkuAwqxPkQ1WOryu4iB3VknuKYST4fqZnO7wEunMlBnCJHKfQ/JzotRbko5G4VfX8qBvsLJYdfbf7KAEPd86f/ufgcLT3RUmtReXQxMUQiefyWTtPCMsN0jSBg6nptP8MLUl7IlJyIXN91GxTFhIvFYE1+L9taXtqlJDGkry9u6eh1HB2cBR78KJWnZNpDOceHKvFaienITU64V4xmxERDFwdyROPn7+w35M/RjNuFX6gvQkpcJmEGaZWsKYNfEjI6W+6JHZ9qrXKNHZVEIi3Y+ZbfmOkFyE5yJym43U3QH+0R1dUr77I0riV0W5SOZK23bzRgb32Nl+aEMS/dk6ARxh8RuKga+XZQY7uhB+sIXZT2SOKuwLuKQCJzW/7/qRbJcDY7R/P+4PyAoK+YDvumSgLpNwUL8ESQwewmnA8byB7QDfKIyw0o3nsH9ikAXeVt6GWvJQkdzIYZ+VPXuqcEdfOWYH0PBaK8+rsIZEtm6Yn3Hjbx4HrKjjF9VCPK2jeKAozUIHcvgUALFXACL+BApfSdlld3734IG9GDorClkmH62Op+eHOFaLSj67asaUIofIwQ1ml0ERG5zA/7K2W7xLpVKQwpwqm3geYonEmXPKRWbjO8pV9K46gkA2nr/4LQI8+gsUkMfCNbL79qk4ITA8tju1mPWgSzy5YQPVtahApCScK049BmNbdrzzRAPOviRjdKREUJaUFZ5PstpGZPns8GOwSmFUe0W9vzExmSXzRXwPQph1KuQzY+l3u027u/TFW6po3ESb8GVQBTtlHiw9kZ5d/wvxen
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(6506007)(86362001)(53546011)(6666004)(26005)(186003)(6916009)(52116002)(66556008)(66946007)(83380400001)(6486002)(66476007)(38350700002)(38100700002)(5660300002)(508600001)(31696002)(8936002)(31686004)(8676002)(2616005)(316002)(6512007)(2906002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aUxTYjY5ckU5alhIMktvM1FaVVZPVnprUU9GUTBFTTBjeXI3bFNOM1kvVDIy?=
 =?utf-8?B?SW9OcnY5eVZmakM5UnNqZWZWQjJJT0gzVi9uV0x1azRhenBGV0R3cWdXbEtC?=
 =?utf-8?B?TXhYRnEzdkxSQUNpTzF4NEJ5cnVwOGNiYll3cGFkUlh5ZkxSNnlDNjVmMEpa?=
 =?utf-8?B?b0d1enpXeklYRGMyMzF0a09UQ3pGNUtPMDRIRk5tNHl0ekRVdWJvVjFrOVBK?=
 =?utf-8?B?a0R2d2YwUXlPMFI5TDNSdVdnM0ExYlllczgzTkM1ZVI0eFh0bUd0VWZ6eG15?=
 =?utf-8?B?bG5IczdIWHgzb2M0MzUyb1ZnYmZiekRCS0E1WFo0YUw3RVFLL0hpbnJBVzBD?=
 =?utf-8?B?ZDVRMElVTzlCdUJwbmVOWGJQbXhHd2RxUkMvTExqUllzTUI1ZVhQK0N1MjYw?=
 =?utf-8?B?MU5XUWR5dkIvanNva0U5RnFDSkZYUzYyamZtUWdUblNQMUhUaFJYTnJFclk3?=
 =?utf-8?B?aEhBc0tNOG1YTTJZdVdGNWpJTjZmek9PUzMxRFlOeUdzenJNQnJSNDNxQ2c4?=
 =?utf-8?B?d01XbkpDbzNyT0lyVDVjazVjenhYVmhFei9hNERaN2tWa1VyNWVIMWtWVnA2?=
 =?utf-8?B?dGlGSEhybmExNENHTDRNN0ZORTNCNWwySHRiLzAxbFR5SzRoTVhUVzhWYWkz?=
 =?utf-8?B?NFJPVUlrOXpnZElvb0treGpVN1lQQVF4WG4wL0pudlh1MHQwSm9zZi9qOFpE?=
 =?utf-8?B?RlN4cU01cDVYTTY2b0FzZVRYV1Q4cHBlM0RUSm15YTdJVTRGbVVxUnA2R1NE?=
 =?utf-8?B?aXFNaXpLOXJrbkxla3RVbWdjbDVHR3dUNU1pWUdvdEpBWFVrOVFoV2g4SkNn?=
 =?utf-8?B?RlY5VGIrV0FnZzFrUGtibXE4TEJUcnhUVWk5aDNzUmdTY29McmcvU1AwZ1dV?=
 =?utf-8?B?eWRJekQvbUxlT1hlNVVjM2dqaHhtc3FhMG5jeCtCZ3diTncvc2J3ZG1VSm53?=
 =?utf-8?B?cXZqQ1FJK0lZc1lWcVlwbkVuR25zSUVRVkdSTjBraGloYlM1cTFvRXFZT0Vn?=
 =?utf-8?B?U3dsb2VhOENZaU83Z202SGtaOHA0dzBRclROTjZsZlV0VFgzNXZYWHg2T0gw?=
 =?utf-8?B?d1hQbDhiaWNDcTlaeGVPWHZLM3BqVHR1UnYvMTVzMzFlTEJnNHpvZmJGV1F0?=
 =?utf-8?B?V2tMNkJ0MUtNTGhOVG9MMVNObzRSK2lEV0FCbndOZjBPa1dWRDhCM3JONWtJ?=
 =?utf-8?B?SUlUenUycXFGaE5QOS9acmtNbGI4NnJDaWZIdTRFd0QyYXp3a29VVWxTczJQ?=
 =?utf-8?B?bTE3QzlBaWFuM0NqQVNFQ1BRMWYwcVJkclRxUHAvMG5QMUdRSEhURmlLcVFH?=
 =?utf-8?B?NE5BSTZteGxBQnB3R1ZGMlhRV1dWVEdSNHZhMkhDSjR3SGxhQk9kclROMnZr?=
 =?utf-8?B?VmpQSzdzcnFNOWhsVlBJNlNQV1RtRlhEbkdaZzUyZytwanlFWnNVdGVEd0NI?=
 =?utf-8?B?MHQrWG5HTjhaVHJLbzM1aTlZRTIyUzVGcFdBQ1o0YStlVUxyQkJyREx6Yjdr?=
 =?utf-8?B?VkpobUpXZzZ3a0xqMGZKN2szajJDWVRubk9VMVludmdVOFpmVCtMN2I2U2Na?=
 =?utf-8?B?TWdNREMyMFFJa2ZidGlrWWdqSWM5a0Zta2ViUlNTZVNjYkdKb3hkZ0p5Z0lR?=
 =?utf-8?B?WVVnRnhCZ2RMN1JvcHJNd3BHTjZadWNpMUFoenBNakpHVUdOSU5NazllcTRt?=
 =?utf-8?B?cW82YWcrV3cyM1lPUGZzWkx0Rmk1Y1hkQ0Urd0tmZUhsY1diN1BDOGZESm9m?=
 =?utf-8?B?Q2VUdjFXVnVVV0crZ1B6WVo5cjZYZm1uQ3ZGNXAxUElVeG9Ndk1PVDNmOGZO?=
 =?utf-8?B?QjlzMXR6TDF0SGRseXd5VUFnRlRKVWo1dThRUWtKNVZQaVB3TjkwaDFHZlJH?=
 =?utf-8?B?RU1mTmNaVnA4THlpeGYyekZrM2dJOHFjMElGYnpvRi9aY2JnOVlPTEc1dWNH?=
 =?utf-8?B?cGZpNVhjcWxZWVBGbGdOc2tFZ05MNkV2OHhkYUhjQzlENEhpc21jZnJNdk12?=
 =?utf-8?B?SDhQL096ZGQ5Tm4xeGIrN3A3RlZycW43eWF5Sk5aMWFyM2xLK2xMelU3Y25G?=
 =?utf-8?B?MDFBNlpMbDMzaWk3WnNlZHNpODhabGp0OW96UmdsUG9QU3MzZGJ3a3VmaW1k?=
 =?utf-8?B?RCttaFl4ZG9tL2EySEtpQ2xWd2xXV2h5VE13bmZ1SGgvOXlkUGUrYkVxRDlJ?=
 =?utf-8?Q?ZnlQPWHnVAtS+jDNmT53iqY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a558409d-5444-42ee-b94d-08d9d792538f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 19:16:12.0501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ReKJ2nvuInmLUTULJ73pLu3D5GJ9by5uCPR/WFrnXNjkrdhWq7TteEHnAIvX1eHbRao9aa+1MknPDm7c9jn1Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4203
X-Proofpoint-GUID: OPVuzkNQOJoLWAt-fLetjkIrHmQm8yp-
X-Proofpoint-ORIG-GUID: OPVuzkNQOJoLWAt-fLetjkIrHmQm8yp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201140115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 19:16:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160591

Overall I think this is going in the right direction, I need to review 
it a little deeper and check the actual output.

I am not sure that you tested this against master as you use the old _ 
override syntax vs using a :.

See note below.

Sau!


On 1/12/22 11:40, Andres Beltran wrote:
> Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
> ---
>   meta/classes/create-spdx.bbclass | 95 +++++++++++++++++++++-----------
>   meta/lib/oe/sbom.py              |  6 +-
>   2 files changed, 68 insertions(+), 33 deletions(-)
> 
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
> index e44a204a8fc..d0f987315ee 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -556,7 +556,7 @@ python do_create_spdx() {
>               oe.sbom.write_doc(d, package_doc, "packages")
>   }
>   # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
> -addtask do_create_spdx after do_package do_packagedata do_unpack before do_build do_rm_work
> +addtask do_create_spdx after do_package do_packagedata do_unpack before do_populate_sdk do_build do_rm_work
>   
>   SSTATETASKS += "do_create_spdx"
>   do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
> @@ -788,28 +788,77 @@ def spdx_get_src(d):
>   do_rootfs[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
>   
>   ROOTFS_POSTUNINSTALL_COMMAND =+ "image_combine_spdx ; "
> +
> +do_populate_sdk[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
> +POPULATE_SDK_POST_HOST_COMMAND_append_task-populate-sdk = " sdk_host_combine_spdx; "
> +POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk = " sdk_target_combine_spdx; > +
You using the older _append syntax vs newer :append syntax in master


>   python image_combine_spdx() {
> +    import os
> +    import oe.sbom
> +    from pathlib import Path
> +    from oe.rootfs import image_list_installed_packages
> +
> +    image_name = d.getVar("IMAGE_NAME")
> +    image_link_name = d.getVar("IMAGE_LINK_NAME")
> +    imgdeploydir = Path(d.getVar("IMGDEPLOYDIR"))
> +    img_spdxid = oe.sbom.get_image_spdxid(image_name)
> +    packages = image_list_installed_packages(d)
> +
> +    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages)
> +
> +    if image_link_name:
> +        image_spdx_path = imgdeploydir / (image_name + ".spdx.json")
> +        image_spdx_link = imgdeploydir / (image_link_name + ".spdx.json")
> +        image_spdx_link.symlink_to(os.path.relpath(image_spdx_path, image_spdx_link.parent))
> +
> +    def make_image_link(target_path, suffix):
> +        if image_link_name:
> +            link = imgdeploydir / (image_link_name + suffix)
> +            link.symlink_to(os.path.relpath(target_path, link.parent))
> +
> +    spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.zst")
> +    make_image_link(spdx_tar_path, ".spdx.tar.zst")
> +    spdx_index_path = imgdeploydir / (image_name + ".spdx.index.json")
> +    make_image_link(spdx_index_path, ".spdx.index.json")
> +}
> +
> +python sdk_host_combine_spdx() {
> +    sdk_combine_spdx(d, "host")
> +}
> +
> +python sdk_target_combine_spdx() {
> +    sdk_combine_spdx(d, "target")
> +}
> +
> +def sdk_combine_spdx(d, sdk_type):
> +    import oe.sbom
> +    from pathlib import Path
> +    from oe.sdk import sdk_list_installed_packages
> +
> +    sdk_name = d.getVar("SDK_NAME") + "-" + sdk_type
> +    sdk_deploydir = Path(d.getVar("SDKDEPLOYDIR"))
> +    sdk_spdxid = oe.sbom.get_sdk_spdxid(sdk_name)
> +    sdk_packages = sdk_list_installed_packages(d, sdk_type == "target")
> +    combine_spdx(d, sdk_name, sdk_deploydir, sdk_spdxid, sdk_packages)
> +
> +def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
>       import os
>       import oe.spdx
>       import oe.sbom
>       import io
>       import json
> -    from oe.rootfs import image_list_installed_packages
>       from datetime import timezone, datetime
>       from pathlib import Path
>       import tarfile
>       import bb.compress.zstd
>   
>       creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
> -    image_name = d.getVar("IMAGE_NAME")
> -    image_link_name = d.getVar("IMAGE_LINK_NAME")
> -
>       deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
> -    imgdeploydir = Path(d.getVar("IMGDEPLOYDIR"))
>       source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
>   
>       doc = oe.spdx.SPDXDocument()
> -    doc.name = image_name
> +    doc.name = rootfs_name
>       doc.documentNamespace = get_doc_namespace(d, doc)
>       doc.creationInfo.created = creation_time
>       doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
> @@ -821,14 +870,12 @@ python image_combine_spdx() {
>       image = oe.spdx.SPDXPackage()
>       image.name = d.getVar("PN")
>       image.versionInfo = d.getVar("PV")
> -    image.SPDXID = oe.sbom.get_image_spdxid(image_name)
> +    image.SPDXID = rootfs_spdxid
>   
>       doc.packages.append(image)
>   
>       spdx_package = oe.spdx.SPDXPackage()
>   
> -    packages = image_list_installed_packages(d)
> -
>       for name in sorted(packages.keys()):
>           pkg_spdx_path = deploy_dir_spdx / "packages" / (name + ".spdx.json")
>           pkg_doc, pkg_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
> @@ -856,7 +903,6 @@ python image_combine_spdx() {
>           runtime_ref.checksum.algorithm = "SHA1"
>           runtime_ref.checksum.checksumValue = runtime_doc_sha1
>   
> -        # "OTHER" isn't ideal here, but I can't find a relationship that makes sense
>           doc.externalDocumentRefs.append(runtime_ref)
>           doc.add_relationship(
>               image,
> @@ -865,14 +911,10 @@ python image_combine_spdx() {
>               comment="Runtime dependencies for %s" % name
>           )
>   
> -    image_spdx_path = imgdeploydir / (image_name + ".spdx.json")
> +    image_spdx_path = rootfs_deploydir / (rootfs_name + ".spdx.json")
>   
>       with image_spdx_path.open("wb") as f:
> -        doc.to_json(f, sort_keys=True)
> -
> -    if image_link_name:
> -        image_spdx_link = imgdeploydir / (image_link_name + ".spdx.json")
> -        image_spdx_link.symlink_to(os.path.relpath(image_spdx_path, image_spdx_link.parent))
> +        doc.to_json(f, sort_keys=True, indent=4)
>   
>       num_threads = int(d.getVar("BB_NUMBER_THREADS"))
>   
> @@ -880,7 +922,7 @@ python image_combine_spdx() {
>   
>       index = {"documents": []}
>   
> -    spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.zst")
> +    spdx_tar_path = rootfs_deploydir / (rootfs_name + ".spdx.tar.zst")
>       with bb.compress.zstd.open(spdx_tar_path, "w", num_threads=num_threads) as f:
>           with tarfile.open(fileobj=f, mode="w|") as tar:
>               def collect_spdx_document(path):
> @@ -930,7 +972,7 @@ python image_combine_spdx() {
>   
>               index["documents"].sort(key=lambda x: x["filename"])
>   
> -            index_str = io.BytesIO(json.dumps(index, sort_keys=True).encode("utf-8"))
> +            index_str = io.BytesIO(json.dumps(index, sort_keys=True, indent=4).encode("utf-8"))
>   
>               info = tarfile.TarInfo()
>               info.name = "index.json"
> @@ -942,17 +984,6 @@ python image_combine_spdx() {
>   
>               tar.addfile(info, fileobj=index_str)
>   
> -    def make_image_link(target_path, suffix):
> -        if image_link_name:
> -            link = imgdeploydir / (image_link_name + suffix)
> -            link.symlink_to(os.path.relpath(target_path, link.parent))
> -
> -    make_image_link(spdx_tar_path, ".spdx.tar.zst")
> -
> -    spdx_index_path = imgdeploydir / (image_name + ".spdx.index.json")
> +    spdx_index_path = rootfs_deploydir / (rootfs_name + ".spdx.index.json")
>       with spdx_index_path.open("w") as f:
> -        json.dump(index, f, sort_keys=True)
> -
> -    make_image_link(spdx_index_path, ".spdx.index.json")
> -}
> -
> +        json.dump(index, f, sort_keys=True, indent=4)
> diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
> index 848812c0b7d..a975a3c9fc0 100644
> --- a/meta/lib/oe/sbom.py
> +++ b/meta/lib/oe/sbom.py
> @@ -28,6 +28,10 @@ def get_image_spdxid(img):
>       return "SPDXRef-Image-%s" % img
>   
>   
> +def get_sdk_spdxid(sdk):
> +    return "SPDXRef-SDK-%s" % sdk
> +
> +
>   def write_doc(d, spdx_doc, subdir, spdx_deploy=None):
>       from pathlib import Path
>   
> @@ -37,7 +41,7 @@ def write_doc(d, spdx_doc, subdir, spdx_deploy=None):
>       dest = spdx_deploy / subdir / (spdx_doc.name + ".spdx.json")
>       dest.parent.mkdir(exist_ok=True, parents=True)
>       with dest.open("wb") as f:
> -        doc_sha1 = spdx_doc.to_json(f, sort_keys=True)
> +        doc_sha1 = spdx_doc.to_json(f, sort_keys=True, indent=4)
>   
>       l = spdx_deploy / "by-namespace" / spdx_doc.documentNamespace.replace("/", "_")
>       l.parent.mkdir(exist_ok=True, parents=True)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160500): https://lists.openembedded.org/g/openembedded-core/message/160500
> Mute This Topic: https://lists.openembedded.org/mt/88381128/4950653
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Saul.Wold@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Sau!

