Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B779CCD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 06:20:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5140.1712298022948608391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 23:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=g8CLmGW8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4825d52ad1=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4355sqGR020910
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Apr 2024 23:20:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=rPP9CPnjZWd0/aflkon
	/nWsFUXbBe6sttYyF2c5DZfg=; b=g8CLmGW86NEUAMtR8dYuU6F5P0zWGMedw38
	m3f08NPRmekoOEDm3GC45hkw6vTM+k4hco+1prx/ZxnCH4mcxdTDYKiMbS1buFAa
	RO8VMx85CgTWxUk7ji3RPsCCMz1W2u9jt2J6DNnHohZeXosb9h0hkvIScgKfFjb8
	akGisF9UxMYYF6oRb0h6payLCOkAe0FXj/F5e0xtnFPdZqoEi7wxbpLQDO0faGwe
	p6Eta3KD+BgeQcpcv+O033ojF6iVSyo+Pm/wrJoMAbulsaU4TdLxcj58ZLPXvsOZ
	szWK6XpbleYVgZGz5Iv7aIjbTKI9RRsh2TKyHtA0crhmDuZOljw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x9eqehd1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 23:20:22 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4356Itm3020724
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Apr 2024 23:20:21 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x9eqehd1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Apr 2024 23:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaO4XzWfvW1XhvcaImvs9sQ65kuQZQ1AlT8/EPX3fkZRTEujDVitb/EWC6CH5vqjNibpdPFLLiZoRvipQLNS4A7Z4taDcIXuwZn9i0ggR77Iaak2Uns64M3rMeP6wABPGoP1UQMpAKog6fvsMK/K0KCMurHgVxUwCEv4ALS7apJWTgeFuOgWSDnNlL4ZaueUyxzA9sNgBz+f6s2YKcZZP0DvsitMdi1a+tM7krp/sPc+cKm9kvFRqmioijr53jyWq+1XaFWSwOn/Z9tpuZS3ihrptx/YD3w6OfivKh96grKTHKauQTCsmUiVQa9lf/4URjGCETZiB33kH2UNCC6vXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPP9CPnjZWd0/aflkon/nWsFUXbBe6sttYyF2c5DZfg=;
 b=ZbEC7ORisiMXh0uEe53KDTpIuLSej4KP8239MWJT6LEoNjveuKj/RJwG1KZMhlXQvUw5LhJsM0/HnATMqUvML9t85gDN2I2cluztYD/RlQZZz65exJBD+65WJio/Yg8R6F/S6a54uyNIxMiXknk7HrZZBnlcK2EGE41q68qVXTojlSn5keD7T4KO+vVEZIP1DgiT55gOGosWkS9HCYMv0Lta1BdnTx7EvNYu8L6CuQvhHATLTrTgd9bbc+/iuuVZStQKcVy8gvgeLIyTw8NLE7bKylEPgjp7vvvBTUAuwJ1mEU5X9soYZXuYu1jIWRlH65lGIGqYMIbzV8JFfnUB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 06:20:18 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e%6]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 06:20:16 +0000
Content-Type: multipart/alternative;
 boundary="------------0OlnRMaZ0TtzI68NVUAAOjGk"
Message-ID: <c4eb0234-1887-4638-ad72-1752174fb52e@windriver.com>
Date: Fri, 5 Apr 2024 11:50:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: Fix stale qemu processes left after
 glibc oe-selftest
To: Khem Raj <raj.khem@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20240401081011.479084-1-Yash.Shinde@windriver.com>
 <CAMKF1spGJ_JjvgHezfhaEwuZHAmnyzK2vmWvqGps0AwOfbz2pg@mail.gmail.com>
 <74eb50cf-730d-4627-bfb0-4e45877e6ee7@windriver.com>
 <4d5d50b9c079b6998f773a651c8c06e764c3e362.camel@linuxfoundation.org>
 <CAMKF1sqEcreVccQcwxWikHDrr_EX4vcHVYJ0AUr5z22necOLiQ@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CAMKF1sqEcreVccQcwxWikHDrr_EX4vcHVYJ0AUr5z22necOLiQ@mail.gmail.com>
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MW4PR11MB6840:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2u9XI5dkjTCvQvdFD4kY52FSRN6aoJ9UWlnR9nVjryWzsoltomndkPhqLHtC9nxAtzhzT30tdoO/d19QuJjHlOAXvRZVKDoIhBo6k6YRslWj2EF7YcvbQWCp9ncU1H1x90alx8Ql72uVM+TPpNinCnthFbMHsevM4kmUcNFwdgKrjk9eZasneiroggqaGc62RNwRijHss1xie5BqIZ8BBuYSYElDPys2kJvVRSp6XKhZj9RSGRBdbCJk/i+z207cy2r67Y8kUooZ5tHAXJtp8zPi6pqgSusKV2Prw+HciAx/eHQDm/EXvxXi+62rhHNJxhKn395hxLwHqIbvEZNqfVj1Dt/Av1e+SyKDOH7q1ol+7xh/tEdslK28Hbne0LZ5LepedjY3TPZJQyeDyYt8X6BU88FE3rlNwsvxFQ+BeQbTz+Uxg8tV+DQg/A/LfbAE5KjJPIT9bauW5BD1ikygKvLtg4r6rOuH3G9WWTX8Dq70KO+qUrwKRNMOpo64pt1uq04QcEhuQnRi+hng+WOP1XOGIUpXe5gUGaukEkCsPrSjhbP8kZuxrOKUF9lmZUZdJdhSYBgObii2V5own6aX5zCbB3I2btRV9oaz6mn1w4Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emFPNnNkc3dweTRURUMrZXpFcGdiSVNVamV3SHJJTkU5U3o4cHpjaFMzNlht?=
 =?utf-8?B?OFl3V1BNTnJRaGpWNDZtcDBXSHZKWG1sRVVNVEQvN3BqR3hZc3ZPcGZvdGtv?=
 =?utf-8?B?cXhRcUs1c3lZUWN2MDZDaGZXRjlrNi9LQ0JlekxBVDNnVkdOUS9JbFBhYjNo?=
 =?utf-8?B?dUtsT3pEYWNXUDh3Yll0bW9Za2hzeWpRb2lOc2ZFVTk0VXhqd3d0YmNhMWxn?=
 =?utf-8?B?ekN1M2Q2ZUhQVHN0NkJEZm9Sb2ljSk9hcFZpTmhiUzdZRDh3YVlvSXZEaVNE?=
 =?utf-8?B?SmhLUkxOUjdTYmlTc25sb1BaQUhTcmd2MjBnZDRWLzQ1T2pOamYrZm1CUTJu?=
 =?utf-8?B?L0hHbVVhVmxINmVkMFkvWUJSVUtRR1h1NDgxcmRKczZEMjA4eGE4RTIwb1Zt?=
 =?utf-8?B?MWltc3FGaFJpY3VtMlRMek5xRk45anBuT2tUTStwVlV3KzR4Q3phekxCTktE?=
 =?utf-8?B?TUQ3eHpWUXJCclMvUkJxeW8zTUl4dFB5dTZCOVJvUEtub2xBMURlTytRS1dI?=
 =?utf-8?B?dWZNbWluYmV1RHp1RUlBKys0WHdaRE0zZDFBaDhMenVOUDdPQWhUNkF4Titm?=
 =?utf-8?B?emovMFB1bjU0S05PUjdGczA5azFWOEU1Q1pGMUV2aEpBQSszTXlsaW1lUmRC?=
 =?utf-8?B?WGZFN3paNWxlOEg0c2Zra1k3dFhmb1VSVGxiWTZCUTVMSnY4K21GeFIrVy9j?=
 =?utf-8?B?NHV0bklkczgrekRwUHBLc1VTWlNiaDZRRExRRzhoU3FWVEZQUDVLUnVvWUtN?=
 =?utf-8?B?MkM3K0FTbVI2VHN4cEJhMEFVbWptcFE5Z2orVjF0aHJCOE5nVUlqTVVwWHZw?=
 =?utf-8?B?eHhwRk9BZGJXdXZ1bE9XcksrYW04aUxxbTZzRUhMdmJKTzZqZGE4QzBNRS9R?=
 =?utf-8?B?UzhKNGl0VzdkYi84SFZVbzBXZDN3ZnliaXU1Z1JqSzZNeDN3M2p2L0FpK1Bp?=
 =?utf-8?B?UzhRU3JUYkRBcnhFbTNUa2Y3SVNiM0ptN282SDNtYXVrQkZ4ajluckEwdlpr?=
 =?utf-8?B?QUY3TkdNcXFQTEZOVFpObG1ucFVXbG9scUJtemVRTW5UWUFaVzNGL0FkZEV3?=
 =?utf-8?B?UG9rT1hpUDJsakhoZGF0dE5NbVZSVWNqemZoVCtDQU53cStxdVhMdE9ZdVpK?=
 =?utf-8?B?Qk9Dak1uRy9idlhkYng2T3Q1R3FsUDNDb2N0YjNMNThjQ2xtcHpheEpFdDBx?=
 =?utf-8?B?VlJXckJtbGIxT0xXN202eUZKSUx6NUEvYlhQMGdUOEtWY0Z2ZXlJZnBaZWx0?=
 =?utf-8?B?QnIwclZDL1kwZ2RDVmF5T2hVSTRlN21oaVB6by9VU3ZMRjVxemdiTk5xT1JF?=
 =?utf-8?B?QUdnLzVBQmFsczdvUzJZSU1abmorUXNvZUgwelU3M2UxTWhBY0thVHVXKy9O?=
 =?utf-8?B?RUtCOVY2Rk1PQW5ERzY0V216VnJBZzd6eEM1bzQ0QWRVeFhWL3BZK0UwUFhp?=
 =?utf-8?B?M2RuclVFMkxaUkE3SmF5OUZucjZ5b0hlZ3U2SW81dG9TY3JxSVBXUUpNYWJY?=
 =?utf-8?B?YWcxS0VtOGllYVBpTmovbDJUeFZ2R0hBWC8zNGxRK0NsRzY3aW0xVXNocmpF?=
 =?utf-8?B?cU5RTU1lSkpKdUNhaFg2ekV5QjNoY3kyek5FTUhBZnI4b2Z4L0Iza3Z1c2RX?=
 =?utf-8?B?cERqb0lVak5vK1FFZ3RzVWhRWjRZOTNLdCtWYy9vdGtZWFFSVGRNL1RpRXJj?=
 =?utf-8?B?ZUk2NHZkL2JoVXFPV2Z1aDgxWnJzVVJoZ05obWcrdjlUa3VBbmlKMFFVNnd1?=
 =?utf-8?B?RzZ2M3lySnRHaVppODRkTnNFQ1JHMGlyTzRoc1pyckZ4QkVOaHdtbktMV0pI?=
 =?utf-8?B?OXhzUWd6WnZMazlKcXBFeDIyK2FFcWIxbUo2SkpOa25ZeEVqSXdYNzJvYmlw?=
 =?utf-8?B?T1p2RFlDZ3o0bVVjSGNOTnR3MVRiUDFiaTlLeDNmZlZQbHJteGFJVjhBU3p5?=
 =?utf-8?B?c0JmSTdhOG9FZnBqR3hvN1hsMnNIWGVMNy8yZUc4OElGZDgrTjVIUGg0M0M4?=
 =?utf-8?B?Tnd1UGFmUHJxc2VSTkVHUXByMU53U3ZJRnppOG9SaDBHMjdHVWU1azFld2N4?=
 =?utf-8?B?cndvbS9FajBPSjExWC9MamEzTi9lL0UwRkY1eTlWYVpYVlY5bXlFVVZmZGh4?=
 =?utf-8?B?S2dGZ3g2STJzWWUwcThNc3MyY0piYmVEUStYK1lXSGpENnYxcGJqWUQrL2gy?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a35146-eab1-4462-9afb-08dc55387579
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 06:20:16.1218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYmlUanLXtcwlSB7c1/8rw1j3tDwCQmDVxfBhkOSxW6Sm/sgHYg0LlNGQWbkklnGWV8hVNLS6+bElzjYNSRfGK985Rpzc+sXRnHu2pPlqAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
X-Proofpoint-ORIG-GUID: f8VLZEw2dTneHPS4V4r2BWaW42wA_M8p
X-Proofpoint-GUID: AVMn0CVWJ-Y1yzkVxAzDqmFOYokxnhBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_05,2024-04-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=643 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404050045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 06:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197975

--------------0OlnRMaZ0TtzI68NVUAAOjGk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4355sqGR020910


On 02-04-2024 22:20, Khem Raj wrote:
>> You could make the application of the patch conditional upon being the
>> mips or powerpc architectures.
> I think that will be more hassle than disabling it for all architecture=
s.
I see that V2 of this patch is already merged with master branch.=20
(https://git.yoctoproject.org/poky/commit/?id=3D8d27d8ff7cc65d2059ca29352=
b57301ffc35a163)
But, I have made the changes to apply the patch only for mips or ppc=20
architectures.

Please let me know if you want me to send the patch.
The changes are as follows:



diff --git a/meta/recipes-core/glibc/glibc_2.39.bb=20
b/meta/recipes-core/glibc/glibc_2.39.bb
index 9122472689..497141f4bd 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -49,7 +49,6 @@ SRC_URI =3D=20
"${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
- file://0024-qemu-stale-process.patch \
 =C2=A0"
 =C2=A0S =3D "${WORKDIR}/git"
 =C2=A0B =3D "${WORKDIR}/build-${TARGET_SYS}"
@@ -89,6 +88,11 @@ PACKAGECONFIG ??=3D "nscd memory-tagging"
 =C2=A0PACKAGECONFIG[nscd] =3D "--enable-nscd,--disable-nscd"
 =C2=A0PACKAGECONFIG[memory-tagging] =3D=20
"--enable-memory-tagging,--disable-memory-tagging"

+python() {
+=C2=A0=C2=A0=C2=A0 if (d.getVar('MACHINE', True) =3D=3D 'qemuppc' or d.g=
etVar('MACHINE',=20
True) =3D=3D 'qemumips'):
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar('SRC_URI', ' file=
://0024-qemu-stale-process.patch')
+}
+
 =C2=A0do_patch:append() {
 =C2=A0=C2=A0=C2=A0=C2=A0 bb.build.exec_func('do_fix_readlib_c', d)
 =C2=A0}


Regards,
Yash

>
>> That does have advantages and disadvantages in that it is easy to miss
>> when upgrading the glibc recipe though.
>>
>> Cheers,
>>
>> Richard

--------------0OlnRMaZ0TtzI68NVUAAOjGk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02-04-2024 22:20, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMKF1sqEcreVccQcwxWikHDrr_EX4vcHVYJ0AUr5z22necOLiQ@mail.gmail.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">You could make the application of the patch conditional upon being the
mips or powerpc architectures.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think that will be more hassle than disabling it for all architectures.</pre>
    </blockquote>
    I see that V2 of this patch is already merged with master branch.
(<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky/commit/?id=8d27d8ff7cc65d2059ca29352b57301ffc35a163">https://git.yoctoproject.org/poky/commit/?id=8d27d8ff7cc65d2059ca29352b57301ffc35a163</a>)<br>
    But, I have made the changes to apply the patch only for mips or ppc
    architectures.<br>
    <br>
    Please let me know if you want me to send the patch.<br>
    The changes are as follows:
    <p><br>
      <br>
      diff --git a/meta/recipes-core/glibc/glibc_2.39.bb
      b/meta/recipes-core/glibc/glibc_2.39.bb<br>
      index 9122472689..497141f4bd 100644<br>
      --- a/meta/recipes-core/glibc/glibc_2.39.bb<br>
      +++ b/meta/recipes-core/glibc/glibc_2.39.bb<br>
      @@ -49,7 +49,6 @@ SRC_URI =&nbsp;
      &quot;${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch">file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch</a>
      \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch">file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch</a>
      \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch">file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch</a>
      \<br>
      -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="file://0024-qemu-stale-process.patch">file://0024-qemu-stale-process.patch</a> \<br>
      &nbsp;&quot;<br>
      &nbsp;S = &quot;${WORKDIR}/git&quot;<br>
      &nbsp;B = &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
      @@ -89,6 +88,11 @@ PACKAGECONFIG ??= &quot;nscd memory-tagging&quot;<br>
      &nbsp;PACKAGECONFIG[nscd] = &quot;--enable-nscd,--disable-nscd&quot;<br>
      &nbsp;PACKAGECONFIG[memory-tagging] =
      &quot;--enable-memory-tagging,--disable-memory-tagging&quot;<br>
      &nbsp;<br>
      +python() {<br>
      +&nbsp;&nbsp;&nbsp; if (d.getVar('MACHINE', True) == 'qemuppc' or
      d.getVar('MACHINE', True) == 'qemumips'):<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.appendVar('SRC_URI', '
      <a class="moz-txt-link-freetext" href="file://0024-qemu-stale-process.patch">file://0024-qemu-stale-process.patch</a>')<br>
      +}<br>
      +<br>
      &nbsp;do_patch:append() {<br>
      &nbsp;&nbsp;&nbsp;&nbsp; bb.build.exec_func('do_fix_readlib_c', d)<br>
      &nbsp;}<br>
      <br>
      <br>
      Regards,<br>
      Yash<br>
    </p>
    <blockquote type="cite" cite="mid:CAMKF1sqEcreVccQcwxWikHDrr_EX4vcHVYJ0AUr5z22necOLiQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
That does have advantages and disadvantages in that it is easy to miss
when upgrading the glibc recipe though.

Cheers,

Richard
</pre>
      </blockquote>
    </blockquote>
    <pre class="moz-signature" cols="72">
</pre>
  </body>
</html>

--------------0OlnRMaZ0TtzI68NVUAAOjGk--

