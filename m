Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C76EC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 17:34:21 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.54])
 by mx.groups.io with SMTP id smtpd.web11.124667.1669656859430694831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 09:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BNcuhFwz;
 spf=pass (domain: arm.com, ip: 40.107.104.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7AJqR6kxUl0eFBFDpJpcWGhrxuFtDINn9gFsQLFmAy7RAtOjaUVUd6Lj+CLw2qkDeIuhsFaPzznka/YFUr104EInZFYC932aHkOFwL3T6J22oOSpDazzLQNk6PgPhEwZo3fK/HoDs+dquyqXomjIB7hVDxJzaHh32JK+Zp3Iso5kEMEdYnnpFacCO8vP8XysGAsJxxTzT0r//m961Xa9BqdHaWPqL8HU8xietVFagXqSrQ0FEebp0gCA181mqlwxy/77lDm9B7KdPF33M9VTJcMUap8JYQsuiMVQeR+y4o+Q8PwwONfWRKy9EfixyCDo3WnmkUqjKR5mXu8KUogvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhPPibeZ+dhwS1UcxCy0mmoDHRN+FwQwx2Y5bL92aiw=;
 b=eKuaVIFDZ6t/H1d+SzL5st0XT80tjAG7fLMkNOLNkI3dUoWE7ExNtK6Hvi9X8887mvUKjLg0DpNYm+0EzUL8PFaR0XVBmhUF8ohCCv7WkbqU/4glXcGKBQFVg70uUiEsGErniXHcRLQyc4fyrSuF4QWviy1lCgeEz5AuMXSJAH/vM2fSVWW/ZqJnoU5AcIUjLJ+WLfj4NHXK/B3mzfyrD/F9E6VA+C34QAEfnKlARuXMyyheRUZ/S1OY1pFVLJNsISuiTDec05MGfLm2BBlJExAD+TYi/4rOsNihxyt4J9ADMhCqP/EnAb4/XGV2XYoNXIHymfUaIlFfw4kjK5d8jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhPPibeZ+dhwS1UcxCy0mmoDHRN+FwQwx2Y5bL92aiw=;
 b=BNcuhFwziJohOXL4gUG7X+5h/nxoSTmdakYf67+QvFSSMP8jC6XnaTgZFMOdZiW8OK84AH5+mtUymgqEgaw2R2JOYGN4yr46uxY9V7HiJ1Ir/gUMZp0MM80wl6wasNruLdgaOw/m84z16S7yWLkvQ34G7TeKu4WmFh69QULd3v0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9061.eurprd08.prod.outlook.com (2603:10a6:102:325::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.7; Mon, 28 Nov
 2022 17:34:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.008; Mon, 28 Nov 2022
 17:34:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Mali, Narpat" <narpat.mali@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"archana.polampalli@windriver.com" <archana.polampalli@windriver.com>,
	"hari.gpillai@windriver.com" <hari.gpillai@windriver.com>
Subject: Re: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964
Thread-Topic: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964
Thread-Index: AQHY/0bP5Tn+2x4S5ECHyICQTi7Qx65UoKoA
Date: Mon, 28 Nov 2022 17:34:15 +0000
Message-ID: <9B7572D4-F1B3-4A23-B280-FB7A99808E84@arm.com>
References: <20221123142022.136114-1-narpat.mali@windriver.com>
In-Reply-To: <20221123142022.136114-1-narpat.mali@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|PAVPR08MB9061:EE_
x-ms-office365-filtering-correlation-id: 6044383c-91d8-4c7b-1919-08dad166c549
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 znzSZK/3CJxIWk4qbH19tjpwloiS886c2QAOkMzvqc6rcrYd+l8wEpDyuwmeADS4SWDSiH1Ts1MmkNp602m4Mv5M9tXYXqOE2PS7lID0HnSw0tXGFMgThBNMMaitFXayS03IAvuPuTCIukGKpjA249OqKcBOO67lI1SSbC2Lig+L3qvMLh1ktyH/t+7htTw151Pjf4/MlFUdGZiTP3CSEdOCf1RshA1MjxfBqvvpqtv8goSnAfrqZcL6ZgKIGuS1nTXcS6MCYdtkXIFlP9eR85DN5uuuWkpkTnHCHWcxoabO1Bv07zqgzjw+tucbTSvh1ABd8nII9dacWVtJ6AFD4dWCV4dnfxpB+0TbJiLebeDx6Ka9Jg1+TO1hcTuCSIqbgJZQuiYTu1Eta+pC5LJPi9E9/3FIIxbCp7heKLGwydyomIsC5KVfFi36GCnh8zocQXgMAYUlTb8EH53O/M+cPuT7TaINnDw+5jLTteaTYeyvRRnNzj6SBS708yqNkXzvE7aJNj+m0mPNufRWTC7hoFa5JG8Q0K+X1XH2BUuST4hI44ai5uDPW9v/YJ+i8JWccJQQrTgs3Gq3p/bOsS7bG7CeYPfujLXXrMVP3lXRfkXNXs2Ha3vwob/kH6i1umD/MWISGBbRopzeMnPhwygn5mC2Dw2x0cIbwvdr3WptUe4CJkWqPrEexC1ixm0mPH1vVdx55kprp8FFyXItssghep+6O8frfewUmB+nkpZooZ6b46aMgfpdegkWG8P1sJ3Rrlxj/qsJcHuJX2Ba83iiJD/PgHWpkg70/bxi9gM0Lpg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(66899015)(2616005)(54906003)(8676002)(76116006)(966005)(66476007)(64756008)(6486002)(4326008)(66556008)(66446008)(41300700001)(478600001)(91956017)(6916009)(66946007)(2906002)(83380400001)(316002)(38100700002)(53546011)(86362001)(5660300002)(6506007)(186003)(71200400001)(6512007)(122000001)(26005)(33656002)(36756003)(8936002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pmLobk1e9ZfjLyj7ISdpoBrVj3ulKNrVqdO82EdgDxIjUD7mSlohcEMn2kIb?=
 =?us-ascii?Q?NuMPHcjFxLtgHNkx3hbl7YJezIqnzyQbEADdc7h5YFZKy1zu0QIx7tBQhGaY?=
 =?us-ascii?Q?GQlovk0lApJfb0faj4jdZB8Pe1TpNu6glQYHVPglnIii5dpe9sCC/D1nJzcO?=
 =?us-ascii?Q?4BdmS9d1NmXNFO7LdlXG4FEJjXvdv32nD30XuUUltnBXaXulPukl9a/8Gh3j?=
 =?us-ascii?Q?JaBsOWNk0oWF4F0miNQK/MTkXvV3ouElVbAepovmzGNVc1mBEg2TuZSDv6xJ?=
 =?us-ascii?Q?gOfpKvZv5GwZuMLzcTFf+19fF18ohOMjO/yiTh+FB5i8ZAltKIzVupJitOeu?=
 =?us-ascii?Q?SUyeI5pBePvM/V+jB1+RZ6N40zPdTu3nIqOTpme4sniJDlIFmmdn3uQXN/WK?=
 =?us-ascii?Q?091nBwj9uA7x6PABSqX9vMBQaM9OX3tiHnhA3PCHb768hvVo3t3gMtf8zsv6?=
 =?us-ascii?Q?TuiQhO5oXKMU9+VI6lpJubvKWQ3GkvD3/vi8IyMlWG5fSEKCLPV0sYR8jSBS?=
 =?us-ascii?Q?/HAKD/tSR1uK/UVc8zlRHzeJRVQx/mc/z6nf9NwJutqx5IqNonHSSElr/bCF?=
 =?us-ascii?Q?tURxx0jjBBfqsO4qpDVYE6Jsj9c5LUYvTI3TZjww5SGVGy9eMgJRjayIc+fR?=
 =?us-ascii?Q?p9mY7QC3ycQzpiTOuAyoamSIBnyxKxe7e5hxkelXyx4sk5rv8XFLcbUqfMcq?=
 =?us-ascii?Q?EgspL/QcMFQ6u2f84pB6WvSIB7bQpFrkO7dGHzqDPV9TcukELIS/ESLjKf/+?=
 =?us-ascii?Q?NfNNwa3QBNXykptjZvVXxU0CeulC7XyuZAlrl+yC8CrKaewxy7/Pq7fqw8T8?=
 =?us-ascii?Q?cbu1AVpBBf6aOhDC8eGk5HEZLbpI6gSS/0Lkme3Dlii5VbWFdxqXh74qE80O?=
 =?us-ascii?Q?ZuM2T1pICyVrgZkC21dbIbRtecoEdoPrthGlf/ZxVuUK5KOI+Bi62BLbC57G?=
 =?us-ascii?Q?skTF0D5vYjZq45rBSZ9S39e05e7CB82VwO9JU/r0CGLy2nPhwCsPub7L0wiq?=
 =?us-ascii?Q?Jh8LQeC30IxkWMsD3i4ewGVywOqvFY/4Lt0H62qXnGRhTeeJL3NJUaP3nSeH?=
 =?us-ascii?Q?HxJgt2hptXCbQKVgjktyOOXd4iGKsTRRYg6wia+K2n/E++N/1Y8W1gnyWZn4?=
 =?us-ascii?Q?l32Dt9A8nFScUf8iugaAaXKFV8XLfCjD5AV0mIv008zre/7X12YtDmCAKay0?=
 =?us-ascii?Q?DRnTV/yglL/92OJgPUF6z/kVkhFedNFjfvpzGKkiEA7JPBVBZeVdIoyoktKb?=
 =?us-ascii?Q?QEjlHqak9dh3Wk40WC6KvgpoVszp1HOGZjevkkQfAnJF5iIJLk+dwEFpHZ8j?=
 =?us-ascii?Q?A5Ru7Ku7KNBITII6qAMWjPsLQzJw6UXFVlIMzCvb10IXRhgaooqFp61+As68?=
 =?us-ascii?Q?BnhkgT9TmtUCQda9Lw722xHE0NVmw7NQiXs0kLyL/dTaYeBcbT7v7JF840+U?=
 =?us-ascii?Q?APq1W1MiHQ0jMmnpLCKO9J/yNO+NiSqxgR0+zi5CitLnXblzmWbqby4WJfD0?=
 =?us-ascii?Q?VLvt5sz2hakudqKTW5Rbvo8MurAZ8h+YD32YGby9H9YBYBOzP+3cY9xGbM37?=
 =?us-ascii?Q?P1PBO/0GuctLzI5oY6wdS6EvyCEevYDp39+6Del2?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <71A7648D2ED69240A2A4C97873FBB943@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6044383c-91d8-4c7b-1919-08dad166c549
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 17:34:15.2649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KzUjtp0eKOhWiU4sHnzjdFKS9LZScUBACFE8twM7TFhlB65RVJpjcsW251zYW7mqHw0OaEQEZpntjp+1zThnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 17:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173934

Can you put a CVE tag in the patch header alongside your Upstream-Status an=
d Signed-off-by?

We need this to track in an automated way that this patch deals with a spec=
ific CVE.

eg CVE: CVE-2022-3964

Ross

> On 23 Nov 2022, at 14:20, Narpat Mali via lists.openembedded.org <narpat.=
mali=3Dwindriver.com@lists.openembedded.org> wrote:
>=20
> A vulnerability classified as problematic has been found in ffmpeg. This =
affects an unknown part of the file
> libavcodec/rpzaenc.c of the component QuickTime RPZA Video Encoder. The m=
anipulation of the argument y_size
> leads to out-of-bounds read. It is possible to initiate the attack remote=
ly. The name of the patch is
> 92f9b28ed84a77138105475beba16c146bdaf984. It is recommended to apply a pa=
tch to fix this issue. The associated
> identifier of this vulnerability is VDB-213543.
>=20
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2022-3964
>=20
> Upstream Fix:
> https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146=
bdaf984
>=20
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
> ...c-stop-accessing-out-of-bounds-frame.patch | 89 +++++++++++++++++++
> .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |  4 +-
> 2 files changed, 92 insertions(+), 1 deletion(-)
> create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpz=
aenc-stop-accessing-out-of-bounds-frame.patch
>=20
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-s=
top-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ff=
mpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
> new file mode 100644
> index 0000000000..2775a81cc8
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-acc=
essing-out-of-bounds-frame.patch
> @@ -0,0 +1,89 @@
> +From 92f9b28ed84a77138105475beba16c146bdaf984 Mon Sep 17 00:00:00 2001
> +From: Paul B Mahol <onemda@gmail.com>
> +Date: Sat, 12 Nov 2022 16:12:00 +0100
> +Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
> +
> +Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/92f9b=
28ed84a77138105475beba16c146bdaf984]
> +
> +Signed-off-by: <narpat.mali@windriver.com>
> +
> +---
> + libavcodec/rpzaenc.c | 22 +++++++++++++++-------
> + 1 file changed, 15 insertions(+), 7 deletions(-)
> +
> +diff --git a/libavcodec/rpzaenc.c b/libavcodec/rpzaenc.c
> +index d710eb4f82..4ced9523e2 100644
> +--- a/libavcodec/rpzaenc.c
> ++++ b/libavcodec/rpzaenc.c
> +@@ -205,7 +205,7 @@ static void get_max_component_diff(const BlockInfo *=
bi, const uint16_t *block_pt
> +=20
> +     // loop thru and compare pixels
> +     for (y =3D 0; y < bi->block_height; y++) {
> +-        for (x =3D 0; x < bi->block_width; x++){
> ++        for (x =3D 0; x < bi->block_width; x++) {
> +             // TODO:  optimize
> +             min_r =3D FFMIN(R(block_ptr[x]), min_r);
> +             min_g =3D FFMIN(G(block_ptr[x]), min_g);
> +@@ -278,7 +278,7 @@ static int leastsquares(const uint16_t *block_ptr, c=
onst BlockInfo *bi,
> +         return -1;
> +=20
> +     for (i =3D 0; i < bi->block_height; i++) {
> +-        for (j =3D 0; j < bi->block_width; j++){
> ++        for (j =3D 0; j < bi->block_width; j++) {
> +             x =3D GET_CHAN(block_ptr[j], xchannel);
> +             y =3D GET_CHAN(block_ptr[j], ychannel);
> +             sumx +=3D x;
> +@@ -325,7 +325,7 @@ static int calc_lsq_max_fit_error(const uint16_t *bl=
ock_ptr, const BlockInfo *bi
> +     int max_err =3D 0;
> +=20
> +     for (i =3D 0; i < bi->block_height; i++) {
> +-        for (j =3D 0; j < bi->block_width; j++){
> ++        for (j =3D 0; j < bi->block_width; j++) {
> +             int x_inc, lin_y, lin_x;
> +             x =3D GET_CHAN(block_ptr[j], xchannel);
> +             y =3D GET_CHAN(block_ptr[j], ychannel);
> +@@ -420,7 +420,9 @@ static void update_block_in_prev_frame(const uint16_=
t *src_pixels,
> +                                        uint16_t *dest_pixels,
> +                                        const BlockInfo *bi, int block_c=
ounter)
> + {
> +-    for (int y =3D 0; y < 4; y++) {
> ++    const int y_size =3D FFMIN(4, bi->image_height - bi->row * 4);
> ++
> ++    for (int y =3D 0; y < y_size; y++) {
> +         memcpy(dest_pixels, src_pixels, 8);
> +         dest_pixels +=3D bi->rowstride;
> +         src_pixels +=3D bi->rowstride;
> +@@ -730,14 +732,15 @@ post_skip :
> +=20
> +             if (err > s->sixteen_color_thresh) { // DO SIXTEEN COLOR BL=
OCK
> +                 uint16_t *row_ptr;
> +-                int rgb555;
> ++                int y_size, rgb555;
> +=20
> +                 block_offset =3D get_block_info(&bi, block_counter);
> +=20
> +                 row_ptr =3D &src_pixels[block_offset];
> ++                y_size =3D FFMIN(4, bi.image_height - bi.row * 4);
> +=20
> +-                for (int y =3D 0; y < 4; y++) {
> +-                    for (int x =3D 0; x < 4; x++){
> ++                for (int y =3D 0; y < y_size; y++) {
> ++                    for (int x =3D 0; x < 4; x++) {
> +                         rgb555 =3D row_ptr[x] & ~0x8000;
> +=20
> +                         put_bits(&s->pb, 16, rgb555);
> +@@ -745,6 +748,11 @@ post_skip :
> +                     row_ptr +=3D bi.rowstride;
> +                 }
> +=20
> ++                for (int y =3D y_size; y < 4; y++) {
> ++                    for (int x =3D 0; x < 4; x++)
> ++                        put_bits(&s->pb, 16, 0);
> ++                }
> ++
> +                 block_counter++;
> +             } else { // FOUR COLOR BLOCK
> +                 block_counter +=3D encode_four_color_block(min_color, m=
ax_color,
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> index a0c98d4ae0..43b858984b 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> @@ -22,7 +22,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee=
4d69f5fce4486a80fdaf4a4263 \
>                     file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18d=
1b79df004 \
>                     file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680=
233ad02"
>=20
> -SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz"
> +SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz \
> +           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-fram=
e.patch"
> +
> SRC_URI[sha256sum] =3D "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd0=
52db9e440eef3dc"
>=20
> # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D7717
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173715): https://lists.openembedded.org/g/openembedde=
d-core/message/173715
> Mute This Topic: https://lists.openembedded.org/mt/95218376/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


