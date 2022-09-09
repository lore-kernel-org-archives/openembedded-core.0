Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6C5ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 05:12:00 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.56])
 by mx.groups.io with SMTP id smtpd.web12.3189.1662700310566338850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 22:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=mvC4sEjn;
 spf=pass (domain: kpit.com, ip: 40.107.222.56,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVe6q095YvF8diKfMBs+0c8u3OeJ/FpNqdSNtqLzUhDstWfDKvg+N/kqM8KCzVF9S7jbCG3LKSYyvVaJlVHTpggl6yYD9DcxzzuUoTEufOwWc0AnHyY6x7UM8AksyEZAMOrbSpR9N/C5OiHUYUfKEVrSltsM4vs3irC9IdvDY/ZerWOrNYyFQtJC4HtfOqq1PuIr2skZ9ne1Zzssy2ydQL9YoCCjOoJT6K9zgZaV76vgwKUfiA8frnq/Kl/YCYRDPuSgISelGt9QMvJSSWbznM/k0t9xbJJoTulScF/JC/AXm/pyJe+pj4NXe8Dfi1JsYrTIzrSWuyldUXq9OOO2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJ0NEmvHMI5h2uaZzVQF3fteYgc1S5lB3pePNZkkYEE=;
 b=Bet4yMcQKb4JYmbiOpL82ImXZiqvKFjCRJZBg49gSsyRpg5Qigc15KwmKqDRW8dsooGqbx6ajeT1xBW/ZnzjCD4+XTdz+dU04IoBXeLSqGcuAWqSTICEZPhrpdJ/2NXhqyDS73I1RXtsGQ6roTPIM/6oFqcFbOF0VQeGvjOl60bNphFTBtjS8F8lUOT1A+m9xK8gSYCp4WEhvmH51XA4ayZIYER3wtRvXsg1P3E6f29NJyBW6FbIPBQ5ZQHXhQu6A8oGbSn+shuYHnT34JR5YfUNEitVL4FzYChKb3tgRsRTezQd+fXV08wrBG5M/nXIU74MqhBvaXGur+udwtLIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJ0NEmvHMI5h2uaZzVQF3fteYgc1S5lB3pePNZkkYEE=;
 b=mvC4sEjnFzV+QFVgWKIrc6uykrnT+ln70aqNrxVYlgr/0/Kgm7cKUEzIfeYFvmyr3/m4YHE3YxvXWAcF3O0BqUe2PBtN7mkd1dEyVxJC6LRQmrIp/8d6TIFBJVZDDP7fZpbY89eaDFotgJ7yQdZ92iGyKZirOAi+EIOshDGHo78=
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PN3PR01MB7141.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 05:11:42 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 05:11:41 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][dunfell][PATCH] tiff: Fix for CVE-2022-2867/8/9
Thread-Topic: [OE-Core][dunfell][PATCH] tiff: Fix for CVE-2022-2867/8/9
Thread-Index: AQHYw0B6338VKNFz7ki6sNt2/uw8e63V34OAgACvAkE=
Date: Fri, 9 Sep 2022 05:11:41 +0000
Message-ID: 
 <MAXPR01MB4327309A3D21C97D3DD05D5D9D439@MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM>
References: <20220908050409.17606-1-virendra.thakur@kpit.com>
 <CAOSpxdb8ijvdSSDs5v4U58saZT-aLVNykRJGLOpPfGr383kS5w@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdb8ijvdSSDs5v4U58saZT-aLVNykRJGLOpPfGr383kS5w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXPR01MB4327:EE_|PN3PR01MB7141:EE_
x-ms-office365-filtering-correlation-id: 120952ea-1ffe-4fe3-b822-08da9221c850
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tDkr/1QrY7vB7M8/YIE7L1K6rGfYOkQRMDcX+Y2WEi6JTCAIJ8Vj7Phvn02T1gkP5HMBMHpejT0Lr2bLKIVyLpi00MWNb+hq/XirMemS1H71+UJGR4dScFjEqCGlQ4Jo4jlP8rHEo7awRa7u3jyqJQ9bGQlxkL4PbSx2lyMrNHLmZG+RYqYRz+Wx30J1I+WRxtzDooaKaROuWVlKwwBhc0VClnoHtzYtpD05gjC0ZmP1zlZZNCbjYn2427iYYi1EWB/NVLmO2Ryksh3hk3sAK1Fyveg/xiGA2h6f0CUB8Xwd6iYMYV9JeD5N99vTCeT0DqRUUoVSY4rAfGurLKKrG/x0BPcg60DkKnXcvJSnOAP6rUMDMFkFes0OpParf0KheozMLRqzDv+3ZsKF+k1zTeR17zaXkOOVpQz8b/Kp5DjVRmr155uTfRwWNKmAIgkQOzF7Vg7k5VvHomIGBBKSN9wuG3XuDmHMAb2pTswhIHAe18DGgyZvIt4PNhekeTxLACzz4v/sQ2X8UeZfzZvUs5Mk4z/IXEqg1twvwrwoTVRFGNmOtQVMNAlUnt3DXn8GTuyM/AweY4phW4hu51QYw+xj8ZVQq9Aq7NMLur+vhsawO8vfMc3ZhaXxv//Fn4kd8S3AIAdHDYfQq4YDD5cDEdGWnYSIGXhKzjPqw7OHSnHN1zHcyAnCqkWvBST7sVBaYFlUUcwQA6dVeSMUI5Re8uP4+3EBaOrNA1c0mlC4ke9p4VZ105HPkBlOBB3C2hD+3JnrwJJgYUv9DD5Kfe382xehUdnMLb3V3/0bGAhagzI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(966005)(84970400001)(478600001)(71200400001)(83380400001)(186003)(66574015)(7696005)(9686003)(26005)(6506007)(53546011)(55236004)(86362001)(55016003)(41300700001)(19627405001)(38100700002)(8676002)(122000001)(38070700005)(166002)(52536014)(33656002)(99936003)(66446008)(64756008)(8936002)(91956017)(4326008)(2906002)(66476007)(66556008)(66946007)(45080400002)(76116006)(5660300002)(30864003)(316002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?HH4fytDhLsUMWsSL0EsokaOJt06T2Dwcdil5rq2u5M0GqTnR+RMpgZMAmS?=
 =?iso-8859-1?Q?/Xj3YMpGNuM3BHJ/mrIAQHUbIi8NWIplHnG4gBzDPuPd19GNlbt1aPFMFd?=
 =?iso-8859-1?Q?gkf6h5wDSaeUls5BTrlePOZNvwjF1HQm9mq4lC3Yk9gJDzkDBYIPvC5ylR?=
 =?iso-8859-1?Q?De1+UGxCcsvT+uCxwJpJKNVUDDQcMOeEu+5zuT7GX6VulfysZS/lLc2rHy?=
 =?iso-8859-1?Q?mKxxEKKGr5u3jGvT4Xl0F77ptSdsLioT35jVJMSS+IP7ecoXVUURY/OfUO?=
 =?iso-8859-1?Q?j2MMwxJwgac8gUjF5lLmX5MPdiCJzg7jbhsct4QeFJkhcH/3ZkDEeMaQpS?=
 =?iso-8859-1?Q?asdoZ/61r0/qF0UyiwfXhvEPV43BrwWCbbcoMJQMlIiPVqW77zLilvm+jC?=
 =?iso-8859-1?Q?5wKlucE2wxgiT4eGJ794d5Ghez5vSkUkoe0HQi+Jup8lH3xlMpEzPLH5Go?=
 =?iso-8859-1?Q?nUQ5KmM3UNMMcML0Wsu8M8kgSsWStnrTbpj2NKiED6CNS4C/g95MdkOfAw?=
 =?iso-8859-1?Q?z5StxD1Xmb5MkVUsgacBqD23x2QJ7J41TxcME6CCTbDjcuOOD4I93dcyYj?=
 =?iso-8859-1?Q?aZKOCS1991Ww/86oBUUWlFHWsuFarooh4TIt0xn2ImNF480tADD9+f6y5W?=
 =?iso-8859-1?Q?iwXadwpqAgOxK+ewzAErMgQyT5QqiZfyLiIRAJvBp65j5INfNP8ZnsVbBH?=
 =?iso-8859-1?Q?dqEYWQ0xHcMiUnT3e50F/Qk/OPNvCVsugYTEnaar/PSq8A3qasEXhr9CNv?=
 =?iso-8859-1?Q?VwxtiO9cN12igWphGzYVsVwHOeK4VLeO8rHqvYOUz1upbXQIPYVWlTXWqY?=
 =?iso-8859-1?Q?DbngOiyG4HKxLMCWro5AoKj4NIzpNiBdRiH9M8Idjztw8TYX6kVXr6ZptT?=
 =?iso-8859-1?Q?lnepj2A5/2q/plxiJj2SjJumo78o0jrrpPERSDKq4ThEzIXTXjpIPuOhbf?=
 =?iso-8859-1?Q?Q3qNRjlPluKrS3M9R12mmxTbEcWMp0Rs+Nt3wI/ErQnf0roYrcVvzp8n+4?=
 =?iso-8859-1?Q?IE5MjSbgwfd/EVX+kmvcbIUwoK7ydpgxR/i+hFos0JSAF0+KfagwT8XIcd?=
 =?iso-8859-1?Q?q5SbX+A37RtT/QfW8JRLqewvrQaAjF4SptLsJUTnQK5v5Ifj4Ll9aThIXk?=
 =?iso-8859-1?Q?qNXd1kmIzweUyKEHMpVHdaNdqbVggZGRS0Faicdlh6Q2L6C3ywt8X79jkz?=
 =?iso-8859-1?Q?OTYrWJVDckGTeUp5YG/CVVoWGQf9iM5HScueH9P5J3QPREPOyaIjuWXlIF?=
 =?iso-8859-1?Q?9M1wg1JB9nOAHIdPRQwjsWmpEser1NHk005Su4l/5Qdrp0ASK8Uh3gKmZc?=
 =?iso-8859-1?Q?jps0g6iNjb9Q7eYlK7+zDAdlU3oXzq8f51/pZvMmctNgw6KGIG+4cvuLTK?=
 =?iso-8859-1?Q?3oJIuJBj8n20T/4lXPzvXe4oclNFzqdafanYHNd9HRRYboE2jIqx2xWJPW?=
 =?iso-8859-1?Q?UY4q4kXQx+lBGjs17ZgPa8iAx9di5CvEE64YFemIcr06uBeH4yWpx9vodM?=
 =?iso-8859-1?Q?p+oEiCLyhuJvFiF8dsRwdN4HYolHcM0lHWAsIF2p1HFPcOllGGXeYPMGHm?=
 =?iso-8859-1?Q?tRORUivB0vThMkPqpyMVaHBrH7XyTytUjTMVoU15X0d6aveDjlAoKoLFF9?=
 =?iso-8859-1?Q?hy12igVXWjg2Q=3D?=
Content-Type: multipart/mixed;
	boundary="_004_MAXPR01MB4327309A3D21C97D3DD05D5D9D439MAXPR01MB4327INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 120952ea-1ffe-4fe3-b822-08da9221c850
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 05:11:41.8187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 3wrfA+RidaKCtevlbbkJmE6Myu6YpJqvs9VAAP/FaNW003lEjmBuIJ7fzR2fNyEyEgwQsW2pv3pK/m6InXgolw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 05:12:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170477

--_004_MAXPR01MB4327309A3D21C97D3DD05D5D9D439MAXPR01MB4327INDP_
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB4327309A3D21C97D3DD05D5D9D439MAXPR01MB4327INDP_"

--_000_MAXPR01MB4327309A3D21C97D3DD05D5D9D439MAXPR01MB4327INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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
=3DKeN8brH6XLpD8sQUvDQHUfeG7Ld%2BnFtGl%2Bgr5WCiJX4%3D&amp;reserved=3D0]
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170448): https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F170448&amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7C06f4664a51=
014a38772c08da91ca2d06%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379825=
94827918330%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DIMob4TLoMFyZPMn70p6=
Zw%2F0LrZk49QJPTtG4iKJL2cc%3D&amp;reserved=3D0
> Mute This Topic: https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F93542683%2F3620601&amp;data=3D05%=
7C01%7Cvirendra.thakur%40kpit.com%7C06f4664a51014a38772c08da91ca2d06%7C3539=
451eb46e4a26a242ff61502855c7%7C0%7C0%7C637982594828074560%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000%7C%7C%7C&amp;sdata=3Dwm5lPdNoTh2gHTwUPnSa%2Bq7y1fbPLUfCTiJXwqXmx7I%3D=
&amp;reserved=3D0
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D0=
5%7C01%7Cvirendra.thakur%40kpit.com%7C06f4664a51014a38772c08da91ca2d06%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637982594828074560%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&amp;sdata=3DKdLCZubscfMsjI1cAebnNJHEgbjxseukod6tzS%2Fvetw%=
3D&amp;reserved=3D0 [steve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAXPR01MB4327309A3D21C97D3DD05D5D9D439MAXPR01MB4327INDP_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Steve,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I am attaching here with tiff patchset .&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
please&nbsp;let me know if its fine.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"signature_bookmark"></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)" class=3D"elementToProof">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Steve Sakoman &lt;ste=
ve@sakoman.com&gt;<br>
<b>Sent:</b> Friday, September 9, 2022 12:14 AM<br>
<b>To:</b> Virendra Kumar Thakur &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Virendra Kumar Thakur &lt;Virendra.Thakur@kpit.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-Core][dunfell][PATCH] tiff: Fix for CVE-2022-2867/8=
/9</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
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
ommit%2F07d79fcac2ead271b60e32aeb80f7b4f3be9ac8c&amp;amp;data=3D05%7C01%7Cv=
irendra.thakur%40kpit.com%7C06f4664a51014a38772c08da91ca2d06%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637982594827918330%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C=
%7C%7C&amp;amp;sdata=3DKeN8brH6XLpD8sQUvDQHUfeG7Ld%2BnFtGl%2Bgr5WCiJX4%3D&a=
mp;amp;reserved=3D0" data-auth=3D"NotApplicable">https://apc01.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.com%2Flibtiff%2Flibtiff%2F=
-%2Fcommit%2F07d79fcac2ead271b60e32aeb80f7b4f3be9ac8c&amp;amp;data=3D05%7C0=
1%7Cvirendra.thakur%40kpit.com%7C06f4664a51014a38772c08da91ca2d06%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637982594827918330%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00%7C%7C%7C&amp;amp;sdata=3DKeN8brH6XLpD8sQUvDQHUfeG7Ld%2BnFtGl%2Bgr5WCiJX4=
%3D&amp;amp;reserved=3D0</a>]<br>
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
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#170448): <a href=3D"https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembe=
dded-core%2Fmessage%2F170448&amp;amp;data=3D05%7C01%7Cvirendra.thakur%40kpi=
t.com%7C06f4664a51014a38772c08da91ca2d06%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C637982594827918330%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=
=3DIMob4TLoMFyZPMn70p6Zw%2F0LrZk49QJPTtG4iKJL2cc%3D&amp;amp;reserved=3D0" d=
ata-auth=3D"NotApplicable">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F170448&amp;amp;data=3D0=
5%7C01%7Cvirendra.thakur%40kpit.com%7C06f4664a51014a38772c08da91ca2d06%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637982594827918330%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&amp;amp;sdata=3DIMob4TLoMFyZPMn70p6Zw%2F0LrZk49QJPTtG4iKJL=
2cc%3D&amp;amp;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://apc01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fmt%2F93542683%2F3620601&=
amp;amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7C06f4664a51014a38772c0=
8da91ca2d06%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637982594828074560=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3Dwm5lPdNoTh2gHTwUPnSa%2Bq7y=
1fbPLUfCTiJXwqXmx7I%3D&amp;amp;reserved=3D0" data-auth=3D"NotApplicable">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F93542683%2F3620601&amp;amp;data=3D05%7C01%7Cvirendra=
.thakur%40kpit.com%7C06f4664a51014a38772c08da91ca2d06%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637982594828074560%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&=
amp;amp;sdata=3Dwm5lPdNoTh2gHTwUPnSa%2Bq7y1fbPLUfCTiJXwqXmx7I%3D&amp;amp;re=
served=3D0</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://apc01.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsu=
b&amp;amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7C06f4664a51014a38772=
c08da91ca2d06%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379825948280745=
60%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DKdLCZubscfMsjI1cAebnNJHE=
gbjxseukod6tzS%2Fvetw%3D&amp;amp;reserved=3D0" data-auth=3D"NotApplicable">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;amp;data=3D05%7C01%7Cvi=
rendra.thakur%40kpit.com%7C06f4664a51014a38772c08da91ca2d06%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637982594828074560%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7C%7C&amp;amp;sdata=3DKdLCZubscfMsjI1cAebnNJHEgbjxseukod6tzS%2Fvetw%3D&amp;=
amp;reserved=3D0</a>
 [steve@sakoman.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
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
 infected mails.
</body>
</html>

--_000_MAXPR01MB4327309A3D21C97D3DD05D5D9D439MAXPR01MB4327INDP_--

--_004_MAXPR01MB4327309A3D21C97D3DD05D5D9D439MAXPR01MB4327INDP_
Content-Type: text/x-patch; name="0001-tiff-Fix-for-CVE-2022-2867-8-9.patch"
Content-Description: 0001-tiff-Fix-for-CVE-2022-2867-8-9.patch
Content-Disposition: attachment;
	filename="0001-tiff-Fix-for-CVE-2022-2867-8-9.patch"; size=6969;
	creation-date="Fri, 09 Sep 2022 05:11:34 GMT";
	modification-date="Fri, 09 Sep 2022 05:11:41 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiOTI4NWFhOTllMWQ1Yjk0OGI3MzhhNzk1MTZiY2VlOWZiMmZhY2E3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJha0BrcGl0LmNvbT4K
RGF0ZTogTW9uLCA1IFNlcCAyMDIyIDE1OjExOjExICswNTMwClN1YmplY3Q6IFtQQVRDSF0gdGlm
ZjogRml4IGZvciBDVkUtMjAyMi0yODY3LzgvOQoKQWRkIFBhdGNoIHRvIGZpeCBDVkUtMjAyMi0y
ODY3LCBDVkUtMjAyMi0yODY4CkNWRS0yMDIyLTI4NjkKCkNoYW5nZS1JZDogSTAxMjc5YzQ4OTZk
MzY1MzVjMTQ3NzZjNWRjYjIxMzg2OWRmMTAxY2EKU2lnbmVkLW9mZi1ieTogVmlyZW5kcmEgVGhh
a3VyIDx2aXJlbmRyYWtAa3BpdC5jb20+Ci0tLQogLi4uMDIyLTI4NjctQ1ZFLTIwMjItMjg2OC1D
VkUtMjAyMi0yODY5LnBhdGNoIHwgMTU5ICsrKysrKysrKysrKysrKysrKwogbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvbGlidGlmZi90aWZmXzQuMS4wLmJiIHwgICAxICsKIDIgZmlsZXMgY2hhbmdl
ZCwgMTYwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9saWJ0aWZmL2ZpbGVzL0NWRS0yMDIyLTI4NjctQ1ZFLTIwMjItMjg2OC1DVkUtMjAy
Mi0yODY5LnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlidGlm
Zi9maWxlcy9DVkUtMjAyMi0yODY3LUNWRS0yMDIyLTI4NjgtQ1ZFLTIwMjItMjg2OS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnRpZmYvZmlsZXMvQ1ZFLTIwMjItMjg2Ny1DVkUt
MjAyMi0yODY4LUNWRS0yMDIyLTI4NjkucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uMTMxZmY5NDExOQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2xpYnRpZmYvZmlsZXMvQ1ZFLTIwMjItMjg2Ny1DVkUtMjAyMi0yODY4LUNWRS0y
MDIyLTI4NjkucGF0Y2gKQEAgLTAsMCArMSwxNTkgQEAKK0Zyb20gMDdkNzlmY2FjMmVhZDI3MWI2
MGUzMmFlYjgwZjdiNGYzYmU5YWM4YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFN1
IExhdXMgPHN1bGF1QGZyZWVuZXQuZGU+CitEYXRlOiBXZWQsIDkgRmViIDIwMjIgMjE6MzE6Mjkg
KzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gdGlmZmNyb3AuYzogRml4IGlzc3VlICMzNTIgaGVhcC1i
dWZmZXItb3ZlcmZsb3cgYnkgY29ycmVjdGluZworIHVpbnQzMl90IHVuZGVyZmxvdy4KKworQ1ZF
OiBDVkUtMjAyMi0yODY3IENWRS0yMDIyLTI4NjggQ1ZFLTIwMjItMjg2OQorVXBzdHJlYW0tU3Rh
dHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuY29tL2xpYnRpZmYvbGlidGlmZi8tL2NvbW1p
dC8wN2Q3OWZjYWMyZWFkMjcxYjYwZTMyYWViODBmN2I0ZjNiZTlhYzhjXQorU2lnbmVkLW9mZi1i
eTogVmlyZW5kcmEgVGhha3VyIDx2aXJlbmRyYWtAa3BpdC5jb20+CistLS0KK0luZGV4OiB0aWZm
LTQuMS4wL3Rvb2xzL3RpZmZjcm9wLmMKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKy0tLSB0aWZmLTQuMS4wLm9yaWcv
dG9vbHMvdGlmZmNyb3AuYworKysrIHRpZmYtNC4xLjAvdG9vbHMvdGlmZmNyb3AuYworQEAgLTUx
NTMsMjkgKzUxNTMsNDUgQEAgY29tcHV0ZUlucHV0UGl4ZWxPZmZzZXRzKHN0cnVjdCBjcm9wX21h
cworIAl5MSA9IF9USUZGQ2xhbXBEb3VibGVUb1VJbnQzMihjcm9wLT5jb3JuZXJzW2ldLlkxKTsK
KyAJeTIgPSBfVElGRkNsYW1wRG91YmxlVG9VSW50MzIoY3JvcC0+Y29ybmVyc1tpXS5ZMik7Cisg
CX0KKy0gICAgICBpZiAoeDEgPCAxKQorLSAgICAgICAgY3JvcC0+cmVnaW9ubGlzdFtpXS54MSA9
IDA7CistICAgICAgZWxzZQorLSAgICAgICAgY3JvcC0+cmVnaW9ubGlzdFtpXS54MSA9ICh1aW50
MzIpICh4MSAtIDEpOworKyAgICAgIC8qIGEpIFJlZ2lvbiBuZWVkcyB0byBiZSB3aXRoaW4gaW1h
Z2Ugc2l6ZXMgMC4uIHdpZHRoLTE7IDAuLmxlbmd0aC0xIAorKyAgICAgICAqIGIpIENvcm5lcnMg
YXJlIGV4cGVjdGVkIHRvIGJlIHN1Ym1pdHRlZCBhcyB0b3AtbGVmdCB0byBib3R0b20tcmlnaHQu
CisrICAgICAgICogICAgVGhlcmVmb3JlLCBjaGVjayB0aGF0IGFuZCByZW9yZGVyIGlucHV0Lgor
KyAgICAgICAqIChiZSBhd2FyZSB4LHkgYXJlIGFscmVhZHkgY2FzdGVkIHRvICh1aW50MzJfdCkg
YW5kIGF2b2lkICgwIC0gMSkgKQorKyAgICAgICAqLworKyAgICAgIHVpbnQzMl90IGF1eDsKKysg
ICAgICBpZiAoeDEgPiB4MikgeworKyAgICAgICAgYXV4ID0geDE7CisrICAgICAgICB4MSA9IHgy
OworKyAgICAgICAgeDIgPSBhdXg7CisrICAgICAgfQorKyAgICAgIGlmICh5MSA+IHkyKSB7Cisr
ICAgICAgICBhdXggPSB5MTsKKysgICAgICAgIHkxID0geTI7CisrICAgICAgICB5MiA9IGF1eDsK
KysgICAgICB9CisrICAgICAgaWYgKHgxID4gaW1hZ2UtPndpZHRoIC0gMSkKKysgICAgICAgIGNy
b3AtPnJlZ2lvbmxpc3RbaV0ueDEgPSBpbWFnZS0+d2lkdGggLSAxOworKyAgICAgIGVsc2UgaWYg
KHgxID4gMCkKKysgICAgICAgIGNyb3AtPnJlZ2lvbmxpc3RbaV0ueDEgPSAodWludDMyX3QpKHgx
IC0gMSk7CisgCisgICAgICAgaWYgKHgyID4gaW1hZ2UtPndpZHRoIC0gMSkKKyAgICAgICAgIGNy
b3AtPnJlZ2lvbmxpc3RbaV0ueDIgPSBpbWFnZS0+d2lkdGggLSAxOworLSAgICAgIGVsc2UKKy0g
ICAgICAgIGNyb3AtPnJlZ2lvbmxpc3RbaV0ueDIgPSAodWludDMyKSAoeDIgLSAxKTsKKy0gICAg
ICB6d2lkdGggID0gY3JvcC0+cmVnaW9ubGlzdFtpXS54MiAtIGNyb3AtPnJlZ2lvbmxpc3RbaV0u
eDEgKyAxOyAKKy0KKy0gICAgICBpZiAoeTEgPCAxKQorLSAgICAgICAgY3JvcC0+cmVnaW9ubGlz
dFtpXS55MSA9IDA7CistICAgICAgZWxzZQorLSAgICAgICAgY3JvcC0+cmVnaW9ubGlzdFtpXS55
MSA9ICh1aW50MzIpICh5MSAtIDEpOworKyAgICAgIGVsc2UgaWYgKHgyID4gMCkKKysgICAgICAg
IGNyb3AtPnJlZ2lvbmxpc3RbaV0ueDIgPSAodWludDMyX3QpKHgyIC0gMSk7CisrCisrICAgICAg
endpZHRoID0gY3JvcC0+cmVnaW9ubGlzdFtpXS54MiAtIGNyb3AtPnJlZ2lvbmxpc3RbaV0ueDEg
KyAxOworKworKyAgICAgIGlmICh5MSA+IGltYWdlLT5sZW5ndGggLSAxKQorKyAgICAgICAgY3Jv
cC0+cmVnaW9ubGlzdFtpXS55MSA9IGltYWdlLT5sZW5ndGggLSAxOworKyAgICAgIGVsc2UgaWYg
KHkxID4gMCkKKysgICAgICAgIGNyb3AtPnJlZ2lvbmxpc3RbaV0ueTEgPSAodWludDMyX3QpKHkx
IC0gMSk7CisgCisgICAgICAgaWYgKHkyID4gaW1hZ2UtPmxlbmd0aCAtIDEpCisgICAgICAgICBj
cm9wLT5yZWdpb25saXN0W2ldLnkyID0gaW1hZ2UtPmxlbmd0aCAtIDE7CistICAgICAgZWxzZQor
LSAgICAgICAgY3JvcC0+cmVnaW9ubGlzdFtpXS55MiA9ICh1aW50MzIpICh5MiAtIDEpOworLQor
LSAgICAgIHpsZW5ndGggPSBjcm9wLT5yZWdpb25saXN0W2ldLnkyIC0gY3JvcC0+cmVnaW9ubGlz
dFtpXS55MSArIDE7IAorKyAgICAgIGVsc2UgaWYgKHkyID4gMCkKKysgICAgICAgIGNyb3AtPnJl
Z2lvbmxpc3RbaV0ueTIgPSAodWludDMyX3QpKHkyIC0gMSk7CisgCisrICAgICAgemxlbmd0aCA9
IGNyb3AtPnJlZ2lvbmxpc3RbaV0ueTIgLSBjcm9wLT5yZWdpb25saXN0W2ldLnkxICsgMTsKKyAg
ICAgICBpZiAoendpZHRoID4gbWF4X3dpZHRoKQorICAgICAgICAgbWF4X3dpZHRoID0gendpZHRo
OworICAgICAgIGlmICh6bGVuZ3RoID4gbWF4X2xlbmd0aCkKK0BAIC01MjA1LDcgKzUyMjEsNyBA
QCBjb21wdXRlSW5wdXRQaXhlbE9mZnNldHMoc3RydWN0IGNyb3BfbWFzCisgCX0KKyAgICAgICB9
CisgICAgIHJldHVybiAoMCk7CistICAgIH0KKysgICAgfSAgLyogY3JvcF9tb2RlID09IENST1Bf
UkVHSU9OUyAqLworICAgCisgICAvKiBDb252ZXJ0IGNyb3AgbWFyZ2lucyBpbnRvIG9mZnNldHMg
aW50byBpbWFnZQorICAgICogTWFyZ2lucyBhcmUgZXhwcmVzc2VkIGFzIHBpeGVsIHJvd3MgYW5k
IGNvbHVtbnMsIG5vdCBieXRlcworQEAgLTUyNDEsNyArNTI1Nyw3IEBAIGNvbXB1dGVJbnB1dFBp
eGVsT2Zmc2V0cyhzdHJ1Y3QgY3JvcF9tYXMKKyAgICAgICBibWFyZ2luID0gKHVpbnQzMikgMDsK
KyAgICAgICByZXR1cm4gKC0xKTsKKyAgICAgICB9CistICAgIH0KKysgICAgfSAgLyogY3JvcF9t
b2RlID09IENST1BfTUFSR0lOUyAqLworICAgZWxzZQorICAgICB7IC8qIG5vIG1hcmdpbnMgcmVx
dWVzdGVkICovCisgICAgIHRtYXJnaW4gPSAodWludDMyKSAwOworQEAgLTUzMzIsMjQgKzUzNDgs
MjMgQEAgY29tcHV0ZUlucHV0UGl4ZWxPZmZzZXRzKHN0cnVjdCBjcm9wX21hcworICAgb2ZmLT5l
bmR4ICAgPSBlbmR4OworICAgb2ZmLT5lbmR5ICAgPSBlbmR5OworIAorLSAgY3JvcF93aWR0aCAg
PSBlbmR4IC0gc3RhcnR4ICsgMTsKKy0gIGNyb3BfbGVuZ3RoID0gZW5keSAtIHN0YXJ0eSArIDE7
CistCistICBpZiAoY3JvcF93aWR0aCA8PSAwKQorKyAgaWYgKGVuZHggKyAxIDw9IHN0YXJ0eCkK
KyAgICAgeworICAgICBUSUZGRXJyb3IoImNvbXB1dGVJbnB1dFBpeGVsT2Zmc2V0cyIsIAorICAg
ICAgICAgICAgICAgICJJbnZhbGlkIGxlZnQvcmlnaHQgbWFyZ2lucyBhbmQgL29yIGltYWdlIGNy
b3Agd2lkdGggcmVxdWVzdGVkIik7CisgICAgIHJldHVybiAoLTEpOworICAgICB9CisrICBjcm9w
X3dpZHRoICA9IGVuZHggLSBzdGFydHggKyAxOworICAgaWYgKGNyb3Bfd2lkdGggPiBpbWFnZS0+
d2lkdGgpCisgICAgIGNyb3Bfd2lkdGggPSBpbWFnZS0+d2lkdGg7CisgCistICBpZiAoY3JvcF9s
ZW5ndGggPD0gMCkKKysgIGlmIChlbmR5ICsgMSA8PSBzdGFydHkpCisgICAgIHsKKyAgICAgVElG
RkVycm9yKCJjb21wdXRlSW5wdXRQaXhlbE9mZnNldHMiLCAKKyAgICAgICAgICAgICAgICJJbnZh
bGlkIHRvcC9ib3R0b20gbWFyZ2lucyBhbmQgL29yIGltYWdlIGNyb3AgbGVuZ3RoIHJlcXVlc3Rl
ZCIpOworICAgICByZXR1cm4gKC0xKTsKKyAgICAgfQorKyAgY3JvcF9sZW5ndGggPSBlbmR5IC0g
c3RhcnR5ICsgMTsKKyAgIGlmIChjcm9wX2xlbmd0aCA+IGltYWdlLT5sZW5ndGgpCisgICAgIGNy
b3BfbGVuZ3RoID0gaW1hZ2UtPmxlbmd0aDsKKyAKK0BAIC01NDQ5LDEwICs1NDY0LDE3IEBAIGdl
dENyb3BPZmZzZXRzKHN0cnVjdCBpbWFnZV9kYXRhICppbWFnZSwKKyAgIGVsc2UKKyAgICAgY3Jv
cC0+c2VsZWN0aW9ucyA9IGNyb3AtPnpvbmVzOworIAorLSAgZm9yIChpID0gMDsgaSA8IGNyb3At
PnpvbmVzOyBpKyspCisrICAvKiBJbml0aWFsaXplIHJlZ2lvbnMgaXRlcmF0b3IgaSAqLworKyAg
aSA9IDA7CisrICBmb3IgKGludCBqID0gMDsgaiA8IGNyb3AtPnpvbmVzOyBqKyspCisgICAgIHsK
Ky0gICAgc2VnID0gY3JvcC0+em9uZWxpc3RbaV0ucG9zaXRpb247CistICAgIHRvdGFsID0gY3Jv
cC0+em9uZWxpc3RbaV0udG90YWw7CisrICAgIHNlZyA9IGNyb3AtPnpvbmVsaXN0W2pdLnBvc2l0
aW9uOworKyAgICB0b3RhbCA9IGNyb3AtPnpvbmVsaXN0W2pdLnRvdGFsOworKworKyAgICAvKiBj
aGVjayBmb3Igbm90IGFsbG93ZWQgem9uZSBjYXNlcyBsaWtlIDA6MDsgNDozOyBldGMuIGFuZCBz
a2lwIHRoYXQgaW5wdXQgKi8KKysgICAgaWYgKHNlZyA9PSAwIHx8IHRvdGFsID09IDAgfHwgc2Vn
ID4gdG90YWwpIHsKKysgICAgICAgIGNvbnRpbnVlOworKyAgICB9CisgCisgICAgIHN3aXRjaCAo
Y3JvcC0+ZWRnZV9yZWYpIAorICAgICAgIHsKK0BAIC01NTgxLDggKzU2MDMsMTEgQEAgZ2V0Q3Jv
cE9mZnNldHMoc3RydWN0IGltYWdlX2RhdGEgKmltYWdlLAorICAgICAgICAgICAgICAgICAgICAg
aSArIDEsICh1aW50MzIpendpZHRoLCAodWludDMyKXpsZW5ndGgsCisgCQkgICAgY3JvcC0+cmVn
aW9ubGlzdFtpXS54MSwgY3JvcC0+cmVnaW9ubGlzdFtpXS54MiwgCisgICAgICAgICAgICAgICAg
ICAgICBjcm9wLT5yZWdpb25saXN0W2ldLnkxLCBjcm9wLT5yZWdpb25saXN0W2ldLnkyKTsKKysg
IC8qIGluY3JlbWVudCByZWdpb25zIGl0ZXJhdG9yICovCisrICBpKys7CisgICAgIH0KKy0KKysg
ICAgLyogc2V0IG51bWJlciBvZiBnZW5lcmF0ZWQgcmVnaW9ucyBvdXQgb2YgZ2l2ZW4gem9uZXMg
Ki8KKysgICAgY3JvcC0+c2VsZWN0aW9ucyA9IGk7CisgICByZXR1cm4gKDApOworICAgfSAvKiBl
bmQgZ2V0Q3JvcE9mZnNldHMgKi8KKyAKKy0tIAorR2l0TGFiCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9saWJ0aWZmL3RpZmZfNC4xLjAuYmIgYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9saWJ0aWZmL3RpZmZfNC4xLjAuYmIKaW5kZXggYzA2MWQyYWFhYy4uOTNhMzUyMzBk
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlidGlmZi90aWZmXzQuMS4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnRpZmYvdGlmZl80LjEuMC5iYgpA
QCAtMjYsNiArMjYsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly9kb3dubG9hZC5vc2dlby5vcmcvbGli
dGlmZi90aWZmLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyMi0wOTI0
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL0NWRS0yMDIyLTIwNTYtQ1ZFLTIwMjItMjA1Ny1D
VkUtMjAyMi0yMDU4LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL0NWRS0yMDIyLTM0NTI2LnBh
dGNoIFwKKyAgICAgICAgICAgZmlsZTovL0NWRS0yMDIyLTI4NjctQ1ZFLTIwMjItMjg2OC1DVkUt
MjAyMi0yODY5LnBhdGNoIFwKICAgICAgICAgICAiCiBTUkNfVVJJW21kNXN1bV0gPSAiMjE2NWU3
YWJhNTU3NDYzYWNjMDY2NGU3MWEzZWQ0MjQiCiBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWQyOWYz
MjUxN2RhZGI2ZGJjZDEyNTVlYTViYmM5M2EyYjU0Yjk0ZmJmODM2NTNiNGQ2NWM3ZDY3NzViODYz
NCIKLS0gCjIuMTcuMQoK

--_004_MAXPR01MB4327309A3D21C97D3DD05D5D9D439MAXPR01MB4327INDP_--

