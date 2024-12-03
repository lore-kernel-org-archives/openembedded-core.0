Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EDBE6C5FF
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 04:54:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12409.1733201633093479045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 20:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=20671066c5=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B34TJDG016943
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 04:53:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437qx12vq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 04:53:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipE+rvcps+Ta002Rt1dQY9Bjc4i/4uVUsS95vJtj/zI25ScTxgqgJo+j2SChxMMk76zHg8D3fOYBCr1TMlICm0SssCNcThvMYiG0yL+POfet2n0FLx5F62BcNVKcK59Ab2GXAY3sFplkZ1wyrKgQ8OlDw45HYqDapcLKkWEWMLqqt+hQ9yJwrXIczfYPxGyXkyPZowzPctR3eCsobUVoeV8G1gjdvFRGSaA7XAA30D9DOoV6UidI5dqSL3N5UsZvZYrga4l0AE8YY1wNkEwgTzL50dJQJHAWHKGObzF39SyIUxpVm9dmEckBgRLHWq1u9+ipTyXJoQiyclfNORzepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLCjEiMvgi4XcEYxx8i9trZJLioga1B5GqjkapKsBdY=;
 b=P2Sy2r0J+8RWP3x8bgAqFTYzxSqb4wnL2LPlifH1PqPQzD+eOwAGo5+Tb0TEfp3hoFs/Un5kAN4sB6utE7q67m2inPXc3mLw6jdNnSqgq9lvNVfLMbYCu5YMh+XTKhQd8w8kDF4+2PdnKMx68RonjzSVF9/vnz1D/eZn9/w+zsN8uAav1RDeTAi/WSp6INr239kFxcQO3VXybyUlTjorLSbu9HxqOILWcWVnyPifWRDGraxRLnaprDdGeGMXcxnFliQD+M2Rkx24vSMp37gSrt/h9yMHO5gJlYekPU96JmNVFEdH1WXgWL9Lwjcc7WxkbktpPKT+6/ohd/1jcS61nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4783.namprd11.prod.outlook.com (2603:10b6:a03:2af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 04:53:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 04:53:48 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] meta/lib: move buildstats.py and
 rootfspostcommands.py into oe
Thread-Topic: [OE-core][PATCH] meta/lib: move buildstats.py and
 rootfspostcommands.py into oe
Thread-Index: AQHbRT8BDaq/9TqINEa+dZw6WCIQprLT9C2Q
Date: Tue, 3 Dec 2024 04:53:48 +0000
Message-ID: 
 <CO6PR11MB5602C91AC62E433D9D09F596ED362@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20241203045107.3288584-1-Qi.Chen@windriver.com>
In-Reply-To: <20241203045107.3288584-1-Qi.Chen@windriver.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4783:EE_
x-ms-office365-filtering-correlation-id: 7b869a57-03b0-458d-24e9-08dd13567973
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?aGiRike6uoXoRsHTQytaJCaSRhhwxtN+RTWWI5q7Q+PV+JLy35Ttmsqf07xJ?=
 =?us-ascii?Q?eKJp5qILU6ZoxpyWmOjy27kScLgQ5lZpFEtVKFJ7fLd6efVUkyEa2v8GwfDD?=
 =?us-ascii?Q?p79E33QynyRWl4fPB708CVMeDYz/FGuAgnDRIInjmcOOOg3MEOHID/8IDGtz?=
 =?us-ascii?Q?7t7VproO6b+wjtMqz0+uffa3ae2iaYB8lounOU46Y8lJNShkq2vhDc9+n0Ml?=
 =?us-ascii?Q?JmGjWmphemzBLzy+ozugkFgGXKSaOk/K74qUWvvn26FO+/nJet9PFmcz0eUN?=
 =?us-ascii?Q?jy1RSX9/LDvUDIXS7ur1B8P+nVuj4b6mDeWgnk2yQlDJf2bLKLKlhJVF+9S6?=
 =?us-ascii?Q?G2cUA4UF5mL5k4CA1fFGWmiWrVujR21GxfrMYV+iam66jdOonjDunPWkFrHO?=
 =?us-ascii?Q?CRt2TWn+rrHb37eTAdhyGAMw3V+8i7SPwf1hkpfEwCvzL9SsV8c7kLBmHPO8?=
 =?us-ascii?Q?MyID5REKRYo5HeV/bTuSm9UaNYWMh2KFZP/z14j28SJSAXh2vSoEXwCTHfmL?=
 =?us-ascii?Q?Xf6Lsor+g79tybF1wKXCThFgyBZ0G8P+cwCBXzhAJThRAaEqZnX/nWTYEBPD?=
 =?us-ascii?Q?jb+VfK7/p4doLyOlvvj+R5aGUKab04q7TrvKRRKLd+HjBsTNz1nvPfhqUhkc?=
 =?us-ascii?Q?wRpdBxen6HZcVW0vUCQhQzW9TeZidILaRqQ5sm/46ilDxVNlsGZh2Pv54eXX?=
 =?us-ascii?Q?GhENmsuaqDf3WXyioRv7s33GlDUfkacTUwc8LmSl4H2pKhggPN6uUroksjhN?=
 =?us-ascii?Q?deJtMf+nWwODWpJmqRggI8V07KBJoewkQoseZuFsGiwwkHifYN8QfWc+5a6j?=
 =?us-ascii?Q?fjt3cM9aN9eKPiPvzBo9xd2gxButHguxhS2OncfYwRe1FmzuuvHf89GnP5kV?=
 =?us-ascii?Q?78a3/nyiiyWrOTzqX347YbKU0cYLuWPHSyArZCLnWnM6NbYYlOMXYLVOzw4F?=
 =?us-ascii?Q?Xw89r0k7FrrjhiLLHvmwi9PS5oKifLdyE4SvXSlB+AA8pPRT8hf3b/jpZd29?=
 =?us-ascii?Q?E2G4WDid4jNGuTTazmzn1zXLeBpxfKnmcEg+e+QERwQyMv3uMHKgXvjHHlgT?=
 =?us-ascii?Q?gVgdTE4I3Aa66cKWMrwk8/YjR8P7U7zQvDrSgS7/JabcxZ/PO+SyNCFWjZMI?=
 =?us-ascii?Q?TcGQAPKTI2OUCEWY6qZnmAdw0FyC4Hb7uUegphHgBxOVt33YCPassc3zJwAu?=
 =?us-ascii?Q?KaZq0iq8OJBGFrdaSSAIphznbRh3UkjpOBaMpS6nfQJHCNEIxGIT9NO8fZEO?=
 =?us-ascii?Q?BE8J0303FZKkYb6FAhUao3QjAmW4j+N0PML7MpK38R5J3e0dQuqaL7uRwRLm?=
 =?us-ascii?Q?HiEkF1plZaQFbAMmr6hflqpUVzHfxTKMfpp4WpqwD/xRPY63Iggz35uL3uVz?=
 =?us-ascii?Q?c5mCq1b1f0F4vJVZIL8zW6uDEci/zly8sYS8D2471ETQwKqhfg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NrvUWJKEgUKS+1jnnjYVmdpW84StQNEsjgGJ2UdVwvq6RMuPyNXHoCzLTF8N?=
 =?us-ascii?Q?0n8DcN/3fOvWpLA4RkLQBA8JvMwhdKHMQH5c7zo/WOeK0y36u+4iv3jZwUZz?=
 =?us-ascii?Q?jRGrsWA8gK2ylYiYA7csSwSjah/ytWTwLJ3HRMlzsIzgf2N4CnkrsWe/ytfO?=
 =?us-ascii?Q?3GMeUrziclbWatMjYLlZFXhbEfHvTKDWXO4a2JPNOvKJJa9Myo/wbtmZAskL?=
 =?us-ascii?Q?5t18UJnnMCGdvZYUrTBUerfYaIbCuorpytWnigaRwHc59RLd2znvWFdVxZAM?=
 =?us-ascii?Q?oVyXJWJSKHtN2mu8dlZahRGVa4ltyh3mFavXmHOVfsje2JVFj7LxmMCFVJxU?=
 =?us-ascii?Q?rg5YK6oLMJUzUHTnghuK+yOxbWMBdtvroL3BLCyHBRWyh0SUWY+QGr765raS?=
 =?us-ascii?Q?8L6tALraaQ8GQ0/eHEdPNP0T9Ja7D0j/Ytg+rm1TJlmjwZePaSXdY/wT5cpn?=
 =?us-ascii?Q?dyHhQRT8viIZPBRJlqsaTQ5QeF6KNw4tJrbhWRxedR84tbjA9qrzwVTdRoRe?=
 =?us-ascii?Q?dDt8bS15wOMuHsNbdl/8nB4bGBmFapJ2BP6X8q6P7T6f1cAySjiG0kNltmVW?=
 =?us-ascii?Q?Rl3V9ncNrObt94V6ddLd3+u3q/YdDw4uj/TJuQPiyoaQPBzIMb0ITvgDhon6?=
 =?us-ascii?Q?NkSqY4cSwNYLGkJ3FncAaVJt+SshFp0TYXYxCCf1Tt419EJzn0dniKSRsmgX?=
 =?us-ascii?Q?tekExDX6RZKQgcTPcJSztFlZ+FJFWXdiOMePmhNHwBHwxIvXqpRLTqEnXxAW?=
 =?us-ascii?Q?PrK30DSKwV0iwhjPF2Di1LSzIKMi5hhZ6yfZehp9TkpiJk2UuuduOvH/bCUq?=
 =?us-ascii?Q?Gnz5aVhnCztFOxgMRk04gwgHBJ70aggEG4+DUQ+THoOx0U+EpmzYWb5MgBEV?=
 =?us-ascii?Q?rc2fKIdPy7h1YqvthfA2P2y3gmZKWm8kGSdkromCRXCaGLB895RlJS+CYwdM?=
 =?us-ascii?Q?4dujm/qh9loeDVA1LbefNfsB87ei9ErgzUVGus8j6e2RGzU8OBkH6Rv+svnv?=
 =?us-ascii?Q?6aPWL7aT+7mVaZPIA+3+xnHTHj1phXaRFmUVKXTIz72oUJEI6293Tt0P7AIK?=
 =?us-ascii?Q?QezLk5ijt2LHtK/lzp1EmyOJ9weuFIuJjfXQAAl0yXLaLC+SBR02IxWuGb0Z?=
 =?us-ascii?Q?DkXb2CBwkOWcTT+jdrO9fRO8rHpj8VYUzZJ6qVyq9Zj5ArQiaXwn6ZrwPQ+p?=
 =?us-ascii?Q?pUqt7YVj6Dpm6NSN+RDcpvFIEpkYytMQscyzpjyliMrymD/NO/ApkXSJqFqg?=
 =?us-ascii?Q?k8xOZAFbbvXy0CZ4oyyT/zBFUuiKFqaaPfO2AGXQbDw6rh5jB2jYobudMRgL?=
 =?us-ascii?Q?Ft4iOAbMEjJ3gcKbYsfWHVdlfmbbH9YlxnirIYbmAftJr7DPLxs2bCWK5bMU?=
 =?us-ascii?Q?Cdv9oxVIkErQV1Ee9NbsHw7GryWp7FaklccM6bhIKCzgkRTDi9X4EbANEDAy?=
 =?us-ascii?Q?d+gilnPCOJ1hxxiGoslhmkveJMn54Dc6u8hkv3a+y9/YrS0aHTNVoNPsiz5c?=
 =?us-ascii?Q?2Da9aY4y6A8GBLwY5p2/muXv/LDm5ABHkyc8enFG6ypTpg4unJhjgLcuvsRW?=
 =?us-ascii?Q?3dFxQhMWK5D/xH93gZHJZVmRwTeDAgcAjzRqoyio?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b869a57-03b0-458d-24e9-08dd13567973
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 04:53:48.1842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HCnNARwaiJ7D9Tvqb4SD8f7u+yTA4f8eQgApJ06fKfbcrzqyuMIo6NUAI/lCHhZWgL6zwIVfjoZlff6JxmxXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4783
X-Proofpoint-GUID: nv8EacTiKMGAhbCQGfgR9Q22TiG9DyZY
X-Authority-Analysis: v=2.4 cv=EuYorTcA c=1 sm=1 tr=0 ts=674e8ee0 cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=UXqmzmZr725mQlld4dAA:9 a=MBHTkq5ozfd5zzl9:21 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nv8EacTiKMGAhbCQGfgR9Q22TiG9DyZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412030039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 04:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208179

Sorry, the commit message has typos.
I've sent out V2.

Regards,
Qi

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Chen Qi via lists.openembedded.org
Sent: Tuesday, December 3, 2024 12:51 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] meta/lib: move buildstats.py and rootfspostcomman=
ds.py into oe

From: Chen Qi <Qi.Chen@windriver.com>

These two files are the only ones that are not in left in meta/lib.
They logically belong to meta/lie/oe, so move them there.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-global/buildstats.bbclass          | 4 ++--
 meta/classes-recipe/rootfs-postcommands.bbclass | 8 ++++----
 meta/lib/{ =3D> oe}/buildstats.py                 | 0
 meta/lib/{ =3D> oe}/rootfspostcommands.py         | 0
 4 files changed, 6 insertions(+), 6 deletions(-)  rename meta/lib/{ =3D> o=
e}/buildstats.py (100%)  rename meta/lib/{ =3D> oe}/rootfspostcommands.py (=
100%)

diff --git a/meta/classes-global/buildstats.bbclass b/meta/classes-global/b=
uildstats.bbclass
index f49a67aa4f..8a50bede5f 100644
--- a/meta/classes-global/buildstats.bbclass
+++ b/meta/classes-global/buildstats.bbclass
@@ -276,7 +276,7 @@ addhandler run_buildstats  run_buildstats[eventmask] =
=3D "bb.event.BuildStarted bb.event.BuildCompleted bb.event.HeartbeatEvent =
bb.build.TaskStarted bb.build.TaskSucceeded bb.build.TaskFailed"
=20
 python runqueue_stats () {
-    import buildstats
+    import oe.buildstats
     from bb import event, runqueue
     # We should not record any samples before the first task has started,
     # because that's the first activity shown in the process chart.
@@ -286,7 +286,7 @@ python runqueue_stats () {
     # closed when the build is done.
     system_stats =3D d.getVar('_buildstats_system_stats', False)
     if not system_stats and isinstance(e, (bb.runqueue.sceneQueueTaskStart=
ed, bb.runqueue.runQueueTaskStarted)):
-        system_stats =3D buildstats.SystemStats(d)
+        system_stats =3D oe.buildstats.SystemStats(d)
         d.setVar('_buildstats_system_stats', system_stats)
     if system_stats:
         # Ensure that we sample at important events.
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes=
-recipe/rootfs-postcommands.bbclass
index 50e77dca76..70ad3670d7 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -308,19 +308,19 @@ serial_autologin_root () {  }
=20
 python tidy_shadowutils_files () {
-    import rootfspostcommands
-    rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${s=
ysconfdir}'))
+    import oe.rootfspostcommands
+   =20
+ oe.rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}
+ ${sysconfdir}'))
 }
=20
 python sort_passwd () {
     """
     Deprecated in the favour of tidy_shadowutils_files.
     """
-    import rootfspostcommands
+    import oe.rootfspostcommands
     bb.warn('[sort_passwd] You are using a deprecated function for '
         'SORT_PASSWD_POSTPROCESS_COMMAND. The default one is now called '
         '"tidy_shadowutils_files".')
-    rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${s=
ysconfdir}'))
+   =20
+ oe.rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}
+ ${sysconfdir}'))
 }
=20
 #
diff --git a/meta/lib/buildstats.py b/meta/lib/oe/buildstats.py similarity =
index 100% rename from meta/lib/buildstats.py rename to meta/lib/oe/buildst=
ats.py diff --git a/meta/lib/rootfspostcommands.py b/meta/lib/oe/rootfspost=
commands.py
similarity index 100%
rename from meta/lib/rootfspostcommands.py rename to meta/lib/oe/rootfspost=
commands.py
--
2.34.1


