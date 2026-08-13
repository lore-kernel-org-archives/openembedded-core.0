Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACADC5AC67
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 06:05:10 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13043.1786601099040414645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 23:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=V+15KsJI;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13552; q=dns/txt;
  s=iport01; t=1786601099; x=1787810699;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=c+rL2wHXNkk7pksRDplwdC/16GgIBKuHtnpo3rCNVVY=;
  b=V+15KsJIEgRaGpARi362Q7qOqR/kJP8wgabBgLdmoeIqAtqXA2ulUP4Z
   POepRFc/omyZ8SGIy8NCInWyv1sKUVLtXvDz7aI7tazxuwm5so66/1bt7
   HG9VvpJZya+QWfRt5ceK+jZcJQgLUZ/wacp1kxYVmx5IY8IN0xHDJrJYG
   rR5gVHboffwBoH0d9kJaGhs2x3ZbaEdJYClbI9M3+gxbdYrlewT28SG6j
   7RlCc9P3hZhNRbfmeE26LKgdz33pJT6bDVDyd2cQ4a11DhtwoUuu6uUxc
   bhldbfrSFJfVWi22SV4+fqTy9nqdw2zbSE3k7MDwOk/MOSu0iBunS3U6L
   w==;
X-CSE-ConnectionGUID: sHhB3nw4SWSlVXM2tbGkfw==
X-CSE-MsgGUID: VLLQp+cXSg6n06S5z/G8jA==
X-IPAS-Result: =?us-ascii?q?A0ByAwD8XX1q/5AQJK1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UmIIwOFK4h5A54bgXQKDwEBAQ0BAS4BFQ0EAQGEP0YCjWgCJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQEDAUoBLRACAQgRB?=
 =?us-ascii?q?AEBAS4nCh0IAgQBDQUIDIJvgh0WQQMBAg61QwKKHHiBNIEBgygBPwJD3AsUA?=
 =?us-ascii?q?YE4hT+DAhsBASpJbIJdgSMYAYR8JxsbgXKBV4FngQI+gQWBXAEBA4E0KzyDV?=
 =?us-ascii?q?4IwBIEOgRR6EhuBXVAEPYFTiGSFZFJyIgMmMywBVRMXCwcFgSMQMwMqLy0jS?=
 =?us-ascii?q?wUtHXAMJxIPHRcXHlgbBgUSICpBRCMDPjiBSAKBdT8jGTZ8gQlhgSsqZQECE?=
 =?us-ascii?q?BdGLhWCJAKCdoEqA14CAUkHC209NwYOGQMEgTUFjTgHXCCBZFsHARUnHTQBK?=
 =?us-ascii?q?gFPST0JXwsCknNpjxSOYJUXCiiDdowhjT6IMheEBIFXiz2ZVAuYfSONZ5Vgh?=
 =?us-ascii?q?S4CBAIEBQIQAQEGgWg8gUcLB3AVgyIJShkPkiOBf4MUxwZ5AgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaIReiyICJgQDgU8BAQ?=
IronPort-PHdr: A9a23:JI9OIhRzKYEzJeutSdb9xu1nxdpso47LVj580XJvo7tKdqLm+IztI
 wmFo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:9Zsk4qkJEkYmnZUawOUO2zPo5gzZJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbC2zUbPjeZ2b3fdp+YI/j9BgOusPWnYRhHgJrqCAwEFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsvjb9HuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZY4+swsB34Sz
 sMjLA49S0qfjc21zq3uH4GAhux7RCXqFIobvnclyXTSCuwrBMicBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkETUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIqNJIbVHZUExC50o
 Er420DAGlIRBOeQlzzdrEnxlKjgzSHSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dbDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:+UzcPKCBKwWXkorlHeissseALOsnbusQ8zAXPh9KOH9om52j9/
 xGws576fatskduZJhBo7y90KnpewK7yXcH2/hhAV7CZniohILGFvAZ0WKP+UyFJ8S6zJ8j6U
 4CSdkxNDSTNykGsS+S2mDReLhQoqjjzEnrv5aj854Hd3ASV0gU1XYDNu/tKDwPeOApP+tfKL
 OsouB8i36Lf3MRYs6nBn8DcdTiirTw/q7OUFotPTJizBOBow+JxdfBfiSw71MzQjlPybAt/S
 z/lRDl5qKsive/yhXN/W7e5ZZblbLau5p+7cq35fQ9G3HJsEKFdY5hU7qNsHQeu+e08msnl9
 HKvlMJI9lzw2m5RBD3nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxri7VY6tt0U6t
 MI44vZjesTMfrzplW72zH6bWAtqqNymwt6rQcntQ0abWLZUs4IkWVQxjIPLH5KJlOL1GluKp
 gcMCib3ocXTXqqK1bEo2Jo3NugGl43HhuAXww+n/b96UkNoJi8pHFomPD2WRw7hc8Ao5Uo3Z
 W3Do140L5JVcMYdqR7GaMIRta2EHXERVbWPHuVOkmPLtBMB5vhke++3FwO3pDgRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo8ERgMyxeJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR/vuN3HnF4pF1xD3H5NSNX4dWssIvctTYSPCnuvbbonx8uDLevfaI7TgVT4iR2PkG3
 MGGCP+Ic1Rh3rbE0MQQCKhLU8FVnaPiq6YSpKqitT74LJ9QrFxjg==
X-Talos-CUID: =?us-ascii?q?9a23=3Asngh5msXG1ZADPJd5mcKiJQ16Is+Un33l3HPf3S?=
 =?us-ascii?q?HMmJXeJjPVVW/+617xp8=3D?=
X-Talos-MUID: 9a23:dgbwlwRAGnnPpXIqRXTSoBVbLIRj05+hVkZVz65bqY6rZS5ZbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Aug 2026 06:04:58 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id EFF0D18000BC8
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 06:04:57 +0000 (GMT)
X-CSE-ConnectionGUID: 4i9YVH80Shqh6B+nOI7Khg==
X-CSE-MsgGUID: ciGGUkMIQ4yE9gu+wwDG1Q==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,220,1779148800"; 
   d="scan'208,217";a="58363431"
Received: from mail-centralusazon11010025.outbound.protection.outlook.com (HELO DM1PR04CU001.outbound.protection.outlook.com) ([52.101.61.25])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Aug 2026 06:04:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q88DXU8luGd3vtW9br4d/FcXcliG4zVnngR+Zkk1EaNsG8KvKV1PbUnapI7tWPWNYugu/X3S+D8+njVGNR6irGb3bjHUaAfjdl3vy1lbxD1VxNRC1uS+07jCpNa9IuDWCHWU6m46hNIC/hkda/omzzMTA41Ht/6l2p7MbB4r9jH20D6XXDPbZscbiqG8MyOzMxzinRqhGR563GVspRlC2VHzs2vB0x12BFL84zJVecJ4JbanFMpqaNBTX1mwF19YWQkQRXN4/3Yw/+J/UcKvbF9wydhki2Z+wVLbACrua69iBQNYoJPCPgtRWNlf13TT+lHy9vxIM1r1Z+zzIE/SNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+rL2wHXNkk7pksRDplwdC/16GgIBKuHtnpo3rCNVVY=;
 b=wgXWbJYbtulcadkqCpIAbdalDoFW+0R2nl8SDKcpBi0rAJ747OBk3NBua7d7f4ndR9w3llyWYVpldkhGerZ/THeKQRzq335xiOVlFRWRrQ/IzJ71M4fYjIu1eZQWFF5+rNjTktx55zExu4uqWtSuTFjabap9A4hz6tFWI+hGp9slBC+pI9tg4ZBq5pHBPvPaf8ZoYprdp0tGoP96D5aUCbMa6xnFN+mjpMVCeexDK2OT8mNFJd2I3CjaE1TV/tZDBjmybX40k0dYSD9y+1W9RGEbO4eNWHlA7rMaZf/1fSrwODxY1TlODF+LXxthDHrFga5Z/GWrEj1aDCsMVZj2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 SJ1PR11MB6249.namprd11.prod.outlook.com (2603:10b6:a03:45a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 06:04:55 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 06:04:55 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Fabien Thomas <fabien.thomas@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Viral Chavda (vchavda)" <vchavda@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2026-58055
Thread-Topic: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2026-58055
Thread-Index: AQHdKnCFHNT/+BkjqkKz5e6aRcH617abfAKq
Date: Thu, 13 Aug 2026 06:04:55 +0000
Message-ID: 
 <DM4PR11MB618958FDF26AD3CD29C84EE6C4DB2@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260805080334.2604235-1-deeratho@cisco.com>
 <DKN2SEC32827.35IBSQC8DBN5H@smile.fr>
In-Reply-To: <DKN2SEC32827.35IBSQC8DBN5H@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|SJ1PR11MB6249:EE_
x-ms-office365-filtering-correlation-id: e7ecdec6-1da6-412e-3f97-08def900cc36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|13003099007|6133799003|10067099003|4143699003|56012099006|11063799006|5023799004|18002099003|22082099003|8096899003;
x-microsoft-antispam-message-info: 
 FAoe7Ol5G32SeC3ok/sJxIr0IEdkE2ycgOCNV69F4Tn14HUqkGys7P6vOnzrG0pRyn8MrrAfWwRhC65idmbE1+flFq6ZVXM6oNiPV/xjsObFAxudOoiGokbyYnguNi0tl6jYgFWo/0jcwTTxoZuJ2QOd9RagvRVKt3fCd8i25ihm/47/Cty3XiO34Va7e93MHCy2jC3Y61DUj4hGRgFkqtaXZRSNeE2l3KVDGB2jPKg6FyG/mlnRdvfINhmc3wmCmrvLxf6xYdtkzYMZlFngJTHiMgpr/6/1eUBSKU4rNsA2zVqmi25I29wW4sJkhj2mG1rvuRDU09kLfIpYex5KaIrZvLD6i1jBsCpQchTxbvIdFE4f0ozXQQk5m0th6k4LjgABFZE9NvcLll94MrEUZLn/CWjLwZq8k4wRUSk7HZqdbYQ35aDOdQokGJGFL2P1fFfnKaOqrCkfq65O1b/I4vBIGHMnXzi242cajJ97F7cBC5EaeX+1Ohz4No0j6Mh/i26DID++ZL1PCis0R3AwdLTKn8fcRSZ/col2syIT7HjmcMBpIAwn0gwjqStB75bDocX9EEaRvv8uCHd+dRecPsUe3uChZwXt14GlAdVuV8o1H+zhw4g2ZxGvGxKK3aMANc85R17OIXVIFfJpMGdZ8JnG2ni7S8j8izeWAm6QxXQTcJbEWS429XrGQzOhgtVBU9RtMfm7O1A/Qr6U3X5BIrLYC6r+VgTkvXhDPbPOaPs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(13003099007)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?4he/KxjPqKm4P4vD7+gR/cprYOA6AmV9/bMDIAkNaN9E8d8iF2AMxaqy?=
 =?Windows-1252?Q?RCtJjRMHxKW3RkOPx4TWfO856LRwTHwmKzDLcUlysPl4n5Py9OIiX23N?=
 =?Windows-1252?Q?d+92rz5Q2nC/dUIq8mkcWiXD50j7Y9yFXskUev93on14fLiQDjF/J/OV?=
 =?Windows-1252?Q?9Y46UYQWtQnEJiVBD+UYRS/3Aqo0do2cTXeZyJJOVFl5UBISvNiZeVeU?=
 =?Windows-1252?Q?0/7X5TyBXWHVHgItm/uvaPrYjd48tsFbbW49CLDnM6KWHx6x+0SeKd3b?=
 =?Windows-1252?Q?WfgMWuWKGMRGljo+r88DEBg7nLJ7IbjU+cOUU8wVtCzGFPulP4aBBNHt?=
 =?Windows-1252?Q?riFnFuZmrucBG6PlJnGNBsXFHJ6iZx6AqcihLj1HQsOZOjks3JD7ucrz?=
 =?Windows-1252?Q?buNbwseY+PfWSqmKq9PshnXNyqY0aQ5qfyI04sXYJFR+uV6xqFVPsTeA?=
 =?Windows-1252?Q?XDRy9BgRTqBkKT5Xk8sUTyNSA0LFVQuL6eaZJ3Li3it6cBUyuIYXEStO?=
 =?Windows-1252?Q?QdfiyjWMIzjttE4XlwQ4NA88hf5+S2oCkea2f1SBtmHp+d9eeyLsjykX?=
 =?Windows-1252?Q?iiI+oEhMqnMpNvrB2/qT/4PyCtWIQsHNYhXuYQDeBxKpqpMYg9V5I7hp?=
 =?Windows-1252?Q?CDFVlls9du+oKZMwir4UMz+YHSQpOmOVP7GXoykTIfAsY6G1GvE4iOyv?=
 =?Windows-1252?Q?ah/Rfi232qsNr8xbuBIUfLu2NE32XG5kAL/cf9nc0SOGLmyPQeYHwjJQ?=
 =?Windows-1252?Q?JjBUUi2/RBE3kfqvf1NNSoTVdYrKSNxQwAaVOtiC6o9bcLMbKxfcJ7L/?=
 =?Windows-1252?Q?Jbk4Z2qvEeF3Gdq+2kvK27wrjxdG9k4sRAmmhqUYwk5i2UzqTDwMcMhz?=
 =?Windows-1252?Q?S8A/vyALFjTgNW7iWyW6X4AWkySlESN2K3hDzVRM+PxNNc2+mHZD6F95?=
 =?Windows-1252?Q?XzsrMxddYpF/BK7bxM4eyWtZbdgJuNwAvGCmrO7VS3g+Cd67BeLuaxWU?=
 =?Windows-1252?Q?BnsGuzH1GqLVovV4AcB7S66fheEqyIyCM9cI3dnBrMJyL65aSpn4lZUh?=
 =?Windows-1252?Q?8sy4W9Dhu8P8BnbeBC0zjEW67erqe0yfj3E6wM6VeAn1H+T/MzwL5IJ7?=
 =?Windows-1252?Q?XjIQ8jeRbLtlQmyaGbqhvXFIbm/+Y8dH9vNk2xofHAhIgCFLbVowwNHf?=
 =?Windows-1252?Q?tgG7yhzfLArb9N017PorA7KyqVEFtkWC7yj3iiF9DpgzUsl01428ryUO?=
 =?Windows-1252?Q?aYaUiwuFAKutDwiJxL0v+99ZH0wa53hijO5zv5m0QOdg6il8K78CV+Nf?=
 =?Windows-1252?Q?iJCd1B4HcndVb76NTyAeYb9azvdn+T0ualdeCaqQCCdXTRktFhkIUsm0?=
 =?Windows-1252?Q?XiqLkcjOlcgSmy/eQ18RoApwkpWkxMP0tN4ygWFwvCwpMVBveRw83KCn?=
 =?Windows-1252?Q?GcAYOuJQPc7uX/Zn4nWYbyCJGcyJCJfwqwPn584qVcY3KgmLwOtgcxcC?=
 =?Windows-1252?Q?D7372IAaHVnBUvzwz3bwDRdPX3Se41iK7Y0upI8OEv8oLtpY94HS0bgX?=
 =?Windows-1252?Q?bHI9SQaCA8LmA0G7ywhL6ToHkyIyFDDmV7WbIIMVBj9YOFJjfMOfePmz?=
 =?Windows-1252?Q?jxnmkAxeseHpTXBWtaMaT3EMu+02oXHxxwYYe0ntn9B3BWEEQg4IwU0c?=
 =?Windows-1252?Q?Ccj2RnMsoBv7+d5AOYlgOKSv4bpTsckF8lx4J1JDXT9ZCrDMALvpAie0?=
 =?Windows-1252?Q?REMtbcKoSowL82V1NhalQYJIKyTzxdqA8CfLMEE5Q15k1uenjJCnl+bH?=
 =?Windows-1252?Q?qUO9cf/q1VKPhP3O9lfCRaYXs3DWwq5d9zH7BAUnHecWMkRK?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB618958FDF26AD3CD29C84EE6C4DB2DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	MFC8Relz03KQ5gMG4ks/3UpDLBZUtO+1+iu0CxOoD6mINaJGyRDYQdSaVoUU2j+7ctl9XWOMoNXS4NSy0I9+SP9sNLFlUfHENWfN9oziFd9Y91cKGcr5tyJuymyMoIv1FS/oJE6B4qsKbIBye0cUGt6JL0FnhGds8gUD05I4ct1ZbnF2J9ufH0dq58i6ndcMAcmOjRdouXTlUGiLnfa1s9UJcHvHcXPiRBJ1Q+Pe+Pat+8ihKpjQYWg4cIHIFWa6DEqxp+pV/t7nMuq6XHycErDRwvg0KVtPnxt684DvJTsShnHLABS+qUig1DCjboc/9SkjWiKRRhgDDIdLKD4aQw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ecdec6-1da6-412e-3f97-08def900cc36
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 06:04:55.3827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yHzJE7GEKaAp1R4Hbx76/ocSSPykg565TsehDHiQHdii4MUoVJrO+jMAg6Xqnl1xlw/ct4sTH54+RFHFKD4aGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6249
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 06:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243333

--_000_DM4PR11MB618958FDF26AD3CD29C84EE6C4DB2DM4PR11MB6189namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello Fabien,

Thank you for highlighting the risk of checking EXTRA_OECMAKE directly. I a=
gree that a user could modify the CMake options through a .bbappend while t=
he original -DENABLE_LIB_ONLY=3DON option remains present. In that case, th=
e conditional CVE_STATUS could produce a misleading result.

I tested the complete upstream fix against nghttp2 1.68.1 with patch fuzz d=
isabled:
https://github.com/nghttp2/nghttp2/commit/ab28105c4a0197da24f8bfc414bc11605=
5249e1e

Unfortunately, it is not a clean or straightforward backport. Thirteen hunk=
s fail across six nghttpx source files because the fix was developed after =
substantial nghttpx refactoring that was included in the 1.70.0 release.

The current OE-Core recipe intentionally builds only libnghttp2 using -DENA=
BLE_LIB_ONLY=3DON. Consequently, nghttpx and the affected shrpx sources are=
 not compiled by the default recipe. This behavior was introduced when the =
recipe was converted to a library-only recipe.

To validate a manual backport, I would need to use a temporary local .bbapp=
end that:

- adds the nghttpx build dependencies;
- disables ENABLE_LIB_ONLY;
- enables ENABLE_APP;
- builds nghttpx with the backported patch.

I also have a question regarding validation: since nghttpx is not enabled b=
y the recipe=92s default configuration, how would the community normally va=
lidate changes to this disabled component?

Thank you for your guidance.

Best regards,
Deepak
________________________________
From: Fabien Thomas <fabien.thomas@smile.fr>
Sent: Wednesday, August 12, 2026 9:07 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2026-580=
55

On Wed Aug 5, 2026 at 10:03 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> CVE-2026-58055 affects the nghttpx proxy when forwarding HTTP/1.1
> Upgrade requests with a Content-Length header and body.
>
> The default recipe does not build nghttpx. Add a conditional
> CVE_STATUS entry so the CVE remains unpatched if app support is
> enabled, while default builds are marked not-applicable-config.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2026-58055
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  meta/recipes-support/nghttp2/nghttp2_1.68.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb b/meta/recipe=
s-support/nghttp2/nghttp2_1.68.1.bb
> index 71d5eef8d6..29a7d26819 100644
> --- a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
> +++ b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
> @@ -17,4 +17,6 @@ PACKAGECONFIG[manpages] =3D "-DENABLE_DOC=3DON,-DENABLE=
_DOC=3DOFF"
>
>  EXTRA_OECMAKE =3D "-DENABLE_LIB_ONLY=3DON -DENABLE_PYTHON_BINDINGS=3DOFF=
"
>
> +CVE_STATUS[CVE-2026-58055] =3D "${@bb.utils.contains('EXTRA_OECMAKE', '-=
DENABLE_LIB_ONLY=3DON', 'not-applicable-config: nghttpx proxy is not built =
in the default nghttp2 configuration', 'unpatched', d)}"
> +
>  BBCLASSEXTEND =3D "native nativesdk"

Hello Deepak,

I'm filling in for Yoann while he's on leave.

We would prefer to avoid conditional CVE_STATUS entries whenever possible.
The risk is that users who enable this feature through other means think th=
ey
are protected but actually no.

Conditional CVE_STATUS should really be a last resort. Could you please che=
ck
if the actual fix for CVE-2026-58055 can be easily backported instead?

Best regards

--
Fabien Thomas
Smile ECS


--_000_DM4PR11MB618958FDF26AD3CD29C84EE6C4DB2DM4PR11MB6189namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hello Fabien,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thank you for highlighting the risk of checking EXTRA_OECMAKE directly. I a=
gree that a user could modify the CMake options through a .bbappend while t=
he original -DENABLE_LIB_ONLY=3DON option remains present. In that case, th=
e conditional CVE_STATUS could produce
 a misleading result.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I tested the complete upstream fix against nghttp2 1.68.1 with patch fuzz d=
isabled:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://github.com/nghttp2/nghttp2/commit/ab28105c4a0197da24f8bf=
c414bc116055249e1e">https://github.com/nghttp2/nghttp2/commit/ab28105c4a019=
7da24f8bfc414bc116055249e1e</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Unfortunately, it is not a clean or straightforward backport. Thirteen hunk=
s fail across six nghttpx source files because the fix was developed after =
substantial nghttpx refactoring that was included in the 1.70.0 release.</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The current OE-Core recipe intentionally builds only libnghttp2 using -DENA=
BLE_LIB_ONLY=3DON. Consequently, nghttpx and the affected shrpx sources are=
 not compiled by the default recipe. This behavior was introduced when the =
recipe was converted to a library-only
 recipe.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
To validate a manual backport, I would need to use a temporary local .bbapp=
end that:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- adds the nghttpx build dependencies;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- disables ENABLE_LIB_ONLY;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- enables ENABLE_APP;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- builds nghttpx with the backported patch.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I also have a question regarding validation: since nghttpx is not enabled b=
y the recipe=92s default configuration, how would the community normally va=
lidate changes to this disabled component?&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thank you for your guidance.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Best regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Deepak</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Fabien Thomas &lt;fabien.thomas@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, August 12, 2026 9:07 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2=
026-58055</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Wed Aug 5, 2026 at 10:03 AM CEST, Deepak=
 Rathore via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; CVE-2026-58055 affects the nghttpx proxy when forwarding HTTP/1.1<br>
&gt; Upgrade requests with a Content-Length header and body.<br>
&gt;<br>
&gt; The default recipe does not build nghttpx. Add a conditional<br>
&gt; CVE_STATUS entry so the CVE remains unpatched if app support is<br>
&gt; enabled, while default builds are marked not-applicable-config.<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-58055" id=3D"OWA7=
29d184d-12ac-ff51-f8cc-d33ad40492bd" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-58055</a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-support/nghttp2/nghttp2_1.68.1.bb | 2 ++<br>
&gt;&nbsp; 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb b/meta/rec=
ipes-support/nghttp2/nghttp2_1.68.1.bb<br>
&gt; index 71d5eef8d6..29a7d26819 100644<br>
&gt; --- a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb<br>
&gt; +++ b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb<br>
&gt; @@ -17,4 +17,6 @@ PACKAGECONFIG[manpages] =3D &quot;-DENABLE_DOC=3DON,=
-DENABLE_DOC=3DOFF&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; EXTRA_OECMAKE =3D &quot;-DENABLE_LIB_ONLY=3DON -DENABLE_PYTHON_B=
INDINGS=3DOFF&quot;<br>
&gt;&nbsp;<br>
&gt; +CVE_STATUS[CVE-2026-58055] =3D &quot;${@bb.utils.contains('EXTRA_OECM=
AKE', '-DENABLE_LIB_ONLY=3DON', 'not-applicable-config: nghttpx proxy is no=
t built in the default nghttp2 configuration', 'unpatched', d)}&quot;<br>
&gt; +<br>
&gt;&nbsp; BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
Hello Deepak,<br>
<br>
I'm filling in for Yoann while he's on leave.<br>
<br>
We would prefer to avoid conditional CVE_STATUS entries whenever possible.<=
br>
The risk is that users who enable this feature through other means think th=
ey<br>
are protected but actually no.<br>
<br>
Conditional CVE_STATUS should really be a last resort. Could you please che=
ck<br>
if the actual fix for CVE-2026-58055 can be easily backported instead?<br>
<br>
Best regards<br>
<br>
--<br>
Fabien Thomas<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB618958FDF26AD3CD29C84EE6C4DB2DM4PR11MB6189namp_--

