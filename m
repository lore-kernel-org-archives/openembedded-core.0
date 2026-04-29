Return-Path: <Jhonata.poma@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE56FF8873
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 14:27:54 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12549.1777472873508441616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 07:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UW9wYvqV;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: jhonata.poma@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso16662885a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 07:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777472872; x=1778077672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiwaFRajGnSUY97YSv7G6SFX/BAdagXbArQyQGGKmnM=;
        b=UW9wYvqVgHOTJoBazcmdpzY+hkTmzNRVOzcJ3WImFq8reJzLXkHfcOCJyy/hAEf5lW
         nXidWySh0CuzwqttqDAN3p83qkQA/Yn0Ib8T8dM/JzX3KKjlBul5yxLtRosmxe9YrR8K
         Uwti1KYHJE44eG4W5J/41d0YzNx9on/i/hY0ZNf8XzFsRYpY0x8gsjmops7YUNj0QEoo
         FIxbexHfQFO52TPvyUS0Uy+NRYE36zu/C6FaigUE2f/TCVBHz/tj2mQaa0J/rOU85dBC
         7apSH3/le6m9PC/wJrXD88W5Hn/UOdFqoYnVHc6HkBmgmkhXRHN6Y2a3HBMt6DyEADRg
         yQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472872; x=1778077672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iiwaFRajGnSUY97YSv7G6SFX/BAdagXbArQyQGGKmnM=;
        b=RD4sOxV3jyivOdWRuMtB2qywRHYPfrwwm70B28LRQ2IeEsFty8yWH+LqhJZCn88GfJ
         fvIHPDyPibP+H80XzoaPzFuKOlxJAx+IMlW1Exm7KmLM32PtPTmFiOBk6KxK3mKzPOMR
         epy8qz5KKh/SZJYEkxLwZQYQm9Tbw793CNfuSsxXBdjGIxKdHOnAqMaiGw4GYn+9N3u3
         QhJkDQRZQFYL15ZF2GSbuayEBBu4XO0r1FIR3p4+zM12cgouhptu8CHhQy0OmIOiOyaH
         R4lU+aRf+xCYqs4N31u4Dt6N/klypImcmzRrugDVvIceWEoPAaTOnw6BvKbEkOlv7hr5
         IA+g==
X-Gm-Message-State: AOJu0YyLZtrbt60EyhCz4LVCQ1L2yFmN0ecbhiqSRLiAnmPIbWEsKO89
	D1qB9/dq+KEc1Fki207nr3Vb00S80+RYrLMFhLyymofcpzKYSDs8sBgK
X-Gm-Gg: AeBDieukZjfjaOgJt6dlAZ31wX1ZJ1tCiNcTywidN+ZzLWrGMaLjczHHH4rmw8ISuW7
	77lIc3BvXpXo0UQ0dN5CMw10VOtfpajUT/jn+MnsHTrcKN96Vw3VsNAUMxZ1+ndI/kxvrY+N0lg
	NcSC2RbNpLphOliipjkjZwtSTk7LSDvsI9br9SM1jvBcFnweQzXjtyOp7K+P1y1740udHXYzqRm
	61ZJSGQnQ8helr7D+lhPJX7A0N8ggCbBHgtMe3CctbW6mMxbta9s4k2n9FKRE/V7gKHZVsH/v1b
	qRkicyvJ5DGMJl9LyVIurgAli6pFnBmhl3tDHTAmmNRWPiSfeDy14ds8efIN7PGGAElzG+149mV
	vr4cFByhSGINu/W3VJroGPXapeFDRzkSzro8bTy3rxd+UaK4gWh8N6ROM3f/MFtbGRiWOqBG1ev
	rYrbd04kZOww3pHdzFJsTZ9QYZjMpI8cmNwL2sCjBUboFhZfE6XilbZWRVgdCRhF+i7GeVdyB44
	0Z6fYpoOZ6hOSQoECaR3Mg=
X-Received: by 2002:a05:6402:5178:b0:678:a507:e814 with SMTP id 4fb4d7f45d1cf-67b1fe21932mr1824528a12.25.1777472871506;
        Wed, 29 Apr 2026 07:27:51 -0700 (PDT)
Received: from karaburan ([89.150.155.129])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22154e9csm801384a12.15.2026.04.29.07.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:27:51 -0700 (PDT)
From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Yi Zhao <yi.zhao@windriver.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH v3] rsync: add ptest support
Date: Wed, 29 Apr 2026 16:27:49 +0200
Message-ID: <20260429142749.2046089-1-jhonata.poma@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260429-b4-yocto-16211-v4-v4-1-211f27c4daea@gmail.com>
References: <20260429-b4-yocto-16211-v4-v4-1-211f27c4daea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 14:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236103

Hi Mathieu,

Thanks for the autobuilder pointer. I have just sent v4 (Message-Id
<20260429-b4-yocto-16211-v4-v4-1-211f27c4daea@gmail.com>); a short
write-up of what I found is below for the record.

The failure does not look timing-related. The valkyrie testresults log
shows ptest-runner returned status 0 after 139.84 seconds against a 450s
timeout, with no Killed process in dmesg, so nothing was cut short. The
failure is in the very last block of hardlinks.test:

    rm -rf "$fromdir" "$todir"
    makepath "$fromdir/sym" "$todir"
    checkit "$RSYNC -aH '$fromdir/sym' '$todir'" "$fromdir" "$todir"

checkit's dir-diff phase compares an ls-lR of $fromdir against an
ls-lR of $todir. The diff in the riscv64 log is exclusively on the
root directory entry's mtime:

    --- ls-from
    +++ ls-to
    @@ -1,2 +1,2 @@
    -drwxr-xr-x   ...   2026-04-24 08:01:16 .
    +drwxr-xr-x   ...   2026-04-24 08:01:17 .
     drwxr-xr-x   ...   2026-04-24 08:01:16 ./sym

makepath creates both $fromdir and $todir in the same call, but $todir's
root mtime is then re-bumped when rsync places sym/ inside it. On a fast
target the whole sequence happens inside one wall-clock second so the
two mtimes still match. On qemuriscv64 it crosses a second boundary and
the test fails, even though rsync's hardlink handling itself worked
correctly (the rest of hardlinks.test, the inline checkit dir-diffs and
file-diffs, all pass).

v4 takes the smallest fix that keeps coverage on all non-emulated
archs: stub hardlinks.test as a SKIP on riscv64 and riscv32 only, with
test_skipped() so the SKIP shows up in the ptest log with a reason.
That avoids carrying a patch against upstream's testsuite for what is
arguably a slow-target race in the test setup rather than an rsync bug.
If you would prefer a different shape (only skipping the trailing
single-directory block, or extending the skip to other slow emulated
targets if the autobuilder shows the same failure there) let me know
and I will reroll.

Thanks again,
Jhonata

On 2026-04-24, Mathieu Dubois-Briand wrote:
> Hi Jhonata,
> Thanks for adding tests.
> It looks like this is failing on the autobuilder, riscv64 machine.
> This might be due to timings, as these machines tend to be slower.
>
> AssertionError:
> Failed ptests:
> {'rsync': ['hardlinks']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1505
> https://valkyrie.yocto.io/pub/non-release/20260424-40/testresults/qemuriscv64-ptest/core-image-ptest-rsync/
>
> Can you have a look at the issue?
> Thanks, Mathieu

