Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB37CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 04:55:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web01.1034.1761713746384020500
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 21:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KkXBMby3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=33974254f0=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T40bv82769698
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 04:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=31BGCeycRdauHFDeCStY
	9YBRSuph3D0VSjYb2Zyd5oU=; b=KkXBMby3axiWBW7G+lBAv9NmI6GTlAZjT1bQ
	JAH6H1QJAu817J9Va7eYEBBmRH8KM0yFKzrsDPsU86KLnAyoCOrVMqrcuZrPiCWx
	86jCoYDLaVSMeTdLNvDMK5wMuw+9pg+QvBYepl6ESpLXTm7J5ITFAN5u3uOkIUxH
	y5RXF6+fekpRMFAil6Hjks+ckELTsUuwOlEgA3w0fbrObmABPKjU4G/qr+zrTnR+
	ANmU2FJwgE9EMlUu2Bb0a60kxRnMnC2QUDMb/viiMdN48N6s0iGyhThJEZEFv4mY
	tZ8uC6cnqAdo7fBZ6VaQeAJ6yixLwsEe1nGZ77zVQvQDW3Z8Ww==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013046.outbound.protection.outlook.com [40.93.201.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3489gddy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 04:55:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzA/rbk+Xm1ppGTYLqo0hSaYXtGNdmed96SPLkiffhZBt3snQwNXEd2rOJzYrz5hFdabZXF4ihsUxObAXOJiLWPW+zmQ2C9jFRGi4GaPDAzBCBbIdAosAbWsM/rTTnsYaE4tdlxo0nhExG4/o3t+MFWZ7HB+XIusBDw36nf50dcKJNcKO1+GhfbReqX7R1mtbz62YnVqP26Vcs4RYiIYRV7eKADNPuzdimL/OGLIFVPnkTKvb6qhqxWgOc0rYy40C7PodoFyB26EBdHnYByLCdczla1x2tQzHEx8mWOSSc0RG/bOIWAkKN6d272p/T8aoNRF/6O9SSJ+jcDGASALhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31BGCeycRdauHFDeCStY9YBRSuph3D0VSjYb2Zyd5oU=;
 b=i021FUnfvuR4JyKscjmOqv1dpTnF8hWRdvLmmM0nAX6U8u+9JQbLKpMxItDqaZxlDPcmo00Qs+VwqerveS8KEWzNggkYECTjnxFB7kS0uzizaSSqU+5DO6oPD8qZAdNj+Surn0VA7/uj7wPIRMBTn66zmBxUSZGSIffTULGE4naMke6AN891EEUTJOHwBG8QqTy6mZbrI8bfPmIpHL9zQ0ODddjpng6sXllUDGeIX5XwB89JWTM7nn4FqMsEeWj0inEOuogHBx97Ci/4BXdM7dmqn7r9oPBX8q3DqTU5nNlxA6X5e+l8fE5q7VyMbLZ72pqRmuPAOFci5cf98l5OQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6258.namprd11.prod.outlook.com (2603:10b6:930:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 04:55:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 04:55:42 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V4 1/3] base-passwd: add clock group
Date: Wed, 29 Oct 2025 12:55:25 +0800
Message-Id: <20251029045527.2865818-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0001.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ac7cf9-5e04-426b-3cfb-08de16a769b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tsShoD3Zu+ffyPzMMIfL/irFhWYlJUoPcNmEwhYzRcpa9KHYKJLYnTW06ptk?=
 =?us-ascii?Q?WRjMuHxWM8FLDxijANpHibBUIRSkqamtxSYWGRH9vC5gWsP+c6yBNuUYrayo?=
 =?us-ascii?Q?aTWUcG2re3aA/CBvrdKeQVAmV/ioDNPxVMJBN6T+Bo9PvOjCmZOo7T+hlLrw?=
 =?us-ascii?Q?COeFYRM72idI/1qH9J9BTCs3CBWiELzW5kIRb5mCkqjuPTMSIOTdDi6SurA9?=
 =?us-ascii?Q?eShmdcvs6jKqnhbsgIYW++Q0vvYmYsbfuUAzmIfwhaf6Bng5/UMwy0JE7PxY?=
 =?us-ascii?Q?WrA+NWsPM5rB8Od03wb8jWhaXSUKrcaGR/QiN3OAYVy5okgB4GBDEyIHFke8?=
 =?us-ascii?Q?FJ26LF20FwbJSiEJuf3y/24vUJsjjFpK7O7YxtNEJnBOpe5YYF5UPHi1RXbB?=
 =?us-ascii?Q?ozGzPaZSOG7jxDoRizrRWCncpdzBP4YfTbxWzKJwrNVQKj5qgZPvsgNgOdzW?=
 =?us-ascii?Q?ULTM06TacTPruxCL46QaFygPe/dEKHnsJag3nhDdXagMcuERI2xVqi9X24rq?=
 =?us-ascii?Q?k/3w8b1L5D7iPQtyuO+d1t42c/G6MYAqjyn8+fVpFTv5GG+hoKcLw93fvmoR?=
 =?us-ascii?Q?cIsYdLc6CV9ivpGvfh256FfKrFQGHqh/rOGzLEYZ93qGIFmbU+XZyhjuMCk4?=
 =?us-ascii?Q?+xyJrmf1LTsi8wfMhL4kPPj6/xIPibrHh7vhiWa29TI03gbMQ9TxO6NrOpo8?=
 =?us-ascii?Q?PMlnJWBEXoYldGjlst0CegdAuHBCT+JebMfsUyfbx7ODMGjgzJRSb1o8TNHT?=
 =?us-ascii?Q?2k9/12Qcc20tFDqUWtAIoxY+nQuR6UulOaxFE57aNjADhPO2cyg600L8yXLC?=
 =?us-ascii?Q?T7IcOXj2gxex34FwftKxv6RdZb5D7KxjCB3DCuPzf5hBbsJ96ZfXDSqrIKzz?=
 =?us-ascii?Q?N8yfcKy67cgGQlcoEKN61qUd9rtIFGT77aAmU9fqtdGiF9IE4h628m306FMo?=
 =?us-ascii?Q?OiB9tDeMMRD/NtdDmlmCflt1J+jhLqFJcWacvwJ73kPkhI1Iwk7DrqwvuP4K?=
 =?us-ascii?Q?0t6vzXFpssVYOaNK9eCSaMvXJYqUhceJtNITnPJuppq0VcOujJYi0L2bUkWH?=
 =?us-ascii?Q?YY52TLZnkFPgoRkAMXV+TX3x3LEZuUgfx/B9sXSSdPYNc9m/BeNe916Elvm8?=
 =?us-ascii?Q?E4umnqouGxiBKqjmZ4ELnkhGRVH//MwFrsepoGnX8tS+4no9CSlzonh66eTC?=
 =?us-ascii?Q?eVaJOe4oShTnJg42ZHti/F64MeUZFLQLyRUl4P7hR/suMTDQKbATmk2/zW5b?=
 =?us-ascii?Q?1Wjuw3oCZoHtlCIHtVPN6DAerwSePga2yNBLrFFoxZsw/PR3QmItfyo6gstA?=
 =?us-ascii?Q?kTEE6d0MSnPeCMRzZQ8o7QNpsZcyt66DFMzKhibvHQf1Hrv16UAgT0eCSGLk?=
 =?us-ascii?Q?sEjhbSs5d4ZRd6KNCRcne+T4Z321hLhtGb8M1RGzsehhdAIVIP5DikNZBObC?=
 =?us-ascii?Q?5H0g+nmtAJUX2/Vk/1xN1NjdFYwBZOzCqzbezk6NTFyI2pQrpeTSVg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mTrepLfV1r0+2lRwi+U0Ard51J9vsHw4rMOAPy7W3YRjC3SCg1YDrYOfG0so?=
 =?us-ascii?Q?Q3mFZzd6tuL+Gsz5g8OECDX7Wy9GSMTwYF2toDXiwE8K45HuFPngjoLXMWcU?=
 =?us-ascii?Q?Ks+FFFLlVRah7YbDrMTHao3ePuquDuXliidHYgVIFQRxowYcyUnvw+TefvAe?=
 =?us-ascii?Q?3cdfibMIK8L60dA4RDFj1E1GMxJrCDfhZe21/MLVnVF8jbT5XgIqnUww4HR4?=
 =?us-ascii?Q?abj5i3sQw6qcshh4otjQjpaN74iAYTXCSwn7NXXN1rzwXcSTEsxACMgsfdSe?=
 =?us-ascii?Q?2LA5lJdJL9Tsx9Mok5EF1M9OwRk/FXjid7yLK7/4lJGenAqMtKJncGPRbiWN?=
 =?us-ascii?Q?on2aHWunSFKDxuV0d0d8SOT3iztj5qruIoM+dc9c7VZa57tPgYZeHoL11kUf?=
 =?us-ascii?Q?T6fsq5tFWnrXZOpLBmf1puK2bizXX01yTNqI1Ap+MaKoBy2Cn3n4VIxuu06X?=
 =?us-ascii?Q?gIbup3/ELUJ7pZ8Hfl/Ni7FnMXWUiodBzU2HozutFKfQ5DWE+VeMytVpTMz3?=
 =?us-ascii?Q?0s/Axza5HmJ97C3gkH5C5hq5Kuq51tTk0HftME3ZPPOkDLUlMEldH0F4k1Yk?=
 =?us-ascii?Q?a8yKpW5uUcHbYxLGt/9qrfyM3RCWPXdycyzKrt2K/PJ/nFxC4xnc+0BJB06s?=
 =?us-ascii?Q?lNqqXYR6nbOduF4ZSNZLMf8i3JdJkugtgYN419eC3h9vVEONT2JA8Z+IKfSF?=
 =?us-ascii?Q?r5uZCfFBxI5bNN9Jbw1hHzyy12AHbwHbnlsEUWF7KegChHvbonSsSh/0n98B?=
 =?us-ascii?Q?b3WdzS7ZsMGn3gkOHsUKhB1JzbkyJOj/1I//p6yUq3UIrwhe/iyeqzWKx0/c?=
 =?us-ascii?Q?oMsIyaRVesaXCrcgLnWW1Y4yTtNZseS67QO4MGWM4xERm2g1mfKWccZ6AsRq?=
 =?us-ascii?Q?3fZfB7RfTVU9U0yL/seHFMoE+qG0BiWXE/FBIKs2W7BQH3ck7xIe1GSe15ZN?=
 =?us-ascii?Q?9rk/UPSxVSRcM9yEt8E0xhnfNNgJV4dnM1dgsAJEU3dCFFpSEXJeWiYjQDjd?=
 =?us-ascii?Q?vQPBfhM6RaO0NpKtrKUnDOa8l8o0GTzaosBSyvIwk9TSW16LzxKhP/k+NT/A?=
 =?us-ascii?Q?3b7M0ZSAtNC2BgevWexmGyR+itBXkWZ13PdppxdI0TJUHtd4phonTW8+tmj9?=
 =?us-ascii?Q?5XcK2d6Aq85HUwSfIHzTSC7yJyNPqjWj48mL8EX69koW4zS4ajmgkMKVg57o?=
 =?us-ascii?Q?mOh2o4w5x/VBj+8UfPRYVm78dCaFbBXsD9mtV69IN7/qiL2Lsqz3iZ25g9CU?=
 =?us-ascii?Q?Vn8AJaiRTahwqXiZNTMC3O/OfcR4gbno8Qh12XLL3Hs8jjD9iMijb+0aH4+M?=
 =?us-ascii?Q?q6ma/UkWK4sJTVUOvj0QUzd97JPrmroTiTCInaG2ImhvBsiQjS570Q6A/GN1?=
 =?us-ascii?Q?cQy1mfl8OL7d3DcfiGY+wpaoz3I+Ykylbd3luT291ZR2jcFMD9wol2esaHoN?=
 =?us-ascii?Q?NqJnZcv/wPu+r8ZAQWzknbK/wKjXFsOwdz75v3gScRLhGdPXAXkr3qVCJG+0?=
 =?us-ascii?Q?cYXXR8jQEUEL+5UEh9Q+3R/F0JBH/Tcno+K5zAcQlgSlkHmcOuSFPsk7UbQa?=
 =?us-ascii?Q?piDRxcUWXhpklMxXaTTV/2ovT9mPM+rbIf8+4k7/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ac7cf9-5e04-426b-3cfb-08de16a769b7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 04:55:42.4346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: herwj/4vDWessyOCkl3wrmpbY7L2IBFNcUbP4MRjIKhh647aoS+G4gErqjrGnhP+qCksVqdD2zbKY32K6fGIiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6258
X-Proofpoint-GUID: P2x9wQ41BoqOZ-EOqRk0NAzyaJBGz9yS
X-Proofpoint-ORIG-GUID: P2x9wQ41BoqOZ-EOqRk0NAzyaJBGz9yS
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69019e51 cx=c_pps
 a=hJOwGQj5EtsonyTFrxeutQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8
 a=Pmu1SSgIpiWcXD3DtNAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAzNSBTYWx0ZWRfX7vYpdJ9GK0Fz
 WRbH1Y3YE2mB+kr/KHN7xjowww0AIpFJjzk23Dp4izr6deWZbb7oUvdg9zohpqUnCSnmG4xOw2a
 coZ47ukEOtj6xxGIxngivlqBZarMtD+opK9vWgEtbFyrozwh8uQCd48+v31RG1sO+JFM29wK2L7
 Y9UIV7wvHvEcey5BiHG3YU6RufE3zUk5NiNy5ImiTjovktlmIrndkgy63Rzrd2ehc7qNMBZZEf/
 8iHCR7luot2OJLcEwL/14TXordKxxIaAKXiDkqjutRUZmZsGGdXunKKI35+Ph5VdEhI800PnvKF
 en4cvilj9urEnb5UO9hR+cJwAuH5wIfSFAptK3tX+SYrwqgPeVqtotiuL4A9AYafCkIDssd/C+j
 oMoekCiPwNNIaWwOUxXT8z9Ez8xf0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 04:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225431

From: Chen Qi <Qi.Chen@windriver.com>

New systemd version (v258) introduces a new group, clock, to
"enable applications like linuxptp to open clocks without root
privileges".[1]

This results in warning at do_rootfs time:
WARNING: Group clock has never been defined

Add group clock with gid 81 to fix this issue. The wheel group's
gid is 80, so 81 is chosen. And as the patch to add wheel group
was not accepted by upstream, directly mark this one's upstream
status to be 'Inappropriate'.

[1] https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../base-passwd/0001-Add-clock-group.patch    | 38 +++++++++++++++++++
 .../base-passwd/base-passwd_3.6.7.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
new file mode 100644
index 0000000000..0e0cd97a19
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
@@ -0,0 +1,38 @@
+From 4b3a8f347179d7e2a1062eeed13a6474deb28728 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 16 Oct 2025 08:48:49 +0800
+Subject: [PATCH] Add clock group
+
+The clock group is needed to "to enable applications like linuxptp
+to open clocks without root privileges". See the link below:
+https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
+
+Note that this group is needed as long as people use udev from
+systemd because 50-udev-default.rules needs it. See the above
+commit.
+
+Upstream-Status: Inappropriate [oe specific]
+[
+  MR: https://salsa.debian.org/debian/base-passwd/-/merge_requests/17
+  It was rejected by upstream. See details in MR's comments.
+]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index e54fd1d..6f84539 100644
+--- a/group.master
++++ b/group.master
+@@ -39,5 +39,6 @@ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
+ wheel:*:80:
++clock:*:81:
+ users:*:100:
+ nogroup:*:65534:
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
index 177927d674..e4e0890293 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0005-Add-kvm-group.patch \
            file://0007-Add-wheel-group.patch \
            file://0001-base-passwd-Add-the-sgx-group.patch \
+           file://0001-Add-clock-group.patch \
            "
 
 SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
-- 
2.34.1


