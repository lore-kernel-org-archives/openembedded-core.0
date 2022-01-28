Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2440DC433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 07:18:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.4350.1643354309915437638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 23:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=oXAjGrTe;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8027a60b47=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20S6xHWI027458
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 07:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=msSenxykW3+THseDdxNdqX3Kjc5wNVNQK7P5bZfc/7M=;
 b=oXAjGrTehe+j3FQT7NFAuKFjdDCU+V8xtyttVHI8Xb+stzInwTqJLM5jLhHyTi3fDd8C
 WMsGteeHRrf44Mbi0PPIb9Gd+vkTaJBjbIbGKdnksVScis75ZBU9XH5Y45OFKFoApjtX
 Z3Sd7d1QXauzSqe5gb2Hid1Evx6/HbpHIDHKKk1fLqKzYvQ3O/jMlKqzZK6JNTJSzVPm
 zEibc5EwzosFe8+/4aAx50CIGJP3RceK9iKaRXYVfLe58Xctn4CxrC6Uffuj+buviwX0
 LSZdx9mHntKFQ48qTkZq2lt5XByG3emVu7/Rilkz6MygqlQtmda9fuLZTFUO15QGEVWY 9A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3du1jesqs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 07:18:28 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20S7ISbg031903
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 07:18:28 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3du1jesqs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jan 2022 07:18:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRG5j8+z9g5JotReFn5j08qF3nFcA/uD9Zlirlmzh3GyKB3jixteT7z9rionizVxsJmOa2tVJwajM7wsCcgVlLvAA1o3jMJPEHM2ywlfZ7tX/devaLKuG+9TgmJcYBEKQDvvfu5pD25xap/HqgqILJARzplORGluw7JFpb7GRrmrfTulfB6WxXq9+BiGsJJ/uCHzEgzcJBKP62XjP2/n9LiWuRCvUznERVSKpboMuo15mmjD5t6UnxPdbbm9PmJEVkUGUjFmKd1nGOz0Ub+rXxm+bz2abOYwPSt1Hf6Dr+lF0L3kZtWFcGwHz7m/tqt1qWtz1tgXgToDOWqtsnn6mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msSenxykW3+THseDdxNdqX3Kjc5wNVNQK7P5bZfc/7M=;
 b=mBwH6VVKR+091WmGMzKhRbwY374zjVRHKYLzXnxUi7PE5R40pS29Wx38jBJU1lyHYUWT6p+2V4ltSgKzTqWztdQSsAQsNeeKRuY3EFL7+ttlwTYEcRyhbwshTymG4NeLkCdXEqJA/8TfzFLhM+4EhrapyeQJusqdL3E/aLs2HVALr2U+tmoXP5m2deRGbJbHCOULAmeAh4VFE8eDFrmOFrCBSo1N7oLQdjUtNLfOo2TzDwQ9StC16qospUaThknRrskDSStDpK2PKWjMshqQhSL55XJW3n25WUqOJfUnTVHZmL7+bcc+pz5WZBhvt8DJiNsmhw3u7+HVrUCW2WjZTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM6PR11MB3195.namprd11.prod.outlook.com (2603:10b6:5:5d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 07:18:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%8]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 07:18:25 +0000
Subject: Re: [OE-core] About the sstate cache directory hierarchy
From: ChenQi <Qi.Chen@windriver.com>
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <16CE5D64E2C30C30.17092@lists.openembedded.org>
Message-ID: <bd0125d2-1f65-ede3-c42e-3a1b6fd5d469@windriver.com>
Date: Fri, 28 Jan 2022 15:18:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16CE5D64E2C30C30.17092@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------BC95114C65A09D60403D3C0C"
Content-Language: en-US
X-ClientProxiedBy: HK2PR04CA0088.apcprd04.prod.outlook.com
 (2603:1096:202:15::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a654d54-4ca7-4a1b-ed94-08d9e22e5f57
X-MS-TrafficTypeDiagnostic: DM6PR11MB3195:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3195B1ECD89F761B8CC7C5EDED229@DM6PR11MB3195.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0JvNlRReWl2RkJsQTJYNnpBd2N1azUyclV0VG9hMHFFNis0TzJQbUxmQ2VP?=
 =?utf-8?B?dFpJMWw3THZkdHhZeXlDVml3L0JtbVZ3RDQ5YU1kVUlSeUZJSk4zeU5LR0dX?=
 =?utf-8?B?ellDanZNSnlTSGpqSFNHcFdIWEFxZWlYa21PRWdIMGVTcVZmZnJBS1M0aUNm?=
 =?utf-8?B?SXFjcU5GSlY0RlBMWXlaQkhIKzJrdXE5VDZibk9MbUNTR05jMlVWWFFXNXRL?=
 =?utf-8?B?emgzSnFocC82ZTJzUGZySEtBcVhFN3hPY3VpRFVtZEx3Q29FR1lFNjFKcmc4?=
 =?utf-8?B?MWFiUk51aHdyZHZLekp6N0VuTW1wSC9MdVFpZmhrVitvcys4VTFOTUc5U2pt?=
 =?utf-8?B?S05aRUcvQVBOdVNTclNnc2VwSW9uUCt0YStRWGdObklHMEQrTWxkV0JyejF2?=
 =?utf-8?B?UnRnQjIrdWlBMWdGSkxTSi9MVGNBMjJlZnc5b1JSQjkvcms5TVhWNWYzZ1ow?=
 =?utf-8?B?VWsxN3l1RkUxWFd1emNnR3krTGtpbUE5VU5ad25oU0RWS3M5YmhwVmJ5MFFn?=
 =?utf-8?B?ZGlBb1RPSHRlWkxlb3ZHNDRCWG9iM04rZU4yMVpDVG51WGJUVUkrZzZ6THZE?=
 =?utf-8?B?MkwvcWNNTlpNTW91WURpMXlKZ3lscEt2Y3lHcFlzbEJGdmxxRFNEZ2VWTnJv?=
 =?utf-8?B?MC9hZzZERVoyOXRWYlhGVTJSVkQ0RHkreFA1Qm01a3dzR2RZOVFrU1lqbW9L?=
 =?utf-8?B?bE1xWjlkV041bzJ2L1QrWFQzd2VjcDlMVFQ3QnZFL0I4STNqbG1lM1JxMzNm?=
 =?utf-8?B?cXpGVVVGOHdLOVBydW1YLy9wMWVoc3dSeHI0YlJMYnIyZGY4SXg5Y2I3Y3FR?=
 =?utf-8?B?MkhITWxZUC91aHR0VEZsKzl4UVIyNmFuUHZkNEtTTFVRUW1QV2wybGhOYjhz?=
 =?utf-8?B?ekE0SUp6eDA1aDB2NTY0K0h6TzV5YWFJTzFFQjVlL1E1Q2lxa3BxcEp6djdx?=
 =?utf-8?B?UUdCOE9WaG5yODNjSGZGUDFlZDBoSDNrVlFFUHhYN0RZS250a2FUcHdrZnJH?=
 =?utf-8?B?NGx2TURzdjRMeG4yNUpRV2xKWEkwNlkvTitnSE5GbitDai9DbFRDR3l2TFk5?=
 =?utf-8?B?ZEJuWTd6d2srdmpZK0FMWERxUUtvVDBXaVJNWVQ2OStKc3liUnlLd2k4Wlpi?=
 =?utf-8?B?R1VvL0dlWHJEWndTQlVHUTVpMWwxakE0SVFNZnlBdjBCbmt2UGxOVlN6bFhJ?=
 =?utf-8?B?YXA2VFZWaDh2MWRhL3ZERE9RR2krYit0SVBlWlp2ZytSdGgvKy8xdi9FeTNU?=
 =?utf-8?B?dkI3UGxYRTVZTEZRMFArcDJKZFJyb2MwMHdhNnlUdDJjNDRmdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6666004)(8676002)(508600001)(966005)(8936002)(316002)(166002)(110136005)(66476007)(66946007)(31696002)(66556008)(38350700002)(86362001)(83380400001)(30864003)(38100700002)(26005)(5660300002)(2616005)(186003)(2906002)(36756003)(31686004)(53546011)(33964004)(6512007)(6506007)(52116002)(49910200005)(21314003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NzFjcWFwcVovMEJLeDZjMEExZ1JHU3F6MmF6bWhvUExVQ3QxVVRTZnI5c0JS?=
 =?utf-8?B?RnJqdDNPNlNFSW9PZHp1NFlFN1ZuZTJnam90UDhBK2xRS2ZXWHpnL2dNWk5D?=
 =?utf-8?B?MTdraUs0U2l2cUZjVGFIMUE2cWhSWW9VSnlheXkvUE0ydGl2TGNrWmRkK3hI?=
 =?utf-8?B?WXFML3hXYmoyQWl6UUp2enloVi8wN29uOUxXdjFPSG9ZakZSL09mYTQ4Q0RN?=
 =?utf-8?B?Q2Q4aS84b096NmU2bi9VSFd3RVhJRFFhYzdaM0xTNkFYNTJrOWZXR1E2NmdL?=
 =?utf-8?B?RmdNdkxSQytYQ3EyVHljby84NFBWNElqM05sQUpNK01oUUYrOGVGOEUwOGJa?=
 =?utf-8?B?cFd4cmNnYzZla25sbkF1Ykp0QXN5TVY2MFl1Z3d4NHpjQUlGQ2p6Z2QrMXRB?=
 =?utf-8?B?NGF3bkJtSllvNCtKTFJpSFp6MzhoWUplTGVNd3Q5REord2ZweUs4VWNXZGM2?=
 =?utf-8?B?bFpuajRqb3FmellKaWc0Z241RlArSVVjK1J4MkVoS21NVU9RbWt0UjZHc3VL?=
 =?utf-8?B?RkNmUkoyNkNkS2tjTGhIdWxqUml1Tng3Wlg5OFA3QWI3T1J4L2M4RjJQQmVG?=
 =?utf-8?B?QjJ0WU9aTmxyN0EyVUVyalpZdzN2RTdlVklFZDREaWIyVWRVdE5iZFVHMC9w?=
 =?utf-8?B?NDFSdVdDWEU3aUpzeXJZQkhKMUZoa09nZnBkbVNHTWdwQWVwSWpUWlNsVno2?=
 =?utf-8?B?RXpqK0h4WWh0VS9xOFVqQkc0Q09ZYS9NbTNEOGxocGVoRWI3Q3ZpNTFZMlNG?=
 =?utf-8?B?NEdEekhwL216Rm9IOWYvNmxEajZnT1dXeGdKei9GdkJKLzdtYkNpbU5raGMy?=
 =?utf-8?B?dWpnOVVWc0Y2QStRdEN6T2tQQWdYaVBRa3Z5S2lXcFhXMCtockVFMHRwSUdU?=
 =?utf-8?B?UE5kVnQyYXpyQy9uNzRTbXR5emRKdUJyS3I0YlM1TWtFZVJ5eGdNbU9SZHdy?=
 =?utf-8?B?Q3dPK0tGbGZGNk9OVDQ4dDBlOGdWU2w2c0VTTVFraFU1TDhpMy9Nc1JNQWE2?=
 =?utf-8?B?aWZXbE5lMXdkNnF1Z3ZJbnN6eEZFbEJlV2xZK3RGQVk4L0h3UDAvbTBaeGs3?=
 =?utf-8?B?MENhdFk4Vll6Y2o1NmJ5dFpWWXJQUUxscXJSbllxK3ZmWStSL25oeHNUUzk1?=
 =?utf-8?B?cGtEektsaVhjK0VLRWFHZE5YbzlHRUR2Q05IOXpCbGMvV2pPOWpxMVZ6dmln?=
 =?utf-8?B?cUllTHJ1dVFyei8zT0lOcW1BekNHT3Z5RXFpTkhEU3ZjcjlrSzRYWGhjeDhC?=
 =?utf-8?B?OGcwRDhNMTg5a0YyWmFIeXd3M3AxZjJuUWFBck5QUllxZnhrbmgxb09lSnBN?=
 =?utf-8?B?b3JEbm9LdXl4dFU4ZFpaUTgrTXcrVnJCUHV6NXJZNlZBekIxaUJyRGE4R0Qx?=
 =?utf-8?B?MlFwL0h6NmFHbS9xS1hndWNnUEl0YmpsWStLZG9mUFFCNjZCSkZKMlBNYmNZ?=
 =?utf-8?B?N1RjdkNFeU16azJQeTJKVHFwc3kzeUp0N2V6R29yM0lQaVhiVlFxTEZFejVE?=
 =?utf-8?B?UG13ZmtVbklQYVdlalJKNU1jZTRXdXZaTzllWGN0anducjR1RWZ4OWZmTWdF?=
 =?utf-8?B?S2lnZHFwcUpWNGN6ZzlGbEhUcUFRRmhqc2Z2dUZxbE9vMXFkLzN6YlozYVht?=
 =?utf-8?B?am1kYlZRdWo3WStLak9jcTVjZ0ZtejJUY2ErUm1xU2ljeUxCSno1dkZqZWFm?=
 =?utf-8?B?T2hySURBTzJDS05oZjlrTnNJSFk2ZGhLcFhaSVhGeGRhOHhqUUIyeldDNXJU?=
 =?utf-8?B?blNSRXRSVlliMWJOeGdTWnp3RU41akw3V0RXWDNIVDhJYkw0QmRIdS9FM2JU?=
 =?utf-8?B?K3g0TllMeUg3dzMwMUpvR296UGtDM28vMm5OazBCMXVrU0UyWnBlZmVXeE8v?=
 =?utf-8?B?OVV5N0lWYUc3a25rNTlpSHBzM3lYQTNwbGpxVFZIYit4dFM0d1JQY1NHZDlO?=
 =?utf-8?B?RDNwUERzY1JNb1IvTkg5Q3IyeGNEU3RsSFZhWG5tckE1MUg0VGFWMitwekJC?=
 =?utf-8?B?dWRmZE5kc2hMZnQwbCtKZ1RRckQycmV3K1Ivb3dVcFlIYndSU3RqenpSMUE2?=
 =?utf-8?B?dnViclhVdkp2KzFoaVBvTDR3bzhuQW1VeFN4VHl5dEVCM3hKeWtMbzNwWVFu?=
 =?utf-8?B?Zit2THJta3JUNGtPVW5MalM4U2p1NnFMbGFVTUVkTjBBYVBaaGNSRUliMUdK?=
 =?utf-8?Q?lSiBErJvqQe8XGtC+GSDuaM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a654d54-4ca7-4a1b-ed94-08d9e22e5f57
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 07:18:25.3586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 npdPATzLgjQfbU9KIbD5CCH4h3qoOZ7OhNtibMMJwKQjROmwtxV2XFEYlPZynrNYW5nPZx76YRIkWU2g2UbXLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3195
X-Proofpoint-GUID: Ud702dGJVGa3WH00fhqFEJdvcVwS2fd1
X-Proofpoint-ORIG-GUID: BOztZbXOhRpsMk3SC_ssx8PN9TQAAbz7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_06,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 mlxlogscore=774 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201280044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 07:18:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161068

--------------BC95114C65A09D60403D3C0C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20S6xHWI027458

On 1/28/22 3:06 PM, Chen Qi wrote:
> Hi All,
>
> I'm sending out this email because I'm wondering if we can change the=20
> sstate cache directory to use ${PN} and taskname as subditories. Hope=20
> to hear your opinions.
>
> Below is the long story.
>
> Recently I noticed that running `bitbake xxx -c cleansstate' usually=20
> takes more than 10 minutes.
>
> After some investigation, I can see that most of the time is spent on=20
> file searching. This is because we have:
>
> SSTATE_PATHSPEC=C2=A0=C2=A0 =3D=20
> "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}${PN}/${SSTATE_PATH_CURRTASK}=
/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*"
>
Sorry. The above one is the patched one. Below is our current setting.

SSTATE_PATHSPEC=C2=A0=C2=A0 =3D=20
"${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE=
_PATH_CURRTASK}.tar.zst*"


> And our sstate cache directory's hierarchy uses hash[:2]/hash[2:4]/ as=20
> sub-directories.
>
> This essentially means that all sub-directories are searched. This=20
> would take a long time, especially when run for the first time. I made=20
> some changes to=C2=A0 output the time and the logs are as below.
>
> $ bitbake glibc -c cleansstate
> WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core=
2-64-poky-linux:2.34:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 611.8865714073181 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core=
2-64-poky-linux:2.34:r0:core2-64:7:*_package.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.3219327926635742 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core=
2-64-poky-linux:2.34:r0:core2-64:7:*_package_qa.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.470815658569336 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core=
2-64-poky-linux:2.34:r0:core2-64:7:*_package_write_rpm.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.251939058303833 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core=
2-64-poky-linux:2.34:r0:core2-64:7:*_packagedata.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.2369801998138428 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc::2.3=
4:r0::7:*_populate_lic.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.1668426990509033 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core=
2-64-poky-linux:2.34:r0:core2-64:7:*_populate_sysroot.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.385568380355835 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core=
2-64-poky-linux:2.34:r0:core2-64:7:*_stash_locale.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.4884181022644043 seconds
>
> I figured that unlike git, we do have knowledge on our sstate objects.=20
> It does not seem necessary to use hash value as sub directory. So I=20
> changed the sstate directory hierarchy to use ${PN}/taskname/ as sub=20
> directories, and here's the result.
>
> $ bitbake libgcc -c cleansstate
>
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/deploy_source_=
date_epoch/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_deplo=
y_source_date_epoch.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.020630598068237305=20
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package/sstate=
:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0011608600616455078=20
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_qa/sst=
ate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_qa.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0007557868957519531=20
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_write_=
rpm/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_writ=
e_rpm.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0013995170593261719=20
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/packagedata/ss=
tate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_packagedata.tar.zs=
t*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0007488727569580078=20
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_lic/s=
state:libgcc::11.2.0:r0::7:*_populate_lic.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0005896091461181641=20
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_sysro=
ot/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_populate_sysr=
oot.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.00080108642578125=20
> seconds
>
> It's much faster.
>
> In addition, the sub dirs now give more info, which should potentially=20
> make sstate cache easier to manage.
>
> Attached is the patch to quickly try things out. Hope to hear your=20
> opinions.
>
> Best Regards,
>
> Chen Qi
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161067): https://lists.openembedded.org/g/openembed=
ded-core/message/161067
> Mute This Topic: https://lists.openembedded.org/mt/88740516/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--------------BC95114C65A09D60403D3C0C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/28/22 3:06 PM, Chen Qi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16CE5D64E2C30C30.17092@lists.openembedded.org">Hi All,
      <br>
      <br>
      I'm sending out this email because I'm wondering if we can change
      the sstate cache directory to use ${PN} and taskname as
      subditories. Hope to hear your opinions.
      <br>
      <br>
      Below is the long story.
      <br>
      <br>
      Recently I noticed that running `bitbake xxx -c cleansstate'
      usually takes more than 10 minutes.
      <br>
      <br>
      After some investigation, I can see that most of the time is spent
      on file searching. This is because we have:
      <br>
      <br>
      SSTATE_PATHSPEC&nbsp;&nbsp; =
&quot;${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}${PN}/${SSTATE_PATH_CURRTASK}/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*&quot;<br>
      <br>
    </blockquote>
    <p>Sorry. The above one is the patched one. Below is our current
      setting.</p>
    <p>SSTATE_PATHSPEC&nbsp;&nbsp; =
&quot;${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*&quot;<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:16CE5D64E2C30C30.17092@lists.openembedded.org">And our
      sstate cache directory's hierarchy uses hash[:2]/hash[2:4]/ as
      sub-directories.
      <br>
      <br>
      This essentially means that all sub-directories are searched. This
      would take a long time, especially when run for the first time. I
      made some changes to&nbsp; output the time and the logs are as below.
      <br>
      <br>
      $ bitbake glibc -c cleansstate
      <br>
      WARNING: glibc-2.34-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst*<br>
      WARNING: glibc-2.34-r0 do_cleansstate: Took 611.8865714073181
      seconds
      <br>
      WARNING: glibc-2.34-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package.tar.zst*<br>
      WARNING: glibc-2.34-r0 do_cleansstate: Took 1.3219327926635742
      seconds
      <br>
      WARNING: glibc-2.34-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package_qa.tar.zst*<br>
      WARNING: glibc-2.34-r0 do_cleansstate: Took 1.470815658569336
      seconds
      <br>
      WARNING: glibc-2.34-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package_write_rpm.tar.zst*<br>
      WARNING: glibc-2.34-r0 do_cleansstate: Took 1.251939058303833
      seconds
      <br>
      WARNING: glibc-2.34-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_packagedata.tar.zst*<br>
      WARNING: glibc-2.34-r0 do_cleansstate: Took 1.2369801998138428
      seconds
      <br>
      WARNING: glibc-2.34-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc::2.34:r0::7:*_populate_lic.tar.zst*<br>
      WARNING: glibc-2.34-r0 do_cleansstate: Took 1.1668426990509033
      seconds
      <br>
      WARNING: glibc-2.34-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_populate_sysroot.tar.zst*<br>
      WARNING: glibc-2.34-r0 do_cleansstate: Took 1.385568380355835
      seconds
      <br>
      WARNING: glibc-2.34-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_stash_locale.tar.zst*<br>
      WARNING: glibc-2.34-r0 do_cleansstate: Took 1.4884181022644043
      seconds
      <br>
      <br>
      I figured that unlike git, we do have knowledge on our sstate
      objects. It does not seem necessary to use hash value as sub
      directory. So I changed the sstate directory hierarchy to use
      ${PN}/taskname/ as sub directories, and here's the result.
      <br>
      <br>
      $ bitbake libgcc -c cleansstate
      <br>
      <br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/deploy_source_date_epoch/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst*<br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
      0.020630598068237305 seconds
      <br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package.tar.zst*<br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
      0.0011608600616455078 seconds
      <br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_qa/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_qa.tar.zst*<br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
      0.0007557868957519531 seconds
      <br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_write_rpm/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_write_rpm.tar.zst*<br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
      0.0013995170593261719 seconds
      <br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/packagedata/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_packagedata.tar.zst*<br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
      0.0007488727569580078 seconds
      <br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_lic/sstate:libgcc::11.2.0:r0::7:*_populate_lic.tar.zst*<br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
      0.0005896091461181641 seconds
      <br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_sysroot/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_populate_sysroot.tar.zst*<br>
      WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.00080108642578125
      seconds
      <br>
      <br>
      It's much faster.
      <br>
      <br>
      In addition, the sub dirs now give more info, which should
      potentially make sstate cache easier to manage.
      <br>
      <br>
      Attached is the patch to quickly try things out. Hope to hear your
      opinions.
      <br>
      <br>
      Best Regards,
      <br>
      <br>
      Chen Qi
      <br>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#161067): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/161067">https://lists.openembedded.org/g/openembedded-core/message/161067</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88740516/3618072">https://lists.openembedded.org/mt/88740516/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------BC95114C65A09D60403D3C0C--

