Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.87])
 by mx.groups.io with SMTP id smtpd.web12.2729.1586205384491939031
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 13:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=WaiuiLWh;
 spf=pass (domain: xevo.com, ip: 40.107.69.87, mailfrom: jbroadus@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rgs+/xXT4AahjBU4znhf1PsKZG5p9GdX0Hp2vbFg3dJcSJVkR6UTlUXZGZt7yjhja6ARwERAYPUcHJqKnYlV9KlCFPwtCC641LK4+IK7nC5RL0wa5RB+7KV1mMXROgIsDRNkngVEBDDp7fiHz7iId3cZcxEU3tj3fS+0GAWv3WrguKulmSE0/yMdgnrP5lmYokAyA4X78wxSH701BJOfOsa8UIfz39uZozjtR/jW3hJ3DQwTreyIl4mX6POrKtZn7WN1Hjb+cnl9WZFy8uH8oK8KQXkfrRUj0/Y2szAY+xjQThqCC8IfFvveL4RVMIYQJNrRa4ik6Yul6w0jTIevQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajwKHL9jsceGBChLcfNTA+aF5YDK+g6I0BqBfYYDPhg=;
 b=b1cCRDNl96LXtq7pxfPioFR9lpkbC3RLADKXiz8OM7zetDfGa93oJ7A+pq/6wiNqQchlueORmESwhsDw8Qpt20NfaRoVEofO3DI55FH75u5sVvxRzC5rujBBkJYz1NuDxbfr/uuei/Jb+TikW4j/qWPCJKzEyiP6XmmEVcm6NboL1nV8Gu6aBO3Hd1i0cuP7IgjumGgyrWj5z54jYSpRpVzx2teQOgTBewSJzQnctWjlLJnhIACBDBjkxJQdAUFAlZHPFMQojtCiYF7FFYbRbAmiLjxWSr2gAOR+NGpyXUrQJ7r8j1kHltCaC24A4AQQkRKb8hN9hz7ZzCDkWr4vWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajwKHL9jsceGBChLcfNTA+aF5YDK+g6I0BqBfYYDPhg=;
 b=WaiuiLWhB6VUmBWnOlTjd2zwH9bO4E25NSRS2Yk2t+aOkWYYGdQx7lKS6ZxHGxhooYmnUxgUAoOPXpxmfgnw+qP/0pz8NJHJBfcy3BGb5PuLBmCa/dYLjWrC3pV/Sl9dTv+om9usd/gXdz5gURaZl9Yn2wm/OC4G6sgOmTudyeU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jbroadus@xevo.com; 
Received: from MW2PR18MB2188.namprd18.prod.outlook.com (2603:10b6:907:d::31)
 by MW2PR18MB2169.namprd18.prod.outlook.com (2603:10b6:907:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Mon, 6 Apr
 2020 20:35:45 +0000
Received: from MW2PR18MB2188.namprd18.prod.outlook.com
 ([fe80::152e:c63c:5575:6586]) by MW2PR18MB2188.namprd18.prod.outlook.com
 ([fe80::152e:c63c:5575:6586%7]) with mapi id 15.20.2878.021; Mon, 6 Apr 2020
 20:35:45 +0000
Subject: Re: [OE-core][PATCH] curl: allow configuration of default CA bundle location
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Jim Broadus <jbroadus@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200406060014.78150-1-jbroadus@xevo.com>
 <3d20f00ac2d4f54f6bf4e67998df400548f0bfeb.camel@linuxfoundation.org>
From: jbroadus@xevo.com
Message-ID: <ee3a15cb-afde-3b3f-59be-9c279313927c@xevo.com>
Date: Mon, 6 Apr 2020 13:35:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <3d20f00ac2d4f54f6bf4e67998df400548f0bfeb.camel@linuxfoundation.org>
X-ClientProxiedBy: CO2PR07CA0049.namprd07.prod.outlook.com (2603:10b6:100::17)
 To MW2PR18MB2188.namprd18.prod.outlook.com (2603:10b6:907:d::31)
Return-Path: jbroadus@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.150] (73.169.153.56) by CO2PR07CA0049.namprd07.prod.outlook.com (2603:10b6:100::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16 via Frontend Transport; Mon, 6 Apr 2020 20:35:44 +0000
X-Originating-IP: [73.169.153.56]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b27fe82-3b4e-487d-1f1f-08d7da6a14d2
X-MS-TrafficTypeDiagnostic: MW2PR18MB2169:
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2169A93D3809237A6F750B6AA7C20@MW2PR18MB2169.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0365C0E14B
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR18MB2188.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(136003)(366004)(39840400004)(346002)(396003)(376002)(110136005)(16576012)(478600001)(66946007)(66476007)(53546011)(81166006)(316002)(52116002)(2906002)(31686004)(31696002)(66556008)(86362001)(26005)(6486002)(5660300002)(186003)(16526019)(2616005)(81156014)(8676002)(36756003)(8936002)(956004)(4744005);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CxSybYnnfidOUvDnrTmnj7OP1GHAAwWKMjpYfUvhuli5lwC58+l4MxFsk9b2U1kz0tD2pSrKntDXvgjNG3XRiO58YVhmSGAhgM4qDGioxYtzQE6LDbmeC28mImljZXz5QuGMxbklqnGO/Lu6yywrNUTmyi1iLD6NtT4fBoc/sygJu2C5Q5dntj0WaGT41Adpi1ftI46RdgP6jcKLnH0zGeXatbDgzFf3onnnM5f3cgE9HuHMsmHJw54GCR5JCgMIzXbQwlZaX5CoUAVdaMTXXxMcyG/mOqMp/7PqaQx8PdpoR/SDW9aOU5xCzrG/DuFfT/1NoCHMkqmxoT4gcjm2fdm9KZH5Q5Rf1WrPzEAObZljMTbHtBxXNTzlSyks71dTDPGzRsPd4cUy8LWA1Nr50dZvuFAzeGnwbg/dZYqXLZYR+HpYWQ7/cAGNzTWoIM5/
X-MS-Exchange-AntiSpam-MessageData: 
	di16rge2QkjanD2OvGPPCw/5xnr+xFh0Dk/w5v9JqF+b8pSTMwAk7+v+xfT48TUkRCaK6ytIe9pzCXAOr41fu8iW4g9OoE7hFqdQ/D57UhoUpsEDlmynl1jFzDYhwTswwHwlCjSMk0IrpL0aCK130A==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b27fe82-3b4e-487d-1f1f-08d7da6a14d2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2020 20:35:44.8447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZifdH1OW2X7XwSyyJ3qVmWxpaybY7lQd8l8RXG6cJiNxgiQXnqzonj9PBr7FsPbkT7sFQ72hZRFcUafM+7Rzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2169
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/6/20 5:00 AM, Richard Purdie wrote:
> On Sun, 2020-04-05 at 23:00 -0700, Jim Broadus wrote:
>> Add a CA_BUNDLE variable to set the built-in CA bundle location. By default,
>> don't set anything for curl-native since that target's sysconfdir is a
>> location in the recipe's native sysroot directory.
>>
>> Signed-off-by: Jim Broadus <jbroadus@xevo.com>
> 
> That is a huge change in behaviour with potentially quite serious side
> effects. As far as I remember we deliberately make our native utils
> self contained rather than relying on the host system (which may or may
> not have cert files).
> 
> We point at sysconfdir in the native case since we install ca-
> certificates there if I remember correctly?
> 
> Cheers,
> 
> Richard
> 

Hi Richard. Currently, I don't see the certs installed in the native 
sysroot, so maybe this was broken recently. If that was the intended 
behavior, I can look for a fix for that instead.

Thanks,
Jim

