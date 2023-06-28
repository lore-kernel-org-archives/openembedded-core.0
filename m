Return-Path: <krkapate@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D508EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 04:43:45 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web11.9219.1687927423820600683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 21:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=iV+9bNVd;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: krkapate@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1816; q=dns/txt; s=iport;
  t=1687927423; x=1689137023;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N8rav3XLhIngciFeT7H8L/ChD82NfTkr4gUcj7s/JgU=;
  b=iV+9bNVd0e+4fxJ6EI7uWnzwdF6eUVvOOL+MbitwxaNb2xoxWwe+JaFa
   Mrv9QXwzebhYdAFpOLhXGj0+TuFAGUjIh9BR8wCGrJFsZ2hWxf594y1R2
   Vmpom5dIdM8Yzu60DYHZUMzn+ics4Gq0ULdRC6+iASqXEWNkY9/II+src
   I=;
X-IPAS-Result: =?us-ascii?q?A0B8AgBfuZtkmIENJK1aHgEBCxIMQCWBHwuBYVJzAlkqE?=
 =?us-ascii?q?keIHQOFLYhXA51xgSUDVg8BAQENAQEuBw8EAQGBU4MzAoYHAiU0CQ4BAgICA?=
 =?us-ascii?q?QEBAQMCAwEBAQEBAQMBAQUBAQECAQcEFAEBAQEBAQEBHhkFDhAnhWgNhgQBA?=
 =?us-ascii?q?QEBAwERLgEBCQEtAQ8CAQgRBAEBAR0RKAodCAIEDgUIGoJcAYJcAwGkAwGBQ?=
 =?us-ascii?q?AKKJXiBNIEBggkBAQYEBYEKAbFgCYFCh2F8iRAnG0CBTYEVQ4I3MT6CYgICA?=
 =?us-ascii?q?YFdAoQSgi6CFYwMhWMHMowOgSdvgR6BFQt6AgkCEUEmgQgIX4FnBz4CDVULC?=
 =?us-ascii?q?2OBHIJSAgIRJAMTFFN4HQMHA4EFEC8HBDIfCQYJGBgXJQZRBy0kCRMVQQSDW?=
 =?us-ascii?q?AqBDT8VDhEEglYrNj8bUYJtCRcOPUkDRB1AAwtwPTUUGwUEIwFIgVcwOgSBC?=
 =?us-ascii?q?QIiJKEaQoJggRUxG1sgYgYDgQDEDAong2GLfY0aiCAXhVekAYITlgyid4UcA?=
 =?us-ascii?q?gQCBAUCDgEBBoFjOoFbcBWDIglJGQ+OIBkegz2FFIpldQI5AgcLAQEDCYtIA?=
 =?us-ascii?q?QE?=
IronPort-PHdr: A9a23:wyVm6hcS8+a3vwYRw+PrurYZlGM/fYqcDmcuAtIPgrZKdOGk55v9e
 RaZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NBsdA97wMmXbuWb69jsOAlP6PAtxKP7yH9vRlce+z+mu9rXYYh5Dg3y2ZrYhZ
 BmzpB/a49EfmpAqar5k0wbAuHJOZ+VQyCtkJEnGmRH664b48Mto8j9bvLQq8MsobA==
IronPort-Data: A9a23:OfBz5qDANCAqIBVW/zTjw5YqxClBgxIJ4kV8jS/XYbTApDMk0DZWn
 DAfCDjQbPfeMGv8etpwYNjnoEwPvZ/RnYNqOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4WGdIZuJpPljk/F3oLJ9RGQ7onWAOKlYAL4EnopH1Q8Fn1x0UsLd9MR2+aEv/DoW2thh
 vuqyyHvEAfNN+lcaz98Bwqr8XuDjdyq0N8qlgVWicNj4Dcyo0Io4Kc3fsldGZdXrr58RYZWT
 86bpF2wE/iwEx0FUrtJmZ6jGqEGryK70QWm0hJrt6aebhdq/j5qwPYhKdwlc2xsk2XUhMxY4
 YlrusnlIespFvWkdOU1Wh1cFWR1OrdLve6BKnmkusvVxErDG5fu66wxVwdtY8tBoaAuWzAmG
 f8wcFjhajiAneG/2LunR8Fnh98oK4/gO4Z3VnRIkmCFXa5/HM+rr6Pitf5ehCY8p9l3AqjPW
 /EJQh1QNS/gfEgaUrsQIMtuwLj37pXlSBVfsF+TqK897mTfwQA027/3PfLRe8eWXoNShkueq
 2fM8mj1Dx1cM8aQoQdp6VqlguvJ2Cj8Qo9XRfuz9+VhhxuYwWl75AAquUWT+evhmB6kRvRmM
 Wcv4npztrQb3RCNQYyoN/Gnm0KsshkZUttWNuQ17gCR16bZizp14EBZEFatj/R76qcLqSwWO
 kyhxIm5WGAz2FGBYTfMqOrF/Gva1T09cDdqWMMScecSDzAPSqkchwjLR9BveEJepoKoQW2rq
 9xmQdRXuln+pccP06P+9lfdjnf94JPIVQUyoA7QWwpJDz+Vhqb7PuRECnCCsp6sybp1qHHd5
 BDofODCtYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmEhdBYxbJ1fI2C5C
 KM2he+3zMELVJdNRfEvC79d9+xxpUQdPY2/D6uNPoYmjmZZLVbaokmCmnJ8L0i0wBRzzsnTy
 L+QcN2nCj4BGL97wT+tL9rxIpd1rh3SMVj7HMihpzz+iOL2TCfMFd8tbgDUBshnt/zsnekg2
 4sFXyd8408BALSWj+i+2dN7EG3m2lBiVcio85EMKrfcSuekcUl4Y8LsLXoaU9UNt4xel/zD+
 Te2XUow9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:1p6+b6MUCmgmWMBcT27155DYdb4zR+YMi2TDiHoRdfUFSKKlfp
 6V88jzjSWE9wr5OEtLpTiBUJPwJk80hqQFn7X5Wo3SEzUO2VHYYL2KiLGD/9SOIVyEygcw79
 YET0E6MqyNMbEYt7e13ODbKadb/DDvysnB7ouurAYOcegpUdAc0+4TMHf8LqQCfng/OXNPLu
 vk2iMonUvFRZ0QVKmGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gYsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJ7iJGofy/gzdktvfrGrCo+
 O85CvI+P4DrU85S1vF5CcFHTOQiQrGpUWSkWNwykGT0PARDAhKe/apw7gpMycwLyEbzYtBOG
 Uh5RPDi3JaYCmw7xjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklW6voMRiKobzPKt
 MeRP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv00so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHqokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MROAtPTWu7ZjDrRCy8nBreDQQF++oXgV4r6dn8k=
X-Talos-CUID: =?us-ascii?q?9a23=3AWu4/gmvaD8MDRdHdoV2hKPzw6It9YCXPnG3NBXa?=
 =?us-ascii?q?iIl1xGOCOVXa5pIVrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AYUvgmQ7Fo2E+isvwi9LW97qmxow4wqL2GUwsiKw?=
 =?us-ascii?q?Z5di4DjxbHAjEtxSoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-9.cisco.com ([173.36.13.129])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 Jun 2023 04:43:42 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 35S4hgJM031410
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 04:43:42 GMT
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=krkapate@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.01,164,1684800000"; 
   d="scan'208";a="3562998"
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
  by alln-opgw-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 04:43:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/8Cfhu3PyfxgnVscZ1fLXtZ1DBLq0Iyo3ceb/KcgwGNIjdSZChqktXoYvohahfkjeiMjFYf1XVxOMzZGl1DRSf02BOEUePoZl2SHDVxoAnom7b3X7g5MALkqE85/4+LscO8tFy0eTaCD5kChfUh4HLim3sIdzEq+3HCOV1UifzcNkI2WPuGmWsijkIKIX/Xtbwxxs+GbcjaUL6MCm0DAv8Gl8bRcsaxAF96UJMfo1SxpyMvkZWUdVTN79DLZqjqPwIknrXA5o69L7L46aS2MbvQ6tuh1UBTuIUhSjmdQD5Y8PgxKbs+BqlRjf4BDJ3HAkcuE9jYwhFkozAiRbExrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8rav3XLhIngciFeT7H8L/ChD82NfTkr4gUcj7s/JgU=;
 b=ofCuAi3amDH6KR1Gf8fVNgSyASIqFjARUO4pX59G5JYHs/+TucikcwanL7wvhaS1nP+rm9Ad7l2L3VbdraPR6zOoCr1U2ld7dwNFJMloXVL5Dt0v3Y6OweFvigULniEO6XIcoqp2jw4ME9s/Te4+i1vQ2jV08YVasRQ/VB3mBHfNfoe8pskjrsXrCP5/YFCdXMPnYemMultG0MWNkv9i33vleV9atsAam0NZKByYSZF6bc4eAzSyfC4sUU/QpvMxcc4AXYFEnQENyicgjyH3o4c8um3FTcoQuJFkkqiEDci18zmOwAd39FCIo4JIlfUmUyYuEvNb2YdYRejH4cbicw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8rav3XLhIngciFeT7H8L/ChD82NfTkr4gUcj7s/JgU=;
 b=Qg8m4HeJJn8KL97f58S1xyvYHhOaAWGBTsMZHZYEXpp8GaEJbja+tLLoFf8munuZ+2XRGP5oN7u6lmRE1sbLjXe6o9doU/DhNYGy9G8iYRV5VOd/T0iMiAh5oIyYIuTiLWJhTrEbGOTL+aF+jt0TMo2aesrt4zLtG5Z5PcSXTsE=
Received: from BL1PR11MB5399.namprd11.prod.outlook.com (2603:10b6:208:318::12)
 by SA2PR11MB4923.namprd11.prod.outlook.com (2603:10b6:806:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 04:43:40 +0000
Received: from BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::5d2a:bca8:b83:597a]) by BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::5d2a:bca8:b83:597a%5]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 04:43:40 +0000
From: "Krupal Ka Patel -X (krkapate - E-INFO CHIPS INC at Cisco)"
	<krkapate@cisco.com>
To: Ross Burton <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Multiple providers are available for runtime libltdl
 (libtool, libtool-native)
Thread-Topic: [OE-core] Multiple providers are available for runtime libltdl
 (libtool, libtool-native)
Thread-Index: AQHZpObVvpR86lAiz0evk36F2k4EgK+Wjm+zgAYaaVyAADBWgIAC0h2K
Date: Wed, 28 Jun 2023 04:43:40 +0000
Message-ID: 
 <BL1PR11MB5399FACF34FB1B861D5FC102D324A@BL1PR11MB5399.namprd11.prod.outlook.com>
References: 
 <BL1PR11MB539919006E25CD8243EDE31FD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
 <BL1PR11MB5399A434D9A3B13D1A802A4BD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
 <BL1PR11MB53990B0F5E0ACD4C6A10149FD326A@BL1PR11MB5399.namprd11.prod.outlook.com>
 <9059A405-BFD8-4F3F-BDEF-CB5A64145F76@arm.com>
In-Reply-To: <9059A405-BFD8-4F3F-BDEF-CB5A64145F76@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5399:EE_|SA2PR11MB4923:EE_
x-ms-office365-filtering-correlation-id: c29f2a29-7966-48f4-28a1-08db77923ec6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QQ/T1T/jIoS1xPoWGgitAerhJuhXYmdJdI86nvrfzgXLtCfS0+FT0LiJaXlMJItkPSQ6gi8lbQi5kBd3pmpLn1o/2lPdj6dgh1dvgnzYDvJg3oqb5snW+jSj4FQoOTcXfg/ZXcWMKOcY2mfGNX9Y2/e3utW00WNNIl0LA+cUndaICPkg0nefviRWoqAtXCNR9lH5Zq+dMgBShUzmoaIQNd4FKGxJDSwPTvM8Zbk48bNJgiylsgL9byda/3H1fLPN2DVpBBd5hBD3UXun7gRojm560+mDvTNtWSM9Li3oIgnjKlUsNlkkVQpuPN47ROG0J/XNfnBeb9pt5m+m86bT8gJAT5jKfH1Z6MuOZh4s8ktClD0hXULQehV/4e4TcvxlmB3b1cNAq2v9sPL4vmMqB4Aq8cv0DpefUYNDaLw1liBzJhOaHf0eQqIN9C5e3of51IONwNXWqATQJdxidJnJ3eqmOkNQRE+/WoRLFI3Sx8v/6HNPK/0ogA/Vz4eTi2yUej01MayG39XwIA0U78A+NqqhzYNjH4Oo4EsljG5auHxqq5HBOkqRxTass0P1IkpvhaHo4y7mJ0wfuv3Ob7P/4HgqRSkCSmiEbzIgNpfKiUEKt7bonVUECLKEZQ062Gsf
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(5660300002)(52536014)(66946007)(91956017)(4326008)(76116006)(33656002)(66556008)(64756008)(66446008)(6916009)(66476007)(478600001)(316002)(8936002)(8676002)(2906002)(55016003)(38070700005)(41300700001)(71200400001)(186003)(7696005)(86362001)(26005)(6506007)(53546011)(38100700002)(9686003)(122000001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?g7PG+5/soivXyuAshkJN/+i+YHRFAhe97AN1vkJe7ZfKHpCYD9biOZ+j?=
 =?Windows-1252?Q?0mWCAyPkohOZWnY1FMa709kLmSs8pnyCdZaiEOHEjW7W+ubp8g4g3O25?=
 =?Windows-1252?Q?S26MQIt1alPXVSy2QKFAfN6mp4js/HIUAtFXOVLbsUz3dF/HZV4dfIEY?=
 =?Windows-1252?Q?P/Yb2HFheC5TJdAAQF0M51E6cXj5c5Ch59QcVmfgMlqtyHGPT0KOtG8Z?=
 =?Windows-1252?Q?+pcPMq57JM9Ihw64ZooQ+LTFE/lkT1f/iRY9umDUc3H46PKjzCRM3taj?=
 =?Windows-1252?Q?l9d0RtN525FZoc8riwVBOEkcSTxCQH12sDJa4so+qUQa9mR79dLmSwwn?=
 =?Windows-1252?Q?wYHyFMhE8bt4imtytD1vZHokjOlOTlES2t2FoTLYZ1NQ0m2Lbj4q7UAe?=
 =?Windows-1252?Q?DrswH3eXPgGnekRh+GUtewIB9fo4KPzIDDsUsV95Wn146qNNmkQNPonZ?=
 =?Windows-1252?Q?5pGQuDuD1HqQgREGYnDZS1unouznVt9zrkHLcS7xR+WtdGao3LKHUThH?=
 =?Windows-1252?Q?sgDTmu6wI1xaUYnoHAiUqvfIAFbc7daeeKAz4cM1ykDjfMGHSq3yJZlE?=
 =?Windows-1252?Q?/6KOAdNlRjw+Q8dPXIZchY50HcLP+zcDBJupipNXksMvubRCklNObtpC?=
 =?Windows-1252?Q?8JiTn0iXyATZfqlJ6OVkRpNoGASyeNEfqsAtJmAB3zJocQSP1o8FjAXu?=
 =?Windows-1252?Q?dRnWgMdPGvRmNCAmiQ9+nlKVq3E+0ggaEkr9Xzm6KHLURGVXu+DhDawa?=
 =?Windows-1252?Q?UcYJzE2QGdztTU5bVi19wIh7z+DZm8KWGOakRd/32ksoJUFcNo4A60Vv?=
 =?Windows-1252?Q?i2ecpSEhmdS8v3VWbCQN+Snm0kHgPjYJRlXzIh5Hm5g32QAWjDdE6LFZ?=
 =?Windows-1252?Q?Z+rbApRtjGt4oaX4o34tDhIc9/p2kX8MqMH8BwlhpYmAhrZGi72nu0KU?=
 =?Windows-1252?Q?q1RON/55TqvfxwCbWREKUc+XgRWOxxw658iSijUUI9CCvKWczgbEh9Gz?=
 =?Windows-1252?Q?nqc0KE+jx0uiHYg17A1lXJfn3pwyu9HPSaBeE9c11K6MMsZIWqh3B1Cl?=
 =?Windows-1252?Q?1H7fBQMb8eIx9ooZs3o5YyxcFQ/8yqmwuIESMXio8CH2OzmeczQlwZdY?=
 =?Windows-1252?Q?t8/0KkleRe3n0Hz4eMK9gtlqP7j07faOVb7yXDdPZAKkODOAOSXyz3BJ?=
 =?Windows-1252?Q?n71b2CRXAN+Pr2wknT0GnfFTzPwpSjZeaJ1rjhY6xUalp88PC8RocM/q?=
 =?Windows-1252?Q?xo7h1HUhUXxRkjGR+ENAQtybeLgy6wDaCBwvgmv+cSIl0ff8fyy9EEEN?=
 =?Windows-1252?Q?HW+9qa3maAmv1agguGqei9jxXlP48Hb9GiHBKgQ0uvt7j08igsimiaA/?=
 =?Windows-1252?Q?iYB12JftHzOm2h6B6ZP9/+CI566BBrrB4M1VP92Sti+lTTIWdoEKnmuC?=
 =?Windows-1252?Q?9zUzdLQTsWRRGKCM4v6q5xL6IhaEkt1YgGwiAEn5b+lExS+qumEh3I+1?=
 =?Windows-1252?Q?CJ3NVF26WKHSvnxV8dY7tC5nfgXc/roV/DIRG6c+ffkefBaHtb4jW005?=
 =?Windows-1252?Q?c4DukAoXSlJVIACxxoF3NPBplEDVmLkI2I+i3221RJoAHwuNlVCtp0pw?=
 =?Windows-1252?Q?IaQ4UpusdeGu5Jnnk1rnofP1MJ0qevbdGkrSkgrcOBIVzGbNOo6Tfwst?=
 =?Windows-1252?Q?ecjS3Jr7tYc=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c29f2a29-7966-48f4-28a1-08db77923ec6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 04:43:40.4555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTzgtbLnXha1jFi36N3zaqEnYd+ZsM4f7ZPIEDD5CXhXlugBSrOv0wIhXqwj1tWe3Iu06T5ONcJk9M1Y5/g8dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4923
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-core-9.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 04:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183540

Hi=A0Ross,=0A=
=0A=
Thank you for your prompt response.=0A=
=0A=
I am using Gatesgarth version.=A0=0A=
=0A=
I am able to reproduce this issue when I add "libltdl" dependency in the co=
re-image-minimal.=0A=
=0A=
Regards,=0A=
Krupal=0A=
=0A=
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Ross Burton <ross.burton@arm.com>=0A=
Sent: Monday, June 26, 2023 3:05 PM=0A=
To: Krupal Ka Patel -X (krkapate - E-INFO CHIPS INC at Cisco) <krkapate@cis=
co.com>=0A=
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>=0A=
Subject: Re: [OE-core] Multiple providers are available for runtime libltdl=
 (libtool, libtool-native) =0A=
=A0=0A=
On 26 Jun 2023, at 08:45, Krupal Ka Patel -X (krkapate - E-INFO CHIPS INC a=
t Cisco) via lists.openembedded.org <krkapate=3Dcisco.com@lists.openembedde=
d.org> wrote:=0A=
> =0A=
> Hello Richard,=0A=
> =0A=
> I see the following warnings while compiling an image (i.e., core-image-m=
inimal). =0A=
> NOTE: Multiple providers are available for runtime libltdl (libtool, libt=
ool-native)=0A=
> Consider defining a PREFERRED_RPROVIDER entry to match libltdl=0A=
> =0A=
> The following are my observations/findings:=0A=
> - The package "libltdl" is defined in "libtool-2.4.7.inc" file.=0A=
> - The "libtool-2.4.7.inc" file is in require in "libtool_2.4.7.bb" and "l=
ibtool-native_2.4.7.bb"=0A=
> - Hence, the above warnings appeared. =0A=
> =0A=
> Can anyone explain how to remove these warnings in a proper way or the ca=
se requiring this?=0A=
=0A=
That=92s very odd.=A0 What version of oe-core/poky is this with, and can yo=
u replicate with a clean poky and fresh build directory (without any other =
layers or configuration)?=0A=
=0A=
Ross=

