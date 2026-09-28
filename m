Return-Path: <vchavda@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E284CA5FA1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 18:06:38 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64153.1790618788230663541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 11:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h6uslaeI;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: vchavda@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=39384; q=dns/txt;
  s=iport01; t=1790618788; x=1791828388;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=Kz4430q/e8rGmtbbKT54wv3DW4aq6gds/z524bNt8EY=;
  b=h6uslaeI37cLou4Lwa/T63LWC6y92/63t9rPCBw0FjwXLxPqL8BWnqtb
   u9grKLSbUrxUgrUvNnqueJ+JdGZfXhMmpny7Nyw1sqzYcPCNjqCtDPb2c
   puHTVRmvMCEtUYgQ6guASMpcRJbxcel4iFBl9u4daBtdMkM7cH/elGkJX
   5DBLjGMraXp4rKx+VEbDEXhjBEI8+lB9Hrcl+LjoxRv0U+hjj8oaZfjMp
   J0X1uNVVb+EZGzXSHoiwyz+NjUUjvsl0JFkcfyA1aci669wbjk31hEPvZ
   /jaIhQVjKGf019+OyMlDmfnIP7sNeYqYwSEHhCtJmVhlJsx0X63MRpjUg
   A==;
X-CSE-ConnectionGUID: 7Gtzk0S9SA68+ej3uwREkA==
X-CSE-MsgGUID: j1IL7viOQtmJy8dkvBTcAw==
X-IPAS-Result: =?us-ascii?q?A0ABAwCrq7pq/5AQJK1agS6BK4E9MVMWdYEREkmIIwOFK?=
 =?us-ascii?q?4h5A54agXgGDwEBAQ0CLgEVDQQBAYUFAo4JAiY0CQ4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQEBAQECARkxAS0QAgEIEQMBAiEBD?=
 =?us-ascii?q?ScKHQgCBAENBQiCe4IdVwMBAg4GuCACih14gTSBAYMpATEHBwJD3AIBCxQBg?=
 =?us-ascii?q?TiFQIMfASuBNYQAGAGDXYEfJxuBSUSBFUKCaT6BBYFcAQEBgTYrHh6DV4IwB?=
 =?us-ascii?q?IIiehIbgT8eMjNKGZFfUnIiAyYzLAFVExcLBwWBIxAzAyovLSNLBS0dcAwnE?=
 =?us-ascii?q?g8dFxEeWBsGBRIgKkFDXYFaPyMZNnqBCV6BKylgAQIOF0ZBggcCglSBI14CA?=
 =?us-ascii?q?UlDDgdFUwkWD0EDBxJHJiIIEgkBExowC4EhOEEJKBRtPTcGDxkDBIE1BY9EY?=
 =?us-ascii?q?R6CRRkHARUXYQEHDBggLgFJBSZBECmifaN3CoQejCKNPogyF6lYgRcLmH0jj?=
 =?us-ascii?q?WeVaIUmAgQCBAUCEAEBBoFoPIEoHwsHcBVIAYJZCUoZD44tARaDYIF/gxSCQ?=
 =?us-ascii?q?cRFeQIBCDIBAQcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:sh6leR/WL91Ub/9uWBDoyV9kXcBvk7zwOghQ7YIolPcTNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8EqaQ==
IronPort-Data: A9a23:hg4g468w31eBjMHjjmUzDrUD2X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2seUTzTaa3fM2ejKtx3bt+/o01TvpWAmNJqG1A+qyxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAsYzhEs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lpEpEK+b5MUFpnq
 6xbJTJWcw+5quGflefTpulE3qzPLeHiOIcZ/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cP3WjOX9PYH46tPmjhnDhfzRwo1OOrq1x6G/WpOB0+OiwaYqPI4TbHq25mG6a/
 0PioHr4JSgGMf6OmTaG7FiQjcbQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBORYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:IWvM2a0E4hGbuRG/j/9ixAqjBY9xeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6K690cm7LU819fZOkO8s1MSZLXjbUQqTXc5fBOTZskfd8kHFh4pgPO
 JbAtdD4b7LfBZHZKTBkXSF+r8bqbHtntHL9ILjJjVWPH1Xgspbnn5E43OgYzZLrX59dOIE/f
 Snl616jgvlU046Ku68AX4IVfXCodrkqLLKCCRtOzcXrCO1oXeN8rDVLzi0ty1ybxp/hZsy+2
 nMlAL0op6kr+y6zRHk0WrS5YR9mdfqyNdPbfb8y/T9LA+Cti+YIKBaH5GStjE8p++irHwwls
 PXnhsmN8Nvr1vMY2Ccu3LWqkrd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vet7zL
 lA0wuixthq5FL77WHADurzJlZXf3mP0DwfeCko/iViuL4lGftsREokjRto+dk7bXnHAcscYZ
 lT5YnnlYVrmBWhHjDkl1gq5sCwVXIuGRrDaE0DtsuJlwVyphlCvhElLAh1pAZdyHr7IKM0ut
 jsI+BmkqpDQdQRar84DOAdQdGvAmiIWh7UNnmOSG6XXp3vFki946If2o9Fr92CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlO/grWSGuwUDzxwoUGjqIJ9oHUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZTD+X4JWXjFI5V10n1WoVUK3MZTMoJ0+xLFm6ms4bOMMnnp+bbePHcKP7kFislQHr2Bj
 8ZUD36NKx7nwmWs7/D8W7ssl/WCzvCFMhLYd3n1vlWzJJILYFFuBUUj1Oij/v7WwGqmpZGCH
 dDHA==
X-Talos-CUID: 9a23:fhrE82NIFxgVFu5DBwZ75k1MIZEeWyONj3rSeFKnM0tqYejA
X-Talos-MUID: 9a23:QkDpUASyUFbsUAjARXTu3RBGa9lpxJ2yDWIcwZkFpeO4PgVvbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 18:06:27 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id EBB26180001D8
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 18:06:26 +0000 (GMT)
X-CSE-ConnectionGUID: 8VLtgQunQjmn+8THN2oEsg==
X-CSE-MsgGUID: FKBfCbMORSuJUfCpev8xvA==
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208,217";a="67220475"
Received: from mail-eastus2azon11011048.outbound.protection.outlook.com (HELO BN8PR05CU002.outbound.protection.outlook.com) ([52.101.57.48])
  by alln-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 18:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Be862dfWeMLz/ghGWNe9lRnoTUQeePH2N0ucXRECrvpkZ/SxTnkI8T380YVwLbMX+ommpq+bgbG5HfrZQKykHDoqRl76mtlpxOyUnr5WZstTCla6CQTjmCt7z1NjVFGiU2xoz35DwNxC0pwR6LpCNjh2aXiW+nUs1vSxz4sYqaElzdHDgCKy5pPAFjcmawc3eHfmyw6gNHDpkMXkPQle7q1QbZXNTAkdRtLlS2gKxNZ3FjH0EIUT4iQhzJ2C1emX0tjaOGcn2sleWTTEPspD+NAkisN/BlgcuYi1nLRuktvhlN8kq5QNRZ1QknF11CBlt0MEQbmM1a4CqaQUqEYaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz4430q/e8rGmtbbKT54wv3DW4aq6gds/z524bNt8EY=;
 b=NAKDrvYfa73tLJpvEJ7OqpamQUEV6oh0WHvXR70c8994Qbfvp+TR20SEYplXjC09X2lX+DTOqE49lxdHG2WPYog4CqnVUn7/yvjpN/zwWX58tn0DvIDNEQCDBWoPb9K5DJqeo0Ix3ELZClRhbmciDMN+txSMlp+g9HwWt6ftOHlX+YsYS7DCGT5ygxJMAti/RLyqtQ5ZdHAggAGpaaki+7OBJBkZbV2TIKe/BSVCMQfbVSwbS7P5CrUdFA3X4/6IrYqIy1HrjUzpzkZoiyFz7HONxP2RVGsCm4zr+xlYyiClNHCwlQatdCQARmiRXWyF0qMWqL344i60ZNULVpPzMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10)
 by SJ5PPFD56C4208E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::858) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 18:06:23 +0000
Received: from CY8PR11MB7036.namprd11.prod.outlook.com
 ([fe80::1f59:c732:6dcd:8c90]) by CY8PR11MB7036.namprd11.prod.outlook.com
 ([fe80::1f59:c732:6dcd:8c90%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 18:06:23 +0000
From: "Viral Chavda (vchavda)" <vchavda@cisco.com>
To: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH v2] apr-util: Fix CVE-2025-49506
Thread-Topic: [OE-core][scarthgap][PATCH v2] apr-util: Fix CVE-2025-49506
Thread-Index: AQHdTxZnW2/QvnHrh0KmyRw6B842FrbkSeNI
Date: Mon, 28 Sep 2026 18:06:23 +0000
Message-ID: 
 <CY8PR11MB70369075BF0281B7E2603305AF8D2@CY8PR11MB7036.namprd11.prod.outlook.com>
References: <20260928065538.1123598-1-hthakar@cisco.com>
In-Reply-To: <20260928065538.1123598-1-hthakar@cisco.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7036:EE_|SJ5PPFD56C4208E:EE_
x-ms-office365-filtering-correlation-id: 0a3ae9d6-5db4-43de-2e63-08df1d8b34c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|260925021911599003|260925021311599003|260925022911599003|10067099003|5023799004|11063799006|56012099006|6133799003|18002099003|22082099003|8096899003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 lj2C13TC4GdpQ/lAnXOEF49Vj2hBHG9X5E9acKj+3PW1wEKQP9Ta9p/uqwK77iGKjosce9JfjYyuf2I0wpYS4fOvFbbMaw3AZX5VttTEZA+Bn4xDZV4lL/d8zUe0rm/1Sx2DGdfTYtZgkMHmr1xHtNnHQFAnuqP8fiy/tB1Yigv3W9mZWNiLAjUs6VeQZASys20ZW5AFmO7S9+afJpBmGBQXJU6UNDr3ldqaAUEjU3hPaGWYvCfDfuYdFb74zVvSxl/GS4XJ/qCz0yVs+EiNDQNqKr2UVpINSwoKPdtJNLwTI10yfpz8Ea55FeQ01uBwptMil5M5eHk6gSpY1a7xqd4dGkRwSIy0IpZ//aBZzwIGjDVCMb+OBSlgi0Xtw39E3th/vRksKMWu+kOlsSWHKqOrNfAgvfFnEBOCX1Ujkjpmi6s5l0a7qpwzyWs598LGZz1myx0O/0ifEXwL3vnwr2BQOeXzkS0PXf5K5DlShEEK2ECIlhpOVRWoqH/Xl2JRU4cmefKmvmmiCUcdtGKoS5dRlFeAh4qh8BBURr3drjppcu8TmvPzA0m0jJAedI4GzrDIy7rAKiRGqj9jcV+nkId39un8+T/LHl5TW4wMTgebTGnjNazLchqAyvKoay0FaCrkmLoAVhTBeRp3bCthcFqmOUm0fzOdD4o13Nd+KOc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7036.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(5023799004)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(8096899003)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Tw5N+LOqtkbgkp3W6ROdbXb+cVFdIKpxnHN4LcwU0cdB+2Gri6Jcf6XtsI2/?=
 =?us-ascii?Q?gAUMyZfILp76OxYbbqSHXFc8rNLKHp5bN6TJBSQ8MUM3QEPfHjvjpljeIK99?=
 =?us-ascii?Q?rfxa8UFxZJpUFZp68l6ldP1mRgVpG3r/EZmlmJ2h0prQTScrWzz4hG6NN0++?=
 =?us-ascii?Q?sN4pXGIY/u6mm9EXNdFKqkoOlhX+GI9Zq4ufIPObE4qLzBBHOHIyrWX2fBXo?=
 =?us-ascii?Q?U+GF+Jj5+/YluWfSB5T2vi5fpK9mSTslfBcJhU9kevFHUdhdwWLCaIgPoSN1?=
 =?us-ascii?Q?tUIjHLospHTeXp5x2Ap5eondAhztl49y+FFUbDyhkcDhC37KJRzDU/LcMl9Z?=
 =?us-ascii?Q?06SXnJerYZvaP8bO8qkky8vIoLI8Mx2zwYI8FhqzW0ZaFnZGHoCGaHUDrwjS?=
 =?us-ascii?Q?bi5dKZ3rLwJbPfHwXuwvETYKlZoorVcegHfu0bRv9CfZ3sArwAQud1vjTcFa?=
 =?us-ascii?Q?O6QzWE/BqoMXOAwqx90qqCa86LeOyC6wWdLgJU+lVg7m7o35ntFhRC74s/2x?=
 =?us-ascii?Q?zq7kdQwMR+3DmnZuhxG60dNn2KNwBZJDkRgIHXqMPzgUrJVIBC4O0b72ZAHr?=
 =?us-ascii?Q?c+XoQkXezdqrlOAQlqssFPnYsFq2Netpg3wuM8yHuC869mMn3v+o4Nrlj/rK?=
 =?us-ascii?Q?OlqMptOOsqQ7loFBPKY0XapFu6TQtLHHhHBAuQYBYhhPryZ7y9pHzJ4z/RwL?=
 =?us-ascii?Q?jxAbdj4HGHWHm3KwyrFLYXaASYI0YFvk6qeqB5BWjWaaiYQrDZeOgtweUxVn?=
 =?us-ascii?Q?ax6HgzAGmYvKxjHbaRylYAfrYCuv1CvFMn/QJp4WiDkDqr9uDGv+2hkOo8XB?=
 =?us-ascii?Q?2lo5cwm93/XXXue+Mfj5YROEu88ok1dLgFvgZXD83GmxLgHTcLkQpuufDIu6?=
 =?us-ascii?Q?4AWSb5dG8CKRxNMDFk9FM3YWMUy2vZduI+D2fv7S1dksle8i/1I54cApW4OK?=
 =?us-ascii?Q?J4/aGoRMWFx16lu5W37CvxdvObV2hXjFyU9cQXNFqmoIQpUNSxqbvdUH1CtZ?=
 =?us-ascii?Q?fwqmbefkUWx2FwzDz0xJGr06jUxc5XHpAMBI/eM71FdhPF+d+h6+dLzZeemb?=
 =?us-ascii?Q?iAQ2m5ZqcMHk7AGAO7gZx8DikzDswX53le5g16/NIZVvlqHqhptqyr+AEpLs?=
 =?us-ascii?Q?T0hGWXFBhzW4chVAuGl3S5H7YDxipWXFHmyZYms/pAerrI9nYFSqf9hliB2V?=
 =?us-ascii?Q?9ZoWcZQ7IkZ/B6wlmZbtAAYO6WlacEcxYZS4tlUgu4eZxjCH0gkg5QFnFbFa?=
 =?us-ascii?Q?bLUWW6dkkajWZNjVCMGV7tqmfI+hynyjF6C/78QxMru5DqgY7iK45GNVvVM9?=
 =?us-ascii?Q?BcAQpQwQA/mRHD8xhj9LfbVhNhLQSKzBBat79R7kYJ6++yGapAdEC7OgLGuS?=
 =?us-ascii?Q?dmv7WkP+gho3U0FMYSqoi5GdWTUds6PbZrxtgCppo1vqPWcF8gkwSREDrBlp?=
 =?us-ascii?Q?7+fTJZA48YvQsUCneHWNelbaQIHPUMtwrAKqnAnZje+1nQyTzW7YB4Peu2Wd?=
 =?us-ascii?Q?YMaIy7+Gw6CMwLlMYH/8y2329KRoInbyP5ePjjSDBrZ4ps2hP34orpmdIoJ2?=
 =?us-ascii?Q?xYTlxN4CuaFJ5YORHrRH0+tbb9ayz2fqHJOSYg+6GfUiY36jAg4CI/J1xOyu?=
 =?us-ascii?Q?/h5jVUQhPNpNIGn/MPOTBDQ+31YqBFqkEyM9IY8XbsQd49unxre5sHHsFQxj?=
 =?us-ascii?Q?nUdjvwINce0MiKDsftOFQ/EdeB7NFvai0n+bflqBt8JMbvsgL2sIze8/ayTM?=
 =?us-ascii?Q?O/cTlPr/ZnY6JAJWGcaLqTlYDeFRczE=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CY8PR11MB70369075BF0281B7E2603305AF8D2CY8PR11MB7036namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Q7tOI+Vkfz2AHyEoHL3Rh2zlrtRJcK7xjSOCKRr7zhI+iJhDQnDVtjO7DWffkKcXoBDcHNOI7BC2k8/M7tdEDBPCd6qa4jzd+vj082XvPUriOWTIZHwKMfPTxpIYQHY0kqeW4fg3NupwY2R2gpTvEml35iCHN7KOOkXi38HJSeK3C+BvMmfA6iVh0UrbtxCBLxa4Ht6zZjw8AXjxr3y2LUWk/xlakuE3JXVMXowUJARJi9scf6EirKxq1tZGUmlgmuxBiqvW7vIo5LU2K8szLjKynvIU8gZjmyju/uXxeYKFg/lvsk1SQ3OWm5XmTZWNdT4RxAzdg43XoWW8zg35IA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7036.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3ae9d6-5db4-43de-2e63-08df1d8b34c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 18:06:23.2655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oyn9jiooPx1RqgQKjOrgX/PJAluCAil8ds6dEtR1vz5JFMvf5ZNQ+Yu50pR/ALFxqmNlsZhZHKx84V3WtlKueg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD56C4208E
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-5.cisco.com [173.37.147.253];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 18:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246782

--_000_CY8PR11MB70369075BF0281B7E2603305AF8D2CY8PR11MB7036namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The recipe still adds five unrelated CVE-2026-* patch references not suppli=
ed by this standalone v2. Keep only the CVE-2025-49506.patch entry, or rese=
nd the complete series.

Regards,
Viral

From: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hth=
akar@cisco.com>
Date: Monday, 28 September 2026 at 02:55
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: [OE-core][scarthgap][PATCH v2] apr-util: Fix CVE-2025-49506

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream timing-safe comparison fix [1].
APR-util 1.6.4 identifies this issue as fixed [2].

[1] https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5eafc=
534ae24b19e

[2] https://nvd.nist.gov/vuln/detail/CVE-2025-49506

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2:
- Drop the XLC-specific compatibility follow-up patch,
as it is not required by OE-Core's GCC/Clang toolchains.
---
 .../apr/apr-util/CVE-2025-49506.patch         | 310 ++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   6 +
 2 files changed, 316 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49506.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch b/meta/=
recipes-support/apr/apr-util/CVE-2025-49506.patch
new file mode 100644
index 0000000000..0ab5cf0648
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch
@@ -0,0 +1,310 @@
+From f77a20761cb15686f8d4de5b5eafc534ae24b19e Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Mon, 3 Aug 2026 12:10:13 +0000
+Subject: [PATCH] Merge r1936804 from aprutil 1.7.x:
+
+use timing safe comparison
+
+Submitted By: ylavic
+Reviewed By: ylavic, rpluem, covener
+
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1=
936805 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2025-49506
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/f77a2=
0761cb15686f8d4de5b5eafc534ae24b19e]
+
+(cherry picked from commit f77a20761cb15686f8d4de5b5eafc534ae24b19e)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ crypto/apr_crypto.c |  60 +++++++++++++++++---
+ crypto/apr_passwd.c | 135 ++++++++++++++++++++++++++++++++++++++++----
+ 2 files changed, 176 insertions(+), 19 deletions(-)
+
+diff --git a/crypto/apr_crypto.c b/crypto/apr_crypto.c
+index 9ba190ef..ca3f0887 100644
+--- a/crypto/apr_crypto.c
++++ b/crypto/apr_crypto.c
+@@ -21,6 +21,7 @@
+ #include "apu.h"
+ #include "apr_pools.h"
+ #include "apr_dso.h"
++#include "apr_version.h"
+ #include "apr_strings.h"
+ #include "apr_hash.h"
+ #include "apr_thread_mutex.h"
+@@ -173,19 +174,64 @@ APU_DECLARE(apr_status_t) apr_crypto_memzero(void *b=
uffer, apr_size_t size)
+     return APR_SUCCESS;
+ }
+
++/* Borrow this from APR-1.8 if not available */
++#if !APR_VERSION_AT_LEAST(1,8,0)
++
++/* A volatile variable which is always zero but allows to block the compi=
ler
++ * from optimizing or eliding code using it. Volatile forces the compiler=
 to
++ * emit a memory load for which no value can be assumed, so for instance =
an
++ * add/sub/xor/or with "optblocker" is a noop that will hide the result t=
o
++ * the optimizer.
++ */
++static volatile const apr_uint32_t optblocker;
++
++/* Return whether x is not zero, with no branching controlled by x.
++ *
++ * Taken from the cryptoint library (public domain) by D. J. Bernstein,
++ * which provides timing attacks safe integer operations/primitives.
++ * Code:
++ *   https://lib.mceliece.org/libmceliece-20250507/cryptoint/crypto_uint3=
2.h
++ * Paper:
++ *   https://cr.yp.to/papers/cryptoint-20250424.pdf
++ */
++#if __has_attribute(always_inline)
++__attribute__((always_inline))
++#endif
++static APR_INLINE int test_nonzero_timingsafe(apr_uint32_t x)
++{
++    x |=3D -x; /* sets the most significant bit unless x =3D=3D 0 */
++
++    /* shift bit 31 (MSB) to bit 0 */
++    x >>=3D 32-6;      /* keep 6 bits */
++    x +=3D optblocker; /* lose the optimizer */
++    x >>=3D 5;         /* keep the (original) MSB only */
++
++    /* x is now 0 or 1 */
++    return x & INT_MAX;
++}
++
++#endif /* !APR_VERSION_AT_LEAST(1,8,0) */
++
+ APU_DECLARE(int) apr_crypto_equals(const void *buf1, const void *buf2,
+                                    apr_size_t size)
+ {
+-    const unsigned char *p1 =3D buf1;
+-    const unsigned char *p2 =3D buf2;
+-    unsigned char diff =3D 0;
+-    apr_size_t i;
++#if APR_VERSION_AT_LEAST(1,8,0)
++    return apr_memeq_timingsafe(buf1, buf2, size);
++#else
++    apr_uint32_t diff =3D 0;
++    volatile apr_size_t count =3D size; /* prevent loop unrolling */
++    apr_size_t i =3D 0;
+
+-    for (i =3D 0; i < size; ++i) {
+-        diff |=3D p1[i] ^ p2[i];
++    for (; i < count; ++i) {
++        const unsigned char c1 =3D ((volatile const unsigned char *)buf1)=
[i];
++        const unsigned char c2 =3D ((volatile const unsigned char *)buf2)=
[i];
++
++        diff |=3D c1 ^ c2; /* sets diff to non-zero whenever c1 !=3D c2 *=
/
+     }
+
+-    return 1 & ((diff - 1) >> 8);
++    /* (diff =3D=3D 0) <=3D> (diff !=3D 0) ^ 1 */
++    return test_nonzero_timingsafe(diff) ^ 1;
++#endif
+ }
+
+ APU_DECLARE(apr_status_t) apr_crypto_get_driver(
+diff --git a/crypto/apr_passwd.c b/crypto/apr_passwd.c
+index c961de2b..74b5fc17 100644
+--- a/crypto/apr_passwd.c
++++ b/crypto/apr_passwd.c
+@@ -14,6 +14,7 @@
+  * limitations under the License.
+  */
+
++#include "apr_version.h"
+ #include "apr_strings.h"
+ #include "apr_md5.h"
+ #include "apr_lib.h"
+@@ -39,6 +40,111 @@
+
+ static const char * const apr1_id =3D "$apr1$";
+
++#if APR_VERSION_AT_LEAST(1,8,0)
++
++#define streq_timingsafe    apr_streq_timingsafe
++#define strneq_timingsafe   apr_strneq_timingsafe
++
++#else /* borrow code from APR-1.8 if not available */
++
++/* A volatile variable which is always zero but allows to block the compi=
ler
++ * from optimizing or eliding code using it. Volatile forces the compiler=
 to
++ * emit a memory load for which no value can be assumed, so for instance =
an
++ * add/sub/xor/or with "optblocker" is a noop that will hide the result t=
o
++ * the optimizer.
++ */
++static volatile const apr_uint32_t optblocker;
++
++/* Return whether x is not zero, with no branching controlled by x.
++ *
++ * Taken from the cryptoint library (public domain) by D. J. Bernstein,
++ * which provides timing attacks safe integer operations/primitives.
++ * Code:
++ *   https://lib.mceliece.org/libmceliece-20250507/cryptoint/crypto_uint3=
2.h
++ * Paper:
++ *   https://cr.yp.to/papers/cryptoint-20250424.pdf
++ */
++#if __has_attribute(always_inline)
++__attribute__((always_inline))
++#endif
++static APR_INLINE int test_nonzero_timingsafe(apr_uint32_t x)
++{
++    x |=3D -x; /* sets the most significant bit unless x =3D=3D 0 */
++
++    /* shift bit 31 (MSB) to bit 0 */
++    x >>=3D 32-6;      /* keep 6 bits */
++    x +=3D optblocker; /* lose the optimizer */
++    x >>=3D 5;         /* keep the (original) MSB only */
++
++    /* x is now 0 or 1 */
++    return x & INT_MAX;
++}
++
++static int streq_timingsafe(const char *sec1, const char *str2)
++{
++    apr_uint32_t diff =3D 0;
++    apr_size_t i1 =3D 0, i2 =3D 0;
++
++    for (;; ++i2) {
++        const unsigned char c1 =3D ((volatile const unsigned char *)sec1)=
[i1];
++        const unsigned char c2 =3D ((volatile const unsigned char *)str2)=
[i2];
++
++        diff |=3D c1 ^ c2; /* sets diff to non-zero whenever c1 !=3D c2 *=
/
++
++        /* Not a shortest/longest match because an attacker would usually=
 know
++         * one of the strings and could then determine the length of the =
other.
++         * So assume only sec1 and its length are secret and stop the loo=
p at
++         * the end of str2. If sec1 is shorter than str2 the loop will co=
ntinue
++         * by comparing the rest of str2 with the trailing NUL byte of se=
c1.
++         * In any case since the diff above is computed up to and includi=
ng a
++         * NUL byte, only the same content and length will raise match.
++         */
++        if (!c2) {
++            break;
++        }
++
++        /* Don't go above sec1's NUL byte */
++        i1 +=3D test_nonzero_timingsafe(c1);
++    }
++
++    /* (diff =3D=3D 0) <=3D> (diff !=3D 0) ^ 1 */
++    return test_nonzero_timingsafe(diff) ^ 1;
++}
++
++static int strneq_timingsafe(const char *sec1, const char *str2, apr_size=
_t n)
++{
++    apr_uint32_t diff =3D 0;
++    volatile apr_size_t count =3D n; /* prevent loop unrolling */
++    apr_size_t i1 =3D 0, i2 =3D 0;
++
++    for (; i2 < count; ++i2) {
++        const unsigned char c1 =3D ((volatile const unsigned char *)sec1)=
[i1];
++        const unsigned char c2 =3D ((volatile const unsigned char *)str2)=
[i2];
++
++        diff |=3D c1 ^ c2; /* sets diff to non-zero whenever c1 !=3D c2 *=
/
++
++        /* Not a shortest/longest match because an attacker would usually=
 know
++         * one of the strings and could then determine the length of the =
other.
++         * So assume only sec1 and its length are secret and stop the loo=
p at
++         * the end of str2. If sec1 is shorter than str2 the loop will co=
ntinue
++         * by comparing the rest of str2 with the trailing NUL byte of se=
c1.
++         * In any case since the diff above is computed up to and includi=
ng a
++         * NUL byte, only the same content and length will raise match.
++         */
++        if (!c2) {
++            break;
++        }
++
++        /* Don't go above sec1's NUL byte */
++        i1 +=3D test_nonzero_timingsafe(c1);
++    }
++
++    /* (diff =3D=3D 0) <=3D> (diff !=3D 0) ^ 1 */
++    return test_nonzero_timingsafe(diff) ^ 1;
++}
++
++#endif /* APR_VERSION_AT_LEAST(1,8,0) */
++
+ #if !defined(WIN32) && !defined(BEOS) && !defined(NETWARE)
+ #if defined(APU_CRYPT_THREADSAFE) || !APR_HAS_THREADS || \
+     defined(CRYPT_R_CRYPTD) || defined(CRYPT_R_STRUCT_CRYPT_DATA)
+@@ -86,28 +192,33 @@ APU_DECLARE(apr_status_t) apr_password_validate(const=
 char *passwd,
+ #if !CRYPT_MISSING
+     char *crypt_pw;
+ #endif
+-    if (hash[0] =3D=3D '$'
+-        && hash[1] =3D=3D '2'
+-        && (hash[2] =3D=3D 'a' || hash[2] =3D=3D 'y')
+-        && hash[3] =3D=3D '$') {
++
++    if ((strneq_timingsafe(hash, "$2a$", 4) | /* test both */
++         strneq_timingsafe(hash, "$2y$", 4))) {
++        /*
++         * The hash was created using [apr_]bcrypt encoding.
++         */
+         if (_crypt_blowfish_rn(passwd, hash, sample, sizeof(sample)) =3D=
=3D NULL)
+             return APR_FROM_OS_ERROR(errno);
+     }
+-    else if (!strncmp(hash, apr1_id, strlen(apr1_id))) {
++    else if (strneq_timingsafe(hash, apr1_id, strlen(apr1_id))) {
+         /*
+          * The hash was created using our custom algorithm.
+          */
+         apr_md5_encode(passwd, hash, sample, sizeof(sample));
+     }
+-    else if (!strncmp(hash, APR_SHA1PW_ID, APR_SHA1PW_IDLEN)) {
+-         apr_sha1_base64(passwd, (int)strlen(passwd), sample);
++    else if (strneq_timingsafe(hash, APR_SHA1PW_ID, APR_SHA1PW_IDLEN)) {
++        /*
++         * The hash is a (naked) SHA1.
++         */
++        apr_sha1_base64(passwd, (int)strlen(passwd), sample);
+     }
+     else {
+         /*
+          * It's not our algorithm, so feed it to crypt() if possible.
+          */
+ #if CRYPT_MISSING
+-        return (strcmp(passwd, hash) =3D=3D 0) ? APR_SUCCESS : APR_EMISMA=
TCH;
++        return streq_timingsafe(hash, passwd) ? APR_SUCCESS : APR_EMISMAT=
CH;
+ #elif defined(CRYPT_R_CRYPTD)
+         apr_status_t rv;
+         CRYPTD *buffer =3D malloc(sizeof(*buffer));
+@@ -118,7 +229,7 @@ APU_DECLARE(apr_status_t) apr_password_validate(const =
char *passwd,
+         if (!crypt_pw)
+             rv =3D APR_EMISMATCH;
+         else
+-            rv =3D (strcmp(crypt_pw, hash) =3D=3D 0) ? APR_SUCCESS : APR_=
EMISMATCH;
++            rv =3D streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR_E=
MISMATCH;
+         free(buffer);
+         return rv;
+ #elif defined(CRYPT_R_STRUCT_CRYPT_DATA)
+@@ -149,7 +260,7 @@ APU_DECLARE(apr_status_t) apr_password_validate(const =
char *passwd,
+         if (!crypt_pw)
+             rv =3D APR_EMISMATCH;
+         else
+-            rv =3D (strcmp(crypt_pw, hash) =3D=3D 0) ? APR_SUCCESS : APR_=
EMISMATCH;
++            rv =3D streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR_E=
MISMATCH;
+         free(buffer);
+         return rv;
+ #else
+@@ -173,14 +284,14 @@ APU_DECLARE(apr_status_t) apr_password_validate(cons=
t char *passwd,
+                 rv =3D APR_EMISMATCH;
+             }
+             else {
+-                rv =3D (strcmp(crypt_pw, hash) =3D=3D 0) ? APR_SUCCESS : =
APR_EMISMATCH;
++                rv =3D streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : A=
PR_EMISMATCH;
+             }
+             crypt_mutex_unlock();
+             return rv;
+         }
+ #endif
+     }
+-    return (strcmp(sample, hash) =3D=3D 0) ? APR_SUCCESS : APR_EMISMATCH;
++    return streq_timingsafe(hash, sample) ? APR_SUCCESS : APR_EMISMATCH;
+ }
+
+ static const char * const bcrypt_id =3D "$2y$";
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-supp=
ort/apr/apr-util_1.6.3.bb
index 3a5f52d250..19f8e59ca5 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -13,6 +13,12 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch \
            file://0001-test_transformation-Check-if-transform-is-supported=
-.patch \
+           file://CVE-2025-49506.patch \
+           file://CVE-2026-32327-dependent.patch \
+           file://CVE-2026-32327.patch \
+           file://CVE-2026-34501.patch \
+           file://CVE-2026-34502_p1.patch \
+           file://CVE-2026-34502_p2.patch \
            file://run-ptest \
            "

--
2.35.6


--_000_CY8PR11MB70369075BF0281B7E2603305AF8D2CY8PR11MB7036namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"direction: ltr; text-align: left; text-indent: 0px; text-transf=
orm: none;">
<span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">The recipe still adds five unrelated&nbsp;<cod=
e>CVE-2026-*</code>&nbsp;patch references not supplied by this standalone v=
2. Keep only the&nbsp;<code>CVE-2025-49506.patch</code>&nbsp;entry,
 or resend the complete series.</span></p>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
Viral</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"mail-editor-reference-message-container">
<div style=3D"padding: 3pt 0in 0in; border-width: 1pt medium medium; border=
-style: solid none none; border-color: rgb(181, 196, 223) currentcolor curr=
entcolor;">
<div style=3D"text-align: left; font-family: Aptos; font-size: 12pt; color:=
 black;">
<b>From: </b>Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) &lt;hthakar@cisco.com&gt;<br>
<b>Date: </b>Monday, 28 September 2026 at 02:55<br>
<b>To: </b>openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc: </b>xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject: </b>[OE-core][scarthgap][PATCH v2] apr-util: Fix CVE-2025-49506=
<br>
<br>
</div>
</div>
<div id=3D"mail-editor-reference-message-body">
<div class=3D"ms-outlook-mobile-reference-message skipProofing">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">From: Hetvi Thakar &lt;=
hthakar@cisco.com&gt;<br>
<br>
Backport the upstream timing-safe comparison fix [1].<br>
APR-util 1.6.4 identifies this issue as fixed [2].<br>
<br>
[1] <a href=3D"https://github.com/apache/apr-util/commit/f77a20761cb15686f8=
d4de5b5eafc534ae24b19e" data-outlook-id=3D"31f22c39-c679-4801-99eb-eb55f0f0=
2c7a">
https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5eafc534a=
e24b19e</a><br>
<br>
[2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2025-49506" data-outloo=
k-id=3D"b4ce18ee-4ba7-403e-b090-c5b0d51714cf">
https://nvd.nist.gov/vuln/detail/CVE-2025-49506</a><br>
<br>
Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
---<br>
Changes in v2:<br>
- Drop the XLC-specific compatibility follow-up patch,<br>
as it is not required by OE-Core's GCC/Clang toolchains.<br>
---<br>
&nbsp;.../apr/apr-util/CVE-2025-49506.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 310 ++++++++++++++++++<br>
&nbsp;meta/recipes-support/apr/apr-util_1.6.3.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 6 +<br>
&nbsp;2 files changed, 316 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49506.p=
atch<br>
<br>
diff --git a/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch b/meta/=
recipes-support/apr/apr-util/CVE-2025-49506.patch<br>
new file mode 100644<br>
index 0000000000..0ab5cf0648<br>
--- /dev/null<br>
+++ b/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch<br>
@@ -0,0 +1,310 @@<br>
+From f77a20761cb15686f8d4de5b5eafc534ae24b19e Mon Sep 17 00:00:00 2001<br>
+From: Eric Covener &lt;covener@apache.org&gt;<br>
+Date: Mon, 3 Aug 2026 12:10:13 +0000<br>
+Subject: [PATCH] Merge r1936804 from aprutil 1.7.x:<br>
+<br>
+use timing safe comparison<br>
+<br>
+Submitted By: ylavic<br>
+Reviewed By: ylavic, rpluem, covener<br>
+<br>
+<br>
+<br>
+<br>
+git-svn-id: <a href=3D"https://svn.apache.org/repos/asf/apr/apr-util/branc=
hes/1.6.x@1936805" data-outlook-id=3D"0607e228-8279-41cb-b090-4c787bcf439b"=
>
https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936805</a> 13=
f79535-47bb-0310-9956-ffa450edef68<br>
+<br>
+CVE: CVE-2025-49506<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/apache/apr-util/c=
ommit/f77a20761cb15686f8d4de5b5eafc534ae24b19e" data-outlook-id=3D"d5e87081=
-399d-4c09-9459-4ad3bc8e08fc">https://github.com/apache/apr-util/commit/f77=
a20761cb15686f8d4de5b5eafc534ae24b19e</a>]<br>
+<br>
+(cherry picked from commit f77a20761cb15686f8d4de5b5eafc534ae24b19e)<br>
+Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
+---<br>
+ crypto/apr_crypto.c |&nbsp; 60 +++++++++++++++++---<br>
+ crypto/apr_passwd.c | 135 ++++++++++++++++++++++++++++++++++++++++----<br=
>
+ 2 files changed, 176 insertions(+), 19 deletions(-)<br>
+<br>
+diff --git a/crypto/apr_crypto.c b/crypto/apr_crypto.c<br>
+index 9ba190ef..ca3f0887 100644<br>
+--- a/crypto/apr_crypto.c<br>
++++ b/crypto/apr_crypto.c<br>
+@@ -21,6 +21,7 @@<br>
+ #include &quot;apu.h&quot;<br>
+ #include &quot;apr_pools.h&quot;<br>
+ #include &quot;apr_dso.h&quot;<br>
++#include &quot;apr_version.h&quot;<br>
+ #include &quot;apr_strings.h&quot;<br>
+ #include &quot;apr_hash.h&quot;<br>
+ #include &quot;apr_thread_mutex.h&quot;<br>
+@@ -173,19 +174,64 @@ APU_DECLARE(apr_status_t) apr_crypto_memzero(void *b=
uffer, apr_size_t size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return APR_SUCCESS;<br>
+ }<br>
+<br>
++/* Borrow this from APR-1.8 if not available */<br>
++#if !APR_VERSION_AT_LEAST(1,8,0)<br>
++<br>
++/* A volatile variable which is always zero but allows to block the compi=
ler<br>
++ * from optimizing or eliding code using it. Volatile forces the compiler=
 to<br>
++ * emit a memory load for which no value can be assumed, so for instance =
an<br>
++ * add/sub/xor/or with &quot;optblocker&quot; is a noop that will hide th=
e result to<br>
++ * the optimizer.<br>
++ */<br>
++static volatile const apr_uint32_t optblocker;<br>
++<br>
++/* Return whether x is not zero, with no branching controlled by x.<br>
++ *<br>
++ * Taken from the cryptoint library (public domain) by D. J. Bernstein,<b=
r>
++ * which provides timing attacks safe integer operations/primitives.<br>
++ * Code:<br>
++ *&nbsp;&nbsp; <a href=3D"https://lib.mceliece.org/libmceliece-20250507/c=
ryptoint/crypto_uint32.h" data-outlook-id=3D"7587f1ca-faae-457e-95c1-b3fbb8=
56d82d">
https://lib.mceliece.org/libmceliece-20250507/cryptoint/crypto_uint32.h</a>=
<br>
++ * Paper:<br>
++ *&nbsp;&nbsp; <a href=3D"https://cr.yp.to/papers/cryptoint-20250424.pdf"=
 data-outlook-id=3D"54f82d54-e1d3-4acc-8672-0e404ffad4be">
https://cr.yp.to/papers/cryptoint-20250424.pdf</a><br>
++ */<br>
++#if __has_attribute(always_inline)<br>
++__attribute__((always_inline))<br>
++#endif<br>
++static APR_INLINE int test_nonzero_timingsafe(apr_uint32_t x)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; x |=3D -x; /* sets the most significant bit unless x =
=3D=3D 0 */<br>
++<br>
++&nbsp;&nbsp;&nbsp; /* shift bit 31 (MSB) to bit 0 */<br>
++&nbsp;&nbsp;&nbsp; x &gt;&gt;=3D 32-6;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* k=
eep 6 bits */<br>
++&nbsp;&nbsp;&nbsp; x +=3D optblocker; /* lose the optimizer */<br>
++&nbsp;&nbsp;&nbsp; x &gt;&gt;=3D 5;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* keep the (original) MSB only */<br>
++<br>
++&nbsp;&nbsp;&nbsp; /* x is now 0 or 1 */<br>
++&nbsp;&nbsp;&nbsp; return x &amp; INT_MAX;<br>
++}<br>
++<br>
++#endif /* !APR_VERSION_AT_LEAST(1,8,0) */<br>
++<br>
+ APU_DECLARE(int) apr_crypto_equals(const void *buf1, const void *buf2,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; apr_size_t si=
ze)<br>
+ {<br>
+-&nbsp;&nbsp;&nbsp; const unsigned char *p1 =3D buf1;<br>
+-&nbsp;&nbsp;&nbsp; const unsigned char *p2 =3D buf2;<br>
+-&nbsp;&nbsp;&nbsp; unsigned char diff =3D 0;<br>
+-&nbsp;&nbsp;&nbsp; apr_size_t i;<br>
++#if APR_VERSION_AT_LEAST(1,8,0)<br>
++&nbsp;&nbsp;&nbsp; return apr_memeq_timingsafe(buf1, buf2, size);<br>
++#else<br>
++&nbsp;&nbsp;&nbsp; apr_uint32_t diff =3D 0;<br>
++&nbsp;&nbsp;&nbsp; volatile apr_size_t count =3D size; /* prevent loop un=
rolling */<br>
++&nbsp;&nbsp;&nbsp; apr_size_t i =3D 0;<br>
+<br>
+-&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; size; ++i) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; diff |=3D p1[i] ^ p2[i];<br>
++&nbsp;&nbsp;&nbsp; for (; i &lt; count; ++i) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char c1 =3D ((v=
olatile const unsigned char *)buf1)[i];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char c2 =3D ((v=
olatile const unsigned char *)buf2)[i];<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; diff |=3D c1 ^ c2; /* sets dif=
f to non-zero whenever c1 !=3D c2 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp; return 1 &amp; ((diff - 1) &gt;&gt; 8);<br>
++&nbsp;&nbsp;&nbsp; /* (diff =3D=3D 0) &lt;=3D&gt; (diff !=3D 0) ^ 1 */<br=
>
++&nbsp;&nbsp;&nbsp; return test_nonzero_timingsafe(diff) ^ 1;<br>
++#endif<br>
+ }<br>
+<br>
+ APU_DECLARE(apr_status_t) apr_crypto_get_driver(<br>
+diff --git a/crypto/apr_passwd.c b/crypto/apr_passwd.c<br>
+index c961de2b..74b5fc17 100644<br>
+--- a/crypto/apr_passwd.c<br>
++++ b/crypto/apr_passwd.c<br>
+@@ -14,6 +14,7 @@<br>
+&nbsp; * limitations under the License.<br>
+&nbsp; */<br>
+<br>
++#include &quot;apr_version.h&quot;<br>
+ #include &quot;apr_strings.h&quot;<br>
+ #include &quot;apr_md5.h&quot;<br>
+ #include &quot;apr_lib.h&quot;<br>
+@@ -39,6 +40,111 @@<br>
+<br>
+ static const char * const apr1_id =3D &quot;$apr1$&quot;;<br>
+<br>
++#if APR_VERSION_AT_LEAST(1,8,0)<br>
++<br>
++#define streq_timingsafe&nbsp;&nbsp;&nbsp; apr_streq_timingsafe<br>
++#define strneq_timingsafe&nbsp;&nbsp; apr_strneq_timingsafe<br>
++<br>
++#else /* borrow code from APR-1.8 if not available */<br>
++<br>
++/* A volatile variable which is always zero but allows to block the compi=
ler<br>
++ * from optimizing or eliding code using it. Volatile forces the compiler=
 to<br>
++ * emit a memory load for which no value can be assumed, so for instance =
an<br>
++ * add/sub/xor/or with &quot;optblocker&quot; is a noop that will hide th=
e result to<br>
++ * the optimizer.<br>
++ */<br>
++static volatile const apr_uint32_t optblocker;<br>
++<br>
++/* Return whether x is not zero, with no branching controlled by x.<br>
++ *<br>
++ * Taken from the cryptoint library (public domain) by D. J. Bernstein,<b=
r>
++ * which provides timing attacks safe integer operations/primitives.<br>
++ * Code:<br>
++ *&nbsp;&nbsp; <a href=3D"https://lib.mceliece.org/libmceliece-20250507/c=
ryptoint/crypto_uint32.h" data-outlook-id=3D"bb48a92c-412e-4388-b226-17dd42=
b882f1">
https://lib.mceliece.org/libmceliece-20250507/cryptoint/crypto_uint32.h</a>=
<br>
++ * Paper:<br>
++ *&nbsp;&nbsp; <a href=3D"https://cr.yp.to/papers/cryptoint-20250424.pdf"=
 data-outlook-id=3D"b05c520f-3b2e-4ce7-9db7-169096c84b3e">
https://cr.yp.to/papers/cryptoint-20250424.pdf</a><br>
++ */<br>
++#if __has_attribute(always_inline)<br>
++__attribute__((always_inline))<br>
++#endif<br>
++static APR_INLINE int test_nonzero_timingsafe(apr_uint32_t x)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; x |=3D -x; /* sets the most significant bit unless x =
=3D=3D 0 */<br>
++<br>
++&nbsp;&nbsp;&nbsp; /* shift bit 31 (MSB) to bit 0 */<br>
++&nbsp;&nbsp;&nbsp; x &gt;&gt;=3D 32-6;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* k=
eep 6 bits */<br>
++&nbsp;&nbsp;&nbsp; x +=3D optblocker; /* lose the optimizer */<br>
++&nbsp;&nbsp;&nbsp; x &gt;&gt;=3D 5;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* keep the (original) MSB only */<br>
++<br>
++&nbsp;&nbsp;&nbsp; /* x is now 0 or 1 */<br>
++&nbsp;&nbsp;&nbsp; return x &amp; INT_MAX;<br>
++}<br>
++<br>
++static int streq_timingsafe(const char *sec1, const char *str2)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; apr_uint32_t diff =3D 0;<br>
++&nbsp;&nbsp;&nbsp; apr_size_t i1 =3D 0, i2 =3D 0;<br>
++<br>
++&nbsp;&nbsp;&nbsp; for (;; ++i2) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char c1 =3D ((v=
olatile const unsigned char *)sec1)[i1];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char c2 =3D ((v=
olatile const unsigned char *)str2)[i2];<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; diff |=3D c1 ^ c2; /* sets dif=
f to non-zero whenever c1 !=3D c2 */<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Not a shortest/longest matc=
h because an attacker would usually know<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * one of the strings and=
 could then determine the length of the other.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * So assume only sec1 an=
d its length are secret and stop the loop at<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the end of str2. If se=
c1 is shorter than str2 the loop will continue<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * by comparing the rest =
of str2 with the trailing NUL byte of sec1.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * In any case since the =
diff above is computed up to and including a<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * NUL byte, only the sam=
e content and length will raise match.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!c2) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Don't go above sec1's NUL b=
yte */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i1 +=3D test_nonzero_timingsaf=
e(c1);<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp; /* (diff =3D=3D 0) &lt;=3D&gt; (diff !=3D 0) ^ 1 */<br=
>
++&nbsp;&nbsp;&nbsp; return test_nonzero_timingsafe(diff) ^ 1;<br>
++}<br>
++<br>
++static int strneq_timingsafe(const char *sec1, const char *str2, apr_size=
_t n)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; apr_uint32_t diff =3D 0;<br>
++&nbsp;&nbsp;&nbsp; volatile apr_size_t count =3D n; /* prevent loop unrol=
ling */<br>
++&nbsp;&nbsp;&nbsp; apr_size_t i1 =3D 0, i2 =3D 0;<br>
++<br>
++&nbsp;&nbsp;&nbsp; for (; i2 &lt; count; ++i2) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char c1 =3D ((v=
olatile const unsigned char *)sec1)[i1];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const unsigned char c2 =3D ((v=
olatile const unsigned char *)str2)[i2];<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; diff |=3D c1 ^ c2; /* sets dif=
f to non-zero whenever c1 !=3D c2 */<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Not a shortest/longest matc=
h because an attacker would usually know<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * one of the strings and=
 could then determine the length of the other.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * So assume only sec1 an=
d its length are secret and stop the loop at<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the end of str2. If se=
c1 is shorter than str2 the loop will continue<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * by comparing the rest =
of str2 with the trailing NUL byte of sec1.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * In any case since the =
diff above is computed up to and including a<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * NUL byte, only the sam=
e content and length will raise match.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!c2) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Don't go above sec1's NUL b=
yte */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i1 +=3D test_nonzero_timingsaf=
e(c1);<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp; /* (diff =3D=3D 0) &lt;=3D&gt; (diff !=3D 0) ^ 1 */<br=
>
++&nbsp;&nbsp;&nbsp; return test_nonzero_timingsafe(diff) ^ 1;<br>
++}<br>
++<br>
++#endif /* APR_VERSION_AT_LEAST(1,8,0) */<br>
++<br>
+ #if !defined(WIN32) &amp;&amp; !defined(BEOS) &amp;&amp; !defined(NETWARE=
)<br>
+ #if defined(APU_CRYPT_THREADSAFE) || !APR_HAS_THREADS || \<br>
+&nbsp;&nbsp;&nbsp;&nbsp; defined(CRYPT_R_CRYPTD) || defined(CRYPT_R_STRUCT=
_CRYPT_DATA)<br>
+@@ -86,28 +192,33 @@ APU_DECLARE(apr_status_t) apr_password_validate(const=
 char *passwd,<br>
+ #if !CRYPT_MISSING<br>
+&nbsp;&nbsp;&nbsp;&nbsp; char *crypt_pw;<br>
+ #endif<br>
+-&nbsp;&nbsp;&nbsp; if (hash[0] =3D=3D '$'<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; hash[1] =3D=3D '2'<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; (hash[2] =3D=3D 'a'=
 || hash[2] =3D=3D 'y')<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; hash[3] =3D=3D '$')=
 {<br>
++<br>
++&nbsp;&nbsp;&nbsp; if ((strneq_timingsafe(hash, &quot;$2a$&quot;, 4) | /*=
 test both */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strneq_timingsafe(hash, =
&quot;$2y$&quot;, 4))) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The hash was created u=
sing [apr_]bcrypt encoding.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (_crypt_blowfish_rn(pa=
sswd, hash, sample, sizeof(sample)) =3D=3D NULL)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn APR_FROM_OS_ERROR(errno);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp; else if (!strncmp(hash, apr1_id, strlen(apr1_id))) {<b=
r>
++&nbsp;&nbsp;&nbsp; else if (strneq_timingsafe(hash, apr1_id, strlen(apr1_=
id))) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The hash was crea=
ted using our custom algorithm.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; apr_md5_encode(passwd, ha=
sh, sample, sizeof(sample));<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp; else if (!strncmp(hash, APR_SHA1PW_ID, APR_SHA1PW_IDLE=
N)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; apr_sha1_base64(passwd, =
(int)strlen(passwd), sample);<br>
++&nbsp;&nbsp;&nbsp; else if (strneq_timingsafe(hash, APR_SHA1PW_ID, APR_SH=
A1PW_IDLEN)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The hash is a (naked) =
SHA1.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; apr_sha1_base64(passwd, (int)s=
trlen(passwd), sample);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * It's not our algo=
rithm, so feed it to crypt() if possible.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+ #if CRYPT_MISSING<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (strcmp(passwd, hash) =
=3D=3D 0) ? APR_SUCCESS : APR_EMISMATCH;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return streq_timingsafe(hash, =
passwd) ? APR_SUCCESS : APR_EMISMATCH;<br>
+ #elif defined(CRYPT_R_CRYPTD)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; apr_status_t rv;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRYPTD *buffer =3D malloc=
(sizeof(*buffer));<br>
+@@ -118,7 +229,7 @@ APU_DECLARE(apr_status_t) apr_password_validate(const =
char *passwd,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!crypt_pw)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
v =3D APR_EMISMATCH;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv =3D=
 (strcmp(crypt_pw, hash) =3D=3D 0) ? APR_SUCCESS : APR_EMISMATCH;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv =3D=
 streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR_EMISMATCH;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(buffer);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rv;<br>
+ #elif defined(CRYPT_R_STRUCT_CRYPT_DATA)<br>
+@@ -149,7 +260,7 @@ APU_DECLARE(apr_status_t) apr_password_validate(const =
char *passwd,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!crypt_pw)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
v =3D APR_EMISMATCH;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv =3D=
 (strcmp(crypt_pw, hash) =3D=3D 0) ? APR_SUCCESS : APR_EMISMATCH;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv =3D=
 streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR_EMISMATCH;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(buffer);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rv;<br>
+ #else<br>
+@@ -173,14 +284,14 @@ APU_DECLARE(apr_status_t) apr_password_validate(cons=
t char *passwd,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; rv =3D APR_EMISMATCH;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
lse {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; rv =3D (strcmp(crypt_pw, hash) =3D=3D 0) ? APR_SUCCESS : =
APR_EMISMATCH;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; rv =3D streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : A=
PR_EMISMATCH;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
rypt_mutex_unlock();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn rv;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp; return (strcmp(sample, hash) =3D=3D 0) ? APR_SUCCESS :=
 APR_EMISMATCH;<br>
++&nbsp;&nbsp;&nbsp; return streq_timingsafe(hash, sample) ? APR_SUCCESS : =
APR_EMISMATCH;<br>
+ }<br>
+<br>
+ static const char * const bcrypt_id =3D &quot;$2y$&quot;;<br>
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-supp=
ort/apr/apr-util_1.6.3.bb<br>
index 3a5f52d250..19f8e59ca5 100644<br>
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb<br>
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb<br>
@@ -13,6 +13,12 @@ SRC_URI =3D &quot;${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.=
gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://configfix.patch" data-outlook-id=3D"e407ce75-b3d6-476d-8983-2c1a=
0f7e86ef">
file://configfix.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://configure_fixes.patch" data-outlook-id=3D"4d7961d2-af73-43bc-be0=
9-cdcf5a3bd7d1">
file://configure_fixes.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-test_transformation-Check-if-transform-is-supported-.patch"=
 data-outlook-id=3D"927642fb-f196-45dc-9634-1e2bc7fc818f">
file://0001-test_transformation-Check-if-transform-is-supported-.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2025-49506.patch" data-outlook-id=3D"2b041b35-0495-4a5d-bcb1-4b9d0=
f3f5afb">
file://CVE-2025-49506.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-32327-dependent.patch" data-outlook-id=3D"020ebf71-a386-4be0-=
a841-d4959885b9c3">
file://CVE-2026-32327-dependent.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-32327.patch" data-outlook-id=3D"8703af69-e0b6-4ada-9663-ec4a1=
9ac39b3">
file://CVE-2026-32327.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-34501.patch" data-outlook-id=3D"e54c49ea-b624-43b7-973b-4a33d=
0f03703">
file://CVE-2026-34501.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-34502_p1.patch" data-outlook-id=3D"5becef43-3459-46da-b701-a4=
08cb2200f7">
file://CVE-2026-34502_p1.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-34502_p2.patch" data-outlook-id=3D"72dfb249-a938-4684-b9f6-7a=
2916a62520">
file://CVE-2026-34502_p2.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest" data-outlook-id=3D"07a64f25-13d5-4651-91b1-93ee688399=
48">
file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
--<br>
2.35.6<br>
<br>
</div>
</div>
</div>
</body>
</html>

--_000_CY8PR11MB70369075BF0281B7E2603305AF8D2CY8PR11MB7036namp_--

