Return-Path: <gauragup@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E245AC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 16:11:10 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.web10.49645.1681143070181047004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 09:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=j7K46E3S;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: gauragup@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=38956; q=dns/txt;
  s=iport; t=1681143070; x=1682352670;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=s7hy/UKoBwWbAUrcSN2PhG7jYJFeQ5SWBGmJb/OH4sU=;
  b=j7K46E3SvrJvcPkPN7/TyLJrkX625uarrxHENa68zYZqejdyzPXOEBFq
   /CA7hFPBJOeFkbCOChzo8BUHNAQgBeUU18Rz32jm5MNYzwaymXGiDoSkT
   Q6AICbX5UjP5Om4eLkQir4ntT6TtypQoMio4Rjj7K831aA7VTy4MTiXYD
   k=;
X-IPAS-Result: =?us-ascii?q?A0A7AgB8MzRkmIQNJK1agQmBT4ErMVJzAlk7RogeA4Uui?=
 =?us-ascii?q?DADgRObHoEsFIERA1EFDwEBAQ0BAS4BCgsEAQGFBgKFPAIlNAkOAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQMBAQUBAQECAQcEFAEBAQEBAQEBHhkFDhAnhWgBDIYDAQEBA?=
 =?us-ascii?q?QMBEQgNGQEBOA8CAQgRAwECIQENKAodCAIECgkIGoJcAYIPBkcDAQ+fHwGBP?=
 =?us-ascii?q?wKJURo1eIEBM4EBgggBAQYEBIE4ARECQ50TAwaBQYdLHlheg1SERycbgUlEg?=
 =?us-ascii?q?RVDeYE3BzA+gQUBgVwCA4FEGx4Ng2eCLoEMkFCIUoE0dIEgDoE8gQQCCQIRa?=
 =?us-ascii?q?4EQCGqBeUACDWMLDm+BSYFOgVwEAhQnBzYDRB1AAwt1PzUUHwUEVYEZJAUDC?=
 =?us-ascii?q?xUqRwQIOAYcNBECCA8SDwYmRA5CNzMTBoEGCw4RA1CBRwQvQoEWCgIES5wLg?=
 =?us-ascii?q?i8gAVgiEwEbEIEgZBCPUoMZKgIBBw6OFYQRnk0Kg32KUIEijRaIGxeDfYxmh?=
 =?us-ascii?q?muRdJdzII0zlQo5hGACBAIEBQIOAQEGgWM6gVtwFTuCZxM/GQ+OLA0Jg1CFF?=
 =?us-ascii?q?IpldT0CBwEKAQEDCYZJhHwBAQ?=
IronPort-PHdr: A9a23:Vl9zoBaMN8T4f8hisOPWho3/LTAphN3EVzX9orIriLNLJ6Kk+Zmqf
 EnS/u5kg1KBW4LHo+lFhOzbv+GFOyQA7J+NvWpEfMlKUBkI2skTlhYrVciCD0CzJfX2bis8S
 cJFUlIt/3yyPUVPXsjkYFiHqXyp5jlUERL6ZmJI
IronPort-Data: A9a23:7VVLEq21IcjjG/l5KfbD5cZxkn2cJEfYwER7XKvMYLTBsI5bp2cFm
 DcZWz/TPayNYGOhL4snOYq1pEJS75TcndRmSANp3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZxyFjmGzvuUGuCJQUNUjclkfZKhTr+UUsxNbVU8Enx51Us7w7RRbrNA2LBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2yxH5OKkiyZSZdBMUdGX78tmSH
 I4vxJnhlo/QEoxE5tmNyt4XeWVSKlLe0JTnZnd+A8CfbhZ+SiMaz6hiMdwTbWlsryS1h8ot4
 edPvKaZcFJ8VkHMsLx1vxhwGiV6O+hN/6XKZCHn98eS1EbBNXDrxp2CDmlvYtZeobgxWDoIr
 KdCQNwORkjra+aez7umUOBjm9wLJ8jwN4RZsXZlpd3cJap+Ec6aGPmSjTNe9DUyndxkDaidX
 ek6dDxKbAidfjxiF35CXfrSm8/x1iWgLFW0smm9orI65WXWxgF93LXhddHSYNGiQcROgl3eo
 XrL+Wn8CBwWONGTjz2f/RqRavTnlCf/XscZE6e1s6cyxlaS3WcUThYRUDNXvMVVlGajVYtaD
 UMQ1BEKvJQq7hCCfNv0ZTSB9SvsUgEnZ/JcFOgz6Qeow6XS4hqECmVsctKnQIF+3CPRbWFyv
 mJlj+8FFhQ06u3IFS71GqO86GLsZHlEdQfucAdeFWM4D8/fTJbfZ/4lZvlqCqq8iNGd9drYn
 G3S8HNWa1n+cac2O0iT9FTDhXenoYLEC1dtoA7WRWmiqAh+YeZJhrBEC3CGvZ6sz67AETFtW
 UTofeDFsYji6rnWyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJZdIWG0O
 BWN51sBjHO2AJdMRfIpC25WI5l1pZUM6fy+PhwpRoMUO8MoJFPvEN9GNBTJt4wSrKTcufhvZ
 cjEGSpdJX0bEq9ghCGnXPsQ1KRD+8zN7T27eHwP9Dz+ieD2TCfMEd8taQLSBshnt/nsiFuOr
 L5i2z6ilk83vBvWOHeHqOb+7DkicBAGOHwBg5ULLL7beFc9QT9J5j246epJRrGJVp99zo/gl
 kxRkGcDoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:dMhT1K7ZmPWbVbNpnQPXwU+BI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhJU3I6urwRJVoIEmsv6KdhLNxAV7MZniehILFFvAB0WKm+UybJ8SczJ8R6U
 4DSdkHNDSYNzET5qyWgHjaLz9j+qj9zEnCv5a7854Zd3ANV0gW1XYfNu/0KDwSeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlIawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbonttrcZrau5V+7f63+4gowwbX+0WVjUNaKv+/VQUO0aCSAZAR4Z
 zxSlkbToBOAjjqDx6ISFPWqnfdOXAVmjjfIZvyuwq7nSQ/LwhKTfapzLgpAyfx+g4uuspx37
 lM2H/cv51LDQnYlCC4/NTQUQp2/3DE6EbKvNRj+EC3a7FuHoN5vMga5gdYAZ0AFCX15MQuF/
 RvFtjV4LJTfUmBZ37Us2FzyJj0N05DVSuuUwwHoIiYwjJWlHd2ww8Rw9EehG4J8NY4R4Nf7+
 rJP6x0nPVFT9MQb6h6GOAdKPHHQlDlUFbJKiafMF7nHKYINzbErIP2+qw84KWwdJkB3PIJ6e
 D8uZNjxBsPkm7VeL+zNcdwg2DwqU2GLEfQ9v0=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.98,333,1673913600"; 
   d="scan'208,217";a="40861340"
Received: from alln-core-10.cisco.com ([173.36.13.132])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Apr 2023 16:11:08 +0000
Received: from mail.cisco.com (xfe-rtp-002.cisco.com [64.101.210.232])
	by alln-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 33AGB8Lc001943
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 16:11:08 GMT
Received: from xfe-aln-005.cisco.com (173.37.135.125) by xfe-rtp-002.cisco.com
 (64.101.210.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 10 Apr
 2023 12:11:07 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-005.cisco.com (173.37.135.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25 via Frontend Transport; Mon, 10 Apr 2023 11:11:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANrrkkVuFgQ1rqYorACktNOJqPPmel8/np7Cp18aQwHGOpVQ7J7w2SPDqzEDzqfH1jzw6qjAMLiJfNL126qWBUMHcfbQRfhYONnHCVrKFh54/WGHYr+ksKAsTXalwKVwmvLjEV5zLipfd1g9YrwbCA3OFbJQVXWi9mGKJu5GkLmkv0m8YUUUXZWIMrl4Dg+eCZJUOk2frJRf6N0iZqBhIeELit7mp4fNYleAEKmFKnGb55XNjEI+YC+O+EXga/Vq/0vmh4SHOKQOC0zWk2JpqK9QQO8uQjhNxxNqVgTjLMcjsyYYEfSBP9iWAqfmkJH8OzOR5LMQ3uoMdyHYTYbOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbuUcM5t9Tv8P5RMHJDsLFlaiINylb/Wf6RN3BFH3pE=;
 b=H0MI8XKpGo56QmDzu3OBijt+1N0yFqsj60i7t1LvHZJRnoRBgfjBkQMNmQfTRRiVZaSXPp5yyHE2ysfCHx9MbqN7m8e89Do4N8SxLNoAy/LJAmwJEmNMKRz0GcVnjmw+thestiyMZ6ZliI6Fk4s4aLROslgfS6X7Hp45YaOyY01Vz4k8CVc/wAcp8Bio/fHVI8GcVATGx4HlP1u/2nhomaqAyLlQFA6+6s3iNu4ph5HlXTSw2BTqT72cyLtAdvxg4uamrRz9eM81jQlPZqiPyu2NygIa7g8tGUNCUNzbXW/Yxl+GFM6oXhDN0CNgb9+Q6p59KCi+SvW8hYl88SP2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbuUcM5t9Tv8P5RMHJDsLFlaiINylb/Wf6RN3BFH3pE=;
 b=k4LZb4jP2QdcDxIzvpbkhKMQpZPO2zQh9e3YG0j5NfqYy9OWuS/YbIkYPUwuOQL6vUjUxahG5kwJ9m88VIPsRYi3caHZhwiLTpLdRlfP667TG0LT9hyerFoDUtPPyL8kluVZYuA2q4MGxtXZj/sByysk8rxeYXcE0haUmb0npfI=
Received: from BYAPR11MB2886.namprd11.prod.outlook.com (2603:10b6:a03:8f::23)
 by BN9PR11MB5388.namprd11.prod.outlook.com (2603:10b6:408:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 16:11:04 +0000
Received: from BYAPR11MB2886.namprd11.prod.outlook.com
 ([fe80::fb8e:4a60:ce96:bd8b]) by BYAPR11MB2886.namprd11.prod.outlook.com
 ([fe80::fb8e:4a60:ce96:bd8b%2]) with mapi id 15.20.6277.035; Mon, 10 Apr 2023
 16:11:04 +0000
From: "Gaurav Gupta (gauragup)" <gauragup@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dunfell][PATCH] Fix qemu build error with dunfell release
 "yocto-3.1.24"
Thread-Topic: [dunfell][PATCH] Fix qemu build error with dunfell release
 "yocto-3.1.24"
Thread-Index: AQHZY0ESHdOzlzHE5Uu2RKcjFe/5Qa8kx1mu
Date: Mon, 10 Apr 2023 16:11:04 +0000
Message-ID: <BYAPR11MB2886AB65C256C5D329D32FDFC2959@BYAPR11MB2886.namprd11.prod.outlook.com>
References: <20230330195143.64886-1-gauragup@cisco.com>
In-Reply-To: <20230330195143.64886-1-gauragup@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2886:EE_|BN9PR11MB5388:EE_
x-ms-office365-filtering-correlation-id: 211d24d7-ba73-4136-84d0-08db39de2f8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kwh4DrrlWyAlYcE0m9/qZoxYDh2eGA79B4y91K6w/beeuwYTikRVFq3WNaOl+fY3f/H4CfdWxrcVWB5hWnETjAGhXRUm9D0BGRgGCWb37wx/fjMxmNpm2Q94EUXDJtsbayRPLaEVlobmB2Mxx6uP5z1QStGZlO3FolcRBt5bbpXuQDpC2IqOBmO9ecwlTLWap7Sb9mcAxCcGuuIUIIOKCFVaRBrbeu8DAvMy9BM4C8837H8kPhLWiw1f90ewCFB0OzxffbVdaxoTFVXzv4rNzHmPUoOcBb0tHKy1G3C4972dnyEc2H9QIteukUYXKHFUDqla+nkGH4PCAgG01Cmp1aetFJHwtz6Eh7ZVj3F3yLisX5ujyI/72gYch9Fh151eTyUerOLdw+MgfL5Bp+Ai1D9ZltbdPVC6ZORc2WZpeZM6p3OgR509VB/940vB8pypzRS8XNM5clF8+mHcRRxT+mmu6x4JU+o9X9Mg93oWQYeU2O1ODuNDIWmVSprNLZXDWvCXqmR0vFHIHWjq1M1mDvtEkEYRwLvqO9MS4kyt5Ff/kHWFsUg7O6xP4821e/9zQ9kCZdDbPs4kvKXr3SxcvAhEnSWFaVuYOsel0seY710=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(7696005)(71200400001)(478600001)(86362001)(55016003)(33656002)(83380400001)(122000001)(38100700002)(38070700005)(30864003)(2906002)(316002)(9686003)(186003)(53546011)(6506007)(66476007)(41300700001)(66446008)(8936002)(8676002)(6916009)(66556008)(52536014)(166002)(64756008)(9326002)(5660300002)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?ug0hUIl36VV2JWdCHm8hPJA+pvwuj4s3IFRUfDzWzH4pQmHDvxomcSfs?=
 =?Windows-1252?Q?vRuJs2es/LFCvIWRV95gzxZJSPI14L7vOz08LRnUrms9x84wiFOMrGec?=
 =?Windows-1252?Q?YNiLDm/NK/fdCVr4t1IdxiklhDKGMQ8WiR67+U4gqxKlQ/whEKlqJ7vP?=
 =?Windows-1252?Q?3lssp0qN7pIHZuAw7S1HLMdjD8DbQ5MqUM8WSoiDl8fxnHg7Njyr60Qc?=
 =?Windows-1252?Q?7WLPQOYLcReAiJadNsUV4OnglxLzWEqPw2VDR1qPeaIdFeVO2nFjyVbx?=
 =?Windows-1252?Q?+PxNO/9APcOmCsW3VJKVtTj0vMhH64ZO6IqLJ3JWlCIMR/PGfaYFzfoL?=
 =?Windows-1252?Q?PDrhlwykH1a5qETj6t10cDPiVpGKzejpt0Ix9sGikNlt2tFZEBbZaLx7?=
 =?Windows-1252?Q?cVphaHyC4C76x2/5oAF2wQR94JcTmKEbU9inxVxdOovu2FiQn+ee6DtK?=
 =?Windows-1252?Q?hf1MhqvAwItsiaXLY5li0NSCtXeuBEUjCJs5HslXbbrNYC146mp6XS4V?=
 =?Windows-1252?Q?RBJXuSgz0G7T/JiD1eEl0Hb/r2VumEQjPNWb91bXOhnANG8OiSUZ+i2c?=
 =?Windows-1252?Q?Ux4LtdNHjTXHHV0IFuldTxc52KIiT1isFSEfi3t+jjjNCMMj6mmIpquu?=
 =?Windows-1252?Q?8esYRvBdtWsm/2xwAPpfpEAJ/J17kx34pWF5t4dCTWTqJIhHvBqD0Oqj?=
 =?Windows-1252?Q?teFVEpXzlMl0CSS89023CEUJ3HrOKCa3AwCPfs+Ux/fACGE4Nuktl51q?=
 =?Windows-1252?Q?VooWtopIiu4HJx1YV6TIemBgC8A8xoJ3ctkNc/KsSFcN0rMgK3xMkqe3?=
 =?Windows-1252?Q?VxjrLIAZWa7bR1dDPUi3vf4nZYh1Koj+4nZHy7RwFumNJmeD8wyIg9y8?=
 =?Windows-1252?Q?FP9C3KROtEQlCTXcWFGQdMCoEvmxFJC9SinhrrYfMaiz25p8lFtHEASq?=
 =?Windows-1252?Q?pI96Bl1fFeo5d8hGMGEf+UGyB6S3c3LEqSaKal/vwOrlHgaxMkHcHLO5?=
 =?Windows-1252?Q?3otAN/jJ+RH9j68/Y86fKBhZeKEUfgrRe/gdFLVPRM4iygJZvvc0d7Gr?=
 =?Windows-1252?Q?H/av4AgLP9ijQbZAApZn0TF9qMWJs7RsxrYoLgZBx14uaZsga5JpWJI4?=
 =?Windows-1252?Q?F5epGlpHooDHv1pRvk89lOYnBzDELRiKVBbruqKZjjdGNLaBK8w2XAl0?=
 =?Windows-1252?Q?CBwPdI3A+P/gP9jYSDpuDqZoBUiPqcHt3XeJ+mL9zJ9WwKIHbJliGWu2?=
 =?Windows-1252?Q?uK3SgvDhAfnLfLTbu5YCW84motEUGOx6OhzlnnQLIK/r31VEC1YXZrFQ?=
 =?Windows-1252?Q?Yz2QgozGGuQaYKmXzp1iCVkrGoVnkkEyN9/Q+62aP9m7EcnyGbr0x2DX?=
 =?Windows-1252?Q?x1kwAnsZj5eOOjtVPXcq8VT2pP0X48jvub2QI/ckK0HSdA3rfDnJ3FTW?=
 =?Windows-1252?Q?07owy9tltIG2ZcKgr7gwtyUGPmbZTsTiwT9EvIaFaw8GMLKpIfdItZ11?=
 =?Windows-1252?Q?bDqSaiwsA2RjJ+99yxK7Es4VBxx6DeqN/GN4B+dPM6l6u0PjbpzplQ0z?=
 =?Windows-1252?Q?ZhZSAkeOeOAnC8AqexDP7F36NT6rktdioJ+2Q4ocVtAzdBIL75ILQqrd?=
 =?Windows-1252?Q?Pd13zqel8vYnY7cdlYFYTQDn/kxJx/e3t+NyY8PYtY1p30DWC/f+QQVO?=
 =?Windows-1252?Q?WjbI1QlWowcSc7JwGXk/65OlLr3sMJQFFvmJO71OXgqrkgvXe78M83YK?=
 =?Windows-1252?Q?9DeRqLSI+Mr5n6asILQ=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB2886AB65C256C5D329D32FDFC2959BYAPR11MB2886namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211d24d7-ba73-4136-84d0-08db39de2f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 16:11:04.6345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZLTE4XpukUL59TCZeXDEjlCa0Z257DP3OL1088uMxj7VcW383xBH10VrSmm8+FkPXibP5oqTo32wbdHrIkGSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5388
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 64.101.210.232, xfe-rtp-002.cisco.com
X-Outbound-Node: alln-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 16:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179890

--_000_BYAPR11MB2886AB65C256C5D329D32FDFC2959BYAPR11MB2886namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,

Please let me know if there are any comments or if the patch is good.

Thanks,
Gaurav

From: Gaurav Gupta <gauragup@cisco.com>
Date: Thursday, March 30, 2023 at 12:51 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Gaurav Gupta (gauragup) <gauragup@cisco.com>
Subject: [dunfell][PATCH] Fix qemu build error with dunfell release "yocto-=
3.1.24"
The patch for CVE-2021-3929 applied on dunfell returns a value for a
void function. This results in the following compiler warning/error:

hw/block/nvme.c:77:6: error: void function
'nvme_addr_read' should not return a value [-Wreturn-type]

return NVME_DATA_TRAS_ERROR;
^      ~~~~~~~~~~~~~~~~~~~~

In newer versions of qemu, the functions is changed to have a return
value, but that is not present in the version of qemu used in =93dunfell=94=
.

Backport some of the patches to correct this.

Signed-off-by: Gaurav Gupta <gauragup@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |   2 +
 .../recipes-devtools/qemu/qemu/CVE-2021-3929.patch |  33 ++---
 .../qemu/hw-block-nvme-handle-dma-errors.patch     | 146 +++++++++++++++++=
++++
 .../hw-block-nvme-refactor-nvme_addr_read.patch    |  55 ++++++++
 4 files changed, 221 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dm=
a-errors.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-=
nvme_addr_read.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 0649727..4100436 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -115,6 +115,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-3638.patch<file:///CVE-2021-3638.patch> \
            file://CVE-2021-20196.patch<file:///CVE-2021-20196.patch> \
            file://CVE-2021-3507.patch<file:///CVE-2021-3507.patch> \
+           file://hw-block-nvme-refactor-nvme_addr_read.patch<file:///hw-b=
lock-nvme-refactor-nvme_addr_read.patch> \
+           file://hw-block-nvme-handle-dma-errors.patch<file:///hw-block-n=
vme-handle-dma-errors.patch> \
            file://CVE-2021-3929.patch<file:///CVE-2021-3929.patch> \
            file://CVE-2022-4144.patch<file:///CVE-2022-4144.patch> \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch b/meta/rec=
ipes-devtools/qemu/qemu/CVE-2021-3929.patch
index 3df2f88..a1862f1 100644
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
@@ -1,7 +1,8 @@
-From 736b01642d85be832385063f278fe7cd4ffb5221 Mon Sep 17 00:00:00 2001
-From: Klaus Jensen <k.jensen@samsung.com>
-Date: Fri, 17 Dec 2021 10:44:01 +0100
-Subject: [PATCH] hw/nvme: fix CVE-2021-3929
+From 2c682b5975b41495f98cc34b8243042c446eec44 Mon Sep 17 00:00:00 2001
+From: Gaurav Gupta <gauragup@cisco.com>
+Date: Wed, 29 Mar 2023 14:36:16 -0700
+Subject: [PATCH] hw/nvme: fix CVE-2021-3929 MIME-Version: 1.0 Content-Type=
:
+ text/plain; charset=3DUTF-8 Content-Transfer-Encoding: 8bit
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
@@ -17,21 +18,23 @@ Reviewed-by: Keith Busch <kbusch@kernel.org>
 Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
 Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7=
36b01642d85be832385]
+Upstream-Status: Backport
+[https://gitlab.com/qemu-project/qemu/-/commit/736b01642d85be832385]
 CVE: CVE-2021-3929
 Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+Signed-off-by: Gaurav Gupta <gauragup@cisco.com>
 ---
  hw/block/nvme.c | 23 +++++++++++++++++++++++
  hw/block/nvme.h |  1 +
  2 files changed, 24 insertions(+)

 diff --git a/hw/block/nvme.c b/hw/block/nvme.c
-index 12d82542..e7d0750c 100644
+index bda446d..ae9b19f 100644
 --- a/hw/block/nvme.c
 +++ b/hw/block/nvme.c
-@@ -52,8 +52,31 @@
-
- static void nvme_process_sq(void *opaque);
+@@ -60,8 +60,31 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
+     return addr >=3D low && addr < hi;
+ }

 +static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
 +{
@@ -51,18 +54,18 @@ index 12d82542..e7d0750c 100644
 +    return addr >=3D lo && addr < hi;
 +}
 +
- static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
  {
 +
 +    if (nvme_addr_is_iomem(n, addr)) {
-+       return NVME_DATA_TRAS_ERROR;
++      return NVME_DATA_TRAS_ERROR;
 +    }
 +
-     if (n->cmbsz && addr >=3D n->ctrl_mem.addr &&
-                 addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size)=
)) {
+     if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
          memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
+         return 0;
 diff --git a/hw/block/nvme.h b/hw/block/nvme.h
-index 557194ee..5a2b119c 100644
+index 557194e..5a2b119 100644
 --- a/hw/block/nvme.h
 +++ b/hw/block/nvme.h
 @@ -59,6 +59,7 @@ typedef struct NvmeNamespace {
@@ -74,5 +77,5 @@ index 557194ee..5a2b119c 100644
      MemoryRegion ctrl_mem;
      NvmeBar      bar;
 --
-2.30.2
+1.8.3.1

diff --git a/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-error=
s.patch b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors.p=
atch
new file mode 100644
index 0000000..0fdae83
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors.patch
@@ -0,0 +1,146 @@
+From ea2a7c7676d8eb9d1458eaa4b717df46782dcb3a Mon Sep 17 00:00:00 2001
+From: Gaurav Gupta <gauragup@cisco.com>
+Date: Wed, 29 Mar 2023 14:07:17 -0700
+Subject: [PATCH 2/2] hw/block/nvme: handle dma errors
+
+Handling DMA errors gracefully is required for the device to pass the
+block/011 test ("disable PCI device while doing I/O") in the blktests
+suite.
+
+With this patch the device sets the Controller Fatal Status bit in the
+CSTS register when failing to read from a submission queue or writing to
+a completion queue; expecting the host to reset the controller.
+
+If DMA errors occur at any other point in the execution of the command
+(say, while mapping the PRPs), the command is aborted with a Data
+Transfer Error status code.
+
+Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
+Signed-off-by: Gaurav Gupta <gauragup@cisco.com>
+---
+ hw/block/nvme.c       | 41 +++++++++++++++++++++++++++++++----------
+ hw/block/trace-events |  3 +++
+ 2 files changed, 34 insertions(+), 10 deletions(-)
+
+diff --git a/hw/block/nvme.c b/hw/block/nvme.c
+index e6f24a6..bda446d 100644
+--- a/hw/block/nvme.c
++++ b/hw/block/nvme.c
+@@ -60,14 +60,14 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
+     return addr >=3D low && addr < hi;
+ }
+
+-static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
++static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+ {
+     if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
+         memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
+-        return;
++        return 0;
+     }
+
+-    pci_dma_read(&n->parent_obj, addr, buf, size);
++    return pci_dma_read(&n->parent_obj, addr, buf, size);
+ }
+
+ static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
+@@ -152,6 +152,7 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVe=
ctor *iov, uint64_t prp1,
+     hwaddr trans_len =3D n->page_size - (prp1 % n->page_size);
+     trans_len =3D MIN(len, trans_len);
+     int num_prps =3D (len >> n->page_bits) + 1;
++    int ret;
+
+     if (unlikely(!prp1)) {
+         trace_nvme_err_invalid_prp();
+@@ -178,7 +179,11 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOV=
ector *iov, uint64_t prp1,
+
+             nents =3D (len + n->page_size - 1) >> n->page_bits;
+             prp_trans =3D MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
+-            nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
++            ret =3D nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
++            if (ret) {
++                trace_pci_nvme_err_addr_read(prp2);
++                return NVME_DATA_TRAS_ERROR;
++            }
+             while (len !=3D 0) {
+                 uint64_t prp_ent =3D le64_to_cpu(prp_list[i]);
+
+@@ -191,8 +196,12 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOV=
ector *iov, uint64_t prp1,
+                     i =3D 0;
+                     nents =3D (len + n->page_size - 1) >> n->page_bits;
+                     prp_trans =3D MIN(n->max_prp_ents, nents) * sizeof(ui=
nt64_t);
+-                    nvme_addr_read(n, prp_ent, (void *)prp_list,
+-                        prp_trans);
++                    ret =3D nvme_addr_read(n, prp_ent, (void *)prp_list,
++                                         prp_trans);
++                    if (ret) {
++                        trace_pci_nvme_err_addr_read(prp_ent);
++                        return NVME_DATA_TRAS_ERROR;
++                    }
+                     prp_ent =3D le64_to_cpu(prp_list[i]);
+                 }
+
+@@ -286,6 +295,7 @@ static void nvme_post_cqes(void *opaque)
+     NvmeCQueue *cq =3D opaque;
+     NvmeCtrl *n =3D cq->ctrl;
+     NvmeRequest *req, *next;
++    int ret;
+
+     QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
+         NvmeSQueue *sq;
+@@ -295,15 +305,21 @@ static void nvme_post_cqes(void *opaque)
+             break;
+         }
+
+-        QTAILQ_REMOVE(&cq->req_list, req, entry);
+         sq =3D req->sq;
+         req->cqe.status =3D cpu_to_le16((req->status << 1) | cq->phase);
+         req->cqe.sq_id =3D cpu_to_le16(sq->sqid);
+         req->cqe.sq_head =3D cpu_to_le16(sq->head);
+         addr =3D cq->dma_addr + cq->tail * n->cqe_size;
++        ret =3D pci_dma_write(&n->parent_obj, addr, (void *)&req->cqe,
++                            sizeof(req->cqe));
++        if (ret) {
++            trace_pci_nvme_err_addr_write(addr);
++            trace_pci_nvme_err_cfs();
++            n->bar.csts =3D NVME_CSTS_FAILED;
++            break;
++        }
++        QTAILQ_REMOVE(&cq->req_list, req, entry);
+         nvme_inc_cq_tail(cq);
+-        pci_dma_write(&n->parent_obj, addr, (void *)&req->cqe,
+-            sizeof(req->cqe));
+         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
+     }
+     if (cq->tail !=3D cq->head) {
+@@ -888,7 +904,12 @@ static void nvme_process_sq(void *opaque)
+
+     while (!(nvme_sq_empty(sq) || QTAILQ_EMPTY(&sq->req_list))) {
+         addr =3D sq->dma_addr + sq->head * n->sqe_size;
+-        nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd));
++        if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
++            trace_pci_nvme_err_addr_read(addr);
++            trace_pci_nvme_err_cfs();
++            n->bar.csts =3D NVME_CSTS_FAILED;
++            break;
++        }
+         nvme_inc_sq_head(sq);
+
+         req =3D QTAILQ_FIRST(&sq->req_list);
+diff --git a/hw/block/trace-events b/hw/block/trace-events
+index c03e80c..4e4ad4e 100644
+--- a/hw/block/trace-events
++++ b/hw/block/trace-events
+@@ -60,6 +60,9 @@ nvme_mmio_shutdown_set(void) "shutdown bit set"
+ nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
+
+ # nvme traces for error conditions
++pci_nvme_err_addr_read(uint64_t addr) "addr 0x%"PRIx64""
++pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
++pci_nvme_err_cfs(void) "controller fatal status"
+ nvme_err_invalid_dma(void) "PRP/SGL is too small for transfer size"
+ nvme_err_invalid_prplist_ent(uint64_t prplist) "PRP list entry is null or=
 not page aligned: 0x%"PRIx64""
+ nvme_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned: 0x%=
"PRIx64""
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_ad=
dr_read.patch b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme=
_addr_read.patch
new file mode 100644
index 0000000..66ada52
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_addr_read=
.patch
@@ -0,0 +1,55 @@
+From 55428706d5b0b8889b8e009eac77137bb556a4f0 Mon Sep 17 00:00:00 2001
+From: Klaus Jensen <k.jensen@samsung.com>
+Date: Tue, 9 Jun 2020 21:03:17 +0200
+Subject: [PATCH 1/2] hw/block/nvme: refactor nvme_addr_read
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Pull the controller memory buffer check to its own function. The check
+will be used on its own in later patches.
+
+Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
+Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
+Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
+Reviewed-by: Keith Busch <kbusch@kernel.org>
+Message-Id: <20200609190333.59390-7-its@irrelevant.dk>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+---
+ hw/block/nvme.c | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/hw/block/nvme.c b/hw/block/nvme.c
+index 12d8254..e6f24a6 100644
+--- a/hw/block/nvme.c
++++ b/hw/block/nvme.c
+@@ -52,14 +52,22 @@
+
+ static void nvme_process_sq(void *opaque);
+
++static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
++{
++    hwaddr low =3D n->ctrl_mem.addr;
++    hwaddr hi  =3D n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size);
++
++    return addr >=3D low && addr < hi;
++}
++
+ static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+ {
+-    if (n->cmbsz && addr >=3D n->ctrl_mem.addr &&
+-                addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size)=
)) {
++    if (n->cmbsz && nvme_addr_is_cmb(n, addr)) {
+         memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
+-    } else {
+-        pci_dma_read(&n->parent_obj, addr, buf, size);
++        return;
+     }
++
++    pci_dma_read(&n->parent_obj, addr, buf, size);
+ }
+
+ static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
+--
+1.8.3.1
+
--
1.8.3.1

--_000_BYAPR11MB2886AB65C256C5D329D32FDFC2959BYAPR11MB2886namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please let me know if there are any comments or if t=
he patch is good.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<br>
Gaurav<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Gaurav Gupta &lt;ga=
uragup@cisco.com&gt;<br>
<b>Date: </b>Thursday, March 30, 2023 at 12:51 PM<br>
<b>To: </b>openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc: </b>Gaurav Gupta (gauragup) &lt;gauragup@cisco.com&gt;<br>
<b>Subject: </b>[dunfell][PATCH] Fix qemu build error with dunfell release =
&quot;yocto-3.1.24&quot;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">The patch for CVE-202=
1-3929 applied on dunfell returns a value for a<br>
void function. This results in the following compiler warning/error:<br>
<br>
hw/block/nvme.c:77:6: error: void function<br>
'nvme_addr_read' should not return a value [-Wreturn-type]<br>
<br>
return NVME_DATA_TRAS_ERROR;<br>
^&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~~~~~~~~~~~~~~~~~~~~<br>
<br>
In newer versions of qemu, the functions is changed to have a return<br>
value, but that is not present in the version of qemu used in =93dunfell=94=
.<br>
<br>
Backport some of the patches to correct this.<br>
<br>
Signed-off-by: Gaurav Gupta &lt;gauragup@cisco.com&gt;<br>
---<br>
&nbsp;meta/recipes-devtools/qemu/qemu.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +<=
br>
&nbsp;.../recipes-devtools/qemu/qemu/CVE-2021-3929.patch |&nbsp; 33 ++---<b=
r>
&nbsp;.../qemu/hw-block-nvme-handle-dma-errors.patch&nbsp;&nbsp;&nbsp;&nbsp=
; | 146 +++++++++++++++++++++<br>
&nbsp;.../hw-block-nvme-refactor-nvme_addr_read.patch&nbsp;&nbsp;&nbsp; |&n=
bsp; 55 ++++++++<br>
&nbsp;4 files changed, 221 insertions(+), 15 deletions(-)<br>
&nbsp;create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-hand=
le-dma-errors.patch<br>
&nbsp;create mode 100644 meta/recipes-devtools/qemu/qemu/hw-block-nvme-refa=
ctor-nvme_addr_read.patch<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc<br>
index 0649727..4100436 100644<br>
--- a/meta/recipes-devtools/qemu/qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/qemu.inc<br>
@@ -115,6 +115,8 @@ SRC_URI =3D &quot;https://download.qemu.org/${BPN}-${PV=
}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///CVE-2021-3638.patch">file://CVE-2021-3638.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///CVE-2021-20196.patch">file://CVE-2021-20196.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///CVE-2021-3507.patch">file://CVE-2021-3507.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le:///hw-block-nvme-refactor-nvme_addr_read.patch">file://hw-block-nvme-ref=
actor-nvme_addr_read.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le:///hw-block-nvme-handle-dma-errors.patch">file://hw-block-nvme-handle-dm=
a-errors.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///CVE-2021-3929.patch">file://CVE-2021-3929.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file:///CVE-2022-4144.patch">file://CVE-2022-4144.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch b/meta/rec=
ipes-devtools/qemu/qemu/CVE-2021-3929.patch<br>
index 3df2f88..a1862f1 100644<br>
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch<br>
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch<br>
@@ -1,7 +1,8 @@<br>
-From 736b01642d85be832385063f278fe7cd4ffb5221 Mon Sep 17 00:00:00 2001<br>
-From: Klaus Jensen &lt;k.jensen@samsung.com&gt;<br>
-Date: Fri, 17 Dec 2021 10:44:01 +0100<br>
-Subject: [PATCH] hw/nvme: fix CVE-2021-3929<br>
+From 2c682b5975b41495f98cc34b8243042c446eec44 Mon Sep 17 00:00:00 2001<br>
+From: Gaurav Gupta &lt;gauragup@cisco.com&gt;<br>
+Date: Wed, 29 Mar 2023 14:36:16 -0700<br>
+Subject: [PATCH] hw/nvme: fix CVE-2021-3929 MIME-Version: 1.0 Content-Type=
:<br>
+ text/plain; charset=3DUTF-8 Content-Transfer-Encoding: 8bit<br>
&nbsp;MIME-Version: 1.0<br>
&nbsp;Content-Type: text/plain; charset=3DUTF-8<br>
&nbsp;Content-Transfer-Encoding: 8bit<br>
@@ -17,21 +18,23 @@ Reviewed-by: Keith Busch &lt;kbusch@kernel.org&gt;<br>
&nbsp;Reviewed-by: Philippe Mathieu-Daud=E9 &lt;f4bug@amsat.org&gt;<br>
&nbsp;Signed-off-by: Klaus Jensen &lt;k.jensen@samsung.com&gt;<br>
&nbsp;<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.com/qemu-project/qemu=
/-/commit/736b01642d85be832385">https://gitlab.com/qemu-project/qemu/-/comm=
it/736b01642d85be832385</a>]<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/736b01642d85be83=
2385">https://gitlab.com/qemu-project/qemu/-/commit/736b01642d85be832385</a=
>]<br>
&nbsp;CVE: CVE-2021-3929<br>
&nbsp;Signed-off-by: Vivek Kumbhar &lt;vkumbhar@mvista.com&gt;<br>
+Signed-off-by: Gaurav Gupta &lt;gauragup@cisco.com&gt;<br>
&nbsp;---<br>
&nbsp; hw/block/nvme.c | 23 +++++++++++++++++++++++<br>
&nbsp; hw/block/nvme.h |&nbsp; 1 +<br>
&nbsp; 2 files changed, 24 insertions(+)<br>
&nbsp;<br>
&nbsp;diff --git a/hw/block/nvme.c b/hw/block/nvme.c<br>
-index 12d82542..e7d0750c 100644<br>
+index bda446d..ae9b19f 100644<br>
&nbsp;--- a/hw/block/nvme.c<br>
&nbsp;+++ b/hw/block/nvme.c<br>
-@@ -52,8 +52,31 @@<br>
- <br>
- static void nvme_process_sq(void *opaque);<br>
+@@ -60,8 +60,31 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp; return addr &gt;=3D low &amp;&amp; addr &lt; hi;<=
br>
+ }<br>
&nbsp; <br>
&nbsp;+static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)<br>
&nbsp;+{<br>
@@ -51,18 +54,18 @@ index 12d82542..e7d0750c 100644<br>
&nbsp;+&nbsp;&nbsp;&nbsp; return addr &gt;=3D lo &amp;&amp; addr &lt; hi;<b=
r>
&nbsp;+}<br>
&nbsp;+<br>
- static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)=
<br>
+ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)<=
br>
&nbsp; {<br>
&nbsp;+<br>
&nbsp;+&nbsp;&nbsp;&nbsp; if (nvme_addr_is_iomem(n, addr)) {<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NVME_DATA_TRAS_ERROR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NVME_DATA_TRAS_ERROR;<br>
&nbsp;+&nbsp;&nbsp;&nbsp; }<br>
&nbsp;+<br>
-&nbsp;&nbsp;&nbsp;&nbsp; if (n-&gt;cmbsz &amp;&amp; addr &gt;=3D n-&gt;ctr=
l_mem.addr &amp;&amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; addr &lt; (n-&gt;ctrl_mem.addr + int128_get64(n-&gt;=
ctrl_mem.size))) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (n-&gt;cmbsz &amp;&amp; nvme_addr_is_cmb(n, ad=
dr)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(buf, (void *)=
&amp;n-&gt;cmbuf[addr - n-&gt;ctrl_mem.addr], size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;diff --git a/hw/block/nvme.h b/hw/block/nvme.h<br>
-index 557194ee..5a2b119c 100644<br>
+index 557194e..5a2b119 100644<br>
&nbsp;--- a/hw/block/nvme.h<br>
&nbsp;+++ b/hw/block/nvme.h<br>
&nbsp;@@ -59,6 +59,7 @@ typedef struct NvmeNamespace {<br>
@@ -74,5 +77,5 @@ index 557194ee..5a2b119c 100644<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MemoryRegion ctrl_mem;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NvmeBar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bar;<b=
r>
&nbsp;-- <br>
-2.30.2<br>
+1.8.3.1<br>
&nbsp;<br>
diff --git a/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-error=
s.patch b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors.p=
atch<br>
new file mode 100644<br>
index 0000000..0fdae83<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-handle-dma-errors.patch=
<br>
@@ -0,0 +1,146 @@<br>
+From ea2a7c7676d8eb9d1458eaa4b717df46782dcb3a Mon Sep 17 00:00:00 2001<br>
+From: Gaurav Gupta &lt;gauragup@cisco.com&gt;<br>
+Date: Wed, 29 Mar 2023 14:07:17 -0700<br>
+Subject: [PATCH 2/2] hw/block/nvme: handle dma errors<br>
+<br>
+Handling DMA errors gracefully is required for the device to pass the<br>
+block/011 test (&quot;disable PCI device while doing I/O&quot;) in the blk=
tests<br>
+suite.<br>
+<br>
+With this patch the device sets the Controller Fatal Status bit in the<br>
+CSTS register when failing to read from a submission queue or writing to<b=
r>
+a completion queue; expecting the host to reset the controller.<br>
+<br>
+If DMA errors occur at any other point in the execution of the command<br>
+(say, while mapping the PRPs), the command is aborted with a Data<br>
+Transfer Error status code.<br>
+<br>
+Signed-off-by: Klaus Jensen &lt;k.jensen@samsung.com&gt;<br>
+Signed-off-by: Gaurav Gupta &lt;gauragup@cisco.com&gt;<br>
+---<br>
+ hw/block/nvme.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 41 ++++++++++++++++=
+++++++++++++++----------<br>
+ hw/block/trace-events |&nbsp; 3 +++<br>
+ 2 files changed, 34 insertions(+), 10 deletions(-)<br>
+<br>
+diff --git a/hw/block/nvme.c b/hw/block/nvme.c<br>
+index e6f24a6..bda446d 100644<br>
+--- a/hw/block/nvme.c<br>
++++ b/hw/block/nvme.c<br>
+@@ -60,14 +60,14 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return addr &gt;=3D low &amp;&amp; addr &lt; hi;<=
br>
+ }<br>
+ <br>
+-static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)=
<br>
++static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)<=
br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (n-&gt;cmbsz &amp;&amp; nvme_addr_is_cmb(n, ad=
dr)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(buf, (void *)&amp;=
n-&gt;cmbuf[addr - n-&gt;ctrl_mem.addr], size);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp;&nbsp;&nbsp; pci_dma_read(&amp;n-&gt;parent_obj, addr, buf, size);<=
br>
++&nbsp;&nbsp;&nbsp; return pci_dma_read(&amp;n-&gt;parent_obj, addr, buf, =
size);<br>
+ }<br>
+ <br>
+ static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)<br>
+@@ -152,6 +152,7 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVe=
ctor *iov, uint64_t prp1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; hwaddr trans_len =3D n-&gt;page_size - (prp1 % n-=
&gt;page_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; trans_len =3D MIN(len, trans_len);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; int num_prps =3D (len &gt;&gt; n-&gt;page_bits) +=
 1;<br>
++&nbsp;&nbsp;&nbsp; int ret;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(!prp1)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_nvme_err_invalid_pr=
p();<br>
+@@ -178,7 +179,11 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOV=
ector *iov, uint64_t prp1,<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n=
ents =3D (len + n-&gt;page_size - 1) &gt;&gt; n-&gt;page_bits;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
rp_trans =3D MIN(n-&gt;max_prp_ents, nents) * sizeof(uint64_t);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nvme_a=
ddr_read(n, prp2, (void *)prp_list, prp_trans);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =
=3D nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (re=
t) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; trace_pci_nvme_err_addr_read(prp2);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; return NVME_DATA_TRAS_ERROR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; w=
hile (len !=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; uint64_t prp_ent =3D le64_to_cpu(prp_list[i]);<br>
+ <br>
+@@ -191,8 +196,12 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOV=
ector *iov, uint64_t prp1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nents =3D (len + n-&gt;page_=
size - 1) &gt;&gt; n-&gt;page_bits;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prp_trans =3D MIN(n-&gt;max_=
prp_ents, nents) * sizeof(uint64_t);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nvme_addr_read(n, prp_ent, (void =
*)prp_list,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prp_trans=
);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D nvme_addr_read(n, prp_ent=
, (void *)prp_list,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; prp_trans);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_pci=
_nvme_err_addr_read(prp_ent);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NV=
ME_DATA_TRAS_ERROR;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prp_ent =3D le64_to_cpu(prp_=
list[i]);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+@@ -286,6 +295,7 @@ static void nvme_post_cqes(void *opaque)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; NvmeCQueue *cq =3D opaque;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; NvmeCtrl *n =3D cq-&gt;ctrl;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; NvmeRequest *req, *next;<br>
++&nbsp;&nbsp;&nbsp; int ret;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; QTAILQ_FOREACH_SAFE(req, &amp;cq-&gt;req_list, en=
try, next) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NvmeSQueue *sq;<br>
+@@ -295,15 +305,21 @@ static void nvme_post_cqes(void *opaque)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b=
reak;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QTAILQ_REMOVE(&amp;cq-&gt;req_=
list, req, entry);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sq =3D req-&gt;sq;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; req-&gt;cqe.status =3D cp=
u_to_le16((req-&gt;status &lt;&lt; 1) | cq-&gt;phase);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; req-&gt;cqe.sq_id =3D cpu=
_to_le16(sq-&gt;sqid);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; req-&gt;cqe.sq_head =3D c=
pu_to_le16(sq-&gt;head);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr =3D cq-&gt;dma_addr =
+ cq-&gt;tail * n-&gt;cqe_size;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D pci_dma_write(&amp;n-&=
gt;parent_obj, addr, (void *)&amp;req-&gt;cqe,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; sizeof(req-&gt;cqe));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_=
pci_nvme_err_addr_write(addr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_=
pci_nvme_err_cfs();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n-&gt;=
bar.csts =3D NVME_CSTS_FAILED;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QTAILQ_REMOVE(&amp;cq-&gt;req_=
list, req, entry);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nvme_inc_cq_tail(cq);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_dma_write(&amp;n-&gt;paren=
t_obj, addr, (void *)&amp;req-&gt;cqe,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof=
(req-&gt;cqe));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QTAILQ_INSERT_TAIL(&amp;s=
q-&gt;req_list, req, entry);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (cq-&gt;tail !=3D cq-&gt;head) {<br>
+@@ -888,7 +904,12 @@ static void nvme_process_sq(void *opaque)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; while (!(nvme_sq_empty(sq) || QTAILQ_EMPTY(&amp;s=
q-&gt;req_list))) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr =3D sq-&gt;dma_addr =
+ sq-&gt;head * n-&gt;sqe_size;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nvme_addr_read(n, addr, (void =
*)&amp;cmd, sizeof(cmd));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (nvme_addr_read(n, addr, (v=
oid *)&amp;cmd, sizeof(cmd))) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_=
pci_nvme_err_addr_read(addr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_=
pci_nvme_err_cfs();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n-&gt;=
bar.csts =3D NVME_CSTS_FAILED;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nvme_inc_sq_head(sq);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; req =3D QTAILQ_FIRST(&amp=
;sq-&gt;req_list);<br>
+diff --git a/hw/block/trace-events b/hw/block/trace-events<br>
+index c03e80c..4e4ad4e 100644<br>
+--- a/hw/block/trace-events<br>
++++ b/hw/block/trace-events<br>
+@@ -60,6 +60,9 @@ nvme_mmio_shutdown_set(void) &quot;shutdown bit set&quot=
;<br>
+ nvme_mmio_shutdown_cleared(void) &quot;shutdown bit cleared&quot;<br>
+ <br>
+ # nvme traces for error conditions<br>
++pci_nvme_err_addr_read(uint64_t addr) &quot;addr 0x%&quot;PRIx64&quot;&qu=
ot;<br>
++pci_nvme_err_addr_write(uint64_t addr) &quot;addr 0x%&quot;PRIx64&quot;&q=
uot;<br>
++pci_nvme_err_cfs(void) &quot;controller fatal status&quot;<br>
+ nvme_err_invalid_dma(void) &quot;PRP/SGL is too small for transfer size&q=
uot;<br>
+ nvme_err_invalid_prplist_ent(uint64_t prplist) &quot;PRP list entry is nu=
ll or not page aligned: 0x%&quot;PRIx64&quot;&quot;<br>
+ nvme_err_invalid_prp2_align(uint64_t prp2) &quot;PRP2 is not page aligned=
: 0x%&quot;PRIx64&quot;&quot;<br>
+-- <br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_ad=
dr_read.patch b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme=
_addr_read.patch<br>
new file mode 100644<br>
index 0000000..66ada52<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/hw-block-nvme-refactor-nvme_addr_read=
.patch<br>
@@ -0,0 +1,55 @@<br>
+From 55428706d5b0b8889b8e009eac77137bb556a4f0 Mon Sep 17 00:00:00 2001<br>
+From: Klaus Jensen &lt;k.jensen@samsung.com&gt;<br>
+Date: Tue, 9 Jun 2020 21:03:17 +0200<br>
+Subject: [PATCH 1/2] hw/block/nvme: refactor nvme_addr_read<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Pull the controller memory buffer check to its own function. The check<br>
+will be used on its own in later patches.<br>
+<br>
+Signed-off-by: Klaus Jensen &lt;k.jensen@samsung.com&gt;<br>
+Reviewed-by: Philippe Mathieu-Daud=E9 &lt;philmd@redhat.com&gt;<br>
+Reviewed-by: Maxim Levitsky &lt;mlevitsk@redhat.com&gt;<br>
+Reviewed-by: Keith Busch &lt;kbusch@kernel.org&gt;<br>
+Message-Id: &lt;20200609190333.59390-7-its@irrelevant.dk&gt;<br>
+Signed-off-by: Kevin Wolf &lt;kwolf@redhat.com&gt;<br>
+---<br>
+ hw/block/nvme.c | 16 ++++++++++++----<br>
+ 1 file changed, 12 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/hw/block/nvme.c b/hw/block/nvme.c<br>
+index 12d8254..e6f24a6 100644<br>
+--- a/hw/block/nvme.c<br>
++++ b/hw/block/nvme.c<br>
+@@ -52,14 +52,22 @@<br>
+ <br>
+ static void nvme_process_sq(void *opaque);<br>
+ <br>
++static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; hwaddr low =3D n-&gt;ctrl_mem.addr;<br>
++&nbsp;&nbsp;&nbsp; hwaddr hi&nbsp; =3D n-&gt;ctrl_mem.addr + int128_get64=
(n-&gt;ctrl_mem.size);<br>
++<br>
++&nbsp;&nbsp;&nbsp; return addr &gt;=3D low &amp;&amp; addr &lt; hi;<br>
++}<br>
++<br>
+ static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)=
<br>
+ {<br>
+-&nbsp;&nbsp;&nbsp; if (n-&gt;cmbsz &amp;&amp; addr &gt;=3D n-&gt;ctrl_mem=
.addr &amp;&amp;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; addr &lt; (n-&gt;ctrl_mem.addr + int128_get64(n-&gt;ctrl_=
mem.size))) {<br>
++&nbsp;&nbsp;&nbsp; if (n-&gt;cmbsz &amp;&amp; nvme_addr_is_cmb(n, addr)) =
{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(buf, (void *)&amp;=
n-&gt;cmbuf[addr - n-&gt;ctrl_mem.addr], size);<br>
+-&nbsp;&nbsp;&nbsp; } else {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_dma_read(&amp;n-&gt;parent=
_obj, addr, buf, size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp; pci_dma_read(&amp;n-&gt;parent_obj, addr, buf, size);<=
br>
+ }<br>
+ <br>
+ static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)<br>
+-- <br>
+1.8.3.1<br>
+<br>
-- <br>
1.8.3.1<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_BYAPR11MB2886AB65C256C5D329D32FDFC2959BYAPR11MB2886namp_--

