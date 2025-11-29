Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C529CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 14:48:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15715.1764427702461871780
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 06:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W7MtDM7l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATDdV5A937801
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 06:48:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QMXBs/Ttw+PxVtkH19hMSGM+loBi7tLLyy3IOp05Gqs=; b=
	W7MtDM7lIg750X0iLe9twKANOZOfi1hsMPVlLZmPk7JDDvQ4rjdBWHZB1CjUV1co
	nVBb/yEltuRCrdM7tpVeG3nEkdhZJgYfpEEO/0CbIT/Bj3uT7WkAipILKibwEGbm
	BpydhXL0qYigb5F/RjC7ZChb7sdYFHE+yWmsVZy5vsYykwGPE8598lr7op1TevRP
	UL7WneRQV9hQmJLR44cnlk4h3Io70iY6wa8V+XqXK7lowgMPXQM9Da784Rna3PTY
	c60kgvDpU7bAiAPkkJqm3z51eMiSn9pZcOo22da4CJRbvQBGMUJBPMeBQq8tmm6g
	sXptUZPjKh/ETxo4L2QB6w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mr1rs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 29 Nov 2025 06:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIuQDiRK9aCY7HcGPLVbFwUKEBNlCXC1Q8BGFG+qzeF2oeHSsb3jkms3BMy7RCAKls6DDjgmPv/3dkQU9nrf3aQ4g0xF1x/wXUhXJAm51Qo0CseOoE48T3IC5K8bnrmeTYD94URPLw4wp1eshnotffxJnnmRVqNCcAZKV8oCgfK8ujoep3IteED8f2ZYzr8zdIASJHA/MLXPW1/rO9DUR47L4HHRfEYZuVqvA5fGCTTItK2TRgoj1/qC+MhB4etz+e8zBwqiW1kRQuM3CqveHy0nfgAf0nT3PT/dI7AXSdQxmjSUNdUDOPNrgAvZzwN1Vzyp9jgUlnLiwYH6fMAhhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMXBs/Ttw+PxVtkH19hMSGM+loBi7tLLyy3IOp05Gqs=;
 b=SkhlPYi8yiyq7qeQ5OLb65SKUTJ4uokSmLlZtT3dqvTj3/ieoNt2OCWzw062fmsCPW5h00smTrfSogAf0J+nK7lRnNYIdcpSQxcyvDLVZ4C0YYqaGC6ytebvVyiNoyMLiUGQo7urzTRNQtvEHc3fXIj7qPzmPY1ZBzFUeND7RCXmU3v7wVcMa+xShcCcEEfkYCyhHxQz0rygdQgGXhuPK0sy3rG3Y7SwJBJqihWFJZe9o64LkpzK/NHxFlERpqs8CnfAS4K15C/xlfPh1oZQhmBA2S5/bCpVqHTBIycVAn8Me8+ZVWaUAeSRX/AwJDgC44Kyh6lQGFCw9A2KEJNTfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB6383.namprd11.prod.outlook.com (2603:10b6:8:bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 14:48:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 14:48:19 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "alex@linutronix.de"
	<alex@linutronix.de>
Subject: RE: [OE-core][PATCH V2 1/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
Thread-Topic: [OE-core][PATCH V2 1/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
Thread-Index: AQHcYOPs2c2wy+ouQUyKL86Q/2ovj7UJcJwAgABBCZCAAAkkYA==
Date: Sat, 29 Nov 2025 14:48:19 +0000
Message-ID: 
 <CO6PR11MB560240AA6E30F940D82A5FDDEDDDA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251129035436.249679-1-Qi.Chen@windriver.com>
 <CANNYZj88Ohg3uETcRsn3FFw153XccZoziQugQirrzo+A045pEw@mail.gmail.com>
 <187C801203BAFB9C.270132@lists.openembedded.org>
In-Reply-To: <187C801203BAFB9C.270132@lists.openembedded.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=02f40afe-ed3b-4955-a32c-8abd9bd381e2;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-11-29T14:09:02Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DM4PR11MB6383:EE_
x-ms-office365-filtering-correlation-id: 9bc4be09-c1c4-4a07-f05d-08de2f565613
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y1FBVktybTFaUjJhclpEYnhZN2VyZDNmSlBNeWdoeGZYKzRjbEdxWCtRTXJt?=
 =?utf-8?B?T0FlRTFpVmxVQW9Ra295d0s5Y0kxbHdCWUJVZTlBZllNbkxTWlVrdzh4eTZy?=
 =?utf-8?B?TFdGUFZIc3dlSCtReks4NUR6Z1RvdmMxazlMdThvYzVRRzJQcStDR2JpNXFp?=
 =?utf-8?B?dGhmN05yY1RQVFcxL3ZXaUxQWWRBbzhERmUxNmhmYTVCVGhlYWtaNHJoMm9n?=
 =?utf-8?B?ZmppZGZrdnVEbGhRNEZsaE5Uek4vNmFnNnVmZGRJSWN2bUFEQkIzWVVhSDla?=
 =?utf-8?B?aE9sZG5JTWNuaDJTK0VaU2hEMjR1N0s2Q0ROaitMd0I3VE1vd2hKUG9kZGFH?=
 =?utf-8?B?KzgwTWJKT2tMVmxlaExRMzRXaVd4bWRRbVEzMUNyak9kcUR3NHJyNDl0blFn?=
 =?utf-8?B?Rk9tclJaTDhLYjJmajlRNUNoaGxTVmRBUjVEY05zZ0NHQkJ0RXVaMHpDTm9X?=
 =?utf-8?B?L2I0VUNsM0J3ZGd0QU5UenFmaHpUTjdHSVNNK0l4cUxoYy9EaC9ackN3WlNy?=
 =?utf-8?B?UStSUUk0WkM0bStDSUdPNmlzWGxrL3A0Y3dvSTNpazR1bXE2WVdaQ0lHd0Fq?=
 =?utf-8?B?aVNsN1p0OHBNMVV4ZGhHVDBjTUR2YjBzVWRVTHBQTitxbkJCWHVFVzhuTFJw?=
 =?utf-8?B?TDFKQ2hibjhwU25tbUQzYk01djR3QXltREFoWndYeWNWbm9CTXJsNFhHQTJX?=
 =?utf-8?B?WDM5NWxneXUxRXIxQ3pKOUgyaEordWNGVCtSZ0hub3dNVUlOWFltTVlXbTlL?=
 =?utf-8?B?RTR6TnFtdC9sQXkvcEhUT2VnWkpZd1g5cHRGZnd3L1p1cVVRalNjb3M2UnU5?=
 =?utf-8?B?YjhzWVVRQXpuWnZVSjg3YkpIbmZFcUZ5MDZEZVRibEs2TkhGcFdCMjFZUUM0?=
 =?utf-8?B?eGFYWjRxQ0E5R24vbVlleDM4WkoxemVyQ0pCRytmRGtNbjQ4OVRpcEhmSkdG?=
 =?utf-8?B?VG9WanZoZUVrVzI4eFhUTWliZUZValB1MFB1TGhKVnRqRTA1UFBqbjl6MFQ4?=
 =?utf-8?B?MUtHSkgwQ1ZPS2NheGh1bStON2Y4THN4eE1pWEVBanhJY0cwV3N5MlMrUXVm?=
 =?utf-8?B?NXhYV1dRSGkvbGU1UWp3ZjZBOEtiZzdWc3BSeWt2Y04rUExhU3lWMWZ2ZzAx?=
 =?utf-8?B?NkZIc1RYM05lVEYyR0cyWjVORWt0ajd5L0w5Ui84U1htZjUyNVA0czRUSnov?=
 =?utf-8?B?bnJXZ21nU2NCRnB3a2FnVWYwR2JjUEhYYWM3bDA0OHcvWkVwUitPL0VJMUxO?=
 =?utf-8?B?WWJvZTk0amV1dkxwa25rRG9sN3VpbTJ1VjB6Q2JXZXl2NmRWaldpUDRxZW9x?=
 =?utf-8?B?ajJ1YThHeU9La0FxK0N2L1pYeklhbVB0NkI5OVBPK1o4YXJrcjhzT2pXVTlT?=
 =?utf-8?B?eWF6Y3VLanIwVHNOaXdja2VaTzA2anp1eXIrRGdMVDdCMmVacUpQM2FrUzh4?=
 =?utf-8?B?alBKcXF6cVN1NlpLc29oa2dEUG5UWEY3dE9PcFpFRm1oQTJUVXAxZFc1M05G?=
 =?utf-8?B?alE3MzMrV3hpVlJ2b21qcmtJZ29ybldvSS9RTHMwSG82ekRuUDRnSFlmVC9J?=
 =?utf-8?B?SVQzcVBaMnJjR0Z2MG5yWDkwcjRtdFh2UWtPaE1uNWpkNEZXUXZmbVNONjEz?=
 =?utf-8?B?bVJIVzVBMHBXK0lTRm5ySjVGbmc4MnhtcXoraFlrWnQvSkg4a3MvZlY0WmE2?=
 =?utf-8?B?ZDg3YU5la3JBNFFGZmJRSm1WNDJVa2tkVFBkbmdQTklVNmVNRFNpNFRERHV1?=
 =?utf-8?B?UDl1alVCR1Q1dDBJR2x2VXZLRWpFZHorek0ybEZDajZKVzZ3Zmk3Z0xRWjFr?=
 =?utf-8?B?K3B1U3o1VWMxR0tLYk5zdjhCbkRvOTl3ZktLd3NtTmk2NmV6ZDlub1duYU1T?=
 =?utf-8?B?bWI3ZU5EUHUwR01yOTNlaHhCQ1FtU3U4ajl3ZzJ6ZmtqMVJYVHZKVHVBMmtI?=
 =?utf-8?B?ZTVlWlNzcDhNOEhWRVQ1RFp2bnQxVEdoZk8rOHB5RVZaa3BzMVYwcnRjRHB6?=
 =?utf-8?B?Q25sWjBhTkVIUGhsMldPV1RZUlFZT0I4empRQXZld2ExTUFiem9VSkloVXF0?=
 =?utf-8?Q?RSrUqD?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SHpIK1FRa3RGbDBPbzRTSDM3TWd1dkpVME1WUkpWVklKazc1d2RXQlJSVTFM?=
 =?utf-8?B?aFpiYjBYZXFpUXhxSEM4TTZGdE5mODFRUTdkVTBNYmlReHBIbGxpdGFBMTBK?=
 =?utf-8?B?VTVKYW1CTTRzNkVPaTdxSUpKendQNmQ0UnNLQlIra2l2RzNuQ3VEYy8wakFV?=
 =?utf-8?B?ZW5KVmFPVEV1b3NobW9xMnZ5N0hHNnFGZjhURlcrZnNrb2ZRNUNIY0J0Yjla?=
 =?utf-8?B?NjJsL3NMNGFrYW9JQjUyUzJmU2VIbVJmdWNMTU1kdmY3TVcvYUlCMXQyck5E?=
 =?utf-8?B?NmFXd1JlQUE4TW5qUGtqRVRnaTFqeVJka0U0NW1wMHBLUGpJTUFkVTh0L2N0?=
 =?utf-8?B?dnhISGVzcTN4N2VzZmI1U3dYSitBVlFlUHlIWnVpS21maTNOSWFIdGpzNVYw?=
 =?utf-8?B?c2laeWgxUE50TUk2T0FoRHZiY2F2Qzc2Mk10TUhUQVNtanlsVEhUdkR6U3M2?=
 =?utf-8?B?akFkeE43RWRpZzRXNW5ZdGdJbXNLenRocDJua0Urc2htRnlvYjhycytUek1t?=
 =?utf-8?B?UEo1MEVHQVZjYXFKZHpVN3A2UEQ2U1I2d3YyYXdCSUhpRVIxcjBSOExCVWZW?=
 =?utf-8?B?TnFkVmRjdUc2cFdwMXBZK0xCbXZSWTljaW9oejdPSkpOdHpaK2pRR3c1cS9y?=
 =?utf-8?B?NzVqSll0SUxXcTZ5eG1vWm9aSkt3OWZSaERxbzQ3MVV2WU5TdldrYnpYYk1N?=
 =?utf-8?B?OG9DMXdWRjRocVRMemtmeFM1Ynpua1laWmlBZGVPYU92VThoRGRIaWV4Rm8z?=
 =?utf-8?B?c25TUm5WWDBoWXlocng1Smc3bS9OWGRGNEthQlZMWnQxcHE4bjB1ZEVXb2I3?=
 =?utf-8?B?OGF3SDZNT01kRDRGNTZZSFdhaVNVQ1QyOUxJRXl1L0FVYkVDNU1TVFZhTUJT?=
 =?utf-8?B?WUxzZS8wZHo2elI3c0Z6elk0SW93M09NS1VGL2ZtbFdacDN3eitKcUtkMWp6?=
 =?utf-8?B?cFZnUGY1VWgra3lrTGtQVnZsMDFaYmRGY1dtb2FHbTFMRWpLRkF2UTJUYUtk?=
 =?utf-8?B?clRwVDhBQXN5TXNOcUNmQkl0RENYZlN0R3BlY0ZpMGFHM2s5L3MzRlI1TXhh?=
 =?utf-8?B?UENyVWZNZGt5UVI3RW9GNVEyVHd2RnMweFlqOEV4ZnkzNTRFams0OENwWkRp?=
 =?utf-8?B?L2N6NGxKZ001SGxNdWNkaDFRWmdKRGJ1U29USlZ0SklSRmlnVndGdzJwUzFB?=
 =?utf-8?B?c0dZWk44QUdrdndoUzQvREE4cGdtUjNRTm4yekFFS3JJUVhla085YkNFbHlJ?=
 =?utf-8?B?R0JsdGFaS005SWdoellyNXFRRFdiWGxraW04QVVLRFRSenBVQTZnVkplMHdW?=
 =?utf-8?B?RHducy9wdjZiaWtpSXIwQ3hqZzFaTTVpZXRxMGlBcGNWNUVBQWF1bHJaaUZD?=
 =?utf-8?B?Y29KVnZycUgramhZTEsxS1NYa2IzaitBVkNabDNvVXk1TUFXMEJuNlNQSlMx?=
 =?utf-8?B?VHM5Zk5ZNFhUSGtPRCtOTTVtUC8rMTlXOTN3czVlVUhtNkJBQ1lQQnNORW03?=
 =?utf-8?B?Q3U3VG5IMXpibnFLRUZERHdnZlhZbjRNZGNrSGlOb1VUeElsTzJITldTSUpY?=
 =?utf-8?B?OXFaZ2orTnBxSHArcitnV3drSWU4ZC84cytuUG16MHRQZlhjV0taRUcrWEtT?=
 =?utf-8?B?cUkxUGEyUDhOY1BSanR1OVQ5WnJmU1MzRkNZTFdyeFdwZWg1SWRSelRzeUJE?=
 =?utf-8?B?ZXZDT1pmNGpnb1Z4VE5QRGpkOU1YRUw0Y2JxdUVhREhyQ3lidCtEdm9FOTNp?=
 =?utf-8?B?Tnpld0llUUF4WUV4OUM2UGlsWGt4L052Q3dhVGo2LzVGK2htMUw4QlFjSTFy?=
 =?utf-8?B?amc5QzhyaXRwdU9RRFRMV1ZHbVpaRjZBOGV5OHc5UmFhY3pza2ZhQmdoUk4z?=
 =?utf-8?B?VkdIMDRyME04Mkdud20vUThkZ2FWZXlXRlNyR1dMOTVybUk0bUJsOE1VWXlD?=
 =?utf-8?B?SWRGZnJwVHYxVE81aHAyUkp5aFdVdStDbWJRN29rQy80SExnRTdzV25Lb003?=
 =?utf-8?B?YW1nZExPZUg3bUVGUHVhd242VFNWU0N1Z3BRQkxhbTgzdGN1NzRnOEwwMDJ4?=
 =?utf-8?B?dS9jNWN6RnRMbzAxR1BHVllZNnhFNy9rTWc5a1k1TkJDbC9EdmY1VDZTK1J2?=
 =?utf-8?Q?HB6ZEKaujBDzc0da5bBoBEyN6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc4be09-c1c4-4a07-f05d-08de2f565613
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2025 14:48:19.0995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tfb2y7yCS7amGhRHFzb5l0EWzA9q/FRyPFCIAxxDUgxXnrbzvs0VTvLJmFzBE2YNvJKenAMCcyOHpDzUJGdd4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6383
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: JF7PoRP-qBXe2avzMZV7JUKTWRg4nRm5
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=692b07b5 cx=c_pps
 a=Cwg/eoBiIzPoLCvUJpemAw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=im-Hsh5PK0DiOE0_9y0A:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lVzOiFSoy8huh8XgXVjsMOuR3dyeYrQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExOSBTYWx0ZWRfX+GnU/6DHlDxP
 SPPdI4uF0dMDTRwTI7vXNwRxVeD2yucuaXiIYD+2pN4n1xS6LBdZB+3Q8Fy13vizIum5g8FIWn3
 hMhwfLNT37ibqDSTfIWnTf7onGLsS/NtxqrVr0CkyICjzp+88GUEodLJBuYiVrvBdm7+pkKWCXa
 jzZxbaWlBtpoqxFtLN5BaP+HkDFGs2jws9M2b22vxLVNRO1LlLN4x2DpZLZ5tsSkFkanbHVzyaV
 M8SgPhymu9TR/6w0G916Ehu0WLzBf8C+vxpvFSS2iv+R80uQLMqkla28IlPNj1UAj61K7B1qe1o
 6f9UCqDLc5X0/uuI3dmVcyZiFRSBmyAGAXsbjwyQOqHdLotMoPL1Jhdf++jlV8DutG4rzAnO1zO
 Q7Rct+xYpcoy7ibim5El+5kw9QMYGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 14:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226940

SGkgQWxleCwNCg0KVG8gbWFrZSB0aGluZ3MgY2xlYXIsIG15IG1ham9yIGZvY3VzIGlzIG9uIHRo
ZSAnbm8gcGFzc3dvcmQnIGJhbm5lci4NClRoaXMgcGF0Y2ggaXMgdG8gZW5zdXJlIHRoYXQgdGhl
IGJhbm5lciBpcyBub3QgZGlzcGxheWVkIHdoZW4gbm90IGFwcHJvcHJpYXRlLg0KDQpJIGNhbiBh
Y2NlcHQgdGhlIGJlaGF2aW9yIHRoYXQgJ25vIHBhc3N3b3JkIGZvciByb290JyBpbWFnZSBmZWF0
dXJlIGVycm9ycyBvdXQgd2l0aCByb290IGFjY291bnQgbWFuaXB1bGF0ZWQgKHRob3VnaCBJIGRv
bid0IGxpa2UgaXQpLiBJIGp1c3QgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIG1ha2UgdXNlcmFkZCBy
ZWxhdGVkIGJiY2xhc3NlcyBhY2Nlc3NpbmcgSU1BR0VfRkVBVFVSRVMuDQoNClBsZWFzZSBnaXZl
IHRoZXNlIHR3byBwYXRjaGVzIGEgc2Vjb25kIHRob3VnaHQuIElmIHlvdSBoYXZlIG90aGVyIHN1
Z2dlc3Rpb24sIHBsZWFzZSBsZXQgbWUga25vdy4NCg0KUmVnYXJkcywNClFpDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBC
ZWhhbGYgT2YgQ2hlbiBRaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU2VudDogU2F0dXJk
YXksIE5vdmVtYmVyIDI5LCAyMDI1IDEwOjE5IFBNDQpUbzogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZzsgYWxleEBsaW51dHJvbml4LmRlDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BB
VENIIFYyIDEvMl0gcm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNsYXNzOiBmaXggYWRkaW5nICdubyBw
YXNzd29yZCcgYmFubmVyDQoNClRoaXMgY29tYmluYXRpb24gaGFzIGJlZW4gd29ya2luZyBmb3Ig
MTArIHllYXJzLiBJIGRvIGxpa2UgYmFubmVyLiBCdXQgaXQncyBzb21ldGltZXMgbWlzbGVhZGlu
Zy4gU2VlIHRoZSBleGFtcGxlLiBUaGlzIHBhdGNoIGlzIHRyeWluZyB0byBtYWtlIGl0IG5vdCBt
aXNsZWFkaW5nLiANCg0KSSBkb27igJl0IHRoaW5rIGVycm9yaW5nIG91dCBpbiB1c2VyYWRkX2Jh
c2UuYmJjbGFzcyB3aXRoIHNwZWNpYWwgY2FzZSBpcyBhIGdvb2QgYXBwcm9hY2guIFdoeSBzbz8g
SSBkb24ndCBzZWUgYW55IHN0cm9uZyByZWFzb24gdG8gYnJlYWsgcHJldmlvdXMgYmVoYXZpb3Iu
IEFuZCB0aGF0IG1ha2VzIHVzZXJhZGRfYmFzZS5iYmNsYXNzIGJ1bmRsZWQgd2l0aCBJTUFHRV9G
RUFUVVJFUy4gDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQpTZW50OiBT
YXR1cmRheSwgTm92ZW1iZXIgMjksIDIwMjUgNjoxNiBQTQ0KVG86IENoZW4sIFFpIDxRaS5DaGVu
QHdpbmRyaXZlci5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZzsgYWxleEBsaW51dHJvbml4LmRlDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIFYy
IDEvMl0gcm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNsYXNzOiBmaXggYWRkaW5nICdubyBwYXNzd29y
ZCcgYmFubmVyDQoNCk9uIFNhdCwgMjkgTm92IDIwMjUgYXQgMDQ6NTQsIENoZW4gUWkgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPFFpLkNoZW49d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gSXQncyBwb3NzaWJsZSB0aGF0IHVzZXJzIHVzZSBFWFRSQV9V
U0VSU19QQVJBTVMgdG8gc2V0IHBhc3N3b3JkIGZvciANCj4gcm9vdCBvciBleHBsaWNpdGx5IGV4
cGlyZSByb290IHBhc3N3b3JkLiBTbyB3ZSBuZWVkIHRvIGNoZWNrIHRoZXNlIHR3byANCj4gY2Fz
ZXMgdG8gZW5zdXJlIHRoZSAnbm8gcGFzc3dvcmQnIGJhbm5lciBpcyBub3QgbWlzbGVhZGluZy4N
Cj4NCj4gQXMgYW4gZXhhbXBsZToNCj4gSW4gY29uZi90b29sY2ZnLmNmZzoNCj4gT0VfRlJBR01F
TlRTICs9ICJkaXN0cm8vcG9reSBjb3JlL3lvY3RvL3Jvb3QtbG9naW4td2l0aC1lbXB0eS1wYXNz
d29yZA0KPiBJbiBsb2NhbC5jb25mOg0KPiBJTkhFUklUICs9ICJleHRyYXVzZXJzIg0KPiBFWFRS
QV9VU0VSU19QQVJBTVMgKz0gIiBwYXNzd2QtZXhwaXJlIHJvb3Q7Ig0KPg0KPiBOb3RlIHRoYXQg
YWxsb3dpbmcgJ2VtcHR5LXJvb3QtcGFzc3dvcmQnIGltYWdlIGZlYXR1cmUgKyANCj4gc2V0dGlu
Zy9leHBpcmluZyByb290IHBhc3N3b3JkIGhhcyBiZWVuIHdvcmtpbmcgc2luY2UgYXZhaWxhYmxl
LiBUaGlzIA0KPiBwYXRjaCBmb2N1c2VzIG9uIHRoZSBiYW5uZXIuIFdlIHdhbnQgdG8gZW5zdXJl
IHRoYXQgaXQncyB0aGVyZSBvbmx5IA0KPiB3aGVuIHJvb3QgcmVhbGx5IGhhcyBlbXB0eSBwYXNz
d29yZC4NCj4NCj4gV2UgbmVlZCB0byBlbnN1cmUgdGhhdCB0aGUgZnVuY3Rpb24gcnVucyBhZnRl
ciBzZXRfdXNlcl9ncm91cCBmdW5jdGlvbiANCj4gZnJvbSBleHRyYXVzZXJzLmJiY2xhc3MuIFRo
aXMgaXMgYmVjYXVzZSB0aGUgY2hlY2sgaXMgdmFsaWQgb25seSBhZnRlciANCj4gdGhpbmdzIHNl
dCBpbiBFWFRSQV9VU0VSU19QQVJBTVMgYXJlIGRvbmUuIFNvIGNoYW5nZSB0byB1c2UgOmFwcGVu
ZC4NCg0KSWYgeW91IGFyZSBzZXR0aW5nIGEgcGFzc3dvcmQgZm9yIHJvb3QsIHRoZW4gd2h5IGF0
IHRoZSBzYW1lIHRpbWUgeW91IGFkZCByb290LWxvZ2luLXdpdGgtZW1wdHktcGFzc3dvcmQgdG8g
ZnJhZ21lbnRzPyBBcmVuJ3QgdGhleSBjb250cmFkaWN0aW5nIGVhY2ggb3RoZXIsIGFuZCB5b3Ug
c2hvdWxkIHBpY2sgb25lIG9yIHRoZSBvdGhlciwgYnV0IG5vdCBib3RoPyBZZXMgdXAgdG8gbm93
IEVYVFJBX1VTRVJTX1BBUkFNUyBzZXR0aW5nIHRvb2sgcHJpb3JpdHkgb3ZlciB0aGUgZW1wdHkt
cGFzc3dvcmQgc2V0dGluZywgYW5kIGdhdmUgeW91IHRoZSBkZXNpcmVkIG91dGNvbWUsIGJ1dCB0
aGF0IGRvZXMgbm90IGluIGl0c2VsZiBtYWtlIHRoZSBjb21iaW5hdGlvbiBhIHZhbGlkIGNvbmZp
Z3VyYXRpb24gd2l0aCBhIHdlbGwtZGVmaW5lZCBiZWhhdmlvdXIgdGhhdCBuZWVkcyB0byBiZSBw
cmVzZXJ2ZWQuDQoNCkFsZXgNCg==

