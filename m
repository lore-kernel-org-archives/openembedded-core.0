Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7820C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 16:46:53 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.64])
 by mx.groups.io with SMTP id smtpd.web09.14647.1635353212279954091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 09:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=RFtO1L9Q;
 spf=pass (domain: outlook.com, ip: 40.92.73.64,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKHzrdSoehgfqwKxFUx0Ln6DBqx256oBMLN7pjc2frF5dSc9B+4Cjz5KEnWaLj7OVAGkhdRhM7+6tvGhXcQWxUysqYKUrrNny2Lau5rFqIb2/A7vk/DwBv/ckFbVDzilDJloyTPDgf6dHO/y5mMPPHN0yjEqUEz8iUI0rjDTdL9HwXVs+ZYSNWRhTgHbjDY7MtTSAtHeB9cxEZMfdAmvZrtqKtxxo+busIoMUIKjotsimic5hQdd5yokKscJZU4tvOPpcN2O+0dhsYZCtg6tn152gmzkhauJhKi6q18OaTqwksDHpEjric10Z4YjLzBVsfo+81ySGW5Ej/wIJDie6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6u2xJcuzYoNE6CknXBINlfY8Fekq6MCpZG0kftaPe0=;
 b=KNFuvHdC+j4f2GY+E77freEVWQM6LIiASmr1lPy4/msMQXfVgXq4+0paU2wfvXA0id8d1h+6xm/JrMdHGrZgARAr9viEwMUJq849XU3nQY4ZvhkdVY2xbhDCgQ+RolM/uO0JQXj1UnEnx8TkRlAAacoTsOMOx1DId+KW3plH3oLEnJ0sjC8S9ivRtDVzXvW/i0owZeiM+zxtC1yoFDGLT+b1lUGKyNZibLB1VZKujC1YkVkXxFqXujtMGkoZ6axT6/d6u1YVNl263of0P5fyHsdIY60oCJMa2pkI4j2gJ8sMZUjUtIpjEGHgd6rK2fGh1f5FJcY0sIA13IIYebiqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6u2xJcuzYoNE6CknXBINlfY8Fekq6MCpZG0kftaPe0=;
 b=RFtO1L9QIi7LZ+eYJJT3PhLtNAleloHE7zZeKn/gaY7E2y/H/BYSa4LO0kosp965HOtLzOaMZwNXMcG0abzZyJkRlTNQ4NjpM/gYEx2XuZ7mp6+w/Eg3snXVmiKQOhCM83J+Db4sYVaMsc5npmjiNTCaOyxgWDX/srarAsRtMLpQ7prO3jagyH7pFM0tZGczmnfwxdOvoschqmaC2OlaNu5a2nkMA06zLT3j8W8XDBzXRuuuyWSP49Psouoi782Bw0U+nfA4sDobHu1mMP844gUeWobhq+h7ROcHz9BLL1g2LC/fj6sJUUqcglIY7xoVPln1cG3VI+d1YJnJ4FFX0w==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1826.eurprd09.prod.outlook.com (2603:10a6:200:8e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 16:46:49 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4649.015; Wed, 27 Oct 2021
 16:46:49 +0000
Subject: Re: [OE-core] [PATCH 2/2] insane.bbclass: Add a check for directories
 that are expected to be empty
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 openembedded-core@lists.openembedded.org
References: <20211027163713.17300-1-pkj@axis.com>
 <20211027163713.17300-2-pkj@axis.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46420F4FE77AC14153F37FDAA8859@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 27 Oct 2021 18:46:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211027163713.17300-2-pkj@axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [Ne6DGW4omzbt3yjy2b4Ux8UUkWIAPfsgDQa+RIOyr0x9JqWC3I2wRANARX1eatNI]
X-ClientProxiedBy: AM0PR03CA0058.eurprd03.prod.outlook.com (2603:10a6:208::35)
 To AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <6458bde3-426f-6f09-fe18-3a8d62be97a3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM0PR03CA0058.eurprd03.prod.outlook.com (2603:10a6:208::35) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 27 Oct 2021 16:46:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee7ed8a3-ba19-48b6-b300-08d999695de4
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1826:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4r/8A0bOvFEj1ia8NvhW+O1ImE4TadhMl4H8MguxuxOfP6OtcD6ZA95l0DgitMQ1O9IcSNtg2ChihXdiON1MtB6acTkczelN987h1CxZqCgkv5PygzWhGcBw4VwbvICmG74JQicoq+iaIKEqwZqbyfNQNQrOEObbsC4foVFm0vuAnlYTToStdOlGKRYNJX0QRpHQPKfXu7RDvtpcminsd5s9cIEENsG1OXNgIlowceE1TuaprMHkwBobHvYPzNhltmpzbtRlrTNITbM1kHyfYmacX1LtXAovlDoTaVI6LdK8P7ZN7q+whJfX6Q7C1ZpfzajCttx2QEyo4sbMdDu5GQkgCyDqVVwA0hQb8NiRaTyzCYVA5EWKIXiXa99hUgkGtB7h+Fowj7G6s9gq3bh0r5zqTXZ8SuJ1VmFAJ9YsIWDTBRBWGtxWgO2vlXvACoxzzXGpGMBHMoRpa62mEo19KK0MRPnKyduhzuGNHmphlMpABviAVm0h0dm1QxRRMvmrHxkJwGnlQrJ1LrktuJe0yONPRbRo8vItDU74AW65GZn2qxoFKY+tny8FRta3/7kMl6Zy/tpx9iNVgvRBpLa994JPvMABO9Hdet2mSybsE/+82+HUFBxQvB+OQJSK88pC
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bpJWGljKhXYwdT+YTKzBRuxMStmQQWtM9BDpTuqNikEKRZWpWKfGLcIZX+7FZtZqsjIjLpFfPfQ4Rvsb9ffJXInGHVQ1YWh/5ONDMbgNxCKuCTEbjCE65vH9IoOdBV7drQ8QgzkLcQ61+0E7ZlIahaq0pHEf1PRk4O4OV8LWjkZ3Ef2j7TY6kxtOjLJVWX3IIl+0Xm+3PS8tEeouCNO+7oQYCsxO0qW9vaMXEJ/aNc1NGDStLTGEsnLYboSIlz0Lpf+JGanTLhYJpG/zdIuPehd+9D3CUTdwM/Fly1KcCui7yqtp3ZgaLdeI8znKNLzFnnSm28AtcaxE04EjjG8GpI9jfiV+TJhx5ARhodOOHiNrr1VWYqHJw1uhP3kiPGqjr4Owwjs8KYpKTl2T4DdjhAB6g4yOvLEvkbm/iPZlmszt8bQ9XjYNCS/jr1qNAG9giR5QphmZA4VriqHzKteGJ77Ij9RHamo3VwKJ5awUCAtfdfLnwfklXO88xEJ+7Yt501unb65a53OGSPkH0PHNk3+c8N2JTwoLo04OhGbQvHlJqcd8wLRYhjdwhxa1aSR0Kvmj5d0Q9+DF9fMEOYHX117q//a0LbI70oXBEFm2RDHP9APIh9AIC//9GFE6xK4R5YkGGnbrNpSp8pOl5uE+/KbXG6RDRqc0eL8Sj/M/Vseqc3wVz8R+tJuhq+H6Ila2lqA+Sz76YCrJWe3AjvNzJWARhoJqgz+QUl5UpW+czsUMz7tII9TZdUlD9P6pHC1EZjoZiYUkwRKsK2+CW/kpGw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ee7ed8a3-ba19-48b6-b300-08d999695de4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 16:46:49.1271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 16:46:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157558

Thanks for the patch, that looks like a better approach to me than the 
previously suggested

On 27.10.21 18:37, Peter Kjellerstedt wrote:
> The empty-dirs QA check verifies that all directories specified in
> QA_EMPTY_DIRS are empty. It is possible to specify why a directory is
> expected to be empty by defining QA_EMPTY_DIRS_RECOMMENDATION:<path>,
> which will then be included in the error message if the directory is
> not empty. If it is not specified for a directory, then "but it is
> expected to be empty" will be used.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>   meta/classes/insane.bbclass  | 33 ++++++++++++++++++++++++++++++++-
>   meta/conf/documentation.conf |  2 ++
>   2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 1e2f1b768a..1675adf6ac 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -37,7 +37,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>               configure-gettext perllocalpod shebang-size \
>               already-stripped installed-vs-shipped ldflags compile-host-path \
>               install-host-path pn-overrides unknown-configure-option \
> -            useless-rpaths rpaths staticdev \
> +            useless-rpaths rpaths staticdev empty-dirs \
>               "
>   # Add usrmerge QA check based on distro feature
>   ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
> @@ -50,6 +50,21 @@ ALL_QA = "${WARN_QA} ${ERROR_QA}"
>   
>   UNKNOWN_CONFIGURE_WHITELIST ?= "--enable-nls --disable-nls --disable-silent-rules --disable-dependency-tracking --with-libtool-sysroot --disable-static"
>   
> +# This is a list of directories that are expected to be empty.
> +QA_EMPTY_DIRS ?= " \
> +    /dev/pts \

Not sure why just /dev/pts should be empty, IMHO all of /dev shouldn't 
be prepopulated at build time

> +    /media \
> +    /proc \
> +    /run \
> +    /tmp \
> +    ${localstatedir}/run \
> +    ${localstatedir}/volatile \
> +"
> +# It is possible to specify why a directory is expected to be empty by defining
> +# QA_EMPTY_DIRS_RECOMMENDATION:<path>, which will then be included in the error
> +# message if the directory is not empty. If it is not specified for a directory,
> +# then "but it is expected to be empty" will be used.
> +
>   def package_qa_clean_path(path, d, pkg=None):
>       """
>       Remove redundant paths from the path for display.  If pkg isn't set then
> @@ -885,6 +900,22 @@ def package_qa_check_unlisted_pkg_lics(package, d, messages):
>                              "listed in LICENSE" % (package, ' '.join(unlisted)))
>       return False
>   
> +QAPKGTEST[empty-dirs] = "package_qa_check_empty_dirs"
> +def package_qa_check_empty_dirs(pkg, d, messages):
> +    """
> +    Check for the existence of files in directories that are expected to be
> +    empty.
> +    """
> +
> +    pkgd = oe.path.join(d.getVar('PKGDEST'), pkg)
> +    for dir in (d.getVar('QA_EMPTY_DIRS') or "").split():
> +        empty_dir = oe.path.join(pkgd, dir)
> +        if os.path.exists(empty_dir) and os.listdir(empty_dir):
> +            recommendation = (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' + dir) or
> +                              "but it is expected to be empty")
> +            msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
> +            oe.qa.add_message(messages, "empty-dirs", msg)
> +
>   def package_qa_check_encoding(keys, encode, d):
>       def check_encoding(key, enc):
>           sane = True
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 80ad8e10d5..45cd01374a 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -345,6 +345,8 @@ PYPI_SRC_URI[doc] = "The URI to use to fetch from pypi, default uses pythonhoste
>   
>   #Q
>   
> +QA_EMPTY_DIRS[doc] = "A list of directories that are expected to be empty."
> +QA_EMPTY_DIRS_RECOMMENDATION[doc] = "This specifies a recommendation for a directory why it must be empty, which will be included in the error message if the directory is not empty."
>   QMAKE_PROFILES[doc] = "Specifies your own subset of .pro files to be built for use with qmake."
>   
>   #R
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157556): https://lists.openembedded.org/g/openembedded-core/message/157556
> Mute This Topic: https://lists.openembedded.org/mt/86632212/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

