Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEADC71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 09:08:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8322.1749719318998534626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 02:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8258e96b79=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C2v2fb026989
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:08:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2ncte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:08:37 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55C98bAd027725;
	Thu, 12 Jun 2025 09:08:37 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2nctb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:08:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/JQHPwLfsDgiwtdcAwG0CnlOFzydYnKQJNxigfxNFewUS0R5l93ZsaFK8aEeHfXfBtil4XSRQHCT9wA5XxK5LSwYOESgVE8YhTdt8SaIqzH0yaxanEMPsrLnWILPA2q9SkmXjvfytMnlxeG2DFs5nBrQrDneUpxgemWNcRUPAxDwAeyCVPKEasCHkOgd4z6rqnue37cWMf75uSu8MUMC6lWHG09IdrNgbCQHYHmOeADmxnRLegOa6az1IIRyOtVzXeyen5A0sO1ZopcLD5/UuXUeLWFI4CPQoRsCp7SZ2MLol9ibjXNqz3QtEdO4bFCxTg19B7mTADV7hkk/6c35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIRqcJ+KkknvSoUdVKYvPgwEobrGCX1sOHM/Guz0gW4=;
 b=KfCLN2u/Ao+sLdvTUJC1Rtyg98qbFVxYi9yafZTqjMAzIqSRE/C07QYoTQcIAv6jNOX6tVnN79Kd9ZvZJy8DonzkEBOtPVpomm5EuWL9t1bEd5e25f0AUlFN7ZBMeY2J348qKic0xkg34PIX1Ko40HGXHC2ryQHKpMTbd2QecEgGFS1+EMEbuln7nmT8t1NKZuOycDBybRS49cXz+8Y9iwUIeKu/XfHXwKXbtRqcE+U6OjnJbxMPKXKoVJ7RT2WZaUMFeJLJLUUlXICzwoRbuKiWXVUnAlGa8EmrkukJSYPdL3YgxyfnYOSiF4DCwtNDSxztShZ1VRI+k4CIu2I54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Thu, 12 Jun
 2025 09:08:33 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 09:08:33 +0000
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH v2] Glibc: Fix for CVE-2025-4802
Thread-Topic: [OE-core] [PATCH v2] Glibc: Fix for CVE-2025-4802
Thread-Index: AQHb2sTC2AoypgkOCE6vRQqj1mTKBbP/OrkAgAACfl8=
Date: Thu, 12 Jun 2025 09:08:33 +0000
Message-ID: 
 <DS0PR11MB7901C72C2960A6B3B4C39991E074A@DS0PR11MB7901.namprd11.prod.outlook.com>
References: <20250611113400.2146584-1-sunilkumar.dora@windriver.com>
 <DAKFIFEGGV3U.7U3JRRVUW278@bootlin.com>
In-Reply-To: <DAKFIFEGGV3U.7U3JRRVUW278@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7901:EE_|PH7PR11MB8035:EE_
x-ms-office365-filtering-correlation-id: d043063c-2602-4f06-e4f4-08dda990b4f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?X6ea0Zw6+6dqzCpIqF22vbZaB7+fAMqKU2FO6pRqo0Mpa7cvnWYNnx/n?=
 =?Windows-1252?Q?E1WLo2gTQ1JMRP3oCXRGo2HCIJNteBpsPoufnFANfOZaUlR5IiLAOSMa?=
 =?Windows-1252?Q?PE0zlWUsn7o93C7OA3UBinf6xsdSV/FEfgtQJusW6Tk2dLkV5vb+mz9m?=
 =?Windows-1252?Q?h303Go6aUBoVq7n+xmxhJWm30lZld/OR9kSgChLWR6KZ4m/qyPNnuvE5?=
 =?Windows-1252?Q?tpekRT6cKADiXB+729dMgD9HM+eHQDQc03eKwu5ukRgkUg5jk/gceR/N?=
 =?Windows-1252?Q?8YffZ+1EIRC54CfXjrx6gAJvS+DyZ4mVRNDeNhNKpxp/SY0pp7/g+WaJ?=
 =?Windows-1252?Q?+ZbUvQfCNH1/N0RLZ681qMFs8qhJfG3HY01Y0J8kYkTOilBkxsLvUsPQ?=
 =?Windows-1252?Q?uxNy7d3hznmwruT0DLQwFwqPsRM76uqtWymckaNfV7/Dtjoqwo/3DZGU?=
 =?Windows-1252?Q?lFRZVMqooqWk0Htz4ZG1izVyjNkxGUysk+YLDOKWmiSzHdJHMKczQwif?=
 =?Windows-1252?Q?sdIVxyN6ulzb17ZLKeH0FG0IUTvB/orZIgmJgCO2ts5Ri+XfhaZmQs+x?=
 =?Windows-1252?Q?98c9aOOCdregmpIJ89/TO9fehXWup/qEpZ5gxEDV8EpYeIfFi0Ii7VOY?=
 =?Windows-1252?Q?jWUI3ckPJwd4uQ39+QmoVYPLhecUMMhcGCZcGT7Th/RC+unurWdTe+1H?=
 =?Windows-1252?Q?KwyYKLit2F+nsOKnnokk1aYcl7AFPS9gJ2gaIObI8qiUaSG7ZfEG6msX?=
 =?Windows-1252?Q?hHPqV4SZNNsjnJ0iMWnEPMf3V2p1xMHAVPrQ3PGEH0/xidGW6OOq5YcM?=
 =?Windows-1252?Q?3FkK3OiHXieoWRyh3FBQ0KOUj3E8W8vDwquHV3+o7fsuxo37dS6Z4XvW?=
 =?Windows-1252?Q?qQqSYPCbybn1UxEgXXdsqVF3XfjMlfm25SCMk5347gLZthpvzY9eN3gW?=
 =?Windows-1252?Q?SvdJ8lNVmb6LnM1dhgTTvahtivrD8KkFo0qAVXiw+awEnjbp+U+T6uFf?=
 =?Windows-1252?Q?jgUPQW7A2kY2fyBmV+cXS8o66KaR0tDhfGLKEL9YCFAAttmk5o1ToFB7?=
 =?Windows-1252?Q?1qG9CZ7HjDdk9Vq+VQCr2az8+vz/I2w0IfmCyrIij4CAwovg/CNoPout?=
 =?Windows-1252?Q?7J3oNRNTJGHeinUmY9x1gNVFzvV4nMcGTt4aKZ1stJMG1RhZjcPvRhH7?=
 =?Windows-1252?Q?5s26qJiKWW76gRcsHrNDO9Hqm4g5X0k8BquS4K0j+iGHlUBsQYsim3Fl?=
 =?Windows-1252?Q?qJ+DEs2UVOJsN4eSB4KCqMmc5dfZQ/+tTuiMqclJSoPUuuKe7UWXVU/5?=
 =?Windows-1252?Q?mR7u2of2inbPEWs0tbeC6FMrMOeJi4wg73vre4n3pe/YKPCEAR1mwTaX?=
 =?Windows-1252?Q?j5zmq+JfvoTO6bjqY5vc9XWcnktda54ffcGlOPHD7A6RwhptNVgiQ37B?=
 =?Windows-1252?Q?cn7TyLZPloKIEZ5hJ0/5hTcgj7RETgdMA2trznWppDBBW0SzujchgIcQ?=
 =?Windows-1252?Q?KD/jklp+Hx66AdVECU2GdOHOhFpxk/fgLScnmSqD7xHgQ7r2d48=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?aLNoDmXWKhklrwQZQ+jZjuCKGN83HFWqT0w9HYkt8jNEJi+6H0uM8K8g?=
 =?Windows-1252?Q?mxRHfRYMg+oxsem4yRNT6FMe0hxEWKMBAbGy6k5qtOoH5thRQAwHHbeF?=
 =?Windows-1252?Q?u9mF7J94w+mbdd1573H84zMMIbY727tGmGD59IjzfxgnereTbt3gGkdb?=
 =?Windows-1252?Q?5h4+KamIjU0Ab6g8Pc37g2lfl/jdhaNO3i/gMbPQlnT8XUugezQjvHpg?=
 =?Windows-1252?Q?hMJm/xjjy1LjmW9igo60KS0EFQ+a9LqdY7Pp0lfbTHfbkCRXxqKiC/MJ?=
 =?Windows-1252?Q?aFLfVpqzoiERU7+29H0QWooQmlhJmnBMKE/Vuh4uNkdbtRMvYzogaa3Q?=
 =?Windows-1252?Q?P0UYiQ3wj+cZGSFpNfHYk3g7QfiX5Tj6qwtkgE4KVRBYeIkJ0wp88on2?=
 =?Windows-1252?Q?pOOuAT/Vk87YL4chAGWQ47ITeuHL7z81OB9GF0FsppRmdrxepKjl9Qp3?=
 =?Windows-1252?Q?a9FyKqZgpt0yVXZtrJtKLK2INgCa+v+d8MduqEz/fzzmczVgoQQWpj7X?=
 =?Windows-1252?Q?qmd8OciLguzi2s9e5Xnj5tk98ZFbBuUHojqIhKmK0Yve+wKRhPMvOv70?=
 =?Windows-1252?Q?gzM9Uw0G/CfC/MoW1IEq67Z5qeDlw8NrGkQ9vHO73lYNZoFgSpW+56xB?=
 =?Windows-1252?Q?z65ifjXknaVaalMGCp/upr4HWsMpvVPRzEmtKmAipUrkIVDs6jOUxSB+?=
 =?Windows-1252?Q?kzq6BN0+MWFXEJoU1iLtPQu6+BkznknWzFQLC3t5rvYmg4zsRDrQRNeO?=
 =?Windows-1252?Q?7ctBF8dPzVZ7XU5Toky7/WtSy5A+eeaegWA+OzHqe5d732SnelB7t6RA?=
 =?Windows-1252?Q?J4mEZx7Eee39LKTC4knZMHt07EPmWpamBDLSxCxVRzVRxOKqrk9qc/fR?=
 =?Windows-1252?Q?vzUB98IQ+J2bdifkVRHmCbJ9jtEgKk7AHEg6m/MIli6lliob1cFy725A?=
 =?Windows-1252?Q?qZEQtoJXOWkWDGbOy/5MJqyp+Y24RsMyemDke98YSp3W4fXSeEnyjXSt?=
 =?Windows-1252?Q?Ee5NkP0wURyirNzv54uwtXq6JLUo+/KcivE9w4/+RB0VETQ/I4qUnA3j?=
 =?Windows-1252?Q?Zx6HXH7FQE23NMDNzah7xZtAbdCVIYDUkLF2OPgFGdCWJZUmJu43uxBE?=
 =?Windows-1252?Q?8oi4IgjrodAWk4pSZAi1JHjrncUsMtBS8V5oy9QuZp2FRfgXNwDCsE13?=
 =?Windows-1252?Q?br4aBKvt3KYPPTArQyvjRztu+OeZ0XA72qzdLZYDiAryi+MvkHRi8P2N?=
 =?Windows-1252?Q?1lld57rscxnRQJqjNOivCKJWuHr5fli83+zpWxsmZa5S1sIQSN/Cm5hD?=
 =?Windows-1252?Q?w/IP0FLJO+EVXFWg2kZSq2WAQGu6xGVepY9cVVCb1uxuxUep86iGxh7L?=
 =?Windows-1252?Q?Uck7rqX2lOZ8NVQ4XIKzwf0W3HSI9SFNmBtp0yZoJ/9jsN6ns3IAu4MZ?=
 =?Windows-1252?Q?2v6n6ghrva5AAtDY7jFNRCXpgSv6S1tKGth/DNUfyihiC4kPC1w+1zkj?=
 =?Windows-1252?Q?TszU3xB9w7oQ48tuVgtNXQl0cucNIcUF7xvsnzO566Byw7IaR6iK5B4Z?=
 =?Windows-1252?Q?FFT28o5S15nRjiM0upgqIipeKKxvjWQEdLstHwi+cXSB7XPCX7+wyYGk?=
 =?Windows-1252?Q?hBZNonM2+34+OjXzXt79IjHtMwjS8rtYAWrbOxuAPppAUAwijou9QjIp?=
 =?Windows-1252?Q?4NBCDRLIN9tX/su/ThuPLDuUU+GPoymo3OUSfDLTbhx41uHC2WxOhQ?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB7901C72C2960A6B3B4C39991E074ADS0PR11MB7901namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d043063c-2602-4f06-e4f4-08dda990b4f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 09:08:33.2346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KCAKCItpSdwehzosZMgKO8FGuPOQsYNQCfs87QWfZRYdEwZ1cCxiJ1wDPkc4RQF7erydKPa0TPq9EZ2JWpM3fF2MXUGptKOp7AA5+pWiPzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3MCBTYWx0ZWRfX+G4m1AY2W0qW 8hBLQ2P+dL5ZMlXSLYjqM0C3t+iWgFX/A+ivPfOjnB/ETht7rtqrMIz8AKWpkDIwdG1yY82CXVP q/Ae0VAt/VmEF1aym8cavoazB060rApXbcWUT3FViPN1Tw69grjLhj3mwwbg6SiBPEtgyqENm0S
 eW6SXyHpQLxGwrCZE376W5dqeuUmLnOgxUZiBS/sikYFPz+79RUoPFjd91u33ag7+rIykBQ0S67 BnqnBQ1TBciyAC4P4drpLjsG8v77Epzg7r+8c6T4hXwJ3rW1l43+lmbk/OjWM7oEsCGe0/yn+48 4JJC5TW+wNZp1rsaIVFiKsbAJIwsogWXFO5h0eOym7cpriK+dB5kRXWXLLdFNekypNJkp+n0Tpo
 h/y27Fe4xlqzZ7E23FDZYQwobztTIQxF44jxDe6krbttDsGkUEVywlrfLory6xAsLUeDQh7l
X-Proofpoint-GUID: xhldDn-IXMaOxDx56_UfObz9plxSUeco
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=684a9915 cx=c_pps a=v3uwRdJz/LzFJJSJ0Q8Vdg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=Q4-j1AaZAAAA:8 a=CCpqsmhAAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=pILNOxqGKmIA:10 a=LgrIdtUC331MG9ce:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: qazagMTNYHQypbSMk8yO2KII3Wt5S6vD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_06,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506120070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218490

--_000_DS0PR11MB7901C72C2960A6B3B4C39991E074ADS0PR11MB7901namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,
Please ignore this patch =97 it was intended for the kirkstone branch, not =
master. I have corrected the subject prefix accordingly and submitted the u=
pdated version as [PATCH V2] here:

https://lists.openembedded.org/g/openembedded-core/message/218450

Apologies for the confusion =97 I had also attempted to delete the earlier =
patch from the mailing list, unaware that such deletions are not fully effe=
ctive.
Thanks again for your understanding.

Best regards,
Sunil Dora
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Thursday, June 12, 2025 2:28 PM
To: Dora, Sunil Kumar <SunilKumar.Dora@windriver.com>; openembedded-core@li=
sts.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Dora, Sunil Kumar <SunilKumar.Dora@windriver.com>; Kokkonda, Sundeep <S=
undeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH v2] Glibc: Fix for CVE-2025-4802

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed Jun 11, 2025 at 1:34 PM CEST, Sunil Kumar via lists.openembedded.org=
 Dora wrote:
> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static
> [https://sourceware.org/bugzilla/show_bug.cgi?id=3D32976]
>
> Upstream-Status: Backport [ https://sourceware.org/cgit/glibc/commit/?id=
=3D5451fa962cd0a90a0e2ec1d8910a559ace02bba0 &&
>                             https://sourceware.org/cgit/glibc/commit/?id=
=3Dd8f7a79335b0d861c12c42aec94c04cd5bb181e2 ]
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---

Hi,

Thanks for your patch!

It looks like this does not apply cleanly on master. I do have conflicts
when applying you patch (which I tried to fix on my branch), but it
looks like we also have conflicts when the glibc patch is applied during
the build.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/1802

Would you mind rebasing on master and resubmit?

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_DS0PR11MB7901C72C2960A6B3B4C39991E074ADS0PR11MB7901namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);">
Hi Mathieu,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Please ignore this patch =97 it was intended for the <b>kirkstone </b>branc=
h, <b>not master</b>. I have corrected the subject prefix accordingly and s=
ubmitted the updated version as [<b>PATCH V2</b>] here:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
https://lists.openembedded.org/g/openembedded-core/message/218450</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Apologies for the confusion =97 I had also attempted to delete the earlier =
patch from the mailing list, unaware that such deletions are not fully effe=
ctive.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks again for your understanding.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Best regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sunil Dora</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Thursday, June 12, 2025 2:28 PM<br>
<b>To:</b> Dora, Sunil Kumar &lt;SunilKumar.Dora@windriver.com&gt;; openemb=
edded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.=
org&gt;<br>
<b>Cc:</b> Dora, Sunil Kumar &lt;SunilKumar.Dora@windriver.com&gt;; Kokkond=
a, Sundeep &lt;Sundeep.Kokkonda@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2] Glibc: Fix for CVE-2025-4802</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Wed Jun 11, 2025 at 1:34 PM CEST, Sunil Kumar via lists.openembedded.org=
 Dora wrote:<br>
&gt; From: Sunil Dora &lt;sunilkumar.dora@windriver.com&gt;<br>
&gt;<br>
&gt; elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static<br=
>
&gt; [<a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D32976">h=
ttps://sourceware.org/bugzilla/show_bug.cgi?id=3D32976</a>]<br>
&gt;<br>
&gt; Upstream-Status: Backport [ <a href=3D"https://sourceware.org/cgit/gli=
bc/commit/?id=3D5451fa962cd0a90a0e2ec1d8910a559ace02bba0">
https://sourceware.org/cgit/glibc/commit/?id=3D5451fa962cd0a90a0e2ec1d8910a=
559ace02bba0</a> &amp;&amp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://sourceware.org/cgit/glibc/commit/=
?id=3Dd8f7a79335b0d861c12c42aec94c04cd5bb181e2">
https://sourceware.org/cgit/glibc/commit/?id=3Dd8f7a79335b0d861c12c42aec94c=
04cd5bb181e2</a> ]<br>
&gt;<br>
&gt; Signed-off-by: Sunil Dora &lt;sunilkumar.dora@windriver.com&gt;<br>
&gt; ---<br>
<br>
Hi,<br>
<br>
Thanks for your patch!<br>
<br>
It looks like this does not apply cleanly on master. I do have conflicts<br=
>
when applying you patch (which I tried to fix on my branch), but it<br>
looks like we also have conflicts when the glibc patch is applied during<br=
>
the build.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/buil=
ds/1802">https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds=
/1802</a><br>
<br>
Would you mind rebasing on master and resubmit?<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR11MB7901C72C2960A6B3B4C39991E074ADS0PR11MB7901namp_--

