Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BCBCCD192
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 04:30:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.web10.8124.1760502651909565173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 21:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=aI4bW5lR;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760502652; x=1792038652;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9eeX8JjIMHA0iBa/oXecD9yjlyuXUDGurYyQgL+tx50=;
  b=aI4bW5lRQHVEgp4KXG0opB3yGgUpuAdqXRn12k2kGfwticbBxfzb9FCy
   BBcp2rLW/KECZYx8jdxkUa9xdA/2QpCs/HgsuniTjJz5mnZ5hdan6dRwS
   5xNt4s0vglyL54oKSNZzxWt50mbrnlAh4/wCZ6NlMWlvZ7KtpUtEtrOGs
   DfYOVYLs/XpcM402Dknvhp4cdQ7vscDH8f8mbrSsqCbPggLbX2OkUOuvU
   huimqbG8D0IKmppgCdLE7VAWTXrm/O32stSVPn5HNoSe2Rl+fE8C5PfMN
   iJOoIyPMQWUnI8QYfoii0nKnrj+LVUT3j44JVk+E/sfmDMTRSBntE6fCA
   Q==;
X-CSE-ConnectionGUID: IFtJWH8WTgWv8EDjCF4ZDw==
X-CSE-MsgGUID: ejLGj+OKTcyhMSubh1CnyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62377017"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="62377017"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 21:30:52 -0700
X-CSE-ConnectionGUID: 2z1IWleSTeyrgbvfor2XAQ==
X-CSE-MsgGUID: uNM3xQjXRteq1RSojXWXVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="181623253"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 21:30:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 21:30:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 21:30:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.60)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 21:30:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAsfvxuBAw2jZwR+UnbhXaOkVEG/8yyiajKXHj5eTjmE1MPxYulzy7mzNp8EnZvkYpd0gakyhB2dE5L9uh6KacB5eu5kJuqbh9Yg1xsLEcvmULAqIsQsHpmX65AoYI6U+sn1fnl2THIGI6NHj8fwYRpesp38LPQNCaiPiAcSSMwFcIS0WNuMz+lr7aZAA8AMMkQPnEMNp6H+S43kApAKGfbR5ml8MsaGfQv5BWxacQl04a29+Wszbcfhd3o1G1D2NERVQ1lbr+re+CT4TSloTY8GbD3gKyE3QMQ0DlTLgK9/ZLPPAxX7vMXnGZ7Fg4MSKWvJdHK+KovA+Bf0hFI2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CHnDsKuezosOWLENd90T7X3d0rkvYypepA4xjjosQI=;
 b=HeNtZ65v3ye0BrJ9hZyYiCKwbyDoJmtAc18CBTdRdsGpLRxa8sFSkoIkM8KNA8yrUnyB40kZ7VPCpd8GtKdyEOuvRMxWzNNdY93EK6+Z+hyS7YwTv1JYZg8oHmwQNKpFr5WkPP3Qe7UaHoTuzr0nt2JCdvrOBihXys6bPDnah6XEhmH485A9m9In1sd+5mu6HlFCtJatzxAtZKgEPwsH/nAsWAnz+sICl1f/vHXMaHGqlVOaPWvsI2HzBYRpHDVGHYS9piqmgw3IMqMIWsQQCXjYu7ILz/gj4UumkgjuUEie1SAf8cGQrxDAJpNANcA+9gVWG2SBOZ42L5am19jzNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by CH3PR11MB7372.namprd11.prod.outlook.com (2603:10b6:610:145::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 04:30:48 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 04:30:47 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: Yocto Project <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: FW: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.13.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.13.rc2)
Thread-Index: AQHcPM58JOP4r6PwKUCH6YMZakUUa7TCnQwQ
Date: Wed, 15 Oct 2025 04:30:47 +0000
Message-ID: <SN7PR11MB70185FC5F6BF9A737C35211AF4E8A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <01010199e1452afe-32ecec07-e05c-46e5-adfb-fd30263242f7-000000@us-west-2.amazonses.com>
In-Reply-To: <01010199e1452afe-32ecec07-e05c-46e5-adfb-fd30263242f7-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|CH3PR11MB7372:EE_
x-ms-office365-filtering-correlation-id: ca76d468-3492-4a88-93f7-08de0ba39d3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|7053199007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?r1LR1R9Sfeyqbjsxdmsjkg1C7t9KFwHUIjrUlspbSRMTPRAJEiRmXoihERTi?=
 =?us-ascii?Q?/+Zsrcfu4cnsZcGKm3iA4IMMc3USV1bWuvwo8zbDfnYwnYP/cXXEkAA09q24?=
 =?us-ascii?Q?tGPsNWI3hMcHKfTNjxVOnOX2IQ1bBBY3S9lI/Gden8pu92F2WdgSJiez6Xhq?=
 =?us-ascii?Q?uzq4SCVS5rnROaQQWQzqNxmdUFUOxkkjChjGVffKLycm/MPyNls3ThLiaDb1?=
 =?us-ascii?Q?Q+RuiaR+MB7H4GBVVxx0yTAwFo7MBQVWhwh1+AoFSRnQCbA2sB9uZG00Py2C?=
 =?us-ascii?Q?6yAsyF361oIoWtTfdzTeEDdV5R5WqYo/XhFqMcU54ricaVo+bv93wTKkLYXP?=
 =?us-ascii?Q?3Vzg2ba+AxopCMVljaP6pdsP843wvtqs2IvUKWmm/r0Ppa9kiscoyVu/ALdF?=
 =?us-ascii?Q?ePOZfQzXRKH//XrSocm49HI1JX7w2/QLAB7OxjWtICSTlpGm4vbNmB8Jk8px?=
 =?us-ascii?Q?3+mJOEnfAq2KrIO/s8RexJNZk9s1rSa3FZHO19tybFrQhqtb7mLLbS+qsjr5?=
 =?us-ascii?Q?xKPaqTfdM5zT9wGBR9ejndvbanM4dEHRFVlUkrHqSSxrfdWRa8aoxpvebX10?=
 =?us-ascii?Q?iuxZD0kMImNvdWO2isJa0EZNCc658jGJ0rLze/NbXaDYGeMZZrswtC6vKg5w?=
 =?us-ascii?Q?rK2+ezsjhzgmaLzoB8kGtzy5sw7zjUklQLCOe7QHmNchdb5HYd4TNNX0hmTN?=
 =?us-ascii?Q?3DbLCLRCn5RiHDdlfNF/FwPFbRoAqKMvq/fq8IAN9GftRPAmkFQq7mc2UzcO?=
 =?us-ascii?Q?CkaSLAYSW3fI+NbeOsCWzJFAmyA4Pib4h//gnSugJadWpBkyyzWQnX6F1DGk?=
 =?us-ascii?Q?cKC8h7KX233fpIPaeHTagDR1wVh1VIsi3QU/jjJ4LjIbGDvGON+1XHpmKAIL?=
 =?us-ascii?Q?SAyQA2Xge9NoJ3ng6JubZ02zJm0vExKUREim1hAy20pbozSCKODMKRD0D6wF?=
 =?us-ascii?Q?FrQ5HEAnxIQdB2WJLObK6MDxnLAHcSOKC9g8JraghDitIPBqm9xhqiiy+aWl?=
 =?us-ascii?Q?OgWr+7Y97qltnBXkj4qPNIAAbSvkauY5B+ooWd294Vnisrddi8A6jSVyQXMv?=
 =?us-ascii?Q?p7YOfSPwvcns6fvmfGOcfYXvJbNdQMaqKa+KTJStupS1aAZMqX4DCGKnmaXM?=
 =?us-ascii?Q?c9dg+iPErmUBwyKKRGNV4mxiMjo8HVMzrRPB/9t1FVzk5+X2AUlTzQkioWSB?=
 =?us-ascii?Q?65KZYMRxIsqTecwN84i1JQlQHQrw1ceV4kyKb2wyGsNzZIf+AX2lZtVLUyKx?=
 =?us-ascii?Q?Z1jU4vaP5lynZT1jFZaq0PilO7Yqr+/6Eia5Y2B1vU9arTaLu8gBBZaElADG?=
 =?us-ascii?Q?8A+VgdZpf4KkSzpR6UGGiuB3S5OguaF24cNXIJ2CBVtJUzQPRXPTcF4GQw9X?=
 =?us-ascii?Q?nG362994zEkEAMEtWN/pxCSLYLrLEaRwhMnBGBEnkE48aMzfjBFunLDKm4yy?=
 =?us-ascii?Q?TtEcJeRl2r0/0Tbu4kAp+/pBoJFn9lU3VOjsuZX/KcmmdVQWZb8BiQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tYeMOSEOsEgoBDJxE9Y/7WZbHs1gnMi51Ui8vXBfiFEnDl1QsMIrPRlp0wjK?=
 =?us-ascii?Q?WBL84I63I7AEs0DPs0meNyRzMYvFYHVnhjSPp8Qz0sO4ZjqPgTHad0VXRIUq?=
 =?us-ascii?Q?2H2mRU6eJzeESJ6qn2Q1xt1LROzddsgAmH2hAZD8RM66CyOTW6REQHYv8Oc6?=
 =?us-ascii?Q?8QXYNA8n7iKXJ9+cEJaTiQLkekeq5tYgpXGsrstqdzd6kb3SGxYioVCqY3sz?=
 =?us-ascii?Q?QkVj5Hixf7uAuKa5XKA9PS+vuXftBeuz6KucveQ01QEI3zFQhfxnktOGBzIR?=
 =?us-ascii?Q?GVqCIhTGnUXYUuhyARoVdOzYQ5luBPVKPt4SQEiZLCiLD0X8i+Ahiw3D/NIZ?=
 =?us-ascii?Q?h3bI1wT5ZJ+NdPkh+/2Cj3BETOzly9KhL8TsNLRhmCFnUABLxmmXs9d4eMvW?=
 =?us-ascii?Q?v/6k00RRKpAVTfKvHahqTNlqgY+KTBpaH07wSeGDfiRSOa7x1dgfUfcj+exi?=
 =?us-ascii?Q?Dlpq67h+wWaULlhEwxnws2jYMp/R7fZyVxJj6uvQeikqGNNpJHkA+Gr9N/HT?=
 =?us-ascii?Q?hz+FBIpMwrE7uZKBDUeNKmBl6gIWFk8ou42NqPtCeHCl2eWdYq+/9uB2tknc?=
 =?us-ascii?Q?lB+zPrh5ViLTZbRk7Dmmn+qNcg3r0+5ymT4BiR+e8gHqQILrC31iRnS8ghEG?=
 =?us-ascii?Q?WAxihbt8CNSZ+9tSLxrckwH7mVnB60xUrj2hOWlk9xwJdgd6SFj7he8zQwT0?=
 =?us-ascii?Q?24trBQIRjIfujNnixQRkuOHglX0uAYYjR5tA6nnaakyBHZnCwkFMTNuQuWCw?=
 =?us-ascii?Q?mzmZJnxWp2NVZ2V9ZkLCALpz2UMsBqTK5zagpZMaxvuoL3LqPOPMrtgrcoZv?=
 =?us-ascii?Q?cIU172SIo7ws9mfVQyN3IG01z8B7+xrm5vDtbnSfpA1ztEdIRMtFCn+PRq8B?=
 =?us-ascii?Q?xq2Qy3j7efN3aMpp7AYLoyaflmTJAFtyYGVNl3Ci7p3xPtTPFbZXNYjg9AAL?=
 =?us-ascii?Q?M18oLTdwIZca7NnX14H/1BdCOvcTlUlbAnO8q31PTcqGsE3uOQ4rQ9uWheoM?=
 =?us-ascii?Q?Y576sMKTgokI207K4o5Ii35hdeHCzg1PxB27ASYH7HRb3UsTO8fJzzD2a1Up?=
 =?us-ascii?Q?cONe10T5Z4l6+wf9o4MwTCrvR6tm6AKsww2BM7vhcpHn2lg4M8+fTQokdRiG?=
 =?us-ascii?Q?EA6D9CNMNTygAvVEHNMnb3QFQlX90dUKM1U4z7zbQ9ydkB5Nmu8DL9xgfY6O?=
 =?us-ascii?Q?1oj11uI+LhICg6TXuvQ3LX/Bmc4dvXBVPEtGRXi4Dpxl7KPTmMflXgYxQzoJ?=
 =?us-ascii?Q?2cS0v/CKm5BasP8367zhr3YG2LtG0DqljMY9e5P71bSNoOfjHQRsIB29dCpc?=
 =?us-ascii?Q?RHneJWcATy8IiufbL5QzfERAJQIPI5a9kqVKmGCKRVv8rmiqG18sysLikmuG?=
 =?us-ascii?Q?J4WGA04qS3/1I+nIpyn+fVVorTlzTpvnvrZtd8uZKb04CN+8mZOEsyxYZ7D8?=
 =?us-ascii?Q?UUWVxQqqxR2je68sSIXGpxMu0iG3uu0ISB5533zVOXXuEi+PEo6eHEe6DVHX?=
 =?us-ascii?Q?RtewCwqjfmfothkBPnEQAx2oKghNh7QrQzbr9VDkFjjnB/ZNG6y+ztuRt9zS?=
 =?us-ascii?Q?U0buu/CPafubQFmOLMrCfuV9ROOOt4ftaMLSJMA3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca76d468-3492-4a88-93f7-08de0ba39d3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 04:30:47.8620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LjVCRKH3m0pR/hNWz8XIEvpQd7yMZnRk6wJaxeoHBZFE16rQGVNEQbHnO2CdpCDka40kT2PMwfLaOa7heUxBig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7372
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 04:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224875

Hi all,


Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.13.r=
c2. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:
OE-Core
BSP-hw


Runtime auto test for following platforms:

1. MinnowTurbot32bit
2. MTL-P
3. ADL-S
4. RPL-P
5. Beaglebone Black


ETA for completion: 23/10/2025.



Best regards,

Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 14 October 2025 11:21
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.13.rc2)


    A build flagged for QA (yocto-5.0.13.rc2) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.13.rc2


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/2579

    Build hash information:=20

    bitbake: 1c9ec1ffde75809de34c10d3ec2b40d84d258cb4
meta-agl: 07a44280ecb27c3cc794a79cd46c53caf7da925d
meta-arm: 0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46
meta-aws: 446379f6892ce2145e68d9b95dbc7a208e9558d2
meta-clang: 731488911f55ebfe746068512b426351192f82f2
meta-intel: 6fc37057c7f0293a2345e303588901889df8b937
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: e621da947048842109db1b4fd3917a02e0501aa2
meta-virtualization: af1db2042caf8021d767dce1b26c08b59b96f3d1
meta-yocto: 3ff7ca786732390cd56ae92ff4a43aba46a1bf2e
oecore: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b
poky: f16cffd030d21d12dd57bb95cfc310bda41f8a1f
yocto-docs: 6f086fd3d9dbbb0c80f6c3e89b8df4fed422e79a


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#606): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/606
Mute This Topic: https://lists.yoctoproject.org/mt/115748439/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



