Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C51C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 08:11:04 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web10.30534.1640247063457919715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 00:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=GDQIRwq1;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2631; q=dns/txt; s=iport;
  t=1640247063; x=1641456663;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Jafp+EsZxV/nmUDTz1CvrrjxKCF2vnV1/fZ6GcDC6RI=;
  b=GDQIRwq1FMxCG42biouuRO0glRHLkb1tUXnLoxLFt0R6SvgTZDVx4+WO
   ZmGC22gwNcT74Pw/j+efvlEzfX1E1IVPaYZIoORDNzvwFS1npBfVv6+Kv
   Px73DVh3eI6gJhtdbuJDFk/Jrn1VSYGTL2sXWYMJhB1VhxANACV9c0gyz
   A=;
IronPort-PHdr: =?us-ascii?q?A9a23=3Ae2INfhKRSIGSB2e6BdmcuWEyDhhOgF28FgIW6?=
 =?us-ascii?q?59yjbVIf+zj+pn5J0XQ6L1ri0OBRoTU7f9Iyo+0+6DtUGAN+9CN5XYFdpEfW?=
 =?us-ascii?q?xoMk85DmQsmDYaMAlH6K/i/aSs8EYxCWVZp8mv9P1JSHZP1ZkbZpTu56jtBc?=
 =?us-ascii?q?ig=3D?=
IronPort-Data: =?us-ascii?q?A9a23=3A1kpgkK7u5ItitoWYno9f3wxRtOvFchMFZxGqf?=
 =?us-ascii?q?qrLsTDasY5as4F+vmRKUTuHafzZa2rweoogYYvj9xkAup/Vxt5lTARvpSAxZ?=
 =?us-ascii?q?n8b8sCt6fZ1gavT04J+FiBIJa5ex512huLocYZkHhcwmj/3auK49CMmjvnRL?=
 =?us-ascii?q?lbBILes1h5ZFFcMpBgJ0XqPq8Zh6mJZqYDR7zGl4LsekOWHULOR4AOYB0pPg?=
 =?us-ascii?q?061RLyDi9yp0N8QlgRWifmmJzYynVFNZH4UDfnZw3cV3uBp8uCGq+brlNlV/?=
 =?us-ascii?q?0vD9BsrT9iiiLu+KAsBQ6XZOk6FjX8+t6qK20cZ4HdtlPdgcqNBMi+7iB3R9?=
 =?us-ascii?q?zx14NJKv52sThsyFqbNg+8aFRJfFkmSOIUXp+GffCng6Zb7I0ruNiGEL+9VJ?=
 =?us-ascii?q?EYuMIsV/+x6DW1D+bkTLyoARhSCnP6thrWjR+9hg84uIMXmMMUYoH4I5SvYB?=
 =?us-ascii?q?vYvW5yFW7jQ6d5V9DMxgN1eE/HDYcYQdTtoalLHeRInB7u9IPrSh8+yjXX5N?=
 =?us-ascii?q?jZfsl/Q/+w84nPYy0p6172FDTYcQfTSLe09o6pSjjubl4ghPiwnCQ=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AxaeJv6oL27YAVx17tFkym2saV5trLNV00z?=
 =?us-ascii?q?EX/kB9WHVpm5Oj9vxGzc506farslkssSkb6Ky90dq7MAzhHPlOkMgs1NaZLU?=
 =?us-ascii?q?fbUQ6TTL2KgrGSuwEIdxeOk9K1kJ0QDpSWa+eATWSS7/yKmzVQeuxIqLLsnc?=
 =?us-ascii?q?zY5pa9854ud3ARV0gK1XYfNu/vKDwOeOAwP+teKHPz3LsimxOQPVAsKuirDH?=
 =?us-ascii?q?gMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlul9yZbdwkK7aYp8GDDnQC8zL?=
 =?us-ascii?q?6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4oow3TX+0OVjbZaKvq/VQMO0aeSAZ?=
 =?us-ascii?q?ER4YDxSiIbToBOArXqDzmISFXWqlLdOX0VmgHfIBej8AreSIrCNWgH4w4rv/?=
 =?us-ascii?q?METvMfgHBQ4e2UmZg7rF6xrYZYAx/bgSjx0dDUShlhl065pmcVi+IIlXxYVr?=
 =?us-ascii?q?0fZdZq3Pwi1VIQH5EaEC3g7oc7VOFoEcHH/f5TNUiXdnbDowBUsZGRt1kIb1?=
 =?us-ascii?q?y7q3I5y4aoOvlt7QdE5lpdwNZakmYL9Zo7RZUB7+PYMr5wnLULSsMNd6pyCO?=
 =?us-ascii?q?oIXMPyUwX2MF3xGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhNyJcpgpzOXF5RqG?=
 =?us-ascii?q?Z3cUPzDs+F2oFN73n2MSmAdCWoztsb64lyu7X6SrauOSqfSEo2m8/luPkbCt?=
 =?us-ascii?q?2zYYf6BHuXOY6rEYLDI/c94+TOYeglFZBFarxmhj8SYSP7nv72?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BZBgCyLsRh/5ldJa1aHgEBCxIMQIF?=
 =?us-ascii?q?OC4FSVQd4WjcYGYgOA4U5hQ5dgiibHoEugSUDVAsBAQENAQEqBxAEAQGFBgK?=
 =?us-ascii?q?DNwIlNAkOAQIEAQEBEgEBBQEBAQIBBgSBCROFaA2GQgEBAQEDAREoBgEBOA8?=
 =?us-ascii?q?CAQgRBAEBAR4QKAodCAIEEwgTB4JdgmUDLwGkNAGBOgKKH3iBM4EBgggBAQY?=
 =?us-ascii?q?EBIULGII1CYE6gw6LJCccgg2BWIIwNz6CTBcEAYFdAoNNgi6SMYEPJA0VgUT?=
 =?us-ascii?q?AWAolgx2KcoxqiAYVhTqiLpY2picCBAIEBQIOAQEGgWE7gVlwFTuCaQlIGQ+?=
 =?us-ascii?q?OIINyhRRRhHl0AjYCBgsBAQMJkSMBAQ?=
X-IronPort-AV: E=Sophos;i="5.88,228,1635206400";
   d="scan'208";a="976059702"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 23 Dec 2021 08:11:00 +0000
Received: from mail.cisco.com (xbe-rcd-004.cisco.com [173.37.102.19])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 1BN8B0hB026875
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Thu, 23 Dec 2021 08:11:00 GMT
Received: from xfe-aln-003.cisco.com (173.37.135.123) by xbe-rcd-004.cisco.com
 (173.37.102.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Thu, 23 Dec
 2021 02:11:00 -0600
Received: from xfe-rtp-001.cisco.com (64.101.210.231) by xfe-aln-003.cisco.com
 (173.37.135.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Thu, 23 Dec
 2021 02:11:00 -0600
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (64.101.32.56) by
 xfe-rtp-001.cisco.com (64.101.210.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14
 via Frontend Transport; Thu, 23 Dec 2021 03:11:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgwtwIXHL3H/RK3CNm7fi/sBU4Dmi/hnk+TpkMADHRpflWe63984Rx8qIzd28SFLmrNczXR7Fyri/KJStEiHBf/o7KCVJ+q0OeSVCd13SjW5v7jOaPB7BOdrQmSdalaerP/zuAVQ0czEcJVlhpRIjC0a724pOQeJCC/28v5oczNpp3ha8x+JNiU8MhrXeYY/4iSLyjxACQEMBZTwtQa9RcHvd4UQMf75u5nxoWJKdh+ADHKRxGd3fzhpM6G1ivEljW5Tjhe6BITfj6XUzHxYEjTYY2XEmtmZKEoKF8jTedQNIbVm6MLz1CuQBGbdSjxr4OKgUDTCk1+nRUPKwNmMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEunpVvgpvAJ2HlNuDtrWamunvHBHaJpMmo4bprdxJI=;
 b=jodZMcsMwP1QmB9Lkt6nZNVHwcHaAHyH3WQ8gDej2/Y6wCRUDikiY4+9bo+gggST9gMQ7cgGu6CVMTq8kvshv7ocFjlDlEpd7Z20j3+AmirlQ/pRPRQS5d+PCgtq8a1hpnBsI6TTMHrHyCwvR1MWiKVTmJtUKESRn1+LGOWJYcCYlEhtFirCMEQ3BsRHTdIsXDChabtzLBuQZswPOUW2TNakm31cIoecKDJUc03ntYm1qDMa4nXetqgQvsG3mqdacmG8W5b84+v6fQ71g+xAGpGpovtd2c7q8j2DIaMDQjKDDMSXcFj44gEehmRTgHVPI+NKWWZgT5/eQAEdkKNPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEunpVvgpvAJ2HlNuDtrWamunvHBHaJpMmo4bprdxJI=;
 b=HKrdIuRE4JNmcUJdRQZxpdb4Cl1R2CD3ilvSixdOiE2qhq0FuKrbnfglw4lxKJwU/+urt6xHhjtmY2w5LL2MMKhL/83u4gf5I3zsi4TIwu8tKivgnRSv06tI2Lk7j3yqcXper0jHOfJrwuZknyZDuPsIMSM6fGcYFmoZ+Ecr1y8=
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by PH7PR11MB5864.namprd11.prod.outlook.com (2603:10b6:510:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 23 Dec
 2021 08:10:59 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::e877:cc5e:1c4:ee3b]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::e877:cc5e:1c4:ee3b%6]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 08:10:59 +0000
From: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Patches and
 discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>,
        "Oleksiy Obitotskyi -X (oobitots
 - GLOBALLOGIC INC at Cisco)" <oobitots@cisco.com>
Subject: Re: [OE-core] Manifest for host (nativesdk) is empty
Thread-Topic: [OE-core] Manifest for host (nativesdk) is empty
Thread-Index: AQHX9NActaQNxm/lbES9g5XUwf15LKw7PXyAgAGfhRCAAuEm+w==
Date: Thu, 23 Dec 2021 08:10:59 +0000
Message-ID: 
 <PH0PR11MB49028B6FA7B7F297E7C68B60D77E9@PH0PR11MB4902.namprd11.prod.outlook.com>
References: 
 <PH0PR11MB490252E71EAA39C3EAF277ACD77A9@PH0PR11MB4902.namprd11.prod.outlook.com>
 <35ef1b81e16d9319a9696beb3f590c6087622be7.camel@linuxfoundation.org>
 <16C2C3E6A22467AA.15364@lists.openembedded.org>
In-Reply-To: <16C2C3E6A22467AA.15364@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 227a8dc8-bacc-95ac-50cf-310e33fb799b
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2f56c9a-dfa0-436b-60d5-08d9c5ebc0cc
x-ms-traffictypediagnostic: PH7PR11MB5864:EE_
x-microsoft-antispam-prvs: 
 <PH7PR11MB5864BD3FB1B228BDF7EE3B37D77E9@PH7PR11MB5864.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pT6AeWxPTgKgIWTl4HuTL8kmBV08mxbkoXdIzThchOZ7AGUp5M0aSimoUZzj4sgnlXVtBP99k6QdP+3oliCVWS9jrwSBU7KPCXRVwVSGu3QLuJHeH10+139EKikFrLcdk0/56xQFGUjZ3mmaYAWV0i/iZc30I04Sem4ix9ZfhQJqvwX7TEonyRZmtQwvOtTr4GuPT0kqwoa7zq+9+ispYDkw1//1OujRobmRahVZA5XgCXEHaEGdPkXQYIB1kwkUwbRD6E07bGjhyxKnuFZbqU8AfaHOowfF9lR3EXXwuHIDPC1G3wwGup2vZCXy8jFrQLEUsHx1e+n94A9U+Gr2+cO2NXO7tTZEuMTfsWkPkdodRhKTLD+o5VMwpaEzBw7tuRLEL+7WXOfnI2MhKKPdXaXMtdg+k16X0XC1nnYJYYB2nctpL9yRSfG96vztQz3+WLSl3j2Xyd6J0Wv6jQj5p2UzLE1mXeFcjOZrUBXcccLCN3OcYkCfX2Vkn+gvcCvmgIWi/Le0tuXimqCeeJNQgnxd9AtC2J5eC7acoheg+nTz9GCRQ4z1MiCTXzyNyR/JCZ3AYFp/9iru+F2xK4maIGZX+MI6fRmMDG1rbvONDITAoI9ftsfyw8b8lBHR2A73SBhMCrNbAaGuy7vXMvRHdF2QogRkv0O03WnGklhiwYNNv78DDx2FycMZBuPayHk05ThczFjDjXndx8yckw+SqQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7696005)(508600001)(8936002)(66446008)(91956017)(66476007)(66556008)(186003)(53546011)(76116006)(66946007)(52536014)(110136005)(4001150100001)(8676002)(64756008)(26005)(316002)(55016003)(38070700005)(38100700002)(86362001)(122000001)(33656002)(6506007)(5660300002)(2906002)(71200400001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?U2Vyp5Ap4gqyt0GnhjP2OcoKTfTglTu0Ru2yUc6JfqInBf6+2RknXlDlpJnt?=
 =?us-ascii?Q?1fdWy9l2jCdDhFsoyX8p1z7F+jqjTElSv4VjcGrC3gdvl2zrwI7qQhV0CmsZ?=
 =?us-ascii?Q?f6WWRNj2Pg5DlOLuUPcqF3fF9vnr6SUL1XnO34+KtwfGCQL4o5V3SKo5RNQt?=
 =?us-ascii?Q?4Aklv3qlyni2yqO3ZJ7sZrA1y2Csct/e/KNRj3UNBtkduo3YPhBnNvVdE3V8?=
 =?us-ascii?Q?SG1QR/KVwM4SUnhbGSe2qp3hHM2UCC0hVip8amJapI9fOt6hTZRrTXFGpY19?=
 =?us-ascii?Q?6gqx3jpLTPwL8gVX2wPww9Y7pt258Ltbghk9dEpl3H3G9zl2wwTOwAn8jiHn?=
 =?us-ascii?Q?LUy+6pjy4nTYCPdIElMO8emqZL93YUg/EgQiVpLYqxUAsjkJKN0rBMwLShTc?=
 =?us-ascii?Q?cGt9OpNpHA2xdtnIZxmww701lR/7g7gKYwWQvG8tiaZ9rS+cIkINJ13+C/OS?=
 =?us-ascii?Q?uSp8tDR4nwntkbZzQIZ3hsLoUGaSXIEjgvaZeeJSz6DhNzmuHz0l23bSZtq9?=
 =?us-ascii?Q?DZfxuTVG07FsxjAyVqQJQET9x9TkqKmxQMxYy6W7doWzMNh1p4oFR/N5S8hN?=
 =?us-ascii?Q?nxEDw21ZsASjqRs7IfsKWhNxGPzH0+yucSp0bLiXzETanQWA/1oy/elwcdJ3?=
 =?us-ascii?Q?v6gYPGMLBM9sAw0ucRhs6moyMjQqJMXS6ZoQJROsl7TRvpaUgu2l49Y3VIPa?=
 =?us-ascii?Q?FQg+2zWOr/ChDEHie9to/YYx/aRjUOArzM6kFAJD6h4lZHhh46xfjO2kyy6d?=
 =?us-ascii?Q?1+pxu6ACrq5Oc2kXgrXkJcL9nytvqJtBMYa3dyrDAOrwj0CKOvJyAkomJJmU?=
 =?us-ascii?Q?kjh7T51RnJ1jtOO3gc379IpGMs+nWBV6g1H4V9CyebYWCfehmaUGWjL981mP?=
 =?us-ascii?Q?0V2hPKqY3PbiAwqTsRp2qn226Uppgvnvqlh5gl02uOVlwk4W/noiJOO9DI0w?=
 =?us-ascii?Q?hd0yHmjgh/Vb4Bvd3zzpFjwhnhfev0VgliKdakD+a1FHjiV+7j0ePSRt3qJB?=
 =?us-ascii?Q?Ka3FRwKD4Crlu2V+uscGjLb2WjugR3hxU3D17SP0yjjrA9ifpSKK0ojwEoUW?=
 =?us-ascii?Q?/rQfoaAxbMRag+Mavz5qtR3Ak5ZShpNv9dweFqPe6w904sxFIQSTAaDWZGvk?=
 =?us-ascii?Q?nfC+1e6a4NlDMiyuSdkiBH89CjsGse5MnCI1aFQIGbrYyXQxFVdSfPUi9n3z?=
 =?us-ascii?Q?aqvWR7lzeoWVcdUquDsstk4KDue0dX0vrLyF8wrpfkNCMommIl4GQQBm3oVi?=
 =?us-ascii?Q?MgEavJNi8tlYvcz1ppjkT+RdV2LB3Q3PGbCltQbbv8JS2WCT0H+7pJqFzw14?=
 =?us-ascii?Q?Z7gg16lRtEOfnV6GQPgY+aZReb0d8OZ+wNktXlFd82fh3cfKgKlM/d84F+32?=
 =?us-ascii?Q?exHP1if2aYsQ2BMhvHOcV1Wizj9AFbOrnpDnkkfpvOS22Z8AfecSu5WQ9LkX?=
 =?us-ascii?Q?0fyhvMmbtqLsOrFKy4Ob+NsqWMZ15YuAUj21jNPHRyJfVfnK2tixIRfHTVyI?=
 =?us-ascii?Q?JhzZ//cStytoj/HydyaCnunrX7Ff2towSyF+DG4nRPg9HwngkBuUTWOawOwg?=
 =?us-ascii?Q?9fWkgBnrXzr8Yb9gN/QGz6mikHTIR9dBUoLoGgH8e9P/STUrNpSYU6dhiYJu?=
 =?us-ascii?Q?Rg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d2f56c9a-dfa0-436b-60d5-08d9c5ebc0cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 08:10:59.0835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Ha+MkCY9gBQLQ6CgsMB8awnpGVlVDb7EG9xzbdTS9KNoGfBBw5i2MEFjH5rk06UpOvKmO82k9ZGjpSFdakLP1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5864
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.19, xbe-rcd-004.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 08:11:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159970

After further investigation we realized that this change fix host but affec=
ts target manifest.
Proposed solution is not ok for now.

Regards,
Oleksiy

________________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Oleksiy Obitotskyy via lists.openembedded.org <=
oobitots=3Dcisco.com@lists.openembedded.org>
Sent: Tuesday, December 21, 2021 14:10
To: Richard Purdie; Patches and discussions about the oe-core layer
Subject: Re: [OE-core] Manifest for host (nativesdk) is empty

Something like this helps with host manifest.
It was just a guess - I found similar workaround into meta/lib/oe/package_m=
anager/ipk/sdk.py.
If it appropriate I could arrange it as a patch.

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pack=
age_manager/ipk/__init__.py
index 4cd3963111..37962fb689 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -62,6 +62,13 @@ class OpkgIndexer(Indexer):
 class PMPkgsList(PkgsList):
     def __init__(self, d, rootfs_dir):
         super(PMPkgsList, self).__init__(d, rootfs_dir)
+
+        # In sdk_list_installed_packages the call to opkg is hardcoded to
+        # always use IPKGCONF_TARGET and there's no exposed API to change =
this
+        # so simply override IPKGCONF_TARGET to use this separated config =
file.
+        ipkgconf_sdk_target =3D d.getVar("IPKGCONF_SDK")
+        d.setVar("IPKGCONF_TARGET", ipkgconf_sdk_target)
+
         config_file =3D d.getVar("IPKGCONF_TARGET")

Regards,
Oleksiy

________________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Richard Purdie <richard.purdie@linuxfoundation.=
org>
Sent: Monday, December 20, 2021 13:20
To: Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco); Patches an=
d discussions about the oe-core layer
Subject: Re: [OE-core] Manifest for host (nativesdk) is empty

On Sun, 2021-12-19 at 12:16 +0000, Oleksiy Obitotskyy via lists.openembedde=
d.org
wrote:
> Hi All,
>
> I'm working with gatesgarth and after 'bitbake core-image-minimal -c popu=
late_sdk' into .../deploy/sdk
> contains image installer .sh and manifests *.{host/target}.manifest. Host=
 one contains list of nativesdk packages.
>
> In honister target manifest is ok, but host manifest is empty.
> So, my question is it known behavior/done in purpose or not normal behavi=
or?

It is unexpected and needs to be looked into...

Cheers,

Richard


