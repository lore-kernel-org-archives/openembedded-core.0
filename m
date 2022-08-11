Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB6AC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 15:26:30 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.53])
 by mx.groups.io with SMTP id smtpd.web11.7866.1660231581213977574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 08:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=UK+iFAuE;
 spf=pass (domain: elektrobit.com, ip: 40.107.96.53,
 mailfrom: simone.weiss@elektrobit.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Cguucr7AF8R0fBa94TnZQP/jerFdSwvtjkuKXT3J4Em3zpwrl5cqnrYny/W0fSyDey+hZw+J2MdfwQd8nQtwU5QPtJcXxvzIdt1N/q4Z2Xgrm3I03rlUAFN0AlTUyc5lHANC07mdk0z8VzeW3XGzhiUlnDdsutbzynQrXxR3R5x2NIA54pbVAuJ5vAyp0uCu/PdS1XBr9oni8pXRwXt8k8Ju1G5PGvRubNFAD0ng8ySMy/kIWf4QZlAT4F6VryrgyeBVSGa3Niuwr1siCDnpHCoD1aZTttwZuE1aV9D0dYZsmKlnBP1rUJCzHfP1HzEMLR2iASXW61WSnDWYWD8aoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CysdpHPgSKt9qOUKut2aezVdN206Quz1O2vWu62PBng=;
 b=GwmWM7f0cqabLRxIHHmZReIwzx7pZVrrUzvDj1hD47zheVywx9p87R4DyKyDmZEq+pT4btzlPicO9yc69xZY58M1Blq7Gh47jAWTIA3wc3EgORcPcmCuiI6t9fy2fn+eR1DZh1J9vdOP2Do/Wak8eG6HKzxx1n/r1pjl/QBFg9IBba3QGq8eOUSfpD9k+t00SCi7PfrgPYbeWjZdev12RyGNMZWBTJnUESZ8sINxPWEsdI2NN5JzguUdKBlw3dBJ061/DHslGstKUuKXjMQ/h36wncZN5nmfj7d+NCiWLQPnMvnQkudzfrMY+5cyG0n0XINWhmyHnPuEIK43wtNsSA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 4.79.107.243) smtp.rcpttodomain=gmail.com smtp.mailfrom=elektrobit.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=elektrobit.com;
 dkim=pass (signature was verified) header.d=elektrobit.onmicrosoft.com;
 arc=pass (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dkim=[1,1,header.d=elektrobit.com] dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CysdpHPgSKt9qOUKut2aezVdN206Quz1O2vWu62PBng=;
 b=UK+iFAuEPtQmGFA2JoKvPrvkquMnsCaRmC6FW+XJdhvqluLXZdlpzjCu8Xpc2XDgpr6pm55aVlbeItQs/XMkQ30EnU4sDMfW9v6zqfzMaK9iutgivXT0cJHBQLyj9oLn18YH0QnhdzBvKd4lSK8xdWMM5vsX9X99l883ubTJ4sk=
Received: from MW4PR03CA0294.namprd03.prod.outlook.com (2603:10b6:303:b5::29)
 by PH0PR08MB7763.namprd08.prod.outlook.com (2603:10b6:510:f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 11 Aug
 2022 15:26:18 +0000
Received: from MW2NAM12FT007.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::7) by MW4PR03CA0294.outlook.office365.com
 (2603:10b6:303:b5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16 via Frontend
 Transport; Thu, 11 Aug 2022 15:26:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=fail action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 MW2NAM12FT007.mail.protection.outlook.com (10.13.180.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.7 via Frontend Transport; Thu, 11 Aug 2022 15:26:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2171.outbound.protection.outlook.com [104.47.51.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
	Thu, 11 Aug 2022 08:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgL0UtA/S2IvjWRXOOQriwyPsWrdMcEHFhvqFAHhhNKk0nnd2eg5bCUs3MFln7INErbK+tTtZEPCKma6qZYv9OGenoj16ZjzMogHsbJa5yF6FPvU16X/thGKHzgvobPHnA6gpiEdcMICK2B9rKvhfI2uYd6MpZkePGGgJ1h9nVYK938PSS2/JGIB9bqzRWxR1PLScWgjB4oEM6GnJFhB4FHc63gUyJ8lS83IcCEM1gVsU5+hosCpYiSOgxCe7UGNzdYPzHdwtECA8IcQFmRBuYLUeViyToRF9te0YMXW0DE02NP8Vqd6ydESN/YXhot/o5+N486/MkHy2vukp8jKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CysdpHPgSKt9qOUKut2aezVdN206Quz1O2vWu62PBng=;
 b=ePZcoqfjTkoybG9eDjO2laG90nvwgZn0awp6jUwokvmWg1XfMyqVPNtAImwl9zanolSoxVc17J/Q7A8nPkqvCqsI9wNbj4U1mVQuX4PtSEAJIgWybqi8jWewtZCpY6pvFLNZE7QxH3TLuNq4S9qEu+g17arvBX+R+6a4enrrLpB2Go6AKJZYKuZNdjcsKk/TEYFvw5uO+fmhPmnCy5EbMU2+6bc2kapP+Rkq9fKsSs0qOLgks/RDMj/B3gPucvzzcFJJYBf4k9uTBoE5LSN2yW9gjga32vNIt4zew7S7pyQqZQsJtjsmy3ysYzk8opLPYQg9yftQ3NAnEjAB5KtUPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=elektrobit.com; dmarc=pass action=none
 header.from=elektrobit.com; dkim=pass header.d=elektrobit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CysdpHPgSKt9qOUKut2aezVdN206Quz1O2vWu62PBng=;
 b=UK+iFAuEPtQmGFA2JoKvPrvkquMnsCaRmC6FW+XJdhvqluLXZdlpzjCu8Xpc2XDgpr6pm55aVlbeItQs/XMkQ30EnU4sDMfW9v6zqfzMaK9iutgivXT0cJHBQLyj9oLn18YH0QnhdzBvKd4lSK8xdWMM5vsX9X99l883ubTJ4sk=
Received: from PAXP195MB1231.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1a3::10)
 by GV1P195MB2151.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:80::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 15:26:04 +0000
Received: from PAXP195MB1231.EURP195.PROD.OUTLOOK.COM
 ([fe80::39a6:d143:582e:fa67]) by PAXP195MB1231.EURP195.PROD.OUTLOOK.COM
 ([fe80::39a6:d143:582e:fa67%7]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 15:26:04 +0000
From: =?utf-8?B?V2Vpw58sIFNpbW9uZQ==?= <Simone.Weiss@elektrobit.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Tomerius, Kai"
	<Kai.Tomerius@elektrobit.com>
Subject: Re: [OE-core] [PATCH v2] json-c: Add ptest for json-c
Thread-Topic: [OE-core] [PATCH v2] json-c: Add ptest for json-c
Thread-Index: AQHYrVuhbV8NFSd1AkqAfg6UlyyjC62p0p6A
Date: Thu, 11 Aug 2022 15:26:04 +0000
Message-ID: <2465e917a63704c5acf072d6c9183f9a8e1d25b3.camel@elektrobit.com>
References: 
 <5c34f311-8120-42a8-bfe7-18c90a5fabd6@denue6es010.ebgroup.elektrobit.com>
	 <CANNYZj_6O9M+VC+1Z3YLFwqppQR3Ns8d9P523JuAjiM-mh33RA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_6O9M+VC+1Z3YLFwqppQR3Ns8d9P523JuAjiM-mh33RA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=elektrobit.com;
X-MS-Office365-Filtering-Correlation-Id: 3205a0e9-8f2f-4878-9ec0-08da7badd5c8
x-ms-traffictypediagnostic: 
	GV1P195MB2151:EE_|MW2NAM12FT007:EE_|PH0PR08MB7763:EE_
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zUBI9xZUHlWqiZHifsVjahx9uyf9A40i+hvwzWjNvYsnd1AJSKLV1s+WCWYJSZz1cutua+lmUPKZMwYrQJYgIDdxQw1zX34hyHy6ik8ClGI4fRturVhBT6OHvYYmFNLbyUMAy+NsQRKDtAYrS4M2EWRcZt1o5d1wiJO98/6gJ05sh4uumy0Fon73dBsk3MQ30EgqOQkjV/FNkRJPl4vGLNXLOYfNjyZ/btylhmU951mk/fbhmqN5pflCLcHbHcBY4lMvS0QYfsPl0xOPjdQblFghJEJJMoT38UinqIcpDfnuyp0wBbHzByMBn+XOhsZCSe7+45eKjM6Lu5DX+HXW63sGSWBaB6Vr8zSNhjRF56sgDNJsJff7L52g3EOOQVNNV0M4WaqovmV7LsQsiw1nWOF6Ns/vQIqYyQkp1TxpEjX7/hp3Q0QZUUTcAdYUviaCpkSmNKjLXlm+lizqGKScfIM3ODSzrbucrfKWTjE1csKg2VpRjClvtLhctMUx65a9VuYcWGdmF3iOgAx3bLAFZDlBR4oc1ygg74IJLquxx3IsUP8BCoe+Anl5O1rphmhiBc2kxcpHMs6NK63ihOArbcWVd8eujESB42tb9nm/ukS3LVC/AgeUbgyQ+QMcebQ2iXxIzVh41Ed+f2gwdav4/Cw2iAL8YBdb652vKfCPVF3iKtqJSer7hEL8uVTnj1i3FeKKO7U6pXVZJcskClm/FIuZKxUzUuRSUsepCWFMJTSo88DWqfDpNxNmqkTBDCxy9uIq/tbsDjEgBZIEssRay/IuP4tQBdd6JAaCB9IrAnJsuwQrU2Hbl+IlBUXBxwtzakSbyomUCq7gruNLkQFt3Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP195MB1231.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(26005)(316002)(38100700002)(122000001)(6512007)(966005)(6486002)(86362001)(6506007)(478600001)(8936002)(38070700005)(71200400001)(91956017)(8676002)(66556008)(4326008)(41300700001)(66476007)(64756008)(5660300002)(76116006)(66946007)(66446008)(2906002)(186003)(83380400001)(85182001)(107886003)(2616005)(36756003)(54906003)(6916009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B7D6F4717E43948834B3A317EA9B98F@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB2151
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MW2NAM12FT007.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2d152b44-f121-480f-3ea2-08da7badcdf2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ERB6igllF7433OScmren6YHobT720/fDy8PA4VukyE6p2TkTxmwqvkbw06kJFlK1RiWLyR2KRgUJZrsimcCRHAZtgpcC5O/goZFn+iOO6nf1A7E7o2COrequNLeJ+yX5NPAVbkQggTd3gG5xJIscBZaupGDlUDagw4I38xh5+XEY0n2UrJ0KdxybVuC7VKn4wJ0SCMCxd8MSM3UgyDR129cC9TmM6yWvnoLo6weGFYotc1vHtobgPwQ9LmnYQtGubJZLM1kmFjFIfwnfAaWxqFcu2mi28L4M6flnCckEU4OepoGmNsr/KzRUfj2yKb2xS1ljoSlgQu0z06XWz7mAQZaVCT8a0sGWFsQSeHo5qnJHaxmkrMIE5EDj6xAMquI6tXoorxmwNGJC56kHwN6tCVGuS3YFpujjCxSBHCk0BZ4NTL3f2ez09pF+QfPr9XfL8dUhNgV+r5jEBlJxjTR3QWTHSvtyrvIduMOE83fwI3+LsMBn/uWEbBL77dPs8kOVAolY3WNz/GUOts7S96BoTz7wP/jKJNPzMob2yqvp4C9USjed1p5eMQx5yp/frsjf9FY+9/E5HiJ0kMa4Bb06BGiMlPlm3kqOAigKWxo7ch6YCcMhyWcFs88DauaMSzs1Rk73bJ9Sy28Yt/wBM6g5/YpYM2wO+CXpqyU0TyohlQRCF2lP9GI0qTtrwyPNU7tmk8EIe49rJlZi46XCBQfd8vitCXOeSd8Le7uWG+NAM8eXaPfQe/k5r0FpzHLWWBL2bXf71wrN1eiEwWJ0Kr6bxZRncifUlev1B7WSr0Zxa6FM376YIzQeX6hsrInnVuJYsRZCDF+3JiM+4NhYPnrNI5kZFJu0H8eCtue01+gz8WPQzoSlI5PY648PRsuSEgFe
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39850400004)(376002)(346002)(46966006)(36840700001)(40470700004)(336012)(186003)(40480700001)(36860700001)(41300700001)(107886003)(85182001)(47076005)(5660300002)(83380400001)(8936002)(36756003)(2616005)(86362001)(54906003)(70206006)(356005)(82740400003)(81166007)(478600001)(6916009)(966005)(8676002)(70586007)(2906002)(316002)(26005)(6486002)(40460700003)(6506007)(6512007)(4326008)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:26:17.1662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3205a0e9-8f2f-4878-9ec0-08da7badd5c8
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM12FT007.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7763
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 15:26:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169247

SGksDQoNCkZvciBtZSBpdCB0b29rIGFyb3VuZCB+NTAwIHNlY29uZHMuIEkgY29uc2lkZXJlZCBp
dCBhcyBzbG93LCBhcw0KYFBURVNUU19GQVNUYCBzaG91bGQgdGFrZSBhcm91bmQgfjMwIHNlY29u
ZHMgYWNjb3JkaW5nIHRvIHRoZSBjb21tZW50DQpvbiBwdGVzdC1wYWNrYWdlbGlzdHMuaW5jLg0K
DQpTaW1vbmUNCk9uIFRodSwgMjAyMi0wOC0xMSBhdCAxMDoyMyArMDIwMCwgQWxleGFuZGVyIEth
bmF2aW4gdmlhDQpsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBDQVVUSU9OOiBUaGlz
IGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBFbGVrdHJvYml0DQo+IG9yZ2Fu
aXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dQ0KPiByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0K
PiANCj4gDQo+IE9uIFdlZCwgMTAgQXVnIDIwMjIgYXQgMjE6NDAsIFNpbW9uZSBXZWlzcyA8DQo+
IHNpbW9uZS53ZWlzc0BlbGVrdHJvYml0LmNvbT4gd3JvdGU6DQo+ID4gLS0tIGEvbWV0YS9jb25m
L2Rpc3Ryby9pbmNsdWRlL3B0ZXN0LXBhY2thZ2VsaXN0cy5pbmMNCj4gPiArKysgYi9tZXRhL2Nv
bmYvZGlzdHJvL2luY2x1ZGUvcHRlc3QtcGFja2FnZWxpc3RzLmluYw0KPiA+IEBAIC04Nyw2ICs4
Nyw3IEBAIFBURVNUU19TTE9XID0gIlwNCj4gPiAgICAgIGZpbmR1dGlscy1wdGVzdCBcDQo+ID4g
ICAgICBnbGliLTIuMC1wdGVzdCBcDQo+ID4gICAgICBnc3RyZWFtZXIxLjAtcHRlc3QgXA0KPiA+
ICsgICAganNvbi1jLXB0ZXN0IFwNCj4gPiAgICAgIGxpYmV2ZW50LXB0ZXN0IFwNCj4gPiAgICAg
IGxpYmdjcnlwdC1wdGVzdCBcDQo+ID4gICAgICBsdHRuZy10b29scy1wdGVzdCBcDQo+IA0KPiBI
b3cgbG9uZyBkbyB0aGUgdGVzdHMgdGFrZSB0byBleGVjdXRlPyBEbyB0aGV5IGhhdmUgdG8gYmUg
YWRkZWQgdG8NCj4gdGhlDQo+IHNsb3cgbGlzdD8NCj4gDQo+IEFsZXgNCj4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRo
aXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTY5MjM2KTogDQo+IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTY5MjM2DQo+
IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzkyOTQ0
MjIzLzY2MzkyNzkNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViDQo+ICBbc2ltb25lLndlaXNzQGVsZWt0
cm9iaXQuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg==

