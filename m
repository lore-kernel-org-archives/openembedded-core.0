Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC68C4321E
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 13:42:48 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.48])
 by mx.groups.io with SMTP id smtpd.web10.149429.1669729365417526940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 05:42:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ClApSJ6p;
 spf=pass (domain: arm.com, ip: 40.107.22.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHUJpVmIW/uJB/H059MB1Rk/z+N69hia9yxc/RoL0Ksxm+rcSGPhouzA/U4OG8REMNJ2OnpfdAJWimLVIGrvApQ0PhLUUPRe1S64dJ+XKQBVcmj+C0hmpQu3xusgJy7cSGOGP9FkqqpT5fgxoa1jk9zMWl9N3dNSnxD5lYKF2VifhrOk88NSfgLdnZswawOVkpt20Zw9/4MSSvWfLpud4nrPkGEGAIPLddLBGE4Dvjm6DxQX3TjdpVQQPELp/buGOrvgKpwyiiNpcPGGS/nHRGai9LBhLYQoeK/ozQSRyd3iAB/kWc/BKXtiyNEnancx5Dw4oHdSg2MFbNXHCTTm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWfp/llxdvVVabrJbcJi17kzD3VoAt1/KPTZvLO0AiU=;
 b=M0IAMsChUWpW1lH70huR45pHRp7zOadM3NCYEUYTVXiiW4pzDCu1Vs/4h2IL3ASQBBnL87DJwzbGVhSZK1TirXoZBbOlr6kWmk8ZOhiAlbDQGfPnu54TA1Ne9e6TSIso37iY3yHGxHvEKeYr5dmJdnh0FFewFm7znHn0sgJ8dTtWSUCXoHHur3v9N37bjFAOEmGCK6xhHaFBm4hQ1n5llZE6Q/WTFpzwrPlSfok2fTF1D+UUkWNmGZZPCgok3yqxic+s/C51/ZAtR0eMLX9MXrgWcyjOD2laZo0OO2ax1EpgBGZ7ofrpwNDKk42y3cWjTC9JT/nMG9cq/dRXJBziOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWfp/llxdvVVabrJbcJi17kzD3VoAt1/KPTZvLO0AiU=;
 b=ClApSJ6p5rGS2QMRpVckdny5tnFco01MJFlgpdFQWtJPwGVPEQvxQjtO7ArgguFn9ADlcydOHhZOAzCfsyISl5J8twWH1EeXvYytvmcgXgJu9IvlBXuF9f3hCIFUFmnK4nlWxs1QqX2eZXjbM32mFLIZwT1nNeCU+PCafXU7d1c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7772.eurprd08.prod.outlook.com (2603:10a6:10:398::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 29 Nov
 2022 13:42:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.008; Tue, 29 Nov 2022
 13:42:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Mali, Narpat" <Narpat.Mali@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>, "G Pillai, Hari"
	<Hari.GPillai@windriver.com>
Subject: Re: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964
Thread-Topic: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964
Thread-Index: AQHY/0bP5Tn+2x4S5ECHyICQTi7Qx65UoKoAgADu5QCAAGK8gA==
Date: Tue, 29 Nov 2022 13:42:40 +0000
Message-ID: <A08B60F3-4D6A-47EC-9B50-C498375B1CBD@arm.com>
References: <20221123142022.136114-1-narpat.mali@windriver.com>
 <9B7572D4-F1B3-4A23-B280-FB7A99808E84@arm.com>
 <DM4PR11MB5550E919066CC47698276611E4129@DM4PR11MB5550.namprd11.prod.outlook.com>
In-Reply-To: 
 <DM4PR11MB5550E919066CC47698276611E4129@DM4PR11MB5550.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|DB9PR08MB7772:EE_
x-ms-office365-filtering-correlation-id: 3bb30b6f-b9b3-4444-ebd3-08dad20f95a0
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pemP3NiQP3Uz9OmgxnotTinaK10MI3eWcmyygDCl3oDYdYExpwK7Ses+qxMmmR9zdRQ0rMkT0stn7uswNbNcRbI4eDpkZ4gn7HOF8A3BI1Sjtd1lkMjSNJ4ZTvqTzgK4w36+IUE9gMJl4VLDgS6YRo0CvVloD6PLGinSdS3WGF8OPEI68RmfqJ09EXcc+BeLaIazK4vpp8q5XF+l+vHJJMru7vw7nHoK+hTmOvvXIyxApQlgG1DjCADYgKqrdwDNt/AOiEhVUoP7WjJUIWMIrW0vz9CXjGDQGYLlQ3iS1DbP/UmGTgWCMsL7YGiwB0o1ZXvn5araZc/MQliw0Lj1pXV52ynxVy343EjPnok88qQ+xCdFXmqIfbrhEo5uPA3QbOXseDveq/CMkLqGk6W4KmppcA4l6gRBthfx3ai4v38uS+y3eJrN5lMuELvRR/WssktpR1rSvMyp//N0jE7ofJQpeYuZ4/KJzVnIepoQNRqfR0oXPSQ0X0zDWnGLSStaw5t5qC3T4XhtRzXBX+SoLFyhKeNZ3O+qq0sDeH2LSNMLO8IqnlcrSHhExWbTxmwkEbCjX3s3IcAp8rLUV9tT2+lTRoXGv/ZE9Nn+w4NTfcw+EJxNhIemJTWPxS23MZHl3El5XSCII6VG8fiX/9zZWIuDPomowIk6uhH0Ea7pjbMPXbGSzZKK1BLXjvLZmMtkc0I3kVkXgENLKtetbzvp/8lsXlZkpY9W5kwRFTb+Bjc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(346002)(396003)(376002)(136003)(451199015)(33656002)(38070700005)(558084003)(2906002)(91956017)(6486002)(478600001)(64756008)(66476007)(66446008)(122000001)(66556008)(71200400001)(66946007)(6506007)(86362001)(4326008)(76116006)(8676002)(316002)(36756003)(5660300002)(186003)(26005)(41300700001)(38100700002)(53546011)(54906003)(2616005)(6916009)(6512007)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?750cBItX3HtElRFUxfz15k+WytyqRKMwxI/gMg2XE+5ICCAodSkL3ij+jM/t?=
 =?us-ascii?Q?vDUmVGTmyG658oMytgHLD6YlhPKR4gy3PRNnstAN+FDYmVXxYKkEjd0jEq9A?=
 =?us-ascii?Q?sqaouvxtRiDiNNweCr/LqDUxvei6QRAPn1Ki4uulHbhnq70Siz0KKkQN0cR4?=
 =?us-ascii?Q?/TxCdquNKRvlHnq6LVlcrMPaEbFr0OTxUT4+4RLv+UO0JotWJHyODZs5qCnW?=
 =?us-ascii?Q?CSs+Lfg7/8sUBTivXL2+OJ6nKJb/NdFGDDi/k62mnT/bZFU6Sb4rmnOuE4ID?=
 =?us-ascii?Q?l9zHMcCv0cm+cxEtDxaveE9LsYcupOvS5Yp1EEPRe4F1TTWPJ7r5D2a6+N/t?=
 =?us-ascii?Q?YwhSoELcvu5aUG9rQ1e7A9qWBqfkHZFEsqBkjePWLzux9BiMtp8m9gMTLBwV?=
 =?us-ascii?Q?B82oikun0kIVWrTihWVhat/YbNhyqzx+gpJhqjYhrK8A9TxNrOfrlK6dxacm?=
 =?us-ascii?Q?AEXf0S5UGnshaWg+erDppNex50VQDraxAoEKPvLj9oeWIq5KLPQBeEknSeFP?=
 =?us-ascii?Q?1DEc5DsNldEwVhYTAZdwKiX0AdL8ANCLeRlvrDebhIMMboZTS1VHIyHADX4q?=
 =?us-ascii?Q?ZmY5pY26z1QZUh7EGrso9hdCA8w3SF4b7W9wG4Zt66k+eBNrvi6v05NJB1DP?=
 =?us-ascii?Q?evCnrZoZFEOzAOMUTCTFyHpgrxxpepIrGPGm8YXcA4pxUxHY/WZrlQDrW8hs?=
 =?us-ascii?Q?TsdpXDNljUF8oWqTJC/BW3U0SXiQtv1a8ITJkC0yptrTlBYALw3F+IeTxL8P?=
 =?us-ascii?Q?YPrGsYO+djLchZqrL6N8kVgCY6I59jKMPA30jUFe53wbkP90GreHI6MCcRvn?=
 =?us-ascii?Q?dcd/31lV8m2SdpfYCB0ayfY+ZLPOwqTs24nunZ0MDwYSF0/s4LDVV1F72Wz+?=
 =?us-ascii?Q?q3GyGX+zMLzkyp1G7NGmIfCayaIzquRRNj9eHhqkzYMDiDWWA6FFVbA3FS+8?=
 =?us-ascii?Q?OeIRJmCG9FJu2aphBQOOB8KvjTQgIGqkN2rHFZvgHCvhODnnxqzwm5Ou+gJz?=
 =?us-ascii?Q?zVW//wjCLXT1PJDqsSVBbk2XH7EtkrOjKW1F8KS9UCpMYv+zzuxlg6V5077E?=
 =?us-ascii?Q?OlmqjucD/maTOn+0E12jIFS+X4gs4puwGg0zaLgpk7VKx8ntsBQUW+T/WT/Q?=
 =?us-ascii?Q?kTW3IzEVoA41vdIxElTZ006ktFMJ4Pq4axSiN1rFbkmllPGO9ecM1Ykxn+Z+?=
 =?us-ascii?Q?XoJUk7/M+mOjFMtbzCVaYIEvaDok/CKrcvC8KR8SuMzCgyaQl0r0yCOD0hNQ?=
 =?us-ascii?Q?hnGJxVdoqkHhNpkfX+6JuF1uu1Nyv+KjYjdSlv055pwLEEBbYDPCd3T0bvv4?=
 =?us-ascii?Q?H5hRTT8hIBun1vMyPZ4zbuUXJNwqv+btqJMwwH5G4fPPBsuBrG4rlU0QJ4Bt?=
 =?us-ascii?Q?4IqD5mE4Ac1KvBTZ0ukpjGMoibA2VBOugIMOZKgzhL6Vr85i/j8CX4oHQXct?=
 =?us-ascii?Q?yTKhCN4B5KitV8G6taNvq96hc6mvT7HY4s/jY1ajJDFeYCE3+t2oPC/O7J4Z?=
 =?us-ascii?Q?hRStz8G74NXrWT3YSsB2Xi1L3GPS2R13cQ/zt7FPQL/yYaZxWx3YGvk2M5ZD?=
 =?us-ascii?Q?kUngkZ4bWEnhisikN85iTy+zjPqA/RbHspyklxTB?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <35F07CB51D1B494BAA9958C184F34FC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb30b6f-b9b3-4444-ebd3-08dad20f95a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 13:42:40.2727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+gNwWNNfeuBHvigtj9s/O+GFEVKVxZiT4EZ6aYrbcPA3y970Mb3nVGk7ECRKM3BNR7jiF1fztEWJd8J0h/V3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 13:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173970

Yes, please.


> On 29 Nov 2022, at 07:49, Mali, Narpat <Narpat.Mali@windriver.com> wrote:
>=20
> Sure Ross, will make sure to add CVE tag in the patch header.
>  Do I need to send again this patch with CVE tag ?



