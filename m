Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C00AC7E20E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 10:33:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458m7q6KDVz4q
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 12:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558607640;
	bh=+wifbf4AmOJ+2bpIkZXOwms+56muCCVCnv93CaB1xRU=;
	h=Date:From:To:Subject:From;
	b=dYMSsKgRv6CGAusLmFgns4AFkjToIf43OYeq0ScZZKuBodamO2U5jwCfYZJztbzRU
	NVHl217CG+SOhBgaz4T0+arcDcuELQ2vykOFqd8hOYgkHfR+C14L08Nqi1corBDvGi
	6YeE+RbcuS3VR/BsdcbIXYtz5baKktwZv350AAL9v1VvvSCwRbSTaz9avxjPS7UCKU
	nbEugGEX+MOcYDLuqWA5ZRyHM2Tl6OsekX3aCfRNECXvDxQm2EfBlt/pWTn0cmh85D
	nK3k2VsQYg3Jd5WgJzhI0HjmjZK+TPYSgg1HEUxJuNtYNFSGB0zvRN7ldCY7RvsUYh
	ARQJSupSIvOjJ3r41MTt4ukQ3FYlJD4iUnLYEXYLZmGwrPdF3x9AIyKH2BjavaR6jV
	8NLYtPdab3FOeuvajE9rvkPr8R+gkyrZxio94s5rrWhzK0mWvWadqAfUisi/KI7Q0Z
	DK0fiL+/2VsaLrJTx9ze+SluHIAEXqu5msG8VcqAKwotGFSxlwGhpNqLc86ZmzVQwx
	s447zKMPHqe2QL5NbtZ9R+NxXtbe8vtC9UbwuzJBzJpCRQ17M0axZpsFkZ4gMoM81m
	FYIIjN3Sl3z+R5u9cM+p+A6XqX3c4oDv4iJFT2h+V6WCs1Rey1xJcPwQuzSCjvUjeT
	OLKMDEVuIrl/vxzZ9KvJfFI4=
Date: Thu, 23 May 2019 13:33:52 +0300
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190523103352.GA25084@localhost>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Thu, 23 May 2019 10:34:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

systemd is fundamentally Linux-only and not portable to other kernels.

systemd upstream is using glibc extensions not present in other
C libraries.

systemd upstream is accepting technically correct patches that help 
building with musl, but there is no interest upstream in keeping systemd 
working with non-glibc C libraries.

The way things currently go, systemd/musl will require an ever-growing 
amount of not upstreamable patches - and this is not sustainable.

It is also not clear where the systemd/musl combination makes sense:
If an embedded system is so size limited that the size of glibc matters, 
then systemd is unlikely to be an option.

Other musl-using distribution also seem to favour more lightweight
init systems.

If someone has important usecases for using systemd with musl it might 
be possible to solve find solutions in an upstreamable way, but this 
would require a significant longterm commitment.

The current state is rather bad, some examples:

0001-Use-getenv-when-secure-versions-are-not-available.patch
looks like waiting for a CVE number.

0008-add-missing-FTW_-macros-for-musl.patch seems to break code in areas 
(rng, smack, selinux) where breakages can have security implications.

0002-don-t-use-glibc-specific-qsort_r.patch might introduce race 
conditions that cause data corruption.

0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch makes 
some functions behave different from what is expected by callers.

0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch and
0001-do-not-disable-buffer-in-writing-files.patch seems like an issue
that would require debugging the root cause and then addressing it.

All this looks bad, and is expected to become worse.

In this situation it would be better to not claim that using systemd
with musl would be a supported option.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


