Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D73C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 09:09:04 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.55])
 by mx.groups.io with SMTP id smtpd.web08.3979.1650964139452826119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 02:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=QFo80TGV;
 spf=pass (domain: topicproducts.com, ip: 40.107.8.55,
 mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hGG1MiDwYSKUq0j7Lctns/hrq3fLvaz38DivmU7dxY=;
 b=QFo80TGVP1/VBb8c2Fz5effELHjs/LvIhJt9n85YKCxIJW0couOkEio1LCaM+GaatatMRFSvNzS4Ckbv9v8G9LdK8+oHhvKAhm++0Y0bf41z5ocZfHJ8vBZen9umXvJPdD5DJ/TEstJSxtLyLNpiWs1CqujfqYJ1GHAsb7QvS11q7R5An0RxvsV3hbIMmEAJGZYc6eJCf7Go2/jVkLXYSQKaHrr+S7nDK5DpgIxihIAyPp+EJau3r9ZsnDf9d9mx/dlZvwV7vrm6fbW8MKfgmZpQNB7v/hCHMKNOXJo3ktKwDuCOlUX9PH4gIDcZTzaBpWY0fGI1kvYGUUnNmy8Ubg==
Received: from AS9PR06CA0040.eurprd06.prod.outlook.com (2603:10a6:20b:463::23)
 by VI1PR04MB4767.eurprd04.prod.outlook.com (2603:10a6:803:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 09:08:53 +0000
Received: from VE1EUR01FT040.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::9b) by AS9PR06CA0040.outlook.office365.com
 (2603:10a6:20b:463::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Tue, 26 Apr 2022 09:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topicproducts.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 VE1EUR01FT040.mail.protection.outlook.com (10.152.3.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 09:08:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.52) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 26 Apr 2022 09:08:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmo7JTgP3mYEodonqF5D5AaiR9m+iEWQd7vvhsgtqYk7T4CG9MMn/xSCFbFa+4YXsY9fZEMsgQAwZZ+a+YjXXlVNqV6mn7LVsRJ24uVB9HkWr+eR5f47V5iaoV8OGFLZY0iTUSmXxeX3gfOecR3h8ej3RoZ1auKHDq0vKTV/tP+aKIufvzy5ghGvGK6wre+fxVBWlt+ffmTZ4iuL9UfC5+NkusbP3Jo8QpkoL82OJBlxAMp3OUDsWFprDA5gqXsUIwAn6ym9ziWg+vmMtyaOl0mTty1aZW3zLzRHcdX5mPRqxyFa6iKOyzeUqLQn/Hh/E5qUqndvopk5RzdVtDDEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zE3Z7AVWu3FnYa/IsmUZjKPL6pSTCTc2D9oxpNqXqBU=;
 b=ShzICPPmtfYOcT5V4iHGhR5IjYM7022KXuAi9eYlYBBKmqF+CGcf6mLJY3Dnp2WmjkoscELsEDTE3HAHa2OnO2Sgxt879QM212ofvhjt5/vTmsb4y+fgiETU4z2o8p8zeXIume281ws3j5rm0BppfFyQU02Ti4HOHF7aNKUxl2I/pzOMxAO7LjKtlFoGIiIg3iFWprU0LKIQBHxmGIBLsdJ7xzume+AR6WNhpAZ7yqBhJyezgAz7rRJJoZ+MkP1CwaezwkAyUdod5Wi9uYE/DN4O8iMi1aJ0ZyGsGf8JePI8Hy1f+enz9SuqJeb1EdD8X74+3srw+iT3fUkcXH2Qew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by VI1PR04MB4128.eurprd04.prod.outlook.com (2603:10a6:803:45::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 09:08:50 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::a161:7ac9:1e16:174a]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::a161:7ac9:1e16:174a%3]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 09:08:50 +0000
Message-ID: <70d61f68-8a56-86fa-5772-598628219797@topic.nl>
Date: Tue, 26 Apr 2022 11:08:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] Git and pseudo
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6812ddf4-d065-4e4e-ad42-c48d1bca155d@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.65eda1d8-3d07-4fbe-a1d1-669c533cd0a5@emailsignatures365.codetwo.com>
 <ef4b958c-8310-4b40-f671-779558228550@topic.nl>
 <749f33fad354821ee5e1b9f061aae211c252b934.camel@linuxfoundation.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
In-Reply-To: 
 <749f33fad354821ee5e1b9f061aae211c252b934.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0165.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::32) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 33bf5df8-4c87-47f8-6576-08da27646296
X-MS-TrafficTypeDiagnostic: 
	VI1PR04MB4128:EE_|VE1EUR01FT040:EE_|VI1PR04MB4767:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR04MB47670FC9249FC0838D6C634396FB9@VI1PR04MB4767.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5QN0gD3RntDQcvkHlsrZLwG2lfEwSMhgjQO+xBBluV7C5vkVQcY4z/CTXL0MAQqha4GY4r3YvnMpOvmSWriuCXv6OkpJLOC13fUqgdrIYmSLI49iCGrzt+kH7SSRPtV7Ule4gY5ESmJB66h1Vnvr+cMfO6l6oAwxteQJyXL/IOO+tXufXgJUiX0zrHo43XnHHs5sevFLxzWhms0PvPUWZF4LRpkmEQ8DZnqAd3gb6u92Mu5bf5+AlIPqksKDZ37Jowwf5vZJNlf3/SY6xgSo7iQI2ycx/C5cKFpvUzioKg7FkReHd9vmi4NLKoEKqsqw4ytd1LIc710drHOB3nInevIPnkO2KMidqVKqcgvjWoIlvBjxGg5J9dHWQQaAgSGULAfcs3Fjpxxp+Ci8gyhE1SOGHXk7u3BNZDNPfmYyfxg75HslVa33I52wYp6IgJmWm7V62I2Td0QXEEn8p8zc3PDZEtVMwvIECvJefLBEuRL/KWXErj1t9e8asKEwjvSSmJuF2eqo5omrFj5XfUAA+rjTQ/sdRh/7ZLIK4JzlkE4KxBrMS2tIjiFVHnFwhIfl7Nh3rA5cZ0yLF0gktf1NzIdztXzvv4Q2K9UX6+qibZ3KwahNJ/RSUoF5sa1g/MdGjOBE5Nt66oxIcVPvmOymiAlrZmN7qd/r2t1NnXtfXdxp2ZYY5IQd0zfs8na7zMx/3Ce4X8s+d7KPuwu4WHwizJHzuUSHpXb1ChKz1kWg4BiCSgK4v8zq+/chFMQgETUfe/LpA6cxO+sFMzQZ32Xukpalhs1FV7peCY888iWUMWMbrKcAabKNMg8T5SJRQiJNjjTpV9U931y7qjrjBD/cQkxn938s8j+xxj0eOtXViNM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(136003)(366004)(346002)(39840400004)(376002)(396003)(8936002)(66946007)(26005)(6506007)(31696002)(316002)(66556008)(6512007)(83170400001)(36756003)(44832011)(966005)(6486002)(66476007)(8676002)(5660300002)(508600001)(2906002)(31686004)(186003)(42882007)(38350700002)(38100700002)(83380400001)(2616005)(52116002)(53546011)(36916002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4128
X-CodeTwo-MessageID: 
 49294d3f-b4da-4c82-a552-5408feb5f4e5.20220426090851@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR01FT040.eop-EUR01.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a00baabf-4c67-46a7-6f9c-08da276460ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nJkpYWjRdbPvYwA9W0bZTmP+Lbrqu8Ni62c6P56bothOxg9w4gnGHBpy6BvFPR+8RfZZGSDN5roordRZbE4I/4unzpUT+lfiacsBw7DJJW+IpW5ppv3XdL5o4zIUKDWuhT5RkP42mXvEk2uDyusDlNCP9eA6+UhDGMU4o7cAVNjAxMnbbNIvtxULLXhg3DjASPhKxW3PXUpqvr8rJekFdQZpbzsZDvaJDQmppp0vsoLslemN8LHFlthMNx5K160dQWpBDcwVaH2fK51VH32qSfnrTcd6syveslmWHufRyaUXVI5uKXS8PuHEEQgS9iV3vWq+HsvY58rbxnvqEiGcr0LOE/mQpizI+Ytz2gVuH/hzDkET4l2J07Fe6YJkhCVVVliLuJzIsywLBXusL07RAIbAhM2JuvuO54/yxi5hBgoHBYI/0+BrG/AG6PH6yDmRQubt5UxVYAWehXoRprZ5aRu7RmTALSf16NRbyOLxEok/8PEL9SIbQtjgvYobN64h9Gis+iRLSRWVvQ3/7hd6e2h64xU6nfnVz4zaQLWYyyRYohCL/o8yCv92cUvb8832HcJ4OIWSV7VfNi3SbRGQUKgdNofBRrg7cLdTU1WaZFk8kGAg6QUUFiobX5ca5/K0jfsWlEFc3gM8cEQQ83XIGmTddjerjjhTylW+PR9ylhfXwBGoqAWv2vnYpfCQ1MFkrtaUoWHlCRVlRL6CzhoAY4wD3B8bDL5MT0XgHl28Mj679KyW0a3p8swBojDMcmg9N/erwgssjIQBeerhz7L7i0qhquXzzD5NfKf0kTO9ZI4=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230001)(4636009)(39840400004)(396003)(136003)(346002)(376002)(36840700001)(46966006)(31696002)(186003)(83170400001)(336012)(26005)(5660300002)(82310400005)(31686004)(36860700001)(316002)(36756003)(40480700001)(15974865002)(44832011)(966005)(70206006)(8676002)(70586007)(42882007)(47076005)(8936002)(7596003)(7636003)(2616005)(53546011)(36916002)(6512007)(2906002)(508600001)(83380400001)(6486002)(6506007)(356005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 09:08:52.9645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33bf5df8-4c87-47f8-6576-08da27646296
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT040.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 09:09:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164864


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 25-04-2022 14:51, Richard Purdie wrote:
> On Mon, 2022-04-25 at 09:40 +0200, Mike Looijmans wrote:
>> Recently GIT got updated with a security fix:
>>
>> https://github.blog/2022-04-12-git-security-vulnerability-announced/
>>
>>
>> The problem is that this causes all "git" tasks that run within pseudo
>> (most noticably, image recipes) to fail. In many repositories, we use:
>> git rev-parse --verify HEAD > /etc/revision
>>
>> Or something similar to that. After the GIT update, this now fails with
>> an error like:
>>
>> '''
>> fatal: unsafe repository ('/home/mike/repository/path' is owned by
>> someone else)
>> To add an exception for this directory, call:
>>
>>   =C2=A0=C2=A0 =C2=A0git config --global --add safe.directory /home/mike=
/repository/path
>> '''
>>
>> Apart from doing as it says, or even "git config --global --add
>> safe.directory '*'" anyone have a better idea, especially one that
>> prevents the system thinking I'm someone else (root in the case of pseud=
o).
> https://git.yoctoproject.org/poky/commit/?id=3D21559199516a31c7635c5f2d87=
4eaa4a92fff0e5
>
> However this isn't quite enough as some things encode the path to git int=
o build
> files so the PATH change at do_install isn't enough. igt-gpu-tools via me=
son in
> OE-Core is an example.
>
> Cheers,
>
> Richard
>
Nice, also for general usefulness.


For our particular case, I came up with this (works in old OE versions=20
as well), just inserting a task since both do_image and do_rootfs run=20
under fakeroot:

 =C2=A0# We require access to the git repository here, so we must run outsi=
de=20
fakeroot
do_swumetadata() {
 =C2=A0=C2=A0 # Hardware revision for SWUpdate
 =C2=A0=C2=A0 echo "${SWU_BOARD_HWREVISION}" > ${IMAGE_ROOTFS}${sysconfdir}=
/hwrevision
 =C2=A0=C2=A0 v=3D`git rev-parse --verify HEAD`
 =C2=A0=C2=A0 echo $v > ${IMAGE_ROOTFS}${sysconfdir}/swrevision
 =C2=A0=C2=A0 echo $v > ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}.swrevision
}
addtask do_swumetadata before do_image after do_rootfs



--=20
Mike Looijmans


