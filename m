Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C3DC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:02:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.66])
 by mx.groups.io with SMTP id smtpd.web08.10663.1639400563279807848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=ua86BeSN;
 spf=pass (domain: vaisala.com, ip: 40.107.6.66,
 mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYcZH84eBelZqbcaXvvebzOhAdrknUJYIqjr4d8cKsh97v37PkVWiYKVrnKz1RidqNOsy00XMkS3QXy8BN+MHQ6EJotbqefggPzhnD07Bn43IMotbuEv5hr87OU4bsnSd+KKtqZja9ERomQ7bJi/aOgiBxwlBd1faawPvn1alSh9AY8rSjCwAtIYwkZb8s62PKhHOFQv7uJ7bi0mKzD4GCaniG9M5mhGTMu/J+Sql5RsGXWZWu/m+ssKiXJ/WU/amII71eFlBaLa8nZ1CE4/GvmaqgLJrRH/Vk2IN8mAsixolAzLP12GpcLgP+rOk1vRGMmBkPrCAARZ2kK9Ev/V+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeZSl77lnaHalIjHTIpvrB6dfDnAkQCceTU2p17cJiY=;
 b=ggJEApPiBfqqzwne8aENdQQpbA/TCzpCp5lqb9kR59I64gmtkYKa8o9DwaaaOKd6MFw7s/WiS16t4qpPkfAAAfhzcT4+ju3Vr+aVWsxeC0Mm1voRZeb1A8cxModUEWyTpBLmxzFEHfGfxtFzVjAM0N4KMX76yOdjZ05DlZNEEOVT1qaWXmau3M8b7pCEQMEuyUvrXebi3lGLYNCdYM7kTkIkWKiDC4cEPFoAL6QIISHPA7IkxMzdpZrZ4eP1Kf9YPsQHWqTw3pFOJFJkBhatnXAY+uyQv3Z3c4RDMudxNbDkrPvb8Q98SF8WwS8jihCidGPTNN5Dp4b10kJH2a6BGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeZSl77lnaHalIjHTIpvrB6dfDnAkQCceTU2p17cJiY=;
 b=ua86BeSNN5YttHMELVKcaKsXNr/eF2uUHsjNF3+2GqG+AvXOiRpIcr+XYc/dwVfB/VsreVi1I3/nXg5BdjuaU0GYioQc/sqCotPQre60PMjdADBvDkhm67JPUorF7ltN++y/t52Z3YNnaVXVPB/AjziqY7jQU2sPtz1A/i9leEJwXpHJyd1U69aEQ78bjwHRG/B4Umeu9adSICcdfhRhFF6GYqAb++ms/IUV+eCUks4UqNRZu4OmrrVugtwTBdsiS6TXtmF3rZl1hKj+Wvp9f7NabzUGwlMVKuHy7DeZ42ySqynUsRi4aOyv7Gr0PejeC4r3NLHP0+sLgFI4WmuHMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB6PR0602MB3335.eurprd06.prod.outlook.com (2603:10a6:6:8::29)
 by DB9PR06MB7498.eurprd06.prod.outlook.com (2603:10a6:10:261::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 13:02:41 +0000
Received: from DB6PR0602MB3335.eurprd06.prod.outlook.com
 ([fe80::e4aa:27b9:d19d:ca96]) by DB6PR0602MB3335.eurprd06.prod.outlook.com
 ([fe80::e4aa:27b9:d19d:ca96%7]) with mapi id 15.20.4755.027; Mon, 13 Dec 2021
 13:02:41 +0000
Message-ID: <239c054bb94c0c986865ab0bea221973a2650f37.camel@vaisala.com>
Subject: Re: [OE-core][dunfell 16/18] cmake: FindGTest: Add target for gmock
 library
From: Eero Aaltonen <eero.aaltonen@vaisala.com>
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 "sakoman@gmail.com" <sakoman@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "martin@mko.dev"
 <martin@mko.dev>,  Daniel Baumgart <Daniel.Baumgart@iris-sensing.com>
Date: Mon, 13 Dec 2021 15:03:48 +0200
In-Reply-To: <0ec498ac13fa81c648f0f608abc6c3d867cd7808.camel@iris-sensing.com>
References: <cover.1638555254.git.steve@sakoman.com>
	 <80ab29b962cea17a4f2486ad25577bc830cdd8d9.1638555254.git.steve@sakoman.com>
	 <929bdc2257cb8de09bec15e256db812bd83df309.camel@iris-sensing.com>
	 <CAGDS+n=ouuL=LkeunPriDR8PfR6zRPCvfxQ3pwrvEXtfh46R+Q@mail.gmail.com>
	 <0ec498ac13fa81c648f0f608abc6c3d867cd7808.camel@iris-sensing.com>
Organization: Vaisala
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0106.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::21) To DB6PR0602MB3335.eurprd06.prod.outlook.com
 (2603:10a6:6:8::29)
MIME-Version: 1.0
Received: from hel-blackbird.corp.vaisala.com (193.143.230.131) by
 GV3P280CA0106.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 13:02:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30932891-30ae-4802-a544-08d9be38d89d
X-MS-TrafficTypeDiagnostic: DB9PR06MB7498:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR06MB74981BBD81C0C442BFF0D44EF5749@DB9PR06MB7498.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NrPUyOHhQrrSfOzpsdjpuPS+yJEXwPjYgpYcuH503Gqq1lf1Aj6qmZb+LLyxx6ZgPiOfAdrUkxUNt1hgQOgL5MhozJN4sUcyjJiZoZGYuwrEc1NpRdlxr3h+THM06URSoXfaxssUlxb60WKkMqiRuvQDy4o4sOD8O8oekutLzF50gqh6EGGi6CW4rQAVi9fuWDEtCP2kRNdVmwAX7D373YYVpKDUi1McQZMV8TMMryDGs3oogI2Ia2qiBQChlL1DmqxolXp60ew7uJqpfPyqQuH3R+VPaP/R2fIox9kfFyfGC8Zcu4nswy0DzfOgEzy7F2sjuEv4AjQARO4KN0Y5z7XkHdu4QHcfQqPiL19AkVqM0YZIRyt17/3/a6l/aJdvKLY0JV8M6Vnoa97czis4nqSCq5n8pHnKNtNwhHUMz0m6P7JiXIvMt+T1e7JNkNhUH7r+sQxDclNfXfdCYLKdxYWn7sr534I2d7WgeAgb0Dg36/3CpLEoMrhMbflcerxLZcWCrczOUdIkbyvCPS3wgqkduNcfTCLZk/JX31YvqBuJ7AK6gWhQRIUZmBy7HvpwXyc5D4YRJZ3IajiUyTeoPIy19NFDiTwrgPy4DRjAQuiQDJrpDqvUe9QUadWw5cIqCgyLQh/ixF57UjeYeiqlfgTVrmx2o3aPTGmojczsY/PiHTcPZL6sC8wmRruwuDuVTHGPxS13uQN16Jpx8DD5W1s/zVgi+L2tVNO2JhY8+zvimpPyfq6X7/YuJB1WuPAWJdhoHaCQsO5vk3JVTRTHxFXHlEolMoVV9bQeegNv4elOY1wOTvL2B0A3d5xKob5C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0602MB3335.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(186003)(66556008)(66946007)(966005)(6486002)(66476007)(36916002)(38100700002)(86362001)(8676002)(316002)(44832011)(4326008)(956004)(8936002)(54906003)(2616005)(110136005)(38350700002)(4001150100001)(508600001)(5660300002)(7696005)(52116002)(2906002)(36756003)(99106002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZllpR00xdERxR2dGMy91dUxPcGdhQlBzdWlHYjFpZFFlMFFrY3cvYmoxTlFK?=
 =?utf-8?B?bk9ZcnRZY3hRcThLUkRzdlZ0L2hPalRwcDVXMWRqV2NXNFAzYm01VjVURTFD?=
 =?utf-8?B?MlEwTmlma2JtcXJabVBjVFVZTjZyMjN3MWpKZWs5NXg1T293bWdZT2xtNFVm?=
 =?utf-8?B?L3QwZUFtTjczemZMR3I5bVdDaktEdCt1YmJGVkY4S1hZbHc3L1pMUnM5bzh6?=
 =?utf-8?B?TDNFWkYyYVhGVnB0YzdrU2RBWEdocGlzQXZxSUdCTmNKbnlBWnp3eU1Qb05n?=
 =?utf-8?B?d2hMM0IwWldRRUdzSW5lZXNxRUJSQi8xUzFOZGhNeXE1V2hvYUpCNmJVSHNB?=
 =?utf-8?B?M3VDM2RWS093OFBEOXNLRUFBZVlZTnZ6RTQyZmYxeHA5SUZYbWpSWGFnL1J1?=
 =?utf-8?B?cmdCS2c3S0lrVmxNWEl5aVErdlQxQmRmUkR2WktwOHdoVnVsRlRrTUpUWjlU?=
 =?utf-8?B?dFVIOVIvUUNndEhSRXhPSG9EL0x4akUzc1pzcmhlMTZLdjcwVmdqRndSSTlr?=
 =?utf-8?B?eU1DMWJyWXJVUktZMERqWHpyYkhyT0d3OHAySnA3N1JtUnZDbkxBZmkrMW5M?=
 =?utf-8?B?VElOZmZYcGozbkdVMVlQbFNQbzQ2a091VHJjT21OcEg2eXBGNVBlaWJjdnlG?=
 =?utf-8?B?ZmsyZFZOWHdYU1BaRlVCN0kxRlZOTXZzaW9ablV1czQwV3lwbGxTaFFNSnlo?=
 =?utf-8?B?TTltc2N3NGI4RVdKc1FSZ3hSVFVySWkra2ttZkdEbCtBeHAyQWlvbjFhOHBY?=
 =?utf-8?B?NHFhUEY3QW1kYmdRbmpRVnI1ZXRqN3VFTFNTRGhibHFISEt0V2Uzb0Z2OS8z?=
 =?utf-8?B?SHhTQ1lXWlZxMTVYWVRQR1lkRFBHOVYwVk9kb2E0UTBYRHJRenVkanprRVFx?=
 =?utf-8?B?dDAzODQrRE9aYlVMSXlrVEx5VWVwWFowblNZRklEVGhLcjR2MkpNcEhXV0JG?=
 =?utf-8?B?eGdORzY2RFMrdW5VR0p6c0xkcFJWaHhpNUZ4aU5ObXdSYy9NL3FwTStXWlRJ?=
 =?utf-8?B?NnF2V3BIQytWNFVqRUFGMnZpZk5hSnhQcWNwN0pEeThZdVg1M1B5VDQvdkJz?=
 =?utf-8?B?b3V5STYzeUx2NTZLWVJ1c1d2OFpJQkRleUlGMU83S0ZYK0RwR2tPYVVnQVBv?=
 =?utf-8?B?SGcreXJlL2krYkJ1MjY4YWtOdkdrRGwxRDFNU3NMaFVxcDA3SThXVFZVbFBi?=
 =?utf-8?B?N0t3ZnRsTlozQjN3VjVPYXZnWjV4NWZYZUVYUWxadVJDdVl5RDVrTFRPOFFq?=
 =?utf-8?B?bmlPdFhydmV3TDFKTG1idTVNZ083UjAyWS9vakJPNGE2RlM3SGFteDFFdzNQ?=
 =?utf-8?B?MGVvTjBURlZKRnV6R1RVeS9UYWtPRjVyd2oyUS84U254UVdydzU3T0Vvc3hr?=
 =?utf-8?B?aEZKV1ZmL1J4TlM2azRQTmpscGlOajhIVndKYSsyWFI5MnFPM0d2anp3Smsw?=
 =?utf-8?B?aG5QUGRvMFBlSGJFbmszbHJYSE44Z2FkTXZDVThPaWE2eThXUGRZWEVhd096?=
 =?utf-8?B?K1cwcjVBdmF4dkJvYTFTaUtWMkdGUjkrdGU5ZlJsZndEVURCeVJwdS9BMndZ?=
 =?utf-8?B?TFphZWFRVGF5TkwvVzRVbDhOUjVEUFdsLzVrR1N2YTVudWdWdlZVZllWMkta?=
 =?utf-8?B?R3FIdzhkM3U0KzN4N2RPYThwOURwV2pQMzJsem1NbzYwdjZrYzdNMStsekZi?=
 =?utf-8?B?V2cxaW5mYmlTS0t2U2lVWTVLNzBSVEwvN1VsbXZwN0g0Y0w4R0RMNkNTREpV?=
 =?utf-8?B?MkJwRkM3bmxMVjRPOURMUWtkcUZyaGw4Z0lKUTVUdHVKSlNRMkVDZnNhZEVk?=
 =?utf-8?B?K1E4QU0wZHFTWGErc01sSWk1WWlpR3dRK1FUYmZpZzlHWlNmV0tKbjJIejZY?=
 =?utf-8?B?SXdUYTUvdUxJZG8vYWY5Znp4d015NTYveG5CeTIxZ2lEOVk0V2RZNmFKRGtx?=
 =?utf-8?B?SmVPRTZWTWlxU3FZSWJLTTFqVGVVYUFCUVh3TnNpZ21QMFV6cWN3d05YaVho?=
 =?utf-8?B?Z082dmkrK3hta2VaZTZhVEFVREFYLzFuYlQ4YVlqcG1WbWJ5M1pIdnpJa3E1?=
 =?utf-8?B?QkVpNVdGRjA1R01SRzBYQWM0cG5iNzhUU0g2aWFzN0NFREZ2UXJFcXVBWk1y?=
 =?utf-8?B?YTFhaHZ3SzFWRENYb0lWakRhOUQxNUc5ZjdRb2MyMGtmY3l6S05saDU3cmll?=
 =?utf-8?B?TFY5QmdFajAvUGlYdzYwVVdZSFFYQmNURXlPUUZGMTk5N2dpVW8rRjBEVmQ5?=
 =?utf-8?Q?Q6tjBKytXSuP4b5fazOn3AwWGs6/DAtvqLkgFLtMOo=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30932891-30ae-4802-a544-08d9be38d89d
X-MS-Exchange-CrossTenant-AuthSource: 
 DB6PR0602MB3335.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 13:02:41.3010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xEKlhhWzD1kUL+EZ+S34TDflXSF8g4kqJckUh8aV+wI+gDQ73F3LTmftsvzCUf2DXTWgv/Kyn0Tpd96FMOP4zLihvA+2ndXX2Z3aY07fXc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7498
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:02:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159625

On Fri, 2021-12-10 at 18:49 +0000, Jasper Orschulko wrote:
> Hello everyone,
> 
> after some digging we identified the issue to be on our part.
> We have been using "GTEST_LIBRARY" and "GTEST_MAIN_LIBRARY" in our
> CMake scripts instead of "GTEST_LIBRARIES" and
> "GTEST_MAIN_LIBRARIES",
> as described in the cmake docs:
> 
https://cmake.org/cmake/help/v3.16/module/FindGTest.html#result-variables

Thank you for providing more details.

The gmock target can be backported to dunfell in an alternative way, by
leaving out the
    find_package(GTest QUIET NO_MODULE)

call and subsequent lines and letting the FindModule create all the
definitions. This would leave also the undocumented variables intact,
if that is desired.

This should be as simple as dropping the lines
----------------------------------------------
# first specifically look for the CMake version of GTest
find_package(GTest QUIET NO_MODULE)

# if we found the GTest cmake package then we are done, and
# can print what we found and return.
if(GTest_FOUND)
    set(GTEST_FOUND ${GTest_FOUND})
    FIND_PACKAGE_HANDLE_STANDARD_ARGS(GTest HANDLE_COMPONENTS
CONFIG_MODE)

    set(GTEST_LIBRARIES      GTest::gtest)
    set(GTEST_MAIN_LIBRARIES GTest::gtest_main)

    __gtest_define_backwards_compatible_library_targets()

    return()
endif()
----------------------------------------------

-- 
Eero Aaltonen


