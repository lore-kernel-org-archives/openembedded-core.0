Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C41DCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 20:25:41 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.24459.1758745533872623754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 13:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=jxcUPjBn;
 spf=pass (domain: baylibre.com, ip: 209.85.222.193, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-85630d17586so37884785a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 13:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758745533; x=1759350333; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mvDkw3McO4L2JB8O5GQPNtuahm8GLVhmupt+T4Stnbs=;
        b=jxcUPjBnKTqRUlqpvVjksVdX5P7JDBWAF8U8Lejzi9CNjvsFhgQeGV4VppF1igIt46
         LHtt+WIQCj5m5phS+6lWxCAT/hEa5de0o6PEENcsKTjPEJbDAKhH5pyjLVbDJzVKOiKv
         WclvHbx8fwh44AMf3atNZGWw24b9TQPIOl3UiaEq7Vo7tRc4jCmp3EJgXXzeFROar6on
         2iSsNNwfv83w7SUgPdc1cqESoz015frwnANtgY4Yve54752m/kMoTmy5+Xowz9flStch
         8YqoRkzbayQ4XLEDrH5RV8+TCP0EIUVRUA7gGKGLC0UDsKcYITmBAAT/haPXEvSPkGj6
         Vtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758745533; x=1759350333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvDkw3McO4L2JB8O5GQPNtuahm8GLVhmupt+T4Stnbs=;
        b=gQCikBA/YCo77sfytuoa5qOyJ4VnPJF7PiItjklbWO7E40v5KfJ7/s9sUd4lMeL26h
         uE1baaYRFgkhOytdo80EALbqUColzrDnphN8LykfQ4TNT6/VB29yd/GA4ogaJkWbNr2k
         eO5Cx2Qb6CrUuEKM9r0bs/q+N3coIwf+cVnqMKa8r5CkuP9tSReRLxuiyIIYBVxwK8mV
         2nsn5I8g5ZQh7GqDFZ5GYamZyQVTnnBUDSn+67U/JchN2hdO1jR8uOusvJD6VpK+vXjK
         Q+JekMaFBlpYGthMPclAH7gKrdG0DEsKAywl/4QOntBThRLAWINgJVXUgtZzmpEfRAWl
         Xx6g==
X-Forwarded-Encrypted: i=1; AJvYcCWlz3wMVHOKUGtyn51Tv5SaUpx76crafZZvknf8CuPIux3ncTH2I6QZ+J19Mrqgl4uvMj9RgSzkn5Fuw5KcKnoi9w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxBe6pZOPYLKWYg1XqtbOMnbd+BM0VCMfgTsaUFTR/crZkKtByt
	9FrE5sbKDTxSD3YeGN3GaEdfjo5MXf6QKeIrhpPo3hUmrlanrv87mNk2OsbIu0BVMD0=
X-Gm-Gg: ASbGncufk7CPdA64PPcm3tC+jc7vc4cEfyFnc+gXjk2UaqdBAJkzrwzH894mUWGlVVg
	TyZkZU6HYy3KA1lm+rPkVS9up4V3uBg+pfaz3BtXKFOMYbuI9PD7+nu59qXJWsmfasHZQ342EQ8
	BiYMMN5hKaFO6rnbXHOo16D+OaHE+Pv5bCoTI0NSnOVkv0rcMWrO8K7CMj9z5avjnPG76PB02dG
	mmRmbPfZd8RJoLj/I3qLuGBEmZ+i+x0bB6tyuZlGMDfdQu5RrRH4m8mNR/LPmo9xIEH0ijrlHqr
	nP5R9/oazxgePyWGe0HMxxIlUPtQMRu7cquADGFHMcRmRl28SN1oSY7pNaCjX3C1T+CHOGvJ+8I
	5+LFrz99rAFYNThLcZcGsL2GqvYWtVWwNiK3dGyytDtGQjxnoEdGgTpNFex9qONJBtLw=
X-Google-Smtp-Source: AGHT+IEzmbWnrrojH2QW7w/qT2iJjLXpmJCPVSvgWzeLvUng3sc3p53RKNH2e43YE+BKYTz0g03u8w==
X-Received: by 2002:a05:620a:3182:b0:7fe:9d98:4806 with SMTP id af79cd13be357-85aebd00f0bmr138227785a.59.1758745532730;
        Wed, 24 Sep 2025 13:25:32 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85bc981457fsm7392485a.56.2025.09.24.13.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 13:25:32 -0700 (PDT)
Message-ID: <5dab2d28-4a15-491c-bb12-623a37f9a72c@baylibre.com>
Date: Wed, 24 Sep 2025 16:25:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] patchtest: Use raw strings for regex patterns
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20250924-minor-fixes-v1-0-affc85657a66@pbarker.dev>
 <20250924-minor-fixes-v1-2-affc85657a66@pbarker.dev>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20250924-minor-fixes-v1-2-affc85657a66@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 20:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223988


On 2025-09-24 15:57, Paul Barker wrote:
> This fixes several 'SyntaxWarning: invalid escape sequence' messages
> printed when running patchtest.
>
> Cc: Trevor Gamblin <tgamblin@baylibre.com>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
Thanks for this! LGTM.
> ---
>   meta/lib/patchtest/patchtest_patterns.py | 20 ++++++++++----------
>   meta/lib/patchtest/tests/test_mbox.py    |  4 ++--
>   2 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/meta/lib/patchtest/patchtest_patterns.py b/meta/lib/patchtest/patchtest_patterns.py
> index 655ecfd049191b9b5e1990c31ad1bb7c96811fa6..1a8db92aa5372c481164604c0dee2c2367c9fd87 100644
> --- a/meta/lib/patchtest/patchtest_patterns.py
> +++ b/meta/lib/patchtest/patchtest_patterns.py
> @@ -33,7 +33,7 @@ closed   = 'CLOSED'
>   lictag_re  = pyparsing.AtLineStart("License-Update:")
>   lic_chksum_added = pyparsing.AtLineStart("+" + metadata_chksum)
>   lic_chksum_removed = pyparsing.AtLineStart("-" + metadata_chksum)
> -add_mark = pyparsing.Regex('\\+ ')
> +add_mark = pyparsing.Regex(r'\+ ')
>   patch_max_line_length = 200
>   metadata_src_uri = "SRC_URI"
>   metadata_summary = "SUMMARY"
> @@ -51,20 +51,20 @@ auh_email = 'auh@yoctoproject.org'
>   
>   invalid_submitters = [pyparsing.Regex("^Upgrade Helper.+"),
>               pyparsing.Regex(auh_email),
> -            pyparsing.Regex("uh@not\.set"),
> -            pyparsing.Regex("\S+@example\.com")]
> +            pyparsing.Regex(r"uh@not\.set"),
> +            pyparsing.Regex(r"\S+@example\.com")]
>   
> -mbox_bugzilla = pyparsing.Regex('\[\s?YOCTO.*\]')
> -mbox_bugzilla_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
> -mbox_revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
> +mbox_bugzilla = pyparsing.Regex(r'\[\s?YOCTO.*\]')
> +mbox_bugzilla_validation = pyparsing.Regex(r'\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
> +mbox_revert_shortlog_regex = pyparsing.Regex(r'Revert\s+".*"')
>   mbox_shortlog_maxlength = 90
>   # based on https://stackoverflow.com/questions/30281026/regex-parsing-github-usernames-javascript
> -mbox_github_username = pyparsing.Regex('\B(?<!\${)@([a-z0-9](?:-(?=[a-z0-9])|[a-z0-9]){0,38}(?<=[a-z0-9]))')
> +mbox_github_username = pyparsing.Regex(r'\B(?<!\${)@([a-z0-9](?:-(?=[a-z0-9])|[a-z0-9]){0,38}(?<=[a-z0-9]))')
>   
>   # patch
>   
> -cve = pyparsing.Regex("CVE\-\d{4}\-\d+")
> -cve_payload_tag = pyparsing.Regex("\+CVE:(\s+CVE\-\d{4}\-\d+)+")
> +cve = pyparsing.Regex(r"CVE\-\d{4}\-\d+")
> +cve_payload_tag = pyparsing.Regex(r"\+CVE:(\s+CVE\-\d{4}\-\d+)+")
>   upstream_status_regex = pyparsing.AtLineStart("+" + "Upstream-Status")
>   
>   # shortlog
> @@ -78,7 +78,7 @@ shortlog = line_start + shortlog_target + colon + shortlog_summary + line_end
>   email_pattern = pyparsing.Regex(r"(?P<user>[A-Za-z0-9._%+-]+)@(?P<hostname>[A-Za-z0-9.-]+)\.(?P<domain>[A-Za-z]{2,})")
>   
>   signed_off_by_prefix = pyparsing.Literal("Signed-off-by:")
> -signed_off_by_name = pyparsing.Regex('\S+.*(?= <)')
> +signed_off_by_name = pyparsing.Regex(r'\S+.*(?= <)')
>   signed_off_by_email = lessthan + email_pattern + greaterthan
>   signed_off_by = pyparsing.AtLineStart(signed_off_by_prefix + signed_off_by_name + signed_off_by_email)
>   patch_signed_off_by = pyparsing.AtLineStart("+" + signed_off_by_prefix + signed_off_by_name + signed_off_by_email)
> diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
> index 714c9b30af5c7ad705079a67903e038354de0195..5cf02af7bd5e761ed3f08254897861ec401841b8 100644
> --- a/meta/lib/patchtest/tests/test_mbox.py
> +++ b/meta/lib/patchtest/tests/test_mbox.py
> @@ -71,7 +71,7 @@ class TestMbox(base.Base):
>       def test_shortlog_length(self):
>           for commit in self.commits:
>               # no reason to re-check on revert shortlogs
> -            shortlog = re.sub('^(\[.*?\])+ ', '', commit.shortlog)
> +            shortlog = re.sub(r'^(\[.*?\])+ ', '', commit.shortlog)
>               if shortlog.startswith('Revert "'):
>                   continue
>               l = len(shortlog)
> @@ -109,7 +109,7 @@ class TestMbox(base.Base):
>   
>           # a meta project may be indicted in the message subject, if this is the case, just fail
>           # TODO: there may be other project with no-meta prefix, we also need to detect these
> -        project_regex = pyparsing.Regex("\[(?P<project>meta-.+)\]")
> +        project_regex = pyparsing.Regex(r"\[(?P<project>meta-.+)\]")
>           for commit in self.commits:
>               match = project_regex.search_string(commit.subject)
>               if match:
>

