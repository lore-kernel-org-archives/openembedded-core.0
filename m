Return-Path: <prvs=98337ecc28=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 3335579BD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:45:47 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w9MEfOwi016113; Mon, 22 Oct 2018 09:45:40 -0500
Authentication-Results: ppops.net;
	dkim=pass header.d=nio365.onmicrosoft.com header.s=selector1-ni-com
Received: from nam05-co1-obe.outbound.protection.outlook.com
	(mail-co1nam05lp0082.outbound.protection.outlook.com [216.32.181.82])
	by mx0a-00010702.pphosted.com with ESMTP id 2n81vrdtqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 22 Oct 2018 09:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9NuQXlR43HSxfyxGmVfUtfTQi33esrLJ9SqMsK4uWJo=;
	b=AiKkIPgqYkBdpcimqBtZb6Cabf8D1qbj/JL3YGqXog+KJF6jf2+fcLfI9MGyn2j7QSzPPUp4Scu9ORAc3JwgjX65vdZJU3UEwhJx8sJRI8+FrY/BfWT8mg88RVoiPCiONDAkw0NuSeykIO5Ya/KcyP0wX3en5bhIJvJ/NoELbgc=
Received: from SN6PR04MB4221.namprd04.prod.outlook.com (52.135.71.147) by
	SN6PR04MB3998.namprd04.prod.outlook.com (52.135.82.27) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1228.26; Mon, 22 Oct 2018 14:45:38 +0000
Received: from SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::b101:799c:362d:549e]) by
	SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::b101:799c:362d:549e%3]) with mapi id 15.20.1250.028;
	Mon, 22 Oct 2018 14:45:38 +0000
From: Alejandro Del Castillo <alejandro.delcastillo@ni.com>
To: "opkg-devel@googlegroups.com" <opkg-devel@googlegroups.com>, Stefan Agner
	<stefan@agner.ch>, "yocto@yoctoproject.org" <yocto@yoctoproject.org>
Thread-Topic: [opkg-devel] [opkg-utils PATCH] opkg-make-index: use ctime
	instead of mtime
Thread-Index: AQHUZ8HLUWQLgtaCxUyNWD8vwj5l7qUrXMeA
Date: Mon, 22 Oct 2018 14:45:37 +0000
Message-ID: <670d0eab-f33b-8883-2cdf-d83c1701789b@ni.com>
References: <20181019153821.21177-1-stefan@agner.ch>
In-Reply-To: <20181019153821.21177-1-stefan@agner.ch>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR04CA0025.namprd04.prod.outlook.com
	(2603:10b6:805:3e::38) To SN6PR04MB4221.namprd04.prod.outlook.com
	(2603:10b6:805:30::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [130.164.62.135]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR04MB3998;
	6:8kwlIwNp9avVMzE7IoUbqY41Ukm+Yuu8sJDTCDe/Jv6QbcjHUdCP5h+OVXKRUPKEGq5a/9dWdOVPvw23ABai9PF7cXIKi5AZqhJEzTlG89lr9m3auvhYdsPAbKXOL8cGLQFBYjq5eFn2hYVjuCtexIcTNKvvmHq1ehrskyezHx6JShfyzp5Ge7WpDR8BCly7SBifn1tLpVRzMXrkyQGbCHgz3OcTYncX5boiyLzyz5UEyKRUVjuKJbIHYMTNSIbTA3p9gUfzgfXSKPbjxTviqUYcefZOrnooACFl5B+Uyk6i/oeQ5CmYyIsRIluSNuxwouQwCU57V8D1nlq49gjjnlfKEPjLI+lzykZjCUf8RPub/sKyVknScCOtWJTm1MtTGxuaVzfQ7Xz1VMy/zxo0l0hX9FzK+SOW8GwUm3c4rhLUKjZwZoo/D6vtyeitLQdjX1nvJaz73zDR11s3ipm1Uw==;
	5:NLVnHy8veG39GIJKItYYBLWruIXUc7dloIkNCunG5AxiU+tfP8K3sO+mM3ux7b4otl1E8GiqpqfdUykPh10SwWTjXUWAVaJ4BUaxsM7ExkEST+RQ39kQ41jRO0Tkeux7QUB0BJq2HvwYsm8HUAcOpBjqvTtEsjjRYidJYbDGlAU=;
	7:4qNl/uTSdcCdsZUc83QGTehyhlQXYODGH42svHLIxJ8lRlRB2I8iQQnewxZG/j8fQ5Y6KO3H7N8vjPRJde3JHPjZ6OAH9O9wfX4O/5Ovl0XBda2Snmm6ADzj+xqR1j0Itzx41jHjyRStY2EP0eCxOODC/VlljsSu2TGBeWMx0alruFq6W7LPWg/mE7G3VfPdpD/5KiVEgSN4uNneuzRiEU/u/pTvXIS+mzUSIxnNuwarpzxPZCj4TL0kzfMb+ESN
x-ms-office365-filtering-correlation-id: e707fe8e-9c7e-490b-094e-08d6382d07a2
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:SN6PR04MB3998; 
x-ms-traffictypediagnostic: SN6PR04MB3998:
x-microsoft-antispam-prvs: <SN6PR04MB3998799798007E3F7F9465BD86F40@SN6PR04MB3998.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(10436049006162)(85827821059158);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(4982022)(52105095)(10201501046)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:SN6PR04MB3998; BCL:0; PCL:0; RULEID:; SRVR:SN6PR04MB3998; 
x-forefront-prvs: 08331F819E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(52116002)(76176011)(86362001)(99286004)(186003)(26005)(2616005)(39060400002)(486006)(11346002)(6486002)(6436002)(97736004)(6512007)(68736007)(102836004)(31696002)(53936002)(446003)(476003)(53546011)(6306002)(5660300001)(305945005)(386003)(256004)(8676002)(7736002)(81156014)(110136005)(81166006)(8936002)(54906003)(25786009)(6246003)(4326008)(71200400001)(3846002)(6116002)(2501003)(478600001)(966005)(2900100001)(316002)(5250100002)(14454004)(6506007)(71190400001)(105586002)(106356001)(66066001)(229853002)(2906002)(36756003)(31686004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB3998;
	H:SN6PR04MB4221.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: lmVgGVPAOgMPu/aiqGZjGcch4pnLIz0yTCy6MH8AeSJHDoy+A5he/2lj/CN8H7Pxd7HL6NYKeEZw62J5gWzCD5qqnZincQdhDgAr74gQTBoEP/dCqR+/4jPYSkjaN0RCia3eA4haFJine9xM/5uXR4MA+5/TBqqYscp6k1iLr4QBoWU6aQfZLkPSrNn9t9E/a5JGb3P4gWtea8ePdE5co1apgzLpkgVCAQCD+eKksaTV6CWeS+B9qkPyJKjxT+kfWbZ/tcLKD1Vk05eGGSQaSxF3QR6pNKDLCfOA1LZPUZdFdsvXpmQcD62TUJJQqSI3j5ylZtucq6PaKrH6lU2AUsJACU3T05tuneTjlMSSSik=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e707fe8e-9c7e-490b-094e-08d6382d07a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2018 14:45:38.1153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-10-22_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1810220126
Cc: Stefan Agner <stefan.agner@toradex.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"ricardo@foundries.io" <ricardo@foundries.io>
Subject: Re: [opkg-devel] [opkg-utils PATCH] opkg-make-index: use ctime instead of mtime
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2018 14:45:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6441A1FE3FFC84BBF6B4ACF2EE087FB@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

bWFrZXMgc2Vuc2UsIHNvdW5kcyBsaWtlIHRoaXMgaXMgZ29pbmcgdG8gZml4IGEgYnVuY2ggb2Yg
bmFzdHkgDQppbnRlcm1pdHRlbnQgZmFpbHVyZXMsIHRoYW5rcyENCg0KbWVyZ2VkDQoNCk9uIDEw
LzE5LzE4IDEwOjM4IEFNLCBTdGVmYW4gQWduZXIgd3JvdGU6DQo+IEZyb206IFN0ZWZhbiBBZ25l
ciA8c3RlZmFuLmFnbmVyQHRvcmFkZXguY29tPg0KPiANCj4gV2hlbiB1c2luZyBzc3RhdGUsIHR3
byBwYXJhbGxlbCBidWlsZHMgY2FuIHByb2R1Y2UgdHdvIHBhY2thZ2VzDQo+IHdpdGggdGhlIHNh
bWUgbXRpbWUgYnV0IGRpZmZlcmVudCBjaGVja3N1bXMuIFdoZW4gbGF0ZXIgb25lIG9mDQo+IHRo
b3NlIHR3byBidWlsZHMgZmV0Y2hlcyB0aGUgb3RoZXJzIGlwaywgdGhlIHBhY2thZ2UgaW5kZXgg
ZG9lcw0KPiBub3QgZ2V0IHVkcGF0ZWQgcHJvcGVybHkgKHNpbmNlIG10aW1lIG1hdGNoZXMpLiBU
aGlzIGVuZHMgdXAgd2l0aA0KPiBtZXNzYWdlcyBzdWNoIGFzOg0KPiAgICBEb3dubG9hZGluZyBm
aWxlOi8uLi90bXAvd29yay8uLi9pbWFnZS8uLi5pcGsuDQo+ICAgIFJlbW92aW5nIGNvcnJ1cHQg
cGFja2FnZSBmaWxlIC8uLi9zeXNyb290Ly4uL3Zhci9jYWNoZS9vcGtnL3ZvbGF0aWxlLy4uLmlw
aw0KPiANCj4gSG93ZXZlciwgaW4gdGhhdCBjYXNlLCBjdGltZSBpcyBkaWZmZXJlbnQuIFVzZSBj
dGltZSBpbnN0ZWFkIG9mDQo+IG10aW1lIHRvIHByZXZlbnQgZmFpbHVyZXMgbGlrZSB0aGlzLg0K
PiANCj4gU3VnZ2VzdGVkLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTdGVmYW4gQWduZXIgPHN0ZWZhbi5hZ25lckB0b3JhZGV4LmNvbT4NCj4gLS0t
DQo+IFRoaXMgYWRkcmVzc2VzIHRoZSBpc3N1ZSBkaXNjdXNzZWQgaGVyZToNCj4gaHR0cHM6Ly91
cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHAtM0FfX2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmdfcGlwZXJtYWlsX29wZW5lbWJlZGRlZC0yRGNvcmVfMjAxOC0yRE9jdG9iZXJfMTU2
MzQ4Lmh0bWwmZD1Ed0lCYVEmYz1JXzBZd29LeTd6NUxNVFZkeU82WUNpRTJ1ekkxampaWnVJUGVs
Y1NqaXhBJnI9d05jckwyYWtSbjZqZnhoSGFLYXZVckpCX0M5SkFNWHR5bmpMZDhaemdYUSZtPUlu
bml0MzdINjloVXlaUEd1dWh3TzZSNUNiVU5OVGZYUXd4YnFzRUEyTkUmcz1vRnZxQVNyRlRnYXNE
cVo5MDFIZUlCRlNzZjZDbjRGY0JpZU9PQlU0TWRJJmU9DQo+IA0KPiAgIG9wa2ctbWFrZS1pbmRl
eCB8IDYgKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9vcGtnLW1ha2UtaW5kZXggYi9vcGtnLW1ha2Ut
aW5kZXgNCj4gaW5kZXggMzIyN2ZjMC4uZGI3YmY2NCAxMDA3NTUNCj4gLS0tIGEvb3BrZy1tYWtl
LWluZGV4DQo+ICsrKyBiL29wa2ctbWFrZS1pbmRleA0KPiBAQCAtMTE1LDEyICsxMTUsMTIgQEAg
Zm9yIGFic3BhdGggaW4gZmlsZXM6DQo+ICAgICAgICBwa2cgPSBOb25lDQo+ICAgICAgICBmbmFt
ZVN0YXQgPSBvcy5zdGF0KGFic3BhdGgpDQo+ICAgICAgICBpZiBmaWxlbmFtZSBpbiBvbGRfcGtn
X2hhc2g6DQo+IC0gICAgICAgICAgaWYgZmlsZW5hbWUgaW4gcGtnc1N0YW1wcyBhbmQgaW50KGZu
YW1lU3RhdC5zdF9tdGltZSkgPT0gcGtnc1N0YW1wc1tmaWxlbmFtZV06DQo+ICsgICAgICAgICAg
aWYgZmlsZW5hbWUgaW4gcGtnc1N0YW1wcyBhbmQgaW50KGZuYW1lU3RhdC5zdF9jdGltZSkgPT0g
cGtnc1N0YW1wc1tmaWxlbmFtZV06DQo+ICAgICAgICAgICAgICAgaWYgKHZlcmJvc2UpOg0KPiAg
ICAgICAgICAgICAgICAgIHN5cy5zdGRlcnIud3JpdGUoIkZvdW5kICVzIGluIFBhY2thZ2VzXG4i
ICUgKGZpbGVuYW1lLCkpDQo+ICAgICAgICAgICAgICAgcGtnID0gb2xkX3BrZ19oYXNoW2ZpbGVu
YW1lXQ0KPiAgICAgICAgICAgICBlbHNlOg0KPiAtICAgICAgICAgICAgICAgc3lzLnN0ZGVyci53
cml0ZSgiRm91bmQgJXMgaW4gUGFja2FnZXMsIGJ1dCBtdGltZSBkaWZmZXJzIC0gcmUtcmVhZGlu
Z1xuIiAlIChmaWxlbmFtZSwpKQ0KPiArICAgICAgICAgICAgICAgc3lzLnN0ZGVyci53cml0ZSgi
Rm91bmQgJXMgaW4gUGFja2FnZXMsIGJ1dCBjdGltZSBkaWZmZXJzIC0gcmUtcmVhZGluZ1xuIiAl
IChmaWxlbmFtZSwpKQ0KPiAgIA0KPiAgICAgICAgaWYgbm90IHBrZzoNCj4gICAgICAgICAgICAg
aWYgKHZlcmJvc2UpOg0KPiBAQCAtMTM3LDcgKzEzNyw3IEBAIGZvciBhYnNwYXRoIGluIGZpbGVz
Og0KPiAgICAgICAgZWxzZToNCj4gICAgICAgICAgICAgb2xkX2ZpbGVuYW1lID0gIiINCj4gICAg
ICAgIHMgPSBwYWNrYWdlcy5hZGRfcGFja2FnZShwa2csIG9wdF9hKQ0KPiAtICAgICBwa2dzU3Rh
bXBzW2ZpbGVuYW1lXSA9IGZuYW1lU3RhdC5zdF9tdGltZQ0KPiArICAgICBwa2dzU3RhbXBzW2Zp
bGVuYW1lXSA9IGZuYW1lU3RhdC5zdF9jdGltZQ0KPiAgICAgICAgaWYgcyA9PSAwOg0KPiAgICAg
ICAgICAgICBpZiBvbGRfZmlsZW5hbWU6DQo+ICAgICAgICAgICAgICAgICAgIyBvbGQgcGFja2Fn
ZSB3YXMgZGlzcGxhY2VkIGJ5IG5ld2VyDQo+IA0KDQotLSANCkNoZWVycywNCg0KQWxlamFuZHJv
DQo=

