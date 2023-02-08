Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151E7C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 17:33:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4554.1675877621898343029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 09:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VzzHF1WZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1403efaf90=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318GLnPj030277
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Feb 2023 17:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=u9YMOSlJqLWGAz/Ajjs/aKyg9UURICQV5n3fvaQJgOc=;
 b=VzzHF1WZSK/Usn9ZCjm0JDIvmfFMEVd85ti04tokWyQOqGfzu4V3AjrW+rAeOkKBHNPn
 omh7QVDXsW/BlD0Co6/gKa3+d1m16S6RBxQuGbKI/F4TTxhFVDJCa2/ifeBPZgzxCmMK
 F76LvsOIRp96sz8yaHdnM2Wxj0+gCMJomP+SLdScm4emUdRCRMQgdZXPixechGyZ2VQc
 rB0Qb6DzJIcpgZSRe9LQQnREdT5doXssKRmbVZOhDR71Oee6LllOkFjKqnuLQX2/IXbG
 c88kd6y/29corOft00jlR1PxjZhiWzDtKm5bNxoPJ71QVNZhYeNCucs53TLFKtKL9qN0 CA== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck34ekq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 17:33:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNnr0uXR84iDcwj6QzjaWQI+foIsTLVTuzuYJNudsQUbZpIDttKzpvx7UiNphlXi8q2B+GRq0nQm0oyCr26NtFiphY45e5HPS5myDqwFdasrywPHOS/sbvdvmtmg5ZaNojQiHIB1fqkeW2aUYHfCeFBSxC5wMnlWK4jgq0Uh6oap/Oz3raLKQKgZ03eL+pc5Ro+zI6qzgJlZkTwvXMBV8BGA7rqRoVLAZd1M64uVjw81gMa4vIp0E3t+sFgSfAByToAB57lg6Te5GU5zAWbjbRNErvtTCeP2DhHRGd7w1d7CKLmov3oYCUA6ndqfLA6xVc41GTuTMBU3xIQKwbtwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9YMOSlJqLWGAz/Ajjs/aKyg9UURICQV5n3fvaQJgOc=;
 b=eQ1CqlhcsWzhdIkGqmCuQqbOOiom9JpYYINq+Iw6FH/3fovv+IKBnMVIvUGp/eiZhSPh1t5bxPrRQFr7Je6cVpPFmg3OB1p9pvdqFQZ+LbUnEnRAwVoxXTWTFTINe1fh4dDYH7u9T78oGTNw/Pu3s58YWtvYt7qLD+gLT5Yj5EkQCAix5HMTpfeuD6tPWiwn0OXezBAYgMM/Ne8ioPTxOHM7Q/aEYc6xCaEtniz44Y9SpvGu2t1Rztt44g32Fn59oKBBbwofAawKaBf0X8N83ggD/Myq5Hkjzcvx9YUlqdZLgyfHNnaRMpViRe8X/b1XN79Joya6oT3BM20xlN+j4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Wed, 8 Feb
 2023 17:33:36 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6eb0:fa25:126d:f560]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6eb0:fa25:126d:f560%5]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 17:33:36 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Polampalli, Archana" <Archana.Polampalli@windriver.com>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>
Subject: RE: [oe][meta-networking][PATCH 1/1] net-snmp: CVE-2022-44792 &
 CVE-2022-44793 Fix NULL Pointer Exception
Thread-Topic: [oe][meta-networking][PATCH 1/1] net-snmp: CVE-2022-44792 &
 CVE-2022-44793 Fix NULL Pointer Exception
Thread-Index: AQHZO+MBnO1HvBNo10agZRgbObBmn67FTqdq
Date: Wed, 8 Feb 2023 17:33:36 +0000
Message-ID: 
 <BN9PR11MB5545393AA9FFFDD7F100F59CE4D89@BN9PR11MB5545.namprd11.prod.outlook.com>
References: <20230208172847.3248669-1-narpat.mali@windriver.com>
In-Reply-To: <20230208172847.3248669-1-narpat.mali@windriver.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5545:EE_|SJ0PR11MB5598:EE_
x-ms-office365-filtering-correlation-id: 96bc4c8f-c6a3-4193-f028-08db09fa9bd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m+fgDpjdqkJVkydOubIgJkZ+5RckAzgZO+VgqvcB2slw/IH+Jt8A227d/1Ujz76mdgcjv+NoPOZJ5BrwRv1qBa6WJAx3t9Az+NuZoojq3OfgjUCkDeoZ3p/Qaw2g05tSMuyzJkS5Y3P6Xw5wft13wiNW3R6/brQ9Iu2KrlxEpcq0VkGpe1KE/sOA4H1i4JLOI/1PHr6qROKpNe+luxy11rVGMtBPXrc5qfJHgQ+WMUeEqIJHf3ZWm8ikLimmxtnGNRZRGT3WemPyf7ENdEC9q0NpkYbO+xX7tVRdNY4H6yYeE5scsFUruQAeGziLx3rUKsOXwEfglH33relvrXj89QwWQzw9SHDU3GyRnnZCh4LnhXlY9UrH2jPk1Rkt4MGMHCkZgxiary9aed7JuE85CCKsEqgYBmE0hP+3KwJ9lcChgOwO304ynycJbsoG725MSElCkRjj/lvhnjn5sKNSiEwDWic3dvzZnz1To/t0uZ78Ct3jCDMjKzeWuiYyTtum2HoD78NCnQEDPkAbbyNbrNXL6xf3U+JuGlVhesEJJJcU8ykNKvLOIfJErHDFQVdh2EzamIr+UjRvTJRF3P17/tnuok53X65bWjhLqsEcHz4cqewGdB/dMo5Muj88Iszwxc0MUwImcOONRjLdVsWlxTW6AGiyyPSFIAAPcazk1YcwDPHgEQdjnXiZO2nt6oPjgKgOloi/uRfs9yAt+3AKzlyH7EXv8c7WWZ+VJ+ShMQuoSiQSCeSwKDLun/neMQCvHLyKw9mIr/sMewE6VBrFBg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(136003)(396003)(39850400004)(346002)(451199018)(186003)(5660300002)(83380400001)(966005)(66446008)(64756008)(66556008)(66946007)(8676002)(76116006)(6916009)(71200400001)(4326008)(66476007)(122000001)(91956017)(52536014)(26005)(9686003)(478600001)(33656002)(86362001)(41300700001)(54906003)(38100700002)(107886003)(8936002)(2906002)(38070700005)(316002)(7696005)(6506007)(53546011)(55236004)(166002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?h7jryA0m4lVV63twCUcbAx1F0ySxq2xdTBVvbYfca78JyTn5HJaIjuhlPwwO?=
 =?us-ascii?Q?d9vLh5h251W5Qpgol0naHTX9Q5RAtIUWaAQ1P84wnZ2DoRnWciUVGFY8EFI6?=
 =?us-ascii?Q?Ij3D8exmf6JkOMzPRDHRueRdWVpZ1QEHeRyyknC3cuDJElNklN8V0grO0Y7R?=
 =?us-ascii?Q?E6hHf3a8G0wyTCmagBY2E1U8fd3+Uo6bSyzLms4ouj34IC/Rs/OE0NsAYV+W?=
 =?us-ascii?Q?Vf+alI7IZduUVY+bEpF/UajU/2aCaK1ItJxLWzBxJJ14eEWwFjPRAs3qLNak?=
 =?us-ascii?Q?YhciO9a8khbIEvlG5bURs+jgJFoO1S5zYBR5m4G9XXpeoXkzFkghG37CtoD0?=
 =?us-ascii?Q?qHM/OubZCzV+qeup6YUKdkXnm1J2PXe+783jMZTlXLk6VK/i2OVJx01Y/1YE?=
 =?us-ascii?Q?VYCsIhhrGktx/jSI6x1IYULhd417qmJ2iYI9MzQHAmlQ8N9ssw6dj4p9Eymv?=
 =?us-ascii?Q?AXFFml9xdjp1tBiUnzo4K894j1B1sp4J84F0rDs6kf1laOC80OVWS3PQqoEl?=
 =?us-ascii?Q?iX3i28RcLqIm9AI9kRIZRJqNiTUqwPF4yanV9YWiYba8mzrSIETTqsXaBGwu?=
 =?us-ascii?Q?IxTvREUKRM6NYb1qAWbt78Dqcj6m0p58Tp3dmcx+qe5NyJc2oVe5JkQFL6cs?=
 =?us-ascii?Q?BuJcqqxH2cFySCYWpciOzMd+NUwoP6Y/1LiGSEeAPc9rbzlYQGdR1pQ71Zbc?=
 =?us-ascii?Q?eEd3EKPolfEKiYubidgtF/5ofWPyO44sCYHMC3wUjbj763t9kRROBAzNHWUF?=
 =?us-ascii?Q?J/Xx6v3rnAhV2KpXgs6/CBTGM/nDqE3fNnHaORFHUoU7pt3wI9niJTyF8GJa?=
 =?us-ascii?Q?Hp6r8dVn2tT9Hec6iu3Ukt+jtaWlQGOZipWYpwGQthjTSekyuDBL5pKDUO+3?=
 =?us-ascii?Q?oOq1AS0IIIUd6r+R6IR1MVcq/Q5+e4o9cU2/MPLVisij08/61BHghbIC4fLq?=
 =?us-ascii?Q?UIafbJfNqr8tQyISUSRhs6fKW9YRQtcDUmiLJpsSy2L0WTv+lL99Z3a+PtnR?=
 =?us-ascii?Q?NfVpF1W6q8tjtg5Ju5pBw/iRVEYry7JCXJ4Z603dZo275Aryp9fxd3+rmISD?=
 =?us-ascii?Q?kbDk5Sr/neSCUN80I8VI8DyvZ2m8T6JSUmlbnZOHFuDjwz/B0j7sMcZT+r3j?=
 =?us-ascii?Q?3uA0Ao7UDJrc6ZeyCx1vgtZ/nN2PkN3LFuFZCq4xTMZK/32ORBHV17pVLMh5?=
 =?us-ascii?Q?2wkND1jL530netXFwaECV9RFM6ogPscwM+Zz+7b/nqsv50m1iEif+ly1fYFd?=
 =?us-ascii?Q?TCtpWECFuFOQpAZEPTw/H+rONj/nfFeN7Nbtk4NKZdWmDQ/zXnxyudEGpyBA?=
 =?us-ascii?Q?OaTOU2Mebqzds113WCla0xDWsp1erai6cko4vOy1J2leGmg8W3KrmMKUvYcP?=
 =?us-ascii?Q?XLgxxEue6m6SAej4kb2Fm3//IcVkEO5w65p99TC7cyacrZQQzgKurzC3+s5B?=
 =?us-ascii?Q?85lunsytYGGok7RaFp7+dc/EZ2NkRlYxyJ8lhETBXLpRZDZzbtEyL7TtdBRo?=
 =?us-ascii?Q?bbR9GXYTOmPis2FyyiWozcYqdvoUrJwhmysyGw71NViH9kCulZsJNcWz+PTE?=
 =?us-ascii?Q?V8In3ZCQppRKmZhFciWtxcO+Uq10oUhW3zeldSEdpaDXulzyUDP+1UsVfrFI?=
 =?us-ascii?Q?galILIPXHUZ0iklfysakjD8=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BN9PR11MB5545393AA9FFFDD7F100F59CE4D89BN9PR11MB5545namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bc4c8f-c6a3-4193-f028-08db09fa9bd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 17:33:36.3773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mOsdxclcrC/UqteO5978g8o4Q/hOqT4T2QYCzWdU+PPuEtNN2Pev9n2fEBsJwnxV9fS7AL4OeBBsG9owvFi1wcahNvLmLQA/98owSdOd4hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5598
X-Proofpoint-ORIG-GUID: wQwnok09vLEI2kkg5-u-oEKFhZi9tk81
X-Proofpoint-GUID: wQwnok09vLEI2kkg5-u-oEKFhZi9tk81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_08,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 17:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176910

--_000_BN9PR11MB5545393AA9FFFDD7F100F59CE4D89BN9PR11MB5545namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, by mistake sent to OE-core.

Regards,
Narpat

From: Narpat Mali<mailto:narpat.mali@windriver.com>
Sent: 08 February 2023 23:00
To: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org>
Cc: Polampalli, Archana<mailto:Archana.Polampalli@windriver.com>; G Pillai,=
 Hari<mailto:Hari.GPillai@windriver.com>; Mali, Narpat<mailto:Narpat.Mali@w=
indriver.com>
Subject: [oe][meta-networking][PATCH 1/1] net-snmp: CVE-2022-44792 & CVE-20=
22-44793 Fix NULL Pointer Exception

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-44792
https://nvd.nist.gov/vuln/detail/CVE-2022-44793

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../CVE-2022-44792-CVE-2022-44793.patch       | 121 ++++++++++++++++++
 .../net-snmp/net-snmp_5.9.3.bb                |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE=
-2022-44792-CVE-2022-44793.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-4=
4792-CVE-2022-44793.patch b/meta-networking/recipes-protocols/net-snmp/net-=
snmp/CVE-2022-44792-CVE-2022-44793.patch
new file mode 100644
index 000000000..b18d4dc29
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CV=
E-2022-44793.patch
@@ -0,0 +1,121 @@
+From d13302656d9ff0807c5defe18623adc947f43a2b Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Wed, 8 Feb 2023 13:15:39 +0000
+Subject: [PATCH] agent: Disallow SET requests with any NULL varbind Merge =
pull
+ request #490 from fenner/set-null
+
+fixes: #474 and #475
+
+CVE: CVE-2022-44792, CVE-2022-44793
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/be8=
04106fd0771a7d05236cff36e199af077af57]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ agent/snmp_agent.c                            | 32 +++++++++++++++++++
+ apps/snmpset.c                                |  1 +
+ .../default/T0142snmpv2csetnull_simple        | 31 ++++++++++++++++++
+ 3 files changed, 64 insertions(+)
+ create mode 100644 testing/fulltests/default/T0142snmpv2csetnull_simple
+
+diff --git a/agent/snmp_agent.c b/agent/snmp_agent.c
+index 867d0c1..3f678fe 100644
+--- a/agent/snmp_agent.c
++++ b/agent/snmp_agent.c
+@@ -3719,12 +3719,44 @@ netsnmp_handle_request(netsnmp_agent_session *asp,=
 int status)
+     return 1;
+ }
+
++static int
++check_set_pdu_for_null_varbind(netsnmp_agent_session *asp)
++{
++    int i;
++    netsnmp_variable_list *v =3D NULL;
++
++    for (i =3D 1, v =3D asp->pdu->variables; v !=3D NULL; i++, v =3D v->n=
ext_variable) {
++      if (v->type =3D=3D ASN_NULL) {
++          /*
++           * Protect SET implementations that do not protect themselves
++           * against wrong type.
++           */
++          DEBUGMSGTL(("snmp_agent", "disallowing SET with NULL var for va=
rbind %d\n", i));
++          asp->index =3D i;
++          return SNMP_ERR_WRONGTYPE;
++      }
++    }
++    return SNMP_ERR_NOERROR;
++}
++
+ int
+ handle_pdu(netsnmp_agent_session *asp)
+ {
+     int             status, inclusives =3D 0;
+     netsnmp_variable_list *v =3D NULL;
+
++#ifndef NETSNMP_NO_WRITE_SUPPORT
++    /*
++     * Check for ASN_NULL in SET request
++     */
++    if (asp->pdu->command =3D=3D SNMP_MSG_SET) {
++      status =3D check_set_pdu_for_null_varbind(asp);
++      if (status !=3D SNMP_ERR_NOERROR) {
++          return status;
++      }
++    }
++#endif /* NETSNMP_NO_WRITE_SUPPORT */
++
+     /*
+      * for illegal requests, mark all nodes as ASN_NULL
+      */
+diff --git a/apps/snmpset.c b/apps/snmpset.c
+index 48e14bd..d542713 100644
+--- a/apps/snmpset.c
++++ b/apps/snmpset.c
+@@ -182,6 +182,7 @@ main(int argc, char *argv[])
+             case 'x':
+             case 'd':
+             case 'b':
++            case 'n': /* undocumented */
+ #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
+             case 'I':
+             case 'U':
+diff --git a/testing/fulltests/default/T0142snmpv2csetnull_simple b/testin=
g/fulltests/default/T0142snmpv2csetnull_simple
+new file mode 100644
+index 0000000..0f1b8f3
+--- /dev/null
++++ b/testing/fulltests/default/T0142snmpv2csetnull_simple
+@@ -0,0 +1,31 @@
++#!/bin/sh
++
++. ../support/simple_eval_tools.sh
++
++HEADER SNMPv2c set of system.sysContact.0 with NULL varbind
++
++SKIPIF NETSNMP_DISABLE_SET_SUPPORT
++SKIPIF NETSNMP_NO_WRITE_SUPPORT
++SKIPIF NETSNMP_DISABLE_SNMPV2C
++SKIPIFNOT USING_MIBII_SYSTEM_MIB_MODULE
++
++#
++# Begin test
++#
++
++# standard V2C configuration: testcomunnity
++snmp_write_access=3D'all'
++. ./Sv2cconfig
++STARTAGENT
++
++CAPTURE "snmpget -On $SNMP_FLAGS -c testcommunity -v 2c $SNMP_TRANSPORT_S=
PEC:$SNMP_TEST_DEST$SNMP_SNMPD_PORT .1.3.6.1.2.1.1.4.0"
++
++CHECK ".1.3.6.1.2.1.1.4.0 =3D STRING:"
++
++CAPTURE "snmpset -On $SNMP_FLAGS -c testcommunity -v 2c $SNMP_TRANSPORT_S=
PEC:$SNMP_TEST_DEST$SNMP_SNMPD_PORT .1.3.6.1.2.1.1.4.0 n x"
++
++CHECK "Reason: wrongType"
++
++STOPAGENT
++
++FINISHED
+--
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b=
/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
index 78d711fbf..f40fb8bbd 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV=
}.tar.gz \
            file://reproducibility-have-printcap.patch \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32bit=
.patch \
            file://0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch \
+           file://CVE-2022-44792-CVE-2022-44793.patch \
            "
 SRC_URI[sha256sum] =3D "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f=
9462a413a2ef0a"

--
2.34.1


--_000_BN9PR11MB5545393AA9FFFDD7F100F59CE4D89BN9PR11MB5545namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Sorry, by mistake sent to OE-core.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,</p>
<p class=3D"MsoNormal">Narpat</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:narpat.mali@windriver.com">Narpat Mali</a><br>
<b>Sent: </b>08 February 2023 23:00<br>
<b>To: </b><a href=3D"mailto:openembedded-core@lists.openembedded.org">open=
embedded-core@lists.openembedded.org</a><br>
<b>Cc: </b><a href=3D"mailto:Archana.Polampalli@windriver.com">Polampalli, =
Archana</a>;
<a href=3D"mailto:Hari.GPillai@windriver.com">G Pillai, Hari</a>; <a href=
=3D"mailto:Narpat.Mali@windriver.com">
Mali, Narpat</a><br>
<b>Subject: </b>[oe][meta-networking][PATCH 1/1] net-snmp: CVE-2022-44792 &=
amp; CVE-2022-44793 Fix NULL Pointer Exception</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-44792">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-44792</a><br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-44793">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-44793</a><br>
<br>
Signed-off-by: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
---<br>
&nbsp;.../CVE-2022-44792-CVE-2022-44793.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 121 ++++++++++++++++++<br>
&nbsp;.../net-snmp/net-snmp_5.9.3.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 122 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/CVE-2022-44792-CVE-2022-44793.patch<br>
<br>
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-4=
4792-CVE-2022-44793.patch b/meta-networking/recipes-protocols/net-snmp/net-=
snmp/CVE-2022-44792-CVE-2022-44793.patch<br>
new file mode 100644<br>
index 000000000..b18d4dc29<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CV=
E-2022-44793.patch<br>
@@ -0,0 +1,121 @@<br>
+From d13302656d9ff0807c5defe18623adc947f43a2b Mon Sep 17 00:00:00 2001<br>
+From: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
+Date: Wed, 8 Feb 2023 13:15:39 +0000<br>
+Subject: [PATCH] agent: Disallow SET requests with any NULL varbind Merge =
pull<br>
+ request #490 from fenner/set-null<br>
+<br>
+fixes: #474 and #475<br>
+<br>
+CVE: CVE-2022-44792, CVE-2022-44793<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/net-snmp/net-snmp=
/commit/be804106fd0771a7d05236cff36e199af077af57">https://github.com/net-sn=
mp/net-snmp/commit/be804106fd0771a7d05236cff36e199af077af57</a>]<br>
+<br>
+Signed-off-by: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
+---<br>
+ agent/snmp_agent.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 32 +++++++++++++++++++<br>
+ apps/snmpset.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
+ .../default/T0142snmpv2csetnull_simple&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; | 31 ++++++++++++++++++<br>
+ 3 files changed, 64 insertions(+)<br>
+ create mode 100644 testing/fulltests/default/T0142snmpv2csetnull_simple<b=
r>
+<br>
+diff --git a/agent/snmp_agent.c b/agent/snmp_agent.c<br>
+index 867d0c1..3f678fe 100644<br>
+--- a/agent/snmp_agent.c<br>
++++ b/agent/snmp_agent.c<br>
+@@ -3719,12 +3719,44 @@ netsnmp_handle_request(netsnmp_agent_session *asp,=
 int status)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
+ }<br>
+ <br>
++static int<br>
++check_set_pdu_for_null_varbind(netsnmp_agent_session *asp)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; int i;<br>
++&nbsp;&nbsp;&nbsp; netsnmp_variable_list *v =3D NULL;<br>
++<br>
++&nbsp;&nbsp;&nbsp; for (i =3D 1, v =3D asp-&gt;pdu-&gt;variables; v !=3D =
NULL; i++, v =3D v-&gt;next_variable) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (v-&gt;type =3D=3D ASN_NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Protect SE=
T implementations that do not protect themselves<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * against wr=
ong type.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEBUGMSGTL((&quot;=
snmp_agent&quot;, &quot;disallowing SET with NULL var for varbind %d\n&quot=
;, i));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; asp-&gt;index =3D =
i;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return SNMP_ERR_WR=
ONGTYPE;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; return SNMP_ERR_NOERROR;<br>
++}<br>
++<br>
+ int<br>
+ handle_pdu(netsnmp_agent_session *asp)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; status, inclusives =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; netsnmp_variable_list *v =3D NULL;<br>
+ <br>
++#ifndef NETSNMP_NO_WRITE_SUPPORT<br>
++&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp; * Check for ASN_NULL in SET request<br>
++&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp; if (asp-&gt;pdu-&gt;command =3D=3D SNMP_MSG_SET) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D check_set_pdu_for_null_varbind(=
asp);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (status !=3D SNMP_ERR_NOERROR) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return status;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; }<br>
++#endif /* NETSNMP_NO_WRITE_SUPPORT */<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * for illegal requests, mark all nodes as A=
SN_NULL <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+diff --git a/apps/snmpset.c b/apps/snmpset.c<br>
+index 48e14bd..d542713 100644<br>
+--- a/apps/snmpset.c<br>
++++ b/apps/snmpset.c<br>
+@@ -182,6 +182,7 @@ main(int argc, char *argv[])<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
ase 'x':<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
ase 'd':<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
ase 'b':<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case '=
n': /* undocumented */<br>
+ #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
ase 'I':<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
ase 'U':<br>
+diff --git a/testing/fulltests/default/T0142snmpv2csetnull_simple b/testin=
g/fulltests/default/T0142snmpv2csetnull_simple<br>
+new file mode 100644<br>
+index 0000000..0f1b8f3<br>
+--- /dev/null<br>
++++ b/testing/fulltests/default/T0142snmpv2csetnull_simple<br>
+@@ -0,0 +1,31 @@<br>
++#!/bin/sh<br>
++<br>
++. ../support/simple_eval_tools.sh<br>
++<br>
++HEADER SNMPv2c set of system.sysContact.0 with NULL varbind<br>
++<br>
++SKIPIF NETSNMP_DISABLE_SET_SUPPORT<br>
++SKIPIF NETSNMP_NO_WRITE_SUPPORT<br>
++SKIPIF NETSNMP_DISABLE_SNMPV2C<br>
++SKIPIFNOT USING_MIBII_SYSTEM_MIB_MODULE<br>
++<br>
++#<br>
++# Begin test<br>
++#<br>
++<br>
++# standard V2C configuration: testcomunnity<br>
++snmp_write_access=3D'all'<br>
++. ./Sv2cconfig<br>
++STARTAGENT<br>
++<br>
++CAPTURE &quot;snmpget -On $SNMP_FLAGS -c testcommunity -v 2c $SNMP_TRANSP=
ORT_SPEC:$SNMP_TEST_DEST$SNMP_SNMPD_PORT .1.3.6.1.2.1.1.4.0&quot;<br>
++<br>
++CHECK &quot;.1.3.6.1.2.1.1.4.0 =3D STRING:&quot;<br>
++<br>
++CAPTURE &quot;snmpset -On $SNMP_FLAGS -c testcommunity -v 2c $SNMP_TRANSP=
ORT_SPEC:$SNMP_TEST_DEST$SNMP_SNMPD_PORT .1.3.6.1.2.1.1.4.0 n x&quot;<br>
++<br>
++CHECK &quot;Reason: wrongType&quot;<br>
++<br>
++STOPAGENT<br>
++<br>
++FINISHED<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b=
/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb<br>
index 78d711fbf..f40fb8bbd 100644<br>
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb<br>
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb<br>
@@ -27,6 +27,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/net-snmp/net-snmp=
-${PV}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://reproducibility-have-printcap.patch">file://reproducibility-have=
-printcap.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch">
file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch</a> \=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch">
file://0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-44792-CVE-2022-44793.patch">file://CVE-2022-44792-CVE-2022-44=
793.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d=
3998dbe02f9462a413a2ef0a&quot;<br>
&nbsp;<br>
-- <br>
2.34.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN9PR11MB5545393AA9FFFDD7F100F59CE4D89BN9PR11MB5545namp_--

