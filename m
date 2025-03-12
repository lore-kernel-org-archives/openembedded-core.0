Return-Path: <rbilovol@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26DAC28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 20:08:07 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web11.5058.1741810085311650181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 13:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=F63HIrTY;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: rbilovol@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1169; q=dns/txt;
  s=iport01; t=1741810085; x=1743019685;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jGhehfS71qbZJjAtJqss69ZjRORne0ZaLnR5XhD91AY=;
  b=F63HIrTYV/s7gUiUp8w3q0U25d1pQHOuckdq5qNtMXzao8KfmeBCTI0/
   TZajEEaY+fQkFDgL8dKELaDUlftBOLOX+0pk/mPbFNLY61XJ87fRGuplH
   7XJ/G0ISGg4+L9RBD06iFZhrp2RBGrdL7CJfqGn4mgL4Pjj4lOt4yKCvF
   BSeXinHK8p0AG7G7DPz6kq3Orhff1sbvhugAFUy0ZJFEwbAXPHHgRUIG9
   gfoDSHZdgxA+i7lAMWir9bsbsClncI1IkhWSUvsuThm3NaScpGB663htL
   3XdCjXgFJeAa7SNEKEDbbhA8v488sH5uCt7IxgSo1YIVJhFM6QUgbiCld
   g==;
X-CSE-ConnectionGUID: 1YBtsHeuRJqRwo4J1R6FAw==
X-CSE-MsgGUID: rHfYokMDR5WrWJfsGa81eA==
X-IPAS-Result: =?us-ascii?q?A0AFAAAO6dFn/48QJK1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQFAJYEaBAEBAQEBCwGBcVIHghJIhFWDTQEBhE5fhlOBd?=
 =?us-ascii?q?C0DnhSBJQNWDwEBAQ0CRAQBAYUHAosaAiY0CQ4BAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQELAQEFAQEBAgEHBYEOE4YIhloBAQEBAgESERVBEAsOCgICJgICMSUGE?=
 =?us-ascii?q?wIBAR6CYIJCIwMBomQBgUACiit6gTKBAd40gW6BGi4BiE4BhgaEXCcbgUlEg?=
 =?us-ascii?q?TwLgkA4PogegmkEghgXRYEkgz6pTFJ7HANZLAFVExcLBwWBKUMDgQ8jgSMFN?=
 =?us-ascii?q?EE4ggtpSToCDQI1ght8gitqBAWBJII3hDyEQIVOghGBYAMDFg8Bgx93HIQ+P?=
 =?us-ascii?q?YRhLlYlHUACAQttPTcJCxsGPaI+OoQ8UnQbezIwPg2kWqFxhCWhTQYPAQMvq?=
 =?us-ascii?q?leYfqNjhSYCBAIEBQIPAQEGgWc8gVkzGggbFYMiUhkP2h1cPAIHCwEBAwmRZ?=
 =?us-ascii?q?QEB?=
IronPort-PHdr: A9a23:rXCPbBXui6FHB+ABujwnkfEwKYTV8K3PAWYlg6HPw5pHdqClupP6M
 1Oav7NmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:6M4a/qMzjX97rm7vrR39lsFynXyQoLVcMsEvi/4bfWQNrUoj0TVTm
 zEXUW3SPvmMYTTxKtF1PNmz/UMHvcOGz9A1SnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFjmE+0/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/Wl/lV
 e/a+ZWFZQf+gmQsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66xfJl0tHYAFwMRuO35Jq
 d5BEm4jRw/W0opawJrjIgVtrs0nKM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY0BPjDS0Un1lM/Epg/mOC2gX3XeDxDo1XTrq0yi4TW5FAtiuC8bYWOJLRmQ+1Pvkipo
 WHj016kPQslFtKE5jPVq3+F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfQ9/vBDj10u7rTQnWYnop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:OF1S1aHInm/AYLbdpLqFXZHXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc6Ax8ZJjvo6H6BEDyewKgyXcT2/hhAV7CZniZhILGFvAE0WKP+UydJ8S6zJ8j6U
 4CSdkMNDSTNykfsS+S2mDReLhQoqjjzEnrv5al854Hd3ASV0gP1XYANu/WKDwReCB2QbACON
 634M1BqzC8eXIRQPiaKxA+NdTrlpngrr6jRQQJKSIGxWC14A9Bv9XBYmilN1olInhyKLEZnl
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkLwDb4RFoGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWQrQH20wft/T4y4zvJyEOeg1HkvcvlLQhKQfZptMZ8SF/0+kAgtNZz3O
 Zi2H+YjYNeCVf6kCH097HzJmdXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6ag8ed
 MeTf301bJzSxe3fnrZtm5gzJiHRXIoBCqLRUAEp4i8zyVWpnZk1EEVrfZv0EvozKhNCKWs2t
 60cJiBzNp1P4orhONGdag8qPKMeyzwqUmmChPXHbzlfJt3TE4l5aSHp4nd39vaDKDg/KFC6q
 gpb2kowFLaW3ieQPFmj6c7uiwlBl/NEQgEDqpllsFEUnqWfsusDRG+
X-Talos-CUID: =?us-ascii?q?9a23=3An/GdumhEAll1vLcOcXMX3lg4fDJuK0z30GzwLlK?=
 =?us-ascii?q?CK39TV7rJawaqpo1NjJ87?=
X-Talos-MUID: 9a23:stzK6wYANzwg1eBTrR/itTZhEetSvpu0N2IDiroP65CJHHkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Mar 2025 20:08:02 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 9A9A31800013D
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 20:08:02 +0000 (GMT)
X-CSE-ConnectionGUID: Bcf44V6jT9STDWyVbB+x1Q==
X-CSE-MsgGUID: QVGVkLCMTuStIwyV8V9cHQ==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.14,242,1736812800"; 
   d="scan'208";a="19298958"
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Mar 2025 20:08:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9c5Xy86EdpufKm6gKMUOuT50Gw5AdFeIIZ34tIzmoIiGHQ3boUxmP6nktc6Oubn7CmjSFeNjy9TZTTEO29bQQYGKXb9diLBqcuHck7WizXX6c8fVrGou89yfNfzwPOxlX+rvVMVoGl0CWtF8J8KmclWft+YwXniqt4ySa7hfeQXEb5rBLC5Q1AMnLZnOP1u6Qiusn/3ZLGSKsXrOXmyOVRI5mfN8Nhn5Xh7b5T2gKuZwx8LOmis1Yo1Xczbsa4a/5KQulpvzjyKOWLRv0v7dWDCc2C2R6UYKZP89mH5eJJl/zKpDesmcQ1R6gpG0BjD5jbVgGeJwHwdrj/OfCiDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGhehfS71qbZJjAtJqss69ZjRORne0ZaLnR5XhD91AY=;
 b=rHsbUlL8+2vcUD8tqV7rC72ith8jmOAxX1+kRu85gD6H8Wo4Uy3ql/IINQqj8zId1rnuKGsa7VTTbZMDzAdVJHo09DmGpCINXuxe+qGoqZ5uFuXSzPuicE0ym+kbMn5u+Mna5qbeZ4BMX+i9nHzvla56BWivpzn/2Tk1TUubeux0KgNIn8ZwkAza4T47DLk6BGZyZig+CP3w8lQxNxiyAcYC8yFra2vWLMb5xiUgG0gphcfsUzrFJabF+5wU2iZuBGL2ar+FQ3mhbYlpvEPB+eh+BpCyib1mywVb2hCfbUuOskP6bU7OB73fNTYXXMhhJEeogQhPfQb95K6q7cn+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SA3PR11MB7413.namprd11.prod.outlook.com (2603:10b6:806:31a::17)
 by BY1PR11MB8080.namprd11.prod.outlook.com (2603:10b6:a03:528::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 20:08:00 +0000
Received: from SA3PR11MB7413.namprd11.prod.outlook.com
 ([fe80::4323:d64d:6823:4d7c]) by SA3PR11MB7413.namprd11.prod.outlook.com
 ([fe80::4323:d64d:6823:4d7c%7]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 20:08:00 +0000
Message-ID: <84153928-cb36-4091-895f-604c84ba7def@cisco.com>
Date: Wed, 12 Mar 2025 16:07:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)"
 <oobitots@cisco.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Ross Burton <Ross.Burton@arm.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250206144907.1924993-1-oobitots@cisco.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
 <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
 <DB5PR02MB102130601D165773C901753C1EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <PH0PR11MB4902EB32CF27A37CD32A2938D7FD2@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8kdZ1Stvu-OqakXhShp4easJXsYbaW0hg=T-ALGQj6zA@mail.gmail.com>
 <SA2PR11MB49064A61A32F35C2E519AA36D7FC2@SA2PR11MB4906.namprd11.prod.outlook.com>
 <CANNYZj8khhZ0EEeJ7W=epDWNKC6tTHPfd7Xk__G1M6T=ij6oOQ@mail.gmail.com>
 <PH0PR11MB49026C46CD70272E73A7C688D7FC2@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj-nec7b3k8GjrJTvuhfhZaJy3t3QZPcoT-ybfDVd+cMxA@mail.gmail.com>
 <PH0PR11MB49023C8B3C8FCDD4532DC0ECD7FF2@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8K2jQO3bZes+wjKDxXbO-OVzM626ibT6PKrS-0ZdDXCA@mail.gmail.com>
Content-Language: en-US
From: Ruslan Bilovol <rbilovol@cisco.com>
In-Reply-To: <CANNYZj8K2jQO3bZes+wjKDxXbO-OVzM626ibT6PKrS-0ZdDXCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:91::19) To SA3PR11MB7413.namprd11.prod.outlook.com
 (2603:10b6:806:31a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7413:EE_|BY1PR11MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db2744d-e68a-48f4-e928-08dd61a19691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WmR5ZzRpUXhydVRVTU00Y1IyVllMdEZ1MUdSbTY2aGltWG5IVUFtM1BBcU02?=
 =?utf-8?B?WEtOMU81cUdOUVNvZlowTlhLaVRrems4NWhoLys0LzVmcE9TamZoSzRLT3Yr?=
 =?utf-8?B?QUEydlUrcC9WTTZ5Nnlkd21FL3EwU3oySjVpMVk1OWR6VmpIYjRnSnlDNUNC?=
 =?utf-8?B?blRvMkRBd3pPcTdwcy8zdUFMbmxRb1FWODB4T252cm9LMWNTaitmS3p0OVUy?=
 =?utf-8?B?M2JBNDcwRUZqZk1PNEZ0Qk13Q2dPYUROdm1lY0RYZktCaDZKd3BVWjBSZnVR?=
 =?utf-8?B?UDd6UzRkMW5nN3ZJQzVLRDlSeVR6UThDWFVxd0QzM0IxMnpWZWplR1RtY0pB?=
 =?utf-8?B?RzhsOWVEeUIrRnRxZjBFRFJTTi9LU050eGlzbW1zRGlkUitXZ1FycVRpVitV?=
 =?utf-8?B?Zlg0eEpBaUE5U1FDcEdyQmNFdTBxQkNRS0JLbm5vOWxSeE5ZbzdzYjNya01r?=
 =?utf-8?B?emduZFJDcnVGUnFCVXdKYzAwRWw0UGJyN2lnVi95NmIzZ0g1c0lXRWUwT0FE?=
 =?utf-8?B?aWo4Z3NqZVZHZU9zaDQ1c08vT0tLKytIZWk5VWcvWVVoV2FMdnZSd2xINC9h?=
 =?utf-8?B?SDhlK2p6UjFZYVlhOTR4N1JjNmtSWGJWdEVuUVYzTW1ab0Z0NjdOcE9ieEp4?=
 =?utf-8?B?UWlaMCs3bkNwdVhyaW5WLzJOUnBHZmk5NFdUbndVZ3ZBTFkyYnRQNjljVWkr?=
 =?utf-8?B?aDFKLzdBZjFLWFBSaDRsblpmQ2JWTUZTNVVHVUJsTktkUEtiS2tqb2E4Qng2?=
 =?utf-8?B?NDhEWVpyK0FSWTBQMUJsYldYZGRVZVhzZXFOQm1JQzJWMEpkSTMyclYwWi9L?=
 =?utf-8?B?bFd3clVyNW9HWkMxNTNubVc0MVhXOGI3YXd6TGovRVJENk4xNW0xb2JHWUJN?=
 =?utf-8?B?TXgrLzhDam5Sa29BeGpjTDBOaytWMGhCZzZaTE5FL1NqcTdHbitWc3o1alhB?=
 =?utf-8?B?dEFaVUlHeUFKWVJnRFQxbnR6UUNzdGpzNVF1VXBZczNTbW1GdjJHUGVlM1Vt?=
 =?utf-8?B?b2RrVEladFFpZmY4WWR5T052enA0U3VUb1JlbFBmdkVqQnJzUU5ybWw4am9M?=
 =?utf-8?B?c1dmMmpud3E1Z09LcFZ3d1BtLzIrMEkycWlIcDRZcXNHOWo2R0p1SWgvNEFB?=
 =?utf-8?B?SWNQNjAxaEgyNTg1d0xvQUljRFRpbFAzYzRSS0o1V2FPOEdWYUJSamE1cHYw?=
 =?utf-8?B?MjN3ZWhzck1lWkZZUlMzdUFvL0lpR0RKL2ErVTUzTzk0dlkva0dLWnI4dzRl?=
 =?utf-8?B?aUdDMERvTXVONWdWVWdJaldGRytRZG5FMitKMGxZWitxOXBHWndHc1RtMEJD?=
 =?utf-8?B?SE9NSVZmWVpsQWlYbHR2RFRBTFUxampUQ2VIWHJkT2RmeFVHclp3VXQzelpv?=
 =?utf-8?B?YjhpOVNrNEIveWo0MVJ2OHI5a2lIREt2UVhMRm9rQjBMd0xmZDBuL1N1MFV0?=
 =?utf-8?B?WTZFV3F5SU1DVEkzVG5LM0V5VmlmM0N6Z05nMnM2dTNLazBJbDRqUW12TUFs?=
 =?utf-8?B?RVFGNHFJMzdMd1Y1cWhpeTh1QXhNNFJ4OXVkTFRWSFN1c3ZDVlNqUFEzdkRh?=
 =?utf-8?B?dWRSSnFiY1A3cjVHU3VTN1V2RjdhejJVdXQ2MnhNNktuWTZHNnY3NEFWaHpX?=
 =?utf-8?B?YkdDQ2F4VlhkVEsybzJjT2hRRncwVXpnVjhTOUx3ZGxVaVlqZlZsN0hubjJo?=
 =?utf-8?B?MXk0TStIY0JiZ2ZScG5HZHBmdytyUEE2UU5HMVlvTnF6aGtQWks4cDhwcUNt?=
 =?utf-8?B?MWFVbFJmd2IrUGJoYU5FSi8vOTFROHVHMGpiSVEzZzRVZU5CSHJSbTJTTmlL?=
 =?utf-8?B?aDh6YmdoTnZxTWc4ZnlGL2tDTTdMOUZQNkV2dWp4T0FUamZxYkNDNyt5Y3Jz?=
 =?utf-8?Q?FmZYXfyCcMaIW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB7413.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a25GK1J2RTZMRlUzV1lSR1V1UEJEbEw4SHhyeVg5a01mT1hVc3hpeHBqR2J6?=
 =?utf-8?B?NnFJUFN5bEpoTUdtSDFkSW5QR0JLeUdvK0lPVk1JM3B4K3d4MFMxb3EwcEZl?=
 =?utf-8?B?Z2FoWDIxbnRIYkw3dUk1Qm9FclhQYVhCRzdVRTlVYzRaZko5Wm1abmJhVWhO?=
 =?utf-8?B?ZjluWW9zdXVyMGVIV2RCN2dxTUhsQmI3TDhwQmpDWWRaS3MwOGs5QU5KVnRK?=
 =?utf-8?B?Rk5qN3dLNDBaelpFNVkvTlMyamhUSmF2bU95d25ZeFRrYjdZcUR2a0Q4MDUw?=
 =?utf-8?B?ZENRQUhLVk9lZEppVDFQRlJ2d3VPWDBXV1lCdnAzSklURFRNNVU0UEFzKzFT?=
 =?utf-8?B?NlNGR1Y2ZkJoRFo5azYwWkdkQXU3M3l1bWJKbStESUhJbi85QTgwclVFSjY1?=
 =?utf-8?B?T2wzcEdSMHlNZTMrN0xIdXVPWFJwWVUwb0h4dG1tRDFHcjlYdHBmVFA3NVZQ?=
 =?utf-8?B?bEZaTUUzRFd5RmJ2ZkJoendpdnYxRlB5UWlkV1ZkaE1xV1BodEZIcWNLUkpz?=
 =?utf-8?B?bVZqWUtrRWhpeWpBNUFzNEM4eXQvdm0xZ1NjbFVWV1FNTWlHMGpaemUwSmtS?=
 =?utf-8?B?eVYvYmVaaUphOFc4NnFhc1dqMStvaHJEUzR3QkFWaitYTnZFSXk0VDNLT2FW?=
 =?utf-8?B?eWpud3d2TmxUQzJyY1dSVS9iN0hybTNZSjJKUURCU1g0MFFOWEg3RTBKSTcx?=
 =?utf-8?B?T0tKOVIvM2VTcVNkaldzczg2VkNiUFVkNGlmUmc1RTNSMlZQV1dvL0VPZVdG?=
 =?utf-8?B?UmU5S04rdTA2TmRPVGFRajN2cmNjSXMvd2MzM01pajEwT2YrTjdlOWJKVTM2?=
 =?utf-8?B?YXduZ2lzZWRHNm5raHk4UzA2YU1GOUNDaWhCYUZON0puVW1MazgxNG1xbWtx?=
 =?utf-8?B?TnJLbW16ZWI5SkVoeG9RckZWU0Rldzh1b1U1MWx1c1E5U2J4aUVHV0M1QXQx?=
 =?utf-8?B?bGp5ZXVra2RsMEFQdjJWN2phTFdydi9HcE5UbGJwc0pseVpVaHpmY1BKNkJj?=
 =?utf-8?B?Z0t3NFgwYTdIQ3pHTlBOcVZhOFNBN3FFT25HOVppK1phZGkxVnBKdVFVTHpq?=
 =?utf-8?B?U2dNTWFvcEoyY0NPYmZYS1pHK0NqNlUzSUJBMytua1NGZEswQVhabzVOaFk2?=
 =?utf-8?B?d2lFMDNTVnpIRGhLNm0vUytCM1Rxem1mcmMrSmhnMGFtUmdOakUxZFVGd3hE?=
 =?utf-8?B?LzBlYjBZZGpkUGpRY0pjekZUR0lvcFQ5Ymx6WVNXeEw2ejliNWFrbzZXTFpB?=
 =?utf-8?B?OG9nZS8rTGxFUG9zZy93QlpsRm9xNGVYLzRuVGlrdGQ3dk5qQWx3YXVXbHc0?=
 =?utf-8?B?dk1JUDl6dHZaMHdTWGZyb0thWXo5YkFyWXV0c2dROFd1WVptaWVadXgwRGM0?=
 =?utf-8?B?WXVEczNVN3dPallwRGZHZXdVMVRHR1o2M1B0RVB5TzhHMmNsU0Z6eWdLOWFY?=
 =?utf-8?B?eWRvQzBVRjFWK0dnRDZ6ZCtDUldkQ0s4ZXFDNkxHUGZEU2ErTEp4blFXNk5n?=
 =?utf-8?B?RG90eXN6SlR6MERLVmRDUUtlM2JyeWwyamU2WkJQSUFOY3lwZUFWemdZVXJn?=
 =?utf-8?B?eTVPQlYrSGFYQ3VFbTNTOXZTanova2pZZUpmRkNzUUFSNTFLbW1NNHYrZXdz?=
 =?utf-8?B?bG9qeVozUjFKS2lKajZkT3RobER2YSt2NFJwOFVEbEdObXpsR1BRdmlIYjdT?=
 =?utf-8?B?QkM1WDlaeWlybHNmUnl4SmwrMjE1dnVOTllGbEFTZkJBaE1UNERWQ3VBMFFO?=
 =?utf-8?B?SG44ZGFKVjgyZVFLVVdtZWxVMTdqSVkvY0hWNmlOaU9aNGFaMzN0MndCVE9v?=
 =?utf-8?B?c2tHZFltWXYvdk11eE90NTIrV1VtaHl4ZUpDMVl3TkFFQkpGNjgrQTJMejhY?=
 =?utf-8?B?cGNWUmhCMFZMK01hY3dhbmJIRGFGWU8rdVl6d2N6TFBCbVA1b0p2a3UxdG40?=
 =?utf-8?B?bFlGbkU1c0ljY1VVR3ZwRW9kYzBkU3FWNjhxcHlwMVNTOEhrb0pDUEZPTm16?=
 =?utf-8?B?ZHVXTUQwbHdPV1JCMkNseW85WFFlQ1cxMWdkRU1Cc2syY2FKckhjUjd1MWU5?=
 =?utf-8?B?b2h6S0Y3ZnhlUE1McnFXK0s2QVBUNkhKR2NmMEpmOSt1TGtuRkZEMm1ZYVgz?=
 =?utf-8?B?cVZ3M3VkWXlMdkFQSW11L1dkbG5IaU4ySDA3Z2pKa2dLWWozYVl1SDdMT2wz?=
 =?utf-8?Q?O6dBOI066se+lI8ukQIjxe9XcurJ1spIatz7qJ5AASE/?=
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db2744d-e68a-48f4-e928-08dd61a19691
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 20:08:00.2473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/oufYbQ9bFObWewR5FlH0ZZRbfoN9kRdQGGMvIEu95XFM4NJ9YYviBAsBTiztayj1KSmnKH/RwaLc+bA52kOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8080
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 20:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212723

On 2025-02-13 04:57, Alexander Kanavin wrote:
> On Thu, 13 Feb 2025 at 08:00, Oleksiy Obitotskyy -X (oobitots -
> GLOBALLOGIC INC at Cisco) <oobitots@cisco.com> wrote:
>>
>>> Is it trying to save space on target device, or trying to save space
>>> on the build host? You really do need to describe your process in more
>>> detail.
>>
>> It's attempt to save space on build host.

Oleksii wasn't clear enough here but the purpose of splitting bigger
packages into smaller subpackages is to reduce image size.

 >
 > I wonder if you can special-case this in your scripts, e.g. remove the
 > bulk of systemd, except systemctl and libsystemd-shared, after the
 > 'sysroot' has been made?

We used this approach (manually picking parts of package to reduce
image size) previously, but found it too errorprone, as final user
may not know what the real dependency are inside of package.
To eliminate this issue, we decided to split some big package into
subpackages to have better control on what is getting delivered to
the final image, and also keep properly maintained dependencies
inside of subpackages and between subpackages.

Thanks,
Ruslan

