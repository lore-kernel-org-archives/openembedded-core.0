Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0122.outbound.protection.outlook.com [207.46.100.122])
	by mail.openembedded.org (Postfix) with ESMTP id 10702606BF
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 21:08:57 +0000 (UTC)
Received: from DM2PR0501MB1101.namprd05.prod.outlook.com (25.160.245.11) by
	DM2PR0501MB1102.namprd05.prod.outlook.com (25.160.245.12) with
	Microsoft SMTP
	Server (TLS) id 15.1.130.23; Thu, 9 Apr 2015 21:08:57 +0000
Received: from DM2PR0501MB1101.namprd05.prod.outlook.com ([25.160.245.11]) by
	DM2PR0501MB1101.namprd05.prod.outlook.com ([25.160.245.11]) with
	mapi id 15.01.0130.020; Thu, 9 Apr 2015 21:08:57 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: base-files: Upgrade causes circular symbolic link for /run
Thread-Index: AdBzB+WPjqApLt+sQnKAWDGX0BvWWQ==
Date: Thu, 9 Apr 2015 21:08:56 +0000
Message-ID: <DM2PR0501MB110183F240EE8918DF12D9C9BBFB0@DM2PR0501MB1101.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 020B0AE300991E020B0C30
x-originating-ip: [98.100.91.242]
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0501MB1102;
x-microsoft-antispam-prvs: <DM2PR0501MB1102660F5AD76C4AA17C962CBBFB0@DM2PR0501MB1102.namprd05.prod.outlook.com>
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(76576001)(2351001)(74316001)(122556002)(2900100001)(40100003)(110136001)(92566002)(99286002)(107886001)(229853001)(46102003)(575784001)(19580395003)(86362001)(2501003)(66066001)(450100001)(54356999)(2656002)(87936001)(50986999)(33656002)(15975445007)(77156002)(102836002)(62966003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0501MB1102;
	H:DM2PR0501MB1101.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010); SRVR:DM2PR0501MB1102; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0501MB1102; 
x-forefront-prvs: 0541031FF6
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2015 21:08:56.7736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0501MB1102
Subject: base-files: Upgrade causes circular symbolic link for /run
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Apr 2015 21:09:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am on poky/dizzy and I am testing upgrading of some systems with older fi=
rmware.  I am using sysvinit for an init and opkg for a package manager.  I=
 am having an issue with the /run directory which I believe I have traced d=
own to this commit:

http://git.openembedded.org/openembedded-core/commit/meta/recipes-core/base=
-files?id=3D0e326280a15b0f2c4ef2ef4ec441f63f55b75873

Before this commit, the symbolic links for /run are as follows:

/run -> /var/run
/var/run -> volatile/run

When I upgrade an older system with dizzy HEAD, the symbolic links are as f=
ollows:
/run -> /var/run
/var/run -> ../run

This makes /run and /var/run inaccessible since it is a circular symbolic l=
ink.  As expected, there are a few things that aren't working right because=
 /run cannot be used.

Has anyone else had this experience?  If so, how did you work around it?

Thanks,
Bryan

