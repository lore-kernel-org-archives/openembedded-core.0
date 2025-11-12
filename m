Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18300CCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 09:07:05 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9102.1762938416237783719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 01:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=D+MOFE8+;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5943d1d6442so566056e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 01:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762938414; x=1763543214; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NqCcLluXgiDWG+o2i/tWHMuaqKSAnUHXwBitn6AHhKU=;
        b=D+MOFE8+vcmexUDNuiYK7LJ/R+cM8J1Wi1K17dO3Xdn6j6D5nmdYg5+kCrV57KpJCe
         uscqtmzuv/oQAQUBGJPvdlMwWsw1qkH8e3nV7vLZvqjfizADgrJ767B9Wk4jTDlH7T+v
         THaV0jAR2LpOXQaJ5KUOddZy1xPt6ls0QuN6DNlYHHAYrjwVsPL9rGdwLM+idmmugiza
         2NKkOysmnLO0HslaazNyOdtHozdT7KUiBRFqje997zL3u/cWPXymDC+EKG07o5L0Ifgu
         YitPrYl511hbjwZsPRcaZOPFip4iTJ7O62wNe6ihviWqHmqU6YNn/Ymf6eetbzINJ8xA
         uGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762938414; x=1763543214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqCcLluXgiDWG+o2i/tWHMuaqKSAnUHXwBitn6AHhKU=;
        b=dxjkCs7VuSon4STx3Uei7Vond+NG2VCIPjePVcvFUpV2eWEXabrIWvSU/KwCnt5orA
         ygpbgFkb5VI4UGcsc6eKDWDmv8vQXdpEOpAoNvQx4niVKeCEkv+tyXm8U9do08+345dU
         AF2TaDuxJAvTjkQ25TFf2fMoPtTZ9LegW/ccw/1TNrBWd3cVcUxlZCv1PuTeCO086WEM
         KSwgJlOlBVCMRjZii4OAJT6LjWJmq1fT3KR/XbUCaNpZmj2P3Mm64anWMqVOuefKM9aN
         b8uVHnwtNEEkOKzHHHdXqNWpxfECwHJyXGH84nePnOoFPSlxsC8PljyDV0TwA/eel9Pz
         n+Qw==
X-Gm-Message-State: AOJu0YyH6ynDzhp80y9rYqRuyRCXwYr+pyavUamczBtCHudD1WgYLnYe
	CM/NskHzSVE63ZPAHvis6kBn237N+9GyZQ92APib69yf5wBU/Qg233tXi6ZIlbMgyNYSpble3VM
	pazh1Zt0=
X-Gm-Gg: ASbGncsrndttccraxv38ymw0EOgL9/z7XCwoSF70TVCjnJ6/zJ1PiV3OQySKPvi/FDe
	CkH6Bo6HU6VOw6gX79ONhwx4hb+u6o1xfKNjL5tgvuSCBZHfcrdw+3Q2PV7n/2IWQLGiCOGkGhG
	kp71ZlZbSgtqJB9faHIB4BAfAxsoiGVDFvq2eGKx9nJwL7uQRo8XaWM+EGuI7O9V4zo91K5Ym82
	aWr262aHGshw/kHLE6hAUkaDfxDCpTELab6iBREbbXam4Q41XveeL9XGSVy/yVzOUfDj7vxxfJ0
	Q7pUqBYvDX/79bKJiHwNPc5rzt/+npXyMh0+XintuTiL/ovF5sTeKzxIbv4zGGYHODs93XPiVzV
	BMCkOJ3DT+H/R+HjztFv9CQSsyxh0l5i1ekR/2IrbgAaBdWfMG84tzzu/qibu4FhN+8VgXNaAt5
	D9xI9dUpuxetGcIgejYH/HhVa8hiKh/g==
X-Google-Smtp-Source: AGHT+IHTCbsXzvgVpNT6MceUmutaDctnB7c/oAC6Sfva7/w4P6KeiKeUJEI8XXZJ5zjZ1P/GXTSm/A==
X-Received: by 2002:a05:6512:3b11:b0:594:5545:b742 with SMTP id 2adb3069b0e04-59576e18926mr756210e87.32.1762938414165;
        Wed, 12 Nov 2025 01:06:54 -0800 (PST)
Received: from nuoska (2001-14ba-48e-3a00--19a.rev.dnainternet.fi. [2001:14ba:48e:3a00::19a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5957d22783bsm75646e87.75.2025.11.12.01.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 01:06:53 -0800 (PST)
Date: Wed, 12 Nov 2025 11:06:52 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: automated-testing@lists.yoctoproject.org, bill.mills@linaro.org,
	ilias.apalodimas@linaro.org, javier.tia@linaro.org
Subject: bitbake, oe-core and meta-yocto tags in sync? (was Re: GPIT LAVA
 Test Report - Job 123474: OEQA ALL PASSED (24/75) passed)
Message-ID: <aRROLHFAmzOAbzRj@nuoska>
References: <691381dc.7b0a0220.35e53.800e@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <691381dc.7b0a0220.35e53.800e@mx.google.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 09:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226200

Hi,

On Tue, Nov 11, 2025 at 10:35:08AM -0800, ledge-bot@linaro.org wrote:
> LAVA Test Report for Job 123474
> ==================================================
> 
> GitLab Pipeline Information:
>   Project: gpit
>   Branch: main
>   Pipeline: https://gitlab.com/Linaro/trustedsubstrate/gpit/-/pipelines/2152817594
>   bitbake: 2c6c40bdab8ebc6c04fe9992524add967fb4a053
>   bitbake git describe: yocto-5.2.1-149-g2c6c40bda
>   openembedded-core: e556df28f47e754b53e1f46c97dde2b19fd8fad1
>   openembedded-core git describe: uninative-5.0-152-ge556df28f4
>   meta-yocto: 66ea31cee15309af07afeee8dec8a6fe1d92d28e
>   meta-yocto git describe: 5.3_M3-3-g66ea31c

So this is our first build and test run with separate bitbake,
oe-core and meta-yocto built using kas to replace old poky repo master
branch which no longer builds. Setup details in
https://gitlab.com/Linaro/trustedsubstrate/gpit

The "git describe" output with tags is a bit confusing. Would it be
possible to use same version/milestone names there?

Currently it's a bit hard to tell if the trees are fully in sync and if
yocto-5.2.1, uninative-5.0 and 5.3_M3 are compatible with each other
or not. From pure tags it is not easy to see if trees used same
branches, for example.

> LAVA Job Information:
>   Job ID: 123474
>   Description: gpit-kv260
>   Device: laa-00077-kv260
>   State: Finished
>   URL: https://ledge.validation.linaro.org/scheduler/job/123474
> 
> OEQA Test Results Summary:
>   Total Tests: 75
>   Passed: 24
>   Failed: 0
>   Errors: 0
>   Skipped: 51

But at least all executed oeqa rutime tests on core-image-sato
with genericarm64 machine passed on AMD kv260 which is the same
result as with poky from one week ago before its retirement.

> Passed Tests:
>   - connman.ConnmanTest.test_connmand_help
>   - connman.ConnmanTest.test_connmand_running
>   - date.DateTest.test_date
>   - df.DfTest.test_df
>   - oe_syslog.SyslogTest.test_syslog_running
>   - oe_syslog.SyslogTestConfig.test_syslog_logger
>   - oe_syslog.SyslogTestConfig.test_syslog_restart
>   - opkg.OpkgRepoTest.test_opkg_install_from_repo
>   - pam.PamBasicTest.test_pam
>   - parselogs.ParseLogsTest.test_get_context
>   - parselogs.ParseLogsTest.test_parselogs
>   - ping.PingTest.test_ping
>   - python.PythonTest.test_python3
>   - scp.ScpTest.test_scp_file
>   - ssh.SSHTest.test_ssh
>   - systemd.SystemdBasicTests.test_systemd_basic
>   - systemd.SystemdBasicTests.test_systemd_failed
>   - systemd.SystemdBasicTests.test_systemd_list
>   - systemd.SystemdJournalTests.test_systemd_boot_time
>   - systemd.SystemdJournalTests.test_systemd_journal
>   - systemd.SystemdServiceTests.test_systemd_disable_enable
>   - systemd.SystemdServiceTests.test_systemd_status
>   - systemd.SystemdServiceTests.test_systemd_stop_start
>   - xorg.XorgTest.test_xorg_running

And we now list the passing tests in this report.
I think this is a useful detail to have.

Cheers,

-Mikko
 
> LAVA Test Suite Results:
>   BITBAKE_COMMIT_HASH: 2c6c40bdab8ebc6c04fe9992524add967fb4a053
>   BITBAKE_GIT_DESCRIBE: yocto-5.2.1-149-g2c6c40bda
>   METAYOCTO_COMMIT_HASH: 66ea31cee15309af07afeee8dec8a6fe1d92d28e
>   METAYOCTO_GIT_DESCRIBE: 5.3_M3-3-g66ea31c
>   OECORE_COMMIT_HASH: e556df28f47e754b53e1f46c97dde2b19fd8fad1
>   OECORE_GIT_DESCRIBE: uninative-5.0-152-ge556df28f4
> 
> This is an automated test report.

