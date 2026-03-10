Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039A0EB1060
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 14:36:59 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40952.1773151750112634045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 07:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S/sHdO1A;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: mattware@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4605; q=dns/txt;
  s=iport01; t=1773151750; x=1774361350;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=55v6WvKQ8Og6PJEX9dhGbRtnsmhvu/shjNOBh29KyJo=;
  b=S/sHdO1AMG5df1hUOlyTE9PTDBgD8LedytAyTEB89rW3WTC28ZGn9lD8
   A4hTUHHVaaeJ6f22YI4HFuaVjXkoBf4GyKsDH4Ql/VOc+isByvSYs5rzm
   mByRuZzhGEFzx9h0mIWoq7wrke5/+7UglhIGQV3jL9IaqwcVfL3BVDlwZ
   CibYbOqvBH87g3LZME5FGbaNniGBNX/8oFlxeuRZj20Du0UifLt7zYpj1
   UYqddkywIjIYV8kC+E7VVSscbbdLBW7ezd3eYuT6gfWKpptJP3pYhnl88
   g0kG2G4dZ/9Fti1KG0WFzp94gc1+POxWu/SPp+oRqWDRcYp2JbjotIuPY
   A==;
X-CSE-ConnectionGUID: aOm5mxq7S4OuL6Zf6e3TBw==
X-CSE-MsgGUID: 1uAac08mQw+8j5QjItMGrg==
X-IPAS-Result: =?us-ascii?q?A0CsEQAOJbBp/47/Ja1agQklgmgxUwd+AoEPEkmIIwOFL?=
 =?us-ascii?q?Ih8i2SLX4hWDwEBAQ0CLgEIGgQBAYUHAo0gAiY4EwECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAwERWQ4QAgEIBAoDBAEBA?=
 =?us-ascii?q?S4gBwodCAIEDgUIGoJhgh0WBwM2AwECoEsBgT0Ciip4gTSBAd1DDYJegU2FP?=
 =?us-ascii?q?IJ5HgEBKoE1gluBIRmEeicbgUlEgVeCaD6CH0IEAYFfPINXgi8EgiJ6FB2Ib?=
 =?us-ascii?q?YNGhlBSciIDJjMsAVUTFwsHBYEjQwOBBiNLBS0dgSMhHRcUH1gbBwUSISqBS?=
 =?us-ascii?q?XiCAQ+GankDLngOIgIoElw4Ej4LWgWCPwMLbT03FBsDBIE1BY0OXD6CcYEfg?=
 =?us-ascii?q?UKjVIF8oQlxCoQcjB6NPoIAhjIXhASBV6UQmQaCWI86kVuFKQIEAgQFAhABA?=
 =?us-ascii?q?QaBfyWBWXAVgyIJSRkPlzTEJHgCOgIHCwEBAwmTZwEB?=
IronPort-PHdr: A9a23:8y+1GhS15KvQtF0dCPfxbhOT/dpso47LVj580XJvo7tKdqLm+IztI
 wmDo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:i8H4aq24+yYCC7m+5PbD5Yhwkn2cJEfYwER7XKvMYLTBsI5bpzNUz
 jNMWTqFP6yKZDT0f9F2Ptmx905X6MDWydA3SwA63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 rsen+WFYAX7g2UtajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGBWYzYIgI47lMXUZT0
 aIqJm4ANSypmLfjqF67YrEEasULNsLnOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiaC/FMEg9/5JYWme60mmb2aTBwo1OOrq1x6G/WpOB0+Oa8aYqPJIDWG625mG7Bu
 0vP9DypBygFd4ydlAOH026JqfXAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBMRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:LQIOIqqhffdOPkzIH7fSwsAaV5tOLNV00zEX/kB9WHVpm5Oj5q
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
X-Talos-CUID: =?us-ascii?q?9a23=3AsQ3BpGuALH73o5FaAEOvoKJd6IssVXiAyWfJfHT?=
 =?us-ascii?q?kLntNFo+bF1LLxIl7xp8=3D?=
X-Talos-MUID: 9a23:CLDS7Ahz+5fgECML0sKFocMpbdpB6q/2WEU0jtZWuZS9Nw1sHhiHg2Hi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Mar 2026 14:09:09 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 329041800023F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 14:09:09 +0000 (GMT)
X-CSE-ConnectionGUID: Yvy7BK9hRIaPv0GJU6O6NA==
X-CSE-MsgGUID: ewrKHkA+T7mz+oc2w21X/w==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,112,1770595200"; 
   d="scan'208,217";a="68133755"
Received: from mail-dm2pr0701cu00107.outbound.protection.outlook.com (HELO DM2PR0701CU001.outbound.protection.outlook.com) ([40.93.13.71])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Mar 2026 14:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnS9fFay/nBe+3hv5Cous5TXhEzAE3mkmYoiz3SXQglpmjnFs9Z2AvgTY3+9BFse7hwQx33mJmeZp3ME5rPykZzTqgub4/QDMruQP5V9jyf6NypfNUH9pKmDBNOP6KRR/tGVMlMX2X7JZjyXEx4w48/e6fAi4Mv7fIBOqASD4kYoSGtMiFrorufyGosG02+s1ByIkQ5IhR9JErBP7jRKsJPt1EHe+bR7+mrL9elTEWX+1PrY91j+jrJUNaJnjV6Er+27N5OqbB9L/lM1iGdv7iIQZfK+kBf7iwjT69mqpES/+7x3/Wekg4Kb+e6rpBoLRC/7Fa7lbRl9udU/lX8hvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55v6WvKQ8Og6PJEX9dhGbRtnsmhvu/shjNOBh29KyJo=;
 b=oa7ojbsGWMHqgAo5dQLEbWhKUYfYZjLalva041h7hSq2pes8lu8Rb3OnAMtKSL35s36o3yl+4zA4g3n9FxocX16dZsyyZ6tIknHoerhV/ci4myDWlIGc6uRIitZMfvD0NeTB9XRfQ7tB6fkPqUSaoVg+3tg8pzv5VAB1QQHLIuQh3UmpxE4HQfGzQRs1IIyAw5X10L4YYLvKr7ALIccUlMk61drd/nJfH+kCl9gZwC6bMH99vJtl/PQwQrj6moBgjM7FZHhm2XeDitWU0VYPbNbFA0Dk3jpqGXOFispcgigvp/wcKjVWYnVOcniH2IZ4WrfLEgXQ67QwoLiynbj9eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CY8PR11MB7394.namprd11.prod.outlook.com (2603:10b6:930:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 14:09:06 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c833:7d01:2404:671d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c833:7d01:2404:671d%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 14:09:06 +0000
From: "Matthew Ware (mattware)" <mattware@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Elliot Sparling (esparlin)"
	<esparlin@cisco.com>, Robert Yang <liezhi.yang@windriver.com>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] RPM 6 in Wrynose
Thread-Topic: [OE-core] RPM 6 in Wrynose
Thread-Index: AQHcsIcBVqcb/yDdrEaJ311V201mR7Wnt8YAgAANaJo=
Date: Tue, 10 Mar 2026 14:09:06 +0000
Message-ID: 
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
References: 
 <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7705:EE_|CY8PR11MB7394:EE_
x-ms-office365-filtering-correlation-id: 89d67287-61dc-43db-84ef-08de7eae9786
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|8096899003|38070700021|7053199007|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 /dwt1IsWnyYLOFhTBQzpAHQX3inFK3K2TFaG+Srd0ampTdNIiRTvPU7pMiJXqbn0zxBg2Gk+QHkN5aIb3dchwlA+uYbNAI0mMo8Sw8+CPE3i34leSgZwhpX1ykp52xsXov1jbIATTV7bYc/bmrBnY5IjhLOEwA0i1JKtU3Ku/cb13fd+gPsOmwHk04q3a8Eg70q1rouN9iLtnIbErt8sM7rcUj+JAL4rXCx5e6cuRl+7ZexeMZjRtnwZ2wtAJ8KT6eBg+CJBXM4VnaOi9pNr748YiZ0If62e4b1igZYUJETzPgvAOwUcyGF73jwvdpMCVPRkUJtNsmfKaI2t6M57h/9LxXKc9ZDCl5ZoSuZvf4mhSuK+ssRin2rlBIXxGo9juiNEi4gRH5AaLOGe0eYm+E+8ccEEpoHGy+mY8PxE0gz9ba84NzsjSEQraYIEL4Vm6zP1Jjfk82L06SlwEZ6NpHC+Ydfqwhorefpkq3265nC9DcsreuXkoBbjF06CQ27I8alRIrbcNm0EEy/Oa/z2X53BRaAtACakGueOiHs95g7j1eBjCbf8ISX7d9nU7vlbWOu2bJU0fS4lTIXFZ05sPalNbAzDLGoxOt+JM1+F1eZKojSHz0aU6pdJY1HSdtqIrW1DCvzPB4oyKK9r047ufw4TXM03Ef5crnYFywAIbh9a4nJmg8QFmktOxEOaKdvGtPRPCIF+Qx2nQNvHnZ/RiVLIhPc7ssj55pgrakj312bzZ+MeZ343/9nhTsEXLQo4+7XjiYIbp6wFNBlX0nUEPYwIhL3bXga2I3ngRZU7z4s=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7705.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(8096899003)(38070700021)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?UmFkzZ98nKNNtVUOKIfz7Ra5IhuUrgFLxFx8SKHJsqUuIcfNOqo46sBwT8?=
 =?iso-8859-1?Q?dXb2SpARRSKBqMOkTuTfIa57rhjyDVA0ykPAmjhLmjS+XWiKzJ2J1hqY8t?=
 =?iso-8859-1?Q?CzphTeMc4PBpUX2q4a1NuX5/1oQFTbgTn6twIw8aGAhFjyrWBuZZM9v0Fj?=
 =?iso-8859-1?Q?ezloC/fIGgdTAHhpYsfGn1dDynfFw5a1ww2kxywy+d0aCi7DEo1p97YuyB?=
 =?iso-8859-1?Q?LqFTJ2Sw9+cfsrCsOZlmgcIYeTWxwmGR+vKKDZML+YdNBObKB4hDNhy7f0?=
 =?iso-8859-1?Q?SL75r4JliYjl3JO9alU0nsCT3rwNJT6xB/iUxZHfuwzrcYKeuXZEDvS1lz?=
 =?iso-8859-1?Q?FYjom+nHtV1m0ar51oS5MLoL/VGfNEq+n/0ee+Q3Z1bG7abKQYPcElAUTF?=
 =?iso-8859-1?Q?DBl86L7Ol8sQVSZppPtFcowxx523fF+jInSAD8+IeWrw/QfurLD1G2EmQw?=
 =?iso-8859-1?Q?B0Zffpz1ZFyghKxN0mR3kgsYPOP0V60RpguQqHH+S3nijpa6Y7++hqhCcz?=
 =?iso-8859-1?Q?ycDpVVMGuWiIQi6Rs3uub5cHzQnesFnsxIl2bLbj0LOsnGIIAHI3/M8Qtf?=
 =?iso-8859-1?Q?qQtLg4b9QVSDfKWs/1cuyO5/y5vIh9F3R8NBioyOVow0wGgrqrSAwFfii2?=
 =?iso-8859-1?Q?28idQFHVqt5w0LphpEyjhu0QP+vRV+e/vFqr9utDIh0EmVl0oOESgKLFhp?=
 =?iso-8859-1?Q?wL8XFZfBLtjuZTpu1qMHiQ3nYXZwnCtzciVoRIhL9gY5LpgnBRayiIxDFe?=
 =?iso-8859-1?Q?Ms3exD+XpvfVkOtf5JinLROG2kFO6cgZHjtv/02HZ4VG0pcKiSzDHcGUsn?=
 =?iso-8859-1?Q?xtTSfIyXAnSflcjXjwq3TjyczcGZ/7YM6im1fgMaMflieWB+licm654E9x?=
 =?iso-8859-1?Q?qf4Uc9SvtPzZWXhAWdzfFqGNPTtQRsfYRCPpks3gN4tPCS5j55l2n46sc5?=
 =?iso-8859-1?Q?AgWnm4bWllPlXa4QIsW3ANecf7vEu1fql1SuDITLhAG0SZWlK+JOaI1YT0?=
 =?iso-8859-1?Q?+Jd+/rPAoi5X74GYZqhWObVHDMohwxgYzGQBFRq3ZxTpSlzmR8BiWTzXVW?=
 =?iso-8859-1?Q?9HmTGSlkh1M//T53jMilbfEaohrAXVIM5l+LhjiFeb9aL3cl1JPQkA9i+P?=
 =?iso-8859-1?Q?MuApeA1IMKLiYZ5I61sLAujpTxHUtTA1UNgcxlo2qtzjXRK5T+RACN0yyi?=
 =?iso-8859-1?Q?+xsA6N+z0EAi7rCssTXCyI10ETyj8MWSn8gsHafK93BlpHR1+J8DIL8Ovy?=
 =?iso-8859-1?Q?Y9D/HGowawMZd8hKmtJ0ByFHt3Hs9F7NpOgp9Sm318B8QArRUkzG4C6KL2?=
 =?iso-8859-1?Q?agESe9KgdDRJpmTol+5lBKcJwHX8+Yn6pvYdTyI9lTi8mFDzDFlPviisY0?=
 =?iso-8859-1?Q?Vd3HFx3mRDxpkFatRTsaepfS4mrhS08OCPMB0lTyPBBPJmzHftEQFNduYU?=
 =?iso-8859-1?Q?1ZaMV2zPe3JPWh23G7aezeiwFMsplhVQrHgQOHh7kPPgCoz5MYBnF6XP2e?=
 =?iso-8859-1?Q?yyzRgIk7L0baVMJszoqKvFMCgcyqAkSHVGGp1ctct4aYmvoWxUojaAhsWV?=
 =?iso-8859-1?Q?/3avcbz+Yv9Mtst//ocNJp74v/maOdpkuHlNzvxvirbeEKP1E6jUHKpEJD?=
 =?iso-8859-1?Q?IXNtpWHTRa9yedgmTDo/1pjOfTV8VcdO3XOPTM77x9TFPCiJmxP3AOaD7A?=
 =?iso-8859-1?Q?M9byfLJmP4m1ritzOBdb2uNSgJ0kFQJN1G3VNZNdDxVgnXveDWv/bZ+Pgj?=
 =?iso-8859-1?Q?tQ9B4T7Zs/JWnwg/qZN9ENHpoN+BCgu+VS0UUfMPSzNdjpk2eB2tS+5ul8?=
 =?iso-8859-1?Q?CR/NNMSyMvtSo61Dy68CskbzzhTzHjrcoTey9vUJSQoinZPPyWg3?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	eRZb9otAIc0deaRvQrZk18CeaORBpjcwEVSPPKS+Oc9Q7T0eRv2GgyhV/b+3DwlRp3DvWu0dwY06+X9Ybrb6CKZLaDtNQkKIU0o4cnswzImW47xnPj8CAkHyDdu+RF/22zrtUEhqq0Ch8q9dg/Nx5j40vtgcsNLDk6CxZXEvd/xbWR8ppp2ghHAMeXbLnUHdlQn9RmR0BZPrPI5N1bjGIADTD5McFmLrFvdVSDtDygq3sfQPU6Wa6DiDE/aodLfgWmgTPxkS2Rj3uerszspH91XaI45rBFafH2gvscknYZnAOsW97bRxVO0nkymyC7dIVK8gbMus/7YzIrkANZsKeg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d67287-61dc-43db-84ef-08de7eae9786
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 14:09:06.4154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0t1Mal2y3DF8WBjBRnZMdeIAIN+KQKJ4xHsb1H3ZUz0cJQX6EmMzJD5rIS6B6sm/uoH8cnVftzQygkg1Xj3+9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7394
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN7PR11MB770587ED31BE8EE18D973740CD46ASN7PR11MB7705namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 14:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232792

--_000_SN7PR11MB770587ED31BE8EE18D973740CD46ASN7PR11MB7705namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm not sure if we'd be able to help, I certainly don't have any expertise =
in OE. What are the remaining issues, and when do they need to be resolved =
by to make it into Wrynose? I'll see whether we can offer any help.


________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Tuesday, March 10, 2026 12:50 PM
To: Matthew Ware (mattware) <mattware@cisco.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Elliot Sparling (esparlin) <esparlin@cisco.com>; Robert Yang =
<liezhi.yang@windriver.com>; Mathieu Dubois-Briand <mathieu.dubois-briand@b=
ootlin.com>
Subject: Re: [OE-core] RPM 6 in Wrynose

On Tue, 10 Mar 2026 at 13:24, Matthew Ware (mattware) via
lists.openembedded.org <mattware=3Dcisco.com@lists.openembedded.org>
wrote:
> I see that the next OpenEmbedded release, Wrynose, currently uses RPM 4.2=
0.1, but that there are efforts to use RPM 6 instead. I was wondering, what=
 is the current state of the RPM 6 effort? Is it looking likely that Wrynos=
e will take RPM 6?

It still has issues, so whether the update makes it in wrynose is
unclear, and the effort may not be ready in time. Rpm updates tend to
break all over the place in all kinds of corner cases, and fixing
issues often reveals new issues, especially when the person working on
the update isn't able to run yocto CI pipeline themselves.

If rpm 6 in wrynose is important to you, help is very welcome.
Mathieu/Robert should be able point to particular remaining issues.

Alex

--_000_SN7PR11MB770587ED31BE8EE18D973740CD46ASN7PR11MB7705namp_
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
I'm not sure if we'd be able to help, I certainly don't have any expertise =
in OE. What are the remaining issues, and when do they need to be resolved =
by to make it into Wrynose? I'll see whether we can offer any help.</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, March 10, 2026 12:50 PM<br>
<b>To:</b>&nbsp;Matthew Ware (mattware) &lt;mattware@cisco.com&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;; Elliot Sparling (esparlin) &lt;esparlin@cis=
co.com&gt;; Robert Yang &lt;liezhi.yang@windriver.com&gt;; Mathieu Dubois-B=
riand &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] RPM 6 in Wrynose </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Tue, 10 Mar 2026 at 13:24, Matthew Ware =
(mattware) via<br>
lists.openembedded.org &lt;mattware=3Dcisco.com@lists.openembedded.org&gt;<=
br>
wrote:<br>
&gt; I see that the next OpenEmbedded release, Wrynose, currently uses RPM =
4.20.1, but that there are efforts to use RPM 6 instead. I was wondering, w=
hat is the current state of the RPM 6 effort? Is it looking likely that Wry=
nose will take RPM 6?<br>
<br>
It still has issues, so whether the update makes it in wrynose is<br>
unclear, and the effort may not be ready in time. Rpm updates tend to<br>
break all over the place in all kinds of corner cases, and fixing<br>
issues often reveals new issues, especially when the person working on<br>
the update isn't able to run yocto CI pipeline themselves.<br>
<br>
If rpm 6 in wrynose is important to you, help is very welcome.<br>
Mathieu/Robert should be able point to particular remaining issues.<br>
<br>
Alex<br>
</div>
</body>
</html>

--_000_SN7PR11MB770587ED31BE8EE18D973740CD46ASN7PR11MB7705namp_--

