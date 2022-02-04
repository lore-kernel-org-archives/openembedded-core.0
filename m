Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DB7C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 03:36:22 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.4767.1643945780984545333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 19:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Sx2q574k;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643945781; x=1675481781;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9+ngeNCthFYZi/nRioCwYERSnLd5DRDda8N/94+FkwA=;
  b=Sx2q574kvIRaqxlktHuWF8hQy1qg/W2EEIwUWZWvEcOTNOPpcyYpIh2K
   iGrcfoLhCrfU7bnJw7cyv4+XqzHxAV4FLCdsMfOVcwiTM5itnV7+wpUWb
   bc8yjig5JM5p7U/2WIlvwY8JDldmcw5n62cauodgwvuYtw2MCYQ1Q/gz1
   yxd+iIgEkrTRD/f0AM41T0yLnRntIEbKmEIeHUblyNW5M6ojT0+YHmX4Z
   8dkXVCs7jajd98yu3lbgf5+8rmSrvHjpz4BtrRIbpMSVjvXB/IIKpAqoq
   vdxbhKKiPPKBHCMIKCItiIaIw9FnPkvGmxA3R8MMCv/oo2lNSK5T2eaOw
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="309048641"
X-IronPort-AV: E=Sophos;i="5.88,341,1635231600";
   d="scan'208";a="309048641"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 19:36:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,341,1635231600";
   d="scan'208";a="566630036"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga001.jf.intel.com with ESMTP; 03 Feb 2022 19:36:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 3 Feb 2022 19:36:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 3 Feb 2022 19:36:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 3 Feb 2022 19:36:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6jsfyjhJkurpE4R8bPgSKt2hXp/HPmBtxrHg/Lfb+gce0MWuGFAL8tKxFPOuck4MCezgjPjzap+tgOp1d7ed2P9UxD1qqoHzmnNqO2bsDe0hCwB7+nlF9LQoIEfzl3fMFhE8vVynAipbHDVPUMPXqgInuY8jl0cJ2gSlCLDIzVMaFj/vNc1gcxrlOAIuMGEzXVeHgqteQTBnsg8qq04MaIQLcyxgZZw+r6HWUSi85z/9CpX+4ju16uaql2u3DYjz/pu+fqlokjmXUCxr5vdhHP1ZggFw12pREpxU9Dy8QEBwLcKi7PDSr7WEv2/Um34wcMcEc4dNW4g+X0tOoMrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+ngeNCthFYZi/nRioCwYERSnLd5DRDda8N/94+FkwA=;
 b=imYYzhOcI/XhCJjLF/MZlwQ3lDHnfqLN0Tte8xGMiHHVMR7gSEfuhXap3Jepk3xeTD/mUYk8zMkcPaOk0S0pf5HOyFp4b/4iM3vkFAy796EvdccQfu4o1TnAt9oJhgwJkj0dOZiPeYezV5zu1otyDntbTyJ1J24YIRRRzmTcFTWySE9uSqMM2BdyH/jWOOSJ79e30fGxZxZJd2ZxJhtxjAw/5BJLf/l7BjwKm3vxBlzLgLciE2eW7L7EfQFOAGRi0B+QvSKTY4+LV020xusmvl/1VTvSAak2aX+SVe7pZUbLrVriXttvF5CqhZ/5GPmfVfG9YNEbuU2m5k1XlXHN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SN6PR11MB3117.namprd11.prod.outlook.com (2603:10b6:805:d7::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Fri, 4 Feb
 2022 03:36:13 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%7]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 03:36:13 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "sakib.sajal@windriver.com"
	<sakib.sajal@windriver.com>
CC: "mhalstead@linuxfoundation.org" <mhalstead@linuxfoundation.org>
Subject: Re: [OE-core] [hardknott] qemu CVE backports
Thread-Topic: [OE-core] [hardknott] qemu CVE backports
Thread-Index: AQHYGFhKAux3cVqHoEiplc6r+R0zPqyCwASA
Date: Fri, 4 Feb 2022 03:36:12 +0000
Message-ID: <2d9bc48d58cfaec14ac3fbc61a5568f049ab9572.camel@intel.com>
References: <16D00495D34D3FEC.20712@lists.openembedded.org>
	 <69dd692e-28b2-7787-2582-16f9c5f0c662@windriver.com>
In-Reply-To: <69dd692e-28b2-7787-2582-16f9c5f0c662@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.3 (3.42.3-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2eb5ab41-45c2-4436-4c5e-08d9e78f7e06
x-ms-traffictypediagnostic: SN6PR11MB3117:EE_
x-microsoft-antispam-prvs: 
 <SN6PR11MB31178AAD46F9380E142A9373F8299@SN6PR11MB3117.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YdedgmGMyeHK5urlwSHHfuec9RKJpG4ktVwirII937H9Xirms80hU5s9nsKrTiIcFEWkZVvrvmpAnTwNDSmnWf9JoEYmolkkP+Rw8UW0pukFS82Of6t1TOSo3PTnJVjtbDkGmbw7C5Zn64RM+kZ3zxBS0gCh9W5kVBwg68G/6pcvSOUx2RpqWv6s/gJgvLiTRqzXbbiCvv5zuMknvKHymyNOJY6USOVIWRoelKW1FkdPLG5fojdVAQMrEd3+xSuvGkDKL7uyms/k2HsBikTTYubwYarSe4Q8HJdscXoHk0lED08c2S2Lzjpk9Uw+uQDejy23sSCo9XH/2Lq/e7Jzhn9kiZ5fbtwcJBE4Nk/eCljRwstYcD4PEE1U7OVzxanbmbRH8nt1sXWiGBAkAM775MKHsNPrFiFlgH01+YBxUvbxd+NOwYcY4N5164ceXL8n3w3Ipl67qiHtUnNMK+VNnclhp6NAqEbE1q8clGseqa14e/NKpdiMmnGUH/718QNyWzdg04ZIfot3LBbOBGFkeONe6LoflysjjP/O59Qc9W8mX0VWg2Yo+CqQMBaRZDTvjlD0zdXakfkW02nuQLbcEqW7XWIG6Xjri+8TkcUoDm0k76CwOR4yjCvK4+zBhJSnW5gBxJc9QK2c9K30d/nXphDl3jy85KueDJ6cgbpQ5/lJ0S7/AkVhj63xHornbgxUTJfRKA2CockjYGUbQRupCQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(122000001)(76116006)(82960400001)(38100700002)(6506007)(71200400001)(36756003)(66556008)(508600001)(316002)(66946007)(6486002)(64756008)(66446008)(4326008)(66476007)(8676002)(110136005)(8936002)(6512007)(91956017)(5660300002)(4744005)(2616005)(26005)(186003)(38070700005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L1hZRGxHNkMxUHpXQzZucWN0QXdTVjBNTVg0YnlUK3lrY2lDbUFkS3pXUFNm?=
 =?utf-8?B?ei91SHdxSlFXdVoyMFV1ckJCSjFzclpISmo2ZG81YUNBRktPOXRsRTZTcDVn?=
 =?utf-8?B?NDVYUGhvNUhOSXNXL3FKRGFtdEFUdTlhVEx6R3JJc3BVbklibnFLa3Y4L3F1?=
 =?utf-8?B?ajBvc0gyVXByeUZmbHc5UTJjQkVVNnVLMVFTdmNzVzA2RTJidTY1bTVNdWo4?=
 =?utf-8?B?bmNKdmp3cnpsNENVZ3RWNnljVmNPSWE2ZVMzQ0lLSjduMUl4ZlhnVmJrUUd0?=
 =?utf-8?B?MXMrZGlabXFDRWo1TWxzVHIwZzNDS3l6ajV5SjdnYWtyUUd2bXBTa2FoUVBr?=
 =?utf-8?B?cE1aMExJQ2l5bzZCL0RTODZLdVZxMmFJR29kSU5aRUlFNG8vZnVGRFh3Uk5h?=
 =?utf-8?B?TXRoUXN1a3BlNjB0Q2xpVk5xa0dRWmFwakRvODFOR3RRR3o3cHRVQ3NkNHFQ?=
 =?utf-8?B?YTNvME4xd0JGOHRNNHlrV3Y2NDRIUlhjSXVuaXVwNU1CL2N5WENEdjFuMXpF?=
 =?utf-8?B?TjdMMERrYzZLaWtYdlZkQmVwYUNaVGRyQkNSZURPYmJmTzN5SU5ySUNMQ1Fm?=
 =?utf-8?B?WEdGcDJWbUxWRE8zaGdoR1NXYUIyVlcvSDZVUC94MmFDdzhhZlRodGJPbkox?=
 =?utf-8?B?QkRTUldvdG5ENnFDYXZoQ1krNjErYUFHcFA5UWJoOXB6RWg3OVlPNVZtWjFj?=
 =?utf-8?B?b0U2bGxncmp6R0Y5YnFKaWhGa2ZmdG1mQVp4ZjUzTTJqcmZhKzU0dHRjT242?=
 =?utf-8?B?am4yNzUrRUpuclFuWXpyY1lNSVE4c3dGZXhZd3Y0TDZyblZXeTQyZ20vSGRD?=
 =?utf-8?B?cXhWZ2k3QWpud3NvYlNTbXgvYUhJSEgzRmEvUTBNbXpIRk5UYlF3M1g2Z2dD?=
 =?utf-8?B?Y05yTGhRQ3NXOFlpREZ3aHhQYTc1d1MxVUNMT2JIUnQwenE5Zmc4MXNiM3ZJ?=
 =?utf-8?B?bC9xK2ZibXFpMkU4TnY5Y3hxUkhTN2UwZkJISFl4R0NXQU4za0d0Y29oKzZs?=
 =?utf-8?B?QUE3NVM1QXRsOFNObENZT1B0eTk5UVdJVC9CelRrNlBya1FsUFovZEw3clda?=
 =?utf-8?B?SDdlWi8yeVJxQnhTbzNRSTNQbEJRSjBmYVdiUkorVGQ0eHZpMFFIODBqYkZ5?=
 =?utf-8?B?cThibUc0elBoS0RLckFHNUdWQndtalZJdzdDN29HdUtJMklrY2VzNUg3SGNu?=
 =?utf-8?B?Q3F1NlJ5VDVrWkNhMDJUelM5dm9aWXF4RW15ZXMwQ2V1SDNFSEZwUkFha1ZN?=
 =?utf-8?B?cE1JWEdYV0dyRTRiejF1QnVFdXdIQkczcEwyYUcvWU1xek51dzdITXZaUEJz?=
 =?utf-8?B?MGZvMFptbVhRVDNEQWx6K29hbmRIdm5OY3JTNnQyNkMxak1CN1VUUWQrV1ZN?=
 =?utf-8?B?RzF4TWZ4MDR2bTFpZWt6UWRkUHh0RVhwUFI1b1hMbVpiLzVEaU1DM3hRbXZ2?=
 =?utf-8?B?REk2ZUZEajVHT1ltaHc0bzZyNFhUNXZ4Z0pqaGJQQ0xRTkJldWV6QjFKdE5G?=
 =?utf-8?B?b25TNzNBWXp1MERqQ09UWFhYbm5SSDhHMmIwQlFjS2xudkx1WGs0bFJ1SVBI?=
 =?utf-8?B?RHFZdVZ0eGVsc1crUXNYK3NZQTlhSktNZVgxTmovTkVnYmNqMXM4NXJMQXpv?=
 =?utf-8?B?WnBNUUpJeWovb01vL0FoZFpsSzNhcHJRckJMT2c1emQwMFF5QmVWMlluN3N5?=
 =?utf-8?B?SzJjbktJUnY5a3JGeDNYWGYvZkJJV3hoZm1GMXRvaXY4dG45UWJ5aHE5cWVS?=
 =?utf-8?B?VmNRa1ZUc1lWYUJVWW40QnpmM3k3YUxqdndqbXlncTNhc3MyMVZFM3dnTXNw?=
 =?utf-8?B?V2FSZ2wyQ1REZ3RzaFFGQVA1dnVzNUhlQmtTNkxVWm9zLzhsVXQrandjT0kw?=
 =?utf-8?B?R0EraldlOU1hYm5OZ0RyRzQ1b2JxYlpRbGpxblpxNkxhTWZrbHdkQ3dFRFVH?=
 =?utf-8?B?VDFjT2dlV3J6bzN3K0ttVXp5ajhhTUhybnRsRjlpeDVkdjJhV2ZoN0NyWVBo?=
 =?utf-8?B?cjhDaXlpRkhjSFAxVmZFY1ROUGpvYjRmdzd0eXFGMHk1Q1d1TS8wOG5iVmRx?=
 =?utf-8?B?WGVBM1BzWHhLR2FSbTJEdytHL2k3djlqLzZiU0VDbjVUVXhPRzZjbnVLNFlL?=
 =?utf-8?B?ZVRyTTVkOUVlclkwUDJGQndjaGZTRzRlZm1lanBHcEN5VGh4N0wrT0xCQjRu?=
 =?utf-8?Q?j4AD5ljO5i9qHdXilRcWD5jwrDyfhm4I3AnkEvBJrLxv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B662ADE1BBD47C4BB6630C89272BFC19@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2eb5ab41-45c2-4436-4c5e-08d9e78f7e06
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 03:36:12.9223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 AvkTIDTURVBIFW3HbkkM3C8eoQ/fzVsZr9shoDmjaiLWrbjl2bdHRG6tGOKITB/3XDF+oQ7yM4Bi7wFtZdKSiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3117
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 03:36:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161332

T24gV2VkLCAyMDIyLTAyLTAyIGF0IDEyOjAxIC0wNTAwLCBTYWtpYiBTYWphbCB3cm90ZToNCj4g
SGkgQW51aiwNCj4gDQo+IFRoZSBwYXRjaGVzIGRpZCBnbyB0aHJvdWdoLiBIb3dldmVyLCB0aGUg
cGF0Y2hlcyBhcmUgc2VudCBpbiB0d28gDQo+IGRpZmZlcmVudCB0aHJlYWRzLCB0aGUgZmlyc3Qg
cGF0Y2ggaW4gb25lIHRocmVhZCBhbmQgcGF0Y2hlcyAyIHRvIDgNCj4gaW4gDQo+IGFub3RoZXIg
dGhyZWFkLiBQbGVhc2UgbWVyZ2UgdGhlIGNvbW1pdHMgYWNjb3JkaW5nbHkuDQoNClRoYW5rIHlv
dS4gSSBoYXZlIGluY2x1ZGVkIHRoZW0gZm9yIHRlc3RpbmcuDQoNClRoYW5rcywNCg0KQW51ag0K

