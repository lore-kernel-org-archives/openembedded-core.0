Return-Path: <muellerd@fb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05BFC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 21:13:11 +0000 (UTC)
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by mx.groups.io with SMTP id smtpd.web10.17535.1644354790884623836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 13:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fb.com header.s=facebook header.b=pN7BR3gm;
 spf=pass (domain: fb.com, ip: 67.231.153.30,
 mailfrom: prvs=3038e13d01=muellerd@fb.com)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 218JtvwT028304
	for <openembedded-core@lists.openembedded.org>;
 Tue, 8 Feb 2022 13:13:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=6DelA1nGev/jRe2lOH5ojj04msSuATi7SHMe7Hx7W/Q=;
 b=pN7BR3gm7NXxpTCeRuFarjttUwzHV919cHRqNSTP+7JuLTd1lHf0rGH32Uav5f0hf92r
 ivnoWBQL6coATXeqkvktk+ljNgKr/T05/HZwcYkSiKV4PnizejiT/ajZN6rlKQU58D+l
 BXijmiNTUOIqPDqr3TVMkSA1lpu09dw6PjA=
Received: from mail.thefacebook.com ([163.114.132.120])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3e3y3s0fqc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 13:13:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Feb 2022 13:12:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1W0z4vN3Um5ssF+AXF15VJRHWD1sDXlaJH101aWwpSRlC+Imjy8t1lsmjkCGGgajdGi2IsjaRI7YPZqzH55yleKDYto9n8A52C/eTjwOGy2UE9as1povfklG9BNjWUg8PPDFuq5Ri4GsXE3lQOoPgmZx+4LBAWMt+AIpaTOpKWUSHSwzr7YixXDCHOCGQAWEVBNITNojRwxbb5v2mWkrw65G1rN1xPLeYyoGSZa8cJY0eGQEDTkNUW032x/aoorEkEXPs4tIGIAYgNVbLcnpgaJd51b/bcPZCdCODOGnmzAV5sHEDiNqmTR2NQV3V5+IaQaI0rTMnK1OAlUvmthTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DelA1nGev/jRe2lOH5ojj04msSuATi7SHMe7Hx7W/Q=;
 b=benSvC4h4z+7nJIlHfdWGc/zdzJOYsLBlfdxfCX748iIhPFbISs2YrjUNLcXwqoF7XpBg+Dm7vlmZmbpttt1G8+VmBBuReyZomPVNVqe0m8LG54zNsQ19j0TDyJx+C/161Jr9cbTfsJ2Vpy16vvz97WVeHx90hzlx64jwoQmLm+7M9jtGgeYWNVYtj3yONNgkh9NlPp+5qVdWSypPlUOB9wIOvcu7fHSuo3ymdLLx39bdowsBsAzVyeeVaxF+rxQi9NAO6uHWBIZS41pcuSUqkX9wjvHhkYWhxJiY4eFt2YIKrR0seG01JtLlhE6CQwDU9PDv0e7R0Ja4f0Z6RNV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR15MB4534.namprd15.prod.outlook.com (2603:10b6:a03:377::18)
 by MN2PR15MB2813.namprd15.prod.outlook.com (2603:10b6:208:128::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 21:12:33 +0000
Received: from SJ0PR15MB4534.namprd15.prod.outlook.com
 ([fe80::7d67:42c5:8684:1ed0]) by SJ0PR15MB4534.namprd15.prod.outlook.com
 ([fe80::7d67:42c5:8684:1ed0%4]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 21:12:33 +0000
From: Daniel Mueller <muellerd@fb.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Daniel Mueller <muellerd@fb.com>
Subject: Re: [PATCH] scripts/runqemu-ifdown: Don't treat the last iptables
 command as special
Thread-Topic: [PATCH] scripts/runqemu-ifdown: Don't treat the last iptables
 command as special
Thread-Index: AQHYGFhQog+ImPF+S0ioNXqYbeyt4KyAgJ+igAmvjFc=
Date: Tue, 8 Feb 2022 21:12:33 +0000
Message-ID: 
 <SJ0PR15MB4534E868D8AEB1F25CE09986BF2D9@SJ0PR15MB4534.namprd15.prod.outlook.com>
References: <20220202171411.3615036-1-muellerd@fb.com>
 <16D007AA05A8A877.4913@lists.openembedded.org>
In-Reply-To: <16D007AA05A8A877.4913@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 7287eaad-1485-cf72-dd3c-db99e1063916
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4803f0de-ab35-4a0c-2f3f-08d9eb47b95f
x-ms-traffictypediagnostic: MN2PR15MB2813:EE_
x-microsoft-antispam-prvs: 
 <MN2PR15MB2813A12459133CE1CA3EBEB1BF2D9@MN2PR15MB2813.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gEU2tO14bOW/vXFTQdc5UV5E64NQl7ckcCllbAEkmPfw0T7Xhnd8PgXmHZLTi9D2B1E8AghAu7YE9Y+k632MgOHQ4LlBuS0troMtrA6OHnpgbZ0OzS4q1YqFBU1TdjzNMzSNzxtrfksfZA3/9cgKBAtXE5mKrL3qm6zpn46NFLcpr97e7yi+/2GDoqi835lIh5fZjwIy27qj/GCgJU5EKcjY6maJzMZjG6spZz+oWHJh5gWe6HRIj2htFrxeBbAFEqBJkSftp/ojFL2VgHvHoQGp97JouPvVk4pc4hJ1IWjX6b9xIigX2AfL0ScNF9UDDkQDcIe2felnsFWOddE0Ad+nyuUAi2Zj2xGLHzj5iePKZLWxuPqaoXQALFUayT0BDq/eMohp7qPw2jxv0QCtQLkS/TZKzbPQfiFaizZIkMPJnQ93RdiAAwVGZUW5lJTBaqUQfcjSdSv36ekZ2lmh0hFT6l+C2K91Fr3gLiXURgGr+eXGBVu/h3mTQ9mQ8/D8n7wCUzULa2sN//OJa9JiaGtYR+2JzycETArm03JsHah7WQl9stheZX1JxdasetPbpYZnru/q0pQZjwdGH3RpYub3lKRBBJO849KbGUWFgTLt7VpUQbvwvtog2n+27JlTS7tuVVXFnYkgVNhlq3O0pkaWEtucbwPS592TqvqscxAtahOsM6xKxm4f89vU6vWIgSvvbit0y8dxMnZdQQCGSg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4534.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(9686003)(7696005)(38070700005)(33656002)(71200400001)(508600001)(66556008)(186003)(316002)(5660300002)(83380400001)(122000001)(38100700002)(66574015)(110136005)(91956017)(76116006)(2906002)(64756008)(52536014)(66446008)(55016003)(86362001)(66946007)(8676002)(66476007)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Y2sLGIiqi8crJv+sSsKnXnNyiB8e4Ym4cXPnagZtWuC6sTTOSFkcsNU78U?=
 =?iso-8859-1?Q?K4eawZbKxKgKtk7sE2hFYbTBY5TQPUi3TMDZ2O6QjIHEj/Hv6Lr/5Axkq5?=
 =?iso-8859-1?Q?bqEX50x8wF1PBzQriIDdLQ0DK6bg+MRH4TgB2tSFl15wcM4+29ahfbXJMz?=
 =?iso-8859-1?Q?W9MVqoVSCt61Qk1De1qUtHrpvCLVczp/iHMjlreF+uiB+KJCY60t4DEw5E?=
 =?iso-8859-1?Q?Hd6wm8AC0/a7U5wE9BZALkbTzzVUMXaPfosZhHP6zyoIx0pm34cYoS3hjO?=
 =?iso-8859-1?Q?jiIDJ1gAqQdUhRky5IoNOcf3hjgntqU+wPxMbSsreZ/IM3sN6k01kIgz7C?=
 =?iso-8859-1?Q?RW6JDiAukhDUWr1uhrlsol5j1cqfJLhlt/BRCyzJyt7CoDf8MqwFzDASkc?=
 =?iso-8859-1?Q?wSVk8h0hkwOCYs2c+RNIQ58jduat7a4gL0y/lZSq5yv4/wiuCxHBAYKeyf?=
 =?iso-8859-1?Q?kIIcpBw+DKL35vIIBbzjRi2B9XogqOYUSZqGcQbMw6qVXEcJShXqAr2ebg?=
 =?iso-8859-1?Q?08kBAvLWc64MiRPzSqjMboRBe/INTfWFt2AJ1OurDz8LM4FOgsdvPp5PHZ?=
 =?iso-8859-1?Q?R3j+ObBxLe0dRUgSl/ZB8C/QXZXxjSnffFh3sqMAWFxEDEFYrv19Y6XSYY?=
 =?iso-8859-1?Q?a7DMUjBtsltumuJ876/1BH0Icg9TO2PV+QJx98M61KHfBsfMOcQMUf1/rX?=
 =?iso-8859-1?Q?Rno8nQJfZEgkBN7BHYekVzcHfOziEjWqpHn9nyVdfrw0Y9lg+XK3ZhFSTk?=
 =?iso-8859-1?Q?Fh25QCZhBs8+M4HKK3Ju1OEUCSFAsadqoX+rDzm6HrOXXl/4+L2L17LYnG?=
 =?iso-8859-1?Q?GEHQOFPEBWiQzozqYpz07GdEbyhhc9Vy7uijVpnkb1e2vZ8+zWlTORW89J?=
 =?iso-8859-1?Q?Wf7EVy6p+612GyujZLRQTMWgraBzskjMj/Y5m7Ln2udvH9jiqfitl6uBe6?=
 =?iso-8859-1?Q?k/1GU4j5M3YAZx9rZhm2FohJUhGGMqpGEpmeSiRVKPW2JnTIYknK0ONSV2?=
 =?iso-8859-1?Q?/csYmHpWb5tTIMKRMnbKXo9NDhi4yQhbBrTMDZ5TRnPrWe9rw5PJwu6hdk?=
 =?iso-8859-1?Q?8aUWTHlRt3Wb1xs3Nqjh2N4EdOxcn+jY2Ok8HNsL1GnXnSUa813UTzGHlb?=
 =?iso-8859-1?Q?lx5/clza0reBlIshm33x7IZl8vgf5z+ixFanZk1QyLt0RW4M9UpK57UlR0?=
 =?iso-8859-1?Q?10GAC2CL+hHVNy40JwFW3OYfHesU5NGxBE2h2sLQdjYDUeIyy43oteQI7V?=
 =?iso-8859-1?Q?TWMHRk+LmbCoODqv8DC8wrqGmEI/LNq46w36GnV/QfkxJ0J+IJTIPIRvgw?=
 =?iso-8859-1?Q?TFMrJhsjqlB3D0akl/9SdGviCLLn81N5oo7Aj0l+8NzJ3KqeJ8zwQ4ckhB?=
 =?iso-8859-1?Q?u3O6O04Zl6Xs6CjuPaANOzDfyeltKp75yCEsgKJDsIbHdqd3tzvZN4FMmo?=
 =?iso-8859-1?Q?9o1unilABvfIzcyk1EVWXl9UeA86aECjIwHS2qqaTnT2P4PplIj0NDhNN0?=
 =?iso-8859-1?Q?5HYUTfULJ3omE6tBU5FRCa7vTkk4aVyf5BNBaLYB0hairl+ZRcV6qPH9CC?=
 =?iso-8859-1?Q?AUckWjPu76QQBymxAZbCslAdc/CYQ7fpas5OHvoDycvl23Y9CldQ4rZX4f?=
 =?iso-8859-1?Q?eLC6Z09lTz57xVCVu67XpSeyyAQeOP3Qb2?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4534.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4803f0de-ab35-4a0c-2f3f-08d9eb47b95f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 21:12:33.3926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 f/hddjX2tvW3vIG0vzYsh/UFNa0zhOzjJ+dNSKNGiYhwy3hhWcX3YSeFTaVEHOX4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB2813
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: 0owL9dW4KhLsC5VKMetf10hFLKR08eKA
X-Proofpoint-ORIG-GUID: 0owL9dW4KhLsC5VKMetf10hFLKR08eKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=fb_outbound_notspam policy=fb_outbound score=0
 priorityscore=1501
 mlxlogscore=804 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080125
X-FB-Internal: deliver
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 21:13:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161527

Are there any comments on this patch?=0A=
=0A=
Thanks,=0A=
Daniel=0A=
=0A=
________________________________________=0A=
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Daniel Mueller via lists.openembedded.org <muel=
lerd=3Dfb.com@lists.openembedded.org>=0A=
Sent: Wednesday, February 2, 2022 09:18=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH] scripts/runqemu-ifdown: Don't treat the last ipt=
ables command as special=0A=
=0A=
The runqemu-ifup script performs a bunch of setup steps that=0A=
runqemu-ifdown attempts to undo later on. While a bunch of said setup=0A=
operations are considered fatal should they fail, the iptables based NAT=0A=
setup notably is not.=0A=
The tear down procedure in runqemu-ifdown, however, has the iptables=0A=
based tear down as the last operation, with the status of it determining=0A=
the overall status of the script. Hence, if this step fails, the script=0A=
is considered a failure overall. That is arguably inconsistent: If the=0A=
NAT setup did not succeed, the tear down cannot succeed either.=0A=
To ensure similarity of the two paths, let's not treat the last iptables=0A=
tear down operation any special and allow it to fail the runqemu-ifdown=0A=
script, but just ignore failures.=0A=
=0A=
Background: we have seen a NAT related setup problem on the ifup path=0A=
(which didn't cause script failure), but then saw an issue bubbled up=0A=
when this operation was meant to be undone on the ifdown path.=0A=
=0A=
Signed-off-by: Daniel M=FCller <muellerd@fb.com>=0A=
---=0A=
 scripts/runqemu-ifdown | 1 +=0A=
 1 file changed, 1 insertion(+)=0A=
=0A=
diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown=0A=
index a104c3..e0eb53 100755=0A=
--- a/scripts/runqemu-ifdown=0A=
+++ b/scripts/runqemu-ifdown=0A=
@@ -64,3 +64,4 @@ n=3D$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]=0A=
 dest=3D$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]=0A=
 $IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32=0A=
 $IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32=0A=
+true=0A=
--=0A=
2.34.1=0A=
=0A=

