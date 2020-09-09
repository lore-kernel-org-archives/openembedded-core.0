Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.75])
 by mx.groups.io with SMTP id smtpd.web11.6131.1599683502169021239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 13:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=rpCCOwRk;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.237.75, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXjz5TbSE3QOrzZeervfHBQRcZtIo6gH2/aKnVs20MhCgMjGTEz5xUksvqUGvanVsZs/KNBrgRM3kCtlkw0jRud2v03MqB5VKingVBv+WPAhAaX3wVyGKk/8ATnw0WkOhbB+sC7lpi00ofk3j2mOqBRsrlVooqEjVKBJoWWThqUJvkw61lXHkWgisw4945S6fFpVWQo/3szMafthpG1sZa3o/qJCAF6vhOmKjVol9RJahF6x7eAMi7Te7ePEPfL7SnyI4HScLEsGzjRic64MGoMIzFwcDW4UNJBa5Izzgnyk8Pg5Rdtmyho/LK1HKmHHWw61eaBBSLRBoaqcda+rrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4z0mNCXdFa42qh+gBevxN7O3AE3V3UAhnfT82UZ1VI=;
 b=VtIHp41ejkuNp1rQW1sDanfffK+69ayxXuaW/UJz4hg6AmfyC+5ZByzCjXTpCel4kLStgDMqEUh5m6FqgYL+onAaCn5q5bLyXAmQ/CTb/PtIbb5iIxW3m3U2PrfL6QV6l+cXRB4IczK1eA3Lx+ws5FZD1D7o/Z7/sBIOisO42vEmE8HquSi63nWFwLk6QDE0reQ0cq26xIClIIEahQ7JcsyvZo1QI9SOrYecdqQnkziplxJrBgsZfLhWnZN0rr1NhWPnQ1Zunt3QRT2fb8xygebvzmj6i2VpvxlGeIgD8I1U8kY6OI6hRy4W/JxgyhgGFjsZ6MGZ6CqgKl+O1TozNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4z0mNCXdFa42qh+gBevxN7O3AE3V3UAhnfT82UZ1VI=;
 b=rpCCOwRkMaPkTOGi2N1dRJZ9+aEiZgCgRZe7IET9E8pPGF4bSOCrzOSO03RL36ReZ0E/3rWIy8S9nqujWGJ5fjDK3le5v0l01IZQG+JR5rCoLT3Bt0fjaMCpteqbLWdr5BTEdftiXBLbZbZh9kc/H+lo9Q7/u1xFCiOpof2bpn1aNjI/SVefSQXF+/0IlP6/HNJP8sUjn2WdjS+q4xk70tRZFhKhC7vQMdZIsTEJvjuUp2eifd0CDuZdu8/vARoZn5RrCC5cbp5kFGWmWq9ppGKqbXQrnwtQo7Ik8LU6HfKZIEEXfZ9LV7P4Rv7hP6L99nI1v7qKm2zj6trSCPF9ww==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 20:31:41 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d%7]) with mapi id 15.20.3370.016; Wed, 9 Sep 2020
 20:31:41 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Ross Burton <ross@burtonini.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/4] cve-check/cve-update-db-native: fix under multiconfig
Thread-Topic: [OE-core] [PATCH 2/4] cve-check/cve-update-db-native: fix under
 multiconfig
Thread-Index: AQHWhs+ce3cEfbaSDkagVkODTXL5Sqlgv2SAgAAC9HA=
Date: Wed, 9 Sep 2020 20:31:40 +0000
Message-ID: 
 <SN1PR12MB24802B0C1DBDBC6FF5C4AA188B260@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20200909173510.114925-1-chris.laplante@agilent.com>
 <20200909173510.114925-2-chris.laplante@agilent.com>
 <CAAnfSTufbRYeTjS4ovx=5Bj1jqYsheYzJcysCo7j-1PqmD+x-A@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTufbRYeTjS4ovx=5Bj1jqYsheYzJcysCo7j-1PqmD+x-A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00bbc67d-c3e5-4078-22ea-08d854ff5c18
x-ms-traffictypediagnostic: SA0PR12MB4448:
x-microsoft-antispam-prvs: 
 <SA0PR12MB4448BCAE8383E47DE3D9DE218B260@SA0PR12MB4448.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eDaDOgY7jf97gFGQc6v+aD1HoEqQ/BH4lMHudKNgsQ2+Pwlg0VjXEcvpTTUamkbD1pikBuf1NvPvaMuk24rHFNkicMYndTRltKe17kBsv6CKzG1As57pSt4/3xlAfO4w0h253RbJ/oNr9RcVJeqhprNKlTyqT6uk15vB3s7rk1ujH265qQKSWjB48EQcfRaMOHz5Z2o2hAulYcAYVIRV1z+RBnow/zKP61XVXPPl4nUh0S+MB/bGDGrhqi7C8AdxR3HxIsjbxgwV2dpYxG/wseFxpxcoAuulEe12mcI9OKtKMe4eG+1CfKzCmbWJjVowtg0EF+bRbVK7towMdasD1XgJ63DokPaNKWVQHroLSYFr2MM+B8gvQkDrYg37u6gm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(29502001)(2906002)(71200400001)(4326008)(26005)(8676002)(52536014)(7696005)(6916009)(33656002)(5660300002)(8936002)(6506007)(66446008)(66476007)(15650500001)(64756008)(76116006)(66556008)(66946007)(316002)(186003)(86362001)(83380400001)(4744005)(9686003)(478600001)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 M8mU11Jhy9vYj7qxfNlVAgpI8wTSKNpV8RZPqW2YL2HcJ4NNMzX4hi0ZcMkAN1d7y8CTb9RqwZoJ2AC9G90wKn1xlbzKtJTg6j6MdqF2+qRlbMmW6NsVzuD2YpQyabpMwhsxhHXpMXbKbB910C+45DxfEkUfrSMXiIbsY2aSZkQuFBQLv5zR90VvuNFiC9ndsTlKB2uyjVDQquYjE7vOZT9m5V2Z8WEzJFmdHE1v30x5x1qLN3ZWdFoeESNp3GQkaDFeFtUHyi4XsPIwlz9jO0BDQMhNcWyVypnrWRrBuuSAyJQoprZtJKAvjtA6M7MVciuzWGw6M77Eyf0kFIx6h74CyOwkYyww1Em8iqvZ7o15LB05nigt1mNnBSZEe7zCJIjRaVl5TmcfyDz2NmFO1R45s/onwiuC1isYlLNa9X/V94BiUFhTIu4GbYp+xgrXzeN+KqzwqfXtoeKvF7E1Y8aKTPqMQj2lxB284Kd65GyMY4Q1iVIytVzImlBZjLoe28tU6rbW6tIZCh7ALqGVL2J9J0mflOw5zPbomR9bhYT6GvnGpJxm+iUusqfmtivbr4iwifCfmczz9T2aDOXDrQhCdP/EwGNDNpl4TevGlVhR8Wmd8FL0Ul+6MmSb2I2iXQfYrR0Jbi4JzkMt09tpRw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bbc67d-c3e5-4078-22ea-08d854ff5c18
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 20:31:41.0345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQFmvIen5IM442oxn3m3FUzW3sqs/una9AqP8R77If2gLtrC6qDbc+B1fAWt2aZ8mCqR6to4tDd/KFkNWqLnKu0AX66zdOiVzGR9P+1210g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBPbiBXZWQsIDkgU2VwIDIwMjAgYXQgMTg6MzUsIENocmlzIExhcGxhbnRlIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IDxjaHJpcy5sYXBsYW50ZT1hZ2lsZW50LmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IFByZXZpb3VzbHkgQ1ZFX0NIRUNLX0RCX0ZJ
TEUgLyBDVkVfQ0hFQ0tfREJfRElSIHdhcyB0aGUgc2FtZQ0KPiBhY3Jvc3MNCj4gPiBtdWx0aWNv
bmZpZ3Mgd2hpY2ggbGVkIHRvIGEgcmFjZSBjb25kaXRpb24gd2hlcmVpbiBtdWx0aXBsZQ0KPiA+
IGN2ZS11cGRhdGUtZGItbmF0aXZlOmRvX3BvcHVsYXRlX2N2ZV9kYiB0YXNrcyBjb3VsZCBhdHRl
bXB0IHRvIHdyaXRlDQo+ID4gdG8gdGhlIHNhbWUgc3FsaXRlIGRhdGFiYXNlLiBUaGlzIGxlZCB0
byB0aGUgZm9sbG93aW5nIHRhc2sgZmFpbHVyZToNCj4gDQo+IEJ1dCB0aGUgZGF0YWJhc2VzIHdp
bGwgYmUgaWRlbnRpY2FsIHNvIHRoYXQncyBiYXNpY2FsbHkgYSB3YXN0ZSBvZiB0aW1lLiAgSG93
DQo+IGFib3V0IGFkZGluZyBhIGxvY2sgZmlsZSBzbyB0aGUgc2Vjb25kIHRhc2sgd2FpdHMgZm9y
IHRoZSBmaXJzdCB0byBjb21wbGV0ZSwNCj4gYW5kIHRoZW4gZG9lcyBub3RoaW5nIGFzIHRoZSBk
YXRhYmFzZSBpcyB1cCB0byBkYXRlPw0KDQpUaGF0J3MgYSBnb29kIHBvaW50LiBJIGFsc28gY29u
c2lkZXJlZCBqdXN0IG1ha2luZyBpdCBhIGJiLmV2ZW50LkJ1aWxkU3RhcnRlZCBldmVudCBoYW5k
bGVyLCBsaWtlIGhvdyB1bmluYXRpdmUgd29ya3MuIA0KDQpDaHJpcw0K
