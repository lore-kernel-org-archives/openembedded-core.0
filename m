Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B913106289B
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:06:44 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19334.1773230423950376589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 05:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NO9la36a;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: mattware@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4895; q=dns/txt;
  s=iport01; t=1773230424; x=1774440024;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=XjGr6nKzLPFJ5P/W5jY2ob6wPdmKTXJGF8yGzI3lEs4=;
  b=NO9la36aitdIidAKLvRhIwbtz70ew4Hn9z5CiBnG9ORHSFk5KJtvraxZ
   6ITFZawrPCn+7JzOs/DRgqNSv6jlquVwwpIxMFPIuwNqy1aiwCLvnvbI9
   R/RmjE5Y5dkawFB8prBUTCU+oUy+ybEAp589FOwtfltWf6Bo1rBHGB2Vz
   n9JUqS+XIJSGaT0cGu80OQWbjEq4w+BpBCamN3KU9Ukr8GykZ/seN6mTo
   gl5BriUV/XdXKpv6/71wcXlwz9JFY5bqoyIHXB6dkSEVG4mUiHoGcwIK/
   FjACe3UddA1YZnIdkDTOViw8N7DpKxmHl5i1Nd7HRM3QaRaKgURKVy+YL
   w==;
X-CSE-ConnectionGUID: GtECAnX1Qvy6cIjT3+8oig==
X-CSE-MsgGUID: TfZmduXASBiFWskkmkub8g==
X-IPAS-Result: =?us-ascii?q?A0DxCwC/WLFp/5IQJK1aHgEBCxIMQCWBIAuBPTFTB36BI?=
 =?us-ascii?q?0mIIwOFLIZYgiSLZItfiFYPAQEBDQIuASIEAQGFBwKNIgImNwYOAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGXIZaAQEBAQMBEWcQAgEID?=
 =?us-ascii?q?gMEAQEBLiAHCh0IAgQOBQgahH4WBwM2AwECoj8BgT0Ciip4gTSBAd1DDYJeg?=
 =?us-ascii?q?U2FPIJ5HgEBKoE1gluBIRkbhF8nG4FJRIFXgmg+gh+CJoQTgi8EgiJ6FB2Ib?=
 =?us-ascii?q?YNDhlZSciIDJjMsAVUTFwsHBYEjQwOBBiNLBS0dgSMhHRcUH1gbBwUSISoHg?=
 =?us-ascii?q?UF4ggEPhmh5Ay54DiICKBJcOE4LWgWCLAIcAwttPTcUGwMEgTUFjQ9cPYVMl?=
 =?us-ascii?q?EWCbIwpgXyhCXEKhByZXIIAhjIXqmuZBpISlwQCBAIEBQIQAQEGgX4mgVlwF?=
 =?us-ascii?q?YMiUhkP2y54PAIHCwEBAwmTZwEB?=
IronPort-PHdr: A9a23:aQ4yeBdvNfuxGtCDm+chfR8ylGM/gIqcDmcuAtIPkblCdOGk55v9e
 ReZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NCBo
IronPort-Data: A9a23:jxnRFKBDRXLHvRVW/3Hiw5YqxClBgxIJ4kV8jS/XYbTApDp01WFVy
 TQYC23Vb/uJamOgfttwPo/i8UsFucCDxtViOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAT8gmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE7OlDJ2gwDdQh5PcpCkBMy
 adbeDcMYUXW7w626OrTpuhEj8AnKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWQHgBfoO3WjPn8SAY4ig+6yi1H0ciZTrxSeoq9fD237kFIpjeS8aoWIEjCMbflbrEOUu
 1LvxE74LC4BN9+ayiePon3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvuS6AeCDW9CRTlEADA7iPILqfUR/
 gbht/viBCdkt/ueTnf1y1tehWja1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:KnKdl6+naOWcmypHJJpuk+G9dr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBfpTnhAsW9qXO1z+8S3WBjB8bSYOCGghrmEGgM1/qZ/9SNIVybygcZ79
 YeT0EcMqy/MbEZt7eG3ODQKb9Jq7f3ktHMuQ6d9QYQcegAUdAY0+4NMHfhLqQAfng/OXNWLu
 v62uN34xCbVTA8aMO9CnMZX+7FieHqufvdCyIuNloM0iXLqSmnxoLbPnGjsys2Yndi0L0i+W
 /Kn0jD4Lm/s/a08xnY12XCxZVbktnsx7J4dY2xY84uRQnEu0KNXsBMSreCtDc6rKWE81Axiu
 TBpB8mIoBa927RVnvdm2qv5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksbus1m2q
 4j5RPai3MXN2KEoM3O3amOa/hYrDvznZPkq59Ls5Vra/pbVFaWl/1GwKoaKuZaIMuw0vFWLA
 AnNrCu2B8RSyLbU5gc1VMfneBFmR8Ib027qkRugL3m7xFG2H9+1EcW38oZgzMJ8488UYBN46
 DePr1vj6wmdL5dUUtRPpZIfSKMMB2HfTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPJgF1oE7lp
 jNWE5R8TdaQTOjNeSemJlQthzdSmS0WjrgjslY+phio7X5AL7mKzeKRlwim9ap5/8fHsrYUf
 CuP48+OY6vEUL+XYJSmwHuUZhbLncTFMUTp9YgQlqL5tnGL4X739arOco75ICdZwrMdlmPdU
 frBgKDUfmoxnrbLkPFvA==
X-Talos-CUID: =?us-ascii?q?9a23=3ACQQngmlVpKrN/CIlstAhIaYTvHLXOVLB4Vz5JX/?=
 =?us-ascii?q?hMHh4Fra0S2PLu/NjksU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AelEXgA4K9C2l5QpnAMG1jVixxoxU7ZarBF09uK4?=
 =?us-ascii?q?suue7Li9zPjSAhmS4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Mar 2026 12:00:23 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id CF6CE1800014A
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:00:22 +0000 (GMT)
X-CSE-ConnectionGUID: TwxkfHMkR9+Gf9JMwvXFTg==
X-CSE-MsgGUID: TlXJ10caS6+VYJzrLSZo2w==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,113,1770595200"; 
   d="scan'208,217";a="58302454"
Received: from mail-ds2pr08cu00106.outbound.protection.outlook.com (HELO DS2PR08CU001.outbound.protection.outlook.com) ([40.93.13.54])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Mar 2026 12:00:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qop8ZCivdXNWIfys4oRM52bSnGLGhRzDmaZlLcq+anqMwg+BzyWsujstg0qOB1ry5yPLPnhdh6/xiYaKMs6KtP2vB2m7+Al1kSdKd4n6YugTBUo/0GzlOJwP3UGvqgv8OorsMMMftMqjcyhBhA8qvO6/vYLzRTXDXqNhxP9ZF3tP3HP7dOeQaf5TkfzEqw8sfZOwcpUH63t47ot0yuKZqHTIeucd1SIz89XKFkcShhvkFc9ZPGkUNTXu49G5785jmfkB4t1ndcd83iQDj0kgZpzHIv9T+5Cez8gQfJaP5Hg2TSdgJ5nh9Qe511Phsb7p+ciZAj8F9yaR5RNJihEKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjGr6nKzLPFJ5P/W5jY2ob6wPdmKTXJGF8yGzI3lEs4=;
 b=YUyDZ31qTZjj02s4fd1zbKRxfeR5IjSDrWFJ0mh9Rj/wtClrucz1/6oV++trMXu+Krx6jAZl8jWKTpTEd0tL0bzVKM1MXoOOcOEhkWGjU0chHuOo5JhPKOCt49xW8YwzuVxfNrpaT5wOKDxz2z+Bq+FmODe2wIBpr17VGKXqoLJVKA12CKcS8r+mTlOx/dDo7inOU7gFiPrldPMkEoy/g0XRJ0NQm4VQL4f5gNslNqam/B46A1tFr5wepnmqM22QIXlRRTwupqbZk4Aq42KpG57hMu1pk7YveaPrJTpcognOEFn1ES2BbBp8w9TFD6Fdv7cE3TVlauzxXKyr31geZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SJ5PPFA058327E4.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::849) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 12:00:20 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c833:7d01:2404:671d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c833:7d01:2404:671d%3]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 12:00:19 +0000
From: "Matthew Ware (mattware)" <mattware@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Elliot Sparling (esparlin)"
	<esparlin@cisco.com>, Robert Yang <liezhi.yang@windriver.com>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"adam.duskett@amarulasolutions.com" <adam.duskett@amarulasolutions.com>
Subject: Re: [OE-core] RPM 6 in Wrynose
Thread-Topic: [OE-core] RPM 6 in Wrynose
Thread-Index: AQHcsIcBVqcb/yDdrEaJ311V201mR7Wnt8YAgAANaJqAAD75P4AAAMsAgAAAfRk=
Date: Wed, 11 Mar 2026 12:00:19 +0000
Message-ID: 
 <SN7PR11MB77053FF5985F085C57270866CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
References: 
 <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7705:EE_|SJ5PPFA058327E4:EE_
x-ms-office365-filtering-correlation-id: ab7a1e10-c1a0-4d5d-3067-08de7f65c47e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700021|8096899003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 0PjBuFfVkD2Wn81Je+wbYXw/LL1t1Bzf1sFV4spd59hAEULfUPOFBJ4acdlsyIHspikeGwvVeX/nJHYWI9Mt/I2EgTWLjVhZDEoV0s4+MVrN/8OwPDb8NVnAQXwjiZQ9odFShc6077hI2mDtU+UWLYOcBePJ7+rYCX152ArdQBIT2OFUKZt5SrH8dhWWFGNFHrncjrlefm7LNKR+iN6hmJ17DAFHsehISdayn/UNpMQReDzTTgFx5Wg3ep0AnaEeoggUQgGRDEKnnSvnLSsTceu0+SwtPtnhIn5tBkWQgdGYtnEJnxR+wSqw7u6F2x9sd/whlcHuUSSAxN2vLQVPF7Lyy5tuOEJhMt87dYX1+rVYHzwB1PH6zsxk+327Gn4RfEjfzc1XpPGczlbXxh0nA/83z9P3gpGGZKMvp6Wu/Ge6QSOjZ3rwqyOcmk28N8pwoqCS+bbUgf0S4weCo3+gYV4mUlzbl/Ohc8G1e2VL96B7S2mIYCgHqk541+rmvIIaDYZMjnr7VdSw+EsuI1CrNgpVcX/pIkNxuLn9QErcAEPkod97x8MocYg0SGXxboLyB7OUAD35cx2tP98PeyHR3hM4Jg8SfF+iGVU0NE/ClbwBOKbRpW5/AG457s9XRT93pU2BnXoPCUN4TvGXyV/nZFtmTHm3UlddDZdx3OmD603TXLfu9IOfZFH+weSkTyzk0uvEHAZpvrauIigrdF0VM04y36l97tHacYHgdVK/XwAzhP0XgTLNFC0iYyslfrr32zqxsiTVHZGHj1Y35K5u30H23ocFfAh1w+saqiX2+8U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7705.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021)(8096899003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?IOV+U7DD71B+VFzj4AuEUC8MEcnYJ9IWY5koF7zvK3HwMzHXf/HQTSkwtf?=
 =?iso-8859-1?Q?ncgeaIs+ygqqi9m0i1GS1kmadn4FtV1tpKmO1pr8ft3EshwbNP2MC5VLo+?=
 =?iso-8859-1?Q?Y7kopirr5XsNmfgC8YK8RvNyIWNgMEHgO0Vj1qpJKG4vpCIukBodbVWgB1?=
 =?iso-8859-1?Q?FPvimzqps27QlUwP6Vj2KwojnM8sd9b00haII1oPp5Cnglpv4fVBTXD2Sz?=
 =?iso-8859-1?Q?3cAT8805cUdAyQ1Wt7Wp60Y63BNsX+W8B8/eYUYdUgcAfi1Q4JN1erCSUr?=
 =?iso-8859-1?Q?3tfE1dg7yie5jgVLlSEExOpwMslpD3O96TPQYrXSgTbLSPto11rXp+b4y2?=
 =?iso-8859-1?Q?1Rpqd7/RmXWixUg11OTqNf5EMtXwP5CckqBfR0zOMZqeUPvBJN8NoRhJ2j?=
 =?iso-8859-1?Q?XcEgX+kRuQ+luraraoaRRZDEuflMWe8Yp/QfZ81WoaTTe61SeaNUQGAIi6?=
 =?iso-8859-1?Q?TiKSOzGPYCJbGFwCKTYX9hGdBB2jRTus2jcDrlFU8jx9QSe/fBdhRm7MPB?=
 =?iso-8859-1?Q?nAYi/JQ7yMzk+/KqgDmI5ThvuhFCtxS5L/9cNVRPl20Paq9YaaPrZuaIA9?=
 =?iso-8859-1?Q?8KRMnDJxCgMEY27vKcZopeNqf/e1PhG9cCICUBVQka2E7us6s6m3Os7o/e?=
 =?iso-8859-1?Q?prPQ+3ZB+LYo7QloKl/jOLF2YCR9sDs8STywAGzyuA82ugSQE58ZzxNi70?=
 =?iso-8859-1?Q?a2hrRMBb5WWet7FCFvtcM1vNPJAYIqbhQSxva6cMqv+CHVfsgE7qpEtAC8?=
 =?iso-8859-1?Q?sKtSVtWSvWDHere6eXitBtxMjf0DwNFOX4sep4S61i3M0+iamqh2W7O7Ig?=
 =?iso-8859-1?Q?SHiaJnq2MrOP3h56HzkkzJiFpG8/ek1g2WQflMBhAWmGE7ngnMHYBJY/fq?=
 =?iso-8859-1?Q?5o9K54CR2nmm2UHnOxtPZKzx4ZuurOdaxIJDxSQGLSK8Dwj6+Rn6HmeAdj?=
 =?iso-8859-1?Q?emfgGC02ruAawZphHD+ObsD0bCgMOpiDJe7XapaeqC+LZ9e4U6bQWskP+H?=
 =?iso-8859-1?Q?Si1g+v9yUq58dUXOgvsJYiSodx9dGS3DvsznQEKVnfPxG3/8GcyYDqD+m1?=
 =?iso-8859-1?Q?s338Nl2MWjyHOudZvzxlPgKD2QiM9fLlzo9UzocYrQNl0AtaXeWomxaUAt?=
 =?iso-8859-1?Q?IdVCTN6ZBG0cimniX58Rm1NUSthYO8Ar352OMlFvFaVopVQ5G5Sb7Cv2+e?=
 =?iso-8859-1?Q?Lb4jdImdfUmL9O2eMtXjfVrOv7Wmu32t1Jcyv6JBmQof8xTDpUbq4X/1i2?=
 =?iso-8859-1?Q?Vd3q1N/fMQ9gBe0S3aXsVRuCjciLsf2afE+rv3X2peRPL/Qn0pGcFX7lTU?=
 =?iso-8859-1?Q?gZ4YPEmg7XdDGsl2xFFeOWjszt7wA9qCI99q0STvjhYPLpAr0JHGA+r5Fm?=
 =?iso-8859-1?Q?tMeJo97lMEFHh8hjjC+KjLQNEjtx1PuOpRhr6qZ4w8t7iYEsIaok678pob?=
 =?iso-8859-1?Q?3ACwkt97NVRcKbZaRJIkrQOsBYUkd/9gmUnh1JjOiiSZuJx/eth2JC16YB?=
 =?iso-8859-1?Q?6mEN4bpfDjprLoWnhY6XlFwg+1mmahTtULhhM9vQLWJJ5Gm5U/Ollek0dy?=
 =?iso-8859-1?Q?BoJeki9poeaUwnVIwcEZJlqXrm2ICxu1yRwJfBWlhgRcAKwp9czeB9C35/?=
 =?iso-8859-1?Q?LpnOPzK0KDHIWWXDKsYD2e1zHuBP+S+HDzVgLFuAmJ6R9u0f/7IVdC61Sj?=
 =?iso-8859-1?Q?mhhrPFfjqO+6i2DelKGX8k6QJTzUkCldFqh2ARRdpUcVpTjSE2wpAuS7zQ?=
 =?iso-8859-1?Q?P5/a6MMU0sPzLdPQLAxarYDPeDshGMgfcnYkaHlSc8midb?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	U4ntgz5PXkBbvpcyRty58UQQv0XrvROzHI7mTIVxyZ5nFnXdvqxHrHj8mHq6Kca8B34OO+Drk+JuLEGdTtC8SBuWrGuwhjtwmfBnCvyz6ZE35rVL/loADrX3rj4OHwXAsyk8TwpyV2gT6508YTSkrNbddPC9x22k++bCIwSVz6cohW5kdXt6ThrN31HH5WAH59TCMQLz//4iHxdOfaK3chFLTNRgGJp+ykb3U1RTa8968+K4+H3egcPj4aZoPjyyJCjNk4rQOMJ0S2kneMwkCSjuNWXO5V21LOzdfRjoX2WuaeDnh4MSBCl86iWqbWJ89xEbC7BKHaMZFWHHP42eCA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7a1e10-c1a0-4d5d-3067-08de7f65c47e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 12:00:19.7603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Zi69sEcLJVF5OvPz+7fggEui02j3Jr+AXZJ0JsvYWxQ2FYaf4ww0f6Ux1RxX+OzL8ifoXj91DEngEjektuDHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA058327E4
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN7PR11MB77053FF5985F085C57270866CD46ASN7PR11MB7705namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232877

--_000_SN7PR11MB77053FF5985F085C57270866CD46ASN7PR11MB7705namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Fair question! My team are looking at using yocto 6.0 when it's released, a=
nd rpm6 has some features we're interested in. If rpm 6 makes it into yocto=
 6.0 we can start taking advantage of those features, and I want to plan fo=
r that :). Similar with dnf 5.

Thanks,
Matt


________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Tuesday, March 10, 2026 5:26 PM
To: Matthew Ware (mattware) <mattware@cisco.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Elliot Sparling (esparlin) <esparlin@cisco.com>; Robert Yang =
<liezhi.yang@windriver.com>; Mathieu Dubois-Briand <mathieu.dubois-briand@b=
ootlin.com>; adam.duskett@amarulasolutions.com <adam.duskett@amarulasolutio=
ns.com>
Subject: Re: [OE-core] RPM 6 in Wrynose

On Tue, 10 Mar 2026 at 18:24, Matthew Ware (mattware)
<mattware@cisco.com> wrote:
> Also, since we're here: is there any plan to move to DNF 5? I see Wrynose=
 is staying on 4.x, but wondered if there was a plan/aim for DNF 5.

Yes, there are WIP patches for it too. Adam is working on it.

I have to ask: can you give us some context? What makes you interested
in having these versions in Yocto?

Alex

--_000_SN7PR11MB77053FF5985F085C57270866CD46ASN7PR11MB7705namp_
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
Hi Alex,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Fair question! My team are looking at using yocto 6.0 when it's released, a=
nd rpm6 has some features we're interested in. If rpm 6 makes it into yocto=
 6.0 we can start taking advantage of those features, and I want to plan fo=
r that :). Similar with dnf 5.</div>
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
<b>Sent:</b>&nbsp;Tuesday, March 10, 2026 5:26 PM<br>
<b>To:</b>&nbsp;Matthew Ware (mattware) &lt;mattware@cisco.com&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;; Elliot Sparling (esparlin) &lt;esparlin@cis=
co.com&gt;; Robert Yang &lt;liezhi.yang@windriver.com&gt;; Mathieu Dubois-B=
riand &lt;mathieu.dubois-briand@bootlin.com&gt;; adam.duskett@amarulasoluti=
ons.com
 &lt;adam.duskett@amarulasolutions.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] RPM 6 in Wrynose </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Tue, 10 Mar 2026 at 18:24, Matthew Ware =
(mattware)<br>
&lt;mattware@cisco.com&gt; wrote:<br>
&gt; Also, since we're here: is there any plan to move to DNF 5? I see Wryn=
ose is staying on 4.x, but wondered if there was a plan/aim for DNF 5.<br>
<br>
Yes, there are WIP patches for it too. Adam is working on it.<br>
<br>
I have to ask: can you give us some context? What makes you interested<br>
in having these versions in Yocto?<br>
<br>
Alex<br>
</div>
</body>
</html>

--_000_SN7PR11MB77053FF5985F085C57270866CD46ASN7PR11MB7705namp_--

