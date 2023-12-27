Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A61EC46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 15:54:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.103736.1703692444487933933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 07:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=T8qF4sNe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0725c91a19=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BRFkn9J011067
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 07:54:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=RyhWxk5lib7jLgDJqmC
	9/DFt83ZGivYSvyMOQNydP4U=; b=T8qF4sNeglRRkzeBNAbFPXDkQnc0AgOO1U8
	q+LEMFw76rtYJfFfQGYeeOjhdg8+EN0dAYgXyRBnm6tVJb5tKOQGGiovDOJWNSGv
	nyTxE21FDuIxUpDv561Dvj/Pgw4CMtUUfMu5FOxYwnJvf+3KqcylogVD9JsgmW28
	Zueqa8QXNUjJ3k0x4dVbnGiObaxUbfD2bQsFATvOA6O+QNFJNE+2Q3TAF9SI0eHH
	v+a1Ql82gMUl9pLplcZT5o3T8kBI98dhQ4zL+zqhPQve6tjONhvTbP10lhRFR/Lm
	1bP9M+tnO5RorKtFw/q8jiBnLXDPdc+KRx0QDqljyaqiIPdsV/w==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4k5vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 07:54:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6LD+TGOhv7q8OZtywXvGh++KFgpEB2POG7gBZsGkRmr2sGyy5z1g53AJK+dHruYL9SCJ27qQQsbW54ldQqjs/79/KFEtmp/rJOl5q7LsyUTJoNIG1ndb0/RSByZOJiyutipmMZxlqdPaTeBvW9zR/O4xdmYdJa8KpOdxV+1lXtFmxM40QMhaIDy53FnO8BppuhSrSFBT82/fuIheOjGNV84WzpP2fa0xtWTNLvX/o/uzqj5SKV549IZCjW38mGVAr1hohz/flgoI+tmicESZdZFDJvFpDGYTIYXyxVc5yJmJ8pYBCW8zq0bdjMX+3mu6HDhKsKCDOdyebTchRAMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyhWxk5lib7jLgDJqmC9/DFt83ZGivYSvyMOQNydP4U=;
 b=EUqEGW1lIZX2gRlYCE9UwYfkGioJpULNVzLYSJORDWYDLsY3hiBhBLkR4Eyte5sNzKAZ8eH0vqzb6Lmy2PL23U+sFG+WqOZOBe4VihMcE6AFV93lMnJzIifujyWE5/TOlzBqkN4ZxmeOuCJlliwUyGN8MLW46xEV7GPz3T+e2JJ/D2H5UtRY4C0CkAuo9Jlyf0SC2OOT+ARvI7EylM+p8E8lI7wp8Z3gaD2Gj/rlFhDlfJznz2SaYVWKex/fhv60PSkb/DPuGLew/2q+s1Y46lq3NXdWdHPcMKRRkAl4PSjG/0Z5j23JC+GWDyK55nIf8T5Xq9Xcz4Z+RG8YRa6alw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Wed, 27 Dec
 2023 15:54:02 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4b4:e7a7:9d2:946f]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4b4:e7a7:9d2:946f%6]) with mapi id 15.20.7135.017; Wed, 27 Dec 2023
 15:54:02 +0000
Content-Type: multipart/alternative;
 boundary="------------TbXhCHYhuqL04RIeU8EW9Z4v"
Message-ID: <a40710a3-dac6-4b71-8b06-e6f98bcbe83a@windriver.com>
Date: Wed, 27 Dec 2023 10:53:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [patch] packagegroups: Add perl modules to rdeps
Content-Language: en-CA
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Harish.Sadineni@windriver.com
References: <20231227125025.2531461-1-Deepthi.Hemraj@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20231227125025.2531461-1-Deepthi.Hemraj@windriver.com>
X-ClientProxiedBy: BYAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:74::21) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA2PR11MB4858:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbe847a-c263-4e16-d6e0-08dc06f40bb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/xnmQHvBhx4W02dwnMetys182RVdxHAhaNtcu/VXAY8/HuYuk0OeYYC7VljnvEraN01fsIt29eK1n7IARx+GwIkJLK4Xr3h6O/LJJr/xgwIjwnpc7fQUrvHuBO3pWd0K05mclzwEGjUT+X1+hKyk4MCkCeOUUFtZHzRUyvTe0HGLPvqqBxHCxjXVkCgcs6dnHqydzymT1ya+y25d3m+1Ga7wcGhez7cW68lDUHvdi6D0xKMSchbMBPF8m6unq2NUJ3KA4zJgy8juO0Et+d9Jv+SZvAUrmtbg4LTCVtXGf0R3WP2uusHm7th/4E/gRs3K5Yd3g1HSzBXysUlPwnBHl/l3vkJ1I3dOin9VK1x2Ht1rZnP2qWWRaiY0qwvt1aiIC4T/DgM8FOqOQlzb+hSUXTNPOMpf0KMpoEcskXv75l1hmEccG6Zf2fI+Kshq7slrLYXn08lvCsC0rzrMtrY9M/6ZDYfucazD9vnN2kv8Nw8fRU22IJUSAQ31Wp1OVDBZx6LAdE/cf59zk5iuoOn3lj1QvgWeNKJSuXTJoO7JetSlDY8yMCAj4nIGIYFIdqLfGvHCiwltuakluUcSJ9m2B8gyivr0E0U3csw4QHJWIoiijkDHsZjw9cHdyh737dW5a3iRrREIdVbSyGtcsaCdNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39840400004)(136003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(26005)(107886003)(2616005)(8936002)(5660300002)(6486002)(8676002)(316002)(31686004)(66556008)(66946007)(66476007)(4326008)(36756003)(2906002)(31696002)(6666004)(86362001)(6506007)(6512007)(33964004)(41300700001)(478600001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dmtGWktkRlFqakVERnBiWWdnSzIxbmlhNUNIYXlPWW5OaFhkUFZHWlNWa0s4?=
 =?utf-8?B?UExkdzhUK05kYlVKclIxTWJGRldFMkUxOGxrZEdJNFF5WUtoMzJVVDZ3dW5H?=
 =?utf-8?B?TFJiNDdPV2g5Wm9uWFRUVlVpRFNiTXBBSFZ3emZqYWgyNXc1MEZPVUtyeDE2?=
 =?utf-8?B?Ly91c2MyR2g4eVZKK21VQ3Y5N1M1dTA0K2FNNDBrbkFCRkFZMSt2TDVNYjcw?=
 =?utf-8?B?c3RkNDF0MkxMZHdzUjZLL3VuYlp6TXBKK3VHSFFYWFNwVWhSYWJCSlZJdVc1?=
 =?utf-8?B?ZmRLaUI5OEx1SEdxNDhhdmoxVGVXM0V4S2luOUs1R0s2K0U3ZzZhWTlFSGNy?=
 =?utf-8?B?Z3FCYS9keWZqMEVUNHBUWkJNUFdGTXZlUU1qM2RVYTJHWGlTUjlia3VDaWRi?=
 =?utf-8?B?ZFRKQVNjalFLRUpVTXRtOVdWbVFpT2lUOXhBeXlqRmdoTStuMTFLeFFwT3A0?=
 =?utf-8?B?SDhEcnRydG9hTGMydGlhZ0lMR2ZSZitkN1AyTVNTZC8zUm9jcmpwQUhHT2xr?=
 =?utf-8?B?WGdrUGJob3dWdUlMeTd6WjMwd3F1U2tFeWw0QU9wSmtlSEUyUDl5K2pTT0dm?=
 =?utf-8?B?eWFyYkdTRnlCcVRoWU1mKzU5RkNXSlRLS3ZhNFQ5TGNxTUxEbzh3bldpUVdn?=
 =?utf-8?B?Vm5JY05zNllRa2FDVHkxL3ROQXF6YWp3SUt0RFh0TitNNS9oay9xNTg4K1dj?=
 =?utf-8?B?cTVmUGRTRVgrSmFxcGQrODRYSVZIWnhOQ01XdGNxSlMxeGpyQ1pxR1VVZ0Z2?=
 =?utf-8?B?V1R4UUo1eXg5MUE3aGxqeVQ0cDY5MTNHUGUyWG5HSTRHSkxYL3hWeFYrbDJa?=
 =?utf-8?B?T2czZDhrU1U4bVdqSDkwZmlmdzhhTWxFKy9OSXREc0FhU1JrTTlQZUYwTkYx?=
 =?utf-8?B?bWphYjB0dVVIU1FSOEZQNU9VaUpnNnRxOFBwVE1SVDl2dkJxRVdTZkNzUkVq?=
 =?utf-8?B?R3BibUdzYmRPU0I5NzhXdHA3RmRXSTlPVkJJcXhGWEZCdlhxaVVrTWxDTXJx?=
 =?utf-8?B?a3o4K3VGRkdyVU9XbXZPd3dLYzZCNjgyTlJvbDNSNWRKVitHYTBkM01nZWxk?=
 =?utf-8?B?OUNIY3VlTkJsM1UxYlByeFRjdE50bjFobkZkS0c5UE9sMkFMYytUZXFRUTdQ?=
 =?utf-8?B?LzNvQjYyT2tiQmY5Wno1cVlHTmQ5NG9zNjdKNmpMZFdHRmJJNDdhazZOcG1G?=
 =?utf-8?B?ZXQ2aUp0SDVvbEp0RmF6QlBDdVRZSzVDaHVFaHBzWkN1bmVIWEZSR2Y5ZmxW?=
 =?utf-8?B?SU5wa1JFWmk4cmlIckhpZ0ZwMWkwVjc5YXJNRGMrMlRJYXZMdjh0azcrS2Jy?=
 =?utf-8?B?NE5DMVFldlhIUmg2K05XeDZwMkxrWG9CbTJxUnl5RFNLbnp0WFQ5M3lkTVZH?=
 =?utf-8?B?ZC9TVnB6bDlTakZXd3hxN1cxT2poaTRPWTlwWHBuVEV3Z1lmOE52UXRiRHdy?=
 =?utf-8?B?dkZZU3AwZEhndG5XOWFIcjA5TTlyR1IwR3NkeFRZZWlyMmVXTGV3SGF2bzdm?=
 =?utf-8?B?V0RiOFRoOFZCTDRiSXNXN293S3NYMzh0eDNyMm40OVNsOGUzaFBUbkc1VkMx?=
 =?utf-8?B?SEV1ajB3bytHdWV6cUVlSG95eVNhNUQ5NjIwamM3a3RTUi8yMVpUZlNKc005?=
 =?utf-8?B?NXhrRCsxOFA0c3E2TmpsbVh2UEY5eGJJVzZNOHl3Z09ZNmJPT2I0YUlHRFp5?=
 =?utf-8?B?YTJPZFF0bjlnVStMWWR1ZFFvd2NwYWRZQW9zUFlZMGZuWFZFaFVKd2RpUTZo?=
 =?utf-8?B?STZFVWpHRHJQSDBxT0pWaldkdDM3MWNIU2dHL1dYbjNpN0UwV3VLMXpMWFhq?=
 =?utf-8?B?UWNrYXZjMUlVRE8yVTdkTFM0YlQzRmRTWk9pY0FyUExFWGl6MkM1Qi84cERS?=
 =?utf-8?B?TDdQV2VmS1BiU2FBczBBVnc2REgyK2dRNG9WSkVxVXB5dlk0YVZnTUw4QWM2?=
 =?utf-8?B?MkswQU81T1Z3djl4VWpFbW8vMnphSFBDUEU4ciszTHpyQUswLzJxdGphdmJJ?=
 =?utf-8?B?WlRUQ3M3YTREQlRNS0JIM1A3RUtRT1lNTHR4MkpVejU4WHh1N291R0U1VXls?=
 =?utf-8?B?RU5zWU9pZDVVZk11b3doSkttT0dyVEpsMHZkdjQ4cTNUdEZCeHFteFlKRGJO?=
 =?utf-8?B?bkFoYm1wemIzNW0xUHQraDc4VW1RT1B6NXhNbDJ2RFIwa1o4NkJFWWh3VFhY?=
 =?utf-8?B?T2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbe847a-c263-4e16-d6e0-08dc06f40bb7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 15:54:01.9677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHOC+H8qpMZ0sckz7TYPvA6DS4+W/NvUx0ZvZ/6yJ4yuoMJdr1ch82WFX8qXQiwn+oIJ8pgHyPyHzPI+6QiexcFRzqHUnMSOeZjNGb7Bx9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
X-Proofpoint-GUID: 1Qd-rj2-qShWnIMt16D-dITsGtsomR8g
X-Proofpoint-ORIG-GUID: 1Qd-rj2-qShWnIMt16D-dITsGtsomR8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxlogscore=442 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 15:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192954

--------------TbXhCHYhuqL04RIeU8EW9Z4v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BRFkn9J011067

Also, your subject is to vague:
 =C2=A0=C2=A0 [patch] packagegroups: Add perl modules to rdeps
it should be something like:
 =C2=A0 [PATCH] nativesdk-packagegroup-sdk-host: Add perl modules to RDEP=
ENDS


That's 62 characters so still under the limt, iirc.

It's better to be specific, since there are 27 packagegroup files in poky=
:
poky.git> fd packagegroup.*bb=C2=A0 | wc -l


--=20
# Randy MacLeod
# Wind River Linux

--------------TbXhCHYhuqL04RIeU8EW9Z4v
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Also, your subject is to vague:<br>
    </div>
    <div class="moz-cite-prefix">&nbsp;&nbsp; [patch] packagegroups: Add perl
      modules to rdeps</div>
    <div class="moz-cite-prefix">it should be something like:<br>
      &nbsp; [PATCH] <span style="white-space: pre-wrap">nativesdk-packagegroup-sdk-host: </span>Add
      perl modules to RDEPENDS<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">That's 62 characters so still under the
      limt, iirc.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <p>It's better to be specific, since there are 27 packagegroup files
      in poky:<br>
      poky.git&gt; fd packagegroup.*bb&nbsp; | wc -l<br>
    </p>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------TbXhCHYhuqL04RIeU8EW9Z4v--

