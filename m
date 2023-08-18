Return-Path: <aplanas@suse.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5ECC05052
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 10:36:31 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web11.8436.1692354986481733123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 03:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@suse.com header.s=selector1 header.b=oFWVIQWT;
 spf=pass (domain: suse.com, ip: 40.107.22.87, mailfrom: aplanas@suse.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5sf3J0lvGIz4JmK6QNIDedNmqpjpgGR+FduIsvozrfvfrxaaCQapslakFrVyquW1+INm32GsOrY01gIsWZWe7FW60fMw2UZO+uSK+ZZCFejnDSaT9ENFsHMc+o2Es0CRZUXlpqW+S8Sn3ueFny3hshHPxsSMtKN9q+fAA9v69AyAAv5IANzbZcLpr0upxhAY0hozxTv9VASwtBM5/m43ABQTFEmBWBCFo9sRAjtAZehEv3x7HkPlCwSepb/HndU7qUaErVqmDjFiMaLw041ylnEKGl/3/8WZnOs8BpLZ3tdHfM9McecuHnonCKF+WRVgyeva0nplChJ0l1b5E68Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2L38WNl0THOuMEO58MZRTkC/NaMshjW+pUUcWbawOM=;
 b=YEQyWCFnx30jvVC6ESpdkwu0dYGLQn0SMvB5j8F53efPwRLypu4zmVAiDgWoAt6kei+fysMr6LCncyT89pJ0i9eEAUIGw71B/8RT4/UNx1M9P0nl9k2sQ7K9bQVY643mkg0H5scxoB4IW0OErUGc82qNZKa3kWv2Iq9e+CySlOvahVV8TEiZjosQVujERcA6MYFahYg7quLRN7JPqJ0pUet27I7FAM3+E4m/J4YrxC/3ulM7t1TqdLOun4aQNfJ/DjAzf6RjHxKvm6OEwcerdk1nvEodHM2U9RFtW+cHQr9lQiLMklVKcMCjtXaQ/D2h1svVkK1LwBxYmJ9QeE6h1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2L38WNl0THOuMEO58MZRTkC/NaMshjW+pUUcWbawOM=;
 b=oFWVIQWTfhhIlSuOrw+kryTCvLhDBts4gijKEeDje7T3jXkxK4POWiMwwLc0LT6XVNT+wW7Wpf3k2PCfBaLVspPeOafAwXfmrwGxBGZZ0kDPvz99jgQ2j/kr+uUdGqQJY1fy+4odOVLK/e+XPCrbz0xiodU3UpsB/6tVwpOpzWPIgbydfLSFg/9PkLvNaa0vDzXQMsU1csEew6HoIi1QN7U6Ow3jVjulypdrCtalOLnU3YG/wNFuy+fo2mT97hfygQzUZd3oOJULSH56aBICcVTYRIYcvupvXX6K14VZETKy6kB5SEpzYbso1wHEt27nVvGcRJXeCDhehGXve+5esw==
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
 AM8PR04MB7428.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 10:36:22 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::2e3b:31ec:c244:e95a]) by DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::2e3b:31ec:c244:e95a%7]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 10:36:22 +0000
From: Alberto Planas Dominguez <aplanas@suse.com>
To: Pavel Zhukov <pavel@zhukoff.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add bunzip2 in HOSTTOOLS
Thread-Topic: [OE-core] [PATCH] bitbake.conf: add bunzip2 in HOSTTOOLS
Thread-Index: AQHZ0bazbk0jjKJor02fXM24KFTDUq/vzEIAgAAMZhQ=
Date: Fri, 18 Aug 2023 10:36:22 +0000
Message-ID: 
 <DB7PR04MB466681F8CD4BFF7522605BA3C51BA@DB7PR04MB4666.eurprd04.prod.outlook.com>
References: <20230818093056.10499-1-aplanas@suse.com>
 <2e707be5-5139-4e2c-a967-ff258d69eaec@app.fastmail.com>
In-Reply-To: <2e707be5-5139-4e2c-a967-ff258d69eaec@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4666:EE_|AM8PR04MB7428:EE_
x-ms-office365-filtering-correlation-id: 9a6b0fe7-ed4d-4739-3fdf-08db9fd6f759
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cYmtDz/KzT6PISjZlm0ObPQfhJWFe0CD6Jb2p3WSMwy1g0nvulg8YSQunfyqM7Vo2U0aIl1zIqGVs3Rjj8OlIIqNe1bMgm+FNUukG37lvrmrqfsTwRt69/74lEtpEbw1GxXXQN/1bG+5mEPkEDEgPvmIclOmoV9R+t3kSmzNE33g3DtGTVGS47xWlopT7cbPJO55zsB/FC3ioa/TQPDKuIzfHF7bmhC06wnjwx3nyBVWjhBkg3ID/eyHT7Y6X9YctxCJuf83ZLWHXPqQg17p42dkVxg3aZ+2TUERubRAOqzcz+OYB/Hw3g1Jl1h+2nnGYT8Bt3hF2cNLenGprgVXKPcmrVEMk+hRY5c0DvkLTK2mQ115p4Y6cNBtVYXBXbvzJPZkjXUQR0WfiwqSSBU16gZdSQsbEmxXr3/vN3YxwhY9wW9jllRtdJYdkYQU1Rp1PVMGNTNgcJnPM0EGkwPdrB50/QtqS3P5YnGbI8QkRGLj1wgbiEyCzQ2Lv5BFZNtBjvYpQ9l4l5qDKQIdZNDAMONTTwx97BMh7FQ6lkauMKcz7DzGTXzzh1asYdEO06H9YYVd5F6DLrsk6sSSSweXlA+inHOQwPyMi+VE6pnnf8w=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4666.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199024)(186009)(1800799009)(26005)(71200400001)(6506007)(7696005)(9686003)(83380400001)(5660300002)(8936002)(8676002)(52536014)(2906002)(478600001)(966005)(41300700001)(76116006)(110136005)(66946007)(64756008)(66446008)(66476007)(66556008)(316002)(91956017)(38100700002)(38070700005)(122000001)(55016003)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?N9fW69udmSASmJ3ccO6EriKodRuvleJUXbQW1LN0uoh3QpnIceU1PkcEVq?=
 =?iso-8859-1?Q?dOI/t24dtv1To4ImLAyyrQE/QWPgbu8PkCZF+gxBjbmCG8eX9FG3msjRkl?=
 =?iso-8859-1?Q?2B0Le5nOmCx3NeVeEvbs5diMAroVaBd1ZBHlAnS/nNg0EiaAOD1AZQOj8s?=
 =?iso-8859-1?Q?5PqD8USVxDMgh5jhkoyE5eNU94ksoH71KmIAjNmXwq0IM76oJc7SI9Qznd?=
 =?iso-8859-1?Q?+ByWo1KwPjkcfresVTqrUWa3XgWF6/J9VUn2jK8IaG3C9hpMEcrG5Jthrv?=
 =?iso-8859-1?Q?5IeBWn8aLTvTB7ZspqRQFr/4XKWKFWfem/pWEeCBqjE9UfjDcYXy8Er+0F?=
 =?iso-8859-1?Q?mhxbAP06LxBiUtkSukeK3RdVqwRkxM/ZVIRrTXGVW1Ag4NOPfcy0aI2YYj?=
 =?iso-8859-1?Q?FaWJ9TRz/geHK4aQHaJOHUnjGjRcDFyblPwyLpDtDFtvYtWbXZ4UcaZKkh?=
 =?iso-8859-1?Q?NYsiYwxfAbnVLBh7sMx4lvRb6ah+9Mcpm4PWLmrfg+kqxqz3W9uBIkeGi3?=
 =?iso-8859-1?Q?4zcaAAq0GMlqZTsIh9uaiozBtN/BOFhveWPWZ8ZiC7dds1GzUCmKNjIC0L?=
 =?iso-8859-1?Q?Ts/KL/5LzDI6qcKFpVr+vEXk9qlIpCF4BfUo2X5Snozi5ENtlZ2nh032Fy?=
 =?iso-8859-1?Q?6AK1uNqUx2nQSzcKtUanUOrvj3gOfBDtldhyN4PCEL2mRFWykCqpvA93nh?=
 =?iso-8859-1?Q?0iUTIkPQFVVtvLmq8ZAj4FVFAh82N7RDL/Td0VtZfn0d2k22zQyLXfElA4?=
 =?iso-8859-1?Q?VdIVNAI8xbefFNTLeDDEEgeaaWDuFYgqifQJLSwM4XNjpOC9K9/VhNhRNR?=
 =?iso-8859-1?Q?HRzJbWBimJRzudISLgLYWirppIX8EVBRpZMIYP0WxwBxhBOKkhFrCgb/+V?=
 =?iso-8859-1?Q?U2TaB3PzVpdgg/NAiVxegEmep/8KOeQolJxuh8DvLJE3ZO3zweeBAG9qy6?=
 =?iso-8859-1?Q?MiBNeDODBMmDyCRXxn2ocq/f/rnuTlLndgsLKEJ0/dlnn7Y8TgGCp+RUWy?=
 =?iso-8859-1?Q?TsLZgqmvaSpcRMkN8JCvR3Vnp2VISBlAUzZ1GSZw+XMLyfye+ttfU/BKZB?=
 =?iso-8859-1?Q?Fvzwg9YMdRp31eoV5XbVdNCxx7POr9Ni2wWSRtVLjN5EYIOWCvkiU7XxOA?=
 =?iso-8859-1?Q?KM3iBQhgHJJtW8DggUN6riOx4nTGpYT2UA3SKnISWJ3S3VyUiQwFFR6eF3?=
 =?iso-8859-1?Q?Jj2e8w+SBqUg5Z+/lb97FCamXSN/fBx57QTzwEmVRcow7rVyJvBWg0vdFW?=
 =?iso-8859-1?Q?tkjA8cxzjsutrQlrgeXHqHmaWQKe7CJcgR9IbOIaBB+OS9aFFxmy+aHjtH?=
 =?iso-8859-1?Q?MB875IodXtor0GJu6hWBwrzx/fVN1KMsRxRDmohZFHCU9+zEraPOcfSgdL?=
 =?iso-8859-1?Q?fU9St3plxGQYJ6UQUVi9u4EVggrqcrcUYzlgFRioHHtqsb2XACru9+rssH?=
 =?iso-8859-1?Q?ljH+9xPcuMM8g9s+0DwwYckxo1OXCg/LpPgb2J1yxiXhXZRJ5k6HBCWA/q?=
 =?iso-8859-1?Q?GnFVt6yJuc65zQPcqoGo+80gs5+cNy3DFjYNuXftiI7qj/LxZr3jf1B1se?=
 =?iso-8859-1?Q?kWKFdjZ2fzGNb+9rp/zKj4Zrk9qJ/mJlPGyRQQHZSXON1dgqeEOyCBXhue?=
 =?iso-8859-1?Q?nLxbkWQsa9MRw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6b0fe7-ed4d-4739-3fdf-08db9fd6f759
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 10:36:22.4262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLpzQODKKSyc7W0fvVF4y0q+3Nmq/xwZomjuJRSKO0iDjWWaS5ncvZWqQSLkbpGpU1HJsRTUGr2cjMRsW5I3hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7428
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 10:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186356

From: Pavel Zhukov <pavel@zhukoff.net>=0A=
=0A=
> Looks like the regression has been=A0 introduced in=A0 previous update. T=
his =0A=
> patch=A0https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster=
-=0A=
> next&id=3Deb3ec7469fff857c819332371ad1d586f43c79c3=A0(which was reverted =
=0A=
> by=A0https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-ne=
xt&=0A=
> id=3D3aba44a75dd565b192f7328f2a0150a313de3cc1=A0)=A0 solved the issue wit=
hout =0A=
> bringing bunzip to every system=0A=
=0A=
I see! Good catch! Seem that I am indeed the culprit on this regression.=0A=
=0A=
I have some questions to evaluate the alternatives:=0A=
=0A=
1) Is it OK to change rpm2cpio.sh?=0A=
=0A=
This is a verbatim copy of the upstream version from [1]. If we edit it we =
take the risk of reverting again the changes done in the oe-core copy, chan=
ges that are hard to track.=0A=
=0A=
2) Is it OK to drag more stuff into HOSTTOOLS?=0A=
=0A=
I do not know the cost, but IMHO it is pretty cheap to populate links in HO=
STTOOLS *only* if the link does not introduce any new dependency on the hos=
t machine. In the case of bunzip, unzstd et al. those are already listed in=
 the packages that should be installed on the host, so there is no new depe=
ndency or new package to install.=0A=
=0A=
I think that the safe option is that, for already installed dependencies, i=
t is OK to add a new link in "tmp/hosttools", because the risk of changing =
rpm2cpio.sh is that those changes can be discarded accidentally when this s=
cript gets updated (as I sadly did)=0A=
=0A=
If we do not agree and the first solution is selected, then 9e14d2ab801e7f3=
5af6d43dd5d071fe29821d27c should be reverted too and more changes in rpm2cp=
io needs to be done.=0A=
=0A=
[1] https://github.com/rpm-software-management/rpm/blob/master/scripts/rpm2=
cpio.sh=

