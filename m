Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5276ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 05:16:00 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.52])
 by mx.groups.io with SMTP id smtpd.web10.2994.1662700557675349605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 22:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=edeoLTLV;
 spf=pass (domain: kpit.com, ip: 40.107.222.52,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6RtKbWUHmWi+ByTgBwNk7Fkak1rKj3qB7kC8sRyNvL88/4qx/qavomMHVsPNFIJSldHN+HaIezyGSvjqBKQnhCx6GJc0J4DBTHB28fV5DYvXrFzhhIE9AhTbaifyZWdsvfczfoedwlSXiyICuPwDXjEZdM+4F+egg08cwNCKFIATApNK1oZJN39b8eglVQcxys9DB+2vB1BmgvEKwfWpGDasqX7/NFOmJeGUPmap/ES+r6IL0ZGHraX2N4KGpLv7NitIjMA0zSCDGVaP6Ye/J5GGOqgvG3+g2xw2qeK/TBe6WerPjMqWkfKoDcueLL3rLtIrdbI2in7xQnrgmbtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrweUMeiCDlR4vktIkZ1++J/as6Wfeh+YUBR5q11pAk=;
 b=dZhcUHVKWhWqeuzPRPmGT9CIZNZyoS2jXzYTpshXbn/dCgnW69IK/6oZx12XV3qi8J1L/iQ/kxjvYgQ5ro9nf+mVdQMQcnZj/inUSi0xfDtlAOeIFt+8EGl4+YwFvKPPqDi2pWV9iPrN908QiMIqNWvcWbxtn4E5u0mJUK5wEPFBw/uYepmIMM3hIJwjyIpKAFN6oSZGZhM2dAEYg2bkRTZRTGn+1mAkFWX5dzgjm1VnXJx0+pyQeAJvvLA54wxHvcGcvk28GTJFUW5eqSa1ujlIxvte0moLtz3N7JToYDa8bqbA7ewslk552E5xlpNP1h0EyN+Q8xCEv1gd0OqxNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrweUMeiCDlR4vktIkZ1++J/as6Wfeh+YUBR5q11pAk=;
 b=edeoLTLVU553TCgBFYpj4N8nDIe5B4xmjPlvE2vc+TWLNXY8+Yj/gt7QEUIiS8mYrU5WwBzQdS1EGF89GWLGI4Shg1vwrZentg9xJ+CwdxLsJiJL4Nckw1Ky90aH02qF5btSMa+ZZQrKF3Vg+s1D/ps/fJ73OrvzMAoeFiMfi54=
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by MA0PR01MB8241.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:90::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 05:15:51 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 05:15:51 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: Steve Sakoman <steve@sakoman.com>, Virendra Kumar Thakur
	<Virendra.Thakur@kpit.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][dunfell][PATCH] tiff: Fix for CVE-2022-2867/8/9
Thread-Topic: [OE-Core][dunfell][PATCH] tiff: Fix for CVE-2022-2867/8/9
Thread-Index: AQHYw0B6338VKNFz7ki6sNt2/uw8e63V34OAgACvAkGAAAEqmQ==
Date: Fri, 9 Sep 2022 05:15:51 +0000
Message-ID: 
 <MAXPR01MB43271D5FB6F09233D766FBC69D439@MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM>
References: <20220908050409.17606-1-virendra.thakur@kpit.com>
 <CAOSpxdb8ijvdSSDs5v4U58saZT-aLVNykRJGLOpPfGr383kS5w@mail.gmail.com>
 <1713191FCF73F181.16466@lists.openembedded.org>
In-Reply-To: <1713191FCF73F181.16466@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXPR01MB4327:EE_|MA0PR01MB8241:EE_
x-ms-office365-filtering-correlation-id: 3647f83c-7a62-4e95-431e-08da92225cf9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cQ56+tWuIub0wBjYf1TY1OyCAwWmLfgg/EnnfF/nD1sqH9EAxXh2MkkAD8upJ67Qoj/lub933q5S/Iyt4PRecEC6Ruferu5G7EPMdyoVA116lVC9aU+EeswYQM851kGvG9PyVZRA42khOd/9Up9IkU1dCQ0J3eO5WSU6KOeZp0IUV+O3mH51+On3QtdteaZkgKJmESvri0fDEyIqrMmMh5tG2zEtAHOMZW3PU8iQTzdENKwR3ZiWjw2Q8oHIzN/0g7yera5SnTTumMMPo/ohSYO1Z7t7w8l2B+WHAdXE145WqLX0za/x0Q1pEoqlXLkw0s9+ydEmC+ABTTw/puziBVlNfT+SE8FFKIDNX4nUfsg7soj6tDGALLWCk4VUTIy0BdteDTt3z3DKYerDnNCx+UPl4Da+gnLDKP21fiCao1zn+N3zLzY9QhL2GUNUhacPtQmUaQP4l9RelMBI/3yHKsCTvEXJDR26A5iFYfMCtwDZZZ2RFKiRf8DwNKcLdiJtiYw4G2avZ6t3Olv07qF6qohJEbwvppjHe9pJotNzY8lj8DvcyxkEif24oQtG3BKtlZHxqaqJ/hcCSJERLo8zgkc6ODw+jAxx7pbotgbAlcR+AJISTRs149YK+Uso2jd6iWdXgZqqCh4v5ZXeuw5zTdWPPdVLPSYaVM1eI41F9cvYgPbixclXR7ZS0klW8fP/OzFYn2e7A+NuE/AspieccvBseghyfppWU1ZFs6VqNhFDt4xwx6MUdsYnNKqM/xNK3eRL6OXYuDv5R+iV7ncOM/tzU6YzUXq9L6oejLu7jGQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(38100700002)(86362001)(19627405001)(33656002)(122000001)(76116006)(66446008)(64756008)(4326008)(8676002)(91956017)(66946007)(66476007)(66556008)(84970400001)(166002)(38070700005)(99936003)(66574015)(41300700001)(83380400001)(55236004)(9686003)(6506007)(7696005)(53546011)(26005)(478600001)(71200400001)(55016003)(45080400002)(316002)(110136005)(2906002)(186003)(30864003)(5660300002)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?poRlAfh+sXqWj/VdSvo7ZUdB2YM/HxLTnYB0/DCU5dujnlzjlpFRSABppJ?=
 =?iso-8859-1?Q?8vdAnb9WRzIyeWtNt1dWVq50szT1Ej7djTe6QMitGPZqY+fJbGdTYYlZMK?=
 =?iso-8859-1?Q?mhSG0ph31fzgHpVsVh5DqXwSoOnKiuun6qLNconcGWjbTE2KO/8uL2JuGp?=
 =?iso-8859-1?Q?AXiI7avq80VstZIegmmZU+HmyH4SK058xYNsxR5ov5XG6wUMBTqVO435YO?=
 =?iso-8859-1?Q?lXST/0Z+jntD4BwkFfUVCblKiv/ivI4AFUZF2byDbVNmACQRguSuH4qg0c?=
 =?iso-8859-1?Q?vZAxxsuKKDyGw77kkW5ipjq3zcd51MZDylvw8n6CcrTG8AyLxOgE2hTW34?=
 =?iso-8859-1?Q?6NdWHER/+W0KRxdG2rwJozyHtgO4VQnWzte2FMChlwUKhajLtIGqMHBpbW?=
 =?iso-8859-1?Q?AadkgLLEOJmYyhDn1yyfC7WuIh4jKrRtQACgnDydrgZxh/6hwedxVvk0V6?=
 =?iso-8859-1?Q?kdTiy/kfNgGGhZvmVEKxyRnlerFcCYygT/vm3IzsK8rFkNLzIkzP+YvOQ+?=
 =?iso-8859-1?Q?AWGVpGOcVbpCdnJkjqEorwyEA8/8O2gXZ2QpOl5gW5ywJgbpv14dP1rOGp?=
 =?iso-8859-1?Q?tAlt2jFou7w3fk84+7tCo/qHXWhsdGEleklH+KfDW+m/qYdgNxSJfChg3M?=
 =?iso-8859-1?Q?To1t6tpMPBk7YA/m6JZwADd7EeT5lkG7v4ui7uN/IGnI6gNIsHkoX0augq?=
 =?iso-8859-1?Q?cag+Otuy1qR3h2D+Kf4LQls0d/E7EDMk7ewJ8gGcnmjyEmSGeCbfuG0k83?=
 =?iso-8859-1?Q?z9T+qHguT4FiexVve1NTeczwBzthrqx2QZfzfLfZ2//8wT3X9vM/85gPpK?=
 =?iso-8859-1?Q?p9wcBwKN//EXLv0wYnZD2GJVeMLfOxvCjYcRyLD9/KE6vHGSU7Kwy4g1pU?=
 =?iso-8859-1?Q?tFYfH2AtQ86v2ZcAOoUelfqvZ70l8cjsnYNVhS3RXWxcteweZYawIWqe9V?=
 =?iso-8859-1?Q?AgvcbYnC5STeqoEJT4sPn2PdD0x7B7vh1/Qt1xQQHYZdqgEh96FcoEvqtA?=
 =?iso-8859-1?Q?c1ysbV0q5txDU9AKQ4M0RYus5tiG6oO2rQa8cHKn3h3PAkNKyKNXx4u1Jr?=
 =?iso-8859-1?Q?EFzoak5/M7V7EK/O+7qwYrn6UCX98jcC3wM3sH3aJjnZePGeIvhubUIXtq?=
 =?iso-8859-1?Q?S8cfUs7aTmnFvu8WnRfvjm52/WYDl2nWX9ek0sO/f1sse/pjR4MbNLHOHZ?=
 =?iso-8859-1?Q?xVA4XzRrHYq4IoK204BM7SW4+MphaCL/URF9wGJApvsdpTQMmLVhBLL6wL?=
 =?iso-8859-1?Q?vp/oNEbu3hHY4Kwmapr8/QMx8rHW6n/LFg4HNhywrfrzIqvpweWTuYzteE?=
 =?iso-8859-1?Q?WscHBnxatdpIMtOf2xMGLERSkj8AAUmoEHTxufpR+uGyVUrnJxNQWHzUNK?=
 =?iso-8859-1?Q?5SKe5xsfJUBj4e0OMR5FTgEopPwpiaA7493vzH5sAzH3WeOzqmov9B7BE1?=
 =?iso-8859-1?Q?EAY7dv/u6QnVI6HcgY8BxQoIT3cdkq/kajQWpGv9WoPoW0dZLQqUKZq7Qo?=
 =?iso-8859-1?Q?9VM+5qm4c2etj7DDwbU7geU7OY7ACsYZRBe7BI7VP47xuWBhG+hD5FltB1?=
 =?iso-8859-1?Q?NColjEVT3XEVZoFkrQ867NAKsmHoT2LCCvA5doc2F5ht/uE46cWtwu9H73?=
 =?iso-8859-1?Q?jdbQdfAnJcQnk=3D?=
Content-Type: multipart/mixed;
	boundary="_004_MAXPR01MB43271D5FB6F09233D766FBC69D439MAXPR01MB4327INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3647f83c-7a62-4e95-431e-08da92225cf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 05:15:51.2572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 VsaehlVAc5lLzoaP9E2Ox5sPU4B3h6Zc5Wq11QmrBd3XcIpNk756hbp4lkCb8Sfs6Bh/2MWIklDCVzxTFxKtYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8241
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 05:16:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170478

--_004_MAXPR01MB43271D5FB6F09233D766FBC69D439MAXPR01MB4327INDP_
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB43271D5FB6F09233D766FBC69D439MAXPR01MB4327INDP_"

--_000_MAXPR01MB43271D5FB6F09233D766FBC69D439MAXPR01MB4327INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Please take this patch .
removed change-ID as its not needed.

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Virendra Thakur via lists.openembedded.org <vir=
endra.thakur=3Dkpit.com@lists.openembedded.org>
Sent: Friday, September 9, 2022 10:41 AM
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-Core][dunfell][PATCH] tiff: Fix for CVE-2022-2867/8/9

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.
Hi Steve,

I am attaching here with tiff patchset .
please let me know if its fine.



________________________________
From: Steve Sakoman <steve@sakoman.com>
Sent: Friday, September 9, 2022 12:14 AM
To: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Subject: Re: [OE-Core][dunfell][PATCH] tiff: Fix for CVE-2022-2867/8/9

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

On Wed, Sep 7, 2022 at 7:04 PM Virendra Thakur via
lists.openembedded.org
<virendra.thakur=3Dkpit.com@lists.openembedded.org> wrote:
>
> From: Virendra Thakur <virendrak@kpit.com>
>
> Add Patch to fix CVE-2022-2867, CVE-2022-2868
> CVE-2022-2869

This fails on the autobuilder:

ERROR: tiff-4.1.0-r0 do_patch: Applying patch
'CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch' on target directory
'/home/pokybuild/yocto-worker/reproducible/build/build-st-966841/reproducib=
leA/tmp/work/core2-64-poky-linux/tiff/4.1.0-r0/tiff-4.1.0'
Command Error: 'quilt --quiltrc
/home/pokybuild/yocto-worker/reproducible/build/build-st-966841/reproducibl=
eA/tmp/work/core2-64-poky-linux/tiff/4.1.0-r0/recipe-sysroot-native/etc/qui=
ltrc
push' exited with 0  Output:
Applying patch CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch
patching file tools/tiffcrop.c
Hunk #1 FAILED at 5153.
Hunk #2 succeeded at 4782 with fuzz 2 (offset -423 lines).
Hunk #4 FAILED at 5332.
Hunk #5 succeeded at 5449 with fuzz 2.
Hunk #6 succeeded at 5588 with fuzz 2.
2 out of 6 hunks FAILED -- rejects in file tools/tiffcrop.c
Patch CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch does not apply
(enforce with -f)

Perhaps your mailer is corrupting the patch?  This has been an issue
lately with other patches from kpit!

Steve

>
> Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> ---
>  ...022-2867-CVE-2022-2868-CVE-2022-2869.patch | 159 ++++++++++++++++++
>  meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
>  2 files changed, 160 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-2867-C=
VE-2022-2868-CVE-2022-2869.patch
>
> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022=
-2868-CVE-2022-2869.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-=
2867-CVE-2022-2868-CVE-2022-2869.patch
> new file mode 100644
> index 0000000000..131ff94119
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022-2868-C=
VE-2022-2869.patch
> @@ -0,0 +1,159 @@
> +From 07d79fcac2ead271b60e32aeb80f7b4f3be9ac8c Mon Sep 17 00:00:00 2001
> +From: Su Laus <sulau@freenet.de>
> +Date: Wed, 9 Feb 2022 21:31:29 +0000
> +Subject: [PATCH] tiffcrop.c: Fix issue #352 heap-buffer-overflow by corr=
ecting
> + uint32_t underflow.
> +
> +CVE: CVE-2022-2867 CVE-2022-2868 CVE-2022-2869
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgitlab.com%2Flibtiff%2Flibtiff%2F-%2Fcommit%2F07d79f=
cac2ead271b60e32aeb80f7b4f3be9ac8c&amp;data=3D05%7C01%7Cvirendra.thakur%40k=
pit.com%7C06f4664a51014a38772c08da91ca2d06%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C637982594827918330%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DKeN8brH6XLpD8sQUvDQHUfeG7Ld%2BnFtGl%2Bgr5WCiJX4%3D&amp;reserved=3D0<http=
s://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.com%=
2Flibtiff%2Flibtiff%2F-%2Fcommit%2F07d79fcac2ead271b60e32aeb80f7b4f3be9ac8c=
&data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7Cc7c73701ce6d4fb704b208da9221=
d9b0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637982971413084460%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DvQW2cVBF6m8oH0kbIE9Mcyh6HiCYQSkCj0HbJ2g%2=
FTR0%3D&reserved=3D0>]
> +Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> +---
> +Index: tiff-4.1.0/tools/tiffcrop.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- tiff-4.1.0.orig/tools/tiffcrop.c
> ++++ tiff-4.1.0/tools/tiffcrop.c
> +@@ -5153,29 +5153,45 @@ computeInputPixelOffsets(struct crop_mas
> +       y1 =3D _TIFFClampDoubleToUInt32(crop->corners[i].Y1);
> +       y2 =3D _TIFFClampDoubleToUInt32(crop->corners[i].Y2);
> +       }
> +-      if (x1 < 1)
> +-        crop->regionlist[i].x1 =3D 0;
> +-      else
> +-        crop->regionlist[i].x1 =3D (uint32) (x1 - 1);
> ++      /* a) Region needs to be within image sizes 0.. width-1; 0..lengt=
h-1
> ++       * b) Corners are expected to be submitted as top-left to bottom-=
right.
> ++       *    Therefore, check that and reorder input.
> ++       * (be aware x,y are already casted to (uint32_t) and avoid (0 - =
1) )
> ++       */
> ++      uint32_t aux;
> ++      if (x1 > x2) {
> ++        aux =3D x1;
> ++        x1 =3D x2;
> ++        x2 =3D aux;
> ++      }
> ++      if (y1 > y2) {
> ++        aux =3D y1;
> ++        y1 =3D y2;
> ++        y2 =3D aux;
> ++      }
> ++      if (x1 > image->width - 1)
> ++        crop->regionlist[i].x1 =3D image->width - 1;
> ++      else if (x1 > 0)
> ++        crop->regionlist[i].x1 =3D (uint32_t)(x1 - 1);
> +
> +       if (x2 > image->width - 1)
> +         crop->regionlist[i].x2 =3D image->width - 1;
> +-      else
> +-        crop->regionlist[i].x2 =3D (uint32) (x2 - 1);
> +-      zwidth  =3D crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
> +-
> +-      if (y1 < 1)
> +-        crop->regionlist[i].y1 =3D 0;
> +-      else
> +-        crop->regionlist[i].y1 =3D (uint32) (y1 - 1);
> ++      else if (x2 > 0)
> ++        crop->regionlist[i].x2 =3D (uint32_t)(x2 - 1);
> ++
> ++      zwidth =3D crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
> ++
> ++      if (y1 > image->length - 1)
> ++        crop->regionlist[i].y1 =3D image->length - 1;
> ++      else if (y1 > 0)
> ++        crop->regionlist[i].y1 =3D (uint32_t)(y1 - 1);
> +
> +       if (y2 > image->length - 1)
> +         crop->regionlist[i].y2 =3D image->length - 1;
> +-      else
> +-        crop->regionlist[i].y2 =3D (uint32) (y2 - 1);
> +-
> +-      zlength =3D crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
> ++      else if (y2 > 0)
> ++        crop->regionlist[i].y2 =3D (uint32_t)(y2 - 1);
> +
> ++      zlength =3D crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
> +       if (zwidth > max_width)
> +         max_width =3D zwidth;
> +       if (zlength > max_length)
> +@@ -5205,7 +5221,7 @@ computeInputPixelOffsets(struct crop_mas
> +       }
> +       }
> +     return (0);
> +-    }
> ++    }  /* crop_mode =3D=3D CROP_REGIONS */
> +
> +   /* Convert crop margins into offsets into image
> +    * Margins are expressed as pixel rows and columns, not bytes
> +@@ -5241,7 +5257,7 @@ computeInputPixelOffsets(struct crop_mas
> +       bmargin =3D (uint32) 0;
> +       return (-1);
> +       }
> +-    }
> ++    }  /* crop_mode =3D=3D CROP_MARGINS */
> +   else
> +     { /* no margins requested */
> +     tmargin =3D (uint32) 0;
> +@@ -5332,24 +5348,23 @@ computeInputPixelOffsets(struct crop_mas
> +   off->endx   =3D endx;
> +   off->endy   =3D endy;
> +
> +-  crop_width  =3D endx - startx + 1;
> +-  crop_length =3D endy - starty + 1;
> +-
> +-  if (crop_width <=3D 0)
> ++  if (endx + 1 <=3D startx)
> +     {
> +     TIFFError("computeInputPixelOffsets",
> +                "Invalid left/right margins and /or image crop width req=
uested");
> +     return (-1);
> +     }
> ++  crop_width  =3D endx - startx + 1;
> +   if (crop_width > image->width)
> +     crop_width =3D image->width;
> +
> +-  if (crop_length <=3D 0)
> ++  if (endy + 1 <=3D starty)
> +     {
> +     TIFFError("computeInputPixelOffsets",
> +               "Invalid top/bottom margins and /or image crop length req=
uested");
> +     return (-1);
> +     }
> ++  crop_length =3D endy - starty + 1;
> +   if (crop_length > image->length)
> +     crop_length =3D image->length;
> +
> +@@ -5449,10 +5464,17 @@ getCropOffsets(struct image_data *image,
> +   else
> +     crop->selections =3D crop->zones;
> +
> +-  for (i =3D 0; i < crop->zones; i++)
> ++  /* Initialize regions iterator i */
> ++  i =3D 0;
> ++  for (int j =3D 0; j < crop->zones; j++)
> +     {
> +-    seg =3D crop->zonelist[i].position;
> +-    total =3D crop->zonelist[i].total;
> ++    seg =3D crop->zonelist[j].position;
> ++    total =3D crop->zonelist[j].total;
> ++
> ++    /* check for not allowed zone cases like 0:0; 4:3; etc. and skip th=
at input */
> ++    if (seg =3D=3D 0 || total =3D=3D 0 || seg > total) {
> ++        continue;
> ++    }
> +
> +     switch (crop->edge_ref)
> +       {
> +@@ -5581,8 +5603,11 @@ getCropOffsets(struct image_data *image,
> +                     i + 1, (uint32)zwidth, (uint32)zlength,
> +                   crop->regionlist[i].x1, crop->regionlist[i].x2,
> +                     crop->regionlist[i].y1, crop->regionlist[i].y2);
> ++  /* increment regions iterator */
> ++  i++;
> +     }
> +-
> ++    /* set number of generated regions out of given zones */
> ++    crop->selections =3D i;
> +   return (0);
> +   } /* end getCropOffsets */
> +
> +--
> +GitLab
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.1.0.bb
> index c061d2aaac..93a35230d6 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
> @@ -26,6 +26,7 @@ SRC_URI =3D "https://apc01.safelinks.protection.outlook=
.com/?url=3Dhttp%3A%2F%2Fdownload.osgeo.org%2Flibtiff%2Ftiff-%24&amp;data=
=3D05%7C01%7Cvirendra.thakur%40kpit.com%7C06f4664a51014a38772c08da91ca2d06%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637982594827918330%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000%7C%7C%7C&amp;sdata=3DCfstd%2BIU%2FQTf5%2F3xbc03woC9PK4yLt9vzYyv=
gG5%2FVdg%3D&amp;reserved=3D0{PV}.tar.gz \
>             file://CVE-2022-0924.patch \
>             file://CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch \
>             file://CVE-2022-34526.patch \
> +           file://CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch \
>            "
>  SRC_URI[md5sum] =3D "2165e7aba557463acc0664e71a3ed424"
>  SRC_URI[sha256sum] =3D "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b=
4d65c7d6775b8634"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
>
>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAXPR01MB43271D5FB6F09233D766FBC69D439MAXPR01MB4327INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"signature_bookmark"></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)" class=3D"elementToProof">
Please take this patch .&nbsp;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)" class=3D"elementToProof">
removed change-ID as its not needed.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)" class=3D"elementToProof">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Virendra Thakur via lists.openembedded.org
 &lt;virendra.thakur=3Dkpit.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, September 9, 2022 10:41 AM<br>
<b>To:</b> Steve Sakoman &lt;steve@sakoman.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-Core][dunfell][PATCH] tiff: Fix for CVE-2022-2867/8=
/9</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"background-color:#F7F4A9"><span style=3D"font-size:12pt; font=
-weight:bold; font-family:'Cambria','times new roman','garamond',serif; col=
or:#ff0000">Caution:
<span style=3D"font-size:8 pt; font-weight:normal; font-family:'times new r=
oman',serif; color:#ff0000">
This email originated from outside of the KPIT. Do not click links or open =
attachments unless you recognize the sender and know the content is safe.
</span></span></div>
<div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Hi Steve,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
I am attaching here with tiff patchset .&nbsp;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
please&nbsp;let me know if its fine.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div id=3D"x_signature_bookmark"></div>
<div id=3D"x_appendonsend"></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Steve Sakoman &lt;s=
teve@sakoman.com&gt;<br>
<b>Sent:</b> Friday, September 9, 2022 12:14 AM<br>
<b>To:</b> Virendra Kumar Thakur &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Virendra Kumar Thakur &lt;Virendra.Thakur@kpit.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-Core][dunfell][PATCH] tiff: Fix for CVE-2022-2867/8=
/9</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Caution: This email originated from outside of t=
he KPIT. Do not click links or open attachments unless you recognize the se=
nder and know the content is safe.<br>
<br>
On Wed, Sep 7, 2022 at 7:04 PM Virendra Thakur via<br>
lists.openembedded.org<br>
&lt;virendra.thakur=3Dkpit.com@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; From: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
&gt;<br>
&gt; Add Patch to fix CVE-2022-2867, CVE-2022-2868<br>
&gt; CVE-2022-2869<br>
<br>
This fails on the autobuilder:<br>
<br>
ERROR: tiff-4.1.0-r0 do_patch: Applying patch<br>
'CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch' on target directory<br>
'/home/pokybuild/yocto-worker/reproducible/build/build-st-966841/reproducib=
leA/tmp/work/core2-64-poky-linux/tiff/4.1.0-r0/tiff-4.1.0'<br>
Command Error: 'quilt --quiltrc<br>
/home/pokybuild/yocto-worker/reproducible/build/build-st-966841/reproducibl=
eA/tmp/work/core2-64-poky-linux/tiff/4.1.0-r0/recipe-sysroot-native/etc/qui=
ltrc<br>
push' exited with 0&nbsp; Output:<br>
Applying patch CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch<br>
patching file tools/tiffcrop.c<br>
Hunk #1 FAILED at 5153.<br>
Hunk #2 succeeded at 4782 with fuzz 2 (offset -423 lines).<br>
Hunk #4 FAILED at 5332.<br>
Hunk #5 succeeded at 5449 with fuzz 2.<br>
Hunk #6 succeeded at 5588 with fuzz 2.<br>
2 out of 6 hunks FAILED -- rejects in file tools/tiffcrop.c<br>
Patch CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch does not apply<br>
(enforce with -f)<br>
<br>
Perhaps your mailer is corrupting the patch?&nbsp; This has been an issue<b=
r>
lately with other patches from kpit!<br>
<br>
Steve<br>
<br>
&gt;<br>
&gt; Signed-off-by: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...022-2867-CVE-2022-2868-CVE-2022-2869.patch | 159 ++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |&nbsp;&nbsp; 1 +<=
br>
&gt;&nbsp; 2 files changed, 160 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-202=
2-2867-CVE-2022-2868-CVE-2022-2869.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2=
022-2868-CVE-2022-2869.patch b/meta/recipes-multimedia/libtiff/files/CVE-20=
22-2867-CVE-2022-2868-CVE-2022-2869.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..131ff94119<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022-286=
8-CVE-2022-2869.patch<br>
&gt; @@ -0,0 +1,159 @@<br>
&gt; +From 07d79fcac2ead271b60e32aeb80f7b4f3be9ac8c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Su Laus &lt;sulau@freenet.de&gt;<br>
&gt; +Date: Wed, 9 Feb 2022 21:31:29 +0000<br>
&gt; +Subject: [PATCH] tiffcrop.c: Fix issue #352 heap-buffer-overflow by c=
orrecting<br>
&gt; + uint32_t underflow.<br>
&gt; +<br>
&gt; +CVE: CVE-2022-2867 CVE-2022-2868 CVE-2022-2869<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.com%2Flibtiff%2Flibtiff%2F-%2Fc=
ommit%2F07d79fcac2ead271b60e32aeb80f7b4f3be9ac8c&amp;data=3D05%7C01%7Cviren=
dra.thakur%40kpit.com%7Cc7c73701ce6d4fb704b208da9221d9b0%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637982971413084460%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&amp;sdata=3DvQW2cVBF6m8oH0kbIE9Mcyh6HiCYQSkCj0HbJ2g%2FTR0%3D&amp;reserve=
d=3D0" data-auth=3D"Verified" originalsrc=3D"https://gitlab.com/libtiff/lib=
tiff/-/commit/07d79fcac2ead271b60e32aeb80f7b4f3be9ac8c" shash=3D"VSEPl2l5LX=
w6ZJzVMKGXnvzXnD/TGg5XNwOG6fPyUh4FaWgnDIPCLnhOul0gPIiMDfN1Hts/LL52Vlhmj0ITh=
sxdIqnCwWh3SjpX33DDn1oZH2ZIYcjNnMwHhTLaRg6hZX66E0Qh82wW8PyVTF5WIkJcelWej5H7=
SsoJkXLJZew=3D">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgitlab.com%2Flibtiff%2Flibtiff%2F-%2Fcommit%2F07d79fcac2ead271b60e=
32aeb80f7b4f3be9ac8c&amp;amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7C=
06f4664a51014a38772c08da91ca2d06%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0=
%7C637982594827918330%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DKeN8b=
rH6XLpD8sQUvDQHUfeG7Ld%2BnFtGl%2Bgr5WCiJX4%3D&amp;amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
&gt; +---<br>
&gt; +Index: tiff-4.1.0/tools/tiffcrop.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- tiff-4.1.0.orig/tools/tiffcrop.c<br>
&gt; ++++ tiff-4.1.0/tools/tiffcrop.c<br>
&gt; +@@ -5153,29 +5153,45 @@ computeInputPixelOffsets(struct crop_mas<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; y1 =3D _TIFFClampDoubleToUInt32(=
crop-&gt;corners[i].Y1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; y2 =3D _TIFFClampDoubleToUInt32(=
crop-&gt;corners[i].Y2);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (x1 &lt; 1)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].x1=
 =3D 0;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].x1=
 =3D (uint32) (x1 - 1);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* a) Region needs to be within image=
 sizes 0.. width-1; 0..length-1<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * b) Corners are expected to be=
 submitted as top-left to bottom-right.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp; Therefore, =
check that and reorder input.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (be aware x,y are already cas=
ted to (uint32_t) and avoid (0 - 1) )<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t aux;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (x1 &gt; x2) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aux =3D x1;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x1 =3D x2;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x2 =3D aux;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (y1 &gt; y2) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aux =3D y1;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; y1 =3D y2;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; y2 =3D aux;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (x1 &gt; image-&gt;width - 1)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].x1=
 =3D image-&gt;width - 1;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (x1 &gt; 0)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].x1=
 =3D (uint32_t)(x1 - 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (x2 &gt; image-&gt;width - 1)=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[=
i].x2 =3D image-&gt;width - 1;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].x2=
 =3D (uint32) (x2 - 1);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zwidth&nbsp; =3D crop-&gt;regionlist[=
i].x2 - crop-&gt;regionlist[i].x1 + 1;<br>
&gt; +-<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (y1 &lt; 1)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].y1=
 =3D 0;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].y1=
 =3D (uint32) (y1 - 1);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (x2 &gt; 0)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].x2=
 =3D (uint32_t)(x2 - 1);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zwidth =3D crop-&gt;regionlist[i].x2 =
- crop-&gt;regionlist[i].x1 + 1;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (y1 &gt; image-&gt;length - 1)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].y1=
 =3D image-&gt;length - 1;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (y1 &gt; 0)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].y1=
 =3D (uint32_t)(y1 - 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (y2 &gt; image-&gt;length - 1=
)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[=
i].y2 =3D image-&gt;length - 1;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].y2=
 =3D (uint32) (y2 - 1);<br>
&gt; +-<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zlength =3D crop-&gt;regionlist[i].y2=
 - crop-&gt;regionlist[i].y1 + 1;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (y2 &gt; 0)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].y2=
 =3D (uint32_t)(y2 - 1);<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zlength =3D crop-&gt;regionlist[i].y2=
 - crop-&gt;regionlist[i].y1 + 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (zwidth &gt; max_width)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_width =3D zwidth=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (zlength &gt; max_length)<br>
&gt; +@@ -5205,7 +5221,7 @@ computeInputPixelOffsets(struct crop_mas<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return (0);<br>
&gt; +-&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp; }&nbsp; /* crop_mode =3D=3D CROP_REGIONS */<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; /* Convert crop margins into offsets into image<br>
&gt; +&nbsp;&nbsp;&nbsp; * Margins are expressed as pixel rows and columns,=
 not bytes<br>
&gt; +@@ -5241,7 +5257,7 @@ computeInputPixelOffsets(struct crop_mas<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bmargin =3D (uint32) 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (-1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp; }&nbsp; /* crop_mode =3D=3D CROP_MARGINS */<br>
&gt; +&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { /* no margins requested */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; tmargin =3D (uint32) 0;<br>
&gt; +@@ -5332,24 +5348,23 @@ computeInputPixelOffsets(struct crop_mas<br>
&gt; +&nbsp;&nbsp; off-&gt;endx&nbsp;&nbsp; =3D endx;<br>
&gt; +&nbsp;&nbsp; off-&gt;endy&nbsp;&nbsp; =3D endy;<br>
&gt; +<br>
&gt; +-&nbsp; crop_width&nbsp; =3D endx - startx + 1;<br>
&gt; +-&nbsp; crop_length =3D endy - starty + 1;<br>
&gt; +-<br>
&gt; +-&nbsp; if (crop_width &lt;=3D 0)<br>
&gt; ++&nbsp; if (endx + 1 &lt;=3D startx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; TIFFError(&quot;computeInputPixelOffsets&quo=
t;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;Invalid left/right margins and /or image crop w=
idth requested&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return (-1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp; crop_width&nbsp; =3D endx - startx + 1;<br>
&gt; +&nbsp;&nbsp; if (crop_width &gt; image-&gt;width)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; crop_width =3D image-&gt;width;<br>
&gt; +<br>
&gt; +-&nbsp; if (crop_length &lt;=3D 0)<br>
&gt; ++&nbsp; if (endy + 1 &lt;=3D starty)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; TIFFError(&quot;computeInputPixelOffsets&quo=
t;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &quot;Invalid top/bottom margins and /or image crop length =
requested&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return (-1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp; crop_length =3D endy - starty + 1;<br>
&gt; +&nbsp;&nbsp; if (crop_length &gt; image-&gt;length)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; crop_length =3D image-&gt;length;<br>
&gt; +<br>
&gt; +@@ -5449,10 +5464,17 @@ getCropOffsets(struct image_data *image,<br>
&gt; +&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;selections =3D crop-&gt;zones;<br>
&gt; +<br>
&gt; +-&nbsp; for (i =3D 0; i &lt; crop-&gt;zones; i++)<br>
&gt; ++&nbsp; /* Initialize regions iterator i */<br>
&gt; ++&nbsp; i =3D 0;<br>
&gt; ++&nbsp; for (int j =3D 0; j &lt; crop-&gt;zones; j++)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +-&nbsp;&nbsp;&nbsp; seg =3D crop-&gt;zonelist[i].position;<br>
&gt; +-&nbsp;&nbsp;&nbsp; total =3D crop-&gt;zonelist[i].total;<br>
&gt; ++&nbsp;&nbsp;&nbsp; seg =3D crop-&gt;zonelist[j].position;<br>
&gt; ++&nbsp;&nbsp;&nbsp; total =3D crop-&gt;zonelist[j].total;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* check for not allowed zone cases like 0:0; 4:3=
; etc. and skip that input */<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (seg =3D=3D 0 || total =3D=3D 0 || seg &gt; to=
tal) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; switch (crop-&gt;edge_ref)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +@@ -5581,8 +5603,11 @@ getCropOffsets(struct image_data *image,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i + 1, (uint32)zwidth, =
(uint32)zlength,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].x1, crop-&gt=
;regionlist[i].x2,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crop-&gt;regionlist[i].=
y1, crop-&gt;regionlist[i].y2);<br>
&gt; ++&nbsp; /* increment regions iterator */<br>
&gt; ++&nbsp; i++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* set number of generated regions out of given z=
ones */<br>
&gt; ++&nbsp;&nbsp;&nbsp; crop-&gt;selections =3D i;<br>
&gt; +&nbsp;&nbsp; return (0);<br>
&gt; +&nbsp;&nbsp; } /* end getCropOffsets */<br>
&gt; +<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/reci=
pes-multimedia/libtiff/tiff_4.1.0.bb<br>
&gt; index c061d2aaac..93a35230d6 100644<br>
&gt; --- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb<br>
&gt; +++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb<br>
&gt; @@ -26,6 +26,7 @@ SRC_URI =3D &quot;https://apc01.safelinks.protection=
.outlook.com/?url=3Dhttp%3A%2F%2Fdownload.osgeo.org%2Flibtiff%2Ftiff-%24&am=
p;amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7C06f4664a51014a38772c08d=
a91ca2d06%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637982594827918330%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DCfstd%2BIU%2FQTf5%2F3xbc03wo=
C9PK4yLt9vzYyvgG5%2FVdg%3D&amp;amp;reserved=3D0{PV}.tar.gz
 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2022-0924.patch" data-auth=3D"NotApplicable">file:/=
/CVE-2022-0924.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch" data-a=
uth=3D"NotApplicable">
file://CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2022-34526.patch" data-auth=3D"NotApplicable">file:=
//CVE-2022-34526.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch" data-auth=3D"No=
tApplicable">
file://CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quo=
t;<br>
&gt;&nbsp; SRC_URI[md5sum] =3D &quot;2165e7aba557463acc0664e71a3ed424&quot;=
<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;5d29f32517dadb6dbcd1255ea5bbc93a2b5=
4b94fbf83653b4d65c7d6775b8634&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
&gt;<br>
&gt; <br>
&gt;<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails. </div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MAXPR01MB43271D5FB6F09233D766FBC69D439MAXPR01MB4327INDP_--

--_004_MAXPR01MB43271D5FB6F09233D766FBC69D439MAXPR01MB4327INDP_
Content-Type: text/x-patch; name="0001-tiff-Fix-for-CVE-2022-2867-8-9.patch"
Content-Description: 0001-tiff-Fix-for-CVE-2022-2867-8-9.patch
Content-Disposition: attachment;
	filename="0001-tiff-Fix-for-CVE-2022-2867-8-9.patch"; size=6916;
	creation-date="Fri, 09 Sep 2022 05:15:40 GMT";
	modification-date="Fri, 09 Sep 2022 05:15:51 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiOTI4NWFhOTllMWQ1Yjk0OGI3MzhhNzk1MTZiY2VlOWZiMmZhY2E3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJha0BrcGl0LmNvbT4K
RGF0ZTogTW9uLCA1IFNlcCAyMDIyIDE1OjExOjExICswNTMwClN1YmplY3Q6IFtQQVRDSF0gdGlm
ZjogRml4IGZvciBDVkUtMjAyMi0yODY3LzgvOQoKQWRkIFBhdGNoIHRvIGZpeCBDVkUtMjAyMi0y
ODY3LCBDVkUtMjAyMi0yODY4CkNWRS0yMDIyLTI4NjkKClNpZ25lZC1vZmYtYnk6IFZpcmVuZHJh
IFRoYWt1ciA8dmlyZW5kcmFrQGtwaXQuY29tPgotLS0KIC4uLjAyMi0yODY3LUNWRS0yMDIyLTI4
NjgtQ1ZFLTIwMjItMjg2OS5wYXRjaCB8IDE1OSArKysrKysrKysrKysrKysrKysKIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2xpYnRpZmYvdGlmZl80LjEuMC5iYiB8ICAgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDE2MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvbGlidGlmZi9maWxlcy9DVkUtMjAyMi0yODY3LUNWRS0yMDIyLTI4NjgtQ1ZF
LTIwMjItMjg2OS5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xp
YnRpZmYvZmlsZXMvQ1ZFLTIwMjItMjg2Ny1DVkUtMjAyMi0yODY4LUNWRS0yMDIyLTI4NjkucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJ0aWZmL2ZpbGVzL0NWRS0yMDIyLTI4Njct
Q1ZFLTIwMjItMjg2OC1DVkUtMjAyMi0yODY5LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjEzMWZmOTQxMTkKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9saWJ0aWZmL2ZpbGVzL0NWRS0yMDIyLTI4NjctQ1ZFLTIwMjItMjg2OC1D
VkUtMjAyMi0yODY5LnBhdGNoCkBAIC0wLDAgKzEsMTU5IEBACitGcm9tIDA3ZDc5ZmNhYzJlYWQy
NzFiNjBlMzJhZWI4MGY3YjRmM2JlOWFjOGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
OiBTdSBMYXVzIDxzdWxhdUBmcmVlbmV0LmRlPgorRGF0ZTogV2VkLCA5IEZlYiAyMDIyIDIxOjMx
OjI5ICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIHRpZmZjcm9wLmM6IEZpeCBpc3N1ZSAjMzUyIGhl
YXAtYnVmZmVyLW92ZXJmbG93IGJ5IGNvcnJlY3RpbmcKKyB1aW50MzJfdCB1bmRlcmZsb3cuCisK
K0NWRTogQ1ZFLTIwMjItMjg2NyBDVkUtMjAyMi0yODY4IENWRS0yMDIyLTI4NjkKK1Vwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0bGFiLmNvbS9saWJ0aWZmL2xpYnRpZmYvLS9j
b21taXQvMDdkNzlmY2FjMmVhZDI3MWI2MGUzMmFlYjgwZjdiNGYzYmU5YWM4Y10KK1NpZ25lZC1v
ZmYtYnk6IFZpcmVuZHJhIFRoYWt1ciA8dmlyZW5kcmFrQGtwaXQuY29tPgorLS0tCitJbmRleDog
dGlmZi00LjEuMC90b29scy90aWZmY3JvcC5jCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CistLS0gdGlmZi00LjEuMC5v
cmlnL3Rvb2xzL3RpZmZjcm9wLmMKKysrKyB0aWZmLTQuMS4wL3Rvb2xzL3RpZmZjcm9wLmMKK0BA
IC01MTUzLDI5ICs1MTUzLDQ1IEBAIGNvbXB1dGVJbnB1dFBpeGVsT2Zmc2V0cyhzdHJ1Y3QgY3Jv
cF9tYXMKKyAJeTEgPSBfVElGRkNsYW1wRG91YmxlVG9VSW50MzIoY3JvcC0+Y29ybmVyc1tpXS5Z
MSk7CisgCXkyID0gX1RJRkZDbGFtcERvdWJsZVRvVUludDMyKGNyb3AtPmNvcm5lcnNbaV0uWTIp
OworIAl9CistICAgICAgaWYgKHgxIDwgMSkKKy0gICAgICAgIGNyb3AtPnJlZ2lvbmxpc3RbaV0u
eDEgPSAwOworLSAgICAgIGVsc2UKKy0gICAgICAgIGNyb3AtPnJlZ2lvbmxpc3RbaV0ueDEgPSAo
dWludDMyKSAoeDEgLSAxKTsKKysgICAgICAvKiBhKSBSZWdpb24gbmVlZHMgdG8gYmUgd2l0aGlu
IGltYWdlIHNpemVzIDAuLiB3aWR0aC0xOyAwLi5sZW5ndGgtMSAKKysgICAgICAgKiBiKSBDb3Ju
ZXJzIGFyZSBleHBlY3RlZCB0byBiZSBzdWJtaXR0ZWQgYXMgdG9wLWxlZnQgdG8gYm90dG9tLXJp
Z2h0LgorKyAgICAgICAqICAgIFRoZXJlZm9yZSwgY2hlY2sgdGhhdCBhbmQgcmVvcmRlciBpbnB1
dC4KKysgICAgICAgKiAoYmUgYXdhcmUgeCx5IGFyZSBhbHJlYWR5IGNhc3RlZCB0byAodWludDMy
X3QpIGFuZCBhdm9pZCAoMCAtIDEpICkKKysgICAgICAgKi8KKysgICAgICB1aW50MzJfdCBhdXg7
CisrICAgICAgaWYgKHgxID4geDIpIHsKKysgICAgICAgIGF1eCA9IHgxOworKyAgICAgICAgeDEg
PSB4MjsKKysgICAgICAgIHgyID0gYXV4OworKyAgICAgIH0KKysgICAgICBpZiAoeTEgPiB5Mikg
eworKyAgICAgICAgYXV4ID0geTE7CisrICAgICAgICB5MSA9IHkyOworKyAgICAgICAgeTIgPSBh
dXg7CisrICAgICAgfQorKyAgICAgIGlmICh4MSA+IGltYWdlLT53aWR0aCAtIDEpCisrICAgICAg
ICBjcm9wLT5yZWdpb25saXN0W2ldLngxID0gaW1hZ2UtPndpZHRoIC0gMTsKKysgICAgICBlbHNl
IGlmICh4MSA+IDApCisrICAgICAgICBjcm9wLT5yZWdpb25saXN0W2ldLngxID0gKHVpbnQzMl90
KSh4MSAtIDEpOworIAorICAgICAgIGlmICh4MiA+IGltYWdlLT53aWR0aCAtIDEpCisgICAgICAg
ICBjcm9wLT5yZWdpb25saXN0W2ldLngyID0gaW1hZ2UtPndpZHRoIC0gMTsKKy0gICAgICBlbHNl
CistICAgICAgICBjcm9wLT5yZWdpb25saXN0W2ldLngyID0gKHVpbnQzMikgKHgyIC0gMSk7Cist
ICAgICAgendpZHRoICA9IGNyb3AtPnJlZ2lvbmxpc3RbaV0ueDIgLSBjcm9wLT5yZWdpb25saXN0
W2ldLngxICsgMTsgCistCistICAgICAgaWYgKHkxIDwgMSkKKy0gICAgICAgIGNyb3AtPnJlZ2lv
bmxpc3RbaV0ueTEgPSAwOworLSAgICAgIGVsc2UKKy0gICAgICAgIGNyb3AtPnJlZ2lvbmxpc3Rb
aV0ueTEgPSAodWludDMyKSAoeTEgLSAxKTsKKysgICAgICBlbHNlIGlmICh4MiA+IDApCisrICAg
ICAgICBjcm9wLT5yZWdpb25saXN0W2ldLngyID0gKHVpbnQzMl90KSh4MiAtIDEpOworKworKyAg
ICAgIHp3aWR0aCA9IGNyb3AtPnJlZ2lvbmxpc3RbaV0ueDIgLSBjcm9wLT5yZWdpb25saXN0W2ld
LngxICsgMTsKKysKKysgICAgICBpZiAoeTEgPiBpbWFnZS0+bGVuZ3RoIC0gMSkKKysgICAgICAg
IGNyb3AtPnJlZ2lvbmxpc3RbaV0ueTEgPSBpbWFnZS0+bGVuZ3RoIC0gMTsKKysgICAgICBlbHNl
IGlmICh5MSA+IDApCisrICAgICAgICBjcm9wLT5yZWdpb25saXN0W2ldLnkxID0gKHVpbnQzMl90
KSh5MSAtIDEpOworIAorICAgICAgIGlmICh5MiA+IGltYWdlLT5sZW5ndGggLSAxKQorICAgICAg
ICAgY3JvcC0+cmVnaW9ubGlzdFtpXS55MiA9IGltYWdlLT5sZW5ndGggLSAxOworLSAgICAgIGVs
c2UKKy0gICAgICAgIGNyb3AtPnJlZ2lvbmxpc3RbaV0ueTIgPSAodWludDMyKSAoeTIgLSAxKTsK
Ky0KKy0gICAgICB6bGVuZ3RoID0gY3JvcC0+cmVnaW9ubGlzdFtpXS55MiAtIGNyb3AtPnJlZ2lv
bmxpc3RbaV0ueTEgKyAxOyAKKysgICAgICBlbHNlIGlmICh5MiA+IDApCisrICAgICAgICBjcm9w
LT5yZWdpb25saXN0W2ldLnkyID0gKHVpbnQzMl90KSh5MiAtIDEpOworIAorKyAgICAgIHpsZW5n
dGggPSBjcm9wLT5yZWdpb25saXN0W2ldLnkyIC0gY3JvcC0+cmVnaW9ubGlzdFtpXS55MSArIDE7
CisgICAgICAgaWYgKHp3aWR0aCA+IG1heF93aWR0aCkKKyAgICAgICAgIG1heF93aWR0aCA9IHp3
aWR0aDsKKyAgICAgICBpZiAoemxlbmd0aCA+IG1heF9sZW5ndGgpCitAQCAtNTIwNSw3ICs1MjIx
LDcgQEAgY29tcHV0ZUlucHV0UGl4ZWxPZmZzZXRzKHN0cnVjdCBjcm9wX21hcworIAl9CisgICAg
ICAgfQorICAgICByZXR1cm4gKDApOworLSAgICB9CisrICAgIH0gIC8qIGNyb3BfbW9kZSA9PSBD
Uk9QX1JFR0lPTlMgKi8KKyAgIAorICAgLyogQ29udmVydCBjcm9wIG1hcmdpbnMgaW50byBvZmZz
ZXRzIGludG8gaW1hZ2UKKyAgICAqIE1hcmdpbnMgYXJlIGV4cHJlc3NlZCBhcyBwaXhlbCByb3dz
IGFuZCBjb2x1bW5zLCBub3QgYnl0ZXMKK0BAIC01MjQxLDcgKzUyNTcsNyBAQCBjb21wdXRlSW5w
dXRQaXhlbE9mZnNldHMoc3RydWN0IGNyb3BfbWFzCisgICAgICAgYm1hcmdpbiA9ICh1aW50MzIp
IDA7CisgICAgICAgcmV0dXJuICgtMSk7CisgICAgICAgfQorLSAgICB9CisrICAgIH0gIC8qIGNy
b3BfbW9kZSA9PSBDUk9QX01BUkdJTlMgKi8KKyAgIGVsc2UKKyAgICAgeyAvKiBubyBtYXJnaW5z
IHJlcXVlc3RlZCAqLworICAgICB0bWFyZ2luID0gKHVpbnQzMikgMDsKK0BAIC01MzMyLDI0ICs1
MzQ4LDIzIEBAIGNvbXB1dGVJbnB1dFBpeGVsT2Zmc2V0cyhzdHJ1Y3QgY3JvcF9tYXMKKyAgIG9m
Zi0+ZW5keCAgID0gZW5keDsKKyAgIG9mZi0+ZW5keSAgID0gZW5keTsKKyAKKy0gIGNyb3Bfd2lk
dGggID0gZW5keCAtIHN0YXJ0eCArIDE7CistICBjcm9wX2xlbmd0aCA9IGVuZHkgLSBzdGFydHkg
KyAxOworLQorLSAgaWYgKGNyb3Bfd2lkdGggPD0gMCkKKysgIGlmIChlbmR4ICsgMSA8PSBzdGFy
dHgpCisgICAgIHsKKyAgICAgVElGRkVycm9yKCJjb21wdXRlSW5wdXRQaXhlbE9mZnNldHMiLCAK
KyAgICAgICAgICAgICAgICAiSW52YWxpZCBsZWZ0L3JpZ2h0IG1hcmdpbnMgYW5kIC9vciBpbWFn
ZSBjcm9wIHdpZHRoIHJlcXVlc3RlZCIpOworICAgICByZXR1cm4gKC0xKTsKKyAgICAgfQorKyAg
Y3JvcF93aWR0aCAgPSBlbmR4IC0gc3RhcnR4ICsgMTsKKyAgIGlmIChjcm9wX3dpZHRoID4gaW1h
Z2UtPndpZHRoKQorICAgICBjcm9wX3dpZHRoID0gaW1hZ2UtPndpZHRoOworIAorLSAgaWYgKGNy
b3BfbGVuZ3RoIDw9IDApCisrICBpZiAoZW5keSArIDEgPD0gc3RhcnR5KQorICAgICB7CisgICAg
IFRJRkZFcnJvcigiY29tcHV0ZUlucHV0UGl4ZWxPZmZzZXRzIiwgCisgICAgICAgICAgICAgICAi
SW52YWxpZCB0b3AvYm90dG9tIG1hcmdpbnMgYW5kIC9vciBpbWFnZSBjcm9wIGxlbmd0aCByZXF1
ZXN0ZWQiKTsKKyAgICAgcmV0dXJuICgtMSk7CisgICAgIH0KKysgIGNyb3BfbGVuZ3RoID0gZW5k
eSAtIHN0YXJ0eSArIDE7CisgICBpZiAoY3JvcF9sZW5ndGggPiBpbWFnZS0+bGVuZ3RoKQorICAg
ICBjcm9wX2xlbmd0aCA9IGltYWdlLT5sZW5ndGg7CisgCitAQCAtNTQ0OSwxMCArNTQ2NCwxNyBA
QCBnZXRDcm9wT2Zmc2V0cyhzdHJ1Y3QgaW1hZ2VfZGF0YSAqaW1hZ2UsCisgICBlbHNlCisgICAg
IGNyb3AtPnNlbGVjdGlvbnMgPSBjcm9wLT56b25lczsKKyAKKy0gIGZvciAoaSA9IDA7IGkgPCBj
cm9wLT56b25lczsgaSsrKQorKyAgLyogSW5pdGlhbGl6ZSByZWdpb25zIGl0ZXJhdG9yIGkgKi8K
KysgIGkgPSAwOworKyAgZm9yIChpbnQgaiA9IDA7IGogPCBjcm9wLT56b25lczsgaisrKQorICAg
ICB7CistICAgIHNlZyA9IGNyb3AtPnpvbmVsaXN0W2ldLnBvc2l0aW9uOworLSAgICB0b3RhbCA9
IGNyb3AtPnpvbmVsaXN0W2ldLnRvdGFsOworKyAgICBzZWcgPSBjcm9wLT56b25lbGlzdFtqXS5w
b3NpdGlvbjsKKysgICAgdG90YWwgPSBjcm9wLT56b25lbGlzdFtqXS50b3RhbDsKKysKKysgICAg
LyogY2hlY2sgZm9yIG5vdCBhbGxvd2VkIHpvbmUgY2FzZXMgbGlrZSAwOjA7IDQ6MzsgZXRjLiBh
bmQgc2tpcCB0aGF0IGlucHV0ICovCisrICAgIGlmIChzZWcgPT0gMCB8fCB0b3RhbCA9PSAwIHx8
IHNlZyA+IHRvdGFsKSB7CisrICAgICAgICBjb250aW51ZTsKKysgICAgfQorIAorICAgICBzd2l0
Y2ggKGNyb3AtPmVkZ2VfcmVmKSAKKyAgICAgICB7CitAQCAtNTU4MSw4ICs1NjAzLDExIEBAIGdl
dENyb3BPZmZzZXRzKHN0cnVjdCBpbWFnZV9kYXRhICppbWFnZSwKKyAgICAgICAgICAgICAgICAg
ICAgIGkgKyAxLCAodWludDMyKXp3aWR0aCwgKHVpbnQzMil6bGVuZ3RoLAorIAkJICAgIGNyb3At
PnJlZ2lvbmxpc3RbaV0ueDEsIGNyb3AtPnJlZ2lvbmxpc3RbaV0ueDIsIAorICAgICAgICAgICAg
ICAgICAgICAgY3JvcC0+cmVnaW9ubGlzdFtpXS55MSwgY3JvcC0+cmVnaW9ubGlzdFtpXS55Mik7
CisrICAvKiBpbmNyZW1lbnQgcmVnaW9ucyBpdGVyYXRvciAqLworKyAgaSsrOworICAgICB9Cist
CisrICAgIC8qIHNldCBudW1iZXIgb2YgZ2VuZXJhdGVkIHJlZ2lvbnMgb3V0IG9mIGdpdmVuIHpv
bmVzICovCisrICAgIGNyb3AtPnNlbGVjdGlvbnMgPSBpOworICAgcmV0dXJuICgwKTsKKyAgIH0g
LyogZW5kIGdldENyb3BPZmZzZXRzICovCisgCistLSAKK0dpdExhYgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlidGlmZi90aWZmXzQuMS4wLmJiIGIvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvbGlidGlmZi90aWZmXzQuMS4wLmJiCmluZGV4IGMwNjFkMmFhYWMuLjkzYTM1
MjMwZDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnRpZmYvdGlmZl80
LjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJ0aWZmL3RpZmZfNC4xLjAu
YmIKQEAgLTI2LDYgKzI2LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vZG93bmxvYWQub3NnZW8ub3Jn
L2xpYnRpZmYvdGlmZi0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjIt
MDkyNC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMi0yMDU2LUNWRS0yMDIyLTIw
NTctQ1ZFLTIwMjItMjA1OC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMi0zNDUy
Ni5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMi0yODY3LUNWRS0yMDIyLTI4Njgt
Q1ZFLTIwMjItMjg2OS5wYXRjaCBcCiAgICAgICAgICAgIgogU1JDX1VSSVttZDVzdW1dID0gIjIx
NjVlN2FiYTU1NzQ2M2FjYzA2NjRlNzFhM2VkNDI0IgogU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVk
MjlmMzI1MTdkYWRiNmRiY2QxMjU1ZWE1YmJjOTNhMmI1NGI5NGZiZjgzNjUzYjRkNjVjN2Q2Nzc1
Yjg2MzQiCi0tIAoyLjE3LjEKCg==

--_004_MAXPR01MB43271D5FB6F09233D766FBC69D439MAXPR01MB4327INDP_--

