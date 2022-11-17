Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D82DC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 04:11:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7770.1668658306233371912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 20:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YtyROckp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83209441af=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH46kP5016819
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 04:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XiIT/JGeYFvmf6OTlThZQwJ9iBGwnBNr97x4Tl8PHus=;
 b=YtyROckpVz2xxfbi1QEpn1LuOCvKms4pM2lDztMgPLCmoBKtWP22VjRUFAdZe1GPAnuV
 oIztwXGSBuC6Tc5isIDprLqHz2AQswLqOUT6TlSjNluhXV+BCNaFyaZiucBz+hroWfQa
 YHE2zPFXTfQiAk+f2RSGha23jFm/Uxs+isloPpjpasZl0hYrpZ5r6cneavYoYa5rGZtx
 EGrijdlffqvBeMn0AgroESe0nw2dGAI5qGdks8vRNLv/upqzT7fR71lj09eDq119hsJE
 d0gIr5Ik8RkDpUgUxH8Fa/bBvV+WK6OM+FeLIgafStMxLaefBJ0wDSD/LuqopfwlFpCF 9w== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbu1g226-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 04:11:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDzP11TL8EbAdefr5jTk7TZZJHqRYhCRDbG6xmwmDJ8I6VGtqwOk3KCVrVgztxFvEsHRc7CwwehOY7qxyjkdenohRP6lNGOwRdtW9RWjF2TiyEJYD/F0SG3TF4PhJeu7E/O+fDdiwvkotwleANqX+g4yEMbv6bM/tQ7MwzZXLtI6esUwHTY9FhcuihRnZy+LtjsllqZR7xEnppT+nt6r5TNgW+EHbpuMsu6fJDpeNZkFSEcktWsT25ZmBlJqPaKrHbCiySmrdVAHq+kh6rmEdAhCJh79W7FexYsA4MoHcPmLhfjucVCQWjTH8hHMOyH8cM8jY/bbMuivQuB+LJpBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiIT/JGeYFvmf6OTlThZQwJ9iBGwnBNr97x4Tl8PHus=;
 b=ddozQcf1E2PxCPgtt6c06jw0nxpJQGUSMa8cNGkUUSN+XAabjE2Wt15IAuMJcJ2HTXBWY76DQa43UV0wcg+4ouZG6C/k3Ch1dmt1v+Jrs/HsxnfPsTXhQUC11dtUFhBZV4XSPgXXVPw2hAGkxBLcWAMQH4hQ9/GPMjQmNNtyuIM/LGr+k/TEOFOS/X9QfOfhU6VRwlQ2s2dCSZm22lHS5kRBfzJ8z1op6YsxxKSlUbNkayB5UIRT0r/zdJGTHHiXBxzvOpnfCOIeTeNApquhxMSwHWo8gzNLSiEkm2LejTFZRSQ1AwA6ank4v/QJNRPqbpxKz0DV0EnlYmPp7uxn4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB7067.namprd11.prod.outlook.com (2603:10b6:806:29a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 04:11:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d%3]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 04:11:42 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][master][kirkstone][PATCH] kernel.bbclass: make
 KERNEL_DEBUG_TIMESTAMPS work at rebuild
Thread-Topic: [OE-core][master][kirkstone][PATCH] kernel.bbclass: make
 KERNEL_DEBUG_TIMESTAMPS work at rebuild
Thread-Index: AQHY+jlAwyZD1nbs+Ey2XSU2U8Miia5Cf/kg
Date: Thu, 17 Nov 2022 04:11:42 +0000
Message-ID: 
 <CO6PR11MB5602687237D5524C6CAE4315ED069@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <1728434F57F58DDB.2122@lists.openembedded.org>
In-Reply-To: <1728434F57F58DDB.2122@lists.openembedded.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SN7PR11MB7067:EE_
x-ms-office365-filtering-correlation-id: 7f5f0b3d-ad77-47ce-ad98-08dac851d52c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7sabraGcC087H0enbTVAWGPxY+YrKpEbGTvsMPI7kL6b6c1hL17yqlKP0MmOy8bRIdMlPTgTSbhr4r+HP8T779XhTSjzWT6AuVfu0wnincmQUpDmQyjtsNl7H5IVeCOx0IGRCml+Ghk0wQbPq9s9NgyuWk3xKBkSqqIiFJ7+q+q/aC4fMsWIJXwiZEKLL91FN80qT7hOpoFLfMv7miNomSiVQ0cVsjwlrWMBovewEI51RpoG9ILTLaf4ill1UCXMyE+sJiBV6Owwtu5izJFeMtwROgHz3U6tK+stdpBGBC6iwoyuXFPrAjY1+Qv7202g9j1yELUmUyhviKn2/RagFIQF/1zdqDv9pYwSDhhTmVGu/1LcqielQyOJDBERcO3vMq5Sd2nFOyCQutYNZyC5vGLX8oxP8Djm75DNb4wYuy+KsberRT0iOBKt8TEZ99hbWfN+SwJ092W0SwYmT9aLjfT08KEHcB9jQ4UtaYHb0krJEO4cmPPfE2NVpwWHrvzfY5GFtO1FT0NAB2LRHds1UIBbhjVo6V14x0+SBrUxBKlEz48hQyDKAVweha+JjKZSNmqZ9CFtSOnkwO0EJnaDXfANa/TtrXKBK9LkZPdFGY//t3dsdqWVTplqqRfu06DBPwpgq/WTxDrd9ohm+OC1ygj69DSzjsJHor5fFwH2VK4b47sSYvgemIejsUlJMgEKGrm/iQRv74x5rwFcd/Q5qYsZBeF9xCrA1tnW9pG3AXyvXK+aZITYZ/RQyxPVn8IDl8o7/gCLzPaokfijoa2RhrV5wkGxEG6kAxUwFgL3u+4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(136003)(396003)(346002)(376002)(451199015)(8676002)(76116006)(52536014)(66946007)(66476007)(66446008)(66556008)(64756008)(5660300002)(8936002)(316002)(41300700001)(71200400001)(478600001)(53546011)(55236004)(122000001)(186003)(9686003)(26005)(7696005)(110136005)(6506007)(33656002)(2906002)(38070700005)(86362001)(38100700002)(83380400001)(55016003)(9126006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3NrcQWhZlo3jxO3p0pi856iRciopjk7DHHKWTo/HFuMmiH/Lci8fem3Tdkp0?=
 =?us-ascii?Q?nDrAyG33Lzx9NWx+uTpVLrVmklhO6eQkNI5mhRJYuRFvcDPImweFQJhzvAAX?=
 =?us-ascii?Q?D6jR6T4ePUeXPHqbYRaFErsQU5r7/wqB70uYCNZwD/G4Vjr0RA3a8yhWwjuh?=
 =?us-ascii?Q?ZNPuQcgo3hwkJfR1wcKfh7mBKAMf0CLWyw4eoWy/+xm60cww3AAOYIfb7nul?=
 =?us-ascii?Q?VpHEgXL7KNfh372MS0XTcZ8KT0t2Vu1MA8TkKVB3/1ln1vVUNW9wpJHvhUBE?=
 =?us-ascii?Q?zgpELrjfGwTBkNxrmi7hEPgaHeymT0HW4wdkChZh+Ao+EvdblIXlbXrTK/ki?=
 =?us-ascii?Q?uqOoEpE/1ZYQ8IW6e/Y0hWRpocMWn0gQET4FeL/WGpm52ff7ydL9vRpOI6vy?=
 =?us-ascii?Q?8Qy7WgXQxExOzvc9YVRSO4q4bpcKn/Y3jsURxmERGQhNKde8tcVKyWuQCzGY?=
 =?us-ascii?Q?wmlG1Zonm9q7Lwqk7AciFhLUeGCzW5y+7MiL7yTkoJTlOxYoK1MU8mvxXvDD?=
 =?us-ascii?Q?RHVkEpB8b342KxUv6p8LXX7DsVWgH0eZzzmGMc0eR1/+6WBqfUtR6Uw4W/4+?=
 =?us-ascii?Q?kMupys3yiotbf4sMs3mXACDoeddz1oGR7A3JI/uZPQRYMIcALT58culWGnOf?=
 =?us-ascii?Q?vJrXR6NKO8ykjtzdlOMs6HY99J7sYkewPL5OXO4EG7oKPsEpdxXCHicooQit?=
 =?us-ascii?Q?WIJdG4MHp8y5yOjMtd0bKZOUSjqqrI3kovOF2vm59Bf/J2UQtiRE1uy4xf0F?=
 =?us-ascii?Q?q4x0ymSgtp6XmWTZ28ZFl+dxYd4AH35Sn6jMp1dmIFIHDsuxp2jXFJeXqfO7?=
 =?us-ascii?Q?VH6QZL60O8vpEapW77eQU+Z5Q7VUxiwKTaVkoFmp24zUoKnahfMrsRcsXQEN?=
 =?us-ascii?Q?m8nDf4n0EEXTIG2SniTvLXdbwKjvh+wTD4p8jwWzATPXqMHu1tOOzj8W0+XJ?=
 =?us-ascii?Q?0w4D/6tv88CuqYOW445BNRfOeYt5O2PpjVUT2g/yifp9Nzln+YavYI3Hyk98?=
 =?us-ascii?Q?pGaFyajfz+lbGtXeRM7ZIrgZp+uifUAcABAiRh2U93Xw66S9/3262FlLNnmQ?=
 =?us-ascii?Q?qkc97I5hNBVQf4U+AYtcBmmJtd2Q8QnZIGQeXzg6FbKyfDluMXpwCEHdkmdF?=
 =?us-ascii?Q?IWEdwXJCYbJl4E0EGvyObcgdOK5OTG9sDw0HZaqG9Gt95mZwZu6B4tMIhd74?=
 =?us-ascii?Q?T2ezLv/zsH6fXYpxUNj6+YmmqaHdqsEvJRxE6DB/H8YJxJpcxf4TZUL3EeB9?=
 =?us-ascii?Q?2jkMVrLdDuF2jI09PlFxH3I3fasuF5SgNwFyMZbdX7jXTlYDT+QhcS0WEiaa?=
 =?us-ascii?Q?L6LREJL6VKP1OmrY2mMvY+hmPQe/cstaSa4dqVMD+F0Fe2p3cJop25rXlucJ?=
 =?us-ascii?Q?uQuzAoltlnNjgPCXjNQV62uVV9chdNpbhNyWWpj9w8vDQv/lZGbzaiaD68qw?=
 =?us-ascii?Q?DS6nq9ohD5bk/F9VjTgydb6rOf644X0b1ROfLnZNJwQR1OJDdpmyaxigH+7H?=
 =?us-ascii?Q?nxADIxReNAefxpizBD9+8DHCQ2YnUOGrGkRbaVipf80wBYyo6pynZ26VszJJ?=
 =?us-ascii?Q?OBBY4BoXQF44humrG6NqYsOCTE49yBkOmz2JRcZV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5f0b3d-ad77-47ce-ad98-08dac851d52c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 04:11:42.0571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eU9iFM1XC5xid9IpM8+bhae7zkpLcbJP0bsbQm7ofjn3qyBc72QE6731QKFjtVehRW5o6sITwCTWTRZzn4VyNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7067
X-Proofpoint-GUID: ZlKlklq_naC5foeoqXNN7YmD9CtfFNNm
X-Proofpoint-ORIG-GUID: ZlKlklq_naC5foeoqXNN7YmD9CtfFNNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 04:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173400

I definitely put contents from mkcompile_h in the commit message. But it se=
ems that git will delete all lines starting with '#'. A space is needed at =
the head of the line to keep the contents.
I'll send out V2 which only updates the commit message.

Regards,
Qi

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Chen Qi via lists.openembedded.org
Sent: Thursday, November 17, 2022 12:01 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone][PATCH] kernel.bbclass: make KERNEL_DE=
BUG_TIMESTAMPS work at rebuild

Currently, the KERNEL_DEBUG_TIMESTAMPS is not working as expected at rebuil=
d. That is, even if we set it to "1", the kernel build time is not changed.=
 The problem could be reproduced by the following steps.
  1. bitbake core-image-minimal; start image and check `uname -a` output.
  2. set in local.conf: KERNEL_DEBUG_TIMESTAMPS =3D "1"
  3. bitbake core-image-minimal; start image and check `uname -a` output.

It's expected that after enabling KERNEL_DEBUG_TIMESTAMPS, the kernel build=
 time will be set to current date. But it's not. This is because the compil=
e.h was not re-generated when do_compile task was re-executed.

In mkcompile_h, we have:
"""
"""
It has made it very clear that it will not be re-generated unless we have K=
BUILD_BUILD_TIMESTAMP set explicitly. So we set this variable explicitly in=
 do_compile to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
index 3834a42fb9..3f6b40907f 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -367,6 +367,10 @@ kernel_do_compile() {
 		export KBUILD_BUILD_TIMESTAMP=3D"$ts"
 		export KCONFIG_NOTIMESTAMP=3D1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	else
+		ts=3D`LC_ALL=3DC date`
+		export KBUILD_BUILD_TIMESTAMP=3D"$ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	# The $use_alternate_initrd is only set from
 	# do_bundle_initramfs() This variable is specifically for the @@ -412,6 +=
416,10 @@ do_compile_kernelmodules() {
 		export KBUILD_BUILD_TIMESTAMP=3D"$ts"
 		export KCONFIG_NOTIMESTAMP=3D1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	else
+		ts=3D`LC_ALL=3DC date`
+		export KBUILD_BUILD_TIMESTAMP=3D"$ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
--
2.17.1


