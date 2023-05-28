Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51DCC77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 07:10:15 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web10.24736.1685257810706480841
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 00:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=K7amREIy;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2066; q=dns/txt; s=iport;
  t=1685257810; x=1686467410;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=anCsj5rknFkFYfPhAIfr341kFOjbWurqRf3YDiczBGo=;
  b=K7amREIyHuEsCq+DYPiVaSArF9t6EJ5pr5ZfviXLk5ehYkGwacwsbgdy
   gdwtS+qXoZENBKb9XFxZeQa1Jo2DfsOWbFH7wjR9U778DzcV3AKMtHn8O
   d9BcK8KAoDls+V/NBUOvpYr8b0saV8YOcyqtNVAn6PEEv7RKCm1mMkdnF
   w=;
X-IPAS-Result: =?us-ascii?q?A0BhAQCF/XJkmJtdJa1aHgEBCxIMQCWBHwuBXVJzAlg9G?=
 =?us-ascii?q?i2III1uA51ngSUDVg8BAQENAQEuDQkEAQGFBgKFXAIlNAkOAQICAgEBAQEDA?=
 =?us-ascii?q?gMBAQEBAQEDAQEFAQEBAgEHBBQBAQEBAQEBAR4ZBQ4QJ4VoDYYEAQEBAQMBE?=
 =?us-ascii?q?SgGAQE4CwQCAQgRBAEBHxAoCh0IAgQBEggBGYJcAYJcAwEQBqA6AYE/Aooke?=
 =?us-ascii?q?IE0gQGCCAEBBgQFgUoCQ50XCYFCjHsbhEgnG0CBTYFYeYFvPoJiAgIBF4ENO?=
 =?us-ascii?q?4QSgi6OWYNcM4krgTBygSOBKIECAgkCEWeBDghne3lAAg1WCwtlgSZVPoFNA?=
 =?us-ascii?q?gIRPhVVfRIBEwMHBAKBCBAvBwQzCRcJBgkZMScGVgctJAkTFUQHhAQDCoEpK?=
 =?us-ascii?q?zcDRB1AAwt1PTUGDh8FBCMBS4FYBC9CgRkCBEmcegOCeAeBDioBAYEMDHsqK?=
 =?us-ascii?q?5J6sRcKJ4Nhi3uNGoggF4N/gVaLFJU6gy0ul2Aggi+INIJXmi8CBAIEBQIOA?=
 =?us-ascii?q?QeBYzpIgQELB3AVgyIJSRkPjiAZg1uBf2WCMIplQzICCTACBwsBAQMJiGyCW?=
 =?us-ascii?q?gEB?=
IronPort-PHdr: A9a23:mv6N8RVyub6Fb/7qSJ+6qFEsijrV8K0yAWYlg6HPw5pUeailupP6M
 1OauLNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QS47lf1OHmnSp9nYJHwnncw98J+D7AInX2t+81+Gu4ZrfSw5JnzG6J7h1K
 Ub+oQDYrMJDmYJ5Me5x0k7Qv3JScuJKxGVlbV6ShEP64cG9vdZvpi9RoPkmscVHVM3H
IronPort-Data: A9a23:yuLW6q+QE4c4aZm7Rv3rDrUDhX6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GRKDGGBOvbfMWOhKY90aYW+9UhQsMLdyt81G1ZtpSFEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEjmE4E3F3oHJ9RGQ74nQLlbHILCCYngZqTNMEn970ko+wbFh2eaEvPDga++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFJZH4rHpxdGlOjKmVi8kFWc
 M6YpF2x1juxEx7AkbpJmJ6jGqEBaua60QRjFhO6VoD66iWuqBDe3Y4nNeMfRgRokAmRuPFIl
 vpjpI6BGRkAa/ikdOQ1C3G0EglkNqFAvbTAO3X67YqYzlbNdD3nxPAG4EMeZNJDvL0oRzAVs
 6VFdVjhbTjb7w6y6KmwSuhwnMMvBMLqJ4gY/HpnyFk1CN54HcqaHfmTube02h82h8l/MMnXR
 vAnVhBTRhDrOztuPnwuXcdWcOCA3ymjLGIwREiuja0v7m7eyQZ83LTgPJ/efcaHbcFUhVqD4
 GXe8mL0BxsXONCSxXyC6H3EuwPUtTnwVIRXH7qi+7s2xlaS3WcUThYRUDNXvMVVlGaiWstcB
 A8r4RY2iokLqmOFX8vMDwOR9SvsUgEnZ/JcFOgz6Qeow6XS4hqECmVsctKnQIF33CPRbWFzv
 mJlj+8FFhQ07+LIESP1GqO86GLtaXJMfAfucAddFVNdi+QPtr3fmf4mczqOOLS+gtuwEjbqz
 nXW6iM/nL4Uy8UM0s1XHGwrYRry/fAlrSZstm07u15JCCsiNeZJgKTzsjDmAQ5odtrxc7V4l
 CFsdzKixO4PF4qRsyeGXf8AGrqkj97cbm2B2wc1RcJ4qG73k5JGQWy2yG8nTKuOGptbEQIFn
 GeI0e+szMYJZSDzPfMfj3yZWpV0pUQfKTgVfqmEMoURCnSAXASG5yppLVWBxHzglVNErE3ME
 cnzTCpYNl5DUf4P5GPvH481iOZ3rghgnjm7bc6gkHyaPU+2OST9pUEtagXeN4jULcqs/W3oz
 jqoH5LbkEgFAbWlPHa/HEx6BQliEEXXzKve8qR/XuWCOQFhXmomDpfsLXkJIuSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:zRnIxa5gU64ByKYcHQPXwX6BI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhJE3I+errBEDyewKiyXcT2/hdAV7CZnithILMFuBfBOTZskTd86OVzJ8k6U
 4NSdkdNDS0NykGsS+Y2nj1Lz9D+qj9zEnAv463pBcdLj2CKZsQlTuRYTzrdnGeMTM2Y6bRY6
 DsgfavyQDQHEj/aP7XOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPkf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcVcsvy5zXAISdOUmRQXee
 r30lId1gNImjfsl1SO0FjQMs/boXETAjHZuBmlaDDY0LLErXoBert8bMRiA1TkA45KhqAl7E
 qNtFjp7qZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh5LD30XklZ6voJhiKnrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhHcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3c07lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rel2G9D2MRCAtBjWu7NjDsJCy83BrZLQQF6+dGw=
X-Talos-CUID: =?us-ascii?q?9a23=3ApQucBGiDNWcShgyvtvcyLLq1VTJubnzEz1iTHFS?=
 =?us-ascii?q?EEUFIceO6Z06CyfN6up87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AeOpXvg2f0I7dmtez4ziyLqgC9DUj5aWnOW0ymLQ?=
 =?us-ascii?q?8hfauCQZ0EG+7rTCce9py?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 May 2023 07:10:09 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 34S7A9Nf006559
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 07:10:09 GMT
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,198,1681171200"; 
   d="scan'";a="2022368"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xl9ntgDOakoukGjQDJS10J1fYySDkvLOsfuksf4jtVNE0sq/95sB7prJ47MyJuscG3c4DrXcUWbrfxHySr8Wl8TIAmBUpCrJo80Iwb6VpyS+U/WWgEpW8NS8R1DWEcJXjSbLQ9p40p9qtqVPmkSB46I706BElL7GAkFr7JJlw/3498uftm9GL8JqsLG2WSFWUaB9xOzC2Vgh/Sw6ZqXmJ7OGavUlKAmXNHkRQ/rRHF69siDgOTPZeZ+KlDj7xyxwzX7NyV1m7JtUAw1TP/sfynbbEgrShxDySJSnwI4/4QX4v833XP+XLDaE2EizLO3fjc+EEAqtGNGavfYelwVYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anCsj5rknFkFYfPhAIfr341kFOjbWurqRf3YDiczBGo=;
 b=YtGWfB6jj2RpxgLpbdAZdnUBHkEotmpKDEKePNCGs1gqinct7IvS82Bb0hU78FLLaq0Cd1AS8fhuYcXxAJMDmUhPIA+3uNRwPRLY3Wbyc63IVdl1mPMHdXwL/UbmDVaxyAEkLjbAwmHyJ998f3JiRXV/WUahobrd2AYYO9VJ/Dq1SurfNsMpdSGM/kk+/DZXwVqoLRd2AMCTq+qiuoM02Mpw6mGh6VWsdTdAINOESD1Jq+3WUFhEYJEQNBfwyPm/TJWjEqHHWx60UEv+HmyEmtcvWHPzmF/XL8I6YoKCGyIeNzZ+ncFmHESd2RT3IL6/Jsbp5l46gFNyJ3Bk0zJAXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anCsj5rknFkFYfPhAIfr341kFOjbWurqRf3YDiczBGo=;
 b=HW6dkkPt1DY9kUdf+qi+vN4afnSGGvHfMmJ4njjs46PbNNdWokDrLbGOrYGooZ8m9ojwRifENYfKeO/XAXyFqypHP0Vao1rewP6/Mx4kNF4eHeJsvWO4ECZXaM8v2+XuztWkSN+ODoMfWoA4Kyr8HZCLC0Eqc1Ph+Jlk8c6imSk=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Sun, 28 May
 2023 07:10:07 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6433.020; Sun, 28 May 2023
 07:10:06 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
	<schitrod@cisco.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>
Subject: RE: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"
Thread-Topic: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"
Thread-Index: AQHZkTBOVmroIWwMLUm3v6XydG2/ca9vQcwg
Date: Sun, 28 May 2023 07:09:37 +0000
Deferred-Delivery: Sun, 28 May 2023 07:09:30 +0000
Message-ID: 
 <SJ0PR11MB6717FDF0FA29DCBA25329983DC459@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <17633BD1C0C1B26D.6918@lists.openembedded.org>
In-Reply-To: <17633BD1C0C1B26D.6918@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|BN9PR11MB5242:EE_
x-ms-office365-filtering-correlation-id: 6d0d3134-fdb5-4aed-c4b5-08db5f4a90a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gHkgU4UAHwKnGRlttZ8ThD+h7lgacqQhhtnQH9s3pMwwlfXBw9Wc+0+M0An4LKNkaV63xLvooqMCKqGh+EaL2Ir+sbMia+8KmCUpecpKFZiiff2sdAIbSU9RXY4AN/ZWzy1WY+/t0g2QePbz4vmNjJM1WVpI9wLputJ69/2/pZEDQ/3plN5oDhGk120UzQ74T1izc9EZLjfhLjygI/e1yvNX8auMdovyHNFFlLTp0W02qUXdL90t9k0ik0zQZ2MQENzRJmfw/uAYDOKJagRZRICIgtjdsHTP5GDh5s+nFcWzkAERejiVyDkbT+bwaSrL7rmxLaiMypygNqvAcH2w4gkToaamxV5jlH96VWaz7A0PjjiPZ1s1MzrWKsQz/FbYNVw1SxWXOwLOHSgt2huLLUCbz7v2v0Ea4bcVbFy4mfk9Lym0WZnmk9Hx1+eDCwD6ZgQKSSSlY9OGPnvVRARPQbI9N1z9XRbxScGa/HXHgl409xtmhkBuJjtOoE7xXSh1VEUzZiExt3IZU5w9F0sNdasHvYkdqWd0E2S8PRUuSLJ7lDV/fG+RT8N0yIq72oc7QXb6k8MFa2HUNIFpk+fp1qwVk+oitt/TS+lLIVFSwy7qpIQQ2FN+ecx1Wk52xQ0QSAyM8m6RwhEPk2cIH+T9ow==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(38070700005)(6506007)(9686003)(186003)(2906002)(110136005)(66899021)(478600001)(15650500001)(83380400001)(86362001)(7696005)(122000001)(8676002)(966005)(41300700001)(38100700002)(8936002)(55016003)(5660300002)(66946007)(76116006)(64756008)(66446008)(66476007)(66556008)(316002)(6666004)(71200400001)(33656002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+AuFVpXlG9xGaEtlN8BLNemszH7l82s+y7aL0X7P9krDaoPPntIRTaXBtFvN?=
 =?us-ascii?Q?6zdmY/gUNZa7Pgcht0h2xmY0NkLmTuVXA8yNsV2U5UMLIl9BoHISSubaxh3d?=
 =?us-ascii?Q?XGduC8yy/DkthSI9OxlxwBFVj7ZGvFMjFq0HY817qHn2CP/8mmAtVbVudB1N?=
 =?us-ascii?Q?+cSmGGhQP/fR9sHVcV04nKaVAdejsNp8fTpzTSIP/WmoUFmi0GCfjs6VRhmX?=
 =?us-ascii?Q?v0bAJbhNUS9LtgaqQw8CKa4Y+6fNBk3Jr/i+BK/Vgk5L8PY7kEV2nBBFHX9j?=
 =?us-ascii?Q?RWLBcYpYdb9U6KXwy9/7Hi6gEaaJrD75Rx6Uz8By4XShV8LM6EHguIOBSdWG?=
 =?us-ascii?Q?sV2x86QnRFSDdf1YUfkh+WYB+W9IIIA43bbvLtwPtVuSaP0AovnbOnhtv++a?=
 =?us-ascii?Q?e4eNZUHKjqFZII52XWGBORda3o4fVoA5jb381BQ53TZLdBuLv1xGK5l4Xz/a?=
 =?us-ascii?Q?XAfez/FK3tYrIXL48EpbRQKRBa4iQg6WdHGYoJWarvMu9VIvJV/DTmqjZuJi?=
 =?us-ascii?Q?UtvQf/qme4CO26TccRbS5MPOFuZ6JTE8lQ84RwqaREw79ihl5Bl29C/Mb3N3?=
 =?us-ascii?Q?E5dVq2o7WcPA511vn7lXKsXtBfQO3B3JImLtHri2ab11vFoIdojGPScCNMeI?=
 =?us-ascii?Q?7lI8QkIUjaOaTcfxwvUoRQdP2tlztb0kr/t23Vo47/taHZgifunoOtgF/84/?=
 =?us-ascii?Q?QZgYxnIbzi4MzLMeNv7XAsug4CWRcBYM8W8Ik5BurAnCJucVjS7TTarNB9ZU?=
 =?us-ascii?Q?xCfyRlwgi1Fgtzx7CEwn0TmmjzjwXjlBiH/5iItqHEL/uF9348oOvvApAicS?=
 =?us-ascii?Q?txzecs9ztQ8/b1PrjK0apk/pwHgrgWK+9QlDfLoGjUecMd4EzY61DJkEp23z?=
 =?us-ascii?Q?cbTqdEiFc8TQfYvLMQhg0e/2yh8+eRMpXF/HCPA0CxVTx7qYmIZZPWx17KRv?=
 =?us-ascii?Q?Wp3xTGU2ae/bAAbNfbR4U4wQy7U3FpB4lBZD+e/BirrBUBFHx0DmxMq8rZjd?=
 =?us-ascii?Q?l+N3x0FivPVyu7mHQB0su/OrRMf3vdf37IdatGev6h1DsJEfVjVU6j0mmvWj?=
 =?us-ascii?Q?9SyT2eW9jtSIUw7e5F9Q2AbgChhG6D/4MVPYCeloAO9d2jkiwx6hucfG4Ald?=
 =?us-ascii?Q?J4cQUT1AISLjqXVVqI4vHXoj2uuNGK9nPN44y23ScDbG3BJv5B8Q+3JBgZOc?=
 =?us-ascii?Q?yxb28CM4KZOxWGMhRTZzeezFOO8Rky/O+lQRBANLg0G8aPqz8mWW0FTVCL8M?=
 =?us-ascii?Q?Yvc6jCbdIBPfeGtbRREPozqCmRAb1dKs7c+fSgyWSpGek30hv66NbTDAycCF?=
 =?us-ascii?Q?GGbn/8r1e4yblsO22ou0VVz+P5KG7Ywz4qwnJmqrwzAQGACSJZZueg1zpS/D?=
 =?us-ascii?Q?PSm/R02AjJQV5WIH8x8gsaFeDnO2kzMYAu0Jj2x+1ObookRPef79kuZ5s/cD?=
 =?us-ascii?Q?dEPWqqv9BQchCeZCpmow7wNZuhupLwPc1wQEPZvx0J/pHwzGr8hmNLNUT7Mb?=
 =?us-ascii?Q?gjXin8ZxBUjq+Xp4hi/guHQ7miuhKwEMkQFdN7Kyh1uaORuOCbsLgc2Awdw/?=
 =?us-ascii?Q?bVu0MwenF8G0K5tRMrwBokhUUlug4uMR/pca59Nymd9w7z/q+xzwMpItxjHk?=
 =?us-ascii?Q?PQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0d3134-fdb5-4aed-c4b5-08db5f4a90a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2023 07:10:06.1675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n0HaJkWRrefPAHNiHzp0sEseb41G9BJt0gDDwlt3HPPFydNVkeyZrTEikgZoOFQfuarhtaV+ly0Abm1oEEQMoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5242
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 07:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181814

Hi Alex,

It looks that due to https://github.com/openembedded/openembedded-core/comm=
it/8800976e79d65956218ab462d9644d0661579301 commit.

"CVE-2022-21227: sqlite3-native:sqlite3 https://web.nvd.nist.gov/view/vuln/=
detail?vulnId=3DCVE-2022-21227 " is wrongly reported on master branch:
https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-master=
.txt

Ideally CVE-2022-21227 CVE is applicable to https://github.com/TryGhost/nod=
e-sqlite3 which is " SQLite3 bindings for Node.js".
"https://github.com/sqlite/sqlite" is "Official Git mirror of the SQLite so=
urce tree".

Please review the case and share your comment.

Thanks,
Sanjay

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Sanjaykumar kantibhai Chitroda -X (schitrod - E=
-INFO CHIPS INC at Cisco) via lists.openembedded.org
Sent: Sunday, May 28, 2023 12:18 PM
To: openembedded-core@lists.openembedded.org; Sanjaykumar kantibhai Chitrod=
a -X (schitrod - E-INFO CHIPS INC at Cisco) <schitrod@cisco.com>
Subject: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"

This reverts commit 8800976e79d65956218ab462d9644d0661579301.

As per NVD database "ghost:sqlite3" product is specific to "node.js"
CVEs reported against above products are not applicable to us.

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support=
/sqlite/sqlite3.inc
index c246d42fdf..9a0de08553 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -18,7 +18,7 @@ S =3D "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 UPSTREAM_CHECK_URI =3D "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
=20
-CVE_PRODUCT =3D "sqlite sqlite3"
+CVE_PRODUCT =3D "sqlite"
=20
 inherit autotools pkgconfig siteinfo
=20
--=20
2.35.6


