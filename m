Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B84C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:45:39 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19113.1784796331762034179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QPn0CbfR;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7513; q=dns/txt;
  s=iport01; t=1784796331; x=1786005931;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=SW1wopgHSlySdullrzLXuwJFFxT5lVHbvX0qFXuk5i0=;
  b=QPn0CbfRtNmIvNkaSNZ04UZPYt0fTsPJyaZ8T2g4/vg93/gnUE0HLPb5
   rQ7Wx4I2xqK782SRmLk+7D/vYewYnpcvipvTVIR3+IWDUq1Sd4mlOQNRz
   UcxzCSQxH00s5p5+QIjMDaWMIahQAyZz6lJbhdUVyVS/xv/0X5hWFEMO8
   ZsNK6Slg3NVlu9icPWV8HV56Umxj7cNZfY64fcSbdH0qfQ7OZQ86htpe4
   ptO1RyNkHO2Swk59hfMdi0/9r2BRKKyIZn2zob86Ef5kCsPCa40UHOW9N
   vWIJFv170wAsFw/Z1W7S2U4QYn7bCm4Se7SNwHeWnchc2u9pov4n9/5MV
   A==;
X-CSE-ConnectionGUID: eNTaOFNpQJureWwfU3hHdQ==
X-CSE-MsgGUID: vHVOoDi8S4SFzEb42g6miw==
X-IPAS-Result: =?us-ascii?q?A0BxAwCV02Fq/40QJK1aHgEBCxIMZYEgC4E9ATBTgQgCg?=
 =?us-ascii?q?SFJiCMDhSuIeQOeG4F0Cg8BAQENAi4BFQ0EAQGFBQKNWgImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBEWcQAgEIEQQBA?=
 =?us-ascii?q?QEuJwodCAIEAQ0FCBqCYYIdFkEDAQIOtVMBgT0Ciip4gTSBAYNoAkPcChWBO?=
 =?us-ascii?q?IU/gwEbAQEFJUlsgl2BIhgBG4RhJxsbgXKBV4JpPoEFgVwBAwEXgR0rPINXg?=
 =?us-ascii?q?jAEgiJ6EhuCLWcZJoFhjF9SciIDJjMsAVUTFwsHBYEjEDMDKi8tI0sFLR1wD?=
 =?us-ascii?q?CcSDx0XFh5YGwcFEiAqQUUjA0M/OAtDBYFXAoF8PyMfAzl/gTB1SnctaQECE?=
 =?us-ascii?q?BdKOCSCFIE6AoEdAwttPTcGDhkDBIE1BY0EB1sjgjwVgQAgBDAfSWwPAZNlj?=
 =?us-ascii?q?0GOYJUXCiiDdYp7gSaNPogyF4VbpRELmH0jjWeVYCCFDgIEAgQFAhABAQaBa?=
 =?us-ascii?q?DwrgRwLB3AVO4JnCUoZD1iRS4F/gxTIZXkLMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-PHdr: A9a23:quepoxGJP6AILTtmUyyM4J1GfhMY04WdBeZdwpMjj7QLdbys4NG4e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:EFOg469ZlHskbx5z8E1yDrUD2X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TMcXD2GPPyIa2Wmfd1+boi08koOu8fQndQ2QVNt+y1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThPs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k7G7ER3chRGVhs6
 OYVFy8DU0uDp+6PlefTpulE3qzPLeHiOIcZ/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cOnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oe9bYCJJIzbH625mG6Gh
 lzh+Ej4UipGD/KN5DDZqH3yg+7QyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBMRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:ObG7Y6BmOU5pqHvlHeissseALOsnbusQ8zAXPh9KOH9om52j9/
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
X-Talos-CUID: =?us-ascii?q?9a23=3A/iwXQ2ihUqPLhTNhr9LPFXy4ZjJuf1vhxVD+BVe?=
 =?us-ascii?q?BK3tzRYKKR2LL+INoqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ADkd/Gg0ZOSihjenwxzvtr/nK5TUj/YSQL0chkMU?=
 =?us-ascii?q?95/KqJwF6Z22S0jG2Xdpy?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 08:45:30 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id CCB781800049A
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:45:30 +0000 (GMT)
X-CSE-ConnectionGUID: TL9TpYcDR5Wbhsgy2LVXEA==
X-CSE-MsgGUID: msNL3FVRT/CuoIpw7RiAOQ==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208,217";a="56427062"
Received: from mail-westus2azon11010021.outbound.protection.outlook.com (HELO CO1PR03CU002.outbound.protection.outlook.com) ([52.101.46.21])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 08:45:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYpE9hHDx1LxojyJo71fJV/5RqwaNN75wZQViA9I7oJhKWPcX/RjHMfjG7tX+Vxsj0rxPAEiSEqCAwNyGLpGuIT5Ax7G65QTisHdGpj1bdWdS19keV7UKTOuTJLWVpknNlUIUZfOGC4mqIC0DLCtGs6Yc6LLSa0+f0U5+rpJnxJWhAbcdCk0ySL2we0ofwXBcwj4gZepK1YGHywgOjdUtp1w5QrLm4BvfGjifmUWQja0Q5pIyL22JJAZoEODi+uLEeVnWSVRIQSrrIlfmafvM4i4pv2RFlyuZlYeFtkqmixd8pUKtOi5JWdvFeFW7mwW6/0L4AoN15bVVfPCsL6UNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW1wopgHSlySdullrzLXuwJFFxT5lVHbvX0qFXuk5i0=;
 b=bPQbJZOv1brIArTyXOze6Bv0NC72W27WZuRsYqFb/LKSXK3OfAscXz1bPfRgSVubgtKxPw7ioaMh1ADt3Lt7cOqD3t86007GDwbNmiS74gBvrJtFB08V0b8dGxWnlsESVaV2DgoiW95LZhUrQM6dh1gpmjhEPL1/ct9VjkjqKxS4N/5l9j0nlP5liRmP18PSVcScBGFP0i+zWWng1lIn8MSaUWW2AKeylgUazu25VLBMVYjIOcsGwUUxtxd4a9zQF7YLttsgbQqr/2gj9JtaDP7UTbRjZjViAfngORHYCeD3nVXMQGNx3So28IwfIXbNkhtHxi0JzhHqdkhDzitBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:45:27 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:45:27 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
Thread-Topic: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
Thread-Index: AQHdGcKmH0rsILOl702okFbNKKNK6bZ5z52AgAD72xs=
Date: Thu, 23 Jul 2026 08:45:27 +0000
Message-ID: 
 <PH7PR11MB8598E29E70D78CDD560E7DC7ADC02@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20260722101230.34771-1-hthakar@cisco.com>
 <DK5AB0SRDKFY.7NIL8TCKZUUN@smile.fr>
In-Reply-To: <DK5AB0SRDKFY.7NIL8TCKZUUN@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|SJ0PR11MB6573:EE_
x-ms-office365-filtering-correlation-id: 947a0be7-34fd-49c8-e355-08dee896be86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|13003099007|56012099006|11063799006|4143699003|10067099003|8096899003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 ZgrgDOy7XC1M4BjC41WuKJr0RsHSKDqHkLEXVD1MVbxJ8ddEh/47XRIemUxtagxoYU60ITd9UxZKVlvKQ/vwCvDdeW547+0uWfmRXCgwgMgdTbswZ2hNWJNRufJPd6Jis+BT6m4PEQaRuPzTWD/xZcQMzO7fHV9FDucptEME7ElCLFro1NAtdSvPt7e2R7de/Q8Ndu400jE1dNotoquQYgPqgscQtKgqhLaUUukvFI907N+9h/k6z7FDYSbFQPtC4ZaWv+rCUgc9N3KyMiafiMARVa+vEJpy9dZ5C61nMF76+Xu8iBguO82p8iRve3UGTergI4VO38uYgNR6jF3EFDSrYRPE3/qz4QCjdZ2wppQ6jtEfEs6Bqt/UE1q1JVqfDmVetCLzWu6WCR46d7G4/NHis40GWczx8kZO+YptKuhmERmU9BhP6T4hlMX15e/A/1Q4DoGtLYn+A1+87BPcnAYXh+ldEVnxVMm3JFH+SJALGCCf77iK70c1b46LDxpkE12LRFevZ3fk0apyblItgKpAXAypgpuL4vEVvakWhUOBXGeTtAwdjuFItWzY9QC8Q7C/fC511I+rn9KjnDzhExavmqwkpICXwZ345u28kV87W50EWnL/b4QgUkYUYmlt9D7MB+gk7x7s1Wm2cs/QxWhpxRhv3lYrZVnp6zro0wAsSgFh4XqDP2vS+mmvMFiYX6soM5Grl+veKGL5uYuBfbgiDdMPz7jmsuauuazrKQ8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(13003099007)(56012099006)(11063799006)(4143699003)(10067099003)(8096899003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nE1r3tT9iyNW4iHi3cdJr2WDycOd2NFiy9m7R0ryAiFn1f407X9T777geYju?=
 =?us-ascii?Q?6U+nEpSypymdr33F+vbWaw+oaMpNEcL7i2gJtYHCLd9OCJ0PSD67iG+7JN/l?=
 =?us-ascii?Q?j9Z65GimUzNLeVxd/IE1EMuojUP43w0IdEudcH66NiXUG2h6wpuflbShPXB6?=
 =?us-ascii?Q?Uz1Q/nYDJq52NDOHIWi6YUvMDmZ1/dVoKgP+MjbaUzKgTO6De3PcqBgxhtiQ?=
 =?us-ascii?Q?8NQJRe5NtRrdpwjABz9KqpEdQL0ow3XakZhEsoCSwc1IZY7f4gAWU7qDhret?=
 =?us-ascii?Q?5cV7zrO1Gt86WYw6CP2Ya/jfqw9cJP3kFaZBMqV7Ws9Ua51q5/PU3NdDzxyN?=
 =?us-ascii?Q?4CAi0oCLeRbj3iXOzrU5NmMuLhjX1Gm0P67adxpM5dba9YdggI0mXoY8A3nl?=
 =?us-ascii?Q?WwmQ3ftr20t/Z2pw32ZKMv71M+EfUOrWgwc5g4KEvMwbtbAg4zCNv4EQjLvW?=
 =?us-ascii?Q?FQsA4JgAWDwOe9u+Czd9AA/hKkl+lfhUCeV1dSIJ52vzNXnMeOphZpDW7O6h?=
 =?us-ascii?Q?zHxuS1z5+rdqVitcXwAaHlsqMkmno1sn5xoFIHzUlbnsgPb+XxAMMrWSXKIb?=
 =?us-ascii?Q?H8QdgzAKpMWE5d8lXsMB11oR+5h96j3jfamog8j7nhZmjGNv8jOYSrB7AB3Y?=
 =?us-ascii?Q?BuSurw6f35aO+AMFxxe5l6hLfFXhSVwXJckxGydiC7kuroxuluYCYLE7sBZU?=
 =?us-ascii?Q?+izzvpM/EZFJgHNY82A4i4aY0hg8LRySHUfuj1kAuTRMeh66LtoObtW0DABt?=
 =?us-ascii?Q?cbHdd4xe7dOYclujvK0Agc2qGzQz2kCwj5Rfz297TQ6+kJrgtQ0Gzj+3mTNt?=
 =?us-ascii?Q?7KXyWTlp4xOBE30DBQ/KJjCY70WD09naNMULTp1yTvkbVhdAEi/ctBM0Q0DX?=
 =?us-ascii?Q?QK4xlFWv+xEH6vfduaOhhG8M4mRK4L9fYu/YfhWV7JRl4ZtMDSHCnBgqmx6P?=
 =?us-ascii?Q?Ar7grsDBSf3IV2rdJVN6n7ZYvksxbrkv9EdHs8rBYs0E7N3Gz+6aN3nUrbTa?=
 =?us-ascii?Q?sl0Nmmk7WYLx2IL/pLCw/VAllLpKfDCRAq6J1Dxj6/H9xnz0cZzJUCEu4wBl?=
 =?us-ascii?Q?6fl8yvP9Qa7OaaWsPz2xXzSr9ffD8mlIIB2eAYwJ3coyPHOos3UZwLH/BL0a?=
 =?us-ascii?Q?DJMZ2N5oy1TjVssy6H7kDf4bUQqSJxnwkYKK8ZDB5Y3CIVCWt7Akaj9U3tnC?=
 =?us-ascii?Q?KRIAVau6702uuT4BdWuO8HVs/t6e6+mNjhYzRb3PeiYaZd1LuYHmaY7XAt39?=
 =?us-ascii?Q?p+dNYrJTMpkDA7AWDbI0WyQr9dV7xxga6I6DPKzNZRP7EoUYZqzA12byzHlq?=
 =?us-ascii?Q?XI+hop+eqynX4NjFH0MT0sOxVefBjM2BTYy33Zd7Ub9AHSNvR6wah/wmbVCT?=
 =?us-ascii?Q?RpqoSStpDN3Hkx+WFiAr0+5plrPQ3zLGSCybNon7llLtteKcjM/L1sIsjnGY?=
 =?us-ascii?Q?DCJ46o3QdY0PyAtcIDFer2UDLkYV8UehCofRajuGi2LR9vCMXZzfZVX4ffbg?=
 =?us-ascii?Q?556YVVZ7493H10XhVULMMooBj3NZJE9sVmIgG0U617IX33F7zWkMuc0lx368?=
 =?us-ascii?Q?0uw8y6odfRNYAkn0jWLFjVgZSZzAQKV6ADLuOvG3wqfHKdnp0SsVXfjqEraJ?=
 =?us-ascii?Q?/UFYS4ra/kD9pesPOMah0BOJYQ6AVQPE8i2s5d243MPr7S0nRZF6mIwD3D0d?=
 =?us-ascii?Q?0yryXksC093SEWAyqw7ZrpC/H+eJIgfKh9rkhAFwV0+laj/H?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB8598E29E70D78CDD560E7DC7ADC02PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	mekYJelvZStAKN85FHjiXlw/VK0xV4RALSc9ZpzdD+eVI0ZnkeUAnfhyxPDYXH8CWUtWmnpqqlwB7CLMTTFt9AmLrJ5jjjqHTB5HYAQ2XXvOfqGmKUmsotWwOLeZm+sd4TKIkoKJTJoNSOWZ+PLm2Q/mE8QJpclFr5JDTLYdpK5YHbRa5xi4Bk8b9ch0qM6RNJlFralB4Ofa0L6s7LAgP7u2kTc7IfBbM/7zDcq0zf23HEw0CZB1N+tcDiWJyeEnB1syPAylMTYy2/my406MZumQqRSzyr7BsLe1aeTfvVovYO5yv/jjzEXNyA2vSufu4XaVU7kd/dPDfy0DyUIA3w==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 947a0be7-34fd-49c8-e355-08dee896be86
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:45:27.2186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pqt8R/dfFGJyuWrJBlQmI0MqW0M9j/QRZgJRvqu6SqEqH6kip+O5jOldRTUbLNihoxpTo5nysVyB9pGlBde5fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241796

--_000_PH7PR11MB8598E29E70D78CDD560E7DC7ADC02PH7PR11MB8598namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I reviewed the earlier series.
It looks like the follow-up upstream regression fixes for
CVE-2026-58469 and CVE-2026-58472 were not included in the backport.
These follow-up commits are required to complete the backport, and I
have included them in my series .
I kindly request you to review my series as well.

Thanks,
Hetvi Thakar
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 22 July 2026 23:13
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@=
lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469

On Wed Jul 22, 2026 at 12:12 PM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> It also includes the upstream follow-up fixes referenced in [3]
> and [4]. These correct the trailing whitespace check introduced
> by the original fix and add the required <ctype.h> include for
> isspace().
>
> [1] https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7=
a4fb0b6f7826
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58469
> [3] https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a=
00386c3f3bcf
> [4] https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac=
298c24fe00a1
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

Hello,

I received another similar series 2 hours before yours:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D48993
Can you help review it?

Regards,
--
Yoann Congal
Smile ECS


--_000_PH7PR11MB8598E29E70D78CDD560E7DC7ADC02PH7PR11MB8598namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I reviewed the earlier series.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
It looks like the follow-up upstream regression fixes for</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
CVE-2026-58469 and CVE-2026-58472 were not included in the backport.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
These follow-up commits are required to complete the backport, and I</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
have included them in my series .</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I kindly request you to review my series as well.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hetvi Thakar</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 22 July 2026 23:13<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-5846=
9</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed Jul 22, 2026 at 12:12 PM CEST, Hetvi Thakar=
 -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded=
.org wrote:<br>
&gt; From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix as referenced in [2],<br>
&gt; using the commit shown in [1].<br>
&gt;<br>
&gt; It also includes the upstream follow-up fixes referenced in [3]<br>
&gt; and [4]. These correct the trailing whitespace check introduced<br>
&gt; by the original fix and add the required &lt;ctype.h&gt; include for<b=
r>
&gt; isspace().<br>
&gt;<br>
&gt; [1] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153=
f69537c7cbc2a7a4fb0b6f7826">
https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb0b=
6f7826</a><br>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-58469">https:=
//nvd.nist.gov/vuln/detail/CVE-2026-58469</a><br>
&gt; [3] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77=
bde220fc575c8a00386c3f3bcf">
https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a00386c=
3f3bcf</a><br>
&gt; [4] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc994=
2b78b2bf736aac298c24fe00a1">
https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298c24=
fe00a1</a><br>
&gt;<br>
&gt; Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
<br>
Hello,<br>
<br>
I received another similar series 2 hours before yours:<br>
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D48993">https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D48993</a><br>
Can you help review it?<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH7PR11MB8598E29E70D78CDD560E7DC7ADC02PH7PR11MB8598namp_--

