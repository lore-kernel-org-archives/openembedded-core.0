Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62E6C77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 09:50:28 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web11.7997.1685008219110638064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 02:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=b2LDBhVI;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1551; q=dns/txt; s=iport;
  t=1685008219; x=1686217819;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C6kdMwPsF+6pmpXtSuEov9mQZndRDiec4ySNXi09Fhw=;
  b=b2LDBhVIMdiNhfVVlnejUi/xvbr4f/mucyWTa/gbNu8BdsY0vWenz7H4
   4pLmySC0AegilhU6PCyHCZnrm2WsCQmd6/Bnlz/uDhbGpMH3N7ENwcyWX
   2KH161MEhPQoUfNJbKrxP8ViSYiGUo8jQB7msHaeiV6m1lQq5Qc8imhIf
   c=;
X-IPAS-Result: =?us-ascii?q?A0AFAAC7Lm9kmJxdJa1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUAlgRYGAQEBCwGBXFJzAlg9RwOIHYROiSADi1CSFxSBEQNWDwEBAQ0BA?=
 =?us-ascii?q?S4NCQQBAYUGAoVcAiU0CQ4BAgICAQEBAQMCAwEBAQEBAQMBAQUBAQECAQcEF?=
 =?us-ascii?q?AEBAQEBAQEBHhkFDhAnhWgNhgQBAQEBAwERKAYBATcBCwQCAQgRBAEBHxAhB?=
 =?us-ascii?q?wodCAIEAQ0FCBqCXAGCKAMxAwEQo08BgT8CiiR4gTSBAYIIAQEGBAWBSgJDm?=
 =?us-ascii?q?kENgkkDBoFCAYdThUKESCcbQIFNgViCaD6BBYEbQgEBgSY8hBKCLo8tg3qJR?=
 =?us-ascii?q?IEwcoEjgSiBAgIJAhFngQ4IZoFzQAINZAsLbIE7WkOBaQICEUIMEAVdAoEEE?=
 =?us-ascii?q?AETAwcEAoEOEDEHBDcLGAkGCR01LQZdBy8kCRMVUweEKwMKCoEMNwNEHUADC?=
 =?us-ascii?q?zs6PTUGDh8FBCRLgVgEL0KBEwIEASQknXIDhBUMGFBIZS/DXXAKJ4Nhi3uNG?=
 =?us-ascii?q?oF5hicXg3+MaphnC5gDII06g3KWPQIEAgQFAg4BB4FjOoFJCwdwFYMiUhkPj?=
 =?us-ascii?q?iAZg1uBf4MVimVDMgIJAi4CBwsBAQMJi0YBAQ?=
IronPort-PHdr: A9a23:2wKVDB1hz5+lebgvsmDPZ1BlVkEcU/3cJAUZ7N8gk71RN//l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUQwt5Gm1ZHBcA922fFjOuju35D8WFA/4MF9uLeT0BpTVg+y81vu5/NvYZAAbzDa4aKl5e
 Q2/th6Z9tFDmJZrMK831hrPrzNEev8Dw2RuKBPbk0P359y7+9ho9CE4hg==
IronPort-Data: A9a23:b3E2VavLNv+1bb7tNrsJxohbEufnVFNeMUV32f8akzHdYApBsoF/q
 tZmKWuPbP6KZDOjctp/Ptmx/UpTv5PUzddiGQI//yo0Fy5GgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUIYoAQgvA1c8IMsdoUg7wbVh39Q02YTR7z6l4
 LseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3ecldG0DFrrx8RYZWc
 QpsIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbhVq/kQPPqgH2PU0TQB8uRuQgO9L2
 f4RpLeVc1wtAarAl7FIO/VYO3kW0axu4rTLJz20ttaeihCAeHr3yPIoB0YzVWEa0r8oWicVq
 rpJc3ZUM07ra+GemNpXTsF3jcQiMNPsMKsUu2prynfSCvNOrZXrHvmRv4cChmhYasZmA9zFY
 vUfUx1TVDObWx4SGFwaKNEsk7L97pX4W2QI9A3KzUYt2EDU1AF33b3nPdbZd9DPTsJPk26cp
 3na5CL+GhwcOdmVxDaJ/37qgfXA9R4XQ6oIH7G+s/VtmlDWmyoYCQYdUh2wpvzRZlOCt8x3D
 ws/yAQ3spcI5Wf3X/LYZUa8n3mIsUtJMzZPKNES5AaIw6vSxg+WAGkYUzJMAODKUudrHVTGM
 XfUx7vU6SxTXK69Ei3Cq+/Fxd+mEW1Ecj9YPH5soR4tuoG7+OkOYgTzosGP+ZNZY/XvEj32h
 juNtiV72vMYjNUA0OOw+lWvb9OQSnrhE1VdCub/BzLNAuZFiGiNPNbABb/ztq0oEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AA/Q8h8rGzxpyL7Jui8BQ2Swm80bK7onhe0P
 ifuVf95v/e/wVPzN/YsOtLtYyjU5fm9SbwJqcw4nvIXMsQuK2drDQllZFWb2Cj2gVMwnKQkU
 ap3gu7yZUv2/Z9PlWLsL89EiOdD7nlnmQv7G8uhpzz5iuX2WZJgYepfWLd4RrpnvPrsTcS82
 4s3CvZmPD0GDrOuMneOoNZLRb3IRFBiba3LRwVsXrfrCiJtGXoqDLnaxrZJRmCvt/09ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:KvqOfqrNCfmaJZ+gy83mKoIaV5uGL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6K+90cm7K0819fZOkO0s1MSZLXfbUQyTXc1fBOrZsnDd8kjFl9K1up
 0QC5SXhrfLfCNHZKrBkWuF+pMbsaW6GcOT9KjjJhVWPHtXgshbhm8Tanf5LqQ1fng6OXNTLu
 v62iMznUvYRZ1hVLXcOpBqZZmnmzTMrv/bSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkiTij5/T8s2T+1v57Sv+/p5WkNzuxp9oH8qXkPUYLT3ql0KBeJlhYbufpzo4ydvfqGrC0e
 O84CvIDf4Drk85TVvF5ScFHDOQlwrG3kWSi2NwR0GT5/ARCghKUvapzrgpAycxo3BQzO2Ulp
 g7kV5wc/FsfEj9dOOX3amRazh60kWzunYsiugVkjhWVpYfcqZYqcgF8FpSC4poJlOz1GkLKp
 gZMCjn3oceTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuN2d7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDgRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dvf22J6IJzoEUaICbRBFrEmpe4PdIi89vcPHmZw
 ==
X-Talos-CUID: 9a23:fQRz1G3DKA+DzSsCwg0Ow7xfPocOQFPE00jqMmTkGE1McuaRdlic9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3Ax8u7DQ0XH1vnsQlQqU0t7eaOijUj/Y61DX8Lq7I?=
 =?us-ascii?q?6g+7fDS8tGTyQrHelTdpy?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 25 May 2023 09:50:19 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 34P9oIXj026354
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 09:50:18 GMT
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,190,1681171200"; 
   d="scan'";a="1906741"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0Q6BmdGjUx8VqNb2tUtz7zFSy3GgCdoRHyp95sun4DyDcPBJSPV++Zi+6df5HqJydX3ySGmYL7KPYUCJasOm32p2dU/DOnoCEqYr6vvrB81oHkpwEKBg2NWNRFbKjY0Tfc61teaFG2XeVIcIqnLeCVrhEnQoIKQUxrq2oZC9H84TlDDzFOPB4PQDaMIaRCexPZigp71I17RmvHjSgg2DW1mZ3V4G+fYaHlX60ix5Oetkb32w2tfnTG/t+tUY5q0QRiPxcq8CIzK6OVY6coR5Be2GLvQOgQ9I3ampsW9tDhtiNSOU0Pc5Xagdgx1RlUOekfDbBELrvIS25wh41DBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6kdMwPsF+6pmpXtSuEov9mQZndRDiec4ySNXi09Fhw=;
 b=bHDeVYvH7ME2AJZzcv+6G0hwVGySuv4X1P0hzpWwvlZqIB7IdgDXAWtguaC385ct9gCBg4FbX5QfiBvlPuvgCqEOMqKCfqDHqt7oIGdcMezcXbjtBjQApO8F90DBzTGp7wiUz+9TUGyWmHJmu9YXoDED7G31LcstVrxWZrugR3xbQlzZm6smJ0q6QUd4o+fW1EJQl1oquaLgeVkKX7tX1bV8FwF3oLNiluMiHUcl/LL3Vq9VQNkwoF635kQx9yh9yc85JiNhw7zc4yNBTZBp+CY3Smy3b0uJdqegGEkQZKVP1nkb2CmEHI2+cuL+a6ZLJjZYhAEZ7fIxRT4bik2HSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6kdMwPsF+6pmpXtSuEov9mQZndRDiec4ySNXi09Fhw=;
 b=WAfX0YtspIj7NmeVMQQn+SqQSL+JEPl9E37FZoiLR/vnZVEmK1704V0zOkMdQ+FQgp0yC/w1/d0rlsj1LDXMAN1KV6RPH2FTEBP1k+eZUgjpvxEFPaWJntIam6kmgZgnBtOr0y5rtptkmdU5IsYxIVROZ/Tnu2HkEK9SU8U4LuA=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 09:50:16 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 09:50:16 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: Pawan Badganchi <badganchipv@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "nikhilar2410@gmail.com"
	<nikhilar2410@gmail.com>
CC: "ranjitsinh.rathod@kpit.com" <ranjitsinh.rathod@kpit.com>
Subject: RE: [OE-core][dunfell][PATCH] ffmpeg: Fix CVE-2022-48434
Thread-Topic: [OE-core][dunfell][PATCH] ffmpeg: Fix CVE-2022-48434
Thread-Index: AQHZjtQVX0kwpIsWi0+ySWSkqZLnK69quxGw
Date: Thu, 25 May 2023 09:50:09 +0000
Deferred-Delivery: Thu, 25 May 2023 09:49:33 +0000
Message-ID: 
 <SJ0PR11MB6717B892BB899D49A743C60BDC469@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230525064154.22789-1-badganchipv@gmail.com>
In-Reply-To: <20230525064154.22789-1-badganchipv@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|SJ0PR11MB4893:EE_
x-ms-office365-filtering-correlation-id: 52734749-72c9-4605-8de4-08db5d057127
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2oVoHA5iY3AdRJtl+nCqMWP0+Ed9tVDQjU6wEzfetekrHyMUL5L8AFK+2rwhA1dOk5W76dTInPBQsVbedpkgG9FHqpQ3tELzUOLGzVgYJDPDL4I4I8N/f1bwvyqbwAxSkNT9vTBzNWaof9pKWI4iaJLcct+YnZq8auIgbwyrbvZrljuM80wwsP0xkTaG/SB8oeim2Ujq/1IUGQFnC2CYRGwVUNla7yO/t1RGwADN1qI9NU4NUtselCFIy1hHid7ws04StCMrSUjHBEpT190E9NZkOpYq52uYB7DLt2XqjABiVo074INgy+Eq6qlg3OxlaYDGBJ/HFqjkZl1O52lcDDwbIy37iKm37ziOdON47lGvvlAWDKBW/Ob6lJHbEA+BVFGF19PTEQjRXoBaVTfUve4GXwxRtKfJwhfQhr6B1r69TRSYdHfTzI6XRpuRSW1gnizRd4hEtj24vJLDI9oSRmDlBl9Umtk9/hSYXZW/HmryZRhtC53xOifxFjt6mmajAh0GAJA3CKnY8KBkrNflBlilLjcfNby55jDbK5YdmJ6aMUoj7wkHGWnUs6ryboMLtuLmyScjg9bTQUoBBz5KyTKZ8jeGNWGl/UvX0uIu7oihavWHZMOk6ngw5NLUYmlXAiV/8nfG5TmEG5hyPLlONA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(5660300002)(110136005)(478600001)(52536014)(966005)(8676002)(8936002)(41300700001)(7696005)(66899021)(53546011)(9686003)(6506007)(55236004)(26005)(64756008)(66446008)(71200400001)(66556008)(66476007)(4326008)(6666004)(76116006)(316002)(66946007)(186003)(2906002)(83380400001)(38100700002)(122000001)(55016003)(38070700005)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iFAQAxq73bRlzM7mRZCVqQ3jJR0nUr+DqK6iUUrnejqErW9aZcDY8SXolEL1?=
 =?us-ascii?Q?r6LbVf+wQ3glMuKxuDA31aMWOnfoXOgVmLhmHKCtmerqCGu0Hap5J4isgQWf?=
 =?us-ascii?Q?PJmdm6YmUg+xnO7bBISn9yNTr0Bs47o0w8Vz8q1uIuqXF2lg9rt/Y0LjNQMu?=
 =?us-ascii?Q?TglrI/QS2knIoHb5pUwZsarNwKaDVSLRNDExFC1gAj+AVoum4TPu8bOqUm+z?=
 =?us-ascii?Q?P/7BDNpPdwVbkdNvyun+Xmu67IC8/C64G6DYsy0UlFDNTGaIRo6M6JGzcAz8?=
 =?us-ascii?Q?w3TyaQe8ka5iuQtXyUre+pINm5Pon9LToWnky2eHZDY3jIlumiF/iWqDg1zr?=
 =?us-ascii?Q?xu3MNHHQHBdtb1yxly8G+wcQFj74wE5C9hjvCzyWMnfgjooXCvxgoPAnsHgE?=
 =?us-ascii?Q?cLCbp5P3MUZ9qraQJ+ZWtXHYvnTQp/rTfgbFpxQ+gOEr9GohNQtYXw59eQph?=
 =?us-ascii?Q?eaUwQyGz+nAjm9JO/YFhFIvlgjOxMJTskSpcZ2msqOny/qjOWMO+Fl2mlrv3?=
 =?us-ascii?Q?JOCmq0Wl+fGmUb+LywghYDktge4oEPYAAzl1mX1rUy8HVAFU9oGFAQtAgYCd?=
 =?us-ascii?Q?F37eFfjiUG1THEnSDW1ASaGogTa1d8nspub3IF85oehD6gGPZ2YAZBw3zktx?=
 =?us-ascii?Q?YiZFIg3ZJufZbFt9Q597UkXbxGERrHlD1e7S5WCQxn/ZsI8lCp9QKoci0+a9?=
 =?us-ascii?Q?+f5uS8oMqb+ykX1ra7pGhuEp2/9AFjAUZCJcEaoqeGT5bIbDRF31sBqtwN1v?=
 =?us-ascii?Q?gE8rLtwmIZv/yctguW1WMnAjhRhm52DAhJdeTR+2DVCTLu7Q2DtnK9eGHXN4?=
 =?us-ascii?Q?ETgg+dF6y9QqnMnkfmpceRbewXzsFS+CPNekukWhXWQ8EXn5DfBLcREOKKjH?=
 =?us-ascii?Q?9hr4kDf5FFXSN7i1RwgseR78SBBi/wmCK/gF5xnwhdKrFQM2OIcoJ0U3rB3O?=
 =?us-ascii?Q?TfaEvPnG75iinOXQHBUOYrLeg5HFYBBNi6VuTtTn0SEvbAmq5gxF3PdqOIEX?=
 =?us-ascii?Q?cyai2Ph+nvEdZyB5hcSCCqjdt5S1HY4hINu0aC0Bga/NBlDsvIhFYX5/N+ry?=
 =?us-ascii?Q?+Zc13wvm+QRBXobkMxJG1QH8nRdj7mj/T+loS4UqWj0Nd/XWe/V5Ns/IENAT?=
 =?us-ascii?Q?DA5Sr1jxesd+rTRuxF/Vlb/SpzrFqWJFgTK3XuRSKzT5xpOiSu21JI34zKV1?=
 =?us-ascii?Q?QkoifmKhBvw/ZD2liLg+BSpTdeVcY7ZCnx+8n0I+Kz2spGsn2t1v9Kx0WemE?=
 =?us-ascii?Q?1d0ZuyPN1WTfOHkeUyEorYGU0BWoP+eNpTXRVFMI56EM6hQ72bLLf8XJcq2S?=
 =?us-ascii?Q?vfHsTAh+9AtNHwn6VhpSo8I4nZN5o0Lv+KCv7h+dll/PGacQaFmnhbJVlRsj?=
 =?us-ascii?Q?/9YI4frm4VGXa2xsItyhmEYqFI2GemyULOuvazpKRWW4h+zHW7HPOEaeG6sT?=
 =?us-ascii?Q?4P4+dTcLqqIix946g26xXvT1kO/wT9Vy/p00JeaOf2bwGpmpV7EVfSHPopJ2?=
 =?us-ascii?Q?Aw+xjo4XFchO2nL41+20MVpyClJlpuX1TfubgSrRDmIZ22gEnPtk9l3tEMmI?=
 =?us-ascii?Q?IDkb4e/mQZY78bQikrRFtmWZ0YzUP4jntD3tBCoU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52734749-72c9-4605-8de4-08db5d057127
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 09:50:15.7085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HhEijSG722v2/6lwqfAHfFRyfF759pO9E9+rILc+kMXx6uDejrMuD9jOguMHGvM/G4zL2BCIUZCVqDViWZFOVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 09:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181707

Dear Nikhil,

Ideal way is to add all the information before your sign-off like below:

CVE: CVE-2022-48434
Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/=
d4b7b3c03ee2baf0166ce49dff17ec9beff684db]

Comment: Hunk#6 refreshed to backport changes and other to remove patch-fuz=
z warnings

Signed-off-by: Ranjitsinh Rathod ranjitsinh.rathod@kpit.com


It's always advisable that you follow CVE fixing guideline for commit messa=
ge format.
Please find below for your CVE.

ffmpeg: Fix CVE-2022-48434

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-48434
https://ubuntu.com/security/CVE-2022-48434

Upstream patch:
https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d4b7b3c03ee2baf0166ce49dff1=
7ec9beff684db (4.4.x)

Signed-off-by: Nikhil R <nikhilar2410@gmail.com>


Thanks,
Sanjay

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Pawan Badganchi
Sent: Thursday, May 25, 2023 12:12 PM
To: openembedded-core@lists.openembedded.org; nikhilar2410@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH] ffmpeg: Fix CVE-2022-48434

From: Nikhil R <nikhilar2410@gmail.com>

Add a patch to fix CVE-2022-48434 which allows attackers to trigger a use-a=
fter-free and execute arbitrary code in some circumstances

Link: https://ubuntu.com/security/CVE-2022-48434
Link: https://nvd.nist.gov/vuln/detail/CVE-2022-48434

Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
---

