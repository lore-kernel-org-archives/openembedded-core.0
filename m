Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7366BC433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 13:57:58 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.92.68.82])
 by mx.groups.io with SMTP id smtpd.web10.6643.1637589476502336514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 05:57:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=YTCqiST/;
 spf=pass (domain: outlook.com, ip: 40.92.68.82,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxi/X8alPhFCvPpBQTQuKG6b8yXhCAjf4OVrriSYog7ixVjM9Qpm9sotOLoEjMbI2VShT1UiJ+UXRSpcY32apF4sJTy0pBdeGiY4utmrZpPppJrFG/yztW3C9bQ2CWJ7XTBWh7SZLufNE/nNm725gDB74Jl1xR+WJS+PlYYam/ACETyRXo8ehyd92GZRr8WnnJestWUrt+NZ9Ql6rni+Ua1ac0r2zsyjG+TsX2Od78fN5b3zr78bTBcEVyTi3p0fH8v2DOIq97z4aTM2nuyjjq4PS9SodyWlfcr1Nm2fW/LWnFs9PKb9MPO1pWhuJ9ix69n3UANIurM/GOp3goj8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4iFs967WDap4sJBrpr1UmYNOQ1qrYy5pcL9Iq8Jz/o=;
 b=j4q7JA3y8QqWtMtXQPB2oOchkXjwR/dTbGFV1tsvD4eOvB8w9cApycrVTMSw5bK7ufO9kl+00vuZzQ5Dcac6Skv8NlYHV6DiGxxcU8EBb0/TX9GXlryMQVcitTfHQUePNXsxxrmeEEGUbr5irvcMhrfNdY4CWBJR+HlTiA9FYOvUy7q42UrUTnfivx6Q7IZcBCAxYLJFk5weytO0MhzcKGPafdEKOlkUp/Pmz9QO5655brDwRCLhbMWiCOsEsEVH1Up2md4QEAQaqQneHz8uSfA/v3H7ltQaajjcJumqvL32ECIkzXkFELUWVxaAWQf+AvAoVnHEqRcKYgvF8CzcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4iFs967WDap4sJBrpr1UmYNOQ1qrYy5pcL9Iq8Jz/o=;
 b=YTCqiST/+D26uGTFMlyTBhbjuQTR0+o+SXxk/586uhKX9KjLOIxxXgO1JCarGeg32+QpnYJRfFq/Kwm1iH0UaUggTFbPQBBcC7z0e4ID57BF4KwyuSlDEzTvmRqrVOzH+KXHcgbAYD3OpJDOqlkr3topFfgLzDnUEezhbCxBQS2UIt081I+qp+2s9RPp0jXif840Vv5alXw/zZrwnpmCddRMqLymCaWcpTPgsyD61mEIEnjExfnz2vyGU30cIjU6D6HnWYJcssjmay6DlqhL/9aKyWXf0EPgirmDsiDnQmRhwEoRL5XBrm6iiXG8gsLua2hnYfjbuqOl/LaQgc8VMw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3762.eurprd09.prod.outlook.com (2603:10a6:208:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 13:57:53 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 13:57:53 +0000
Subject: Re: [OE-core] [PATCH v2 1/7] systemd: skip chown when building for
 nativesdk
To: Luca Bocassi <luca.boccassi@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <20211119113429.502652-1-luca.boccassi@gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642F4FE2BBA8DF859A98BE1A89F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 22 Nov 2021 14:57:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211119113429.502652-1-luca.boccassi@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [mViRRiJcVQYZ4vXHOgWNm1Ywnju/GvnK6ZFst4SOPrus13I9dcZWm8Ni4l/aOE9/]
X-ClientProxiedBy: AM3PR07CA0129.eurprd07.prod.outlook.com
 (2603:10a6:207:8::15) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <1385dd7c-ff4f-c8bc-2fed-b9f173af3e22@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM3PR07CA0129.eurprd07.prod.outlook.com (2603:10a6:207:8::15) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.17 via Frontend
 Transport; Mon, 22 Nov 2021 13:57:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55af04df-6c19-4437-ad14-08d9adc013ff
X-MS-TrafficTypeDiagnostic: AM0PR09MB3762:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hmLeCInFx9gjig/DA4RA2ikxxDXok+4clQSd4qWeIIpj+fVj/F89GZJjf/HsAFK3q1cbncZSfkD38jdHZV8agOI+UGMdh3abu/L7Sc3Pfz/Efwj/iYo7mRJ2vucxnvTFJRAmkKkzZJ10z6OrJOUohNU3Kacr4l+awr8nOIbwzj78pmxfwnxS2Jgz1F9ndRMyBI8fRHQye1+RXv+wnjgVIawMSZH7IHu/SbDR16/ogIZgR6YN/T7Mr0Sl7YslIz8HGyFGHE0ACTTdNe3UD66Amifl5TWQyuGjuSqS1rnZpYb6mvdNnQ6Ja8bBuQx/OxtFHDypmTs3Iq2o+jynr+DkqqnYMqFIIMaqG7SrpF3VZatTTGRotuowmty9rN4YiTZ//d4g0m1r8XoFLkrNBNxP3eGP1phdjzguxWaJt0au0sQzGtGdqwPwZl92jETtfUfisXFW5ur5G0Dnm/RW4ruL95MKCreJp2x5DUiEMhG92ciThD0yJ+4U6Tsx/0Dy3Txlrx8mCJ4BRmII1yl2Y0lw7AqjXd2mmTB5w931QeXd7s67HRDts0zdt1r69oriK9YWDhemhAhfwVsQIDVrIi8+eGqPB1hNvYPP3oU82so2thccwRxvEsDjtgubYch/WRmW3N9z0DDAVa8y7afyN93HDSbf2PK7Aj2RxDMSXcTck8g=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uCdPmrapy92Vy3E2xGTrgUhHjc6lWy7kCONg+CLWwjR7xf2NvFWNMMUxLJn2owUdL9IksH7Z+tdqaImHTtA/ScvDQRzaIzYlu3WLBB3WM5BpE3oYhuF+Ye8/nXoxsM8YrJJqta2ZzO3MZajPzWUFV+WfUbPWBLpAX6qJ61ny7UmPS3AIvY6hMFphKk9QND4vRgpVJ89wTlA4qLqYRhEDrS+Pti2SYT5l/U6dlNzteEbiWNhN2dMWR03M+2P8brLgBfMrCtmuosa91QTZ8wT29+L5fghad5QgZal84M5CiztDV9lpWUnv9tMBPvDTU7YIcoJD1oR6CPn1JxMRLa3uLtlSAe0PgJgyCeeKVAntOZfiQjeLqenApwkAKAKB+kcLtvRHMk0TOEAeAYkJgRF6rEXcx2MoCPxMzAKn1BySquZxH+6pMrvwjWWv+MI+iJq9Acae6i5vLsRNmt6JO/lD41QqvBbylpCcJdyxzn9WU0eWE85GFk/oAuZDUUYO/HKIFY1aP8rcswF/NMRzLQIFZOce46YzY6JOyGqvxX8clsdXw8dCa7Gc7h6FrdxpqSdwwv23rKESitj7GI+qDWCyRqD003BA592adSsRZDX5tDPTVJiS4aYvgA59heJpl75ShMTlPMxHdVIFYV9dh/auVK82xlcgI1FFa+IirRJTidbaXaihHhKKuDv6zJj56PzQvrNbLRZk1VvOjKDRTRjZl68aSxUnIkidbM5mAFRKP5/XtITTO+I4HhH3SCQonnBWEpnzNCFPF3hx0ietseolpw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 55af04df-6c19-4437-ad14-08d9adc013ff
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 13:57:53.3900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3762
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 13:57:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158569

I have sort of a general question regarding this patch series.

Last time I checked (and yeah it's been a while back) systemd-analyze 
wasn't self-containing, meaning it would have to have a running systemd 
process and at least a running dbus iirc.

Is that still the case?
If yes, how should that work here?
Do we want to spawn a systemd per workspace/SDK?
What about the weird setting that systemd somehow requires us to assign 
PID 1 to it?
What about systems that have already a systemd instance running - and 
what about the systems that don't?

And if not (and all of sudden systemd project finally decided to 
recognize the cross-compile use case), does this only apply to 
systemd-analyze?

I would be happy if you could shed some light on these questions. Thx

On 19.11.21 12:34, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> The useradd class is a no-op in the nativesdk case, so chown will fail.
> Skip them.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: use "${PN}" = "${BPN}" as suggested by reviewers
> 
>   meta/recipes-core/systemd/systemd_249.5.bb | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
> index 8bdc0ca028..2df2de0cf3 100644
> --- a/meta/recipes-core/systemd/systemd_249.5.bb
> +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> @@ -275,7 +275,10 @@ do_install() {
>   		# which is expected to be empty.
>   		rm -rf ${D}${localstatedir}/log
>   	else
> -		chown root:systemd-journal ${D}${localstatedir}/log/journal
> +		# The useradd class is a no-op in the nativesdk case, so chown will fail
> +		if [ "${PN}" = "${BPN}" ]; then
> +			chown root:systemd-journal ${D}${localstatedir}/log/journal
> +		fi
>   
>   		# journal-remote creates this at start
>   		rm -rf ${D}${localstatedir}/log/journal/remote
> @@ -319,7 +322,10 @@ do_install() {
>   	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
>   		if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
>   			chmod 700 ${D}${datadir}/polkit-1/rules.d
> -			chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> +			# The useradd class is a no-op in the nativesdk case, so chown will fail
> +			if [ "${PN}" = "${BPN}" ]; then
> +				chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> +			fi
>   		fi
>   	fi
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158507): https://lists.openembedded.org/g/openembedded-core/message/158507
> Mute This Topic: https://lists.openembedded.org/mt/87165491/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

