Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9C8C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 17:04:27 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.549.1721754258784814437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 10:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46NH4HGE020652
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 12:04:17 -0500
Received: from [192.168.2.236] ([192.168.2.236])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 46NH4GEX009949
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 12:04:16 -0500
Message-ID: <5e6a2234-a842-482b-93a8-d8084b77c68f@kernel.crashing.org>
Date: Tue, 23 Jul 2024 12:04:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [scarthgap] package.py and selftest-hardlink backport request
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 17:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202413

I'm requesting the following changes be backported to scarthgap.  The commits 
should apply directly.  Any questions, let me know.

commit def276f0c4c43fa4b95b7b38a944de7cc7e9286f
Author: Mark Hatle <mark.hatle@amd.com>
Date:   Fri Jul 19 13:58:16 2024 -0500

     package.py: Fix static debuginfo split

     Fix:
       NameError: name 'shutil' is not defined

     (From OE-Core rev: 13bdd750ae54d57a5f459e4b7d8636c864978241)

     Signed-off-by: Mark Hatle <mark.hatle@amd.com>
     Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


commit fa894486a99237b56469354c24ef913a96753aaf
Author: Mark Hatle <mark.hatle@amd.com>
Date:   Fri Jul 19 13:58:17 2024 -0500

     package.py: Fix static library processing

     When PACKAGE_STRIP_STATIC is enabled the system did not pay attention to
     hardlinks.  This could trigger a race condition during stripping of static
     libraries where multiple strips (through hardlinks) could run at the same
     time triggering a truncated or modified file error.

     The hardlink breaking code is based on the existing code for elf files, but
     due to the nature of the symlinks needed to be done in a separate block of
     code.

     Add support for static-library debugfs hardlinking through the existing
     inode processing code.

     Print a note to the logs if the link target can't be found.  This isn't
     strictly an error, but may be useful for debugging an issue where a file
     isn't present.

     (From OE-Core rev: ff371d69f60a1529ed456acb7d8e9305242e74bd)

     Signed-off-by: Mark Hatle <mark.hatle@amd.com>
     Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


commit 4462724cab96ed3990fdf9b30edcea2adc9095ee
Author: Mark Hatle <mark.hatle@amd.com>
Date:   Fri Jul 19 13:58:18 2024 -0500

     selftest-hardlink: Add additional test cases

     Additional test cases for debug symlink generation both binaries
     and static libraries.

     This also has the side effect of testing for race conditions in the
     hardlink debug generation and stripping.

     (From OE-Core rev: 7171f41c07a39a7543bb64f075d38b8e74563089)

     Signed-off-by: Mark Hatle <mark.hatle@amd.com>
     Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


