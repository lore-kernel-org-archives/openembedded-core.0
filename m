Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C4AEB26F7
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 17:51:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25831.1770745907777665673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 09:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=icYGaYU6;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so10054645e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770745906; x=1771350706; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZsIbzTDqBDqMWeOiPCybNGnKTci+CCFM3l5mcHpIog=;
        b=icYGaYU6rB3UaQePnHYpBxR1ffxCyg0I0dlX8yRC6KiHbibnbMYFqkFjXKlyDP46vq
         tkZnmTWwAQBWIlDUkpNqsIugtHUUbC6SaCshFOyVRtV5puuBxCRYNDzbg90FBc1jx95f
         qDv2OAsimFswjFJoopHpVhXa3fPnPXN1uXziw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770745906; x=1771350706;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZsIbzTDqBDqMWeOiPCybNGnKTci+CCFM3l5mcHpIog=;
        b=Nby++iWotoOV1WvrmPaOAhkzwDDJuTVYNa6r9enopewmoh/DewgoeCqVrmMCoRnGpn
         wVCrSfRYgn1u//tJtaYzQLy+c5xjK/qnJV/V96v2sTq7cI25iEK2xdJ7k64Hgs9LrJkR
         uCWfdBd52eo6L8qCQD9NlPKALWCnb5SRA6izE5lKMoaYLQ+IRYG2Xo2gts1HoyLWa6EW
         ptOGIUtjeZuu/G77n54KbisenPnHMWO6iKqFirARHZBcMv+B2EVWej9+gu2MzWqBvP4s
         Wjdn0mC6mLeKe8/+TWimOvRwru4OJvfORefShSoyocNe/RcHdGIhAhzHLmihAJO0q8DW
         bExA==
X-Forwarded-Encrypted: i=1; AJvYcCUP43mrks+Bcb4BI09fsaAOmDr91lsr0Ot27qjBrOF22VL1bBuuP4KttRy0vnTRLtkEHpxau/A9ZjuUVpjpBHwFvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyftNMXFgXgxV1erPLP/vwmmxcvy7aGvXaQCmV6d1czKxx0fEra
	XvoNj+Tgy20YT7HtNFbTPB+Me81VJUhVViPBGECIixhga754v5cO5Un6aLNPt2jTNWc=
X-Gm-Gg: AZuq6aKxO1k25gDreD33g3j/Dg6eBPoITB7bRRPgrBjsmNPDvHvDzBVccvaRt5VZB8E
	5KD5mxz3/kuRFZsWZhBj/OKcgkKymgQqTN7Vjr3CObyQ9dmEYP0RXM40W04xlpfUlOrrpZT3/3a
	aUZdjU15cms48rVcHMPZNrOTEfZEbRgSro3gie5+iBn6UICEXc4Xm6m4yPYwKKPry+YlOiZGpWD
	9gjt58l0elGGzq5leSpfFBjc2f2AnAp2iRg1EA1dp5VofQZzJ6fAce2xUqK+oFM5lr6qkij0Xq+
	lp4X8iVsa7xvsbgTZ5K5dCvXVhycX+0EiawGW9cBqpuy8QUIo3MkE7Or5webmAaOrAlICsyA2lc
	i1IjCfz+kndRcYHFFtao2Q0Xcj63FtXjzfyduAJvf/idGEM65hRCj8FkEF2f+oXlALnJyhEzvDh
	kB96nhmlU9Hkn5ZhfbNxxFqhTHPwAUUJNfe7JrAOEWP5nd7xOdB7T6WkRrSV77PuYVzpLGwKqBc
	laF9Wd0CAkW6so=
X-Received: by 2002:a05:600c:5253:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-4832021b53dmr244694395e9.21.1770745905930;
        Tue, 10 Feb 2026 09:51:45 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835a6137d3sm650095e9.1.2026.02.10.09.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 09:51:45 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 18:51:45 +0100
Message-Id: <DGBH1ASSRT4O.2NXHC8DFCW6LY@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <patchtest@automation.yoctoproject.org>,
 <openembedded-core@lists.openembedded.org>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] Patchtest results for [meta][whinlatter][PATCH 01/02]
 linux-yocto/6.12: update to v6.12.69
X-Mailer: aerc 0.20.0
References: <20260210031722.1347242-1-bruce.ashfield@gmail.com>
 <0101019c459a67ac-7a7642b7-51cc-4f2e-9261-7dc8d609e403-000000@us-west-2.amazonses.com> <DGBG18MCXMLV.11SNSFR77NI2Y@smile.fr> <CADkTA4M5oBenYe_ZJLE=ygH70HOaDTmMoB5YQzTBLKVf3QwMHA@mail.gmail.com>
In-Reply-To: <CADkTA4M5oBenYe_ZJLE=ygH70HOaDTmMoB5YQzTBLKVf3QwMHA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 17:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230925

On Tue Feb 10, 2026 at 6:22 PM CET, Bruce Ashfield wrote:
> On Tue, Feb 10, 2026 at 12:04=E2=80=AFPM Yoann Congal <yoann.congal@smile=
.fr> wrote:
>
>> On Tue Feb 10, 2026 at 4:31 AM CET, Patchtest via lists.openembedded.org
>> wrote:
>> > Thank you for your submission. Patchtest identified one
>> > or more issues with the patch. Please see the log below for
>> > more information:
>> >
>> > ---
>> > Testing patch
>> /home/patchtest/share/mboxes/meta-whinlatter-01-02-linux-yocto-6.12-upda=
te-to-v6.12.69.patch
>> >
>> > FAIL: test commit message user tags: Mbox includes one or more
>> GitHub-style username tags. Ensure that any "@" symbols are stripped out=
 of
>> usernames (test_mbox.TestMbox.test_commit_message_user_tags)
>>
>> Bruce, this error is caused by those lines:
>> >     a1bf8ea50cbc4 mm, kfence: describe @slab parameter in
>> __kfence_obj_info()
>> >     d11475ea5c2a5 textsearch: describe @list member in ts_ops search
>> >     7a01b91ad6327 mm: describe @flags parameter in memalloc_flags_save=
()
>> >     18b6574d4c647 net: bridge: Describe @tunnel_hash member in
>> net_bridge_vlan_group struct
>> Do you plan to send a v2 with a fix?
>>
>> Alternatively, If you are OK with it, I can simply remove the '@' when
>> importing the patch in my branch.
>>
>
> Neither.
>
> Patchtest is wrong on this. Those are upstream commit shortlogs,
> leave them as-is.
>
> We've been doing that, and ignoring patchtest for several years with
> that warning.

I was not aware of that.

Thanks, I will proceed with the patch as-is.

> Bruce
>
>
>
>>
>> Thanks!
>>
>> > PASS: test Signed-off-by presence
>> (test_mbox.TestMbox.test_signed_off_by_presence)
>> > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
>> > PASS: test commit message presence
>> (test_mbox.TestMbox.test_commit_message_presence)
>> > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
>> > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
>> > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
>> > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>> > PASS: test target mailing list
>> (test_mbox.TestMbox.test_target_mailing_list)
>> >
>> > SKIP: pretest pylint: No python related patches, skipping test
>> (test_python_pylint.PyLint.pretest_pylint)
>> > SKIP: test CVE tag format: No new CVE patches introduced
>> (test_patch.TestPatch.test_cve_tag_format)
>> > SKIP: test Signed-off-by presence: No new CVE patches introduced
>> (test_patch.TestPatch.test_signed_off_by_presence)
>> > SKIP: test Upstream-Status presence: No new CVE patches introduced
>> (test_patch.TestPatch.test_upstream_status_presence_format)
>> > SKIP: test bugzilla entry format: No bug ID found
>> (test_mbox.TestMbox.test_bugzilla_entry_format)
>> > SKIP: test pylint: No python related patches, skipping test
>> (test_python_pylint.PyLint.test_pylint)
>> > SKIP: test series merge on head: Merge test is disabled for now
>> (test_mbox.TestMbox.test_series_merge_on_head)
>> >
>> > ---
>> >
>> > Please address the issues identified and
>> > submit a new revision of the patch, or alternatively, reply to this
>> > email with an explanation of why the patch should be accepted. If you
>> > believe these results are due to an error in patchtest, please submit =
a
>> > bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' categor=
y
>> > under 'Yocto Project Subprojects'). For more information on specific
>> > failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
>> > you!
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>


--=20
Yoann Congal
Smile ECS


