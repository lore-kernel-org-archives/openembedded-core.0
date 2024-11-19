Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC06AD4414D
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 12:02:49 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.134])
 by mx.groups.io with SMTP id smtpd.web11.19493.1732017762026885450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 04:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=YrUsJ/2D;
 spf=pass (domain: kpit.com, ip: 52.101.225.134, mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEECbeAQqs/uAob4Tn5w7th8H5DR6Vvu0ppJGERRMohP/A54dCLfGyafyuE4WZVYHbvxuVylk/xrdlGHk633TK3zscPRpjvjnVJAJCBftbC7zUCWzsIWYmfwpkM8zdXr+gtWEgUXLcIsP0rM9lwGZcx3SiWYVTWzXb+k1y16DZIOwawiGatKxSVtqyeZ3ZLBr5xkTriHuGF2AhjEfB03uKdpa/jCqfBVKHrXM5K45ojj1hkwffdFTLRx6Z5orqaCuQ8e4nsmRAsKnDseRX2rNUvbSl9U4JCFirSIP8zptbXsz2dIHhp0HbeDkEwjMQ921X9WqOUEdFErOV9J28MjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nf3sbTWPPtudRH3S2ZBtH0OWFoH3johev11zZ3cm9I=;
 b=RRsLmtdT+6v0a/2HHGP5IPwl67kjZMZoPUUoF+H21lylbYLIpryZeBF7Pm8f+nLvrinBRbzGtqSpjHx1wUjiLpKVK5zh+gcor0b+tiMCitm1Ssdr4J1aO9o4FTsYzpy1CEIdm2SvpSHwJFneuJMrPR8uvYd6AM8nx8e5XE6/lFUGxpG/Bcvd5hy1GiBPpcCwcFn47CHEON+pW6u/z9y3E4d8/oc/qZgGYcu5c1OvD5nCWRyk1z5FC7+tZ9zXjjjo8Ii2qA37cofnHDl3TNYm9B02qQXcfh4Rgmy2ePPueEvg3ATRgXJGPCWdKHlYpuEYRe8nxfvLwNGMU5oQ3uwyFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nf3sbTWPPtudRH3S2ZBtH0OWFoH3johev11zZ3cm9I=;
 b=YrUsJ/2Da+wXv8CYtHdtkkld3KOHspYQFHbZlTVL3gfnmwNj1Qxtq5WzK72ObNqAdDgbJlJt4T0w/llLBZxOZa881G6WiZ1tNn8NU2lvuFs1t9qmNWsqAY15lFDgLMtdXk9yxJTLwrCTdpCrngk/h5oqQi0UGMLNrR5Og1or3r8=
Received: from MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:c4::9)
 by MA0PR01MB9928.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 12:02:35 +0000
Received: from MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f53d:e88f:c0b9:2d52]) by MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f53d:e88f:c0b9:2d52%5]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 12:02:35 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: "thakur.virendra1810@gmail.com" <thakur.virendra1810@gmail.com>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "wangmy@fujitsu.com"
	<wangmy@fujitsu.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
Thread-Topic: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
Thread-Index: AQHbJFpbHy++pk2/YUSzB73vGbvKOLKSbr6AgCw8pKI=
Date: Tue, 19 Nov 2024 12:02:34 +0000
Message-ID: 
 <MA0PR01MB9355C27D944D288DF19DEE389D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
References: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
 <CANNYZj8VR90wUtudX4FiA-teKaJFrkgK_hohmb2o6iNXeGL96w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8VR90wUtudX4FiA-teKaJFrkgK_hohmb2o6iNXeGL96w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB9355:EE_|MA0PR01MB9928:EE_
x-ms-office365-filtering-correlation-id: 710ab421-b1f5-40eb-16cf-08dd08920dc1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?XKpuOO1PPnY2JghzBu1+VSoB68zxmXKlTbvemdYroUnNBiKQvMLL7YUcH/?=
 =?iso-8859-1?Q?d+02hcwsRCCShqRE4QIbEVXm6YpUjdAfVnqYbR4w1L9TGPrZBub/6rNY3F?=
 =?iso-8859-1?Q?8Dw1AaCttwy69c455iR/+gd9H1+qMmdJY+ORxEhh3vh2YRCLAG02YSf+xY?=
 =?iso-8859-1?Q?Wo69mwSWf8PGzi/u3vHPJ2RcQEqJHg/5bjJw7NlsJwshP+H8UGe0QP3bQy?=
 =?iso-8859-1?Q?2KT0u5evyC2tQXkcfFY5BnvuwCV0pKETQLL52hcVGVEluVRdujVX/cPFTD?=
 =?iso-8859-1?Q?FrvSf/vxbCyO3d6BnnomWxvwSKnrTiEJAwVfywPiYMi3i9t9oLNE2AZhjQ?=
 =?iso-8859-1?Q?Iej69WPay72bMzcyBmk8Shorr+E+ojAvP7ran4FWtjdZvRuCNDhQ1oyyQu?=
 =?iso-8859-1?Q?nMHvWB9trpTBcfiw92LLATFsPBxFf7iPQVC3Alx5v+AbnHZbY8DjNk1sAY?=
 =?iso-8859-1?Q?V+gIJLXNtQxxbEc27tCIjO3hS2QF6DzXG+m4IAvnhK/WVhM2eisbkR8PQ5?=
 =?iso-8859-1?Q?sDjmhdUM8cG0p4LBRJV8uI51LED6xc3uzFfLBWiiG4/gQ+oQY/cWWWmkWF?=
 =?iso-8859-1?Q?ecFkRWY1tkrQ5Oz63HdPPDfYQndbPcOFzNdhwDEUTyaQyjLHOJxRJa0eP8?=
 =?iso-8859-1?Q?YPqsd/dif07Q2ZzdOp4oWso0n4nt3yg6jccwXXmuCZ0k/PeeF0hqmGPavV?=
 =?iso-8859-1?Q?tHJKWhFmzkuWTfBETg2BPRXw0G07S7ZTlGdUxgxmfQPPuKiPYhiIdIoz7D?=
 =?iso-8859-1?Q?9WLWQX07DvzK7ABWbSjEZ375bnBvCCNTWptF8zSJVdfNGAMpICFOerJmX5?=
 =?iso-8859-1?Q?0YEnoBy9GZh8/V8YsE1B+OWAzZbpzPcyqjtjtV8Z2Oa6AhNEinZOaUsjfv?=
 =?iso-8859-1?Q?edO9vYpBwF6rH0iunTJ28Lfn9KaNq53gPifIxk8DQzZL8WBU7+xKswKEP7?=
 =?iso-8859-1?Q?R5GDBg0+GggezMBwDcESQ0/By+KLxa0KJw2OOhvabje/faLyI2ZAXisvcq?=
 =?iso-8859-1?Q?NX/j/4d0DvFXpd9SjajC0xIpKuNQ8THYeMlFwWMVfIvCjT2FKL6yvTAEjX?=
 =?iso-8859-1?Q?pXbXULGT0wbF1DmBf03YKS2LqaXka6xg1x8J40h5rD71IHUwjh0urrJqN4?=
 =?iso-8859-1?Q?XHjsjflj8dYWbyDMfqJwtZGca0BknQdlCc7aoKGJXXRbLhjE1bWTFfsgpm?=
 =?iso-8859-1?Q?N47nbjCQ740ap9CHSjdux9pe6gsqPtBwAXpGVXJMbRoRxhHjyK5jniu4uS?=
 =?iso-8859-1?Q?7lgHB6OCATlTylNX3u3IhJcWxwq4hqcjgLfyLa8ztosFmCiHY2QbVbLpcH?=
 =?iso-8859-1?Q?GiMeCofoE9L5q0MlVqqiQwYVVQI6kZ/1nOFvMCJf7ZRw+7at6UoaW3PDY4?=
 =?iso-8859-1?Q?p/6ZyyeA/K?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3NKB/ohxNwL3IFZ2QvJ6bvjmzwgyX1vi3uYtQR+RmIuyyMDXksV0t6XWVz?=
 =?iso-8859-1?Q?sUJPrX9MstUf1ad2YIZdvvr9+mqRMrkITCbEcEOTf/eKFdgUS/VRf0FRdv?=
 =?iso-8859-1?Q?2E22Gx8/VH37EROdjSxHKFbDoryQ0SIiWwYo7C8magG2YdPhbJ9ZsGan3u?=
 =?iso-8859-1?Q?vRkbun9o62zbLfnmY32/wpzt1msQ7vQhS2mKve8EebAQAOckEL6dK2TLxR?=
 =?iso-8859-1?Q?CTbYBXhiifHBAKoJXPMyrDtmwLawnJp3s438TXWOSQNsl5HLWn/WXeF/mQ?=
 =?iso-8859-1?Q?YW/OmQ2jLgJwtcCZl7XxoLFQEYxxLL5Pw/KNT/U6YzhvJ3I57+DbG4xOo1?=
 =?iso-8859-1?Q?mj4Nkz0BkJo5S89JyhKizsZp2cUSm/eIFWu4w8nOKPcnndIGXUz29aq8AL?=
 =?iso-8859-1?Q?zEsZZI3GOlYonkj9Xj8LY+mDp/zNMvJ4LbaMsotY6gb9y0cHG1Vfzy2wbg?=
 =?iso-8859-1?Q?s2FvWL4P5a92ZCVIE0FvG6iFppNbN7VGQSOS2FQ/KwfnhUZhanBTqZQ7ge?=
 =?iso-8859-1?Q?xQxg14kWr1cTIoTrvAZkYx3DNb6MfEOIfhAq0ZZ0U0j9q0USduIDXOMS6T?=
 =?iso-8859-1?Q?omX492aYYFxBYZhMbOJuR18GlNh+n7s/rGGrRGizFMxCsCsC37FyZ6Up3B?=
 =?iso-8859-1?Q?9OhLaspxG6m6YGmF86obHy9NBAZ3rLltXIp9++VG/UeLMGeaELWR3tJqil?=
 =?iso-8859-1?Q?o1IxGXsZ9OlRLpXVUI2byEvWjP9KaLkKwschI5khkzzk0kRHrSb821qFe2?=
 =?iso-8859-1?Q?++u0yLLHDTrRyGhiwCzY7Xp2hngyg7kQcDtceCLvY8Me2h/5swLPD08zCC?=
 =?iso-8859-1?Q?Asj+vBF1l7kZRZwEAOZkeVrgjEQGTk8WRq4EV5/3ETSvFf3BcxhI3WtOsi?=
 =?iso-8859-1?Q?RZ0VOmX2S8mZ/Cb5d5oaszPyovDfdBKidhC7GtMFV7iQyak6ez2fKwJXAO?=
 =?iso-8859-1?Q?SdQf0zsYYhDO5uQqXKcWPD0DKkPVYIaFR4BUhEORMV5iJmAaIKFoGZffof?=
 =?iso-8859-1?Q?KYur5dUzsE0oToAjkoUaKYT71kr3BQDlvOsCFS81t80lY+mbwK1o5OtdH1?=
 =?iso-8859-1?Q?HKrvOdV5gCfEa8mAdGoi2T3JuTZTUpjOrZGQBfEWyE8KPItDAjzEpSwQ7N?=
 =?iso-8859-1?Q?r+F7sO2TMQDAgA+7zQeUqTRikKlgxJk75snHvl6dwcH+JweeSJRkaIn4uj?=
 =?iso-8859-1?Q?/9o+LY1rqU7lpACC3TAbbGJxvthpz7G2xKiqengSoWzO6pm4UU1MbqYSSv?=
 =?iso-8859-1?Q?2ZSyYgdqN7yYsm/9ciqXvK0KBAkpAcH0qUO2LZacoVW+NJAJ9iuFwz73kZ?=
 =?iso-8859-1?Q?MpSM0Qy5QSrYyxgAGNvaBL5C5D9I4VGbi/du34xnMGYWAb7qDWSaZc2L9A?=
 =?iso-8859-1?Q?SowjIZMEytGkGaRIc1hk4qvT5Fdo1IM2GwUKogLLRXwwc0Nxzh5FgtMYLT?=
 =?iso-8859-1?Q?rXe/giDhByRP6rEquwDAv/69an3NWVMszclGOmd8TaPxtDmhRF2iPc+Xon?=
 =?iso-8859-1?Q?aQAHeAatNXCJrYp6LlS/GVVAXO5/qOvzTZnE1Xza2YKXNAF2ZnZoi6HKVX?=
 =?iso-8859-1?Q?0JtEmUOX99tb1JqNusqJM+ISf3rOtwSDKsmi4KadpBsL7iZeyFke6b7Zs4?=
 =?iso-8859-1?Q?XPe83LtDHL6No=3D?=
Content-Type: multipart/related;
	boundary="_004_MA0PR01MB9355C27D944D288DF19DEE389D202MA0PR01MB9355INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 710ab421-b1f5-40eb-16cf-08dd08920dc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 12:02:34.5440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hcadLdpiCl2JtbB/9naLB/ZJW+dlnf8eGTi1MjeyQg6Kr0bWMknn1vKUkBl6sDvxQf6Xp6EMs6bXqWCmQxVSsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9928
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 12:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207386

--_004_MA0PR01MB9355C27D944D288DF19DEE389D202MA0PR01MB9355INDP_
Content-Type: multipart/alternative;
	boundary="_000_MA0PR01MB9355C27D944D288DF19DEE389D202MA0PR01MB9355INDP_"

--_000_MA0PR01MB9355C27D944D288DF19DEE389D202MA0PR01MB9355INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



Below test does not require any argument to be pass. Its is a simple binary
> +       test-version and test-reader


 run-emitter|run-dumper|run-parser|run-scanner|run-loader
Other test require an argument and yaml file which it needs to perform task=
. Like parsing or emmiting or to perform run-loader test

I will send another version of patch without below change:
> +SRC_URI[run-ptest.md5sum] =3D "040b47d9b00d2ddbc707792ff6626243"
> +SRC_URI[run-ptest.sha256sum] =3D "71030494ab116f1c31bf125de9d5fbe2f01aac=
f4daada36b44202be135a80964"
> +SRC_URI[example.yaml.md5sum] =3D "d7f8a342650b153d219431633b0c383b"
> +SRC_URI[example.yaml.sha256sum] =3D "d7c50b29716fcc7445e181c7d7043d70f8e=
58096793dc1f351c8e7f41034f813"


[cid:95654072-e768-4291-9780-247df4bf5f3a]<https://outlook.office.com/bookw=
ithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous&ep=3DbwmEmai=
lSignature>         Book time to meet with me<https://outlook.office.com/bo=
okwithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous&ep=3DbwmE=
mailSignature>

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Alexander Kanavin via lists.openembedded.org <a=
lex.kanavin=3Dgmail.com@lists.openembedded.org>
Sent: Tuesday, October 22, 2024 1:53 PM
To: thakur.virendra1810@gmail.com <thakur.virendra1810@gmail.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; wangmy@fujitsu.com <wangmy@fujitsu.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

On Tue, 22 Oct 2024 at 10:13, virendra thakur via
lists.openembedded.org
<thakur.virendra1810=3Dgmail.com@lists.openembedded.org> wrote:
> +++ b/meta/recipes-support/libyaml/libyaml/run-ptest
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +for testlist in test-version test-reader run-emitter run-dumper run-pars=
er run-scanner run-loader; do
> +       case ${testlist} in
> +       test-version|test-reader)
> +               outputrun=3D$(./$testlist)
> +              if ! echo ${outputrun}| grep -q "FAILURE"
> +               then
> +                       echo "PASS: ${testlist}"
> +               else
> +                       echo "FAIL : ${testlist}"
> +                       exit 1
> +               fi
> +               ;;
> +       esac
> +       case ${testlist} in
> +       run-emitter|run-dumper|run-parser|run-scanner|run-loader)
> +              outputrun=3D$(./$testlist example.yaml)
> +              echo $outputrun
> +              if ! echo ${outputrun}| grep "FAILURE ([1-50]"
> +              then
> +                      echo "PASS: ${testlist}"
> +              else
> +                      echo "FAIL : ${testlist}"
> +                      exit 1
> +              fi
> +               ;;
> +       esac
> +done

I'd like to better understand what is happening here. Why are some
items in the test suite run without an argument, and other items with
example.yaml that we created ourselves (apparently, from items in
examples/)? How does the test suite work upstream and why can't we
simply use that?

>  SRC_URI[md5sum] =3D "bb15429d8fb787e7d3f1c83ae129a999"
>  SRC_URI[sha256sum] =3D "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2c=
f2988e3c02678ef4"
> +SRC_URI[run-ptest.md5sum] =3D "040b47d9b00d2ddbc707792ff6626243"
> +SRC_URI[run-ptest.sha256sum] =3D "71030494ab116f1c31bf125de9d5fbe2f01aac=
f4daada36b44202be135a80964"
> +SRC_URI[example.yaml.md5sum] =3D "d7f8a342650b153d219431633b0c383b"
> +SRC_URI[example.yaml.sha256sum] =3D "d7c50b29716fcc7445e181c7d7043d70f8e=
58096793dc1f351c8e7f41034f813"

This is not necessary. Integrity check for files in the layer tree is
ensured through git commit id (of the layer) being a checksum of all
the files.

Alex
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MA0PR01MB9355C27D944D288DF19DEE389D202MA0PR01MB9355INDP_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Below test does not require any argument to be pass. Its is a simple binary=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test-version and test-reader&nbs=
p;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;run-emitter|run-dumper|run-parser|run-scanner|run-loader</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Other test require an argument and yaml file which it needs to perform task=
. Like parsing or emmiting or to perform run-loader test</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I will send another version of patch without below change:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; +SRC_URI[run-ptest.md5sum] =3D &quot;040b47d9b00d2ddbc707792ff6626243&=
quot;<br>
&gt; +SRC_URI[run-ptest.sha256sum] =3D &quot;71030494ab116f1c31bf125de9d5fb=
e2f01aacf4daada36b44202be135a80964&quot;<br>
&gt; +SRC_URI[example.yaml.md5sum] =3D &quot;d7f8a342650b153d219431633b0c38=
3b&quot;<br>
&gt; +SRC_URI[example.yaml.sha256sum] =3D &quot;d7c50b29716fcc7445e181c7d70=
43d70f8e58096793dc1f351c8e7f41034f813&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<table id=3D"pbpsiglinktable">
<tbody>
<tr>
<td><a href=3D"https://outlook.office.com/bookwithme/user/fcab7d9903984b91a=
5841c51f49bd5ec@kpit.com?anonymous&amp;ep=3DbwmEmailSignature" id=3D"OWA605=
dc425-860d-47dd-9715-7fd547fabd17" class=3D"OWAAutoLink"><img data-outlook-=
trace=3D"F:1|T:1" src=3D"cid:95654072-e768-4291-9780-247df4bf5f3a"></a></td=
>
<td></td>
<td><span style=3D"color: rgb(0, 120, 212);"><a href=3D"https://outlook.off=
ice.com/bookwithme/user/fcab7d9903984b91a5841c51f49bd5ec@kpit.com?anonymous=
&amp;ep=3DbwmEmailSignature" style=3D"color: rgb(0, 120, 212); text-decorat=
ion: none;" id=3D"OWAd3651915-eeaf-36b3-86d0-fcdeef40a5ac" class=3D"OWAAuto=
Link">Book
 time to meet with me</a></span></td>
<td></td>
</tr>
</tbody>
</table>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;openem=
bedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded=
.org&gt; on behalf of Alexander Kanavin via lists.openembedded.org
 &lt;alex.kanavin=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, October 22, 2024 1:53 PM<br>
<b>To:</b>&nbsp;thakur.virendra1810@gmail.com &lt;thakur.virendra1810@gmail=
.com&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;; wangmy@fujitsu.com &lt;wangmy@fujitsu.com&g=
t;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [master][PATCH] libyaml: Add libyaml pte=
st</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Caution: This emai=
l originated from outside of the KPIT. Do not click links or open attachmen=
ts unless you recognize the sender and know the content is safe.<br>
<br>
On Tue, 22 Oct 2024 at 10:13, virendra thakur via<br>
lists.openembedded.org<br>
&lt;thakur.virendra1810=3Dgmail.com@lists.openembedded.org&gt; wrote:<br>
&gt; +++ b/meta/recipes-support/libyaml/libyaml/run-ptest<br>
&gt; @@ -0,0 +1,28 @@<br>
&gt; +#!/bin/sh<br>
&gt; +for testlist in test-version test-reader run-emitter run-dumper run-p=
arser run-scanner run-loader; do<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ${testlist} in<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test-version|test-reader)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; outputrun=3D$(./$testlist)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if ! echo ${outputrun}| grep -q &quot;FAILURE&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;=
PASS: ${testlist}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;=
FAIL : ${testlist}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; fi<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; esac<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ${testlist} in<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run-emitter|run-dumper|run-parse=
r|run-scanner|run-loader)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; outputrun=3D$(./$testlist example.yaml)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; echo $outputrun<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if ! echo ${outputrun}| grep &quot;FAILURE ([1-50]&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;PASS: =
${testlist}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;FAIL :=
 ${testlist}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; fi<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; esac<br>
&gt; +done<br>
<br>
I'd like to better understand what is happening here. Why are some<br>
items in the test suite run without an argument, and other items with<br>
example.yaml that we created ourselves (apparently, from items in<br>
examples/)? How does the test suite work upstream and why can't we<br>
simply use that?<br>
<br>
&gt;&nbsp; SRC_URI[md5sum] =3D &quot;bb15429d8fb787e7d3f1c83ae129a999&quot;=
<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;c642ae9b75fee120b2d96c712538bd2cf28=
3228d2337df2cf2988e3c02678ef4&quot;<br>
&gt; +SRC_URI[run-ptest.md5sum] =3D &quot;040b47d9b00d2ddbc707792ff6626243&=
quot;<br>
&gt; +SRC_URI[run-ptest.sha256sum] =3D &quot;71030494ab116f1c31bf125de9d5fb=
e2f01aacf4daada36b44202be135a80964&quot;<br>
&gt; +SRC_URI[example.yaml.md5sum] =3D &quot;d7f8a342650b153d219431633b0c38=
3b&quot;<br>
&gt; +SRC_URI[example.yaml.sha256sum] =3D &quot;d7c50b29716fcc7445e181c7d70=
43d70f8e58096793dc1f351c8e7f41034f813&quot;<br>
<br>
This is not necessary. Integrity check for files in the layer tree is<br>
ensured through git commit id (of the layer) being a checksum of all<br>
the files.<br>
<br>
Alex</div>
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

--_000_MA0PR01MB9355C27D944D288DF19DEE389D202MA0PR01MB9355INDP_--

--_004_MA0PR01MB9355C27D944D288DF19DEE389D202MA0PR01MB9355INDP_
Content-Type: image/png; name="Outlook-w2azmue2.png"
Content-Description: Outlook-w2azmue2.png
Content-Disposition: inline; filename="Outlook-w2azmue2.png"; size=528;
	creation-date="Tue, 19 Nov 2024 12:02:34 GMT";
	modification-date="Tue, 19 Nov 2024 12:02:34 GMT"
Content-ID: <95654072-e768-4291-9780-247df4bf5f3a>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAcpJREFUOE9j
ZAABr6aJDHqhuQwMDIxgPrHg19d3DLP91Bk+P3sD08IIN2x1hjPDy7NXiDWL4T8nM0NA33wGWRMP
hg5NJgYGhv8gvYwMFdf/MYAMu3twP9GGISssv/qLYVdzMsP5FYthBv5nmO2pyfDzzVuyDEw/eJ3h
xNyJDEenNSMMJMskJE2Hp9YxHJ2CZOBUM1GGz5/hAUuS+UVnXjOcXDCJygbOm4TqZUpcGDJjJcPz
S1eoYyAvrzDD58/vGRgY/iHSYcX1/wykupBXWpghe89reEbY0RjNcGHFMkQsk2pgwYkXDBz84iiR
16EJzmWghE26C8uv/mZgZGJBM5AZ5HXyDPRo7GMwCCuEG/jj40uGCRYS5LsQpNM6q4TBOLqE4emF
gwxrs8NRI2WynSTD19cvSErQOBQzMhSdecvw8vophqWxngQNBCWTrBMvMMIPpnF7dQQjA6+UCEP2
3tcM//7+Zvjx8QNOQydZizFk7bvNwCepgs9iWIHKyGAYEcPALaQEUQwq3mBplQmi5siUBoa0bRcZ
hBT18Bj4n7QSWlhGmiF19xOcBh6aVEyagSCTQEEUNf8Ag6CcFjyn/Pz8hmF9cQjDg8MHAaiKxp0e
iZJ4AAAAAElFTkSuQmCC

--_004_MA0PR01MB9355C27D944D288DF19DEE389D202MA0PR01MB9355INDP_--

