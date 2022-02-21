Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F97C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 10:53:06 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web12.9323.1645440784846768092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 02:53:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport
 header.b=aZExASfS;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6462; q=dns/txt; s=iport;
  t=1645440784; x=1646650384;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=oKRe7R1O0m8J53l2o17LtJiBVoVpYfFIu8HtRjVQTBM=;
  b=aZExASfSe+ENt/dvizZkWWkOkoR5xh8g4RHGRRKq3zxf3du+vZnFjINC
   RnX06TnS0NPJ8LM6S2WFpvqgbZboJFNa+8zFyGEInjijE/WAYZ3gobYyX
   q6rDW7uCgCVCKbkUWyQVrMHOYcvol2mvrIIn9PkAMtli/RvPY7q1NVefe
   k=;
IronPort-PHdr: =?us-ascii?q?A9a23=3AH/HDvhBYPCZ4XaJV+kFxUyQVaBdPi9zP1kY95?=
 =?us-ascii?q?pkmjudIdaKut9TnMVfE7PpgxFnOQc3A6v1ChuaX1sKoWWEJ7Zub9nxXdptKW?=
 =?us-ascii?q?kwJjMwMlFkmB8iIQUTwMP/taXk8G8JPHF9o9n22Kw5bAsH7MlbTuXa1qzUVH?=
 =?us-ascii?q?0aXCA=3D=3D?=
IronPort-Data: =?us-ascii?q?A9a23=3A5ZIEEagyQRkshZeocbRt5Ov3X161oBIKZh0uj?=
 =?us-ascii?q?C45NGQN5FlHY01jehtvDWnVO/6OMWSjLdpwYNu+oUpVuJDSn94wTAFk+C5jH?=
 =?us-ascii?q?ipjpJueD7x1DKtf0wB+jyH7ockOA/w2MrEsF+hpCC+MzvuRGuK59yMkj/nRH?=
 =?us-ascii?q?uOU5NPsY0ideyc1EE/Ntjo78wIJqtYAbemRW2thi/uryyHsEAfNNwpPD44hw?=
 =?us-ascii?q?/nrRCWDExjFkGhwUlQWPZintbJF/pUfJMp3yaqZdxMUTmTId9NWSdovzJnhl?=
 =?us-ascii?q?o/Y1w0mBtXgmbHhfwhbBLXTJgOJzHFRXsBOgDAb+Xd0ifl9ZaFaMBsK49mKt?=
 =?us-ascii?q?4gZJNFlspu6SBsuIrbkk+UGWB4eGCZ7VUFD0O6Wfinj6Z3MlCUqdFOpmZ2CF?=
 =?us-ascii?q?noeOpUV/OtyC2xC+fEUbTsKdB2rg+Ot3Kn9TfFhgMkmJsTnMI4T/HZ6wlnxE?=
 =?us-ascii?q?fctRozCRqLi6tpR3TN2jcdLdcsyzeJxhSFHdh/MZVhEPU0aTcN4l+azjX65e?=
 =?us-ascii?q?DpdwG95bJEfuwD7pDGdGpC3WDYNRuG3eA=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AYELVHarlzhrvcT3dN880E9waV5thLNV00z?=
 =?us-ascii?q?EX/kB9WHVpm5Oj9vxGzc506farslkssSkb6Ky90dq7MAzhHPlOkMcs1NaZLU?=
 =?us-ascii?q?bbUQ6TTL2KgrGSuwEIdxeOk9K1kJ0QDpSWa+eATGSS7/yKmzVQeuxIqLLsnc?=
 =?us-ascii?q?zY5pa9854ud3ARV0gK1XYfNu/vKDwOeOAwP+teKHPz3LsimxOQPVAsKuirDH?=
 =?us-ascii?q?gMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8GDDnQC8zL?=
 =?us-ascii?q?6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZ?=
 =?us-ascii?q?ER4Z/xSiIbToFOArXqDziISFXWqlHdOX0VmgHfIBej8AreSIrCNWkH4w4rv/?=
 =?us-ascii?q?MFTvMfgHBQ5u2UmZg7rF6xrYZYAx/bgSjx0dDUShlhl065pmcVi+IIlXxYVr?=
 =?us-ascii?q?0fZdZq3Pwi1VIQH5EaEC3g7oc7VOFoEcHH/f5TNUiXdnbDowBUsZaRt1kIb1?=
 =?us-ascii?q?+7q3I5y4eoOvlt7QdE5lpdwNZakmYL9Zo7RZUB7+PYMr5wnLULSsMNd6pyCO?=
 =?us-ascii?q?oIXMPyUwX2MF7xGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhNyJcpgpzOXF5RqG?=
 =?us-ascii?q?Z3cUPzDs+F2oFN73n2MSiAdCWoztsb64lyu7X6SrauOSqfSEo2m8/luPkbCt?=
 =?us-ascii?q?2zYYf7BHuXOY6UEYLDI/c94+SlYeghFZA3arxghuoG?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AyBgDrHvlh/5FdJa1agQmBWoFSVgd?=
 =?us-ascii?q?3WjcxiBADhTmFDoMCA4sQkBSBLoElA1QLAQEBDQEBKg0KBAEBhQUCg18CJTQ?=
 =?us-ascii?q?JDgECBAEBARIBAQUBAQECAQYEgQkThWgNhkIBAQEBAwERKAYBAQkBLg8CAQg?=
 =?us-ascii?q?OAwQBAR8QIQcKHQgCBAESCBqCY4JlAy4BDqItAYE6AoofeIEzgQGCCAEBBgQ?=
 =?us-ascii?q?EgQgBLQEDBYNODQuCNwmBOoMOiyUnHIINgViCZz6BBYEcQgQYgUYCg02CLpI?=
 =?us-ascii?q?oAVgzAxQWAYEFEwNrN5JurFFrCiWDIYsBjHCBc4YXFYU9okqWSiCMb4NOkGy?=
 =?us-ascii?q?EeQIEAgQFAg4BAQaBYTwrgS5wFYJwATMJSBkPkhGFFFGEeXQCNgIGCwEBAwm?=
 =?us-ascii?q?NTAEB?=
X-IronPort-AV: E=Sophos;i="5.88,333,1635206400";
   d="scan'208";a="997940973"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 21 Feb 2022 10:53:03 +0000
Received: from mail.cisco.com (xbe-rcd-005.cisco.com [173.37.102.20])
	by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 21LAr1CT032208
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Mon, 21 Feb 2022 10:53:02 GMT
Received: from xfe-rtp-002.cisco.com (64.101.210.232) by xbe-rcd-005.cisco.com
 (173.37.102.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 21 Feb
 2022 04:53:01 -0600
Received: from xfe-aln-005.cisco.com (173.37.135.125) by xfe-rtp-002.cisco.com
 (64.101.210.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 21 Feb
 2022 05:53:00 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-005.cisco.com (173.37.135.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14
 via Frontend Transport; Mon, 21 Feb 2022 04:53:00 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXBRoPQ7PxOxS7+kbp6CFgMSeeXeNdkffrKE55s+nLMftiE9o9m/rDja2Puq8zeL/KL7MTdHHXbzp2FYn+a6k702P+HlVU8De6cNKyD72IywEc2bZSfDlByXl6qfcBWecimxKSLPpbLjYUgaK7q3kx/xq1Bggn16vxFLlSkCaBvBjZcb4uaECeEUBBLgYPUrve2bNA6Wde3cffXZAcqi2NDxbjvRl6bB1+BL8DA7ZOuQA18yGC8wd9zo1v2pRm/Q0+33yhSx52z+CSkOQIt7ct5JNxWpxXOia2pojJ1SieZg2c7WMZIWAbFNCfl5ArpDFJ0nby8Jk/WmSJR1ebKmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgPNI2gkXzAOddq0OOm6Lg5+5/Hh7Ju/nqsjAnD7SZ8=;
 b=hsmeJtVzadQ/g310JFxD2DRL8UxL0Zg0Sy5g4U/1843bUg72Er6epBAoU+YkJ4ROTQ0NkMNEyjUmuwJ8hpPzXGnxQ9v8EZtJ0JXsM+qmZibwkqtbClw8wTrV3qWZIzsbGLeQLyuUhrmztfluKP2bowmwQccoHfRsRTb2oE+oTRSukTMsFqO07Kzz6v8bnoAi/k4nqXUMYincMxI+GCI7z1/Rfqx3uFUy4w3iHzu9UsJirSa6Mj9uaxZcK8UUOD9cP2M1umzKx3Wh7hNDVxdJKLJ/tOTYb4FCNkgLv8EtIVuy/hiby0BiFNN45/ZBpQZvlPkjbWSOfzJEb1a2+dbWUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgPNI2gkXzAOddq0OOm6Lg5+5/Hh7Ju/nqsjAnD7SZ8=;
 b=BLR/rkMSoZloT+u/RtUrXL+iH0TaaXhp/EgxR76GPCRi2sKtK4YkgIAHBgUSPH45eOtoKzesaSLBIjgrv1gpzno+H5WgC3rpBC6HKS97sRLl9gFrnOrYJj1OuKdHAnsDpYiWimhGhjyJtRSszj6gnbuBDaW9YQ/JjGPRM5ff6nE=
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by BN6PR11MB3971.namprd11.prod.outlook.com (2603:10b6:405:7d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Mon, 21 Feb
 2022 10:52:59 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::172:f6d4:6bc1:a99c]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::172:f6d4:6bc1:a99c%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 10:52:59 +0000
From: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Tim Orling <ticotimo@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 00/19] Python PEP-517: build wheels and installw
 with pip
Thread-Topic: [OE-core] [PATCH 00/19] Python PEP-517: build wheels and
 installw with pip
Thread-Index: AQHYJsJHhlZENrx59kK8Nh4MkU9NOqyd01ro
Date: Mon, 21 Feb 2022 10:52:58 +0000
Message-ID: 
 <PH0PR11MB4902E3249E580C9D2002BBC1D73A9@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 145d2794-72f3-4c47-054e-a1e5d9e62280
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b95e5e6c-7e3f-4da4-68cc-08d9f5285311
x-ms-traffictypediagnostic: BN6PR11MB3971:EE_
x-microsoft-antispam-prvs: 
 <BN6PR11MB3971FECF38D9D5048D4E71E2D73A9@BN6PR11MB3971.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9MDDVFyxwWA5beTHRvjjRCfEiqxywap/UzYprhv93rU3gBu1Trf9wmMZ6bZqNYh3dUxsbnvT6MHdvZ447pL6LszbryIO3iviT6Y75Xmz276YBOBjH3HXSY8s17hKqO9qefZFtlIGgMOrKISUDtlLK3rzcJRMIuZA6w+KpL0Uc9Xj5O65A5Ex63fVEjBsQJNOmqUCy2ioyi74mIKjf3e63pSVxghhPQAqvlT/kpwyv2LdIns4EHDQvUwlkl+17Pcj6FvbI8hBzKIbRUPuGPj/id8f2hgFWTxDhhamcvMY/s/EHLy+8vA47q8FozVQJWTpQ1X03iVpU5yTW/M1pyxldJ0i0+uXaSFLf3ifG8aycLVp1Dg/JVuESW+uGJqLiO3Rny2UpBv91M4U1hZwB1Kh6q0vZz5inu66KZuizBlDBTjU/6yGLwBzq99EYv7sioeBtlcj8uH0vDH+SxPlWRsJ9wfppnGnPpAZSjl2N8wYq9YVYjQLJW5BGVo31BfLOro7y26CM5RKkVSJ0FMrulmQA86rjJ+yhz0TETxKXpca+PpbpNz2ZmkRnT5OUelQ7L+vWZewkHHv+SBVFI0qJ7DVr2JFV2fYkkxUpaZFOw5ii89xY1L+fWF19dpWiQPXaNcHKu6G8kP8jhFLnI6m4LL8+CLHj28MdOUpSiO5luUaxJXDkglRCxO0s/Tjg9xKe4r+VbKKw7jnXn8PCpwhsSVx0SpSVAU6qrKX4xPnTs59j3jMT7CZ6/Baj6bVWVpoZJSclbOtuGy3RVgGEaZnvk1upQYHFESbNPZGGo3OOHo9P4c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(9686003)(6506007)(64756008)(508600001)(66946007)(7696005)(110136005)(5660300002)(316002)(71200400001)(76116006)(66556008)(66476007)(66446008)(33656002)(966005)(91956017)(186003)(26005)(83380400001)(52536014)(8676002)(8936002)(38100700002)(2906002)(55016003)(122000001)(53546011)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hMV0F07/e4AsGmP6p9wd/eNnE3MBjiv0iRw+/lM+62dt/RfwbwA4z2ffn3tE?=
 =?us-ascii?Q?TAL84qEK3GzIt4NoU4NWx4/qJU6q8BwndSrsgkxFuKIml9L4a62IClXs8Vky?=
 =?us-ascii?Q?v2Z5skzItAa778xSESW6h02L7xEHK48kudvIWWFYnHeU3IKRmBVLsnwGDJQm?=
 =?us-ascii?Q?ToU/l11yGfyT0ieEMBeSPQYMZOcTwG1856NmW8D0HUU67jyHGVOncgxV4V7Y?=
 =?us-ascii?Q?FgxBAHXcsEpt5oO4v4akaAW4nfRiQ5V4SpRJ6LYe/JQJOEHG4xdR5ZzsuEvX?=
 =?us-ascii?Q?u+8rdjcACGt+lrMtu3jKgZLP24TjnhrQjjfNscu1lkz5SrXXtFP6Hod+cTCi?=
 =?us-ascii?Q?rfh5Y7IQQrQjlLhSdt4eV2WCCDfcLOYurZy6IoXG7cN4mp37tbnUdb+UrjLk?=
 =?us-ascii?Q?9O6k0srFiKDtjFNGo5Mp22MuxFGKM8X4zGKW4RG2hfQ52zeDg7vabMHsYH+Z?=
 =?us-ascii?Q?+Du8nsvdsvsGTIO7aMXew3EoKoHDr+zsf5NQJJLcy+5ZdaQiufOT2KGyw5EV?=
 =?us-ascii?Q?zuTxJY/ADW4hcE4N7VEvad3/EjiWcZDltXZ99MV34/p0bYPUSkzf91RLDZr2?=
 =?us-ascii?Q?sur4K7s5S1CV+QtXxd/kh5JVXzDblJJmTuin+j9gHPkYoSX4OI2IHxM4YLG9?=
 =?us-ascii?Q?dhdHnwbfp8H+nuqCkxtn3QIwaso1IDN6etxpW14JudBg0EAZQkmc4Tixt1l7?=
 =?us-ascii?Q?SChn9Hy+fUT+QDUYB3/XprcE7DR2V9orpuwaobklMQdPb62yYXl0mgzhmAq7?=
 =?us-ascii?Q?5lQa9BtNKsnc8r8EQ7AapiHV/wjFwJ8pF/CnpB5ROmxifIuWSP/FOHI8sIgj?=
 =?us-ascii?Q?BkVomzLRtQLb5RdmTPxpak+0oYkRynOmq22dNqAGzHUrlZh2h6/Ix+TiAb6G?=
 =?us-ascii?Q?6SzAR7CTjW0whS55G1DNbze6Caj3uik2V9kfNxHwdWqTedL4NBQ5qjwUQHyB?=
 =?us-ascii?Q?sPf1k9ZmFQI28xIadXIktSLPGLGYQCTjwL+GWJFnTRMJEJXEDZ70HoZx9SOL?=
 =?us-ascii?Q?o73e2tlkE4Jb1myxDROfN8VPWK3VNc8X1UN8h6uw49fbvYllMiH581Q1uLGy?=
 =?us-ascii?Q?GhOJg4rv+HCZFkwZxeKI+9HGm1M7YnyeWm2irD1OvHIFIgAqTzdNNlpBHUYZ?=
 =?us-ascii?Q?NhUlN7SkN/yvn+IiX5zxjCH4PUrRiRkuys3rkbyLGrOuqzAFHrUaz+GNkKqa?=
 =?us-ascii?Q?jAqMzT0kazdM6JDzW5ircOAKe69RrqL2yijmS3QEJuGGTg7+LwSz1gwja+xn?=
 =?us-ascii?Q?b3FGA0LIUXBpUjmW0VKtIcAfzlr6i/qIgFoZEDfyPPALm1MUKbzLMuHKLYbX?=
 =?us-ascii?Q?B0SQNZMPk6pXKzexfimL5LwgXwAnkIqBJa3Lz2Fo5EL34FnFlrDIAhH4VS94?=
 =?us-ascii?Q?rr9QusDJol96BPbKjcGaYPbvzpPqmOYm147TUqZLT/Eet0VizWiVmwe/rR3t?=
 =?us-ascii?Q?3A3Gouu9heSkdnoZlOt9cdsXJPremZDY7bAev4rYm5P2/pBhfrIYkEgQgyEY?=
 =?us-ascii?Q?bbI6z71twmB3QVDRYjb7kz3QENDxrBSKz49P9A/RZXbTMCYqd/2HJ4lteFh9?=
 =?us-ascii?Q?Mw8AYFH4WWUrPIiNy5C9IfXAk8dG88rbQ81NpIvRfcEVN6abvEsKiBY0pO/1?=
 =?us-ascii?Q?Cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b95e5e6c-7e3f-4da4-68cc-08d9f5285311
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 10:52:58.9689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 s4xtq0vxQp8o3Lz86OwBEIE3WZAstDORr1T7D/YCDWDHqmYp09YX9De+5p7NuFUv+NK0B6JvrzKL2zutc7BpWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3971
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.20, xbe-rcd-005.cisco.com
X-Outbound-Node: rcdn-core-9.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 10:53:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162023

Hi,

Seems that python changes cause build fail https://swatbot.yoctoproject.org=
/collection/6991/

Regards,
Oleksiy

________________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Tim Orling <ticotimo@gmail.com>
Sent: Monday, February 21, 2022 03:27
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 00/19] Python PEP-517: build wheels and installw =
with pip

Upstream Python is moving to pyproject.toml rather than setup.py and
wheels rather than eggs. The main place this is documented is in
PEP-517[1]. Installing packages with setup.py install is deprecated.

We have a choice with the 'kirkstone' LTS release of introducing this
series (and fixing any fall out during the stabilization period) or
living with deprecated Python packaging for the duration of the LTS (at
a minimum 2 years). This seems to be a compelling enough reason to bring
in this series, even if it results in a slight slip of the 'feature
freeze', which is officially tomorrow, Monday 21 Feb, 2022.

This series bootstraps python3-setuptools-native,
python3-flit-core-native, python3-wheel-native and python3-pip-native,
simply unzipping the wheel into PYTHON_SITEPACKAGES_DIR. This allows all
other recipes to be installed with pip, as intended by upstream.

Three new classes are introduced:
(1) flit_core which builds PEP-517 compliant packages which use
    flit_core.buildapi as their build-backend.
(2) setuptools_build_meta which builds PEP-517 compliant packages which use
    setuptools_build_meta  as their build-backend.
(3) pip_install_wheel, which simply installs wheels built by other
    classes.

The original setuptools3.bbclass do_compile is modified to
'setup.py bdist_wheel' (from python3-wheel-native) rather than the deprecat=
ed
'setup.py build' mechanism.

The original setuptools3.bbclass do_install is modified to
use the pip_install_wheel.bbclass to install wheels with pip rather than
the deprecated 'setup.py install' mechanism.

For pip install, we disable dependency checking (--no-deps) because it
proves to be brittle in our environment without providing full wheel
cache that seems like overhead that we do not need. We also disable
fetching wheels from pypi (--no-index). This is no different than our
normal workflow of requiring dependencies to be defined in a recipe.

Missing from this series is documentation of the new features, classes
and variables (this will be done under separate cover).

Also desired and previously discussed in YP meetings is a helper
function to warn that a recipe which currently inherits setuptools3
but has a pyproject.toml and defines a build-system.build-backend should
instead use of the new PEP-517 classes. This function is still in progress.

During testing, recipes which use python3-setuptools-scm are failing to
determine the version of the python package, For several recipes, the fix
was to use pyproject.toml and PEP-517 build backends. To be sure, other rec=
ipes
are still going to fail for the short term, until the root cause can be
determined.

Another PEP-517 build-backend, poetry.core.masonry.api has been
identified in recipes in meta-python, but not in oe-core. The
python3-poetry-core recipe is WIP, but brings in a number of
dependencies that are perhaps not worth it to bring into oe-core at this
time. Rather we can support these recipes in meta-python?

[YOCTO #14638]

[1] https://www.python.org/dev/peps/pep-0517/

The following changes since commit 0539b563c6f41fef383429a13c28bf918231d404=
:

  libhandy: Use upstream regex to check version of upgrade. (2022-02-20 16:=
45:25 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/git/poky-contrib timo/bootstrap-wheels
  http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=3Dtimo/boots=
trap-wheels

Tim Orling (19):
  python3-wheel: move 0.37.0 from meta-python
  python3-flit-core: add recipe for 3.6.0
  python3-flit-core: simplify
  flit_core.bbclass: add helper for newer python packaging
  python3-wheel: inherit flit_core
  pip_install_wheel.bbclass: add helper class
  setuptools_build_meta.bbclass: add helper class
  python3-pip: inherit setuptools_build_meta
  python3-attrs: inherit setuptools_build_meta
  python3-git: inherit setuptools_build_meta
  python3-pytest: inherit setuptools_build_meta
  python3-setuptools-scm: inherit setuptools_build_meta
  python3-zipp: inherit setuptools_build_meta
  python3-iniconfig: inherit setuptools_build_meta
  python3-py: inherit setuptools_build_meta
  python3-pluggy: inherit setuptools_build_meta
  python3-setuptools: inherit setuptools_base_meta
  setuptools3.bbclass: refactor for wheels
  python3-more-itertools: set PIP_INSTALL_PACKAGE

 meta/classes/flit_core.bbclass                |  16 +++
 meta/classes/pip_install_wheel.bbclass        |  18 ++++
 meta/classes/setuptools3.bbclass              |  20 ++--
 meta/classes/setuptools_build_meta.bbclass    |  18 ++++
 .../python/python3-attrs_21.4.0.bb            |   2 +-
 .../python/python3-flit-core_3.6.0.bb         |  41 +++++++
 .../python/python3-git_3.1.26.bb              |   2 +-
 .../python/python3-iniconfig_1.1.1.bb         |   4 +-
 .../python/python3-more-itertools_8.12.0.bb   |   2 +
 .../python/python3-pip_22.0.3.bb              |  19 +++-
 .../python/python3-pluggy_1.0.0.bb            |   2 +-
 .../python/python3-py_1.11.0.bb               |   2 +-
 .../python/python3-pytest_7.0.1.bb            |   4 +-
 .../python/python3-setuptools-scm_6.4.2.bb    |   2 +-
 .../python/python3-setuptools_59.5.0.bb       |  19 +++-
 ...roject.toml-from-flit-backend-branch.patch | 100 ++++++++++++++++++
 .../python/python3-wheel_0.37.1.bb            |  24 +++++
 .../python/python3-zipp_3.7.0.bb              |   2 +-
 18 files changed, 269 insertions(+), 28 deletions(-)
 create mode 100644 meta/classes/flit_core.bbclass
 create mode 100644 meta/classes/pip_install_wheel.bbclass
 create mode 100644 meta/classes/setuptools_build_meta.bbclass
 create mode 100644 meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Backpor=
t-pyproject.toml-from-flit-backend-branch.patch
 create mode 100644 meta/recipes-devtools/python/python3-wheel_0.37.1.bb

--
2.30.2


