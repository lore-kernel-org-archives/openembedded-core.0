Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0389C77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 10:59:23 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.24172.1683284360471269799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 03:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVR7VYlshRFlnOTZnN+Fu65mlHjTECzxiK5BpjNCeKB3SaJAcfAO7HZsys8SCZoAO0UEWxp/AKpRe0jUxGxLaBkZmXtIVdpa9UJgwrbf6XgT/vuYRQV0k48adlPnznRHhfSLS5D1wXs4WBOwaLP1Khy/DCvk/OxYZViq1QVmIQsangtsJTcc+yzdOX+i7XXaWLOM+Ji+FoTChM1hHLzPKzSB7SGh0PjKbm+brWfUGI3k72NCOZGeopInpTI98/+WSD2mJRGnryRTmAF/rsfCm1OBF2KddqtkABoCOoW6ra7h45+h0Iekk3xLr36bhVa/4JkNanuX13q7fyBc+3iPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kq7ZVDA2f3ce2OpFF6WFwqR/7BeMqNfx3uawIutS9+A=;
 b=NtzYVBdJBY4sRbIxFeEDSDy3f8oDsfxQgEfjVw3WAXrPLCZS2IzhE3fwZc4je+YNLs7Jz6hM8HN/aV5N2CivqlaxWvyZFD7NhqHHUt7dclvrjEcImrnc8onIJEmKw9StY2DEwjC3Y+xZuoKabykEYX2Pbz6P8Y86KLRxHBrFGfC5hHlTY15iJfL1UTC16FShIs9/qwJwP379vmkkqLUhjyyozAHJYH/8KmlzaC822ZtJxxkzqQgyyhI5oOm/aahF/xwlyvHIXpMxVpYqlXnYGHt81oWLQ73x5X98AjW3mnj//VESpOx5GR2QJH4lJzBLP2qUudTQp6iMnM1xut6hdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kq7ZVDA2f3ce2OpFF6WFwqR/7BeMqNfx3uawIutS9+A=;
 b=mTyDtsSkUy0XfK8+0jmAoksGUFqDD7S7Z+oTf6riABKT5qzjpj3rIMOU1FmsKw8ugnrA1dcZGsfmwaBCibKL8q9XEtku0xl3ctxrEyBLz8/ZtOBr3WmN7JwIW6QwRGh2cZ8VmKo4zWktZu3iT1Tbfz9+sKk58+EuZPH2yXA1uY4=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Re: [OE-core][PATCH v4] devicetree.bbclass: Allow selection of dts
 files to build
Thread-Topic: [OE-core][PATCH v4] devicetree.bbclass: Allow selection of dts
 files to build
Thread-Index: AQHZeBAvBsD274Ap3ECyF30d5FUOnq9KCagAgAGFOKs=
Date: Fri, 5 May 2023 10:59:15 +0000
Message-ID: <DB4PR02MB10030398AE71DDC1E005F8848E2729@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230426072204.3255437-1-kubiznak@2n.com>
 <2826abbfbfb636f23354faddf7d35def35a7dc13.camel@linuxfoundation.org>
In-Reply-To: <2826abbfbfb636f23354faddf7d35def35a7dc13.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|DB8PR02MB5913:EE_
x-ms-office365-filtering-correlation-id: 4abcc68b-45cf-422d-3dcb-08db4d57c459
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o2UtGibTbuQmUbihzDq53rleCNN9qm88A1KnUh6/Xm7ffQhI0k1Bv4szFbB44JH4TgFbShx7VY0apNimD9vS4sZwoJGJdu0RGTr43mAQg0jGN/kEkioERZXyTibNtQIBfmpSnS7RkiPOFj7qh6OYyQutQCBliQhj1h6GX8vdLVzVGogJC/vwSj5x0TIroKS4s1xDo5ZHkTTuGxegRYglpDrtAyYlbs6AyCqhRn8p03G3NUVTtkZ9skJcg+DHDKE0nfWwDnXsP/1bkbm8bKCESZmgN+nUqhKldpWHrkLvszCgRdmTbmrvvB53ConZne9gV/Y5QY9rFigovTAKuMaiEs7ssRBq7RlKDYI7/b+MJuejlAxr3t8os7HmX9QWKmfCLpn0ZAl7RtqWC9VnXc7dbB3OAzYM89HgfYYwVKmqFlmhIo1yrgFYSoRvdL/G5ER6JHFcYixxlLYNkucxH83P1drZZefuqzqjcJVFfvwh7zAcIFr5AtSauUpkunWydf8LJs0U3gwuTDlcucBPbRpaouLoatU7Xt2vJ7AtQQp5dw0koUoz5wMpsJoRNoF36zOz4RujafRH/Uqas9yVOOS7265NK4odOiHkEV2vCbU34ZB934e26P8p4oJTkTIjbyCi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199021)(33656002)(71200400001)(86362001)(91956017)(110136005)(316002)(4326008)(76116006)(66446008)(66476007)(64756008)(7696005)(66556008)(66946007)(478600001)(41300700001)(55016003)(5660300002)(52536014)(8676002)(8936002)(2906002)(38070700005)(38100700002)(122000001)(186003)(9686003)(53546011)(6506007)(26005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?PsOv3Lr1E+jxfR/Yl8wybLEEhQW/0PdmuBBpaiCA1nCKCXXuZ7SxJUHOHQ?=
 =?iso-8859-2?Q?JrGa6n6LFojXUJgH/jZkE+PUbJ/RaRz9YZ4HruiEUaiiELcfkg0lEetCwy?=
 =?iso-8859-2?Q?zHwS9L8vGit46tAN5clK69KQQgw0e0F9yWQbapWSqEkUBUU2+BLaqB0iR8?=
 =?iso-8859-2?Q?VYB+SP7sIPRNsm7ZLMv/fgrvfF7jcbbu1l9gw3MM8FrWS/P1GktBRSv6eK?=
 =?iso-8859-2?Q?KK9crQ8TBsw0zBIpUJoDMFAdbCs1hhsEAw3qtg7ofwtyrsIWvwIFmlRJD/?=
 =?iso-8859-2?Q?9xtlD41B4cSYXEFF7IDIRO816G0ESW8GUdXzzfy+c/G9eVphACJjbkY4/D?=
 =?iso-8859-2?Q?nqwdFUUfXJqHQ7JU5f+Ga7dOJyiWIAONZOX1hkm1umeZqs5VP76xbJIH/j?=
 =?iso-8859-2?Q?+YmW294dpu7F8z1vFMz6qPZjWwHTKBAO3Q5C/AyJn9Qjx/Y2XHu/Jp/fGH?=
 =?iso-8859-2?Q?/9lC3Z513aD/WMh+Rd57TKvl2W+3En1rGvkrNzKvtk2ySVvC977BcJKGX3?=
 =?iso-8859-2?Q?GV3XinNDptGtbOuRwY5UbwM57nD4Ty3783WvwiJT+AeIDrQj/DN2aNnjDU?=
 =?iso-8859-2?Q?W/AK96FH+gvjTGOrk1WKAfysemnhw7kV3sINXGZllMxWXXSU7hBtjIidOo?=
 =?iso-8859-2?Q?dKcTWI9JnaT1jIf+NayGNnNigei3qDTyg6o2ey80tTqJEreqkXdT8DARl/?=
 =?iso-8859-2?Q?yVLm7Pz7/gUodt0z+00SxCLjKWm+eufPZQbmAScwyC2TQilMBkNfSoLLgR?=
 =?iso-8859-2?Q?gJNjjg5Er+YN7FOKPWd/llH9fG217rlN+XGiZ7HyC5xD0TLQd7rTNQb6ze?=
 =?iso-8859-2?Q?2ViMyZogIUUKMs+aJ9/StDZP4GzlqVujrSMr1n33DZVUNEC7iK+wj1TOLj?=
 =?iso-8859-2?Q?TrDOXVCTT8VFFUlmEaFUjLD4+hC9qg0oQ6X1kyWVg/GUe0WM5EvFTcpSCv?=
 =?iso-8859-2?Q?sOJ8khav6/zsfrEc21IXAj55KmSKxPpzPo/30ZvrRRgqtOgp7NVYSHfjlF?=
 =?iso-8859-2?Q?0vC2CXI7odkuhTE6irppLcbgG80Q0KoN7VslV05lm6wVLh8GQ1Z+/Rsu3U?=
 =?iso-8859-2?Q?QADbrrrjNkWiKgIrznkjW9AAFYG+RhAfs/7hQNMU7qmGsIiw3BVVG+8hz5?=
 =?iso-8859-2?Q?7soGzlrQypukHlWPH6M22eTWLojWxsSZwjxw5u514XFPF98yxgWqsfV/KJ?=
 =?iso-8859-2?Q?D+gt/4UUYUF6aFfv9KQHH0UtHMRUwIpOA4Cw+pjASwWrG4NgVqdzEo0f0k?=
 =?iso-8859-2?Q?iYNlfB3ztFs/isYoAUoGNeYfH38WB1HTge41gg+KHqLScmS8RrZewXNrdN?=
 =?iso-8859-2?Q?mshbtQ9GumeWj1Fat9pAVuIAoNTrjqd0G47dSwO562EE5HuQHgH0b/SDK+?=
 =?iso-8859-2?Q?7f4krt1doHNkyDuinkupfL/YSfr/JO31yyTgCWIdU6lVVrrAIXTa27R6e9?=
 =?iso-8859-2?Q?UeYxAxP5Xw0epClCUJ7TBRSqrpitH1cPYCXMiO8hgAicxjYJjefUF/g6hf?=
 =?iso-8859-2?Q?YYb5lOCsghMCuXOLwpV7SQTR5FaSMZJZ74i48Wci6QgvmbbTbT7vSChFqW?=
 =?iso-8859-2?Q?QQXhrv97IhLMn+fqmsnJ6NOeOuuIKfHwQ9IauyM+kay94zp+I1jUZhDErj?=
 =?iso-8859-2?Q?ABu2tZoUHtyTw=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abcc68b-45cf-422d-3dcb-08db4d57c459
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 10:59:15.4709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ObmzhiY98udJWc22TZ3xuY0I5NqeGe+F9BgnnJS6SvAbzoY5M0uxEpDxptzzXbXQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5913
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 10:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180908

Hi Richard,

Thanks for accepting the patch.

I can for sure send a doc patch, just want to make sure it is desired since=
 the glossary does not list any DT_* variable at the moment, and the device=
tree class section in this respect only refers to the class sources. So I t=
hink both DT_FILES and DT_FILES_PATH variables should be documented at leas=
t, right?

Cheers,
Petr

________________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Thursday, May 4, 2023 1:38 PM
To: Petr Kubiz=F2=E1k - 2N; openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker
Subject: Re: [OE-core][PATCH v4] devicetree.bbclass: Allow selection of dts=
 files to build

On Wed, 2023-04-26 at 09:22 +0200, Petr Kubiz=F2=E1k wrote:
> Add DT_FILES variable to allow the user of the class to select specific
> dts files to build. This is useful for packages featuring dts files
> for multiple machines.
>
> To make DT_FILES consistent with KERNEL_DEVICETREE, the list works
> with both dts and dtb files.
>
> Signed-off-by: Petr Kubiz=F2=E1k <kubiznak@2n.com>
> ---
>  meta/classes-recipe/devicetree.bbclass | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe=
/devicetree.bbclass
> index ed2a92e447..bd50d7fa1d 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -53,8 +53,10 @@ KERNEL_INCLUDE ??=3D " \
>
>  DT_INCLUDE[doc] =3D "Search paths to be made available to both the devic=
e tree compiler and preprocessor for inclusion."
>  DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
> -DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to sel=
ect dts files that are not in source (e.g. generated)."
> +DT_FILES_PATH[doc] =3D "Path to the directory containing dts files to bu=
ild. Defaults to source directory."
>  DT_FILES_PATH ?=3D "${S}"
> +DT_FILES[doc] =3D "Space-separated list of dts or dtb files (relative to=
 DT_FILES_PATH) to build. If empty, all dts files are built."
> +DT_FILES ?=3D ""
>
>  DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, used =
as extra space typically for additional properties during boot."
>  DT_PADDING_SIZE ??=3D "0x3000"
> @@ -125,9 +127,12 @@ def devicetree_compile(dtspath, includes, d):
>      subprocess.run(dtcargs, check =3D True, stdout=3Dsubprocess.PIPE, st=
derr=3Dsubprocess.STDOUT)
>
>  python devicetree_do_compile() {
> +    import re
>      includes =3D expand_includes("DT_INCLUDE", d)
> +    dtfiles =3D d.getVar("DT_FILES").split()
> +    dtfiles =3D [ re.sub(r"\.dtbo?$", ".dts", dtfile) for dtfile in dtfi=
les ]
>      listpath =3D d.getVar("DT_FILES_PATH")
> -    for dts in os.listdir(listpath):
> +    for dts in dtfiles or os.listdir(listpath):
>          dtspath =3D os.path.join(listpath, dts)
>          try:
>              if not(os.path.isfile(dtspath)) or not(dts.endswith(".dts") =
or devicetree_source_is_overlay(dtspath)):

I've taken this but could you send a patch to the documentation to add
this variable to the glossary and to the devicetree class section
please?

Thanks,

Richard

