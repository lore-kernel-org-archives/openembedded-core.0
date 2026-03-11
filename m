Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4C41125857
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 16:56:50 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.887.1773243750447523892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 08:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YdBmc7MO;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: mattware@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8663; q=dns/txt;
  s=iport01; t=1773243750; x=1774453350;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=CPBpGV6cKg6wfyb7Z60p9VMpQvlC4RNqVvvCii0BoMA=;
  b=YdBmc7MOG6qlcPqTEGHoqHgnWhJIH0iQwOLt3j+2eZ5xslDs6G/MYBGu
   SM8RDtyf4i0N38CcFdAQ9T+W5KkVg0gXmXaz+wWhA9LOt79Ly3fBeyFHP
   thlsYJ9SBmFH4WdrfyaiUCoz+MWtk8WFBYRDsNeuKAzBjR3tstNLSPWnu
   MOAJ5+b9anr/VvFQfy0WPJK6MvhlltQNaJ2P6ihifHfEMv3H2E3Fpfvyp
   GFMvu/tLe4SoV+RrlPIg7M0nqiK8H6ug9UEaI1lhS8hbztfcZG9byyeVb
   yUkHuVTTKLtpAcjFtV0T957NWk75eF5Q/hd2NeRVnZUV2K9biCiaLUXUX
   g==;
X-CSE-ConnectionGUID: V2Rg8FgTQJWWlmAGatqxyw==
X-CSE-MsgGUID: 4/MI7abGSO6J2H2NKZ8cvA==
X-IPAS-Result: =?us-ascii?q?A0D6EAALjLFp/5AQJK1agQklgSuBPTFTB34CgQ8SSYgjA?=
 =?us-ascii?q?4UsiHyLZItfiFYPAQEBDQIuAQgaBAEBhQcCjSICJjcGDgECBAEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAgEBEVkOBQsCAQgOA?=
 =?us-ascii?q?wQBAQEuIAcKHQgCBAENBQgagmGCHRYHAw8nAwECDqNTAYE9AooqeIE0gQHdQ?=
 =?us-ascii?q?w2CWAaBTYU8gnkeAQEqgTWCW4EhGRsghD8nG4FJRIFXgmg+gh9CAoFREYQTg?=
 =?us-ascii?q?i8EgiJ6FB2BY4cKg0OGVlJyIgMmMywBVRMXCwcFgSNDAyovLSNLBS0dgSMhH?=
 =?us-ascii?q?RcUH1gbBwUSISoHgUF4ggEPhmh5Ay54DiICKBJcgQYLWgWCLAIcAwttPTcUG?=
 =?us-ascii?q?wMEgTUFjQ9cPYNDK4FeZpMnOI8VgXygPE1xCoQcjB6NPoIAhjIXqmuZBiKLB?=
 =?us-ascii?q?IJjhAmXBAIEAgQFAhABAQaBfiaBWXAVgyJSGQ+SIckBeDwCBwsBAQMJkWyBe?=
 =?us-ascii?q?wEB?=
IronPort-PHdr: A9a23:WxYkzR3dFPfoE8+vsmDPmlBlVkEcU/3cJAUZ7N8gk71RN/7l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:wHrX1qq4ttXQJwPFgfRB4YmBNpleBmJAZBIvgKrLsJaIsI4StFCzt
 garIBmHM/6NZzSjf94naYm08xwG7Z7Wz9BkQFZvrHoxRCpAp+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrY8Uo35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tgtO24e2
 /MkERIyURSGrs2/3KurW/Y506zPLOGzVG8eknhkyTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtLYH49tL/Aan3XdjREtE2cv6cf6GnIxws327/oWDbQUoDXFJoJxB3F/
 woq+UylRTQ7a9WV5gGirFD2prXpvhGrU5w7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YeLtcnr8QxAzct0
 zdlgu/UONCmi5XMIVq1/baPpjT0Mi8QRVLurwdeJefZy7EPeL0Osy8=
IronPort-HdrOrdr: A9a23:rMblwqr4+oSIpuHAcQjGXZEaV5tOLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6H/BEDhex/hHZ4c2/h2AV7QZniWhILIFvAs0WKM+UybJ8STzJ846U
 4kSdkANDSSNyk1sS+Z2njELz9I+rDum87Y55a6854ud3AXV0gK1XYBNu/vKDwMeOAwP+tAKH
 Pz3LshmxOQPV4sQoCQAH4DU+Lfp9vNuq7HTHc9bSIP2U2ltx/tzKT1PSS5834lPg9n8PMP4G
 LFmwv26uGZte2nyhjT7mnX755HstrswNlOCaW3+4kowzPX5TqAVcBEYfmvrTo1qOag5BIBi9
 /XuSotOMx19jf4Yny1iQGF4Xii7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBH1r
 5R1W7xjesUMfqAplW52zH7bWAsqqOGmwtlrQfVtQ0HbWIqUs4UkWXYxjIMLH5PJlOg1GltKp
 gfMCiV3ockTbrdVQGYgoGqq+bcA0ja2Xy9MxI/UsD56UkloFlpi0Qf38ARhXEG6dY0TIRF/f
 3NNuBymKhJVdJ+V9M2OA4te7r+NoX2e2OGDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiJ8/go
 7IXl9UvXM7PxuGM7zD4LRbthTWBGmtVzXkzc9To5B/p73nXbLudSmOUkonncesq+gWRsfbR/
 GwMpRLBOKLFxqiJa9ZmwnlH5VCI3gXV8MY/t49RlKVu8rObpbns+TKGcyjbYYF0QxULF8XLk
 FzKwQbfv8wm3xDckWI9CTsZw==
X-Talos-CUID: =?us-ascii?q?9a23=3AyHZJ0GqKkVJ0ibEbubNPYWjmUf5/SHKN4njsGm2?=
 =?us-ascii?q?HNmJsYZKcVUaA6bwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ar8/+nQ8ooYWzEjOoQQZkHSyQf5svxoXxAUoiqrJ?=
 =?us-ascii?q?YmZOkbwpTCWeWkh3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Mar 2026 15:42:28 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 924A51800036A
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 15:42:28 +0000 (GMT)
X-CSE-ConnectionGUID: Hr4a/ZXcTKalgZc2tiad1Q==
X-CSE-MsgGUID: EKsAkyExR+udh+3ysOYluA==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,113,1770595200"; 
   d="scan'208,217";a="53009187"
Received: from mail-dm2pr0701cu00100.outbound.protection.outlook.com (HELO DM2PR0701CU001.outbound.protection.outlook.com) ([40.93.13.64])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Mar 2026 15:42:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcoebf0thtH4eW1OxYURlnruFeTAWYq7+sAbr1MiyNB4bGXfLDmDJ/EyLNPJb2hpweHKuRM0hzvvLPxOsODXIcniL+JsXgFpKyDzqU15Fjcauw1UxhpKf2x+8fXaWauG7Cndx8WkA1FsmD4wR+5ekqUPhxDvPRBpUmopNQxoOUxtUunEFmLaoYVVg6f/qCm5hxVbFXwRv1KUcQmZFb2VfA6hC6wPX68omMaDSxZSafb3pXZd5rgi+iO3eGcTwYcUvhdx7r0435Oc3am0eqGPhvRbw6bld+j0M71ioNUvMdXjenbrR+Gtldx5F2EsvuNRJlmneNtKWdCnaE+nkjv+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPBpGV6cKg6wfyb7Z60p9VMpQvlC4RNqVvvCii0BoMA=;
 b=ezH1JFdu9xtUf0MefTCogEc87TMdd4SDAKbvM7y0XH6D+QEZyVGt57z5rOCcQjKAR5b4y2QPHA0Uzyt8UvpDWhBvFtnPlvXsX9uhgsbMVldid88brfDha84c3xaUUGQq4f92SR2ZCBA7xBHopgi0AVkGe/vYDduCxpftfUVcKqEPclFmRphxQJ3bpwxzjPvFyHhZ5c85QU1SVrIXEpHW9qEKpTefHh0qutm1EmabCnMtwgeOoPvDdYbXwBvYd0cmMYUNjJBRZcCgWYuMEkx+V6ro4Ais7Et4e9Wwh3YvZJoycyZkKURBmyJ//yBUofdZlkaaQFaE++JmPTZsX92mhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 15:42:25 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c833:7d01:2404:671d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c833:7d01:2404:671d%3]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 15:42:24 +0000
From: "Matthew Ware (mattware)" <mattware@cisco.com>
To: Robert Yang <liezhi.yang@windriver.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Elliot Sparling (esparlin)"
	<esparlin@cisco.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, "adam.duskett@amarulasolutions.com"
	<adam.duskett@amarulasolutions.com>
Subject: Re: [OE-core] RPM 6 in Wrynose
Thread-Topic: [OE-core] RPM 6 in Wrynose
Thread-Index: 
 AQHcsIcBVqcb/yDdrEaJ311V201mR7Wnt8YAgAANaJqAAD75P4AAAMsAgAAAfRmAATvbgIAAN8PN
Date: Wed, 11 Mar 2026 15:42:24 +0000
Message-ID: 
 <SN7PR11MB7705A4E28D635E7CA5B10512CD47A@SN7PR11MB7705.namprd11.prod.outlook.com>
References: 
 <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
 <SN7PR11MB77053FF5985F085C57270866CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <f2209b0a-c297-463c-97bc-7139732c498c@windriver.com>
In-Reply-To: <f2209b0a-c297-463c-97bc-7139732c498c@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7705:EE_|SJ0PR11MB5024:EE_
x-ms-office365-filtering-correlation-id: e12c391f-a56a-4966-7f94-08de7f84cae3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003|13003099007|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 lIVnkdGFrgQTglnYIoq7UZi30PffzcavGd5pvps2cZl8PihD+3V8VcHNJnEChAVvMgTEN626COtVZkVVCgxbCWmg/WqVKRS2h87k+/meJS6seNYSy/OsCRNrbF0+V7oaso3RX0hueRx1Nnu7qj3Dulac7jvJKIGQ9pUldaOuYORErW+RBGifZiYOp4OlPa/3Q++LChrk4CE01+y17eEYH9P2zKlBPE6dpvFOBXsXJb4+nf4i5wiLI0AYADYkXRa+kXxf7wrB5s5Eq/LiBawBOAKeAvHGOoBGYmIAedMU5FRKzq8rbX13pRpjcYbZzhM6kO859bKRUZrIW5PF5MUY9oAiX/x5aAisUMquX7AE3sTeErCQWhE+U7HMDhOziB79VJZ9+X59xq08hOY3KeaA145rzx1PQ3z/S69OJVRJLuzLRj1HlG0xe4F3/1aU+Tsw7YHi91XpxDhk164HoAu+RkCrIsyw7/dojLmCZawsGPHKiLQqU4w9kEQynhAZgtIl/PY0X70lqaMaHXNREF8qk8C+zjGonF/sFXIIjIFw1OVPgIeyw6AXDFOBdgNX+nD4v84EkAsPmUl7rSxkzSYCFKBpOyYrK5JjW2aBlPTSQUIuiUiiQLdf7RTZRnAVdsJn5nQyDBFOkFR87NJkirH8dLxYQWQuf3JfkZSn6rs/G4KKdtWvb+4o4xzu4cn4HqsRswZgg9cUeB8+TFMqvUB6k3qFLtP6xgh00dnDRmmJgAbw2tkYFruiaWYI2LvyL1QJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7705.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?rN+6w8+cGgJOSiquP323Hg7mw3+biX09ZN+aNPCIwHR4fcQEGvY8rOkrOj?=
 =?iso-8859-1?Q?v23JLb+qeH2aptKWTW3pEIvtx9WjGfTLtAyOKChd6kyOHzdPaQXhVq04jh?=
 =?iso-8859-1?Q?8+va77SnS0i8vnII3dhGyDpN4e1VSV7v7h2BL+tHxV8w5C11vfgPeq3liA?=
 =?iso-8859-1?Q?JIOcoGI1cAP6OJY77aDDqZaBn63zD/S9J21MYSPJ4msWn6huJXMeP4EAh1?=
 =?iso-8859-1?Q?n4HafLkEgnavkYuFl/4bfd9KIwjE8HfrkZ2jHJhHiKvQRz7vdJoiYmB68a?=
 =?iso-8859-1?Q?20dPVYsZBcGioVXPFtFR6HFWONosb90IUoaG6gYvPAOp7iRhTHwiea26qg?=
 =?iso-8859-1?Q?6NB2L8PwpAOYJFfpeCwKlE9igbOINfGUkrbSvB7iD3qX52bDpoKtUOd79g?=
 =?iso-8859-1?Q?5207bNgl0vP2lUw4yXF8IIW69Rnb6cvWNUB0hCf+9jHmeZLX/8yj2wCfWN?=
 =?iso-8859-1?Q?E9lKBEwDrasqQR0HE4GUZGM/Mce2uXa3k2UkdUkbweVDyumg5uppAEJ5Gd?=
 =?iso-8859-1?Q?JduHqMt9uaPB2rbi9p/7uO9LdCGF29ivXg0bnpX4YJ6u0eM3rr0IFT6byb?=
 =?iso-8859-1?Q?yTTlYTZPry98ftoAmmmeRhDZ81VkwOoj7vpElHMfrndddzw7WVCgppnib5?=
 =?iso-8859-1?Q?OjEfsPA/RKQZ0rc2XGwgrWtFkM9n3lEAx6eOEBkwEwUn+pedJoPDYbhBXI?=
 =?iso-8859-1?Q?kMghXXKTbtl9jBockK4RlXMSJ6JhQAQoPOD5zERsDK09CoXY8qtlqjpend?=
 =?iso-8859-1?Q?zb6SGA+MheR5ixpF0p1lG9AMcEy7IppFja8+CyqacXiwwyjvLlzposSjgv?=
 =?iso-8859-1?Q?a5Peav6YbRhFG547m1YYPpDR3miWjD4cXm3pj2myy1l7s4UH4OwPDtcAn9?=
 =?iso-8859-1?Q?fTzA1KBu7SXVW5gSrQEzTU8DjsVHXtjLhQdeV5f3l4AVWFobFUFsQE9PLC?=
 =?iso-8859-1?Q?+k8RAr0m4FhfRVLz6HkmaPv0UmVa+LEB9hhdH8R56Elb7opaz31MczThPu?=
 =?iso-8859-1?Q?m/a33PBQ6GARSh3lf8MT8jLST7DDnZNRtaN/M4cZzGjYsvdZ3uJxnvsAtl?=
 =?iso-8859-1?Q?77c5fJ7m6I8XkKM98w2hLIMRA0rTBI6Cqo2+LoQuOCGqH6rPvU3JUKNJH2?=
 =?iso-8859-1?Q?rZ7i9RI6kqDASAnFE8HJc3hohxuR1JFw79PxHrKM2xDvSA2bWySS6IIQVj?=
 =?iso-8859-1?Q?K/B1fQ2oHTf/CbYFAqhhG2sf+d61/5+rD+/2H2EclTN8kRxTJlBwkvGD/8?=
 =?iso-8859-1?Q?x3QdvpRVnKvAP2tY9Y3OnCpCr28+D1fmftaEjzzP1QoNQDgBUVuNwZjL1+?=
 =?iso-8859-1?Q?D4j4xDTCpk+T4TT8qik4j0L4WmItAJ+J2ShfXyUAmBt0tqpFr6gZPn/Ky+?=
 =?iso-8859-1?Q?oErnKvZrC3EUJ80PXWT62x/d3rbEHeCSZbXO9IsZHDIpMUKre+trR/h0RX?=
 =?iso-8859-1?Q?Vbs0cdDlMwsSuXoHlnUz5jBh5u3FKEJCm+tG3oYjrpoiKMub4wQTUtu+gr?=
 =?iso-8859-1?Q?OHtBKkLvESSdvTWNzjNpeTzza/gj15aXVBtH4jtxlCro9BG0aJ8rl20dYs?=
 =?iso-8859-1?Q?lRexrEVp9rqhxwgiy8W1FQRUJymX0hJD2TBahmVTBs8XLxuP1A5F2Wcyt4?=
 =?iso-8859-1?Q?pEfl5JmTQV9i7jgR4+9qCgvFUk+RLLUvYW1pXqATroBC5qtH4wySPK4FNE?=
 =?iso-8859-1?Q?gXK0JqxiicbrLxncDJD942PDTOpeG3bbIcrMrZP8uGbBjpSvURdqp2PNhm?=
 =?iso-8859-1?Q?sEmPuNAYCePg3zfHSeTDqrKJheSpvcpetUIekGbdeaAeBi?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	SZW8XK3FSK+s3e+AAhFpB1NI+Rraa1iQCpoJULf0NcWep+iYOtk1w206GHO5coaW1nkrgjLE4jhUNkyXiSWtmKn1sImHQdxqY9eGJ3Fvtuu7b2LHkokbcOqcITf1v+PcQDke12QjFJIUrLQRfvdMifCRhXQjPZxr0kYOjnRhBqhrxlgywI/DVKaxMcQPY+xdyboNnmJxNODIRntUwMnAWMNW1eBMVxQpis1f60Ns0NKttt/qVk8HlA+jT7X7Vn5iWwSzvMMydCJLDgmbQR6kgHu5HGFpF7BCvkf9+Gvlkwpv9GS7YPLrhToSE3+pspAwOFGRJV7bQniPFSWXvEanZw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e12c391f-a56a-4966-7f94-08de7f84cae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 15:42:24.9176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3eAs+YTqmwm6fKqNjdAoZ8s8f3MPHiFz1ovVIaUT8/zAHiN7EO/R/YUtASdorViv6WQxIUsWj3CSHAD3XWf8tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN7PR11MB7705A4E28D635E7CA5B10512CD47ASN7PR11MB7705namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 16:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232897

--_000_SN7PR11MB7705A4E28D635E7CA5B10512CD47ASN7PR11MB7705namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks Robert,

I'm looking internally within the team for whether we have the resources an=
d expertise to be able to help at all :)

If we do find the time/ability to help, we would likely need guidance on wh=
at's been tested already, what needs testing still, how to test, etc.

Thanks,
Matt


________________________________
From: Robert Yang <liezhi.yang@windriver.com>
Sent: Wednesday, March 11, 2026 12:18 PM
To: Matthew Ware (mattware) <mattware@cisco.com>; Alexander Kanavin <alex.k=
anavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Elliot Sparling (esparlin) <esparlin@cisco.com>; Mathieu Dubo=
is-Briand <mathieu.dubois-briand@bootlin.com>; adam.duskett@amarulasolution=
s.com <adam.duskett@amarulasolutions.com>
Subject: Re: [OE-core] RPM 6 in Wrynose



On 3/11/26 20:00, Matthew Ware (mattware) wrote:
> Hi Alex,
>
> Fair question! My team are looking at using yocto 6.0 when it's released,=
 and
> rpm6 has some features we're interested in. If rpm 6 makes it into yocto =
6.0 we

I'm still working on upgrading to 6, here is the latest tmp code:

$ git fetch https://github.com/robertlinux/yocto rbt/rpm_tmp

Currently, it can't provides the pkgconfig files correctly when the pc file=
s are
/usr/share/pkgconfig/, any help is appreciated, for example, help to do mor=
e
testing to find the corner cases.

// Robert

> can start taking advantage of those features, and I want to plan for that=
 :).
> Similar with dnf 5.
>
> Thanks,
> Matt
>
>
> -------------------------------------------------------------------------=
-------
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* Tuesday, March 10, 2026 5:26 PM
> *To:* Matthew Ware (mattware) <mattware@cisco.com>
> *Cc:* openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org>; Elliot Sparling (esparlin) <esparlin@cisco.=
com>;
> Robert Yang <liezhi.yang@windriver.com>; Mathieu Dubois-Briand <mathieu.d=
ubois-
> briand@bootlin.com>; adam.duskett@amarulasolutions.com
> <adam.duskett@amarulasolutions.com>
> *Subject:* Re: [OE-core] RPM 6 in Wrynose
>
> On Tue, 10 Mar 2026 at 18:24, Matthew Ware (mattware)
> <mattware@cisco.com> wrote:
>  > Also, since we're here: is there any plan to move to DNF 5? I see Wryn=
ose is
> staying on 4.x, but wondered if there was a plan/aim for DNF 5.
>
> Yes, there are WIP patches for it too. Adam is working on it.
>
> I have to ask: can you give us some context? What makes you interested
> in having these versions in Yocto?
>
> Alex


--_000_SN7PR11MB7705A4E28D635E7CA5B10512CD47ASN7PR11MB7705namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks Robert,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I'm looking internally within the team for whether we have the resources an=
d expertise to be able to help at all :)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
If we do find the time/ability to help, we would likely need guidance on wh=
at's been tested already, what needs testing still, how to test, etc.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Matt</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Robert Yang &lt;liezhi.yang@windriver.com&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, March 11, 2026 12:18 PM<br>
<b>To:</b>&nbsp;Matthew Ware (mattware) &lt;mattware@cisco.com&gt;; Alexand=
er Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;; Elliot Sparling (esparlin) &lt;esparlin@cis=
co.com&gt;; Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&gt;=
; adam.duskett@amarulasolutions.com &lt;adam.duskett@amarulasolutions.com&g=
t;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] RPM 6 in Wrynose </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;"><br>
<br>
On 3/11/26 20:00, Matthew Ware (mattware) wrote:<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; Fair question! My team are looking at using yocto 6.0 when it's releas=
ed, and<br>
&gt; rpm6 has some features we're interested in. If rpm 6 makes it into yoc=
to 6.0 we<br>
<br>
I'm still working on upgrading to 6, here is the latest tmp code:<br>
<br>
$ git fetch <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAb=
8e1ab22-c7a9-4e70-b71c-3f96e1b225c6" href=3D"https://github.com/robertlinux=
/yocto">
https://github.com/robertlinux/yocto</a>&nbsp;rbt/rpm_tmp<br>
<br>
Currently, it can't provides the pkgconfig files correctly when the pc file=
s are<br>
/usr/share/pkgconfig/, any help is appreciated, for example, help to do mor=
e<br>
testing to find the corner cases.<br>
<br>
// Robert<br>
<br>
&gt; can start taking advantage of those features, and I want to plan for t=
hat :).<br>
&gt; Similar with dnf 5.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Matt<br>
&gt;<br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
----------<br>
&gt; *From:*&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
&gt; *Sent:*&nbsp;Tuesday, March 10, 2026 5:26 PM<br>
&gt; *To:*&nbsp;Matthew Ware (mattware) &lt;mattware@cisco.com&gt;<br>
&gt; *Cc:*&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-<=
br>
&gt; core@lists.openembedded.org&gt;; Elliot Sparling (esparlin) &lt;esparl=
in@cisco.com&gt;;<br>
&gt; Robert Yang &lt;liezhi.yang@windriver.com&gt;; Mathieu Dubois-Briand &=
lt;mathieu.dubois-<br>
&gt; briand@bootlin.com&gt;; adam.duskett@amarulasolutions.com<br>
&gt; &lt;adam.duskett@amarulasolutions.com&gt;<br>
&gt; *Subject:*&nbsp;Re: [OE-core] RPM 6 in Wrynose<br>
&gt;<br>
&gt; On Tue, 10 Mar 2026 at 18:24, Matthew Ware (mattware)<br>
&gt; &lt;mattware@cisco.com&gt; wrote:<br>
&gt;&nbsp; &gt; Also, since we're here: is there any plan to move to DNF 5?=
 I see Wrynose is<br>
&gt; staying on 4.x, but wondered if there was a plan/aim for DNF 5.<br>
&gt;<br>
&gt; Yes, there are WIP patches for it too. Adam is working on it.<br>
&gt;<br>
&gt; I have to ask: can you give us some context? What makes you interested=
<br>
&gt; in having these versions in Yocto?<br>
&gt;<br>
&gt; Alex<br>
<br>
</div>
</body>
</html>

--_000_SN7PR11MB7705A4E28D635E7CA5B10512CD47ASN7PR11MB7705namp_--

