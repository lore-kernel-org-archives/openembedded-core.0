Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE94C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 19:30:48 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web10.5103.1710358239315326116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 12:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=FJzWg6GK;
 dkim=pass header.i=@cisco.com header.s=selector1 header.b=JEDHjmrF;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2804; q=dns/txt; s=iport;
  t=1710358239; x=1711567839;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2YlMqKeaxCAo3BWy7seHj2Zpwk6drWaDp+mvG3Wi2A0=;
  b=FJzWg6GK0ThhUjHHrYhDAYBJQJz9QLPK83kFvSocQrovbhyUjD97EzBF
   4k/aroMdSWHONPFnKN8hkKog/3qtGMaultpsAwnM6N2pzWUNa5AE4MCMx
   WxZc5zwNcz5/gEGAFbjeOYMRXFDu1bJbIngL+I1DQqxCMmQsKYcHAuABa
   4=;
X-CSE-ConnectionGUID: 94qC5A7pSoWmg42PuvdN9Q==
X-CSE-MsgGUID: zgpylg6+RRy2+cmfdRNE2g==
X-IPAS-Result: =?us-ascii?q?A0AYAAAw/fFlmJldJa1aHQEBAQEJARIBBQUBQCWBFggBC?=
 =?us-ascii?q?wGBZlJ6gQcSGi6IIAOETl+IawOeB4ElA1YPAQEBDQEBLhYEAQGFBgKIAQImN?=
 =?us-ascii?q?AkOAQICAgEBAQEDAgMBAQEBAQEBAQYBAQUBAQECAQcFFAEBAQEBAQEBHhkFE?=
 =?us-ascii?q?A4nhWwNhk4BAQEBAwERKAYBATcBCwQCAQgRBAEBHxAnCh0IAgQBDQUIGoJeg?=
 =?us-ascii?q?mADAapCAYFAAoooeIE0gQGCCgEBBgQFsngJGIEwAYglAYUqhQcnG0CBTYFXe?=
 =?us-ascii?q?YFvPoJhAoFihBKCL4IXgxIpiHSBJo47hRRUfxwDgQUEWg0FFhAeNxEQEw0DC?=
 =?us-ascii?q?G4dAjE6AwUDBDIKEgwLHwUSQgNDBkkLAwIaBQMDBIEuBQ0aAhAaBgwmAwMSS?=
 =?us-ascii?q?QIQFAM4AwMGAwoxMFVBDFADZB8yCTwPDBoCGxQNJCMCLD4DCQoQAhYDHRYEM?=
 =?us-ascii?q?BEJCyYDKgY2AhIMBgYGXSAWCQQlAwgEA1IDIHIRAwQaBAsHeIICgT0EE0cQg?=
 =?us-ascii?q?TQGihwMgzYqgU4pgREYJANEHUADC209NQYOGwUEHwGBGQWkPQGBDYEGPgPHB?=
 =?us-ascii?q?woog2qZNYgoF6oumF8gqDMCBAIEBQIOAQEGgWQ6gVtwFTuCZ1IZD44gGYNhj?=
 =?us-ascii?q?3l4OwIHCwEBAwmKaAEB?=
IronPort-PHdr: A9a23:RhwAzRBTdKLkFBfRsSonUyQVpBdPi9zP1kY98JErjfdJaqu8usmkN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+iLzKlBbTf73fEaauXiu9XgXExT7OxByI7H5HIfdiMit3si5+obYZENDgz/uKb93J
 Q+9+B3YrdJewZM3MKszxxDV6ndJYLFQwmVlZBqfyh39/cy3upVk9kxt
IronPort-Data: A9a23:pFXde6CvA+EyiRVW/z/jw5YqxClBgxIJ4kV8jS/XYbTApDom0WZSz
 2QZXWHXPPzYYWbzfIslOovl9RlSsZKBndc2OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4SGdIZsCCaE+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357hXGthh
 fuo+5eDYAT8gGYvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxMUlaENQ4ZW7
 86apF2I1juxEyUFU7tJoZ6nGqE+eYM+CCDV4pZgtwdOtTAZzsA6+v5T2PPx8i67gR3R9zx64
 I0lWZBd1W7FM4WU8NnxXSW0HAkvYbRtpZaYOUO4jsmckxf+bmXg5aRXWRRe0Y0woo6bAElU/
 vAebTsKdB3G3aS9wamwTa9ngcFLwMvDZdxE/Co/i2CCS697GvgvQI2SjTNc9Ds2j89JEezXT
 8EYcjFoKh/HZnWjP39NUsJkwr703imXnztwul2NtK44vSvp9h0rk7PoPtbvXPHQSpAA9qqfj
 jmbpzuiWE5y2Mak4T2d/3Shg+XCkS/2VMcZE6e13vprm0GIgGsLBRsbUFG2rfW0hgi5Qd03F
 qAP0jAloa53/0uxQ5ynGRa5u3WD+BUbXrK8DtHW9inclrP/vi/GHlMDcTtONIYeqdE6Y20Tg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EYPkTXFeJefiy4e5yLzfni7yosBf/LlZZ+AZ9Bnqy
 DyM6SM5nbhW14gA1r6w+hbMhDfESnn1ouwduFi/soGNt18RiGuZi2qAsgWzARFod9jxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsZ4r2/wpyDzJ98JvVmSwXuF1O5ZKFcFh
 2eO6WtsCGN7YhNGkIcuOt3hVZ52pUQePYS8DJg4keaikrAqKVfYp3sxDaJh92vsi0Mr2bouI
 ouWdN3kDHART8xaIMmeGY8gPUsQ7nlmnwv7HMmjpzz+iOr2TCDOE98tbgDRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dglQdyhhX8qu+qS6tIere2JbJY3oMNeIqZsJcI1+lKMTneDNl
 kxRkGcCoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:zAnCHanQeEk/dtUajFXJXP9jBTPpDfNXiWdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtjwfZq9z/JICYl4B8baYOCUghrZEGgE1/qi/9SAIVyxygc579
 YDT0EQMqyMMbEXt7ec3OD8Kadf/DDlytHpuQ699QYQcegCUcgJhGkJb3f+LqQ1fng4OXNTLu
 vl2iMznUvbRZ1hVLXBOpBqZZmkmzTjruOVXTc2QzQcxE2lizSu5LTmEx6e8Cs/flp0q4sKwC
 zuqSC8wr+snc2a53bnulM76a44pPLRjv94QOCcgMkcLTvhziyyYp56ZrGEtDcp5Mmy9VcDir
 D30lUdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRQg9F9FKietiA17kAgsbzZVBOZ
 BwriSkXqlsfEr9dePGloD1viRR5w2JSLwZ4LUuZjJkINEjgfRq3P8iFQtuYeI99WTBmcMa+C
 0ENrCB2B6QGmnqMkzxry1hxsehUW80GQrDSk8eutaN2zwTh3xhyVAErfZv00vo2ahNAKWs3d
 60eJhAhfVLVIsbfKh9DOAOTY++DXHMWwvFNCaXLU78HK8KNnrRo9qviY9Fq92CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlO/grWSGuwUDzxwoVV5oR/uLf7WL33WBfzBGwGgo+lubESE8fbU/
 G8NNZfBOLiN3LnHcJT0wj3S/BpWDEjuQ0uy58Gsn6107T2w9fRx5jmmd7oVc3QLQo=
X-Talos-CUID: 9a23:D2uLpGM4d/RTU+5DCXV+3xM9RdgedULYwyuKG1KmBUA4cejA
X-Talos-MUID: 9a23:NZijQwYnihtfH+BTpTD0lTVtaoRS2bX0S0sIn5k8neTeOnkl
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by alln-iport-6.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 19:30:38 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 42DJUcji002572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 19:30:38 GMT
X-CSE-ConnectionGUID: Z8uALaLZTY+5GDCqzQYQMQ==
X-CSE-MsgGUID: YFQnbsznQDGGu9Nj02yjhA==
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=dnagodra@cisco.com; dmarc=pass (p=reject dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.07,123,1708387200"; 
   d="scan'208";a="5880677"
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 19:30:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkAb19y8Sgqwlc3KWVwsPk+0VzmuZSUNOId28N0BDdXZ27pA7UPJCSIzSc0BgldFMvWhg4kZI6C4CGRjdE3NcwJT3BVbV/WahDjnJOGKCzyAitZJQEsvecKEoq81r3JeBULnDFf+AvtyUHbirwYWgK9eCGFu9sOqON1hUNDmz15wYZOlJylvpp224G7evtXfWoMA4BgRcwflyCTydxpuwRtHYn5fRjs6KgNKmv+OOCfM2NrFF2jw8W/1q5zTPtWyxxfF6sd9vu0YJFja/wgXWGLVMJ1hF2kD5eDI1w6YRU9J8uinx/enMNKz/l2fPSCsQLcDLMebtTzb1XAb/IVaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YlMqKeaxCAo3BWy7seHj2Zpwk6drWaDp+mvG3Wi2A0=;
 b=aNDpECOceNq2GezqoBAoo1zolJ2cdlBbwjH7Umjo52maZ2e0T7XAWynUAdM0pDnnhlk2SjsKjfsyLiU7/LvwWa2nx2FQ3uEMFlARTQ1Dz1NJKEc1IPaZCrCm1GygzHhS4uahdkVLjs8sNmLKEpDdbraQ1e2PkTmBN69b7Ym7tt/GkP+62TMLqSgM0uv6lkV5JjM6/S383il7jBPEJi/2YzkWx85YXYMAbzuS/R0KliwNLawZyFCstlkEYRLg6gN0bZcnniGLfc2AC/5X0LiHOy3t7ysFi9hrIRCHIDxG+hAJnzSDgzfUcYuk4+JZDDN4+akNsOm4oiEzQqaOwUC7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YlMqKeaxCAo3BWy7seHj2Zpwk6drWaDp+mvG3Wi2A0=;
 b=JEDHjmrFusWU+WK1pSdEC9f3SefLHuajB/5NTIWX0xbJH1lWxxpLR1iyzI1fpLx4Bm08STfHGTX4Qbg743xgNM42DNnwbp/XwSmVGTYGIZ8Vttq2lWHUR/hJ+Et47+ysY6HupCVJcbjsdeBwGcKlON7pdji8D91Dwewt0u2xQjU=
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by SJ2PR11MB8322.namprd11.prod.outlook.com (2603:10b6:a03:549::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Wed, 13 Mar
 2024 19:30:34 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::c36a:5d77:e28:e55f]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::c36a:5d77:e28:e55f%6]) with mapi id 15.20.7386.015; Wed, 13 Mar 2024
 19:30:33 +0000
From: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)"
	<dnagodra@cisco.com>
To: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)"
	<dnagodra@cisco.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: RE: [master] [PATCH] cve-check: Add provision to exclude classes
Thread-Topic: [master] [PATCH] cve-check: Add provision to exclude classes
Thread-Index: AQHabZO0sRLY//WB40GqcBqkcmJhH7E2Bwwg
Date: Wed, 13 Mar 2024 19:30:33 +0000
Message-ID: 
 <SN7PR11MB697144F7C3F96C62F92E1C42D42A2@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <20240303175323.2526814-1-dnagodra@cisco.com>
In-Reply-To: <20240303175323.2526814-1-dnagodra@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6971:EE_|SJ2PR11MB8322:EE_
x-ms-office365-filtering-correlation-id: 525a4c61-62b0-4fbe-732c-08dc43940d31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Xx8T5TPvRPnQ/sd5C0O8tW97+4Pt6uRtyIRb30Lzt51MGuWM0k0ElRuROSbIYYh7CQpulnNI9Nj9XkknfXd+JN6lm1fmrgNVuZZW1B3DvdbNgatVokhd8vnfKBDCs/RsOiQvRT/ddhhVajJgwa5kahToRXzPFdR3tQ20ZPMCw4kTD4zV8cecmh6Q6wSJGG2rfy1qU80lN/MFnEZAFhNC1ln+qSqGxpRlknGKqOFLxTgcbkp0EEKHKKEsF3Ezz0PzO0pAKAOiJ8SWQWCO23EY4ZZZhAFmgy6xbRTCLornLCFPyE0OQPMTZiVdcFJ+v8eQjWrENO/CLrdpdExi3JBXp8hy2dSoInDuYHjNEO4uka5OeRoFsW9KJa0ZuzqWM31Fzk4FaUl1ogrELXUHeTorHcpq1MW40jRkHMQ+SpB8Ns14JqzEkDc0SWGal4Z3UlDyJpv57lI6gM3E2So7oYLbDfg4GUyjnw/AKXClpp2qKSMcllyR160+iiyqCHJFpfK2jLtuLAXB/B8G5hqpBU0hiKqCRBlXrle/x0EtKzkk48OtMlSbpljrJgc/F8oF39TlMSexIDlKlP43aKHGYXjwo0B184iutNF9oIK6ED/Kk+DXFN4uR6mgIPxaeNhECzVtaKZy3MxdRhp7WJb8FP1z+ok1zhP5TlQmm/4RQNxJo6Lb6x0oUqLK4FHQCE+xx8rlgQYKl9STG7FnBzWJnxG5FwUrFbH7F+0qnDU4wqbQoC4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qj+2arRkH52qHWSJG+lHj/UOQv/SuucZ78L/owXbbcl+f9XU/RE6rxZPo25o?=
 =?us-ascii?Q?TgxPYqlWssqk8ocu1UROX+YvpPaifCYw/a9nthx4xyg4ECApWuUK4vBmi981?=
 =?us-ascii?Q?o/5Rjtsu1bkdTUc1PgaI0uEg86FVYeclxBecx6Q/mSUZzC0rD4/qTGtytmJC?=
 =?us-ascii?Q?aX5lWkNV0/geUQoqZoKVz1IOgBzaVXB+O9mxataegZa14bcYoXdtypElhY/y?=
 =?us-ascii?Q?4JRnFPs7j1+RUxgPFAK23adK5veefvOnLVSOElQ7RrYO6tDvJNM++9viVLFM?=
 =?us-ascii?Q?RYq5bFB9oJ6Ha7hJiJEhZu4v4rx5HpRfjaDqEQjfUOUrgKXEj1XYQ8RHA8Ea?=
 =?us-ascii?Q?rhRtd055T0pFH1A3TpgxLSPHTlE2qK+DpIEGh0sKRQAR+MDaUfXQTGiXBtCB?=
 =?us-ascii?Q?2H7Ux2E1UxTPMb2dZHELwkV4IrL7Y1hDvFsA1yDVbIMpS5th2jGEtsZVPy0g?=
 =?us-ascii?Q?tGTCTH2SJa9PeI4i22nRDGlVhDjlIJGNu/aF3lHsSdcMHUzO7npYcgHAfE+w?=
 =?us-ascii?Q?2RGho4i/UWMZ4iCfkMZLEvwnezOhHJvQX6IHu0Dt5Ykk5Bh3nMgtiR5BhJ18?=
 =?us-ascii?Q?HJI6uwmJrzkMBB+TPx9sJHydamEw11rs1G6CoOs0G6HTH4TFjXi82qQpl4tM?=
 =?us-ascii?Q?r97We/5USYNA/Fi/GDYT8tnutq+d79zJpMlpFJFQi72JYV7Chz+FVgqLR2KF?=
 =?us-ascii?Q?mkrp+LMfD3108CQMQ9bqFAeMUiO8Vdz5COAS9e/yIKBaD7Tw7aFIbC9XqE13?=
 =?us-ascii?Q?kz4YxdKtn9gX3lxAPTH42Y3nSsVgDWsRwqsLA+igSHvEABaUykTL6gmYZ+F4?=
 =?us-ascii?Q?5vNNEeiZIcwPFx+JtDLFhhbLX5Qib/tbCFuvrs39Js9kj8bRtIstUyL+kHME?=
 =?us-ascii?Q?P690juPkapKHyIBjVPifvh2rLQdoqPa5L+jyW60qdJQ3T4zQ6niGVzQg//Ve?=
 =?us-ascii?Q?Y/mpfPKc6dJLPwN+dk98AOhZ8vLXq78ZE9abS/kPa5nuqw9Azs8gcmR4qrZN?=
 =?us-ascii?Q?PudhO0HmMwpgSj93iuwJZtLInlolNNaxOQcKuUcwg4bdgLSl8j9Bgq6Kz3iX?=
 =?us-ascii?Q?7dRti4y3wsmL6zHlsaD2BC8aDUNvshAOof2dUDdmz/OLqou957l1EL9ebroK?=
 =?us-ascii?Q?nW+uSdCHoPkqM4pzBrxZGb1L7uUKp//zFmG8aPj9iE5pJm3YWmMHTheHrEab?=
 =?us-ascii?Q?QjhpQY5w+mKPA80oxkFwvpkcNemcvkfFeOaKPieZWy/I+drt99CfFPcP09X/?=
 =?us-ascii?Q?UkzFpssXwwNOT1rZq/wHW0qkk4F5/cA9qX71C8AVVIA/CQURBc4gT8W56eSt?=
 =?us-ascii?Q?msnqa92AwSVhE/P8WE82BTEJI7iN/VLR/SaJpKUCBv1qCiHOe9aU+xhg7ygj?=
 =?us-ascii?Q?wfDcok4TIy5IGzCSXS1yBpsA4pAOKUxOH4sWXgstXs/4cCAsFUNYFV2rqlJz?=
 =?us-ascii?Q?jeSUAJddOutJY+Kp2+NgTupBBLHKJE/fg3XQOBjAp5EiVsZILrW6C6ag6pFL?=
 =?us-ascii?Q?hKmTj6h3oqf0SiJqCSxDVfNv7muCL/fdJjQGljXjsivx9SPYFKd33eCKu/IM?=
 =?us-ascii?Q?/kFDg2eLv4prbVgmDmU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525a4c61-62b0-4fbe-732c-08dc43940d31
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 19:30:33.4848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ja91uziWE0dUMaUO1JJB3et2daDrG1MPnqHJ7TM3Jh4ezDt1m3E/EumAcGSq6iBfJTwfOtyNB5XSsvdRPZSqXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8322
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 19:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197078

A gentle reminder

>-----Original Message-----
>From: dnagodra@cisco.com <dnagodra@cisco.com>
>Sent: Sunday, March 3, 2024 11:23 PM
>To: openembedded-core@lists.openembedded.org
>Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>; Dhairya
>Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco) <dnagodra@cisco.com>
>Subject: [master] [PATCH] cve-check: Add provision to exclude classes
>
>From: Dhairya Nagodra <dnagodra@cisco.com>
>
>- There are times when exluding a package that inherits a particular
>  class/classes may be desired.
>- This provides the framework for that via the variable:
>  CVE_CHECK_CLASS_EXCLUDELIST
>
>Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
>---
> meta/classes/cve-check.bbclass | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>
>diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcla=
ss
>index 56ba8bceef..6d459642fe 100644
>--- a/meta/classes/cve-check.bbclass
>+++ b/meta/classes/cve-check.bbclass
>@@ -100,6 +100,8 @@ CVE_CHECK_LAYER_EXCLUDELIST ??=3D ""
> # Layers to be included
> CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
>
>+# Classes to be excluded
>+CVE_CHECK_CLASS_EXCLUDELIST ??=3D ""
>
> # set to "alphabetical" for version using single alphabetical character a=
s
>increment release  CVE_VERSION_SUFFIX ??=3D ""
>@@ -466,6 +468,7 @@ def cve_write_data_text(d, patched, unpatched,
>ignored, cve_data):
>
>     include_layers =3D d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
>     exclude_layers =3D d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
>+    exclude_classes =3D d.getVar("CVE_CHECK_CLASS_EXCLUDELIST").split()
>
>     report_all =3D d.getVar("CVE_CHECK_REPORT_PATCHED") =3D=3D "1"
>
>@@ -475,6 +478,10 @@ def cve_write_data_text(d, patched, unpatched,
>ignored, cve_data):
>     if include_layers and layer not in include_layers:
>         return
>
>+    for excluded in exclude_classes:
>+        if bb.data.inherits_class(excluded, d):
>+            return
>+
>     # Early exit, the text format does not report packages without CVEs
>     if not patched+unpatched+ignored:
>         return
>@@ -581,6 +588,7 @@ def cve_write_data_json(d, patched, unpatched,
>ignored, cve_data, cve_status):
>
>     include_layers =3D d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
>     exclude_layers =3D d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
>+    exclude_classes =3D d.getVar("CVE_CHECK_CLASS_EXCLUDELIST").split()
>
>     report_all =3D d.getVar("CVE_CHECK_REPORT_PATCHED") =3D=3D "1"
>
>@@ -590,6 +598,10 @@ def cve_write_data_json(d, patched, unpatched,
>ignored, cve_data, cve_status):
>     if include_layers and layer not in include_layers:
>         return
>
>+    for excluded in exclude_classes:
>+        if bb.data.inherits_class(excluded, d):
>+            return
>+
>     unpatched_cves =3D []
>
>     product_data =3D []
>--
>2.35.6


