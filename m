Return-Path: <mark.hatle@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7D7CDB47E
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 00:40:46 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.82])
 by mx.groups.io with SMTP id smtpd.web11.108223.1697416841718869676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 17:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=yfHFXzJW;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.93.82, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nv5U/NVJijw1J+t0Bkl+T9gomqQxYrLCmW8AxtJCI0iCz0gNouaydaY6JH1VELCPWDpEKAa/y2B1564+YmYSNG/ixwMnWiwG+ErIt1D3wRIX2Hpt1jxQBb9ksPuYoi8o1yfbfULPuao2m1DZl+PEHz7x6GKGLvruVGPWpDvjKjuKj97ZyTnhtk3D0ig3DI9xhuX+bykKHvNLdn+QuafLOAGehebPlr+S5MuHtT2l737w8SMIUnv4mWB/il/q+S1Ecer26RmmbCtzUtv0yKfj1dlH7Tf388TpRai3+bBBHJzg3oflKZNaspi+2uD673q00Ysmau7d7HZ9vljVBXNujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHuZcPW9sVdtwTfL0TCMYYLkjsFiiQg+DN/RnPYYkfA=;
 b=HshjvGQxJFI9nSIKZ5tXxGCEyelCWtoPvm4JloXFKf60w1woKxrx8Gji9WSd6guaJGOwwBb3nMjQbrdpfD/p1y4Dpa4WBPuEM8nkmSSojyOcybSRn3y1Ii+V+6YGp2OOSE8shfRNQfcJl5MPmTaNHyfRTNwVnWX2zirOCyBjT5kCtvp9XQeNrEQF7QqIYUmhbHD7qf4quiv9OjWxcm6CyUGuerDTpu26M0cq3/9soU4f1PhvGYh3+DU949HsGnrsNwMfSCjuDVuqujWZchE0t5E1EtMZlmnQ40yMcUdQggxRhIR3oywKQI43cJu7/+qI2bc6TT7vy0rB3H/k89tiHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHuZcPW9sVdtwTfL0TCMYYLkjsFiiQg+DN/RnPYYkfA=;
 b=yfHFXzJWpjKKMWTUBUKG+HRgZqzz3m6S1ZTFEKQ2RXrXwDAVWvkSTlsZpqL/cuLcquUZW15qiu1cqoRoebgwUqd6cb5T9gmhhMRDUWhsmwI5qjB/fxcLNklVmVvDfeTlqr9tfRn0bSpchuugCIeJCoXC/xU/yBkz32ZRWOY2+RA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB7018.namprd12.prod.outlook.com (2603:10b6:510:1b8::14)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.42; Mon, 16 Oct
 2023 00:40:38 +0000
Received: from PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::9cac:9d0c:d236:6d81]) by PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::9cac:9d0c:d236:6d81%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 00:40:37 +0000
Message-ID: <d64b3cd3-6b42-4e5a-b98d-a990d9bb2e66@amd.com>
Date: Sun, 15 Oct 2023 19:40:29 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
From: Mark Hatle <mark.hatle@amd.com>
Subject: Recent failures on master depmodwrapper-cross
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To PH7PR12MB7018.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7018:EE_|SA3PR12MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: b10d2511-adc2-4508-faa8-08dbcde083fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CN53PJ284SxALKUt9bD0gKhwi0A2QSN2tqocBehbTPBkc/527GM8yMyho/WiWteBAJEIw0ZY0hLl3Gfy5szC8Yl2Pf4dFa49Yjb0XRNmd7AUiV6e0SzEuyh0yUIyc7rbJcoEA7OAnX5Rd+ir9guZq92Rx6/VJhcWInCtcbnwmIYHbUiHETNU4X2jgdOONBoDoV+wDdfjQuUN0XvUPIdLjIZ4TJQQw1oN7qhX4vRPbDwxamrnVLUrD2uzraJCrgm57PK2PLi8qmzxAMmv3pY5FbbIGxgImwloAmL9Kr615qEEFWFzzEjLU0+bRy7HxFl5W6yRJ2as7dWPVQFKjvqpOqk8cmDc4vkE33aHjzjio/JE0XH9+PgAGV+10qRJiu/ZKhhyxQk4yoVY+KLlYauGoUhdRHzIrv7lci1R+5iqGi9Q7xulVhqb4351Hr9g03lNkKlaUOq30U9gZfsnU/G0VqLzy0DRiaIbI8GpwoOqAQb4/YGl+wi+vbteJWCK1mxdLcDhxsYLxjkXG5k8RPD6gxcm2jq4UJ5QH0l3dN7AiQokj1uUi5YFodG5b5ENtHKCDdcu/gXGT1PSh48F9yH76IOCvWdA1X4swTt1UiXsyZVSB9TDYXtUqmBSZsmm/R9nr2nuRYw5KzQ7FFx2yrGeyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7018.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(8936002)(2616005)(26005)(6916009)(66946007)(66556008)(83380400001)(66476007)(31686004)(86362001)(31696002)(2906002)(36756003)(6506007)(6666004)(41300700001)(44832011)(478600001)(6512007)(316002)(6486002)(8676002)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGNQY3k1Zjl6WGVNU2ZwRThnQmFXSnpiZ0hVeWVBajcyeWhrQ2Z4RllNTDQy?=
 =?utf-8?B?VG5yOTl6c1RSTVJrVW16ZGVEOWsySE1oeHM4RTVZRVBxREhRT0Fxc29DZ3I0?=
 =?utf-8?B?bFZQZHFNRWFLUEVDZjZhbmwyS3c0bFhoMkkvVVIwWnRidlY1VVFZM0l1UmY1?=
 =?utf-8?B?TVFZbmVuUmNSZmlaYUFKRlduK2tVV0FTcVNGdGd1MGZMeEs1ZSsyVEJrbVor?=
 =?utf-8?B?OXRadklJNVloWmVodFpkRTNBcmFHT2Y0OVlhRVVtUlhPaFFrM3gvOE4wVmpw?=
 =?utf-8?B?UmZmeFIyVy8zN0hsT0VhdkhxYlRVdk9WUnNib1pHNUtuRHZ1Tk1kVHA2Uys4?=
 =?utf-8?B?dmhWaW1RQTRaQUdiQzRZbTVmUXc0MWJXSjFkeFoxeUlTN3RwMTdKZ3h0KzJQ?=
 =?utf-8?B?dG1JbXJQVXdkK29tYUxXOEhzTHFsNnQ2R1ZMZVVpK0dnNkZBenVBNm1pcENi?=
 =?utf-8?B?SkJ4RG93akgzK0p2S2FyZnJlMythekM5OTV2dUQ4K3dUc1EwMFBUUi8rU21J?=
 =?utf-8?B?a3RXaDcvbkpDLzI2b1FBUDRYcHJ6Z2VGUmhxb2M2ZlA1ZFpSd2x4VVFxMkRn?=
 =?utf-8?B?ZTJhRVZUd0tGdUFReFY0QWQ5TU4zWVRBbVpaZ2hac0c5KzNjUTdxYnlwOXdi?=
 =?utf-8?B?QmRkdzV3M2YxQmIvd1dpSHRSYUkrYmlRTjNXSFhjcVdHNWpBejN2dURmZzV6?=
 =?utf-8?B?b09mZm15VENCdjlvbmZKYW9sWU0rSXRaVllOUWNJakd1WU9DZ3dSaG1KcWlv?=
 =?utf-8?B?VXduM0VrMjM0Y01QamZ4RG5Zc0ExekFFNVEzdWNEMGRQaTVkaUlQVUd2LzBV?=
 =?utf-8?B?aTBibHFoNWE5bUdqV0hYYlcveC95SzVyNnpSZGFWN21MU0VLT1BaSHZod1Ju?=
 =?utf-8?B?dlpUNTFUM1JqR2x4eXhFcTQzU1I1MGtxb2w0VXUrMytWNlU5bFh1VFZmVjBt?=
 =?utf-8?B?YmVaOVZsb0dKUUxBL3ZnZ3JPMmw2L1dpaW5yajVFZythWnlxcHI2Y2o5SHFV?=
 =?utf-8?B?ajZXazlXVEZXWWpVWXFXOEFmVU45bk0rY2dLSm9nVTF3dzdKN0cvVVoxSDBU?=
 =?utf-8?B?c0FvTlc5TThlWHVYZGNPVWh4UWQ3dk8zaCtWbXF0N2tVZlZzOFVLMGUxWG52?=
 =?utf-8?B?Wi9rbnBMamRyNkRCaUxvUE0yMCsrRGxPaUlUTUxpcE01bzZnSldqZExsY1d4?=
 =?utf-8?B?SkxlNGhyY1dGbUkyWmVJdW1YakVuRkw3NFA4VW5hV1dvMk1hc1RYREJ2ckNO?=
 =?utf-8?B?N0t2MlhEUHJiWGh1UzNGdWswNlNldUIzcmlDRFVYbjdDRXNoRTA1VHlOMUhl?=
 =?utf-8?B?T0pPWUFmRWhVMS9RT3o5YmdXNms5MGR6ODFCblVubTFqMnpIRWRMSFIrMW9a?=
 =?utf-8?B?b2JXVDdkOVd2ejFNREVmcXhLNldrVERRWWRiWUlWMlVOdGxPNEpWQzZBZDRE?=
 =?utf-8?B?VUNKWVZIV2VXQ0cvOUl5WTN0UnhQWmFMRWw4UlJidGpjeXhvT1J3S0U4WVE2?=
 =?utf-8?B?R2RJRVNWbWJtdnV5VmZ3aFZ4MUwwQ2JERFJPS0U0VlVNbHNTTURoSnNuS2lF?=
 =?utf-8?B?cU9PRFczNTlUWEdFbmN1VTlnKzZVZnVFZnRxMk01NCtsalE3ekwrYlltVnR1?=
 =?utf-8?B?czlER2pvUkwxTXFhd1FQR3ZMUmJENTAzbDRobU1pWDBFeGFyeThNaEUraXZN?=
 =?utf-8?B?ZGlMSUlBOWRqc2hzVzkveFdVUlJES25WZllPTHU4RWFVRkhJVDZaaXFoYlBo?=
 =?utf-8?B?ckhVVzlsS2lQZ0FUYWJ0ZFdlNVNWd2czWGtseTVjSmN0WVZKc2dFdU02RTk1?=
 =?utf-8?B?S2NhWUJ5blBYNEtqQWhsWUM2N1NqdVdZNGZjYzdCNFlRbVR3VFZkeVkzSWlC?=
 =?utf-8?B?NlZxTDVFaklWNVFlTko5cU9PQzRZY2FOZHVDWGZFNzFyeVdsajdSaHRPRmFR?=
 =?utf-8?B?NkJNbmY3MnZGUC9zYXU5YUtmcnRzQldBOHZlMklPaWFHODBRS0sray8vNDYy?=
 =?utf-8?B?RFA0YWpURGxnMmp1eUFHTlZoZTJjRXEyRVVYL05VaUIvMnI2TXN6YVpmS1Nq?=
 =?utf-8?B?M1F4dE5zVGVWUVNuWGc0Q0VTWnRwcDlzMUVqSUlwWUw1NStndTVrZ1RVa0E1?=
 =?utf-8?Q?JxX+9psn2BhpArzCR1vgmZT0W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10d2511-adc2-4508-faa8-08dbcde083fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7018.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 00:40:37.6776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLMU/JamlMQIJyGLERjVZi1/8aSEggQy+8S/L2zmnNN/TLLDBJPRyEZ5jrb7p/I/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 00:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189254

Running a number of builds recently, a small number of them failed.  Note we ran about 20 builds and only 3 failed like this, the others completed.  I'm wondering if maybe there is a race condition with the new code?

Error:

ERROR: depmodwrapper-cross-1.0-r0 do_patch: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
0001:
*** 0002:do_qa_patch(d)
0003:
File: '/scratch/jenkins-BUILDS-eSDK-dev_eSDK-eSDK-master-next-pipeline-8_ZynqMpDrFull/sources/poky/meta/classes-global/insane.bbclass', lineno: 1379, function: do_qa_patch
1375:    elif os.path.exists(os.path.join(srcdir, "t")) and any(filename.endswith('.t') for filename in os.listdir(os.path.join(srcdir, 't'))):
1376:        oe.qa.handle_error("unimplemented-ptest", "%s: perl Test:: based tests detected" % d.getVar('PN'), d)
1377:
1378:    # Detect pytest-based tests
*** 1379:    elif match_line_in_files(srcdir, "**/*.py", r'\s*(?:import\s*pytest|from\s*pytest)'):
1380:        oe.qa.handle_error("unimplemented-ptest", "%s: pytest-based tests detected" % d.getVar('PN'), d)
1381:
1382:    # Detect meson-based tests
1383:    elif os.path.exists(os.path.join(srcdir, "meson.build")) and match_line_in_files(srcdir, "**/meson.build", r'\s*test\s*\('):
File: '/scratch/jenkins-BUILDS-eSDK-dev_eSDK-eSDK-master-next-pipeline-8_ZynqMpDrFull/sources/poky/meta/classes-global/insane.bbclass', lineno: 1357, function: match_line_in_files
1353:    ###########################################################################
1354:    def match_line_in_files(toplevel, filename_glob, line_regex):
1355:        import pathlib
1356:        toppath = pathlib.Path(toplevel)
*** 1357:        for entry in toppath.glob(filename_glob):
1358:            try:
1359:                with open(entry, 'r', encoding='utf-8', errors='ignore') as f:
1360:                    for line in f.readlines():
1361:                        if re.match(line_regex, line):
File: '/usr/lib/python3.10/pathlib.py', lineno: 1034, function: glob
1030:        drv, root, pattern_parts = self._flavour.parse_parts((pattern,))
1031:        if drv or root:
1032:            raise NotImplementedError("Non-relative patterns are unsupported")
1033:        selector = _make_selector(tuple(pattern_parts), self._flavour)
*** 1034:        for p in selector.select_from(self):
1035:            yield p
1036:
1037:    def rglob(self, pattern):
1038:        """Recursively yield all existing files (of any kind, including
File: '/usr/lib/python3.10/pathlib.py', lineno: 493, function: _select_from
0489:            yielded = set()
0490:            try:
0491:                successor_select = self.successor._select_from
0492:                for starting_point in self._iterate_directories(parent_path, is_dir, scandir):
*** 0493:                    for p in successor_select(starting_point, is_dir, exists, scandir):
0494:                        if p not in yielded:
0495:                            yield p
0496:                            yielded.add(p)
0497:            finally:
File: '/usr/lib/python3.10/pathlib.py', lineno: 440, function: _select_from
0436:        _Selector.__init__(self, child_parts, flavour)
0437:
0438:    def _select_from(self, parent_path, is_dir, exists, scandir):
0439:        try:
*** 0440:            with scandir(parent_path) as scandir_it:
0441:                entries = list(scandir_it)
0442:            for entry in entries:
0443:                if self.dironly:
0444:                    try:
Exception: FileNotFoundError: [Errno 2] No such file or directory: '/scratch/jenkins-BUILDS-eSDK-dev_eSDK-eSDK-master-next-pipeline-8_ZynqMpDrFull/build/tmp/work/zynqmp_generic-xilinx-linux/depmodwrapper-cross/1.0/sstate-build-create_spdx'

ERROR: Logfile of failure stored in: /scratch/jenkins-BUILDS-eSDK-dev_eSDK-eSDK-master-next-pipeline-8_ZynqMpDrFull/build/tmp/work/zynqmp_generic-xilinx-linux/depmodwrapper-cross/1.0/temp/log.do_patch.1966488

