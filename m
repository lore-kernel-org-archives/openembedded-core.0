Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1898EFED2F1
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 08:46:07 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16917.1773305158909180752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 01:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QznMgEa1;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5906; q=dns/txt;
  s=iport01; t=1773305159; x=1774514759;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=rhPO+CpEQJ/2YuQr44N6LVuW/BuRJzEG+gRxRKTsq1g=;
  b=QznMgEa14id9kUHrBFvSELr6UqiOr2KZ/xy3dojezLdx58+zMuNDWb0F
   5TBXo2ArmW5j/eLBE1dXdbpADERrvKrmJQJg2cyQFAKs/HBBe5M2bcTz4
   BbbhX22ylbAj6tJvWbLLCUUl/mnKf5e248sZckERb0/BLC4VRpHM2OnDD
   HIQ4jyvDhk1QWgw9eQ050HeVVywL6LvsKPFxACOJGuzJVFRPUsBa/d0wf
   aH7skSlHBCOzFUzq5bNRr/x55fvJllPmSUTh9kFz3/eCyC8LvmBy8Jk5l
   6/uRzwBI5oPl5Yx3RSg5T/Arx5EzHE5YCQ1ElvJJkM1/n5EILDVc7CwEH
   A==;
X-CSE-ConnectionGUID: sYXzus2eRg6qE7mQg2XUOQ==
X-CSE-MsgGUID: YC5e/rTQSUOwS7KJ4XM1qQ==
X-IPAS-Result: =?us-ascii?q?A0AMFwByfLJp/5UQJK1aHQEBPAEFBQECAQkBFSWBKwKBO?=
 =?us-ascii?q?zFTB36BERKIbAOFLIYIAYJwl0aGV4F/DwEBAQ0BARQ9BAEBhQcCjSICJjQJD?=
 =?us-ascii?q?gECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThlyGXRZnEgF/J?=
 =?us-ascii?q?wQBDQ0MDoJhgh0WQAMBAqE5AYE9AooqeIE0gQHgLoFNAYhTASqBNQGET4Q/J?=
 =?us-ascii?q?xsbgXKBV4I3hSMRhBOCLwSBDoEUgQ6HOwaCTYI8cIVngUQiAyYzLAFVExcLB?=
 =?us-ascii?q?wWBZgMqLy1uMh2BIxIsFzNYGwcFgwWCFQ+IcHRtgROCHIEIAwttPTcUGwMEg?=
 =?us-ascii?q?TUFjQuCWoNIgSIGNJJGFFIDjxKBfIxjlRcKKIN0lCIHjWUXhASNE5lUmQYiq?=
 =?us-ascii?q?HQCBAIEBQIQAQEGgWg8gVlwFTuCaFEZD9pggTQCBwsBAQMJhkiLJC2BTgEB?=
IronPort-PHdr: A9a23:htyDSBc/TZVKoi3UOsZ/5m5elGM/gIqcDmcuAtIPkblCdOGk55v9e
 RGZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NCBo
IronPort-Data: A9a23:/fq+kKnWfulx2Xyd03ijJKDo5gzZJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcDTqFPqzZNjH3fN1xOtmx8ExV68TcndBgSgBlpCAyEFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpPsvjb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZYpyvRqGjtDz
 /NGMR1SaymM3dKL54vuH4GAhux7RCXqFIobvnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEeUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIaII4PaGJkMwy50o
 Er31Dn0RQsmDeei7iW+rVGO2t/qxDrCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzFeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dYDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:en8P9aDmMtD0DGnlHejFsseALOsnbusQ8zAXPh9KOH9om52j9/
 xGws576fatskdsZJhBo7y90KnpewK7yXcH2/hvAV7CZniqhILGFvAZ0WKP+UyFJ8SczJ8Q6U
 4DSdkCNDSYNzET5qiKgnjcLz9K+qj/zEncv5ak854bd3ATV0gP1XYfNi+rVmdNaE1tA50/GJ
 CA5sxBiQaBVB0sBPiTNz0uZcSGg8fEuq7HTHc9aiIP2U2jnDmo4Ln1H1yi2AsCUzRA+LEm8W
 LUuQ307KeuvpiAu1DhPmnogKh+qZ/E8J9uFcaMgs8aJnHHkQCzfrlsXLWEoXQcvPyvwExCqq
 iMnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3CQi4gAcYpv/MYTvKZ0TtigDhP6t
 MP44urjesSMfoGplW72zH8bWApqqNzmwtlrQdctQ0HbWJUUs4ukWVWxjIlLH5HJlO11Gjie9
 MeV/01I51tAAunh3y1hBge/PW8Gns0BRuIWU4Ep4ic1CVXhmlwyw8CyNUYhWpozuN0d3Bo3Z
 WzDk1TrsAGcuYGKaZmQOsRS8q+DWLABRrKLWKJOFziUKUKIWjEpZL76Kg8oLjCQu1D8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBGGwRy7kxM1S74Vw/rf8WL3oOyueT01Gqbrqn9wPRsnAH/
 qjMpNfBPHuaWPoBIZSxgX7H4JfLHEPOfdlzerTm2j+1v4jBreaw9AzKsyjV4YFOQxUKF/CPg
 ==
X-Talos-CUID: 9a23:TPnMum1Cs/kDd2cBnGfNK7xfAfEVYGDGlnrqLBGhJDlscbLPeWK3wfYx
X-Talos-MUID: =?us-ascii?q?9a23=3A2pTuHA592SAdewZY2ltQecz4xoxZyPmjT1oxqK4?=
 =?us-ascii?q?7nNa/ag9SZwe41S2OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Mar 2026 08:45:58 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id CFAE518000156
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:45:57 +0000 (GMT)
X-CSE-ConnectionGUID: BL/EZUODRQCiATfuJVohnw==
X-CSE-MsgGUID: FlpM3DJ7QFGngsDKLlE7Dw==
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,116,1770595200"; 
   d="scan'208,217";a="48147725"
Received: from mail-ch4pr07cu00100.outbound.protection.outlook.com (HELO CH4PR07CU001.outbound.protection.outlook.com) ([40.93.20.96])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Mar 2026 08:45:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQjTBM2tADMnQnnFh/oPPeMWIiX+8v9xjpmz+E5LRTg2IVR2UuBb6IO2JVvUMWp0ks45gX2nWLeogkCAu6G4tuCM10KRjJFXHTN46CpcWR4M4GNTkoQI7OqyMComm0YlarxDlfBJlLYy5B2HsJ4ce2IFJXdPGSOv0xjvARQ05HyEB5xAJsnMrgygio8XLqQeBwG0hLEP1B5AfsJvSF9udsbuCPtRd03yIjvdB+p5lvy+EN9e4pxllwUcwOJr9rz2TlQUVeiiZAFaCe8ceO+pK9X3yrJvdPsvTgxzcYHVDmdGunMaeTbx7A5ezIYaFS/vr+x6nAiqx73J8r5wnbVNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhPO+CpEQJ/2YuQr44N6LVuW/BuRJzEG+gRxRKTsq1g=;
 b=JPZVTYyvC9JcnMiYhDRyRdaf+Ys+lRsGop3np6ZbHXqEnQPJa8+qqis3SRmgskUNxdwLAJy6V+u3uyEiIVQ/YaaYbNNSKpLN6fBht/5UUseWTgWYjuNexj5Fcob1y0I8qduhhx1bjLDAo6y/g/hDMcOPwQU0KZ0FlktOBG/RKaG6BIw0XgGY2pEREl+mVF2gPpuD1LEIPfy+ndBAhVpKBNm5SvEzhIpPJKTtpqqD2CehBLGTxecRd4lGX7ksURS5Drr1ojCReUsfXAj5EPu0ZMeLCTdbvQpaHECdcfU2TVK3D3aoZdIOXBkQOUwsssYsBza+X1zJBg1YnR9whEzZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 IA1PR11MB8862.namprd11.prod.outlook.com (2603:10b6:208:59b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 08:45:55 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 08:45:55 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Yoann Congal
	<yoann.congal@smile.fr>
CC: "Viral Chavda (vchavda)" <vchavda@cisco.com>
Subject: Inquiry Regarding Package Upgrade Approach vs. Manual CVE Fixes in
 LTS Releases
Thread-Topic: Inquiry Regarding Package Upgrade Approach vs. Manual CVE Fixes
 in LTS Releases
Thread-Index: AQHcsfycPqcLW92Kh0u7xE5N1441sg==
Date: Thu, 12 Mar 2026 08:45:55 +0000
Message-ID: 
 <DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|IA1PR11MB8862:EE_
x-ms-office365-filtering-correlation-id: da957a08-6af6-4cdd-67ed-08de8013c66f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|3613699012|38070700021|8096899003|56012099003|18002099003;
x-microsoft-antispam-message-info: 
 bo3cdTfNlwuseFyTSwJGH9Eu9ZhwjWi1y9mU1dcU+8NTguG4BvY9ou/SxNkVPb0IV2CwM27t+IpXAEse+yKD31N4kPtx+sqH4YyNf4eYU+nrQkn0Ak1rkhvHr+YVdDPjwBH2cu8lUjZJyx0UbHf7XPqpRoTnQ+WpdHdzaMTacyFJ8GEAkYNyLGz0/GCMJvKRhokdkonPoHsCdZpBuX7yCq+YfPdL2K9u+qLpnQ1RJzeELvKoK9ZEtJHc+9y0EarK+2eLrwrmWgeIRQBlDny2Nw8gSU25aAQ9czICFU+gga8iwvqmbdDZunFDKvdPoz/evfvYGYQb0CE18Ls6B8OL/bd/CkPUgIL9a7DUiikGd83hRee72FtJtoSRvmEXkOYuOrlSV50CwWbZnkYhesSaTFaSk5ASLR7Y+VU1jR/VrDuZHvuMy9BwpZcWSssRQmFNV+SnmeNvyjSUun+Ldk8ujRvJ/76yfOLlkpvasGKGL6uBSszmbMgekOSN45+YD35wY7KSwC190962dKWKXFnl0QwYlnlk/Nb4t6jZp/FPAl/6zD1223gKiKiN492cC1rpGMGMpH/HbDQORGB7jcdAR+bwpoqYVCtVILmoNzxUx24o4KSo/spTp8pdtpM3lyLs1gwRk8mRHOExnTfSQyZTmocYagG3HvvR9ee7KtZE+9GHhbW74v4BrcZh12fklpB8wt7pc6H5MHfYuedNc+1ZTcEkotqLgqkk0FXuj5QqRbUQ7+jJIh5K7wcBztPQ5Xe3vGIWjDhOrB153lilWM5s0H9Ukcmao0BFzzOhvfkAtZwzXcordXJFmVF+e4+vZW4f
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(3613699012)(38070700021)(8096899003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ruuHPS2eMYX1eFD4MXI+K8BbxAiLXpXcRF4oiTvCM4ZvmGjOawvvgUqhHk?=
 =?iso-8859-1?Q?3FcUvM5MclbQlZGGSl3Pq6SEuZKAwUQNt7tF13aj5h+d9MOnu9svNVKTqY?=
 =?iso-8859-1?Q?B+586LuRzF5UxullF6w0avzmFLNKRrT+UWq4ipXHzVxn+2DFJExJaarTo6?=
 =?iso-8859-1?Q?L4+WfTdowUyHcTpxDViBQ8MtVRD9g5vBHCtFOkl3wycGjm4SLgbxZElf6d?=
 =?iso-8859-1?Q?mperMbzipPZ9a8cXyqe2OtI1BZUv/+Gu3jZQK5H/73+sxBhsc+Nbi6I18B?=
 =?iso-8859-1?Q?D3O5S7j1MAbOYeS5OWv4L9NMPbRJcXoxIS6qTLakLFTlVd+BDHym04rKtL?=
 =?iso-8859-1?Q?2yAgwcr/V9EEEss5IMp/27ynFZZH7cZhBpC5OI2XpPUJnfXL5/csAuY/Q4?=
 =?iso-8859-1?Q?ZHNAkDxJUCrGFboPyG3vdvwBpiozztBcuXNh/zA5yA1uc504fqsyvUglmX?=
 =?iso-8859-1?Q?Pu8Lhv6ury+5+nebhuQn56+ejvXJ8dkqPJe8TbnjACcwYHs5s51KD+yYaU?=
 =?iso-8859-1?Q?8zuuTdTfQO6NyNYhSo5SOwDm/hbLbakq1YCBGTwgm02MZH3zliRxrjxQCn?=
 =?iso-8859-1?Q?nrkHwxAmKSNfiPWJ12f6RJoOYg7M697x380jF3iHPLLHRnFweTjOszc0Z2?=
 =?iso-8859-1?Q?HCv9OWg1jOUWO5sZ+uW8pAybBmOnFYaVyi1gi2Hm+CmSQJnh+Ojw8yCfyD?=
 =?iso-8859-1?Q?5h37zyKeGdWoh5sa/I95hr9FzkU/OPJVEVEq158YdjrqveVSgAMky0J/ZD?=
 =?iso-8859-1?Q?319o9DVHc4udHVAlZocdkng4C9UA/tJrFyTI8V8p40Y+YDA0TyFlgdni+f?=
 =?iso-8859-1?Q?3UPAsCQ6DWhUjRvGgEQouR0wQDsLVMux1JHXeqvu1Ff6lwZoMheI/uSjzQ?=
 =?iso-8859-1?Q?fv+rJrZSJQBDlAYhzl0PZcBbqXyOUSvcQaUZOfInfJwlbke+OFVcbpaVdt?=
 =?iso-8859-1?Q?5gjifing0mIWHD1fkfHTRzERbdFATJj1thxL3V+2/DoUAIBkY5lrK8MUcN?=
 =?iso-8859-1?Q?guaZi+tr2CmJqdHIvC3ze1eVpoENKNmyxlmkErSUE8qkD8em9EdW7ZAcJ3?=
 =?iso-8859-1?Q?Fm5nHSHDvrKPn8Vw+VTVNkVAgUBboMNhyl9tkzVhELC058rVx0maUuF6Pl?=
 =?iso-8859-1?Q?+ENv7tE5t16+me3SgPg+GebfGJHVq9qWlRj1s/De06uTA52Z/RwRZ2wLy1?=
 =?iso-8859-1?Q?w+EJDxTpux6Jdt/I93FOoXA0pXp9Glz5dnsCGbK/aM7BsLuhQWab8RHGzO?=
 =?iso-8859-1?Q?w+aUp0lzo+4yBaQNp7JeUzKDCDMd9PxiIzJyjVTiFOeeRhDKTxLh30gV/I?=
 =?iso-8859-1?Q?RNgLk/BCfPUw+poIC2wfnlziSSrT0aN9IMBe5STnBlHpd425YoHRvUFT+j?=
 =?iso-8859-1?Q?FvL/ozwgva2UX8RmVfcHelRm8cH6TPgjHYcBvW9SpqM8GN++7EzqomOvaM?=
 =?iso-8859-1?Q?BJGJSN9BwnceKnEed+QeQot0oHT3fLwTTXLdOMNQHTvCs/27Ourp3z+4nw?=
 =?iso-8859-1?Q?EHCKGUsM4wi8D2/+jpZl/FsuqptPoBKfMAXHl4lOwmuJ/+AVuj2QOlVo8w?=
 =?iso-8859-1?Q?OWG60lKDBHZPrYr/OEusRx2j4GE+Vodl/9xN3F14+FU/PQnknDjVFu4Yu5?=
 =?iso-8859-1?Q?Lca0A5Fq+et4L2FCdWcwPnz0bomT+PjvbLYkKgs6nvndKvX9cDACSnHw6w?=
 =?iso-8859-1?Q?U9oVnM8vOCMiWMMvGFTYtoX4l2tApeoDIHI2aTAzZrJqxPdh++sLALC45W?=
 =?iso-8859-1?Q?KEAaFPwcIBvCm8P++3FAcbsaIv0JhCRqnJicGVFfalGpaD?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB61899D3F758D2B3C7BAA9361C444ADM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	RLNsmIguN1GSdqjBcf0oJwAO5JTzduchcujlzaIBHHij7qA2hMIJyCcO+/pgOFPb2xWqHqVpobN6Wh67umR33zIyEkIYZg+m4b8V9J/AxNLix3+2FGr9WqL2IKFh61Zski8DbHurNLpNoRWI2/oQL/rSIf96eZWAOrU72v3cAswwKGuEoxQdzZ9/yo1LKtRBpLWxxxMy2Vzs0EoLZTZsJvtiucPoY1gzuxJHDM3fYnsV7mLv5vyzgKf84pIBsnXFVfruQrSMr5PcJkyKlzAqNy/+VFBlsLjoEUBCMkEceSSSimhyNTfn4hzgWYwmtT9YXv6YxSh/1if4aUdVBkwxOg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da957a08-6af6-4cdd-67ed-08de8013c66f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 08:45:55.4550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dH2QQuKvffuZtx1DP+XrEFX3MCgTEVo7Pl5Np5Z89u3s/pGBDWYwYTjc3lf+Zxsur271YhPB0ffYn+LNIsX+eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8862
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232932

--_000_DM4PR11MB61899D3F758D2B3C7BAA9361C444ADM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
I hope you are doing well.
I am currently working for Cisco where our team focuses primarily on:

  *   CVE fixing for OSS packages
  *   Package upgrades
  *   LTP execution and validation
  *
Package testing

As part of our work, we also submit CVE fix patches to the community from t=
ime to time whenever new vulnerabilities are reported.
I am reaching out to understand more about the list of packages that the Op=
enEmbedded community prefers to upgrade directly instead of applying manual=
 CVE backport fixes within LTS releases. Having this information would help=
 us align our internal workflows with the community strategy and avoid any =
duplication of effort.
Could you please share the details or point me to the relevant documentatio=
n or list that outlines this package-upgrade policy for LTS?
Thanks in advance for your support, and please let me know if any additiona=
l information is needed from my side.
Best regards,
Deepak Rathore

--_000_DM4PR11MB61899D3F758D2B3C7BAA9361C444ADM4PR11MB6189namp_
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
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; backgr=
ound-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Yoann,</div>
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; backgr=
ound-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I hope you are doing well.</div>
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; backgr=
ound-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I am currently working for Cisco where our team focuses primarily on:</div>
<ul style=3D"text-align: left; background-color: rgb(255, 255, 255);" data-=
ogsb=3D"rgb(255, 255, 255)">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); line-h=
eight: 20px;">
CVE fixing for OSS packages</li><li style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0); line-height: 20px;">
Package upgrades</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, A=
ptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color:=
 rgb(0, 0, 0); line-height: 20px;">
LTP execution and validation</li><li style=3D"font-family: Aptos, Aptos_Emb=
eddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0); line-height: 20px;">
<div style=3D"margin: 0px;" role=3D"presentation" class=3D"elementToProof">=
Package testing</div>
</li></ul>
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; backgr=
ound-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
As part of our work, we also submit CVE fix patches to the community from t=
ime to time whenever new vulnerabilities are reported.</div>
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; backgr=
ound-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I am reaching out to understand more about the list of packages that the Op=
enEmbedded community prefers to&nbsp;<b>upgrade directly</b>&nbsp;instead o=
f applying&nbsp;<b>manual CVE backport fixes</b>&nbsp;within LTS releases. =
Having this information would help us align our internal
 workflows with the community strategy and avoid any duplication of effort.=
</div>
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; backgr=
ound-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Could you please share the details or point me to the relevant documentatio=
n or list that outlines this package-upgrade policy for LTS?</div>
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; backgr=
ound-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks in advance for your support, and please let me know if any additiona=
l information is needed from my side.</div>
<div style=3D"text-align: left; text-indent: 0px; line-height: 20px; backgr=
ound-color: rgb(255, 255, 255); margin: 1em 0px; font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Best regards,<br>
<b>Deepak Rathore</b></div>
</body>
</html>

--_000_DM4PR11MB61899D3F758D2B3C7BAA9361C444ADM4PR11MB6189namp_--

