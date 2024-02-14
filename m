Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71852C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 14:08:32 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.41767.1707919702052416023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 06:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=BEFDubHK;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-42dc65d1ce0so581191cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 06:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707919701; x=1708524501; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ue7sdzd1o1FquNTrE8SkQvSTf3ZlfPvRZPQNmrnS74=;
        b=BEFDubHK4EDzqnWXJBBeMVfNC1DJMLYbKAcKYFRBZO/kkcAhwGhQMqrN2bPZfSzgfr
         tmRj3G7L/X73AAyxQEXRKMOHtD4TfUZBmulXaauBBrLM2XKaIGDsgnNsf1pYF7ypCmec
         FMy82RS02hR1+n/OkW3mXd0UGOzYGSDzNPIOeVrt/2ZQHCinuSKJwo8siNG3fAEvsSL0
         /eLWtm35v3deH+kG74aMAHsDmN280WKEmongQwcLrWgYM/wb15EBzije7t+ZEe76v4U8
         sDgx6h5v2Zx+UMlT9BcgCwVa34+GE1qm0HADPFMdX6zK7I/ybfeecwFzG64mSbZA44IW
         N7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919701; x=1708524501;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ue7sdzd1o1FquNTrE8SkQvSTf3ZlfPvRZPQNmrnS74=;
        b=GamYrkYbzIZeF9ZheSclw+p9ZW4/4sJEQb3NW0yAuQa74cTNnmm3qiDxE6IDac3mgd
         HNTQ2z1vGpk0QSe6s8JwOq65lrqXLBi/rnHAUszCoFqeTz2L7fNSW0LhGE1aAwHQjOmE
         50Qm0H5Md+yoqHoCOXEYAqKW3Gi6nYgAPaZ0U8xpOnXGpc+VQ5gtuCalcwnSizRH77fF
         RIrK5OrnPd1j7Z74LY+KpRhaHiBYvzKOzwEzEkr7dmRnxBAsAAO+w5Q0tsot6VeuQa4R
         46cOWqSCk6NqL6dxxSfRx3iWgNetsjbVTLkrzCEkL13iptGLT99tD5/3WIlg1BsbUwxC
         fEpw==
X-Forwarded-Encrypted: i=1; AJvYcCVrM1Yfg5uyfDNKQyS3qwsUcmnPBQBLfYbt8vyTrsjnJe7Pdap1kksd9AYlkJ8qVC5T20afBtjyUhK4vIwEW8Y8Erp/Z9M0sZXV289OkbWd2PzvBjEAfawB
X-Gm-Message-State: AOJu0YwL3qV1KuBwn9u1xsZ1wpbxm/2kbSSsdNWLFSo0DkC5oFZ/4XUs
	pQ21bdx/HSUY546bALM8pd6KXjm9+8vb0k7QRagNQCuWsC9WXSbjIB8P3PLhRszJBc1TahiSpoK
	z
X-Google-Smtp-Source: AGHT+IGWSoiTCgEZm0s0PEyFJsABR9/J/eQMcnnIhTOH5ibjdF5P/YcCEiHzqeYLUWfzWuLZfX4S/Q==
X-Received: by 2002:a05:622a:243:b0:42c:7bef:c3bc with SMTP id c3-20020a05622a024300b0042c7befc3bcmr2900411qtx.53.1707919700987;
        Wed, 14 Feb 2024 06:08:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXNHpRNujr8hVJuVsCG5Z85w+pHFwkqtaLIQ06q7GdpvBCdtzRcGaM8OBiPDlUyJvoggTGQAgAjn/kcTLThXsAjj+y05rytPcvii7Fbf7v2Jqu/wKOwDPT
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d26-20020ac851da000000b00427ee66bec1sm2043559qtn.48.2024.02.14.06.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 06:08:20 -0800 (PST)
Message-ID: <3d6a8438-27c2-42be-a039-30ae3e610cd1@baylibre.com>
Date: Wed, 14 Feb 2024 09:08:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] patchtest: log errors and failures at end
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>,
 openembedded-core@lists.openembedded.org
References: <20240213205247.49342-1-simone.p.weiss@posteo.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20240213205247.49342-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 14:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195478


On 2024-02-13 15:52, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> At the moment, running patchtest locally will only print failures and errors
> to the log when the not passing test case is executed. This might lead to
> people overlooking issues with their patches, so print a log line at the
> end if testcases showed issues. This should make it more easy to spot then
> before.
>
> Fixes [YOCTO #15389]

This is a good idea, but it makes the log look messier than I expected 
(here's an example where I'm testing against a selftest you added recently):

Summary: There was 1 WARNING message.
FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and should 
be replaced by CVE_STATUS (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test lic files chksum modified not mentioned 
(test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test 
(test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test 
(test_metadata.TestMetadata.test_license_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test src uri left files 
(test_metadata.TestMetadata.test_src_uri_left_files)
SKIP: test summary presence: No added recipes, skipping test 
(test_metadata.TestMetadata.test_summary_presence)
SKIP: test CVE tag format: No new CVE patches introduced 
(test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced 
(test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced 
(test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test pylint: No python related patches, skipping test 
(test_python_pylint.PyLint.test_pylint)
----------------------------------------------------------------------
Ran 21 tests in 20.416s

OK
----------------------------------------------------------------------

FAIL: patchtest: At least one patchtest caused a failure or an error - 
please check
----------------------------------------------------------------------


The use of "FAIL" also means that patchtest-send-results will pick it up 
and put it in the list of failures, even though it's a warning about 
failures.

I wonder if it'd be better here to either use "WARNING:" instead of 
"FAIL:", or just shorten it to "patchtest: At least one patchtest caused 
a failure or an error - please check" since it will only be for the 
local case?

>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>   scripts/patchtest | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/patchtest b/scripts/patchtest
> index a1c824f7b7..7d4d4f51d3 100755
> --- a/scripts/patchtest
> +++ b/scripts/patchtest
> @@ -142,6 +142,8 @@ def _runner(resultklass, prefix=None):
>           logger.error(traceback.print_exc())
>           logger.error('patchtest: something went wrong')
>           return 1
> +    if result.test_failure or result.test_error:
> +        return 1
>   
>       return 0
>   
> @@ -158,9 +160,14 @@ def run(patch, logfile=None):
>       postmerge_resultklass = getResult(patch, True, logfile)
>       postmerge_result = _runner(postmerge_resultklass, 'test')
>   
> +    print('----------------------------------------------------------------------\n')
>       if premerge_result == 2 and postmerge_result == 2:
> -        logger.error('patchtest: any test cases found - did you specify the correct suite directory?')
> -
> +        logger.error('patchtest: Not any test cases found - did you specify the correct suite directory?')
> +    if premerge_result == 1 or postmerge_result == 1:
> +        logger.error('FAIL: patchtest: At least one patchtest caused a failure or an error - please check')
> +    else:
> +        logger.error('PASS: patchtest: All patchtests passed')
> +    print('----------------------------------------------------------------------\n')
>       return premerge_result or postmerge_result
>   
>   def main():
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195428): https://lists.openembedded.org/g/openembedded-core/message/195428
> Mute This Topic: https://lists.openembedded.org/mt/104341021/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

