Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A03C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 21:17:16 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web10.4116.1706908627511896439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 13:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=SbxTKLju;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=GkaaBrNk;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: colin.mcallister@garmin.com)
Received: from pps.filterd (m0220296.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 412JoXn1011456
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 15:17:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=
	from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=pps1; bh=TEXMA2xMK+x21u/kUjAEFeA7v
	yo9J/hXnaUXq2Q1ocY=; b=SbxTKLjuC2WgxhBMLw59SFaSdh7p+l8B6UJB7GEpd
	WJjgzA2WDg+bv3ywcNYyhkkaduQG+7Z7wWaIgELKOD2HcTEnO81mr5395Ep/OV8t
	qOxc0j2XomfPnE9JizEgxLR7nTyomQUhki0gQPEjDKQbcwHgfnLUFoeiwViXtjdA
	B6rTkwL1GFVAz/F6Wv7mYGSPvRhGwoSAUPwjt4mo2y7l3etJDD1IjqJPue/j2ED1
	lphLxvbmlGIHdCG+9+Yxwb+VGuZjsEZyrgxVBjRhd329jSvI0EmvXdfWWtV8oYxq
	qOrV9qx/IwXfJ1PvJUii5to4t7RaDw9ALMsM8aDzwD/fA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3w16rw040s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 15:17:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2rKDcHU2jddj+SnwIqpPguK5nPadjVbq3uOd6bLGam+xwt57C3rj6b+uIGNrYUqQzpzk84On4M7JEtmpTPsIPbDCqCwzqqyYOYyOGSl5Y+kb01BXeIhcM789Mu6TJxF/lDCgvg2yae3xMaHcs47vIeVdXez3zXIehqpoINjqcE6lg+evfq4d1YtNfs3p0f5Ms8WjTRL4+lWYjU6qfh46LO3NvjYwCk6u5RWvnOAzMHkGXn02MXCvBMegd4B2ohZoc4aVtjODE1lx/jIdYagN71t7N4/eaIKg9LGFa6CF0tB4ekvtxU7lKoJQTO40xXgCvdIUIAop3RrpZCXXROPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEXMA2xMK+x21u/kUjAEFeA7vyo9J/hXnaUXq2Q1ocY=;
 b=b4NTaaPBzsuzykVEnJezV3LNlhnJJcNQGZonlqn7yqntwtxm/26nuoBKyfhkLZTJOt8ul6erFELYZjTL11fOVDsav6sIH4CLUoJs62m33tiw6EeWhecUCGgKBXsdwKR7FImrH6u8/eGUtVh8yc3sEu3l1sIJtzFnBm9zfuypJC0UYFJHV/0sqxAmfpAJY8TTitW1JCQWa1RTTnu1aWMaztd1RSgwkXm//qIpFhFRww2RiPLHI7uD7U+xQSZ8G4kKzkocu55ErjbEbiNW+YT1QhqHMzBZYqR7B/kgDq16akxL2qYjfXOblZ13jGdw6dnIq+4YfoRHuYkVj3fybIoA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garmin.com; dmarc=pass action=none header.from=garmin.com;
 dkim=pass header.d=garmin.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEXMA2xMK+x21u/kUjAEFeA7vyo9J/hXnaUXq2Q1ocY=;
 b=GkaaBrNkUawiFge9M2AtTkUOMwyPvZKBc2joBO4AaWpOxkEi2n5XtMy9QJNcxheh4AQhaiSPArQjO/x+lEKoF76nN1gmrpgQ6eJZFNDNQEvURJTE8veGDfIxnjLGlQXNdjd1ABq20A7nmAhNCEbadPbcD+Z7Q8f1IqZjJILR/vCpz+YQYxLIUwYDU+58VO+Q4LXwJhIiPTflFvE8wIvg0snLZ9RIuNvBQ1SwTkf/CeLQFVbaLn3Rqs0l7qOokY+NVTA7tK4RC12zcu2tIoQy1L3rmyVs9YeUpi2VqSf+UgDcl94ZutM4qbDzF8TcXv2qPBkCarMEF8LPLzBPaTcw9w==
Received: from SA2PR04MB7723.namprd04.prod.outlook.com (2603:10b6:806:137::18)
 by SJ0PR04MB7471.namprd04.prod.outlook.com (2603:10b6:a03:293::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.37; Fri, 2 Feb
 2024 21:17:04 +0000
Received: from SA2PR04MB7723.namprd04.prod.outlook.com
 ([fe80::8dbb:94bc:44c3:c5e5]) by SA2PR04MB7723.namprd04.prod.outlook.com
 ([fe80::8dbb:94bc:44c3:c5e5%6]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 21:17:04 +0000
From: "McAllister, Colin" <Colin.McAllister@garmin.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: Add custom mount args for /var/lib
Thread-Topic: [PATCH] initscripts: Add custom mount args for /var/lib
Thread-Index: AQHaUJInzNqjRG1lAkeE/gZQaQWOLbD3mOue
Date: Fri, 2 Feb 2024 21:17:04 +0000
Message-ID: 
 <SA2PR04MB7723F76A768DEB327E939D7EF4422@SA2PR04MB7723.namprd04.prod.outlook.com>
References: <20240126195900.2199003-1-colin.mcallister@garmin.com>
In-Reply-To: <20240126195900.2199003-1-colin.mcallister@garmin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=True;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SiteId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SetDate=2024-02-02T21:17:04.149Z;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Name=Confidential;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ContentBits=0;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR04MB7723:EE_|SJ0PR04MB7471:EE_
x-ms-office365-filtering-correlation-id: f90c90b9-f6da-4748-71aa-08dc24344dee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KMmkVQPoPaSRVbJEybJtv01ZN9+jVWWqERBl0F2CUXFtpjSoIH+0SWQWWJvZuSRAOH5zMmcPIwrciKxVVtmW5H0iAduG1ycfTj+2n2W5l0Hbrd1Rx3ZsqW6ZUJCuRHRoEES91MwyS90W8KMdoa5qrI1/9F2+cgHX6RzQDcLBwI1lIrEdML+x2h/stuyFpJyi3sbsB4uIOvJ3vrotHr9ODkr03QqKa6xaARWngTxMeHnQauQOzwY39Qj2eKPDRGk0+TNr714FIcQHL6uJjERPQ3BEaIR/qLLC2pJmhLkt6qcRCQjBAkIWJ5T9oPkDLrgYbx1Yw/LX4NclvWLCt6Mg7jzHhTYqsVhoGjagaFdWtl2Tz8oWOxi/0+lXcT0GSm/BnHyA8FRvPDh2QW66D2V4s+1I+fg+qzFEsjsl4E481imLgx520EFPdmL9mMtiPR9DGPZYk0BTdysUEbmVt3Gk7vD80yTH9npFECuKBhnsl0G4PyJzQxJ4XN42W93jaMpaxqQ1s374Cku1VnX16JnwpnSge9o+ArACoxlRWocHVxkm5ZPXg/newX3tmFPm4FpjXEnX3BPKcuxZa+Jjs2/C3fWJkuxetDGyXgICTWbabREaeV8s3DyvQRGQPnzpe2Ua
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR04MB7723.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(55016003)(19627405001)(83380400001)(41300700001)(38070700009)(33656002)(86362001)(52536014)(122000001)(66476007)(64756008)(6916009)(26005)(38100700002)(9686003)(76116006)(8676002)(316002)(7696005)(53546011)(71200400001)(66946007)(478600001)(2906002)(8936002)(5660300002)(66446008)(66556008)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?JCHZ3aUz+vZAnYAZrZ8P3yQDrDPgH2eUp7ESNbiu5o5XfT/abDd+nvvJWlNP?=
 =?us-ascii?Q?2egyelgDxlWqayBVc74e82lVmCKjh4pIz/LerB0mji4/5FEiKYpeTGlDfFYJ?=
 =?us-ascii?Q?oWhG1VxKoWTAPh3ShFucAf6Kq2NZBzD3KQZtZ8eaeroHrmvk8goVR0EInJiR?=
 =?us-ascii?Q?dO/oYJS8KsY7iGkdL2MVKoW4mE8foHfXhsLU4ftKvak+QxG96ZyxWarb6lZj?=
 =?us-ascii?Q?W+nSqiM/bosIk9ov30aFP1OaYNbmTRea8LFpCyDnGNyjfSpU40fn2XkvvyD9?=
 =?us-ascii?Q?UXwkSfLUHZcxuDImwUDpPR+zt58DSGGDrOSE/GxsLWsbwDoC4tHoCnz8gfHE?=
 =?us-ascii?Q?NUIIlBzkddInbyIXFz67qvLsnlFFnl3Dx8BmqxoNbYFoda1r0gl3kmeu4Zry?=
 =?us-ascii?Q?HyBwVWHTCJAC7FBLw4c0CoMMjgUcCFVS2TGJagygbjFZEScPM8yCXaO8klc3?=
 =?us-ascii?Q?4sU7PlJpnedLpGUAMZJovhx//597LBak9KEee/pk4ycTJFi3IgUDuQlzuFwV?=
 =?us-ascii?Q?F0Jp6Izxe8SK7ZvN2Fawtyiqvq7ej1vcUo1dJ5OB6e/VXPszPhOLov/9K4ph?=
 =?us-ascii?Q?SnjYLZOB4nu50Bqm48bb9JMZlMD5EvfmSbDLSKlkAby4l2opajc7+WzMCx5M?=
 =?us-ascii?Q?FydUIcGqjMYy+YmRZbBYSgD69WQYbS8ZRKDd/k3qOITwr0Cvzca4lFL1om5Q?=
 =?us-ascii?Q?qKXk/KDYmNkILjeyprJ39jmQOZpFmfdv9e/H+VVTRSqh7CV7qEvaNJqFSI7g?=
 =?us-ascii?Q?8HjpCPyYtjq+qxAk3SaZBYZ9BfZHL2KXNs+mSvwWgdS1gMrsppuKGxzHOFeH?=
 =?us-ascii?Q?cJa7kEHcGr/qOOFgoYFBqpFQ39yZlcX1JrYeLKjxFnBSZ6ZZNcT0AY4yLvWD?=
 =?us-ascii?Q?Cs+ZB7MPtUJfW48MQeJWdAI4ZMVjkF/r/tY8mFqEYycWlOvAtlPIz4k3yxje?=
 =?us-ascii?Q?bc2rZUpSU2SLIKM34P8iIfph+c8hgSWO6EAJs2BA8Bla2c28T44yMZLgxJq5?=
 =?us-ascii?Q?BoDrkDcMK3Bu3g/w2ljbim3YFq5GdqqEzlPsggBI6JpTXu4R1Z/ILD48Ddo2?=
 =?us-ascii?Q?a7Ty9UK7mkLF7QL7tGA2+0aTmC9En0MeEIqQYNQIw2VkqShi7BaCI8fC1BtI?=
 =?us-ascii?Q?3+R6Gm0d7btXWnc1l0C2DsO8kAdPRBg3UULF6mQJ0s48dMD9utRVBLquBaTI?=
 =?us-ascii?Q?3lanPkw9+ZIANGQ25T+yuwnn0q+NjJK09QaZTh428Y0MbzmPjqA4/Y42QWH9?=
 =?us-ascii?Q?SlLYCi1qnOmIp7tjvZ2QOe1pH4NbJS8ie7uqak60hXbtepBMBOjZXC150Ivn?=
 =?us-ascii?Q?JqirwhKBBNH1J+uHLyhVDq5Yz7id8lGbZJ5bt8yEqjKXhvAojmRyS6+mWR/W?=
 =?us-ascii?Q?qLy91dwMhTlZIMJPcUmlh6wGhbDjKZmSD1uuaPsh5LmOhpzjL+z9vUVOzxG6?=
 =?us-ascii?Q?ecLwL7e7sknTxtpmAUcM7JRrasXfKDJTi0FsFtf0cSfjmCrvEkOKKM0Hlolw?=
 =?us-ascii?Q?Zxty+CxQI6RFuHs2DN64kivly8Mw7DB47oR7UAwo2XYvWEDOO0I9RnQZ1MHB?=
 =?us-ascii?Q?t/NQuykP0hoiVtA6vG3R76p1ctFH4eDDcdudiowS?=
Content-Type: multipart/alternative;
	boundary="_000_SA2PR04MB7723F76A768DEB327E939D7EF4422SA2PR04MB7723namp_"
MIME-Version: 1.0
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR04MB7723.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90c90b9-f6da-4748-71aa-08dc24344dee
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 21:17:04.4103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yAOCUKRKIJfJMbfiGSmT2j8zZn5lB3oidhrSHz1q8wXPvDEnhd11wMVn+s4zccdHVgaXGGw9GSz/hR7oOyGA/xNR5Xej4lu03rQwWL3Sjv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7471
X-Proofpoint-ORIG-GUID: jLGA7Z9UfSbYq_WNo--sYybO29WX4T-T
X-Proofpoint-GUID: jLGA7Z9UfSbYq_WNo--sYybO29WX4T-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_14,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402020157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 21:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194817

--_000_SA2PR04MB7723F76A768DEB327E939D7EF4422SA2PR04MB7723namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is this patch an acceptable solution to add mount options for the /var/lib/=
 overlay?

Colin
________________________________
From: Colin McAllister <colin.mcallister@garmin.com>
Sent: Friday, January 26, 2024 13:57
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: McAllister, Colin <Colin.McAllister@garmin.com>
Subject: [PATCH] initscripts: Add custom mount args for /var/lib

Adds bitbake variable to set additional mount flags for the /var/lib
overlayfs or bind mount when using a read-only root filesystem. This
can be used to set additional options like "-o nodev".

Signed-off-by: Colin McAllister <colin.mcallister@garmin.com>
---
 .../initscripts/initscripts-1.0/read-only-rootfs-hook.sh      | 4 ++--
 meta/recipes-core/initscripts/initscripts_1.0.bb              | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs=
-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-h=
ook.sh
index 6706a117f7..a29773647f 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.s=
h
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.s=
h
@@ -37,9 +37,9 @@ if [ "$1" =3D "start" ] ; then
                 mkdir -p /var/volatile/.lib-work
                 # Try to mount using overlay, which is much faster than co=
pying
                 # files. If that fails, fallback to the slower copy
-               if ! mount -t overlay overlay -olowerdir=3D/var/lib,upperdi=
r=3D/var/volatile/lib,workdir=3D/var/volatile/.lib-work /var/lib > /dev/nul=
l 2>&1; then
+               if ! mount -t overlay overlay SED_VARLIBMOUNTARGS -olowerdi=
r=3D/var/lib,upperdir=3D/var/volatile/lib,workdir=3D/var/volatile/.lib-work=
 /var/lib > /dev/null 2>&1; then
                         cp -a /var/lib/* /var/volatile/lib
-                       mount --bind /var/volatile/lib /var/lib
+                       mount SED_VARLIBMOUNTARGS --bind /var/volatile/lib =
/var/lib
                 fi
         fi
 fi
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipe=
s-core/initscripts/initscripts_1.0.bb
index 4b34c6a67f..e61ac554f3 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -58,10 +58,12 @@ FILES:${PN}-functions =3D "${sysconfdir}/init.d/functio=
ns*"
 FILES:${PN}-sushell =3D "${base_sbindir}/sushell"

 HALTARGS ?=3D "-d -f"
+VARLIBMOUNTARGS ?=3D ""

 do_configure() {
         sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/halt
         sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/reboot
+       sed -i -e "s:SED_VARLIBMOUNTARGS:${VARLIBMOUNTARGS}:g" ${WORKDIR}/r=
ead-only-rootfs-hook.sh
 }

 do_install () {
--
2.43.0


--_000_SA2PR04MB7723F76A768DEB327E939D7EF4422SA2PR04MB7723namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Is this patch an acceptable solution to add mount options for the /var/lib/=
 overlay?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Colin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Colin McAllister &lt;=
colin.mcallister@garmin.com&gt;<br>
<b>Sent:</b> Friday, January 26, 2024 13:57<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> McAllister, Colin &lt;Colin.McAllister@garmin.com&gt;<br>
<b>Subject:</b> [PATCH] initscripts: Add custom mount args for /var/lib</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Adds bitbake variable to set additional mount flag=
s for the /var/lib<br>
overlayfs or bind mount when using a read-only root filesystem. This<br>
can be used to set additional options like &quot;-o nodev&quot;.<br>
<br>
Signed-off-by: Colin McAllister &lt;colin.mcallister@garmin.com&gt;<br>
---<br>
&nbsp;.../initscripts/initscripts-1.0/read-only-rootfs-hook.sh&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | 4 ++--<br>
&nbsp;meta/recipes-core/initscripts/initscripts_1.0.bb&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 ++<br>
&nbsp;2 files changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs=
-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-h=
ook.sh<br>
index 6706a117f7..a29773647f 100644<br>
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.s=
h<br>
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.s=
h<br>
@@ -37,9 +37,9 @@ if [ &quot;$1&quot; =3D &quot;start&quot; ] ; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mkdir -p /var/volatile/.lib-work<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; # Try to mount using overlay, which is much faster th=
an copying<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; # files. If that fails, fallback to the slower copy<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ! mount -t overlay overlay -olowerdir=3D/var/lib,upperdir=3D/=
var/volatile/lib,workdir=3D/var/volatile/.lib-work /var/lib &gt; /dev/null =
2&gt;&amp;1; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ! mount -t overlay overlay SED_VARLIBMOUNTARGS -olowerdir=3D/=
var/lib,upperdir=3D/var/volatile/lib,workdir=3D/var/volatile/.lib-work /var=
/lib &gt; /dev/null 2&gt;&amp;1; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -a=
 /var/lib/* /var/volatile/lib<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mount --bind /va=
r/volatile/lib /var/lib<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mount SED_VARLIB=
MOUNTARGS --bind /var/volatile/lib /var/lib<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;fi<br>
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipe=
s-core/initscripts/initscripts_1.0.bb<br>
index 4b34c6a67f..e61ac554f3 100644<br>
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb<br>
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb<br>
@@ -58,10 +58,12 @@ FILES:${PN}-functions =3D &quot;${sysconfdir}/init.d/fu=
nctions*&quot;<br>
&nbsp;FILES:${PN}-sushell =3D &quot;${base_sbindir}/sushell&quot;<br>
&nbsp;<br>
&nbsp;HALTARGS ?=3D &quot;-d -f&quot;<br>
+VARLIBMOUNTARGS ?=3D &quot;&quot;<br>
&nbsp;<br>
&nbsp;do_configure() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e &quot;s:SED_HALT=
ARGS:${HALTARGS}:g&quot; ${WORKDIR}/halt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e &quot;s:SED_HALT=
ARGS:${HALTARGS}:g&quot; ${WORKDIR}/reboot<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e &quot;s:SED_VARLIBMOUNTARGS=
:${VARLIBMOUNTARGS}:g&quot; ${WORKDIR}/read-only-rootfs-hook.sh<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;do_install () {<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SA2PR04MB7723F76A768DEB327E939D7EF4422SA2PR04MB7723namp_--

