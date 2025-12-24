Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09754E7545D
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 13:56:42 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.120889.1766584598257429328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 05:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VnEHd81/;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c0f15e8247so509926985a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 05:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766584597; x=1767189397; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I1H2h7u+FkndBj9nS7/+tDn9s1S7W6SwA8ilx+jNDAk=;
        b=VnEHd81/QZIpwGvbUSI9Xo0MDpwGfdqKOtJnntiYNIzsd6fRd4f8hgcDu6GvX7QEJJ
         l492JmDRjJgMVuitobpgXW9pM1Si8CVig7E1qQ/DWrkq5uKfYISPVXOyPoG85KPz7bgc
         JMmpttfij15cd6uBhoCSkieJtFh9q2nGqiekX0nkRV1o7CteNXEAP/4MBNHkdzBqPZZ3
         uQH6xDrE0Y3SZUsDlov8vj7AymXbLPX+tNnJPfTOPM/CoNOPEncvru3T7pMFBr2xlCGR
         M1A5p4/QqK7ZcVar3WlmqFpEvKZFkTpDphz3Zq/OsU9E9sU7oQX3bzQgyBlB5lQd10OD
         oq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766584597; x=1767189397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1H2h7u+FkndBj9nS7/+tDn9s1S7W6SwA8ilx+jNDAk=;
        b=R4PRnycI8cxh5FfoBcZS0DBGPZA0ZsAclzebducAb7XeczOP9oZW+Loa2wvnjEEi5A
         piphgqKKmPU/x3iMuMVAhM2A/FzLGoQobP4+SI2QCHWqL69Oux8M2b2XJKQ/nQ+4v/75
         EDIMLSAjOG4MkKNLZkjBIHdS9G5i/Wfka9jdLRjnoKPLM+/3w+dLb3GfMqc6oPB2lQGW
         +duH9ipP2ntHCCZ5lu6zG39KqjeS9Knk2vawUXcRH3KoArTqiyO8Bv217MnzVVtsm7wT
         4MGWQX0y949+IPbp+e5J+tETx+Yt5r9F1gtjTzvy9xFE7sA10OYlfPmUY5lTUx41fTyu
         1MLg==
X-Gm-Message-State: AOJu0YxB4iSDbbxuM6aDMYMwn75Nh84rR2fduNdMaJ6Qnt4400+Ho7Kb
	Kw2UwCnSm9oIBcjOG453v31FnDt2CHgCLA94nQXItvM8aaCVn/dI70Nu4hED9dUvdzroHJRijBH
	EAIPSi69E0VA/+1N+0Se5h77nftSIwlw=
X-Gm-Gg: AY/fxX7mOf6aU5s+mBUnREuker7CNOXUMaAg+YkDaNTcOzcqFRd/lceHkNEGKaIRT8v
	S2iuQ0Jkz4x2t6K0phDfVe3CF5c8AGte0MclJ80FtgxFoTWBzGf+k4AhNsvyF4FmHoHnocGLGdJ
	QLhXtMkYTfLUFQbNic3fR/jVtz/RbtEWRkKRViBuRN7n1RPGvcEPhyEE3LE2hzoSemuUgLYimxy
	t+fQRsZUF5SptphWSgj4i1IB2PbkHKEYygmlm+Tl23rvqwkhoK0zfvJSUEjkrr5PKLk1g==
X-Google-Smtp-Source: AGHT+IE16j+MhuJ5DKU7Z0Aa6IXKZwaujumx0dCSwVMih8ApgYfbnaNtbQ8VXHxl2XUuEIXvqboOvo57X1kOybIkCG0=
X-Received: by 2002:a05:620a:1789:b0:8b2:7290:27da with SMTP id
 af79cd13be357-8c08fa9bf01mr2825779485a.12.1766584597235; Wed, 24 Dec 2025
 05:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
 <20251222200739.2278706-97-alex.kanavin@gmail.com> <DF6CV1ZJB2L9.38TR07LJFMU8U@bootlin.com>
In-Reply-To: <DF6CV1ZJB2L9.38TR07LJFMU8U@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Dec 2025 14:56:26 +0100
X-Gm-Features: AQt7F2pjwPqjR6Is4QqEodpMemG4BMTsZgWC1adNiXEe0yhxNF4kbSV9ePMGapk
Message-ID: <CANNYZj9LpFV61=VgA5c7Y-RyOrsVmDjM96h5i0FuDnv9+cTLYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 097/114] strace: upgrade 6.17 -> 6.18
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 13:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228534

On Wed, 24 Dec 2025 at 10:56, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
> Thanks for your patches.
>
> It did work well a first, but then the bpf patch got merged separately
> [1] and now we have some clash between patches applied by the recipe:
>
> ERROR: strace-6.18-r0 do_patch: Applying patch '0001-tests-skip-bpf-tests.patch' on target directory '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/strace/6.18/sources/strace-6.18'
> CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/strace/6.18/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-tests-skip-bpf-tests.patch
> patching file tests/bpf-v.gen.test
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file tests/bpf-v.gen.test
> patching file tests/bpf.gen.test
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file tests/bpf.gen.test
> Patch 0001-tests-skip-bpf-tests.patch does not apply (enforce with -f)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2924
>
> Do you mind to refresh the patch?
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=640b43073dc5b185781e2789860af6a07560bcef

This is the same patch (just written by someone else), and the version
upgrade has merged to master as well, so you can simply drop this from
the set.

Alex

