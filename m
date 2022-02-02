Return-Path: <muellerd@fb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD43C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 17:18:11 +0000 (UTC)
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by mx.groups.io with SMTP id smtpd.web08.1188.1643822290116537132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 09:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fb.com header.s=facebook header.b=lydX4WH8;
 spf=pass (domain: fb.com, ip: 67.231.153.30,
 mailfrom: prvs=3032dca74f=muellerd@fb.com)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 212AXpSQ028167
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 09:18:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=OAzurciIoFchez6XAqJUeN0iP63M94lM+1a/QTbmyLo=;
 b=lydX4WH8ktZQys/6lvB3Q6qV29lfDi8vs9X0dj8fRHgmyvFbA6x+IB8YUF5bFuT20zeK
 ZxGLzDEvHH6FPI8iQexkhupx0yppwsrTYmTlw1ck4ez80oLn2OtQR90Pc2ELkKuYUpo+
 t9pFIJQYddqicQc5m9sIuNqiGRvQrk7RTBA=
Received: from mail.thefacebook.com ([163.114.132.120])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3dyrahtb65-13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 09:18:08 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Feb 2022 09:18:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2F68u6nDwgvm39FZzKKjBPxfwUL5e9StTvDKoDa1foRdcJNDHCmhT0USj8H05j+krzax4v6YDs9QMvuP26j1wXjGOhI8R3w0CGRELKeRpXWJQmw/nLVcJMe4KToe04cBiPxN9/FB3b6q41gS6aG0T8bklfcpQaqMhJyqdUnJZF4bkZeHhR/NLcrd9fCCzMjWWcuQ5kaHatFTx83gNdimoe8CCox1hs0kYynwWLZhKQ1K/LtZ2L2YIMZhuBWcOcfpeKoYinBrW7f3wgNQoK6tZMXoZewGnWMC6COjzIqCYnrPid4tyXdSDLayX18D0gqlVlk/wN12WB99bc9S3SbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAzurciIoFchez6XAqJUeN0iP63M94lM+1a/QTbmyLo=;
 b=iURiT9KMyZMunibhknUoNG9s6xyQZmYybwbRBh5xOhFbG8X3903HFzvrpyXu+tE6/c8DubNCRdA0VTOi16pfBJDtnt0wc8T1f/QUSaMjoCXeY37xXH0TnfI6j/StDr9MC/+oo0hhYLxyoOxAQwwwdLN6d8fgtChYfatmKAA9bhub7zOpFazuvHVW/l1qegdp6od/hvF+3KI1DqEZFZy+QRFrPCJPLym6aefgizrocq/JSSTmmyarLfcFmEUYbDKAR24rzEpPcOacRLXhNXv68j+Nm77b9GGw6CXCrEJ1xHxP6QkAbUmaLaqtlwcF3HFwND9LR4uDKyFPlk91AQ9A0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR15MB4534.namprd15.prod.outlook.com (2603:10b6:a03:377::18)
 by MWHPR15MB1328.namprd15.prod.outlook.com (2603:10b6:320:25::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Wed, 2 Feb
 2022 17:18:05 +0000
Received: from SJ0PR15MB4534.namprd15.prod.outlook.com
 ([fe80::3165:20c0:ac67:8934]) by SJ0PR15MB4534.namprd15.prod.outlook.com
 ([fe80::3165:20c0:ac67:8934%5]) with mapi id 15.20.4930.022; Wed, 2 Feb 2022
 17:18:05 +0000
From: Daniel Mueller <muellerd@fb.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] scripts/runqemu-ifdown: Don't treat the last iptables command
 as special
Thread-Topic: [PATCH] scripts/runqemu-ifdown: Don't treat the last iptables
 command as special
Thread-Index: AQHYGFhQog+ImPF+S0ioNXqYbeyt4KyAgJ+i
Date: Wed, 2 Feb 2022 17:18:05 +0000
Message-ID: 
 <SJ0PR15MB4534A11B25E21BC022D1CBC2BF279@SJ0PR15MB4534.namprd15.prod.outlook.com>
References: <20220202171411.3615036-1-muellerd@fb.com>
In-Reply-To: <20220202171411.3615036-1-muellerd@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 78a73506-fdf8-5d58-7140-4959433d8dd9
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1021cdf-c6c9-4f05-980f-08d9e66ff9de
x-ms-traffictypediagnostic: MWHPR15MB1328:EE_
x-microsoft-antispam-prvs: 
 <MWHPR15MB13289A0444D1CA3F2F3D7DB6BF279@MWHPR15MB1328.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /le9WTXP5AtSgD/bZpLtq2Hz+AHAgg+0LKRuCSlHhSoR/oI8H+h9MnTcR+0KDqN/GSiwKFEwyOyZFIn8aP1DgZ7fNHRPetWrpaZFjkHg2H0dgFHQhUszxDXJVzhlji4DTL9lGM3Hv1mWjlYxteyUC+3Tf741tS3RO6qlndEurILJ5nsCdEuMUZhLI6kvF/XJ+xcTz61e1pwEpM8Vy3Cmo13KXSRT0UyQBAVSrOto7JFAVLyfsMqcf61e6sMUSme/LohB8riHi5XBw/UuxBxwtnB5SNvZHaPvFGbZT31gy+9mWGkUfyjzaEFbOmbdKTjyr7BKWBY7tou4DhnAonZ+yc9NbSOWW/y+UXhTKUsnFBMZ+0tWBDbhxmWyibiW8d0R/u1hOgoFDm7x7CYytiQ3nCejI6S1EVBgDxUZC9K9Bl+Dt+3OmGsLGm1F8VBeFZpii751yGo7RVK6BEa3mV0ippW+S4bZ5n/xmgRcAItmygxqLg/my1q3uSfLfkLGy7Bis92plyvDMfMg/+wYGRmlKeQ7Dub8eD8j24JouX2RCuERV+drkQ90v9RQJLrygx+Ixfn1YGkdSVFWL9TBTJTnXdnGb/qxrIshMZuL450tn3x1CkYV80ghFFNwrXsS3x59BrFx44D7B0VGKimVDxUSwjS70qG5CHCyqse0ZlYKy4QkLFG7fcuNAHRqUmKEDM3/dtIyjujKnSx/M+C24pcvLA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4534.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(76116006)(64756008)(66476007)(66556008)(66446008)(33656002)(66946007)(91956017)(71200400001)(83380400001)(186003)(66574015)(52536014)(6506007)(9686003)(508600001)(55016003)(6916009)(316002)(8676002)(38100700002)(122000001)(2906002)(7696005)(86362001)(38070700005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?/RfI4WgjLTfi4NPIrlFLWF8Hy0HBMyv5F0IweepFuzpKV00guy/5bdJz2i?=
 =?iso-8859-1?Q?GbBteubjGTFu8b/Fj8MVH7uv8Q7etYBFHdIq+Ma3+1lv31S5Dh9gNBlPIt?=
 =?iso-8859-1?Q?4LxvSvG1Xg6UOIETu85qI009XdSblW6TN8O3Tb3wfnZhvhCCQANwkEncJ6?=
 =?iso-8859-1?Q?laVpYL8rxgImR07cAhDQl8GJOaUmdh7/UPdysM3ytiaId9tK/+Jq1sOUY5?=
 =?iso-8859-1?Q?HPDZKfcW+Jva7jCKZxDkSO+udPSPqCeUi7IsqTAzNh4yHYu+a3zwg9GMW/?=
 =?iso-8859-1?Q?eYFEUGohJAt9dmmgSd9vNeUSAPmWjvG8l9W0ACW/2bU7uUMG/q6LYyXkW9?=
 =?iso-8859-1?Q?dgwyNz+9sjPpJYttwGsnoMQxSR1GV72Dw7prWzjrlrc12nIjpaShAEVXfb?=
 =?iso-8859-1?Q?jouy2klp52FaErkTPwJrvg7VTvHVeQO5sBeQ9fgumK08gOUyI7HZoxVIlq?=
 =?iso-8859-1?Q?6mva1VqWdwzibM/QFWeClTqM/rIFgOchWX612c+TpNAxZqgGOcCudUOoBr?=
 =?iso-8859-1?Q?895VhoOVemzzo0Qq/pUHCc9RzczMVYtAaFoJ581DPXTgAzB0QvyqrwUq5C?=
 =?iso-8859-1?Q?ZnpdwV8wDkrp8W+z1WAS0W267Gf5KPICOGxixi5M871bmu9NUaMdHLthNw?=
 =?iso-8859-1?Q?w0Mpjq83jOH9pgcGBw3dMs2MSl5dnOPS+sPb5Z3y571Ui1euvhg7ixsRbZ?=
 =?iso-8859-1?Q?uGsz3F9BSn8a+3vN3ksGqWzWfMqLmuNIzeOhWABQiFu9ICS5hUUKyKUmhp?=
 =?iso-8859-1?Q?GEYS4gbq0hOggg7LmKY+oh/IO5GnHR5PDrwHr6bxV62jTAEb1Yf5onQNyy?=
 =?iso-8859-1?Q?DTm1AobsfC2JTOoQHqDlATVkpghlrAvEv5c0LJcbStVtGkLHikEeegvdpG?=
 =?iso-8859-1?Q?pFrxbXk8DBOdeKbyy9YXFB8O6psdCcTpADEPqm5pNvFZoaL52EBdSN2PIQ?=
 =?iso-8859-1?Q?Lh+gW4rhwJC+K+8ZofFUzv/7Mz8/Vda9fjnVr5vLc/OfabkVP2E7WprMYF?=
 =?iso-8859-1?Q?hstO5OfLvRr3gD6Eo0dVBZ5Y6sYrsEzLFkV+zVaiokjDcdzAZaOAPF0t97?=
 =?iso-8859-1?Q?AcHyhzYl5ToT+6Dc6IRq3s8NjOLciCG8PMMusWCm0G1ff8DSmutszmVswF?=
 =?iso-8859-1?Q?h+lwppsO9T/DtfFr29KjnaB8Yw5UuV0h/n7kc3tznDahRTIXAqUqc1Etvy?=
 =?iso-8859-1?Q?2rl5l5LKFX8hXs9jB6oFLHB8PCCFajmlncvALEgWks4tHmFkB35gnHjeoh?=
 =?iso-8859-1?Q?6VLZPhuTnjAbFP77ZxUbygvpz19JbAUifX8DmMY+JhOYYfMx4ibEn9/eVg?=
 =?iso-8859-1?Q?7hvc43MvzN/rJx4sc0k8nXJ4nj8zb5uJVxM8ukhYGom72W/+z4biSRUa99?=
 =?iso-8859-1?Q?UyUBd9J98fUEvB8pqNEYA6D9cvSOnP2HRJU+QRJoPWWFruKHvJUaYLp/g2?=
 =?iso-8859-1?Q?Wuwji3hhTPlFZRBJBgVeGhMLCQ03aecuFN42l7fSXvQtkv4NDQcays+mcR?=
 =?iso-8859-1?Q?yBrBs47JmWLXuwIhPg64zlQrSQ8rkx9CFT+7hl10W3sFPrps0hIZgsrFAJ?=
 =?iso-8859-1?Q?qqA6fMORL249TAvXWYh8k3KFmBfFfoud/LL8s68OYzJaJkynWHQSnTqSut?=
 =?iso-8859-1?Q?z6Gcmr2HDnoiWDeP+RKubuphGG6Br2xWua?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4534.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b1021cdf-c6c9-4f05-980f-08d9e66ff9de
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 17:18:05.6883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Cvnxk9NI4uX/D/IfsJjZ/lrHJnoWU3w1eROpXX/TSQybM1+9DzuVR7mEryCVYwba
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1328
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: CFbahUUOos8Xr8QwNVAktPeUxFUITHtq
X-Proofpoint-ORIG-GUID: CFbahUUOos8Xr8QwNVAktPeUxFUITHtq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_08,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=fb_outbound_notspam policy=fb_outbound score=0
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=541 bulkscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020097
X-FB-Internal: deliver
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 17:18:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161222

The runqemu-ifup script performs a bunch of setup steps that=0A=
runqemu-ifdown attempts to undo later on. While a bunch of said setup=0A=
operations are considered fatal should they fail, the iptables based NAT=0A=
setup notably is not.=0A=
The tear down procedure in runqemu-ifdown, however, has the iptables=0A=
based tear down as the last operation, with the status of it determining=0A=
the overall status of the script. Hence, if this step fails, the script=0A=
is considered a failure overall. That is arguably inconsistent: If the=0A=
NAT setup did not succeed, the tear down cannot succeed either.=0A=
To ensure similarity of the two paths, let's not treat the last iptables=0A=
tear down operation any special and allow it to fail the runqemu-ifdown=0A=
script, but just ignore failures.=0A=
=0A=
Background: we have seen a NAT related setup problem on the ifup path=0A=
(which didn't cause script failure), but then saw an issue bubbled up=0A=
when this operation was meant to be undone on the ifdown path.=0A=
=0A=
Signed-off-by: Daniel M=FCller <muellerd@fb.com>=0A=
---=0A=
 scripts/runqemu-ifdown | 1 +=0A=
 1 file changed, 1 insertion(+)=0A=
=0A=
diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown=0A=
index a104c3..e0eb53 100755=0A=
--- a/scripts/runqemu-ifdown=0A=
+++ b/scripts/runqemu-ifdown=0A=
@@ -64,3 +64,4 @@ n=3D$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]=0A=
 dest=3D$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]=0A=
 $IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32=0A=
 $IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32=0A=
+true=0A=
--=0A=
2.34.1=0A=
=0A=

