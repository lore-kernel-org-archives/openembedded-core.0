Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE77103E173
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 12:55:17 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13305.1773838508896791910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 05:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TZVUFVCO;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=75422; q=dns/txt;
  s=iport01; t=1773838509; x=1775048109;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=4xmRytEzoHzPlg6WGqgiXmQYYjPWumQyKDVbyVqt1co=;
  b=TZVUFVCOk833r4cIArChoiePvAa2pTba1adjeMGduLqjaWDvWgKcEFra
   ELw3LYMV/EHPizO+pEvgvvRJa20M4OslUrAcF0OTaGrHlP0KlZgr5JizK
   Qjxpyc8/3k2Ij3BsSEdYs/tBtMhfRqY9iOT8qXBfz4amGa7LserZnnGJp
   ofjh0Mt06WTSZS53VFzH0AGtOUGSsBIo+3J7TIYKVj7l4mAZrTukr/9L8
   cKNHJtvBRA5Mk+ompRUX7LANQsxE0rxp1KJ2ODtgWtAmszCcdxkhsSWg2
   N8VmpxScYB8bAt1mLP2JhDo68RvU2WYH0FRrvm7tRybeSsaEqAzlJ961J
   A==;
X-CSE-ConnectionGUID: ETc2NC4/RGmIEE96PWOnLA==
X-CSE-MsgGUID: yjGlTnPAT/y+hSvNvH/Iiw==
X-IPAS-Result: =?us-ascii?q?A0C/DwBOn7pp/40QJK1aHgEBCxIMZYEgC4E9ATAqKQeBA?=
 =?us-ascii?q?HgXEkmIIwOFLIh5A4tkkjaBeQYPAQEBDQIuARUNBAEBhQcCjSICJjQJDgECB?=
 =?us-ascii?q?AEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThhUBAQUzDYZaAQEBA?=
 =?us-ascii?q?QMBEQgBXgwEAgEIEQQBASEBDSAHCh0IAgQBDQUIGoJhgh0WBwM2AwECDqhAA?=
 =?us-ascii?q?YE9AooqeIE0gQGCZtpdDYJeFAEFgTOFPIJ5HwEBKoE1glyBIAEZhHonGxuBc?=
 =?us-ascii?q?oFXgmg+gh9CAQMBF4EdKyUXg1eCLwSCInoUHYFih0eCADuGe1JyIgMmMywBV?=
 =?us-ascii?q?RMXCwcFgSMQMwMgCi8tAhQNIg8aBS0dcAwnEg8dFxQfWBsHBRIhKoEiggEPh?=
 =?us-ascii?q?mV5Ay5eGg4iAigRA1lKPgtSBYIsAoEHAwttPTcGDhsDBIE1BYxpXDuBQQFxA?=
 =?us-ascii?q?QEsRQ0FCgErBAEbLwEKGQgWBwMFTAEYOgkvA5JDLioTgmaMKkeOGJNZTXEKK?=
 =?us-ascii?q?IN0jB6NPoIAhjIXhASBV6UQmQYigjaLMYQJlwQCBAIEBQIQAQEGgWg8RoEBC?=
 =?us-ascii?q?wdwFTuCZwlJGQ+HfwEhhgwWHHYBB4RDgxTAH3gCAQgyAQEHAgcNAwuBaJAAg?=
 =?us-ascii?q?X0BAQ?=
IronPort-PHdr: A9a23:NOJl1Bwwv2bEGePXCzPsngc9DxPP853uNQITr50/hK0LKeKo/o/pO
 wrU4vA+xFPKXICO8/tfkKKWqKHvX2Uc/IyM+G4Pap1CVhIJyI0WkgUsDdTDCBjTJ//xZCt8F
 8NHPGI=
IronPort-Data: A9a23:KXJ8CqpsFkupKTjw8mF/yoj5F8ZeBmJGZBIvgKrLsJaIsI4StFCzt
 garIBnVMvzbajf8ctt+OYmxp0kBsZPQmN5qHAc6+3tnEXkRpOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrY8UM35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0stLCjto3
 qBfEh8ITz2u1ryO/5W9bsA506zPLOGzVG8eknhkyTecCbMtRorOBv2Wo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtOYH49tL/Aan3XczBEsFuJjaE2+GPUigd21dABNfKJJ4DQGJ0KwBvwS
 mTu7mbWBi0cDPWjjivG8kmyoPHv2gL6R9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cEnhKaccts4k9QjlCO
 kK1ou4FzAdH6dW9YXmc7byT6zi1PEAowaUqPEfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:eyBxda+bcklsmz6nofBuk+HDdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBfpTnhAsW9qXO1z+8S3WBjB8bSYOCGghrnEGgM1/qZ/9SNIVybygcZ79
 YeT0EcMqywMbEZt7eG3ODQKb9Jq7f3ktHMuQ6d9QYQcegAUdAY0+4NMHfhLqQAfng/OXNWLu
 v62iNvnUvSRV0nKu6AKj0uWe/Fq9fXlJTgTyInKnccgjWmvHeD0pK/NwKX8Cs/flp0rIsKwC
 zoggb57qKsv7WBzAPA12jc1pJSmNHw4NpODs6Bh6EuW3XRYwCTC7hJavmnhnQYseuv4FElnJ
 3nuBE7Jfl+7HvXYyWcvQbt8xOI6kdt11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 Nw2X6DvZY/N2KEoM293amNa/hZrDvznZMQq59Ls5WZa/pHVFZll/1ZwKqSKuZaIMu10vF8LA
 AkNrCt2B8fSyLpU5mehBgt/DRpNU5DQitvhSM5y5GoOzQ6pgEN82IIgMMYhXsO75Q7Vt1N4P
 nFKL1hkPVUQtYRdr8VPpZNfSKbMB2Hffv3ChPZHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33J
 DMSklRu2I+c1/nTZTm5uwFzjndBGGmGTj9wMBX4JZ0/rX6WbrwKCWGDFQjidGprfkTCtDSH/
 yzJJVVCfn+KnaGI/cE4yTuH51JbXUOWswcvdg2H1qIv8LQM4Xv8vfWdf7CTYCdWQrMmlmPS0
 frcAKDUvmotHrbLkMQqCKhLE/QRg==
X-Talos-CUID: 9a23:4iOuvGObLeKJD+5DdRVsrmg/RocfXXj84VqBfXeHLmBNYejA
X-Talos-MUID: 9a23:JfbPaQvql7JzwjVfgM2nlTNNMPtu242ST1FOka4Yndekcg1xJGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Mar 2026 12:55:07 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 3A3111800048D
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 12:55:07 +0000 (GMT)
X-CSE-ConnectionGUID: yV0WlEuwRbyBiyz3d0uuAg==
X-CSE-MsgGUID: n0GSddABR8WbpPtvfR+0vA==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,127,1770595200"; 
   d="scan'208,217";a="59241075"
Received: from mail-dm5pr08cu00407.outbound.protection.outlook.com (HELO DM5PR08CU004.outbound.protection.outlook.com) ([40.93.13.103])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Mar 2026 12:55:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0tMLbOLgX3gFtOby2zOfSYqHs1xnxwIV5yv2f0LqEH88D2xqZuLj21k2xQxJp/wilWfRFZ1RvqY767kPExVxFPkuzj0q90wM9jFJmey1htNKPKCO6lNozv4Bw7zUGNoNfPN0R6PIkxjBTJKiPfXZ/l35Vt+HC5nBmJQ0QH09N/hl/k7C+gpgb7XLatHMLXWJy/g8+zC4WcfyXvWyvdYlfmLFOS3Ur+VTYz1+1R0sKXWOMXOAS9CHozEpeG6rM0+ftS3mIOKfzkeTQ9xyDApPluh5Pd2G1sGb1LxZ2DgOA36DNO4EnVbogrFsbjH1GeWeH0ApD76ExISeJF6UopmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xmRytEzoHzPlg6WGqgiXmQYYjPWumQyKDVbyVqt1co=;
 b=kypl/lIpQeVNykhdjmmq55FzQTu1MYc0+P1Y2/qQDbGyEbtvqc5huJk0NmvapJqGInP9+EM4i5or2JusT/LUXCWRI0x7QdSJ370+HQ3vW7ojlrDqxcaKJS3HUFJ6G+vzQHiDqGxN7etshk+c1kiewErjujyVC2aNrAZae1QKeTKU00NDLE3qAw63ExmR/toZdtZR68+HSeDGpGV67CeKk4iq4LfU8RJ/OjsVCaFI7ZeEdlSWBFcetT8gtgqfTstHnwgsXK58xu7LvRJAYPCXeWrpk3EGoA8AR3tjq77+jr+XJPqEhGs/RkBFVbXHoVeDGjnijuEjXq5ZTxRDUnKiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16)
 by PH3PPF957B3B2A8.namprd11.prod.outlook.com (2603:10b6:518:1::d39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Wed, 18 Mar
 2026 12:55:01 +0000
Received: from DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::6b3a:c347:5cc1:fb9b]) by DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::6b3a:c347:5cc1:fb9b%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 12:55:01 +0000
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hetpat@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter.marko@siemens.com"
	<peter.marko@siemens.com>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, "Viral
 Chavda (vchavda)" <vchavda@cisco.com>, Marta Rybczynska
	<rybczynska@gmail.com>
Subject: Re: [OE-core] [scarthgap] [PATCH v1 2/4] cve-check: annotate CVEs
 during analysis
Thread-Topic: [OE-core] [scarthgap] [PATCH v1 2/4] cve-check: annotate CVEs
 during analysis
Thread-Index: AQHctpmT0Wmn9PYGHk+5NAjDpcAa+rWz5ygAgABYZVI=
Date: Wed, 18 Mar 2026 12:55:01 +0000
Message-ID: 
 <DS0PR11MB7405F69FF63FD0022DB20B85DC4EA@DS0PR11MB7405.namprd11.prod.outlook.com>
References: <20260318053906.26606-1-hetpat@cisco.com>
 <20260318053906.26606-3-hetpat@cisco.com>
 <AS1PR10MB569768AA9E03C3745824BC09FD4EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB569768AA9E03C3745824BC09FD4EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ddf75072-f6c2-442e-94cc-2de829e7b27c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-18T07:32:11Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7405:EE_|PH3PPF957B3B2A8:EE_
x-ms-office365-filtering-correlation-id: 30bbd4d2-6c6b-4752-c7ba-08de84ed9123
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003|18002099003|56012099003|22082099003|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 WSzPaihZHjljjoIq+uzNdgaMetDBj8AlaaLVCOIfEwx8RR8186qdTMhPLeFD/t7Mv3fIlyVpRNqAAM+Ys0vrp6AKISdXlPhcfyAeJDDCrEBd1abYxI/6vrsy6sawwtkTpBUFvGZsGZY/z1FfGJvl4qOcoZAtMDzuOrN8+caUGqLviWDl5hAq/s6ZDeyT4BLNhOxwHmIETZgTgpW2rxl82/EAMHtIKqgR5LXbWDBJqr/FsaF/xcgm41QNfoD3JpEdhrXhUhucIolX6PYy7mMLfVkp3zQZhTcAP45KJOGIzzlVh024yj6HRHEOTjTp78ZeDtAoCDP53kDje4AKoJzreVtJD2S1dOaIuMrQVAvL9mfjxzqUQZyiGHfA/jEuJFcSPrFv77PsFcZqI2Nh1RaJjTvHV+ZidwJBPaR1dpaoD1qnkOEB/CuU8UDkzUuGpa6pUGW2D0tpQEbD2xTXqcxXsOloRczMMr8ifiGN+eTrmagpf+SRCRWXflqejfpiMYCBC2H5+4YpHI0jhP2dSSDemgnDKRKP3KpmCXofQIc3ygmhfznv/k4QmFNdAerTxYDagUVDrGZRg590UaRRgioOC4vGrDpJuUdGC9D/d+mOjNUkC7dBw4h9ZhN/W1PVRKlA8HuOGRpsrsGHvAMWz53H+WoFtzgNOkI30mmD21CSkl44RNnGmhfKVDI3KVq/MaRvRQ4v01Q35n98LDTCSx3L4K/NsbLRM8jrEJVgQAQGdpphYTViYj7d6zdk6e2xfDoI
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7405.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003)(18002099003)(56012099003)(22082099003)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+vcRFwRm9Uk5oR+gpbRNmEFQimIEdu5qlu3L9xyCM3drBivP6tN15Uqoh0IV?=
 =?us-ascii?Q?oqvq+WUizHlqOtUyVWTLLCUwkWlOhabo6ETSX6SFYXIB12q1sh5/ZH7awgoo?=
 =?us-ascii?Q?foNtltZ3pHY7ElFxP38Tn6vK/5eJEqU1HTcABwPcm0Cp/m7G96kGijlMkeF0?=
 =?us-ascii?Q?FTn8V6Pe5iSPN2IZcETa7/mV5BK6KaWS53LWqiOHgbJRXXM0qSpdYn6I5wXD?=
 =?us-ascii?Q?FQxyhqbSgtqqQLNFjW4yv5DFRnZigc+G+1dp9HIJPxB6o4QokLH2Ys/8NG7R?=
 =?us-ascii?Q?ABecKKnspLHd1YFhTvBH2eM9Kjlgdp8KDfoyRhGvBr2UDdNSc4hvXcF4z2fd?=
 =?us-ascii?Q?LmQxCEc3cyP4TVdkdqWX4+jnw+zZiGzG6Rb5wG8TaahNvVLveaWaCA7Yhg0u?=
 =?us-ascii?Q?xm/ZB2x3OUE5ECgXi+eDW2ACtzQ48zby0oQehbU+v9Qz2YsMzzWk7v3JzVPg?=
 =?us-ascii?Q?1zMVmTtZTrHoFIiAU8CiDpceLZVTqi7cJf5mH768G+iL2QuvUgk2dlNZIRcL?=
 =?us-ascii?Q?FPOrKHwm+4pEkl3bEl2H36ByPSZpNbGPFKawKr+IaB4GrD5kwCTLCC/EdyM5?=
 =?us-ascii?Q?f9BDScQJbj1/E9SVZ/3FG6UITIDCefk4fw7xCgZYUHs7iSZJP0ff4ZfQY6bq?=
 =?us-ascii?Q?91gCBOM8Q0q5ivtmU7eESktgcOXzgHObsD/uaoov1R9iaqgy82NdfsmGBeVc?=
 =?us-ascii?Q?bL8vhvk2A3ZASMrjBJ/IhVtCdYgY/5ABmCk5DEVI9E5QDaCQDicUG9Fra8vS?=
 =?us-ascii?Q?xX+dKQvNhbuMG2b4y7eh6IbmHJNZmzv7nTVY+EnkEhOl9oc7rw6eXvTAlCJE?=
 =?us-ascii?Q?HEResphxacWNgZtp3gWzLyoTiLvgqvNHOxy+oppV04RGT+LuEs0vvQ8u9bGx?=
 =?us-ascii?Q?/2/cVOfw4ykyxWX2U4htqvciIEWem7t6uQufu4IHU8G/8zT56A/u0ofDU2wm?=
 =?us-ascii?Q?SCjERujR7P8GLmJg0r8FIzlMVdVkaavjAKWbm2rQiEbAkR49k2SuneRmuDR0?=
 =?us-ascii?Q?er4ZW7wmq9sjDkMlJ1i9pw7eiUXM7arC5wf57m8K/U1Y6PRXI/FhbMUH/8/T?=
 =?us-ascii?Q?WSHGIJOylldg7jy3tEcRzf6Ro7O1MK3CDfLskHyxv+KntnhhlSR02iAn7CdE?=
 =?us-ascii?Q?6ydOyHJGd5fsgiFemN4XCtXxeWKQYCEIcVy+ld02S5EcHWQUSSJFzujCg/14?=
 =?us-ascii?Q?pOVdOAXTTJRfo5RAXStiivlR/41z9Il2bq2lbEu19RqWYKpihAscpXEqYpf3?=
 =?us-ascii?Q?u048aOPkODPkX8iQBRIokOP5yQvA/oNfucKCGrKH24TPLJh05Sv1dT5juje8?=
 =?us-ascii?Q?WUfQZtYCh18vhYEc6GFZWwPmmZkisZO8rLoMKYuvcCnDz9RP2ckVuh8SAPnk?=
 =?us-ascii?Q?gLi+EkrV0chjwt3rue6+X8YPQH6mMgjXC1XVXyKx1aSqjKdJerIQYoovBBUD?=
 =?us-ascii?Q?J1YJQVQm1ymgJ2jTDtU3hp2QqgVkix0o1owM5oyhpbFLQ71A5F1mwxxf7eph?=
 =?us-ascii?Q?xTtYN1r+Zz+X7LLzlUp+3wYW+ZqWTEruv70/7jBkFejL1IkqQVpsRMvrxkcJ?=
 =?us-ascii?Q?g3kM5+ZV6zztN9SJmFvuhS5/eCS0G/JI0YcBoXoHp5KP07PxbFG4aRVfXW1B?=
 =?us-ascii?Q?KQJXurABAqj4x8pQByN+q66+KWcpKNPpvjdpwOOqMOSf4prBisl6/bEeBqxT?=
 =?us-ascii?Q?lhS2E2004mA3zVI9V5fCgeC+BkdxUQ0I1kOlaNT1shplbsGY?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB7405F69FF63FD0022DB20B85DC4EADS0PR11MB7405namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	op9zwrSztzHXcpXujdV6L8bG1gC572RhJkO8wN6ZoVXQVvXCL06W3uDAL2tC8jvl3TKFGdAoCw5Iy7m1uSdTfsH6zXA1SL0rEV9LbC8ReyIVPhtY2rieJjRD8BRofXCZEdJ7R5+39kguQmLgy21vZvDkQ8O3QxPcY5DO28aKuprlAuQVg7Lt+MsNNMXH6eX8WTGaRCABX3XrLaOMS70yBNKNTCgKPlDZ90kxENO+8KW8EqcUZPb1zvWBvEtFi02sS8Fp5kFGKJRYYa9BJDeawDpPCxwM/P0Ul7N6BZM/m3fA5nsqkNBoA2No5edABu4U3wo/q0VzqjQt0KTCNWFT1w==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7405.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30bbd4d2-6c6b-4752-c7ba-08de84ed9123
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 12:55:01.0229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HAtRsxW3AWS/o+DlQwTk0/tpj7TwqFQrt+Fjd8GTxWq1nSDTciag84Ov7ScddolYc+3QFPu8Nalm7oMM52svIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF957B3B2A8
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 12:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233384

--_000_DS0PR11MB7405F69FF63FD0022DB20B85DC4EADS0PR11MB7405namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thank you for the feedback.

Without CPE tagging, old-format entries from cve-extra-exclusions.inc
(vendor=3D* product=3D*) would match all recipes via has_cve_product_match(=
),
causing report bloat.

So, I have to include commit [e1bf43561093] in this series to address this.
This file was missed during testing since it is not included by default.

I will update the series with this additional patch and resubmit.

Regards,
Het
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Peter Marko via lists.openembedded.org <peter.m=
arko=3Dsiemens.com@lists.openembedded.org>
Sent: Wednesday, March 18, 2026 1:08 PM
To: Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) <hetpat@ci=
sco.com>; openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org>
Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>; Viral Cha=
vda (vchavda) <vchavda@cisco.com>; Marta Rybczynska <rybczynska@gmail.com>
Subject: Re: [OE-core] [scarthgap] [PATCH v1 2/4] cve-check: annotate CVEs =
during analysis

If I remember correctly, this commit brings significant (breaking) change h=
ow ignored CVEs are reported.
Before, only ignored CVEs matching NVD DB are reported, after, all ignored =
CVEs are reported.

Therefore it would also need a change in common cve includes (like https://=
git.openembedded.org/openembedded-core/commit/?id=3De1bf43561093b3b9215cde9=
e9f7d80b4ffcdc64e).
And change all such files in user layers, so updating migration notes (whic=
h was unfortunately not done for new releases, however this patch is trying=
 to do this in mid of LTS release).

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Het Patel via
> lists.openembedded.org
> Sent: Wednesday, March 18, 2026 6:39
> To: openembedded-core@lists.openembedded.org
> Cc: xe-linux-external@cisco.com; vchavda@cisco.com
> Subject: [OE-core] [scarthgap] [PATCH v1 2/4] cve-check: annotate CVEs du=
ring
> analysis
>
> From: Marta Rybczynska <rybczynska@gmail.com>
>
> Add status information for each CVE under analysis.
>
> Previously the information passed between different function of the
> cve-check class included only tables of patched, unpatched, ignored
> vulnerabilities and the general status of the recipe.
>
> The VEX work requires more information, and we need to pass them
> between different functions, so that it can be enriched as the
> analysis progresses. Instead of multiple tables, use a single one
> with annotations for each CVE encountered. For example, a patched
> CVE will have:
>
> {"abbrev-status": "Patched", "status": "version-not-in-range"}
>
> abbrev-status contains the general status (Patched, Unpatched,
> Ignored and Unknown that will be added in the VEX code)
> status contains more detailed information that can come from
> CVE_STATUS and the analysis.
>
> Additional fields of the annotation include for example the name
> of the patch file fixing a given CVE.
>
> We also use the annotation in CVE_STATUS to filter out entries
> that do not apply to the given recipe
>
> Backport Changes:
> - Cherry-picking this patch, which precedes commit [358dbfcd80ae] in
> master. Since commit [358dbfcd80ae] was already cherry-picked earlier
> in scarthgap, adjusted the changes accordingly to avoid conflicts.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 452e605b55ad61c08f4af7089a5a9c576ca28f7d)
> Signed-off-by: Het Patel <hetpat@cisco.com>
> ---
>  meta/classes/cve-check.bbclass | 214 +++++++++++++++++----------------
>  meta/lib/oe/cve_check.py       |  35 +++++-
>  2 files changed, 142 insertions(+), 107 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index de5ddf6f04..32fb9e8a5c 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -176,10 +176,10 @@ python do_cve_check () {
>                  patched_cves =3D get_patched_cves(d)
>              except FileNotFoundError:
>                  bb.fatal("Failure in searching patches")
> -            ignored, patched, unpatched, status =3D check_cves(d, patche=
d_cves)
> -            if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") =
=3D=3D "1"
> and status):
> -                cve_data =3D get_cve_info(d, patched + unpatched + ignor=
ed)
> -                cve_write_data(d, patched, unpatched, ignored, cve_data,=
 status)
> +            cve_data, status =3D check_cves(d, patched_cves)
> +            if len(cve_data) or (d.getVar("CVE_CHECK_COVERAGE") =3D=3D "=
1" and
> status):
> +                get_cve_info(d, cve_data)
> +                cve_write_data(d, cve_data, status)
>          else:
>              bb.note("No CVE database found, skipping CVE check")
>
> @@ -287,7 +287,51 @@ ROOTFS_POSTPROCESS_COMMAND:prepend =3D
> "${@'cve_check_write_rootfs_manifest ' if d
>  do_rootfs[recrdeptask] +=3D "${@'do_cve_check' if
> d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
>  do_populate_sdk[recrdeptask] +=3D "${@'do_cve_check' if
> d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
>
> -def check_cves(d, patched_cves):
> +def cve_is_ignored(d, cve_data, cve):
> +    if cve not in cve_data:
> +        return False
> +    if cve_data[cve]['abbrev-status'] =3D=3D "Ignored":
> +        return True
> +    return False
> +
> +def cve_is_patched(d, cve_data, cve):
> +    if cve not in cve_data:
> +        return False
> +    if cve_data[cve]['abbrev-status'] =3D=3D "Patched":
> +        return True
> +    return False
> +
> +def cve_update(d, cve_data, cve, entry):
> +    # If no entry, just add it
> +    if cve not in cve_data:
> +        cve_data[cve] =3D entry
> +        return
> +    # If we are updating, there might be change in the status
> +    bb.debug("Trying CVE entry update for %s from %s to %s" % (cve,
> cve_data[cve]['abbrev-status'], entry['abbrev-status']))
> +    if cve_data[cve]['abbrev-status'] =3D=3D "Unknown":
> +        cve_data[cve] =3D entry
> +        return
> +    if cve_data[cve]['abbrev-status'] =3D=3D entry['abbrev-status']:
> +        return
> +    # Update like in {'abbrev-status': 'Patched', 'status': 'version-not=
-in-range'} to
> {'abbrev-status': 'Unpatched', 'status': 'version-in-range'}
> +    if entry['abbrev-status'] =3D=3D "Unpatched" and cve_data[cve]['abbr=
ev-status'] =3D=3D
> "Patched":
> +        if entry['status'] =3D=3D "version-in-range" and cve_data[cve]['=
status'] =3D=3D
> "version-not-in-range":
> +            # New result from the scan, vulnerable
> +            cve_data[cve] =3D entry
> +            bb.debug("CVE entry %s update from Patched to Unpatched from=
 the
> scan result" % cve)
> +            return
> +    if entry['abbrev-status'] =3D=3D "Patched" and cve_data[cve]['abbrev=
-status'] =3D=3D
> "Unpatched":
> +        if entry['status'] =3D=3D "version-not-in-range" and cve_data[cv=
e]['status'] =3D=3D
> "version-in-range":
> +            # Range does not match the scan, but we already have a vulne=
rable
> match, ignore
> +            bb.debug("CVE entry %s update from Patched to Unpatched from=
 the
> scan result - not applying" % cve)
> +            return
> +    # If we have an "Ignored", it has a priority
> +    if cve_data[cve]['abbrev-status'] =3D=3D "Ignored":
> +        bb.debug("CVE %s not updating because Ignored" % cve)
> +        return
> +    bb.warn("Unhandled CVE entry update for %s from %s to %s" % (cve,
> cve_data[cve], entry))
> +
> +def check_cves(d, cve_data):
>      """
>      Connect to the NVD database and find unpatched cves.
>      """
> @@ -297,28 +341,19 @@ def check_cves(d, patched_cves):
>      real_pv =3D d.getVar("PV")
>      suffix =3D d.getVar("CVE_VERSION_SUFFIX")
>
> -    cves_unpatched =3D []
> -    cves_ignored =3D []
>      cves_status =3D []
>      cves_in_recipe =3D False
>      # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
>      products =3D d.getVar("CVE_PRODUCT").split()
>      # If this has been unset then we're not scanning for CVEs here (for =
example,
> image recipes)
>      if not products:
> -        return ([], [], [], [])
> +        return ([], [])
>      pv =3D d.getVar("CVE_VERSION").split("+git")[0]
>
>      # If the recipe has been skipped/ignored we return empty lists
>      if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
>          bb.note("Recipe has been skipped by cve-check")
> -        return ([], [], [], [])
> -
> -    # Convert CVE_STATUS into ignored CVEs and check validity
> -    cve_ignore =3D []
> -    for cve in (d.getVarFlags("CVE_STATUS") or {}):
> -        decoded_status =3D decode_cve_status(d, cve)
> -        if 'mapping' in decoded_status and decoded_status['mapping'] =3D=
=3D
> "Ignored":
> -            cve_ignore.append(cve)
> +        return ([], [])
>
>      import sqlite3
>      db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
> @@ -337,11 +372,10 @@ def check_cves(d, patched_cves):
>          for cverow in cve_cursor:
>              cve =3D cverow[0]
>
> -            if cve in cve_ignore:
> +            if cve_is_ignored(d, cve_data, cve):
>                  bb.note("%s-%s ignores %s" % (product, pv, cve))
> -                cves_ignored.append(cve)
>                  continue
> -            elif cve in patched_cves:
> +            elif cve_is_patched(d, cve_data, cve):
>                  bb.note("%s has been patched" % (cve))
>                  continue
>              # Write status once only for each product
> @@ -357,7 +391,7 @@ def check_cves(d, patched_cves):
>              for row in product_cursor:
>                  (_, _, _, version_start, operator_start, version_end, op=
erator_end) =3D row
>                  #bb.debug(2, "Evaluating row " + str(row))
> -                if cve in cve_ignore:
> +                if cve_is_ignored(d, cve_data, cve):
>                      ignored =3D True
>
>                  version_start =3D convert_cve_version(version_start)
> @@ -396,16 +430,16 @@ def check_cves(d, patched_cves):
>                  if vulnerable:
>                      if ignored:
>                          bb.note("%s is ignored in %s-%s" % (cve, pn, rea=
l_pv))
> -                        cves_ignored.append(cve)
> +                        cve_update(d, cve_data, cve, {"abbrev-status": "=
Ignored"})
>                      else:
>                          bb.note("%s-%s is vulnerable to %s" % (pn, real_=
pv, cve))
> -                        cves_unpatched.append(cve)
> +                        cve_update(d, cve_data, cve, {"abbrev-status": "=
Unpatched",
> "status": "version-in-range"})
>                      break
>              product_cursor.close()
>
>              if not vulnerable:
>                  bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, =
cve))
> -                patched_cves.add(cve)
> +                cve_update(d, cve_data, cve, {"abbrev-status": "Patched"=
, "status":
> "version-not-in-range"})
>          cve_cursor.close()
>
>          if not cves_in_product:
> @@ -413,49 +447,46 @@ def check_cves(d, patched_cves):
>              cves_status.append([product, False])
>
>      conn.close()
> -    diff_ignore =3D list(set(cve_ignore) - set(cves_ignored))
> -    if diff_ignore:
> -        oe.qa.handle_error("cve_status_not_in_db", "Found CVE (%s) with
> CVE_STATUS set that are not found in database for this component" % "
> ".join(diff_ignore), d)
>
>      if not cves_in_recipe:
>          bb.note("No CVE records for products in recipe %s" % (pn))
>
> -    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves=
_status)
> +    return (cve_data, cves_status)
>
> -def get_cve_info(d, cves):
> +def get_cve_info(d, cve_data):
>      """
>      Get CVE information from the database.
>      """
>
>      import sqlite3
>
> -    cve_data =3D {}
>      db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
>      conn =3D sqlite3.connect(db_file, uri=3DTrue)
>
> -    for cve in cves:
> +    for cve in cve_data:
>          cursor =3D conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,=
))
>          for row in cursor:
> -            cve_data[row[0]] =3D {}
> -            cve_data[row[0]]["summary"] =3D row[1]
> -            cve_data[row[0]]["scorev2"] =3D row[2]
> -            cve_data[row[0]]["scorev3"] =3D row[3]
> -            cve_data[row[0]]["scorev4"] =3D row[4]
> -            cve_data[row[0]]["modified"] =3D row[5]
> -            cve_data[row[0]]["vector"] =3D row[6]
> -            cve_data[row[0]]["vectorString"] =3D row[7]
> +            # The CVE itdelf has been added already
> +            if row[0] not in cve_data:
> +                bb.note("CVE record %s not present" % row[0])
> +                continue
> +            #cve_data[row[0]] =3D {}
> +            cve_data[row[0]]["NVD-summary"] =3D row[1]
> +            cve_data[row[0]]["NVD-scorev2"] =3D row[2]
> +            cve_data[row[0]]["NVD-scorev3"] =3D row[3]
> +            cve_data[row[0]]["NVD-scorev4"] =3D row[4]
> +            cve_data[row[0]]["NVD-modified"] =3D row[5]
> +            cve_data[row[0]]["NVD-vector"] =3D row[6]
> +            cve_data[row[0]]["NVD-vectorString"] =3D row[7]
>          cursor.close()
>      conn.close()
> -    return cve_data
>
> -def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
> +def cve_write_data_text(d, cve_data):
>      """
>      Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
>      CVE manifest if enabled.
>      """
>
> -    from oe.cve_check import decode_cve_status
> -
>      cve_file =3D d.getVar("CVE_CHECK_LOG")
>      fdir_name  =3D d.getVar("FILE_DIRNAME")
>      layer =3D fdir_name.split("/")[-3]
> @@ -472,7 +503,7 @@ def cve_write_data_text(d, patched, unpatched, ignore=
d,
> cve_data):
>          return
>
>      # Early exit, the text format does not report packages without CVEs
> -    if not patched+unpatched+ignored:
> +    if not len(cve_data):
>          return
>
>      nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
> @@ -481,37 +512,30 @@ def cve_write_data_text(d, patched, unpatched,
> ignored, cve_data):
>      bb.utils.mkdirhier(os.path.dirname(cve_file))
>
>      for cve in sorted(cve_data):
> -        is_patched =3D cve in patched
> -        is_ignored =3D cve in ignored
> -
> -        status =3D "Unpatched"
> -        if (is_patched or is_ignored) and not report_all:
> +        if not report_all and (cve_data[cve]["abbrev-status"] =3D=3D "Pa=
tched" or
> cve_data[cve]["abbrev-status"] =3D=3D "Ignored"):
>              continue
> -        if is_ignored:
> -            status =3D "Ignored"
> -        elif is_patched:
> -            status =3D "Patched"
> -        else:
> -            # default value of status is Unpatched
> -            unpatched_cves.append(cve)
> -
>          write_string +=3D "LAYER: %s\n" % layer
>          write_string +=3D "PACKAGE NAME: %s\n" % d.getVar("PN")
>          write_string +=3D "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDP=
E"),
> d.getVar("PV"))
>          write_string +=3D "CVE: %s\n" % cve
> -        write_string +=3D "CVE STATUS: %s\n" % status
> -        status_details =3D decode_cve_status(d, cve)
> -        if 'detail' in status_details:
> -            write_string +=3D "CVE DETAIL: %s\n" % status_details['detai=
l']
> -        if 'description' in status_details:
> -            write_string +=3D "CVE DESCRIPTION: %s\n" % status_details['=
description']
> -        write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
> -        write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev2"]
> -        write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev3"]
> -        write_string +=3D "CVSS v4 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev4"]
> -        write_string +=3D "VECTOR: %s\n" % cve_data[cve]["vector"]
> -        write_string +=3D "VECTORSTRING: %s\n" % cve_data[cve]["vectorSt=
ring"]
> +        write_string +=3D "CVE STATUS: %s\n" % cve_data[cve]["abbrev-sta=
tus"]
> +
> +        if 'status' in cve_data[cve]:
> +            write_string +=3D "CVE DETAIL: %s\n" % cve_data[cve]["status=
"]
> +        if 'justification' in cve_data[cve]:
> +            write_string +=3D "CVE DESCRIPTION: %s\n" %
> cve_data[cve]["justification"]
> +
> +        if "NVD-summary" in cve_data[cve]:
> +            write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["NVD-
> summary"]
> +            write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]=
["NVD-
> scorev2"]
> +            write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]=
["NVD-
> scorev3"]
> +            write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]=
["NVD-
> scorev4"]
> +            write_string +=3D "VECTOR: %s\n" % cve_data[cve]["NVD-vector=
"]
> +            write_string +=3D "VECTORSTRING: %s\n" % cve_data[cve]["NVD-
> vectorString"]
> +
>          write_string +=3D "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
> +        if cve_data[cve]["abbrev-status"] =3D=3D "Unpatched":
> +            unpatched_cves.append(cve)
>
>      if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") =3D=3D "1"=
:
>          bb.warn("Found unpatched CVE (%s), for more information check %s=
" % ("
> ".join(unpatched_cves),cve_file))
> @@ -563,13 +587,11 @@ def cve_check_write_json_output(d, output, direct_f=
ile,
> deploy_file, manifest_fi
>          with open(index_path, "a+") as f:
>              f.write("%s\n" % fragment_path)
>
> -def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_st=
atus):
> +def cve_write_data_json(d, cve_data, cve_status):
>      """
>      Prepare CVE data for the JSON format, then write it.
>      """
>
> -    from oe.cve_check import decode_cve_status
> -
>      output =3D {"version":"1", "package": []}
>      nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
>
> @@ -587,8 +609,6 @@ def cve_write_data_json(d, patched, unpatched, ignore=
d,
> cve_data, cve_status):
>      if include_layers and layer not in include_layers:
>          return
>
> -    unpatched_cves =3D []
> -
>      product_data =3D []
>      for s in cve_status:
>          p =3D {"product": s[0], "cvesInRecord": "Yes"}
> @@ -603,40 +623,32 @@ def cve_write_data_json(d, patched, unpatched,
> ignored, cve_data, cve_status):
>          "version" : package_version,
>          "products": product_data
>      }
> +
>      cve_list =3D []
>
>      for cve in sorted(cve_data):
> -        is_patched =3D cve in patched
> -        is_ignored =3D cve in ignored
> -        status =3D "Unpatched"
> -        if (is_patched or is_ignored) and not report_all:
> +        if not report_all and (cve_data[cve]["abbrev-status"] =3D=3D "Pa=
tched" or
> cve_data[cve]["abbrev-status"] =3D=3D "Ignored"):
>              continue
> -        if is_ignored:
> -            status =3D "Ignored"
> -        elif is_patched:
> -            status =3D "Patched"
> -        else:
> -            # default value of status is Unpatched
> -            unpatched_cves.append(cve)
> -
>          issue_link =3D "%s%s" % (nvd_link, cve)
>
>          cve_item =3D {
>              "id" : cve,
> -            "summary" : cve_data[cve]["summary"],
> -            "scorev2" : cve_data[cve]["scorev2"],
> -            "scorev3" : cve_data[cve]["scorev3"],
> -            "scorev4" : cve_data[cve]["scorev4"],
> -            "vector" : cve_data[cve]["vector"],
> -            "vectorString" : cve_data[cve]["vectorString"],
> -            "status" : status,
> -            "link": issue_link
> +            "status" : cve_data[cve]["abbrev-status"],
> +            "link": issue_link,
>          }
> -        status_details =3D decode_cve_status(d, cve)
> -        if 'detail' in status_details:
> -            cve_item["detail"] =3D status_details['detail']
> -        if 'description' in status_details:
> -            cve_item["description"] =3D status_details['description']
> +        if 'NVD-summary' in cve_data[cve]:
> +            cve_item["summary"] =3D cve_data[cve]["NVD-summary"]
> +            cve_item["scorev2"] =3D cve_data[cve]["NVD-scorev2"]
> +            cve_item["scorev3"] =3D cve_data[cve]["NVD-scorev3"]
> +            cve_item["scorev4"] =3D cve_data[cve]["NVD-scorev4"]
> +            cve_item["vector"] =3D cve_data[cve]["NVD-vector"]
> +            cve_item["vectorString"] =3D cve_data[cve]["NVD-vectorString=
"]
> +        if 'status' in cve_data[cve]:
> +            cve_item["detail"] =3D cve_data[cve]["status"]
> +        if 'justification' in cve_data[cve]:
> +            cve_item["description"] =3D cve_data[cve]["justification"]
> +        if 'resource' in cve_data[cve]:
> +            cve_item["patch-file"] =3D cve_data[cve]["resource"]
>          cve_list.append(cve_item)
>
>      package_data["issue"] =3D cve_list
> @@ -648,12 +660,12 @@ def cve_write_data_json(d, patched, unpatched,
> ignored, cve_data, cve_status):
>
>      cve_check_write_json_output(d, output, direct_file, deploy_file, man=
ifest_file)
>
> -def cve_write_data(d, patched, unpatched, ignored, cve_data, status):
> +def cve_write_data(d, cve_data, status):
>      """
>      Write CVE data in each enabled format.
>      """
>
>      if d.getVar("CVE_CHECK_FORMAT_TEXT") =3D=3D "1":
> -        cve_write_data_text(d, patched, unpatched, ignored, cve_data)
> +        cve_write_data_text(d, cve_data)
>      if d.getVar("CVE_CHECK_FORMAT_JSON") =3D=3D "1":
> -        cve_write_data_json(d, patched, unpatched, ignored, cve_data, st=
atus)
> +        cve_write_data_json(d, cve_data, status)
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index 767d1a6750..37230b7957 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -88,7 +88,7 @@ def get_patched_cves(d):
>      # (cve_match regular expression)
>      cve_file_name_match =3D re.compile(r".*(CVE-\d{4}-\d+)", re.IGNORECA=
SE)
>
> -    patched_cves =3D set()
> +    patched_cves =3D {}
>      patches =3D oe.patch.src_patches(d)
>      bb.debug(2, "Scanning %d patches for CVEs" % len(patches))
>      for url in patches:
> @@ -98,7 +98,7 @@ def get_patched_cves(d):
>          fname_match =3D cve_file_name_match.search(patch_file)
>          if fname_match:
>              cve =3D fname_match.group(1).upper()
> -            patched_cves.add(cve)
> +            patched_cves[cve] =3D {"abbrev-status": "Patched", "status":=
 "fix-file-
> included", "resource": patch_file}
>              bb.debug(2, "Found %s from patch file name %s" % (cve, patch=
_file))
>
>          # Remote patches won't be present and compressed patches won't b=
e
> @@ -124,7 +124,7 @@ def get_patched_cves(d):
>              cves =3D patch_text[match.start()+5:match.end()]
>              for cve in cves.split():
>                  bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
> -                patched_cves.add(cve)
> +                patched_cves[cve] =3D {"abbrev-status": "Patched", "stat=
us": "fix-file-
> included", "resource": patch_file}
>                  text_match =3D True
>
>          if not fname_match and not text_match:
> @@ -133,9 +133,15 @@ def get_patched_cves(d):
>      # Search for additional patched CVEs
>      for cve in (d.getVarFlags("CVE_STATUS") or {}):
>          decoded_status =3D decode_cve_status(d, cve)
> -        if 'mapping' in decoded_status and decoded_status['mapping'] =3D=
=3D
> "Patched":
> -            bb.debug(2, "CVE %s is additionally patched" % cve)
> -            patched_cves.add(cve)
> +        products =3D d.getVar("CVE_PRODUCT")
> +        if has_cve_product_match(decoded_status, products) =3D=3D True:
> +            patched_cves[cve] =3D {
> +                "abbrev-status": decoded_status["mapping"],
> +                "status": decoded_status["detail"],
> +                "justification": decoded_status["description"],
> +                "affected-vendor": decoded_status["vendor"],
> +                "affected-product": decoded_status["product"]
> +            }
>
>      return patched_cves
>
> @@ -286,3 +292,20 @@ def extend_cve_status(d):
>                  d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_=
group,
> "status"))
>          else:
>              bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" %
> cve_status_group)
> +
> +def has_cve_product_match(detailed_status, products):
> +    """
> +    Check product/vendor match between detailed_status from
> decode_cve_status and a string of
> +    products (like from CVE_PRODUCT)
> +    """
> +    for product in products.split():
> +        vendor =3D "*"
> +        if ":" in product:
> +            vendor, product =3D product.split(":", 1)
> +
> +        if (vendor =3D=3D detailed_status["vendor"] or detailed_status["=
vendor"] =3D=3D "*")
> and \
> +            (product =3D=3D detailed_status["product"] or detailed_statu=
s["product"] =3D=3D
> "*"):
> +            return True
> +
> +    #if no match, return False
> +    return False

--_000_DS0PR11MB7405F69FF63FD0022DB20B85DC4EADS0PR11MB7405namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Peter,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thank you for the feedback.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Without CPE tagging, old-format entries from cve-extra-exclusions.inc</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
(vendor=3D* product=3D*) would match all recipes via has_cve_product_match(=
),</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
causing report bloat.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
So, I have to include commit [e1bf43561093] in this series to address this.=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This file was missed during testing since it is not included by default.</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I will update the series with this additional patch and resubmit.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Het</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Peter Marko via lists.openembedded.org &lt;peter.marko=3Dsiemens.com=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, March 18, 2026 1:08 PM<br>
<b>To:</b> Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt=
;hetpat@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;openemb=
edded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external(mailer list) &lt;xe-linux-external@cisco.com&g=
t;; Viral Chavda (vchavda) &lt;vchavda@cisco.com&gt;; Marta Rybczynska &lt;=
rybczynska@gmail.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap] [PATCH v1 2/4] cve-check: annotat=
e CVEs during analysis</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">If I remember correctly, this commit brings signif=
icant (breaking) change how ignored CVEs are reported.<br>
Before, only ignored CVEs matching NVD DB are reported, after, all ignored =
CVEs are reported.<br>
<br>
Therefore it would also need a change in common cve includes (like <a href=
=3D"https://git.openembedded.org/openembedded-core/commit/?id=3De1bf4356109=
3b3b9215cde9e9f7d80b4ffcdc64e)">
https://git.openembedded.org/openembedded-core/commit/?id=3De1bf43561093b3b=
9215cde9e9f7d80b4ffcdc64e)</a>.<br>
And change all such files in user layers, so updating migration notes (whic=
h was unfortunately not done for new releases, however this patch is trying=
 to do this in mid of LTS release).<br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-<br>
&gt; core@lists.openembedded.org&gt; On Behalf Of Het Patel via<br>
&gt; lists.openembedded.org<br>
&gt; Sent: Wednesday, March 18, 2026 6:39<br>
&gt; To: openembedded-core@lists.openembedded.org<br>
&gt; Cc: xe-linux-external@cisco.com; vchavda@cisco.com<br>
&gt; Subject: [OE-core] [scarthgap] [PATCH v1 2/4] cve-check: annotate CVEs=
 during<br>
&gt; analysis<br>
&gt; <br>
&gt; From: Marta Rybczynska &lt;rybczynska@gmail.com&gt;<br>
&gt; <br>
&gt; Add status information for each CVE under analysis.<br>
&gt; <br>
&gt; Previously the information passed between different function of the<br=
>
&gt; cve-check class included only tables of patched, unpatched, ignored<br=
>
&gt; vulnerabilities and the general status of the recipe.<br>
&gt; <br>
&gt; The VEX work requires more information, and we need to pass them<br>
&gt; between different functions, so that it can be enriched as the<br>
&gt; analysis progresses. Instead of multiple tables, use a single one<br>
&gt; with annotations for each CVE encountered. For example, a patched<br>
&gt; CVE will have:<br>
&gt; <br>
&gt; {&quot;abbrev-status&quot;: &quot;Patched&quot;, &quot;status&quot;: &=
quot;version-not-in-range&quot;}<br>
&gt; <br>
&gt; abbrev-status contains the general status (Patched, Unpatched,<br>
&gt; Ignored and Unknown that will be added in the VEX code)<br>
&gt; status contains more detailed information that can come from<br>
&gt; CVE_STATUS and the analysis.<br>
&gt; <br>
&gt; Additional fields of the annotation include for example the name<br>
&gt; of the patch file fixing a given CVE.<br>
&gt; <br>
&gt; We also use the annotation in CVE_STATUS to filter out entries<br>
&gt; that do not apply to the given recipe<br>
&gt; <br>
&gt; Backport Changes:<br>
&gt; - Cherry-picking this patch, which precedes commit [358dbfcd80ae] in<b=
r>
&gt; master. Since commit [358dbfcd80ae] was already cherry-picked earlier<=
br>
&gt; in scarthgap, adjusted the changes accordingly to avoid conflicts.<br>
&gt; <br>
&gt; Signed-off-by: Marta Rybczynska &lt;marta.rybczynska@syslinbit.com&gt;=
<br>
&gt; Signed-off-by: Samantha Jalabert &lt;samantha.jalabert@syslinbit.com&g=
t;<br>
&gt; Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&g=
t;<br>
&gt; (cherry picked from commit 452e605b55ad61c08f4af7089a5a9c576ca28f7d)<b=
r>
&gt; Signed-off-by: Het Patel &lt;hetpat@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes/cve-check.bbclass | 214 +++++++++++++++++----------=
------<br>
&gt;&nbsp; meta/lib/oe/cve_check.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 35 +++++-<br>
&gt;&nbsp; 2 files changed, 142 insertions(+), 107 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.b=
bclass<br>
&gt; index de5ddf6f04..32fb9e8a5c 100644<br>
&gt; --- a/meta/classes/cve-check.bbclass<br>
&gt; +++ b/meta/classes/cve-check.bbclass<br>
&gt; @@ -176,10 +176,10 @@ python do_cve_check () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; patched_cves =3D get_patched_cves(d)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; except FileNotFoundError:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.fatal(&quot;Failure in searching patches=
&quot;)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
nored, patched, unpatched, status =3D check_cves(d, patched_cves)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 patched or unpatched or (d.getVar(&quot;CVE_CHECK_COVERAGE&quot;) =3D=3D &=
quot;1&quot;<br>
&gt; and status):<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; cve_data =3D get_cve_info(d, patched + unpatched + ig=
nored)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; cve_write_data(d, patched, unpatched, ignored, cve_da=
ta, status)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data, status =3D check_cves(d, patched_cves)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 len(cve_data) or (d.getVar(&quot;CVE_CHECK_COVERAGE&quot;) =3D=3D &quot;1&=
quot; and<br>
&gt; status):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; get_cve_info(d, cve_data)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; cve_write_data(d, cve_data, status)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; bb.note(&quot;No CVE database found, skipping CVE check&quot;)<br>
&gt; <br>
&gt; @@ -287,7 +287,51 @@ ROOTFS_POSTPROCESS_COMMAND:prepend =3D<br>
&gt; &quot;${@'cve_check_write_rootfs_manifest ' if d<br>
&gt;&nbsp; do_rootfs[recrdeptask] +=3D &quot;${@'do_cve_check' if<br>
&gt; d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}&quot;<br>
&gt;&nbsp; do_populate_sdk[recrdeptask] +=3D &quot;${@'do_cve_check' if<br>
&gt; d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}&quot;<br>
&gt; <br>
&gt; -def check_cves(d, patched_cves):<br>
&gt; +def cve_is_ignored(d, cve_data, cve):<br>
&gt; +&nbsp;&nbsp;&nbsp; if cve not in cve_data:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return False<br>
&gt; +&nbsp;&nbsp;&nbsp; if cve_data[cve]['abbrev-status'] =3D=3D &quot;Ign=
ored&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return True<br>
&gt; +&nbsp;&nbsp;&nbsp; return False<br>
&gt; +<br>
&gt; +def cve_is_patched(d, cve_data, cve):<br>
&gt; +&nbsp;&nbsp;&nbsp; if cve not in cve_data:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return False<br>
&gt; +&nbsp;&nbsp;&nbsp; if cve_data[cve]['abbrev-status'] =3D=3D &quot;Pat=
ched&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return True<br>
&gt; +&nbsp;&nbsp;&nbsp; return False<br>
&gt; +<br>
&gt; +def cve_update(d, cve_data, cve, entry):<br>
&gt; +&nbsp;&nbsp;&nbsp; # If no entry, just add it<br>
&gt; +&nbsp;&nbsp;&nbsp; if cve not in cve_data:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_data[cve] =3D entry<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
&gt; +&nbsp;&nbsp;&nbsp; # If we are updating, there might be change in the=
 status<br>
&gt; +&nbsp;&nbsp;&nbsp; bb.debug(&quot;Trying CVE entry update for %s from=
 %s to %s&quot; % (cve,<br>
&gt; cve_data[cve]['abbrev-status'], entry['abbrev-status']))<br>
&gt; +&nbsp;&nbsp;&nbsp; if cve_data[cve]['abbrev-status'] =3D=3D &quot;Unk=
nown&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_data[cve] =3D entry<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
&gt; +&nbsp;&nbsp;&nbsp; if cve_data[cve]['abbrev-status'] =3D=3D entry['ab=
brev-status']:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
&gt; +&nbsp;&nbsp;&nbsp; # Update like in {'abbrev-status': 'Patched', 'sta=
tus': 'version-not-in-range'} to<br>
&gt; {'abbrev-status': 'Unpatched', 'status': 'version-in-range'}<br>
&gt; +&nbsp;&nbsp;&nbsp; if entry['abbrev-status'] =3D=3D &quot;Unpatched&q=
uot; and cve_data[cve]['abbrev-status'] =3D=3D<br>
&gt; &quot;Patched&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if entry['status'] =3D=3D =
&quot;version-in-range&quot; and cve_data[cve]['status'] =3D=3D<br>
&gt; &quot;version-not-in-range&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =
New result from the scan, vulnerable<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[cve] =3D entry<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb=
.debug(&quot;CVE entry %s update from Patched to Unpatched from the<br>
&gt; scan result&quot; % cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn<br>
&gt; +&nbsp;&nbsp;&nbsp; if entry['abbrev-status'] =3D=3D &quot;Patched&quo=
t; and cve_data[cve]['abbrev-status'] =3D=3D<br>
&gt; &quot;Unpatched&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if entry['status'] =3D=3D =
&quot;version-not-in-range&quot; and cve_data[cve]['status'] =3D=3D<br>
&gt; &quot;version-in-range&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =
Range does not match the scan, but we already have a vulnerable<br>
&gt; match, ignore<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb=
.debug(&quot;CVE entry %s update from Patched to Unpatched from the<br>
&gt; scan result - not applying&quot; % cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn<br>
&gt; +&nbsp;&nbsp;&nbsp; # If we have an &quot;Ignored&quot;, it has a prio=
rity<br>
&gt; +&nbsp;&nbsp;&nbsp; if cve_data[cve]['abbrev-status'] =3D=3D &quot;Ign=
ored&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.debug(&quot;CVE %s not =
updating because Ignored&quot; % cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
&gt; +&nbsp;&nbsp;&nbsp; bb.warn(&quot;Unhandled CVE entry update for %s fr=
om %s to %s&quot; % (cve,<br>
&gt; cve_data[cve], entry))<br>
&gt; +<br>
&gt; +def check_cves(d, cve_data):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Connect to the NVD database and find unp=
atched cves.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; @@ -297,28 +341,19 @@ def check_cves(d, patched_cves):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; real_pv =3D d.getVar(&quot;PV&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; suffix =3D d.getVar(&quot;CVE_VERSION_SU=
FFIX&quot;)<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; cves_unpatched =3D []<br>
&gt; -&nbsp;&nbsp;&nbsp; cves_ignored =3D []<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cves_status =3D []<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cves_in_recipe =3D False<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # CVE_PRODUCT can contain more than one =
product (eg. curl/libcurl)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; products =3D d.getVar(&quot;CVE_PRODUCT&=
quot;).split()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # If this has been unset then we're not =
scanning for CVEs here (for example,<br>
&gt; image recipes)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not products:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ([], [], [], [])<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ([], [])<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pv =3D d.getVar(&quot;CVE_VERSION&quot;)=
.split(&quot;+git&quot;)[0]<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # If the recipe has been skipped/ignored=
 we return empty lists<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if pn in d.getVar(&quot;CVE_CHECK_SKIP_R=
ECIPE&quot;).split():<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.note(&quot;Re=
cipe has been skipped by cve-check&quot;)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ([], [], [], [])<br=
>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp; # Convert CVE_STATUS into ignored CVEs and check v=
alidity<br>
&gt; -&nbsp;&nbsp;&nbsp; cve_ignore =3D []<br>
&gt; -&nbsp;&nbsp;&nbsp; for cve in (d.getVarFlags(&quot;CVE_STATUS&quot;) =
or {}):<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; decoded_status =3D decode_=
cve_status(d, cve)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'mapping' in decoded_st=
atus and decoded_status['mapping'] =3D=3D<br>
&gt; &quot;Ignored&quot;:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_ignore.append(cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ([], [])<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import sqlite3<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; db_file =3D d.expand(&quot;file:${CVE_CH=
ECK_DB_FILE}?mode=3Dro&quot;)<br>
&gt; @@ -337,11 +372,10 @@ def check_cves(d, patched_cves):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for cverow in cv=
e_cursor:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; cve =3D cverow[0]<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 cve in cve_ignore:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 cve_is_ignored(d, cve_data, cve):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.note(&quot;%s-%s ignores %s&quot; % (pro=
duct, pv, cve))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; cves_ignored.append(cve)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; el=
if cve in patched_cves:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; el=
if cve_is_patched(d, cve_data, cve):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.note(&quot;%s has been patched&quot; % (=
cve))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; # Write status once only for each product<br>
&gt; @@ -357,7 +391,7 @@ def check_cves(d, patched_cves):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; for row in product_cursor:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (_, _, _, version_start, operator_start, ve=
rsion_end, operator_end) =3D row<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #bb.debug(2, &quot;Evaluating row &quot; + =
str(row))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if cve in cve_ignore:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if cve_is_ignored(d, cve_data, cve):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ignored =3D True<br=
>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version_start =3D convert_cve_version(versi=
on_start)<br>
&gt; @@ -396,16 +430,16 @@ def check_cves(d, patched_cves):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if vulnerable:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ignored:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; bb.note(&quot;%s is ignored in %s-%s&quot; % (cve, pn, real_pv))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cves_=
ignored.append(cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_u=
pdate(d, cve_data, cve, {&quot;abbrev-status&quot;: &quot;Ignored&quot;})<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; bb.note(&quot;%s-%s is vulnerable to %s&quot; % (pn, real_pv, cve))<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cves_=
unpatched.append(cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_u=
pdate(d, cve_data, cve, {&quot;abbrev-status&quot;: &quot;Unpatched&quot;,<=
br>
&gt; &quot;status&quot;: &quot;version-in-range&quot;})<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; product_cursor.close()<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if not vulnerable:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.note(&quot;%s-%s is not vulnerable to %s=
&quot; % (pn, real_pv, cve))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; patched_cves.add(cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; cve_update(d, cve_data, cve, {&quot;abbrev-status&quo=
t;: &quot;Patched&quot;, &quot;status&quot;:<br>
&gt; &quot;version-not-in-range&quot;})<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_cursor.close=
()<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not cves_in_p=
roduct:<br>
&gt; @@ -413,49 +447,46 @@ def check_cves(d, patched_cves):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; cves_status.append([product, False])<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conn.close()<br>
&gt; -&nbsp;&nbsp;&nbsp; diff_ignore =3D list(set(cve_ignore) - set(cves_ig=
nored))<br>
&gt; -&nbsp;&nbsp;&nbsp; if diff_ignore:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe.qa.handle_error(&quot;c=
ve_status_not_in_db&quot;, &quot;Found CVE (%s) with<br>
&gt; CVE_STATUS set that are not found in database for this component&quot;=
 % &quot;<br>
&gt; &quot;.join(diff_ignore), d)<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not cves_in_recipe:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.note(&quot;No=
 CVE records for products in recipe %s&quot; % (pn))<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; return (list(cves_ignored), list(patched_cves), cv=
es_unpatched, cves_status)<br>
&gt; +&nbsp;&nbsp;&nbsp; return (cve_data, cves_status)<br>
&gt; <br>
&gt; -def get_cve_info(d, cves):<br>
&gt; +def get_cve_info(d, cve_data):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Get CVE information from the database.<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import sqlite3<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; cve_data =3D {}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; db_file =3D d.expand(&quot;file:${CVE_CH=
ECK_DB_FILE}?mode=3Dro&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conn =3D sqlite3.connect(db_file, uri=3D=
True)<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; for cve in cves:<br>
&gt; +&nbsp;&nbsp;&nbsp; for cve in cve_data:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cursor =3D conn.=
execute(&quot;SELECT * FROM NVD WHERE ID IS ?&quot;, (cve,))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for row in curso=
r:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]] =3D {}<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;summary&quot;] =3D row[1]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;scorev2&quot;] =3D row[2]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;scorev3&quot;] =3D row[3]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;scorev4&quot;] =3D row[4]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;modified&quot;] =3D row[5]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;vector&quot;] =3D row[6]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;vectorString&quot;] =3D row[7]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =
The CVE itdelf has been added already<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 row[0] not in cve_data:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bb.note(&quot;CVE record %s not present&quot; % row[0=
])<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; continue<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #c=
ve_data[row[0]] =3D {}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;NVD-summary&quot;] =3D row[1]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;NVD-scorev2&quot;] =3D row[2]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;NVD-scorev3&quot;] =3D row[3]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;NVD-scorev4&quot;] =3D row[4]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;NVD-modified&quot;] =3D row[5]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;NVD-vector&quot;] =3D row[6]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_data[row[0]][&quot;NVD-vectorString&quot;] =3D row[7]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cursor.close()<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conn.close()<br>
&gt; -&nbsp;&nbsp;&nbsp; return cve_data<br>
&gt; <br>
&gt; -def cve_write_data_text(d, patched, unpatched, ignored, cve_data):<br=
>
&gt; +def cve_write_data_text(d, cve_data):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Write CVE information in WORKDIR; and to=
 CVE_CHECK_DIR, and<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CVE manifest if enabled.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; from oe.cve_check import decode_cve_status<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_file =3D d.getVar(&quot;CVE_CHECK_LO=
G&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fdir_name&nbsp; =3D d.getVar(&quot;FILE_=
DIRNAME&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; layer =3D fdir_name.split(&quot;/&quot;)=
[-3]<br>
&gt; @@ -472,7 +503,7 @@ def cve_write_data_text(d, patched, unpatched, ign=
ored,<br>
&gt; cve_data):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Early exit, the text format does not r=
eport packages without CVEs<br>
&gt; -&nbsp;&nbsp;&nbsp; if not patched+unpatched+ignored:<br>
&gt; +&nbsp;&nbsp;&nbsp; if not len(cve_data):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nvd_link =3D &quot;<a href=3D"https://nv=
d.nist.gov/vuln/detail/">https://nvd.nist.gov/vuln/detail/</a>&quot;<br>
&gt; @@ -481,37 +512,30 @@ def cve_write_data_text(d, patched, unpatched,<b=
r>
&gt; ignored, cve_data):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.utils.mkdirhier(os.path.dirname(cve_f=
ile))<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for cve in sorted(cve_data):<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_patched =3D cve in patc=
hed<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_ignored =3D cve in igno=
red<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;Unpatched=
&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_patched or is_ignor=
ed) and not report_all:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not report_all and (cve=
_data[cve][&quot;abbrev-status&quot;] =3D=3D &quot;Patched&quot; or<br>
&gt; cve_data[cve][&quot;abbrev-status&quot;] =3D=3D &quot;Ignored&quot;):<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; continue<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if is_ignored:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; st=
atus =3D &quot;Ignored&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif is_patched:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; st=
atus =3D &quot;Patched&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =
default value of status is Unpatched<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; un=
patched_cves.append(cve)<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=
=3D &quot;LAYER: %s\n&quot; % layer<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=
=3D &quot;PACKAGE NAME: %s\n&quot; % d.getVar(&quot;PN&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=
=3D &quot;PACKAGE VERSION: %s%s\n&quot; % (d.getVar(&quot;EXTENDPE&quot;),<=
br>
&gt; d.getVar(&quot;PV&quot;))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=
=3D &quot;CVE: %s\n&quot; % cve<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=3D &quot;CV=
E STATUS: %s\n&quot; % status<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status_details =3D decode_=
cve_status(d, cve)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'detail' in status_deta=
ils:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVE DETAIL: %s\n&quot; % status_details['detail']<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'description' in status=
_details:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVE DESCRIPTION: %s\n&quot; % status_details['descrip=
tion']<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=3D &quot;CV=
E SUMMARY: %s\n&quot; % cve_data[cve][&quot;summary&quot;]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=3D &quot;CV=
SS v2 BASE SCORE: %s\n&quot; % cve_data[cve][&quot;scorev2&quot;]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=3D &quot;CV=
SS v3 BASE SCORE: %s\n&quot; % cve_data[cve][&quot;scorev3&quot;]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=3D &quot;CV=
SS v4 BASE SCORE: %s\n&quot; % cve_data[cve][&quot;scorev4&quot;]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=3D &quot;VE=
CTOR: %s\n&quot; % cve_data[cve][&quot;vector&quot;]<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=3D &quot;VE=
CTORSTRING: %s\n&quot; % cve_data[cve][&quot;vectorString&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=3D &quot;CV=
E STATUS: %s\n&quot; % cve_data[cve][&quot;abbrev-status&quot;]<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'status' in cve_data[cv=
e]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVE DETAIL: %s\n&quot; % cve_data[cve][&quot;status&q=
uot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'justification' in cve_=
data[cve]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVE DESCRIPTION: %s\n&quot; %<br>
&gt; cve_data[cve][&quot;justification&quot;]<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quot;NVD-summary&quot;=
 in cve_data[cve]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVE SUMMARY: %s\n&quot; % cve_data[cve][&quot;NVD-<br=
>
&gt; summary&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVSS v2 BASE SCORE: %s\n&quot; % cve_data[cve][&quot;=
NVD-<br>
&gt; scorev2&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVSS v3 BASE SCORE: %s\n&quot; % cve_data[cve][&quot;=
NVD-<br>
&gt; scorev3&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;CVSS v3 BASE SCORE: %s\n&quot; % cve_data[cve][&quot;=
NVD-<br>
&gt; scorev4&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;VECTOR: %s\n&quot; % cve_data[cve][&quot;NVD-vector&q=
uot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite_string +=3D &quot;VECTORSTRING: %s\n&quot; % cve_data[cve][&quot;NVD-<b=
r>
&gt; vectorString&quot;]<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_string +=
=3D &quot;MORE INFORMATION: %s%s\n\n&quot; % (nvd_link, cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if cve_data[cve][&quot;abb=
rev-status&quot;] =3D=3D &quot;Unpatched&quot;:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; un=
patched_cves.append(cve)<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if unpatched_cves and d.getVar(&quot;CVE=
_CHECK_SHOW_WARNINGS&quot;) =3D=3D &quot;1&quot;:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.warn(&quot;Fo=
und unpatched CVE (%s), for more information check %s&quot; % (&quot;<br>
&gt; &quot;.join(unpatched_cves),cve_file))<br>
&gt; @@ -563,13 +587,11 @@ def cve_check_write_json_output(d, output, direc=
t_file,<br>
&gt; deploy_file, manifest_fi<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with open(index_=
path, &quot;a+&quot;) as f:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; f.write(&quot;%s\n&quot; % fragment_path)<br>
&gt; <br>
&gt; -def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve=
_status):<br>
&gt; +def cve_write_data_json(d, cve_data, cve_status):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Prepare CVE data for the JSON format, th=
en write it.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; from oe.cve_check import decode_cve_status<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output =3D {&quot;version&quot;:&quot;1&=
quot;, &quot;package&quot;: []}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nvd_link =3D &quot;<a href=3D"https://nv=
d.nist.gov/vuln/detail/">https://nvd.nist.gov/vuln/detail/</a>&quot;<br>
&gt; <br>
&gt; @@ -587,8 +609,6 @@ def cve_write_data_json(d, patched, unpatched, ign=
ored,<br>
&gt; cve_data, cve_status):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if include_layers and layer not in inclu=
de_layers:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; unpatched_cves =3D []<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; product_data =3D []<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for s in cve_status:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p =3D {&quot;pro=
duct&quot;: s[0], &quot;cvesInRecord&quot;: &quot;Yes&quot;}<br>
&gt; @@ -603,40 +623,32 @@ def cve_write_data_json(d, patched, unpatched,<b=
r>
&gt; ignored, cve_data, cve_status):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;version&qu=
ot; : package_version,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;products&q=
uot;: product_data<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_list =3D []<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for cve in sorted(cve_data):<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_patched =3D cve in patc=
hed<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_ignored =3D cve in igno=
red<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;Unpatched=
&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_patched or is_ignor=
ed) and not report_all:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not report_all and (cve=
_data[cve][&quot;abbrev-status&quot;] =3D=3D &quot;Patched&quot; or<br>
&gt; cve_data[cve][&quot;abbrev-status&quot;] =3D=3D &quot;Ignored&quot;):<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; continue<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if is_ignored:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; st=
atus =3D &quot;Ignored&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif is_patched:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; st=
atus =3D &quot;Patched&quot;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =
default value of status is Unpatched<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; un=
patched_cves.append(cve)<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; issue_link =3D &=
quot;%s%s&quot; % (nvd_link, cve)<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_item =3D {<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &quot;id&quot; : cve,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;summary&quot; : cve_data[cve][&quot;summary&quot;],<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;scorev2&quot; : cve_data[cve][&quot;scorev2&quot;],<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;scorev3&quot; : cve_data[cve][&quot;scorev3&quot;],<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;scorev4&quot; : cve_data[cve][&quot;scorev4&quot;],<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;vector&quot; : cve_data[cve][&quot;vector&quot;],<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;vectorString&quot; : cve_data[cve][&quot;vectorString&quot;],<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;status&quot; : status,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;link&quot;: issue_link<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;status&quot; : cve_data[cve][&quot;abbrev-status&quot;],<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;link&quot;: issue_link,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status_details =3D decode_=
cve_status(d, cve)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'detail' in status_deta=
ils:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;detail&quot;] =3D status_details['detail']<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'description' in status=
_details:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;description&quot;] =3D status_details['description']<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'NVD-summary' in cve_da=
ta[cve]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;summary&quot;] =3D cve_data[cve][&quot;NVD-summary&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;scorev2&quot;] =3D cve_data[cve][&quot;NVD-scorev2&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;scorev3&quot;] =3D cve_data[cve][&quot;NVD-scorev3&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;scorev4&quot;] =3D cve_data[cve][&quot;NVD-scorev4&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;vector&quot;] =3D cve_data[cve][&quot;NVD-vector&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;vectorString&quot;] =3D cve_data[cve][&quot;NVD-vectorString&q=
uot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'status' in cve_data[cv=
e]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;detail&quot;] =3D cve_data[cve][&quot;status&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'justification' in cve_=
data[cve]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;description&quot;] =3D cve_data[cve][&quot;justification&quot;=
]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'resource' in cve_data[=
cve]:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cv=
e_item[&quot;patch-file&quot;] =3D cve_data[cve][&quot;resource&quot;]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_list.append(=
cve_item)<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package_data[&quot;issue&quot;] =3D cve_=
list<br>
&gt; @@ -648,12 +660,12 @@ def cve_write_data_json(d, patched, unpatched,<b=
r>
&gt; ignored, cve_data, cve_status):<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_check_write_json_output(d, output, d=
irect_file, deploy_file, manifest_file)<br>
&gt; <br>
&gt; -def cve_write_data(d, patched, unpatched, ignored, cve_data, status):=
<br>
&gt; +def cve_write_data(d, cve_data, status):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Write CVE data in each enabled format.<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if d.getVar(&quot;CVE_CHECK_FORMAT_TEXT&=
quot;) =3D=3D &quot;1&quot;:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_write_data_text(d, pat=
ched, unpatched, ignored, cve_data)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_write_data_text(d, cve=
_data)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if d.getVar(&quot;CVE_CHECK_FORMAT_JSON&=
quot;) =3D=3D &quot;1&quot;:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_write_data_json(d, pat=
ched, unpatched, ignored, cve_data, status)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_write_data_json(d, cve=
_data, status)<br>
&gt; diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py<br>
&gt; index 767d1a6750..37230b7957 100644<br>
&gt; --- a/meta/lib/oe/cve_check.py<br>
&gt; +++ b/meta/lib/oe/cve_check.py<br>
&gt; @@ -88,7 +88,7 @@ def get_patched_cves(d):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # (cve_match regular expression)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cve_file_name_match =3D re.compile(r&quo=
t;.*(CVE-\d{4}-\d+)&quot;, re.IGNORECASE)<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp; patched_cves =3D set()<br>
&gt; +&nbsp;&nbsp;&nbsp; patched_cves =3D {}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; patches =3D oe.patch.src_patches(d)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.debug(2, &quot;Scanning %d patches fo=
r CVEs&quot; % len(patches))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for url in patches:<br>
&gt; @@ -98,7 +98,7 @@ def get_patched_cves(d):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fname_match =3D =
cve_file_name_match.search(patch_file)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if fname_match:<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; cve =3D fname_match.group(1).upper()<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pa=
tched_cves.add(cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pa=
tched_cves[cve] =3D {&quot;abbrev-status&quot;: &quot;Patched&quot;, &quot;=
status&quot;: &quot;fix-file-<br>
&gt; included&quot;, &quot;resource&quot;: patch_file}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; bb.debug(2, &quot;Found %s from patch file name %s&quot; % (cve, pa=
tch_file))<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Remote patches=
 won't be present and compressed patches won't be<br>
&gt; @@ -124,7 +124,7 @@ def get_patched_cves(d):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; cves =3D patch_text[match.start()+5:match.end()]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; for cve in cves.split():<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.debug(2, &quot;Patch %s solves %s&quot; =
% (patch_file, cve))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; patched_cves.add(cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; patched_cves[cve] =3D {&quot;abbrev-status&quot;: &qu=
ot;Patched&quot;, &quot;status&quot;: &quot;fix-file-<br>
&gt; included&quot;, &quot;resource&quot;: patch_file}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; text_match =3D True<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not fname_mat=
ch and not text_match:<br>
&gt; @@ -133,9 +133,15 @@ def get_patched_cves(d):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Search for additional patched CVEs<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for cve in (d.getVarFlags(&quot;CVE_STAT=
US&quot;) or {}):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; decoded_status =
=3D decode_cve_status(d, cve)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if 'mapping' in decoded_st=
atus and decoded_status['mapping'] =3D=3D<br>
&gt; &quot;Patched&quot;:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb=
.debug(2, &quot;CVE %s is additionally patched&quot; % cve)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pa=
tched_cves.add(cve)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; products =3D d.getVar(&quo=
t;CVE_PRODUCT&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if has_cve_product_match(d=
ecoded_status, products) =3D=3D True:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pa=
tched_cves[cve] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;abbrev-status&quot;: decoded_status[&quot;mappi=
ng&quot;],<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;status&quot;: decoded_status[&quot;detail&quot;=
],<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;justification&quot;: decoded_status[&quot;descr=
iption&quot;],<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;affected-vendor&quot;: decoded_status[&quot;ven=
dor&quot;],<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;affected-product&quot;: decoded_status[&quot;pr=
oduct&quot;]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return patched_cves<br>
&gt; <br>
&gt; @@ -286,3 +292,20 @@ def extend_cve_status(d):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.setVarFlag(&quot;CVE_STATUS&quot;, cve, d=
.getVarFlag(cve_status_group,<br>
&gt; &quot;status&quot;))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; bb.warn(&quot;CVE_STATUS_GROUPS contains undefined variable %s&quot=
; %<br>
&gt; cve_status_group)<br>
&gt; +<br>
&gt; +def has_cve_product_match(detailed_status, products):<br>
&gt; +&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; Check product/vendor match between detailed_status=
 from<br>
&gt; decode_cve_status and a string of<br>
&gt; +&nbsp;&nbsp;&nbsp; products (like from CVE_PRODUCT)<br>
&gt; +&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; for product in products.split():<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vendor =3D &quot;*&quot;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quot;:&quot; in produc=
t:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ve=
ndor, product =3D product.split(&quot;:&quot;, 1)<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vendor =3D=3D detailed=
_status[&quot;vendor&quot;] or detailed_status[&quot;vendor&quot;] =3D=3D &=
quot;*&quot;)<br>
&gt; and \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (p=
roduct =3D=3D detailed_status[&quot;product&quot;] or detailed_status[&quot=
;product&quot;] =3D=3D<br>
&gt; &quot;*&quot;):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn True<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; #if no match, return False<br>
&gt; +&nbsp;&nbsp;&nbsp; return False<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR11MB7405F69FF63FD0022DB20B85DC4EADS0PR11MB7405namp_--

