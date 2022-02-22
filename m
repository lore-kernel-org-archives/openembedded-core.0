Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C799C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 06:55:55 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web08.9874.1645512952494501371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=jnG3MCWs;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1918; q=dns/txt; s=iport;
  t=1645512952; x=1646722552;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=wgQwEf2WMk+bmZ36ktM39jTGRhOzcmIJ7y2cqGI2Awc=;
  b=jnG3MCWsn79r4QyKyqLBwyCjP9ffEdoDtzyEdK83Rp34K7Xj2Sc4aV9A
   jvmNNgsK5UUQvM+lmizEiLK6POT8knnYcKo7EZxz6qeloi9N5S5J4S/Lo
   GevHj0gzUEPKnqvU0+6GZFXz38tKjz5c7Cec5KkcYPKv87zl841JYzaHF
   E=;
IronPort-PHdr: =?us-ascii?q?A9a23=3An5d6AhbF6Q1pSBDhx9ZI9xb/LTAphN3EVzX9o?=
 =?us-ascii?q?rIriLNLJ6Kk+ZmqfEnS/u5kg1KBW4LHo+lFhOzbv+GFOyQA7J+NvWpEfMlKU?=
 =?us-ascii?q?BkI2skTlhYrVciCD0CzJfX2bis8ScJFUlIt/3yyPUVPXsjkYFiHqXyp5jlUE?=
 =?us-ascii?q?RL6ZmJI?=
IronPort-Data: =?us-ascii?q?A9a23=3ARqigW6i20KuO0zOVK872qNSoX161oBIKZh0uj?=
 =?us-ascii?q?C45NGQN5FlHY01jehtvUW6CbvaJazDyLtgga4Wz8k5QvJPQm9RrQQE5+Hg1R?=
 =?us-ascii?q?XhjpJueD7x1DKtf0wB+jyH7ockOA/w2MrEsF+hpCC+MzvuRGuK59yMkj/nRH?=
 =?us-ascii?q?uOU5NPsY0ideyc1EE/Ntjo78wIJqtYAbemRW2thi/uryyHsEAfNNwpPD44hw?=
 =?us-ascii?q?/nrRCWDExjFkGhwUlQWPZintbJF/pUfJMp3yaqZdxMUTmTId9NWSdovzJnhl?=
 =?us-ascii?q?o/Y1w0mBtXgmbHhfwhaBLXTJgOJzHFRXsBOgDAb+Xd0ifl9ZaFaMBsL49mKt?=
 =?us-ascii?q?4gZJNFlspu6SBsuIrbkk+UGWB4eGCZ7VUFD0O6XcCTh7ZXMnyUqdFOpmZ2CF?=
 =?us-ascii?q?noeOpUV/OtyC2xC+fEUbTsKdB2rg+Ot3Kn9TfFhgMkmJsTnMI4T/HZ6wlnxE?=
 =?us-ascii?q?fctRozCRqLi6tpR3TN2jcdLdcsyzeJxhSFHdh/MZVhEPU0aTcJ4l+azjX65e?=
 =?us-ascii?q?DpdwG95bJEfuwD7pDGdGpC3WDYNRuG3eA=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AwF9eYanNkRdm0VS3c0kQHI2OnfjpDfNmiW?=
 =?us-ascii?q?dD5ihNYBxZY6Wkfp+V/cjzhCWbtN9OYh4dcIi7SdW9qADnhOFICO4qTPmftW?=
 =?us-ascii?q?jdySSVxeRZjbcKrAeQYxEWmtQtsJuINpIOdeEYbmIKzPoSgjPIaOrIqePvmM?=
 =?us-ascii?q?vD6IuurAYOcegpUdAb0+4TMHf9LqQCfng+OXNPLuv72iMonUvFRV0nKuCAQl?=
 =?us-ascii?q?UVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1cjegIK5Y1n3XnOkgT/6K?=
 =?us-ascii?q?nmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3bRY0eTFcZcso+5zXQISdKUmR?=
 =?us-ascii?q?EXeR730lEd1vFImjbsl6eO0ELQMkfboW4TAjTZuCGlaDPY0L3ErXQBepF8bU?=
 =?us-ascii?q?YzSGqF16Lm1+sMip6jlljpxKZ/Fw/Pkijm+tTEYRl2i0K/oH4vlvMklXBES4?=
 =?us-ascii?q?sZb4lQoOUkjTNoOYZFEyTg5I89Fu5ySMna+fZNaFufK2vUp2913bWXLz4O9z?=
 =?us-ascii?q?q9MwA/U/auonNrdbFCvjwl7d1amm1F+IM2SpFC6eiBOqN0lKtWRstTaa5mHu?=
 =?us-ascii?q?8OTca+F2SIGHv3QS6vCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93nJjaSltXuW?=
 =?us-ascii?q?M7ZkqrA8yT259A9AzLXQyGLHnQ49Ab44I8tqz3RbLtPyHGQFcyk9G4q/FaGc?=
 =?us-ascii?q?HfU+bbAuMePxYiFxqZJW9k5XyKZ3AJEwhtbCQ8gKdOZ26z?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AzBgDWHflh/5BdJa1agQmBWoFSVgd?=
 =?us-ascii?q?3WjcxiBADhTmFDoMCA4sQi3WEH4EugSUDVAsBAQENAQEqDQoEAQGFBQKDXwI?=
 =?us-ascii?q?lNAkOAQIEAQEBEgEBBQEBAQIBBgSBCROFaA2GQgEBAQEDAREoBgEBCQEuDwI?=
 =?us-ascii?q?BCA4DBAEBHxAhBwodCAIEARIIGoJjgmUDLgEOoigBgToCih94gTOBAYIIAQE?=
 =?us-ascii?q?GBASBCAEtAYNWDQuCNwmBOoMOiyUnHIINgViCZz6CIUICAoElOQKDTYIukih?=
 =?us-ascii?q?7EyyBGypAv3drCiWDIYsBjHCBc4YXFagHLZYdIIxvg06VZQIEAgQFAg4BAQa?=
 =?us-ascii?q?BYTwrgS5wFYMkCUgZD5IRhRSFSnQCNgIGCwEBAwmLBoJGAQE?=
X-IronPort-AV: E=Sophos;i="5.88,333,1635206400";
   d="scan'208";a="989464178"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 22 Feb 2022 06:55:51 +0000
Received: from mail.cisco.com (xbe-aln-002.cisco.com [173.36.7.17])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 21M6to2C025599
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Tue, 22 Feb 2022 06:55:51 GMT
Received: from xfe-aln-002.cisco.com (173.37.135.122) by xbe-aln-002.cisco.com
 (173.36.7.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 22 Feb
 2022 00:55:50 -0600
Received: from xfe-rtp-002.cisco.com (64.101.210.232) by xfe-aln-002.cisco.com
 (173.37.135.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 22 Feb
 2022 00:55:49 -0600
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (64.101.32.56) by
 xfe-rtp-002.cisco.com (64.101.210.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14
 via Frontend Transport; Tue, 22 Feb 2022 01:55:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktjmDI7sxYqFtFeivUXupyvx9E45XzjVqVG1j/M2njFJ2JlXjYJD9oXN7/HICpCA2af5HFhINrA8JEg9AMsTAGJNrT6A4LR3uQGini8D0gzHuyQAglJDxl/qNUu0hb58eCbPDIF6KuuDRu8cHzIPs5g788xqBkmWTaG5BHvzucaAIEQEguGqp+fqIT0oMF/Qfn4A5R5wNeXb8WEIfyqRuP+BKbKOAXq+sa26PrpEwWXuA5OqpTO0+Z1zD+ueVZn+Armg1ye0+iG+fggPn3lEKaZK/mwwVICcwkT06wjFNxeBi8qo2OzFsEOGYk+M7IwaZyhokE8q4ZY0W1ZhPBrpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhW2EaTAhuDx1XLVzDdwZdaVqrGSJeR0DPOXj6rsTbE=;
 b=md05HICcRw/MElGO6Gb9A9iV1CdT7wtp9n+usGi4LQDK1HK0HdpEjaFM8YoWllZUQJte7qKib1CkOFBQaVu5XFy7X2ArtZrOSKZ2WSR1cisvmGY05y/v68zxXoGKnI1Xgw3g9nhY/WfFAPrd9wS4OnzRqXW/rCkGnqMXrOc4c9kKL5Gl7CvkDQGq0Ge1mtC+dpiwc0mfVoWbsTEmWEaCEj4gwEeebzGjIADDTcv8yOc/JAdWoLN23dKaE8aPlRrhF8bnkZrSCdzJc/K5R4R2dRVDFAmNuCV+oskOiTQtQwuEgHWB2jbW7Brd90pgZBSf4KaojoWE65KNCGSPru5eag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhW2EaTAhuDx1XLVzDdwZdaVqrGSJeR0DPOXj6rsTbE=;
 b=FWLb5QJU6EkD6VWmFLW3JS18gnQmiNJwU6GVNuGlfpd9lcPE0Wk02FLm9sr89/egaByPOS91KsR3bf7epJG4AXlkmrBWqO890Zf7lLdzHVlVEFVaTrkpFNmjnUzcQupjtZKwyk2xoC9Tp0PAyN/M0BN6SW518qid4HPXDf9zdO0=
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by PH0PR11MB5904.namprd11.prod.outlook.com (2603:10b6:510:14e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 06:55:48 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::172:f6d4:6bc1:a99c]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::172:f6d4:6bc1:a99c%8]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 06:55:48 +0000
From: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Tim Orling <ticotimo@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 19/32] meson: inherit setuptools_build_meta
Thread-Topic: [OE-core] [PATCH v2 19/32] meson: inherit setuptools_build_meta
Thread-Index: AQHYJ2l4luwCN5jchkKQzDY5hyf8Q6yfI10n
Date: Tue, 22 Feb 2022 06:55:48 +0000
Message-ID: 
 <PH0PR11MB490285B1A800619AB463E805D73B9@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
 <82c32de14862300d7171690ae2568c7af386be19.1645478020.git.tim.orling@konsulko.com>
In-Reply-To: 
 <82c32de14862300d7171690ae2568c7af386be19.1645478020.git.tim.orling@konsulko.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 418df3b0-6649-9cfb-1686-2129430d736c
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92c8a5f0-a086-4887-d2a0-08d9f5d05b51
x-ms-traffictypediagnostic: PH0PR11MB5904:EE_
x-microsoft-antispam-prvs: 
 <PH0PR11MB59044BCC89FDED1FF4DA591DD73B9@PH0PR11MB5904.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fzkQkpw+v8qEFT+uZDLQK635S+1J0RPtkWL1mxQkMuzDRMQZ+bmbeJ3jVkyQ7DgA4kZmRW466gUfPfE/KtA8euV9JrDkWQ710Vzzizn2BjXCkZLm1i0ZaW2dBM9+ktVKLf//7UnvRkYLycHSauY10VlB5sHODxRz6TnGK7zs2HD5f/cnfNAx0RBZvbfx57ZdLHXTzlkXkTtmBcp7UBN9q/cOBzTBMq/OFQeavHFzfb1KJkWWk4immITvJK60zKP5dbfyJs+wuhu/QoZLssgNHoZ6GREdMU+SbNrhvAK1aEgO/9xKopGj2yuz0zzZXmSjRZtzjF1umDYNfn+GPqHoVSLGKbirONcOy/VRoCBOqNgwlMDJ5VbKLJfdZQMlp0PohAkmujM0Wvg7dSrUh7kA4UJTdwCpwetZLoAAf5w3cDUfkAYhy0YDCRVlfZwFQ00YvMFDnqcg/yb+OBIJ7t6hnPIgeSqKlPSCx5gQFisg13mXnWhErYzJjKGlgIZTVRCOlxw6XyvRzMNBlmC0809M/0hSK/NekGx9GcPa4tGralygzP5PcAqUSR9Y6FcXeJiGBeO9g2DiUfugms/1opTMGrSjHtf90q8lIUmQSYYP8QE13TZt2ouwEdYC3B+z1BSHPqCyrSkD26BS4WyDx7ZUewXDaYFVQe/nXB8e3sQqVuYzy6p4po6lFJybBvNZGLY1C2vgbN4iMF0fhY4Pj4OWtt1SPjJTqj7OW6vHqz4b5iQu/FKisYP4KvaoTL72Rzc5BblTX2QzdfjWVotq4/5hOUBNMvIImgEfGEnQ0CxudgQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(9686003)(7696005)(66476007)(76116006)(66946007)(66556008)(66446008)(26005)(186003)(508600001)(91956017)(83380400001)(33656002)(966005)(52536014)(64756008)(8676002)(5660300002)(8936002)(316002)(6506007)(55016003)(38100700002)(2906002)(122000001)(110136005)(53546011)(71200400001)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ceZcaEzFA2NO4cOSpNYcNF0mHSEozSriYeh1PV9OM/AfDsjqErT1GADgGu2M?=
 =?us-ascii?Q?ST+QqQnlTzaDV/gN5c7YcVtc9M/RVhWoS5oy3oT3Vt9UfLONiShiAjqH5kHc?=
 =?us-ascii?Q?KQQ1b+gl9BnsV+cb0oDLI3uEvkJMWftz743jrIyjc7LiDH1qwmIRp07o8aNz?=
 =?us-ascii?Q?FTY3M7YF8AiNwInPZdQE/mI2gJCZsW0g1GVNKsYrUagPIhNxWV0wmjwHU5dY?=
 =?us-ascii?Q?thyk/dw7GUMbhhk76B8+bKcXC7YYUU3/8xbzj0Mx+6iDuFNwqcFQrPtJ/7TL?=
 =?us-ascii?Q?EyuiIcDZFR1nB91Ol9CEfDDoTf/8pzfC1uNv+e/iQIyaMUThTNRx+1pzgnoX?=
 =?us-ascii?Q?F94Vu7tcti61rIz2Y9vHFmOhmTXERMUOXGpGemGzGy8A/BTrkPZJqaxzZcMo?=
 =?us-ascii?Q?355vx/iXefVGnCxPgiV8nTyi6j+5cJJNO8BHPnpb99qntY+7EqRAbAJpsC6v?=
 =?us-ascii?Q?2fKF+iK+w4/FjyaTrkPVTd5bHxjH7e7IvxpBGFivlyNr0rlKlHUAbV1QPx5A?=
 =?us-ascii?Q?T4QWQT2DviMacClt+nKCbDdL7QrTC9dfvwr/OlahC9VumWeZDGMM+C085EGc?=
 =?us-ascii?Q?6sl4vJu77HhSGdCr9w8FEW7HqjNxDWb3uWNbKC0uMIqSpvyUoBNNZskMoNF1?=
 =?us-ascii?Q?f6ZX0H77NKMqZ3UUusYFBx2cBcgqYAas2ZuffjX8XwWzB1ZrRHoAsCMpImZu?=
 =?us-ascii?Q?DJTo09jH+/EL2UQttbrTTOXUgVD0eJxO1We7XRFixQMrJi8J70IBRcO3ax60?=
 =?us-ascii?Q?EVd5CHQ1WGJuEg4e7PoIeaL141dSBxxXfYStpa1RtLKqijW2v4pU5x2J7XEl?=
 =?us-ascii?Q?nIdi3tZ1SMrwCODNQtPJ8fYSw7kX13t8uhy/2gWDuFm8Tj1/RILzSRK8Nggm?=
 =?us-ascii?Q?UUzCIDCWbQvKhksg/s+WZYFgWvUMrW5i2luWAwGu2aYGrlIfFvhomwkVhHXZ?=
 =?us-ascii?Q?MYwTXhcLq2Crusc6KW4CC5DWvz9zLdlKuBalZsHmVwPAOtSipmLJInaghG7q?=
 =?us-ascii?Q?st13mpUDYsD6skyE9kBraEAOpmSLUxFge+Pmitg2sX6Mk1yeOCtC6NNPbZ/E?=
 =?us-ascii?Q?9j2BsPVvSGInsADd7EceD9TkQM4SE9DjDQPWF6Yw+0YM4rOtz7eN/+9vuvdp?=
 =?us-ascii?Q?o5xmajPK9lWCRRT8TKezWm/pgl3FJWrj7b4oyW1LWvACnLfh4PV6reJge09x?=
 =?us-ascii?Q?4gAqbDxnhoMUGp5J8ZotdQ91HnNXn7avRducOplcx+WAminzatgu57VadNsh?=
 =?us-ascii?Q?tsN/2RXsrD8jxowQAiBYw8fsrY1J3b09kk8tPGo7M7fdnMoFcaQeeKAHn3GO?=
 =?us-ascii?Q?cDBK4xz0RXtUdWw+Y+XIr3BTCYFZvhVjyhNNd/xhAy9jyQptmAlVyZ7HROOf?=
 =?us-ascii?Q?cfSYNg7PoBMp8JlVLND0oHFHCp9yb7O8G3YYTUtoS1iFy5pKzdXWeTALXQzQ?=
 =?us-ascii?Q?snq2tCX3uPyyu9NK9EZ05DgdgEecRcNtlLgfpYMOPucUoUpHVm/JWEiDfFhj?=
 =?us-ascii?Q?v7NkU3zc9DtLwc0okzhsf7utWKM2SaxoAJ/+wwKNiK6hls6xFNx2KCp6zDcw?=
 =?us-ascii?Q?K/srQZLySZERYLWS+aH7zrIat/mXGT42aRdyVh8omtQ1MvBdAPguFOuLp72/?=
 =?us-ascii?Q?Jg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 92c8a5f0-a086-4887-d2a0-08d9f5d05b51
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 06:55:48.2477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 3E5SFIi2NRjpc8Wgz4OZISHaCZj4yZEvK4ZB0wrY8F4Os7jStk7okzMOP0AiLyGImwKs2f1mDySJLLChi9YWzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5904
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.17, xbe-aln-002.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 06:55:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162125

Hi,

Could you look into this build https://autobuilder.yoctoproject.org/typhoon=
/#/builders/97/builds/4103/steps/15/logs/stdio

Error:
 Problem: package nativesdk-packagegroup-sdk-host-1.0-r12.aarch64_nativesdk=
 requires nativesdk-meson, but none of the providers can be installed
  - conflicting requests
  - nothing provides nativesdk-python3-pkg-resources needed by nativesdk-me=
son-0.61.2-r0.aarch64_nativesdk
(try to add '--skip-broken' to skip uninstallable packages)

Regards,
Oleksiy

________________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Tim Orling <ticotimo@gmail.com>
Sent: Monday, February 21, 2022 23:23
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v2 19/32] meson: inherit setuptools_build_meta

Upstream provides a pyproject.toml which declares setuptools.build_meta
to be backend for PEP-517 packaging.

Set PIP_INSTALL_PACKAGE as this recipe does not inherit pypi and
therefor no PYPI_PACKAGE is defined

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/meson/meson_0.61.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson_0.61.2.bb b/meta/recipes-dev=
tools/meson/meson_0.61.2.bb
index 45938af6ffe..a51db1e3d44 100644
--- a/meta/recipes-devtools/meson/meson_0.61.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.61.2.bb
@@ -21,7 +21,9 @@ SRC_URI[sha256sum] =3D "0233a7f8d959079318f6052b0939c27f6=
8a5de86ba601f25c9ee6869fb
 UPSTREAM_CHECK_URI =3D "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX =3D "meson-(?P<pver>\d+(\.\d+)+)\.tar"

-inherit setuptools3
+inherit setuptools_build_meta
+
+PIP_INSTALL_PACKAGE =3D "meson"

 RDEPENDS:${PN} =3D "ninja python3-modules python3-pkg-resources"

--
2.30.2


