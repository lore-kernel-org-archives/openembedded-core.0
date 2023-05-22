Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF3BC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 14:58:29 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.24076.1684767505512863683
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 07:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EdWsX7T7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2F0EB240012;
	Mon, 22 May 2023 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684767503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+EEtMU9BHbHwvcJAsTqnSUErbJvb5W4E4ClRV1hJBw=;
	b=EdWsX7T7+mmfUIfk5JkboJ9fEz3x5T7+u6TgF2nyyVfZY8cvh8PFF1AdAqZfpml6mEnri/
	isZAdlcM+AKq6Dg2fMq0DdHJJb5Qr0yXZQyqT4vKcJ2Nv+RWGpWvIPsJT8grDm29R4w3Zx
	X0E932Sk8AUl5r9RbpcMDLvOqhb+zjWenpGHM2GS2TE0W5ysl304PH8QZdAN1H03h9I36H
	v+xiemIjEWnMHymQ4lX7udQdQYuq9RYoGXmsQBmZyeJi8O8lXSYLGa7iBOJDuAgOi9rsEp
	Ay6/1NhpDSZYdjI7X7HV/v+prLpWohet8eLv8yVRCvrQ0ofodsjLQD7iCdG1Hg==
Message-ID: <31d56f83-65b7-d52a-8312-89cccba421c1@bootlin.com>
Date: Mon, 22 May 2023 16:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [OE-core][RFC] tests artifacts retriever
Content-Language: en-US
To: Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <17617EDE5E1F7514.20228@lists.openembedded.org>
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <17617EDE5E1F7514.20228@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 14:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181597

On 5/22/23 16:52, Alexis Lothoré via lists.openembedded.org wrote:
> Hello everyone,
> I have been briefed about the need to add an infrastructure to be able to
> retrieve some test files (test output, logs, etc) in Yocto/CI
> automation to ease debugging of some hard-to-reproduce issues. Before
> starting to implement a solution, I would like to get some feedback about
> what I have understood from the original issue and what I propose to
> implement to improve this. Please find below my reflexions, feel free
> to comment, correct, enrich and/or approve.
> 
> # Motivation
> 
> Some test failures appearing in automatic testing can be hard to fix, based
> on too few informations from failing tests (see
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14901 ). Sometimes
> packages/binaries under test are able to generate more detailed output in a
> dedicated file, but there is actually no standardized way of retrieving
> such output files. There has been some custom efforts done to solve this issue
> for specific recipes, for example for lttng-tools tests :
> https://git.yoctoproject.org/poky/commit/?id=2ea27691aa57951aaba3cc1714a080a112d15408 
> 
> The goal of this RFC is to propose an architecture for a generic system which
> allows to retrieve an arbitrary list of files from a test run.
> 
> # Use case example
> 
> lttng-tools recipe provides LTTNG tools tests as ptests (see
> meta/recipes-kernel/lttng/lttng-tools/run-ptest) and generate some log
> files (error.log, test-suite.log), it would be convenient to retrieve those
> files.
> 
> # Proposal
> 
> - Introduce an "artifacts.conf" file
>   - this file contains a "files of interest" list to be retrieved onto
>     host after running ptests (exact format to be defined)
>   - artifacts.conf is specific to a ptest package and is stored next to
>     run-ptest script in package
>   - artifacts.conf contains, for each ptest package, the following
>     informations:
>     - name of file to retrieve
>   - artifacts.conf will be installed in target image (as for
>     package-specific run-ptest script)
>   - each ptest package MAY have an artifacts.conf file
> - When running ptests, for each available ptest, ptest-runner (on the
>   target) will read artifacts.conf if it exists, and retrieve
>   corresponding artifacts file in an artifacts directory, with one
>   subdirectory per ptest.
>   - Artifacts will be aggregated only if at least one test has a status
>     different from "PASS"
> - Once tests are finished, tests manager on host (ptest.py) will fetch
>   artifacts directory. It will put this directory alongside testresults
>   file on host
> - This mechanism will work for both real targets and emulated targets
>   (Qemu), and will based on SSH to transfer artifacts back to host
> 
> # Additional questions
> 
> - once retrieved from target, aside from default test results directory
>   (build/tmp/log/oeqa/<...>), where should we store artifacts ? For
>   automated testing, should we publish them alongside other test and
>   regression reports (in web server directory) ?
> - current proposal is focused on ptests: should I broaden the scope and
>   include all kind of runtime tests (as found in
>   meta/lib/oeqa/runtime/cases ?)
> - are there examples of tests producing files to retrieve with non-static
>   names (which will then require the artifacts.conf to be smarter) ? 
> 

Fixing Alexandre Belloni's address in CC, sorry for the noise

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


