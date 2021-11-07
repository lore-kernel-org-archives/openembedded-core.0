Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A908C433F5
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 15:59:12 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.61])
 by mx.groups.io with SMTP id smtpd.web08.32775.1636300750528030758
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 07:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=MElfrf8X;
 spf=pass (domain: outlook.com, ip: 40.92.65.61,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCfzyT/uZpQuwXejwHtOMJHuw3XhfeYWArMesiGTHqY2XOgIVHFo4DMn4DiGl62vpGKCUBdO9uuQ4LyP0+jjon3GSCP/WQrGBNPNbtk47sPS+nOSY5iZcstQoiIj3qC2eUZRoGoHRVTvpmPYpvMrLegj/498hE74OM6eStjxMO6mZRxD8Dyw4tKrVFMfJx2k7b4Dms3rhHQFaYezYRKrXxKEvUQyHQu6q8vDpU8Motihj9/ganeVXl2gDWCTeqObI/0XxFuu23VLoFo8wtEx1xM7MJo5B7EfwmM8PWZrmvW1MrlfqKa7HEMxPZsVXIzxJqy5tqzGTadIhpKbmi27eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQpcVJAi/vJylVLL5VPOINNoi8oYaaEiX2r3jIynNrE=;
 b=jji+LuP1cgMSREwEooddqobC6NiISF8S07h0YJLsJ7XU+bUxBL5o3TDTUMZTYcxgTY0jsj9C+VkGOnOYWnt4nFm+NW3jsXBgL+VmG6uvD0GjRdgNPKWdaGtvls8aOJLCeS2id1aCt0ILhPl0lAw4bh3IPLpsZvwxf3YIUEJKjkAShOv5Ce43wAG7sgsOsCdZpvPlVP5htheheAW6FRgFD7Oj7vc2LMy+5C4uBEw1PgYf8gzQWvTND1/yC8UMixvyALCwZGP70/HpemzDVBans0hq42am5tNgQJuyS+BCPlQxBapIUbDZvtakM0laU8oVS6xptBZ2Kb9O7JDqY6GIAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQpcVJAi/vJylVLL5VPOINNoi8oYaaEiX2r3jIynNrE=;
 b=MElfrf8XE4S9g/bHdVXxSj7PCGML12qpmILQ1ShQFIYJBx2PzrMnBAVs5r3vKu0o4GaBL8mz3XqVGtqe8WNyx/TYn2FaZMIFXW/l/74a24R2GnYDgZtEDWWYLtkLEsGz2qlSIEfHGxi+mauM+btbj+ML6ZTgJqY+QrGuq+H8OPK9brlglyCFhcribTrqpWgKFalSbFyWl6L3K4y4HXYrU2kq9EV3lFyXLUUIySPW9WS9uEFpJLNK478ns/EI1pn2jjJ4yNu37LyZiY8mEHzs0STMFKbqWOcTx02CNQCs0HuiBH1JVvbb6BwzjJL+DhYicSiYIdFxL208XbpVZLxVNg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4499.eurprd09.prod.outlook.com (2603:10a6:208:17d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Sun, 7 Nov
 2021 15:59:08 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4669.016; Sun, 7 Nov 2021
 15:59:08 +0000
To: openembedded-core@lists.openembedded.org
From: Konrad Weihmann <kweihmann@outlook.com>
Subject: Setting COMPATIBLE_MACHINE in nativesdk only recipe
Message-ID: 
 <AM9PR09MB4642DA0CD2B546B22CBFE911A8909@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sun, 7 Nov 2021 16:59:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [Qn316t/6cHoRApoYVGerlt0l/CjGVxOCno1cbCYodMpoyw8eEXRiRBwLaWMnqFTo]
X-ClientProxiedBy: AM0PR03CA0057.eurprd03.prod.outlook.com (2603:10a6:208::34)
 To AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <915f3365-22e5-0702-63d2-28fa78dcf8b2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM0PR03CA0057.eurprd03.prod.outlook.com (2603:10a6:208::34) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Sun, 7 Nov 2021 15:59:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cd9a610-097a-4cfb-0f11-08d9a20787ce
X-MS-TrafficTypeDiagnostic: AM0PR09MB4499:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5rUCaw7JvFQ6oazfv1S8z5oAICXvi8VMszVXxV8uVyVH9NRoSfnz4LYbw3lqt1FPJcymBJgd/crbAlpDqg7V5YuRKA2FqmFq1AVn2JCv5q8KOtY5NRpq+UgmYr+H5J228SC3fel3EvRfdQpsMY3ObfD7nn9wYrjuhNIm6y+pymrNDNnmc5EspyPCNzdKpF0es/c9Aeo7BtIcmDnCTiQ6OxPh5/RQPLScEHv1r2r21tn2uF4nysOBqjZy9llpRwC/cQ6cyG8yL6LSMUcN8RrJkB4/sPvh4ifaYyg2QxCK1a3Usnn0U3xNDLq1S4RViB2kE/Xo/M5CKQdhP7miHeBzj9fgb3IXKMQML57fd0eXfEO6r2rdCar3t4VQiuP0seXOztKiCmQREWVj2P7RyZdavba+iPYPnXQyllaLCwFpZs3/kCFEq5EO+QJglmwmlrbyAS9/FnMlrohwIYxB5HcsA+zgDcNm71SXq4me3juk+uhg6ecY+2c96VYt6J3nz7JOL66BJDfehxPei0TlTD8Bp0Jb2cAtVLCq7NpH7VUdy8Y=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+kgWGV2uCzBooztRIF8bBRHxh93R8avafuI1AkXLtmP0/4AqiBw3GTxcDfpcigQf4Q+0XfgGks22eCSDNnwu7DZOzL8qd+YQgKqwQMc2fuXLwoiZfVIuaMfiixT2daGLnJ2S8L8lDu1zxNllpEB3X4QrzeSRv7FO4N8fIe2o8qBPORlC45x4+OuR7MIogb0NHe8uQSMIf9ybfnhGBo4PufZMRQ4uHTR96sOWtp9xVH+NlD0ipTdFpRQiuFWDpZZ0V0wqMqRsXs+k1LqHtEivDfatlQw7L1vSclA74s9+p21ckSuhTPokTmqxRu9gL0In5/hm7MnqWONk+DgpjFe91IFKvgOnYdXS3i9msne98KiW1VgBXxA7cQDDJG0OcHlzFW9eTJ9P7p3pHFE5eryKSMDnYhl8OxZNFcphiIQ5+xoWfEpvD21DOaWs1S0TBWX8MQcz/2lTM4aKhqOvcw+lE73MgjRz4jEpvU9kISvZnMJ5o//Xl9OOOUQyEosAKqKatHGZXi6d2MbGIAmevjiHebhn1Ephuz8N6H41Tx7eSBifw0k7KCzEi1Ew4RdhVkNWiy7O2rqJbiMNCd0ZpXMHU2cBZqzeRA3IfLisX07On5DSaoC0G9TCXyMqKFoNmwThgGPBlK6yOXnmRhM+NksmUqI4j1pdIxi5mJAwO4pVvtVV2twhsmljCnONSwAGc1qhOWWVa+Hj6MS0IEOOXM2Z+JiDSlsL2avMCR3DhkoYjMeB385aoltB9fA4GUvjvDRHnooMZ9cHHsghiigqKzr6ew==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1cd9a610-097a-4cfb-0f11-08d9a20787ce
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2021 15:59:07.9880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4499
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Nov 2021 15:59:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157953

Hi all,

I got a nativesdk-only recipe

...
COMPATIBLE_MACHINE = "^.*x86-64"

inherit nativesdk
...

as I need to limit the targets (SDK hosts) to x64 machines only.

Unfortunately this doesn't build, as the recipe is rejected claiming 
"qemux86-64" is not in the comp-list

Looking at base.bbclass the following is done

need_machine = d.getVar('COMPATIBLE_MACHINE')
if need_machine and not d.getVar('PARSE_ALL_RECIPES', False):
     import re
     compat_machines = (d.getVar('MACHINEOVERRIDES') or "").split(":")
     for m in compat_machines:
         if re.match(need_machine, m):
             break

which is fine, but since d09e6d883042e5d094cd08d829327c4bbbfae135 (yeah 
it's been a while) all MACHINEOVERRIDES for nativesdk recipe are 
forcefully reset (reasoning is in the commit message).

Is there any way to limit the target machines for such a corner case?

Cheers
Konrad

