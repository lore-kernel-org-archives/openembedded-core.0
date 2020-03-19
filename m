Return-Path: <SRS0=nN3C=5E=stusta.de=bunk@stusta.mhn.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A41B160B74
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 11:37:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48jlJN4S3kz3L;
	Thu, 19 Mar 2020 12:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584617860;
	bh=n68YPdd0PlIMP5bJH01XBcsQCVsqs7eOBKzlLrBFuf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwsBMBGKCz9YfRyeNmduf6gefAOU3IwMVZjoqTV1N2/Ssk8z1u1EkLvJ5FtBs8k+1
	nIIoARVL2A/Zsb9Dqy9aXPevIvGQCxDSzr5tziPqoT7WlpX/gZkQ1Xri/XNrIXeNCH
	FRBsDg6p++ZStMOWJwUdejPrtxsLexG4A3Z4z5xOTpifI1F+462xMltwd/bYNW4pw0
	frchVEbMWZ72bgN9o2WHKkTt49ewYk86SRjfHEhPsBNV8qmOdUdfXisVjv7cg3s/a0
	qqz24d+kKufCJ9V+9GKOzXGz3u+3AMOf8m4FVLeunqpJdJXuQ+rZgY8OY3/DUEajsm
	2LNGcJyGVKmFUYygpgSoCdg9tw/Pa4jSxIk9L/0CGTEl55rzFXACbdJBXM/OtXxHWA
	AIyUbUWB1CkrF0LZ5bEWQVFarTjjZOrXM4A1+Du1RiBjWLJqU4yBVSZl/hk+2yWEF9
	cVej++nh8hsd76byRqp1EP60ZFw8q/Ak9UPKC+SfBgb193o7NIvLwUUgzAvPJxhc+3
	JIgZtt7oWhCtktbD/0qt2eNiXsVWIQcFrMGlBnCTjVUG6wkm8c30TE7GsFvCI55jRQ
	AMZVpDP1hYo14qJGBiSlKEcNMi6MjzaMXOMnTDsPD64YMay7b+6aj0Jm+/ro9p0x9M
	5GBnBatn0eiqBZQf0j37AGiw=
Date: Thu, 19 Mar 2020 13:37:36 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20200319113736.GA28081@localhost>
References: <20200318122156.23599-1-mike.looijmans@topic.nl>
MIME-Version: 1.0
In-Reply-To: <20200318122156.23599-1-mike.looijmans@topic.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/populate_sdk_base: Implement xz compression options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2020 11:37:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 18, 2020 at 01:21:56PM +0100, Mike Looijmans wrote:
> Building an SDK on a machine with 8GB RAM resulted in excessive swapping
> due to the xz compressor using ~20GB of memory. This is because xz is
> being called with "-T 0 -9".
> 
> To allow tuning the compression versus memory usage, introduce a variable
> named SDK_XZ_OPTIONS that defaults to a more sane default:
> SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${XZ_COMPRESSION_LEVEL}"
> Thus, inherit any XZ tuning already done, and allow users to specify
> overrides for this task in their config by supplying SDK_XZ_OPTIONS.
> Since XZ_COMPRESSION_LEVEL defaults to -9 this does not change the standard
> behavior.
>...
> +SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${XZ_COMPRESSION_LEVEL}"

A problem is that XZ_COMPRESSION_LEVEL compression would now be used for 
unrelated usecases, and lowering the compression for being able to boot
on low-end targets (<= 64 MB RAM) shouldn't impact the SDK.

>...
> -       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz -T 0 -9 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
> +       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
>...

Replacing "-T 0" with ${XZ_DEFAULTS} should solve your problem.
This already takes both cpus and memory into account.

cu
Adrian

