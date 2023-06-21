Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D06EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 05:07:24 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web10.4285.1687324043248224270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 22:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=dLvsSk79;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3193; q=dns/txt; s=iport;
  t=1687324043; x=1688533643;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KnxkrBn0uuNxWzfQtHYMCBFfmAhfKgsL160uzIRMV0k=;
  b=dLvsSk79SITovou/a26dlxcL88TbkRrPWJoPjjffS8PyvAo4BO4y4nfr
   sxzR52Ij98rjKJePiH6O8pq5l5gOfi657y0O/h1++E2cINKGkRNNOHHSH
   AAWfRzXuRjx+eFT1sz9MqPoAnVrMxac64Xwd7jc8c4z7qpqFMzRh7bmXa
   0=;
X-IPAS-Result: =?us-ascii?q?A0AaAACEhJJkmIgNJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEWBwEBCwGBYFJzAlkqEkcEiBkDhE5fiFUDnW8UgREDVg8BAQENAQEuDwcEA?=
 =?us-ascii?q?QGFBgKGAgIlNAkOAQICAgEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHBBQBAQEBA?=
 =?us-ascii?q?QEBAR4ZBQ4QJ4VoDYYEAQEBAQECAREoBgEBNwELBAIBCBEEAQEfECgKHQgCB?=
 =?us-ascii?q?AENBQgMDoJcAYJcAwEQBqMZAYFAAooleIE0gQGCCAEBBgQFgU0COwQBsFsJg?=
 =?us-ascii?q?UIBjGwrhEgnG0CBTYFYgjA4PoJiAQEBAQGBIzyEEoIughiJGA0MgmGDCYIWG?=
 =?us-ascii?q?C4Hi1mBKG+BHoEgegIJAhFngQgIX4FzQAINVAsLY4EcUjoegSgCAhE6FFJ4G?=
 =?us-ascii?q?wMHA4EFEC8HBDIJFgkGCRgvJQZRBy0kCRMVQQSDWAqBDT8VDhGCWiICBzY/G?=
 =?us-ascii?q?1GCIzcDRB1AAwtwPTUGDh8FBCMBSYFXMD6BEgIhJKAdA4IrbAg8JiwHDBgEF?=
 =?us-ascii?q?gZ4AzI2ASiTD7FMCieDYYt8jRqIIBeFV6QBmBogjTuVOYR8AgQCBAUCDgEBB?=
 =?us-ascii?q?oFjOoFbcBWDIgkKPxkPjiAZHoM9gX+DFYpldQIBATcCBwsBAQMJi0gBAQ?=
IronPort-PHdr: A9a23:dqBtuBJPn8khM6nCcNmcuakyDhhOgF28FgcR7pxijKpBbeH4uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1o2t2qjPx1tEd3lL0bXvmX06DcTHhvlMg8gPe/1G5LIiMif3OGp8JqVaAJN13KxZLpoJ
 0CupB7K/okO1JJ/I7w4zAfIpHYAd+VNkGVvI1/S1xqp7car95kl+CNV088=
IronPort-Data: A9a23:EVcM9asXey8fwGD4Mi6uHtVyjefnVEteMUV32f8akzHdYApBsoF/q
 tZmKWyGbv6DNGujKo1yPY3ioExS75aEzIU3SgRq/3w0FSMUgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUIYoAQgvA1c8IMsdoUg7wbVh3NQx2YHR7z6l4
 LseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3ecldG0DFrrx8RYZWc
 QpsIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbhVq/kQPPqgH2PU0YGZImS6wmfZL6
 5ZS7IeoZgcZNI38obFIO/VYO3kW0axu8bvDJz20ttaeihaAeHr3yPIoB0YzVWEa0r8oWicVq
 7pBc3ZUNU7ra+GemNpXTsF3jcQiMNPsMKsUu2prynfSCvNOrZXrGv+SuYQFgmps7ixINd/CW
 8QJYxZBUBiaWRdoIWkFBc9vgvj90xETdBUB+A7K+sLb+VP7yxR81rXoOtfZdtGGAM5ShEuwo
 mPd43+/BQkXMtGawzeJ/n+gwOjVkkvGtJk6Hbm88Lthh0eegzdVAxwNXlz9qv684qKjZz5BA
 0U15Tg1lK4Uzm/oUYDmRzK4kHSkjidJDrK8DNYGwA2Kz6PV5SOQCW4FUiNNZbQaWCkeGGJCO
 rihwo2BONB/jFGGYSnHpurI8VteLQBQfDFfNH5cJecQy4S7yLzfmC4jWTqK/ESdodTvHTj2z
 1hmRwBh2u1P1qbnO0hHlG0rbhqlopzPCwUy/AiSBSSu7xhyY8iuYInABbnnARRoct/xorqp5
 Sdsdy2iAAYmVsDleMulG7RlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG5P
 xWD5FMKvcEDZBNGiJObharvU6zGKoC+TbzYugz8NbKin7AoLlbcpXEyDaJu9zm3yRNEfV4D1
 WezKJbwUily5VVPxzutTOBVyq4w2i073gvuqWPTkXyaPU6lTCfNE98taQLWBshgtf/siFuOq
 b53aZDVoyizpcWjOEE7B6ZJcwBTRZX6bLirw/FqmhmreFY4QTB5W6eAqV7jEqQ895loei7z1
 ijVcmdTyUH0gjvMLgDiV5ypQOmHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:TcrOi6wqa+0Q5lJ+SuhuKrPxg+skLtp133Aq2lEZdPULSK2lfp
 GV8sjziyWatN9IYgBfpTnhAsO9qXO1z+8T3WBjB8bSYOCAghrmEGgC1/qv/9SEIU3DH4FmpN
 xdmyYVMqyLMbEXt7ee3OD8Kade/DDlytHnuQ699QYRcegCUcgJhGsJaXf4LqQ1fng7OXNTLu
 v72iMznUvZRZ1hVLXDOpBqZZmmmzTMrv/bSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkiTij5/T882T+1v57Sv+/p5WkNzuxp9oH8qXkPUYLT3ql0KBeJlhYbufpzo4ydvfq2rC0e
 O84SvIDf4Dr085TVvF5icFHDOQlgrG3kWSjGNwR0GT+PARCghKU/apzrgpAicxo3BQz+2Ulp
 g7nl5wc/FsfEn9dOOX3amSazh60kWzunYsiugVkjhWVpYfcqZYqcgF8FpSC4poJlOw1GkLKp
 gmMCjn3ocfTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNxd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDhRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dvP22J6IJzYEUaICbRRFrEmpe4fdIi89vd/HmZw
 ==
X-Talos-CUID: 9a23:f90kNm1NtRi030ES9xiw+rxfE+E6YGbkylHqAAynUH1xZ72lQ3+gwfYx
X-Talos-MUID: 9a23:Vf8s2ASI4EcHgkrNRXTFmA1sJM1EzZiiUnoHto44qcTZZDJvbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-3.cisco.com ([173.36.13.136])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jun 2023 05:07:22 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	by alln-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 35L57Mrt017141
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 05:07:22 GMT
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,259,1681171200"; 
   d="scan'208";a="3265726"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
  by alln-opgw-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 05:07:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/AWnfwbZ5+txhMtrmn5oL6aKXwaaWytKdOUR79nOsF4Xekyik7STMTplKqU8Q41Xg4bl9AG6+M7nLe+UjZk81kRctCi4JWYaiTYkM+gRubNFPozusKN9H6S3dF/QTp1WcTb00p4Ecv65KlCfVzD3c0E15MxnR0G/rwJ0SMwJcbSB+LOUwDg0awlRT0E/pWejqo8vCLZoBTNaAxS9uJrm+Y/A9wUiO19YBVrCz7CHrEF3ZyT/GYPKbjsj/JsnjjYm6lW4Ck7Ik2Nlnkk50vrDBJ248x/TSjs7l4YsrvKllQrfpPHqHVkmiO+GvynVlAPpEXzBgT2ETkiJdhL4RzZ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4bWH7BEnA7/Qh53TjuEeEtCdBaRzsaQuJGT4uEU4xA=;
 b=l+Z7ZCXdPAiqkca7CzNMc+TaFpLOintR+HCudqvGpihNnsSlFrlptWpLFXW5NdX3/VdJqMPsD3MrjIHFWa/vbuzMiNYAAb0J/4ykztND1YbOKjn4oNEsr0C05wCTVqObMGu7D0js1nRcsH8x96kMKAgD3KbWnXToNMntLHNPMMsMFEBJJKuVXGJfEybM8c59v0WlLNblahb4nxeLBklofby1pdTP3UlAC1ClzOGxTv2QcI4EOcHrSu5mEqOYFQLE8RFMt9QLsgsBD/XaqeFOxBhSdE2+VsHYFI3/+VDvrL5Af8vEjCz6xeljD2hTfAPGDPhj8pXbg8njML35jODJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4bWH7BEnA7/Qh53TjuEeEtCdBaRzsaQuJGT4uEU4xA=;
 b=M5WwwB9c5JNgF1ErqMhk+Nt9iQORS5RYQ+INtiUFoa9p8owQRvWT13aRTbcylmAN3WlV87racgmQJ9uH48NTjIguTmaZxDXXizsQME2Y1EUfOWN8TPjUCmk8bTNoiO5N00I95tyH+CucbcCdGQbzE7CNiJp+5lXco0hQ3SUB1/s=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by CH0PR11MB5505.namprd11.prod.outlook.com (2603:10b6:610:d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 05:07:19 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%5]) with mapi id 15.20.6477.037; Wed, 21 Jun 2023
 05:07:19 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        "adrian.freihofer@gmail.com"
	<adrian.freihofer@gmail.com>
CC: Peter Marko <peter.marko@siemens.com>,
        Andrej Valek
	<andrej.valek@siemens.com>
Subject: RE: [OE-core][PATCH v6 1/2] RFC: cve-check: add option to add
 additional patched CVEs
Thread-Topic: [OE-core][PATCH v6 1/2] RFC: cve-check: add option to add
 additional patched CVEs
Thread-Index: AQHZo4HQtoybxQMwZ0uWXBCELFS4sa+UBiIw
Date: Wed, 21 Jun 2023 05:07:17 +0000
Deferred-Delivery: Tue, 20 Jun 2023 19:08:50 +0000
Message-ID: 
 <SJ0PR11MB671700F100D6C2720EF36474DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
 <20230620141557.54562-2-andrej.valek@siemens.com>
In-Reply-To: <20230620141557.54562-2-andrej.valek@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|CH0PR11MB5505:EE_
x-ms-office365-filtering-correlation-id: 8ad77981-6ae2-4b95-614b-08db721563c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 x51peXLDRgWX3lTim0/g6N1Jyi/SWHkSudTM0zvLp5KKjSEyWKwJ94KJv9jURrGXkeDIjaxqdIC085hBRtlxIILv/Q5YzhMJ8x06BohGZns/q+wcvbQU0uNqL6nPlKzkpIDzFbs56vQAijTsQuvhzJHa/WEMlZs+Wb4oX0kkd/o1IAXbiNK7N9Jl0hp62o74c0hlvtZbmX5nXrjYD1c9UX3uJMopvu2VBqBMstyzOnPnYjxySWYZpecdjqtYscSbO1dOcwdzmVOJ0PsQENhApt25sk2OjhgIBTGe/iyEN7i+zORSMY3avmc/UZCAES8wV/Eq632e9Wuw+bZChgimxq3VvCLnFgeam30s5AXikVX7PSEpInltXZQvcAy/rW0EYGw+brXt2WBkXYW1Q/6vjCAUqLH90fQQioTYohCJC9avdw/XswMSHVd+VE9qTJmrTfVX07dFUu2bstINGfQgd3lMtDkHJXy2Qpgsb6q3kdpDKVrl2Ucj9aVqk9s2klul5qoeuBEU2frhyr3v6VlZzlnxa36zsCQhpsjF9527VNsMGOhe32c3zMrMFFeEUI5Fw87ViZz7hHG2kShlBAUxvWRgd3q19yvDDB9uwK7WYIU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199021)(478600001)(71200400001)(4326008)(76116006)(54906003)(110136005)(7696005)(55236004)(53546011)(6506007)(186003)(9686003)(26005)(966005)(2906002)(8676002)(8936002)(41300700001)(66476007)(66556008)(64756008)(66446008)(316002)(66946007)(5660300002)(52536014)(38100700002)(122000001)(86362001)(33656002)(38070700005)(83380400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MZz2cE9fVnZUMdro+IUDFeZ9+FvjFGsHEfYfBEFf7nI4W4KImawFjcI5BgAl?=
 =?us-ascii?Q?ZTSknsPAAZlCkQgCDrPb9QtOETB6gxpluSF/XmLVX105GqhQ4exKQPHKBpfs?=
 =?us-ascii?Q?Akkt2mnZEzi3ICmej+op1WEpYoEVHcc6iAtKt1g5Oxnw8OErWpcWn7RaJnH6?=
 =?us-ascii?Q?VfCe9iGrEAxaJznzY88wGU60c0DrDAFSDTWMrgeFNDONoCN4rhW7qoQ1irH2?=
 =?us-ascii?Q?rfl4BdaMLccUlGBFh4rrRI1wj89LSxf5lWvCNpDAUgalJel2x36sohHkCyFi?=
 =?us-ascii?Q?Stb6Ad/LhEYXa0cfohiwkC4pgAQjkoMXoB0Q1WoMuFRJkEhYl9MWy2UB60lV?=
 =?us-ascii?Q?c8oeami7Yy99wpgfO5JN7AYwSbQNLluFmximyKBZZsoehFZZ/7NO1aK9lX71?=
 =?us-ascii?Q?QyTh2q5K3fq5Jzyr3MSGfkWP5liqYAbjmvUpy/duCpmUAk+j2skMPTxBNiwG?=
 =?us-ascii?Q?aw+TRiEyrUJASU/8NEwKJ90HBiRrQcBxW6gXRuxs5ScDavoA1jpe76fZD37D?=
 =?us-ascii?Q?67/XZEmT3XgZaLD5S3TEVEL+LExqFk24Dauwp0lDLdSoK16RW3SwnnQy90uX?=
 =?us-ascii?Q?jYOftSYN5a9iav/J5nWxYYxtVZgdUQ28e9HzteyZOTTgwe2629mHqHc+Ylo9?=
 =?us-ascii?Q?kfwhOliIAaeMcbl3b9I/Fzp8bPtsn1e6hlSzi2OM9j/5hymDhIvPuEIUyV+K?=
 =?us-ascii?Q?TaCvDV8eInM2qnCzXbyZNo0z0Uyp2tfSYAKeR5LMpnDYYvHyIiKZp9OCkxVn?=
 =?us-ascii?Q?13xBFiTVfB2LQVpOtajiNWWiDUdv5ZebhvmDbsW8D6ICPRpOdIVfgvVxSlhA?=
 =?us-ascii?Q?ihPF3WMbtKTPlFyFV+iLlhUVtxxklNlAjr+V8kCzmMj00hd7nfW+vFGq9rws?=
 =?us-ascii?Q?DGCbNhssRUCJ4bd7GCrC917X6JlZAco3Ka7GGUYhkOMC0xRMD7wpQ3f3jTjC?=
 =?us-ascii?Q?+JATFWOP67vXYGyAhbPMnQvcBt3bjesl6IDQq8pdgLPU6uxbfpoKehVCJ62O?=
 =?us-ascii?Q?QTOVi5WJKCca+NgoKMULGyZcHNcyCWeeu7ghVZw5zP4LWIRKB+Rs45qNBkFZ?=
 =?us-ascii?Q?k11Zu4AkgAhhfIS+H86FbThABAz4q40uxcnXvxZPWoFrlBYAvfx1w4x9jEKx?=
 =?us-ascii?Q?5Wzy6elnmwLjm8O1o/bsG5pZT6fGLZ6JBOUKRaW7ez36/HZgdUFADNkj/pZp?=
 =?us-ascii?Q?QLazdiBrZ9Fh/Z12hCAHK90SmISkqmT9UxHNjJBM51Ho7NVnFx9+4os0/njr?=
 =?us-ascii?Q?BoPWAusr7qtg/lqRMsYHOklQaASf6mMVYYtSBtmqFTQntbMEss1IgJDhPlM+?=
 =?us-ascii?Q?ubjps4GDkeFx4ILh1Z0ykLfOYVKQk2UNdMDZeuLQxwDlaH8J5mPrONPRaKTL?=
 =?us-ascii?Q?NmOk4S31epifqJLtYnizJfiwlJP/SRZ+uN9O7AnDPyJCRgwlA3Ptv0cXS6Lv?=
 =?us-ascii?Q?YG2RTbIXv0eiEZytbfvmCO36Gjb4Gapdvgt0mNWCzBtrs6PBP+LQias207ao?=
 =?us-ascii?Q?gON++bvnGxplaKQgn3cnm/MxB7jATQX81LeGCU1DcRizkYrhAym1cFPg5c/a?=
 =?us-ascii?Q?r831kWc+/SBjbkg+VCZnviV8+JvQhOHNHwGA42qU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad77981-6ae2-4b95-614b-08db721563c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 05:07:19.6720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3LJqi//8UP53IHo8yLlep7BSr2SrQwgYsot0yL+26NHi2rePtumo79q3seCo/Td+rhqDpE0ZoafxQ9a+uuDYgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5505
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: alln-core-3.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 05:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183167

Dear Richard and Adrian,

I appreciate efforts of Andrej and Peter, you guys have done a great job fo=
r improvement in CVE specific security area.

As I mentioned information and importance of VEX status for future use case=
:=20
https://patchwork.yoctoproject.org/project/oe-core/patch/20230519081850.825=
86-1-andrej.valek@siemens.com/#10797

I can see community members are also in favour of VEX:
https://patchwork.yoctoproject.org/project/oe-core/patch/20230519062420.370=
15-1-andrej.valek@siemens.com/#11120

We can start looking in that direction, because to adopt initial VEX templa=
te we just required minor modifications with development of Andrej.

In current implementation we have main three categories of status: "Patched=
", "Ignored" and "Unpatched".
On top of which we want to add comment information which can be added in JS=
ON format to process further.

VEX have main 4 category: Fixed, Not Affected, Affected and Under Investiga=
tion.
Richard has rightly mentioned that we don't require affected status as thos=
e CVEs would fix in near future once fix is available in source of specific=
 package.

We can map our existing status as below with VEX status.

Existing Status 	| VEX adoption
-------------------------------------------
Patched	 	| Fixed	 =09
Ignore	 	| Not Affected
Not required 	| Not Affected
Unpatched	| Under Investigation

Fixed and Under Investigation don't require any sub-status as their status =
is sufficient to explain their case.
To get more information on possible sub-status of not affected status, we c=
an follow one of below reference document.
https://www.cisa.gov/sites/default/files/publications/VEX_Status_Justificat=
ion_Jun22.pdf : 2.0 Status Justifications Overview
This document covers all the possible cases which are already discuss or ma=
y come in future development.

Thank you, Richard, for considering my request.
I would appreciate comment from you and community people for the adoption o=
f VEX.

Thanks,
Sanjay Chitroda

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Andrej Valek via lists.openembedded.org
Sent: Tuesday, June 20, 2023 7:46 PM
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>; Peter Marko <peter.marko@sieme=
ns.com>
Subject: [OE-core][PATCH v6 1/2] RFC: cve-check: add option to add addition=
al patched CVEs

- Replace CVE_CHECK_IGNORE with CVE_STATUS to be more flexible.
The CVE_STATUS should contain an information about status wich is decoded i=
n 3 items:
- generic status: "Ignored", "Patched" or "Unpatched"
- more detailed status enum
- description: free text describing reason for status

Examples of usage:
CVE_STATUS[CVE-1234-0001] =3D "not-applicable-platform: Issue only applies =
on Windows"
CVE_STATUS[CVE-1234-0002] =3D "fixed-version: Fixed externally"

CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
CVE_CHECK_STATUSMAP[fixed-version] =3D "Patched"

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---


