Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E4CC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5419.1783506577898407044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 03:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DhJcRCSm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16494de7e3=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688BW9E3477835
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 10:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=iN84wMxRsLN8kB16j5FQDO
	pAb/ojeyucwUCsZ2MHpjc=; b=DhJcRCSmPdsnZGs/xaRPqrE6bk/3QVoTvQDHAt
	oRzpa6BZZdYJ9X4Fzt+lGKbPoBH6MGG/Fc55Gv5tOzz2kGCMY4Cujc206lrvdFLP
	KT0nnn5OALLZCli/GxP/3SWtaak6KmGZ+bNRpc1X0SWyWsIFS4VpVqE11NE7+8+J
	IXts9CE+h4TsbQFUIDBMoZQBUqjwOhmyYqvLPjW24qr5/WgP1u/Uvq+WqgK2dSOM
	D+x2zphRcmIVNH5/QrbMluy5bzeBhiEwqVUX5n1eLdO3uEyvtGISOkY1evAE40JA
	hobCzM5zpA3j+TwBAWSTK1nj72nbslBY6DsR+mXEk2g81MjQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011007.outbound.protection.outlook.com [52.101.57.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6s58e2er-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 10:24:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKN3HUK8aH/ma9fEUlziUgC9XyFuYxD8Iv+6ptaZ6BGUgp2hTyKU/HoACoACjChwCUQV7Jx5S1FpPm60/WXNAl9mD3695/i9rq0eNaVoH0wFUbKAoV1KawrPH2LUL5aBsa//cK+CQSEp3aHuwDkG0oiy5j/DA0a4BFG6hj3gugHrciUINWEvc33sMyE0NhDg9aTQFKt7Zf0S4mroYABj6s4ovEcD+cNlIc7rIKr3dNIXwB7NY4Z/Cqfr5diMhGsrS3pgSv6sMtyMr7V5iR8gZR27czyqrsUlpQMypjC9pbMS/7RN0cWJOohfWKJuK3vsTvY4GLyvijUvs4N8BUaURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iN84wMxRsLN8kB16j5FQDOpAb/ojeyucwUCsZ2MHpjc=;
 b=Y5BkIqY8vzLzo6L5tdhR1yVfnywR22IkLogGLOvYgUOjQDesBeEgxR/jPlQatipuvsWRfgvd9+qCOKar9uVEKQM2jmxyKznTEvLh+4oGZhVWeHrrw3c5jk09ErARdQ6EN115IiCSyD1t2xuBwF3vI3/ZDJ9hmRxTYlNjeC3l0B8zxxOb9HgxkgBO2QNuBelYTJ5ejodFuu7mJ7MfzeSEJ8a2TfFNf618BmvPUOiOHzDz4L9tNVtinoQPiRxEY+2j83vc3ofiKF6CwS+FmtwqhxDhsSbZbwu1HAH2GXJolaRZVGGzti5XGoKm/v17anmjdwIN6wNjDmU+fdXh2zzfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 by IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 10:24:33 +0000
Received: from CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec]) by CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec%5]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 10:24:33 +0000
From: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "tgamblin@baylibre.com" <tgamblin@baylibre.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "Komati, Shiva" <Shiva.Komati@windriver.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgrade 10.0.5 -> 10.1.2
Thread-Topic: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgrade 10.0.5 ->
 10.1.2
Thread-Index: AQHdDrtqh1m4Mbp0E0KuL5mQygG9GLZjYZOAgAAIdH4=
Date: Wed, 8 Jul 2026 10:24:33 +0000
Message-ID: 
 <CH3PR11MB8774FCDCE3E2497D8793893B8FFF2@CH3PR11MB8774.namprd11.prod.outlook.com>
References: <20260708092252.1211669-1-HimaniRamesh.Barde@windriver.com>
 <20260708092252.1211669-3-HimaniRamesh.Barde@windriver.com>
 <DJT3J5GX38YG.338OF4LLBVU92@bootlin.com>
In-Reply-To: <DJT3J5GX38YG.338OF4LLBVU92@bootlin.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-07-08T10:24:32.615Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8774:EE_|IA3PR11MB9256:EE_
x-ms-office365-filtering-correlation-id: 4de2ba07-846e-4c50-06f3-08dedcdb1a84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|4143699003|8096899003|11063799006|6133799003|56012099006|13003099007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 5DNm8XuK6/oWST8i+1MprUAV+Ca7Wmb8rMHRUsJnEOaOkSmsabEN2du56MSHmTcMQrZO6+sF2fmA9T94vRozhefMvH4nr2t/wSyBANE9GyAVzuU1C4s9hM3KyG33Lp8yQYDtjbEekHDnnr6QgtMgVux405/43IU8T/JCZor8ZGOodfOyLLAl0oLlyKV8VkwGk05XOtqudxLzJf2hy55VE4OYgKp5On17hrcRDAumQi1/DaYacokpkGJTQT470IRSGwOB1ots96fTz5wRn3MrmKJVTwT5R6BfHZsf+NUVyPLCocLZ5DixLYygdIuYM7ojJZR6SER7BOtCLc8f49jNv9rPmXPq/j2K/BrcQdQgy2NaJT+9PTT8ifNkidWAgECS8puZzkC/I+/YffJlyZvKYV/aVf462HDujQ027OjpJ7FdYhHpRpRLy2sOJw8HBiSrAXsrbyF979imfanBr8RKjRBD3SDSFXQz8UwMRs4iSTt2th17qkuUmwQY+ggAM4PGeSAgbchDDTLJOExlXRNUlWrIXmkEmL12L96XjsqZtmeXhE2WYRJnls8LGWOlNxP3IZIDAqEP+KhVHBNhVOGY3/a5etcUvF2FGn0EA3DgytWt8/hhd0x5cxjI8R9LkxyM2BBtp/Z8v1eBGdNfDgtDrnOyQEZUpd+4vhKsoBlqwJk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8774.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(4143699003)(8096899003)(11063799006)(6133799003)(56012099006)(13003099007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?05Zg5AS2L4mO+tpgRh4iBa4hwWbrKQFzqjYrpst4bA91iUtcoLwjvMjFwXq6?=
 =?us-ascii?Q?6qa21FTM2+KPneJio1egsqs+Xxb+CeX5ydvwH778jyUooPbk56Z/AIDOYaDm?=
 =?us-ascii?Q?ipIz1i8I12VmvkMNZeaLyf57PBgHPsyJ/6nyiP8HEjo/IhcVmGtZGAtW2m/y?=
 =?us-ascii?Q?jhpCgmf1kvKoUOIkVwplLDVOVq8+5Aq0gAuPZK/p9W85HXQ9ZfT0VTpC0ro+?=
 =?us-ascii?Q?rdItLIXMSKP7S+RAooiyT6GFmZ9MPiSD8MqT+FDRR1RvD3Wnv1Xpb5ggsv10?=
 =?us-ascii?Q?qlrZPcfoQ4SaQcP6NjDdBSxycQoYgPA4/yHOcGjh3o+4FId5/JYz7LMnaYBe?=
 =?us-ascii?Q?Sbajxm1RN3Agh0sd2BjwSrAxHzgTIhtned0IJ4KL4bwnqenkoK5q484BGlqJ?=
 =?us-ascii?Q?G4pNZvxh23RC9wpfx/tnNEqw+zOU9xND5S4da+Ozq+4qzy/Fux4e9FxEmz/u?=
 =?us-ascii?Q?ohilWmrTTt9akT/H2rRvcJahiPvHlJ5X+5gpcRTov2NFVkeXDDbSSDpEeoER?=
 =?us-ascii?Q?Tsx24//umYMY716EIOGcxtSyGR4vyMpzMQ1uTxTPzqsOrenqA+neo0i4gSFW?=
 =?us-ascii?Q?m9hRzawkfd4523gsJICBCMkz49J9zOrw/0sGl1WEOjxOGUAzAqN22aaEBmTd?=
 =?us-ascii?Q?R1eZHnKDt/alu0H0S5EThw+vz6vuhOkY/tfGtEH3x3LORVZr57H4k9GR48UG?=
 =?us-ascii?Q?20T4AdZ8ImmDfLFv1EbJhVbZVokbt2haSyjd5+Fw3oEQw5W1b1H2nSRTGA6/?=
 =?us-ascii?Q?QHXIWfcYx2605NxHPdAbYtcIIlpfX4Xf6n+D+u0SRj1TeWlyruZhqa1OYBp4?=
 =?us-ascii?Q?NfaU65aN21zhsKN5GdyKbrCdQYOTU16fbp5kPQvGEJHCytJsH0VhOlXD84QW?=
 =?us-ascii?Q?jAscjWWQkzzljk2zZSwrLrH83KlkWiD3zO2/N6y6ornB27V125AhZqSDGnzg?=
 =?us-ascii?Q?x7KXYoi4x5gM0XhT7AKNOlhCUQYMvD1l8/wY0IoRies0efQoqhKLoHZsZKZ4?=
 =?us-ascii?Q?5cFtwBjfxmFtVGHxNvjbn/j/hZZHYtFC367BwVwT2n1Eo9kYTU9yN05rFEEr?=
 =?us-ascii?Q?JIHYkeNx4yt2gw7zCYAWZTTqgKoutmnzfZ46ymqKLEAA9iSqAvJxxdFToTSR?=
 =?us-ascii?Q?03tSHpG7ZAaVX6OBqI7MJ8BFQr0yu8ZsyMZ2U3fhAFSu4MDKe8EXdjwVLbLb?=
 =?us-ascii?Q?AC2KMh0VcS//Ph56HX9hIDLEEXHq2nF2xmlgYjyEhnbZA+ccU2GIoFzAFiW7?=
 =?us-ascii?Q?fCrDkA/yerGUdfVNH2eki9UiKjyl7g4XpacATvTNpgMzXK5mq1wEgT9iM/Q+?=
 =?us-ascii?Q?ujZ2cbMyPtiFpt4OQyJEoDa7apHbQh8XnaZ8wy1N6hIWbByv3mjNYT1ySH07?=
 =?us-ascii?Q?1BK0FEtK+ATTlVgnnfadqjofHDwuEB3EFmd7BJn/bE15oERkKQDVtJlG67fE?=
 =?us-ascii?Q?/Bv4W1OxIfQ4kLuL6420+jnKu18Y3zZOCWhgITHWk6MiWbfPTQtoK1fNJqaJ?=
 =?us-ascii?Q?mcx28i5cRYHsklE/fKgW2S0Tsm60nDvuqmlGwptWPrLTkQtzMFhXkBmumZ2L?=
 =?us-ascii?Q?pv9v39tdKV7SuqDpY29FN8Vws6MxqYWxMCoNKFWiPRZ8uG3+7jzBEXkzeLBX?=
 =?us-ascii?Q?OPs6UZtJs9P32F8K/aumAbEKHGBhy5RTiIYSY/ObQ3H3Ruux4Z2tXgyOTZ6j?=
 =?us-ascii?Q?sza9PaOXYhAfBicca56bZ4e1NzWQ8xEYPMrSGCV3qhNiLTixgFhGFBvEuYY+?=
 =?us-ascii?Q?MgtEEd7IPsWGnY1KqDZvBkyi3E6ROO28FnjnNSLgMDwTkQFWR8M16wASDft9?=
x-ms-exchange-antispam-messagedata-1: NKhGLqm3vfm86dGD9c9fVBLHpZ94x7k3P0M=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	d9wvfAEWpv5k4qbUGP4V5xMdDc+SAFUAyBn5h924V2GSIlzouck4l9Mo9x6XYIqLJ7beZ1eCA/bzejbU31bVC7xjlGETMGjF2PZuVj9dvq1zSS/ghzBzgJHpKi/G4wcsF5kn0zAxrOOYidm9f+qcMAzueYHLdxPVuWsdLbDoU5uoeUxtIcSfhtc4/OapJQFg+fKH11rjA7PKWzTLYVLvehC9zqVnvsH0jBm48CyAFyFpyoy6mBIaZJTfiSpCqGLcwG9OBY6QXZA2h5EUYI3R9mUB9ejQTQZo1oVOfgALCDpQzkIPCzPFGdEG6vkPkgM7OIrLBHNBmYkTme0JrrdA7Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de2ba07-846e-4c50-06f3-08dedcdb1a84
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 10:24:33.3984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QNsfUivGKRcflJY84LVJooKLMrYI1hNYiL7HuKuNPsTmq0dbeEiJD30BETBoZu3I7CJVVKQfvYg63yz52sXztCWPI6QVK7fGjfgl5NXAfOh16PnSN9bRFZF267Z9tyL2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9256
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwMCBTYWx0ZWRfXzNZokQRRbPX5
 CnQWmwbFOPf/io+CwrnTa9ckm+NLJDGha1tiIU6YtiZvAn8GYvF7/ZXtGsh3v/2sPnNkrAwGDrM
 Az39KytZo7v659ug37AkPl0QJQ0d/lZH/s5XE5P5FoAIyDZwbPKM
X-Proofpoint-ORIG-GUID: GzSY_wLg5GqjCedbQnue_8uIUkjTRHgy
X-Proofpoint-GUID: qPT-DqG8jem-ipFJouLo7U8jRS2MCt6X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwMCBTYWx0ZWRfX+n/2Sz1CxgmM
 17ZMXx3sMjCdGA9i8dRHLWF/5/P3VxG5UDc4Huw07wckspF1ISen3CAobB7uVrRaqnafF2OVZkS
 yAxg4SwFcf7SGQ+kUVunpsB1d75gDpLZIkCWu2EJBTiT9th/xg0VFNBXwv1bxP4436Dv+WLXnkv
 U7th0m9Y8QlM2SZfcDgn8jHLeu5juO8/zx4Hs7VyW6bo0Sirbd0OHsriEfo4amP3K+Pzt/m7tEb
 UkwvPjQGb5J8qQz7dGWSY0v43WdNCoCmjXKxpOot2N8VGJRSpCo8Py2pGMmYnTekYgAqD6u69PH
 n7X8g89Y6q1+ULD0/MNUaRgHerfafhwfKgEqJBEFaiTEIqnmNs65Bq0P97mnepP5ifrxA83zrdB
 z2oeXmlES4NIPds2DvibV19nE68Hd2rR8eOdznbbFO04pEGX9AGtjsEMtvhUUvI6k9AItlBsmeV
 sJxNmi5aeJY9yFK8whA==
X-Authority-Analysis: v=2.4 cv=H5frBeYi c=1 sm=1 tr=0 ts=6a4e2565 cx=c_pps
 a=0xEX3eBh0rLUWVDLTvkg2g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=IpJZQVW2AAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=CjuIK1q_8ugA:10
 a=XEmafX2Io4736B40:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080100
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB8774FCDCE3E2497D8793893B8FFF2CH3PR11MB8774namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240463

--_000_CH3PR11MB8774FCDCE3E2497D8793893B8FFF2CH3PR11MB8774namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thanks for the pointer. I'll drop patch 2/2 since Alex's upgrade to 10.2.0 =
supersedes it.

However, patch 1/2 (exporting SETUPTOOLS_SCM_PRETEND_VERSION) is still requ=
ired - setuptools-scm 10.2.0 will fail at do_compile the same way 10.1.2 di=
d, since it still probes SCM metadata via vcs-versioning when built from Py=
PI tarballs without a .git directory. Alex's upgrade will need this fix as =
a prerequisite.

Thanks,
Himani
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, July 8, 2026 3:22 PM
To: Barde, Himani Ramesh <HimaniRamesh.Barde@windriver.com>; openembedded-c=
ore@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: tgamblin@baylibre.com <tgamblin@baylibre.com>; MacLeod, Randy <Randy.Ma=
cLeod@windriver.com>; Komati, Shiva <Shiva.Komati@windriver.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgrade 10.0.5 -=
> 10.1.2

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed Jul 8, 2026 at 11:22 AM CEST, Himani Ramesh Barde via lists.openembe=
dded.org wrote:
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> ---
>  ...etuptools-scm_10.0.5.bb =3D> python3-setuptools-scm_10.1.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-setuptools-scm_10.0.5.bb =
=3D> python3-setuptools-scm_10.1.2.bb} (89%)
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.b=
b b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
> similarity index 89%
> rename from meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
> rename to meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
> index 58eb963910..824758e3ee 100644
> --- a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
> @@ -6,7 +6,7 @@ argument or in a SCM managed file."
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D838c366f69b72c5df05c96dff79b3=
5f2"
>
> -SRC_URI[sha256sum] =3D "bbba8fe754516cdefd017f4456721775e6ef9662bd7887fb=
52ae26813d4838c3"
> +SRC_URI[sha256sum] =3D "24079818acc46e99aae0d65b8d511fafe965970d9cbd060c=
7b9f7275ded520fb"
>
>  PYPI_PACKAGE =3D "setuptools_scm"
>

Hi Himani,

We already have an upgrade to version 10.2.0 on the list:

https://lore.kernel.org/openembedded-core/20260706171701.70536-31-alex.kana=
vin@gmail.com/T/#u

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_CH3PR11MB8774FCDCE3E2497D8793893B8FFF2CH3PR11MB8774namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Mathieu,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the pointer. I'll drop patch 2/2 since Alex's upgrade to 10.2.0 =
supersedes it.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
However, patch 1/2 (exporting SETUPTOOLS_SCM_PRETEND_VERSION) is still requ=
ired - setuptools-scm 10.2.0 will fail at do_compile the same way 10.1.2 di=
d, since it still probes SCM metadata via vcs-versioning when built from Py=
PI tarballs without a .git directory.
 Alex's upgrade will need this fix as a prerequisite.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Himani</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Wednesday, July 8, 2026 3:22 PM<br>
<b>To:</b> Barde, Himani Ramesh &lt;HimaniRamesh.Barde@windriver.com&gt;; o=
penembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openemb=
edded.org&gt;<br>
<b>Cc:</b> tgamblin@baylibre.com &lt;tgamblin@baylibre.com&gt;; MacLeod, Ra=
ndy &lt;Randy.MacLeod@windriver.com&gt;; Komati, Shiva &lt;Shiva.Komati@win=
driver.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgrade 1=
0.0.5 -&gt; 10.1.2</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Wed Jul 8, 2026 at 11:22 AM CEST, Himani Ramesh Barde via lists.openembe=
dded.org wrote:<br>
&gt; Signed-off-by: Himani Ramesh Barde &lt;HimaniRamesh.Barde@windriver.co=
m&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...etuptools-scm_10.0.5.bb =3D&gt; python3-setuptools-scm_10.1.2=
.bb} | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&nbsp; rename meta/recipes-devtools/python/{python3-setuptools-scm_10.0=
.5.bb =3D&gt; python3-setuptools-scm_10.1.2.bb} (89%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.=
5.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb<br>
&gt; similarity index 89%<br>
&gt; rename from meta/recipes-devtools/python/python3-setuptools-scm_10.0.5=
.bb<br>
&gt; rename to meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.b=
b<br>
&gt; index 58eb963910..824758e3ee 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb<br=
>
&gt; +++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb<br=
>
&gt; @@ -6,7 +6,7 @@ argument or in a SCM managed file.&quot;<br>
&gt;&nbsp; LICENSE =3D &quot;MIT&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3D838c3=
66f69b72c5df05c96dff79b35f2">file://LICENSE;md5=3D838c366f69b72c5df05c96dff=
79b35f2</a>&quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;bbba8fe754516cdefd017f4456721775e6ef9662=
bd7887fb52ae26813d4838c3&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;24079818acc46e99aae0d65b8d511fafe965970d=
9cbd060c7b9f7275ded520fb&quot;<br>
&gt;<br>
&gt;&nbsp; PYPI_PACKAGE =3D &quot;setuptools_scm&quot;<br>
&gt;<br>
<br>
Hi Himani,<br>
<br>
We already have an upgrade to version 10.2.0 on the list:<br>
<br>
<a href=3D"https://lore.kernel.org/openembedded-core/20260706171701.70536-3=
1-alex.kanavin@gmail.com/T/#u">https://lore.kernel.org/openembedded-core/20=
260706171701.70536-31-alex.kanavin@gmail.com/T/#u</a><br>
<br>
Thanks,<br>
Mathieu<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH3PR11MB8774FCDCE3E2497D8793893B8FFF2CH3PR11MB8774namp_--

