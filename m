Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FAECA5FC1
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:52:58 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12421.1768931570537364771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=yG8cVa44;
 spf=pass (domain: baylibre.com, ip: 209.85.128.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47eddddcdcfso28034835e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768931569; x=1769536369; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/4zW5c+45sVjUF/JdNPGXdRJcRnH6atIFu1RhYsfdHk=;
        b=yG8cVa44bqcaNyYT17SPEjw19zHeamHJiHt9k6M7kgWOAQmDPesFs8iqGVGS7LQ3fB
         FBjKcLZtBmml0RJD8YEfRktrORtCf1qJsPTUZqmIRT22ZM1Arw+6+br/4saUzEHyp/7S
         06zEKGh5dqJudwyT6Qhmb1ZMb3CeytsiYWtKX/OpoESC2QEIym5D5ehUOYFZsmy96WaV
         8YJX+NBOImcge/02qOeS460IZfa5OClCmYkKnz3cgFerhdBSKI3IrJKt8W1ZMFuXrZYS
         TXozAfPhWyHJyVqBdcSdrv2Atfdh2IX+XRc8qToLfwr+XBOjmLhZ7hcesUD9afttZWbs
         lStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931569; x=1769536369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4zW5c+45sVjUF/JdNPGXdRJcRnH6atIFu1RhYsfdHk=;
        b=SFQ7k+YKm8DZdTpsaJ1jtL98PEV9haA99rRkBJnGJ0UOS4BYkqcAIXSkg1s9xyAwEw
         9sC38KRlhS4FpWALU1JxGJH1mCz2ux4Ucx96gE7hKEpTcjKJqBWcVZtHXAClkNmDacjH
         DCRhXtnLgTXnxngF/a6yVDXXJY9IBYz67mLofO3aFsdwyEPsyav14tDT5Q+SdePyGHGB
         vkbUkyoqJ5myh5G+kVMEJzCxVqO+B6wWckua2iYpwknBV05Q3HzMRxJuKkFs1wq1DCXu
         xbAigvc+vaajfr64//TH1qkMgyHXfL24IYr/koAZAKOJE7pVtiJI7hKBlK8RoE7hfMiH
         oOFA==
X-Forwarded-Encrypted: i=1; AJvYcCWKhZa+lgaLaeMJwM+oe9YjbSfvBFIbcrYA0Sr9gLHSR75JIDgkkQAKy83CCq0dtcNObZVssnmOcD/HuGK5MjKB5g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3s3yFR8eOJPQDoe0IYUSPyIUakJ+zFQyNzPebb0xti7SKzm9k
	dvG9cpOBfcZkORR+B9+VVKNP8YzYBsBUc0BTuZPpLsdr+kAFpvE5OV2M9hFYQ/QGrkQ=
X-Gm-Gg: AY/fxX46cxy29yGrPtSp6Zn18ik15zYkptsgNg5Bbx4JaY+BRzqCFnk/E0Dtut8a4Dd
	OsNpPPE/PuC7tlvDPnfeURXXiWCoWk/8TSTvN+CJxa9lXlGHaFs2hbd+r4AFkZ6sxkLMmUkeWTs
	17wgTlMW/VggQpfasVhl1b/lk3MXpWSQGmpEw0mPoyv378+SAq0L5i9nXOO0DqR+ch1clzKt/ph
	dG0q7gJDU3xeS8PqduoK+RBLDALCHGN80nilgFG+3k8K8Qxw4u78RdRZbBsiIvCmIPhxm/xXdmM
	1Sq4lcT9w8us8HZA+aVotQHnwnn77m0rKrwkXh9eu2XCnyU+ZMFpnnJ5maZYpn01JrKM43aTk5U
	oBu7Or+3vDJM//YRZX75W2nHsbXo98AA09Pn+pjWZ+Ccuqgk5kAED9g1YqqLjl+W2yusW59CTkH
	0dJ4th7qb3bt8znQK4ApFoUJhmm0mVKeqW98lDcOyUN6fQ71uYDokTVfWC1XbBDpqz
X-Received: by 2002:a05:600c:8b85:b0:47b:de05:aa28 with SMTP id 5b1f17b1804b1-4801eab1a91mr168416865e9.2.1768931568712;
        Tue, 20 Jan 2026 09:52:48 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm268415085e9.4.2026.01.20.09.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 09:52:48 -0800 (PST)
Message-ID: <7b0978c4-3e1c-4147-ad60-da683182ac17@baylibre.com>
Date: Tue, 20 Jan 2026 12:52:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][scarthgap 11/22] cups: allow
 unknown directives in conf files
To: yoann.congal@smile.fr, "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "patchtest@automation.yoctoproject.org"
 <patchtest@automation.yoctoproject.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <534f207c2869c6fbbef5d061607a28b6114c7a22.1768910519.git.yoann.congal@smile.fr>
 <0101019bdb562a2b-484d0628-8997-4935-86c3-0033faa83721-000000@us-west-2.amazonses.com>
 <AS1PR10MB56978D4AFCBC674510C81B86FD89A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMSfU+6qqthiP2bD0VSu4XVJKOutwLHy=O+sByC5LXqJN2X2yg@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMSfU+6qqthiP2bD0VSu4XVJKOutwLHy=O+sByC5LXqJN2X2yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229746


On 2026-01-20 07:59, Yoann Congal via lists.openembedded.org wrote:
>
>
> Le mar. 20 janv. 2026 à 13:21, Marko, Peter <Peter.Marko@siemens.com> 
> a écrit :
>
>     False positive as this does not fix CVE, only mentions CVE in
>     commit message.
>
>
> Thanks for the analysis :)
>
>     I'm wondering why this was sent now and not when I submitted the
>     patch.
>     In recent months there is almost 0 emails from patchtest.
>     I guess it's broken and revives only from time to time?
>
>
> Yup, that's it. It was down for a few weeks but looks better now.
Yes, it went down for a bit but is back up. I think it may have missed 
some patch IDs in its tracker, hence why this was sent now.
>
>     Peter
>
>     > -----Original Message-----
>     > From: openembedded-core@lists.openembedded.org <openembedded-
>     > core@lists.openembedded.org> On Behalf Of Patchtest via
>     > lists.openembedded.org <http://lists.openembedded.org>
>     > Sent: Tuesday, January 20, 2026 13:17
>     > To: Yoann Congal <yoann.congal@smile.fr>
>     > Cc: openembedded-core@lists.openembedded.org
>     > Subject: Patchtest results for [OE-core][scarthgap 11/22] cups:
>     allow unknown
>     > directives in conf files
>     >
>     > Thank you for your submission. Patchtest identified one
>     > or more issues with the patch. Please see the log below for
>     > more information:
>     >
>     > ---
>     > Testing patch
>     /home/patchtest/share/mboxes/scarthgap-11-22-cups-allow-
>     > unknown-directives-in-conf-files.patch
>     >
>     > FAIL: test CVE tag format: Missing or incorrectly formatted CVE
>     tag in patch file.
>     > Correct or include the CVE tag in the patch with format: "CVE:
>     CVE-YYYY-XXXX"
>     > (test_patch.TestPatch.test_cve_tag_format)
>     >
>     > PASS: test Signed-off-by presence
>     > (test_mbox.TestMbox.test_signed_off_by_presence)
>     > PASS: test Signed-off-by presence
>     > (test_patch.TestPatch.test_signed_off_by_presence)
>     > PASS: test Upstream-Status presence
>     > (test_patch.TestPatch.test_upstream_status_presence_format)
>     > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
>     > PASS: test commit message presence
>     > (test_mbox.TestMbox.test_commit_message_presence)
>     > PASS: test commit message user tags
>     > (test_mbox.TestMbox.test_commit_message_user_tags)
>     > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
>     > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
>     > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
>     > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>     > PASS: test target mailing list
>     (test_mbox.TestMbox.test_target_mailing_list)
>     >
>     > SKIP: pretest pylint: No python related patches, skipping test
>     > (test_python_pylint.PyLint.pretest_pylint)
>     > SKIP: test bugzilla entry format: No bug ID found
>     > (test_mbox.TestMbox.test_bugzilla_entry_format)
>     > SKIP: test pylint: No python related patches, skipping test
>     > (test_python_pylint.PyLint.test_pylint)
>     > SKIP: test series merge on head: Merge test is disabled for now
>     > (test_mbox.TestMbox.test_series_merge_on_head)
>     >
>     > ---
>     >
>     > Please address the issues identified and
>     > submit a new revision of the patch, or alternatively, reply to this
>     > email with an explanation of why the patch should be accepted.
>     If you
>     > believe these results are due to an error in patchtest, please
>     submit a
>     > bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest'
>     category
>     > under 'Yocto Project Subprojects'). For more information on specific
>     > failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
>     > you!
>
>
>
> -- 
> Yoann Congal
> Smile ECS
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229703): https://lists.openembedded.org/g/openembedded-core/message/229703
> Mute This Topic: https://lists.openembedded.org/mt/117361790/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

