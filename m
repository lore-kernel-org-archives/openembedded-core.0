Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4058EA3F3C
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 10:40:33 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17010.1770720029122954988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 02:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KC+hsJkG;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so10093865e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770720027; x=1771324827; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFzqFiZUp3Zm8es8QBweZNzrAdZ7/0VtaO6lO6Ejr+4=;
        b=KC+hsJkG4fzE+gDxNg7DS+YvehQaKgwJWy7L5vYHnKp84Rc4fMS9vVdZcjPPwWN30s
         Uqrcze7vIQzryIG5om+uz5slzigUksKZWgm/J1m27ursFWarzbPei5/CsxuZxG2zMKLo
         OiTFQPOjmdlHoWIzB5MEZtaU7esXBmKB2N+Nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720027; x=1771324827;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFzqFiZUp3Zm8es8QBweZNzrAdZ7/0VtaO6lO6Ejr+4=;
        b=bHeNxuP61fg2nOQbR6KGV47tsGi6Js8TbL8FtL7TlmiS9BLxdiwBnPvs+5+gnua8ZW
         yGMV/15K9ol52n22AnWkJIrNN1crqhutG8ocz2aCofuz69L67pxa9wM9f9OaYh+LyBv2
         hy+uMDTvwjkK4gZzkrdLg8ebiCQI8FegcFCpBX0IvcrwGteixMJe4sqO74ZWh88qOJCi
         SfoSabtQebIh8P4cOMpJArp5AlCY15/88PEVkdFnMaXrqGJR9O8MfXMknaGGnhtzBQvZ
         qPG+81ArloBi0V+WHDlQ6hLncS8ry8jzqfgh9AZ8tPtiHongYg2QqO4+jQVZWeO+Y3Qs
         wHRw==
X-Gm-Message-State: AOJu0YyZdFFzJovKrYyxdFSOv9MgxqteAAIwGTSsIceuF4pYmGR9kmJM
	SklANziGzpgiK41nt3pSmPJ3xgBNduBzZbf9roSgHq4A2f59m6q0ZXnExAzzvoQDkO0=
X-Gm-Gg: AZuq6aIWkRzQxamaTWILwhSE0bgZnwjFEgFo9vsR5cRMloXWZHrlwRwqLGQN5tCek3B
	QLvAoruGhO/fm068c4GcrS9ylaNuhjwjhIoqVc0imsK2u+6tBLT6jnXnDS+4UL3CTuoDR+PGv7p
	wMi1peeN1WuD5xLJYuWp9kap+FRXH/gJjJj0DEo4WHvTFwjouOJJzRqdGG26CK76/RoQcQydDfu
	QKmogNJxYOcgt4WegGJYGo4L64MlEszVnmKeL7C0OU7ut0z8hC4sStzxbfIbYCuRBY7909ARp3W
	wEsb12vHSP1zL43vm5E65ZB+TfFKcPmFCPzTmAzvjE83vcBdosOHYAEfr5YmN8jPdz4BhJ/Py+L
	vIcnFa3nJWhx2sxtnUH3cnQP9Qhwk6sQ3txmP748oWG8VEaOQhFfEYn1L+eIy8KhVwKKE8WTPfV
	EEQatdVCSLYSYdBa3w0gKzSkRBQUR6cs77KqpIizpNr/iiWmRjDgKO1Xi0nEasvCpRhuJ/wXbev
	Zc8DZL4J2nUGqYJ
X-Received: by 2002:a05:600c:5290:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-483201fffc9mr190832795e9.5.1770720027464;
        Tue, 10 Feb 2026 02:40:27 -0800 (PST)
Received: from localhost (2a01cb001331aa00c483744cb4924df7.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c483:744c:b492:4df7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4afsm108377325e9.11.2026.02.10.02.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:40:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 11:40:26 +0100
Message-Id: <DGB7V2ANTTCH.34VU08DOUAPYS@smile.fr>
To: <peter.marko@siemens.com>, "patchtest@automation.yoctoproject.org"
 <patchtest@automation.yoctoproject.org>, "Hongxu Jia"
 <hongxu.jia@windriver.com>
Subject: Re: [OE-core] Patchtest results for [PATCH 3/3] gnupg: 2.5.14 ->
 2.5.17
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260210095025.633860-3-hongxu.jia@windriver.com>
 <0101019c46ff2150-c2b795c2-726b-4274-8690-58a40f98be10-000000@us-west-2.amazonses.com> <AS1PR10MB5697AD37C0ECCBC9E8B71456FD62A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697AD37C0ECCBC9E8B71456FD62A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 10:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230881

On Tue Feb 10, 2026 at 11:36 AM CET, Peter Marko via lists.openembedded.org=
 wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Patchtest via
>> lists.openembedded.org
>> Sent: Tuesday, February 10, 2026 11:01
>> To: Hongxu Jia <hongxu.jia@windriver.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] Patchtest results for [PATCH 3/3] gnupg: 2.5.14 -> 2.=
5.17
>>=20
>> Thank you for your submission. Patchtest identified one
>> or more issues with the patch. Please see the log below for
>> more information:
>
> Ideally mention security fixes: CVE-2026-24882 and CVE-2026-24883.

Yes! Please do that.

That helps me a lot to find upstream commits when reviewing patchs for
stable branches.

Thanks!

>
> Peter
>
>>=20
>> ---
>> Testing patch /home/patchtest/share/mboxes/3-3-gnupg-2.5.14---2.5.17.pat=
ch
>>=20
>> FAIL: test commit message presence: Please include a commit message on y=
our
>> patch explaining the change
>> (test_mbox.TestMbox.test_commit_message_presence)
>>=20
>> PASS: test Signed-off-by presence
>> (test_mbox.TestMbox.test_signed_off_by_presence)
>> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
>> PASS: test commit message user tags
>> (test_mbox.TestMbox.test_commit_message_user_tags)
>> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
>> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
>> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
>> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_l=
ist)
>>=20
>> SKIP: pretest pylint: No python related patches, skipping test
>> (test_python_pylint.PyLint.pretest_pylint)
>> SKIP: test CVE tag format: No new CVE patches introduced
>> (test_patch.TestPatch.test_cve_tag_format)
>> SKIP: test Signed-off-by presence: No new CVE patches introduced
>> (test_patch.TestPatch.test_signed_off_by_presence)
>> SKIP: test Upstream-Status presence: No new CVE patches introduced
>> (test_patch.TestPatch.test_upstream_status_presence_format)
>> SKIP: test bugzilla entry format: No bug ID found
>> (test_mbox.TestMbox.test_bugzilla_entry_format)
>> SKIP: test pylint: No python related patches, skipping test
>> (test_python_pylint.PyLint.test_pylint)
>> SKIP: test series merge on head: Merge test is disabled for now
>> (test_mbox.TestMbox.test_series_merge_on_head)
>>=20
>> ---
>>=20
>> Please address the issues identified and
>> submit a new revision of the patch, or alternatively, reply to this
>> email with an explanation of why the patch should be accepted. If you
>> believe these results are due to an error in patchtest, please submit a
>> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
>> under 'Yocto Project Subprojects'). For more information on specific
>> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
>> you!


--=20
Yoann Congal
Smile ECS


