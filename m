Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F793C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 11:55:03 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.92])
 by mx.groups.io with SMTP id smtpd.web09.21494.1633262100990019741
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 04:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=J6Ud4z58;
 spf=pass (domain: outlook.com, ip: 40.92.90.92,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzZxYRzgPQSoWfN8QOd3/kuKAxv+LHo+I+b5TWd70yxOMlLtkgz6lg+EFR9av8PI+DsxIKyG1TirPssTeSiAtmfjwDPw9OE3UhUKu1+pcaTZZXmve/VpassFOpFgI3dkWdQtgcT+4q0PQXl/02f0BUirXOvYsTI/AhMrf8eiXIampI6FVjswlokokKw99wDMqxOwlGUpp6ksyzYfq6hD+UemBTrbfpbZ2+0BhSfwnlb8xDQ5H8LlgIKS0r1LIARb+EroNts0gMIDQiNTzg0Y5ZXK4gNZzG5n+I2TR++CcELR5R8qDK8WkFIev4D8g3GyyvCyEfvvmHHwGfRA7xXvyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjSRsIHm371b4ZKr5uvis8qNJxIKnB2m8Psc16TPliw=;
 b=VHUvrk+6DtnvJ70gs1TZjEn3oSPtiRZh5EbhCpQKXuXn/fz4cSVo5qqSO6wZNzfAne2JGdTY8quuwf20YqqO1y2Gvk9Kp8ux7LhVA0C/5LWyEz6CNKSfH4N2jCCKYK4SWTCuWAI1tagPRQIw0l8G/DCvfnoH3G5qyZGXsw7Hk14JHh09dhOdMqhawL3VArU0GMZ1b0ZuO1L46V6SCt0eG4WS2nuKqKyy5qsLEpx1KHi646sx92u5lNfKSLfXw03ZcIJ8CE3hvccw6wFdC3sFgKt/80iKtGWZAjO54y9GguEUqJ5Nw0rhpyl12yOInZLE3WUqj9pIiKKnncG3o1tA7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjSRsIHm371b4ZKr5uvis8qNJxIKnB2m8Psc16TPliw=;
 b=J6Ud4z58eJZklYyL3bsPMaFfeBbCXsQqKkGYpJmZtr35GQMLLPG2IJ+rdL+2ZGBctm2pJiFxwnbyPs8KmTvw08JdXHIScGJ98zjXhwqKn2Owe9X+ymBN0smnyJfsWPiS0S/dMY5Jf02nGM0lrhkjBrpX0o5l9xo7ZFzZ12a2JvM/QjMseLJhBVqFved208QdW52a5msRf7BxW+Nrnl/sQLHWEkgCmyDMeDCoxKOjybf+YtkSxyaqeADKzAFu2yQveYOtZwFDJb13Oq+VmyH7BwmpweFFiesWRnM+1/WN7CDDAwq6kEq8EsOgnT7LVdCU01tM4T00WqOWk6nROaWfhw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3988.eurprd09.prod.outlook.com (2603:10a6:208:193::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Sun, 3 Oct
 2021 11:54:58 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4566.022; Sun, 3 Oct 2021
 11:54:58 +0000
Subject: Re: [OE-core] [PATCH v4] patch.bbclass: when the patch fails show
 more info on the fatal error
To: Jose Quaresma <quaresma.jose@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: foss@0leil.net
References: <20211003111403.334046-1-quaresma.jose@gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642587EE369115CA92B40A0A8AD9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sun, 3 Oct 2021 13:54:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211003111403.334046-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [nCOHoRvycU+9MymdrYZy+4L0deCeIl8B]
X-ClientProxiedBy: AM4PR0302CA0018.eurprd03.prod.outlook.com
 (2603:10a6:205:2::31) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <27462917-b00b-9ab3-ec22-4df5ce91d067@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.43.125] (46.114.37.32) by
 AM4PR0302CA0018.eurprd03.prod.outlook.com (2603:10a6:205:2::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Sun, 3 Oct 2021 11:54:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7cfe96c-6b81-4ae6-8edf-08d986649f64
X-MS-TrafficTypeDiagnostic: AM0PR09MB3988:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pyaiCfbiG/V7K/Kl9YHRA7Fyirl/D0S2yIBOdapZLnlmhBhOGGDjg/bScBRzT55VzGlgVmKK9wn92gsVkcJZeXRoiFYMFkaODC4EVGq8MLnSQT2qgDANAiMCOo8TRRRe8IY8arnecGuDgNgO+fXnO9EA7XZctHQu5CCVyZtSbV6mL8TbPQN7Wicoahjfkj7wc9N4qxzoXDlAVJhqUq6wKGViljQyMk6TEUsoMRihEvnf7P50Xe0D4FyrBboyVnlgVPEzHj8gN7WjLyL+SL6E1cuog3IiHj75qQdMIYzN36MTRfVtvF0Lmm5PaWli3SXhiKbxPwJKLYL1mGbfVBO5I7GDSeeJXGL0Yf9P8sWEqkL3oeIQ57l4o6aCSIY/0ewRp6diZVkoY1J6e1XhaDTxmJpuRqQ9gk6G8UJCnlDu/oapGGknbst6YZynw6PRoG2f2mEcENP2xDOIs7iWxZUDmwuPEriy4xsSVXFUGulvOzRH6ZmVUgoKpVHqMHNXQAPr80wgcDCSdkBsmDdhNzV/Fw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sO2PNYcVEvthoXZB++UZSfHfB0fAiqnlgVqUaH+liFR4g7DBdYEg4IHJdZYXZxNwUiKJbvyeJNtAQSpkQtVJlNrqOGLgrBzu7SfcojYP+hw6dsRR9Tev0xI+z0zVtF9MfA5ZOtcWZs60q9xwkiO17Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7cfe96c-6b81-4ae6-8edf-08d986649f64
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2021 11:54:58.1850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3988
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 11:55:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156550



On 03.10.21 13:14, Jose Quaresma wrote:
> There are situration when the user have the 'patchdir' defined
> as a parameter on SRC_URI. However he doesn't know with this,
> the patch is applied relatively to the receipe source dir 'S'.
> 
> When user have 'patchdir' defined check if this directory exist.
> If the patch fails show addition info to the user:
>   * Import: show the striplevel
>   * Resolver: show the expanded 'patchdir' to the user.
> 
> On the next example, the patch is applied on ${WORKDIR}/contrib.

Nice patch, that will turn really helpful, thanks for that one

> 
> S = "${WORKDIR}/git"
> SRCREV_FORMAT = "opencv_contrib"
> SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
>             git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
>             file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=../contrib \
>             "
> 
> But if the user specifies a path on 'patchdir' that don't exist,
> (patchdir=../no-found-on-file-system) the patch will fail and there
> are no message that indicates the real cause.
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>   meta/classes/patch.bbclass | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index 388773a237..30753dc65b 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -131,6 +131,9 @@ python patch_do_patch() {
>               patchdir = parm["patchdir"]
>               if not os.path.isabs(patchdir):
>                   patchdir = os.path.join(s, patchdir)
> +            if not os.path.isdir(patchdir):
> +                bb.fatal("Patch target source directory '%s' not found, 'patchdir' is incorrect in '%s'" %
> +                    (patchdir, parm['patchname']))
>           else:
>               patchdir = s
>   
> @@ -147,11 +150,13 @@ python patch_do_patch() {
>               patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
>           except Exception as exc:
>               bb.utils.remove(process_tmpdir, True)
> +            bb.fatal("Import patch '%s' with striplevel '%s'" % (parm['patchname'], parm['striplevel']))
>               bb.fatal(str(exc))

I'm not a 100% sure about consecutive bb.fatal calls. To my 
understanding each of the calls will raise a BBHandledException, which 
is caught at toplevel and leading to sys.exit - so a bb.fatal after a 
bb.fatal is likely dead code, as it will be never called.

But I might be wrong here - looking for more insights from the bitbake 
experts


>           try:
>               resolver.Resolve()
>           except bb.BBHandledException as e:
>               bb.utils.remove(process_tmpdir, True)
> +            bb.fatal("Resolve patch '%s' on target directory '%s'" % (parm['patchname'], patchdir))
>               bb.fatal(str(e))
>   
>       bb.utils.remove(process_tmpdir, True)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156549): https://lists.openembedded.org/g/openembedded-core/message/156549
> Mute This Topic: https://lists.openembedded.org/mt/86039997/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

