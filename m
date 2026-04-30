Return-Path: <Jhonata.poma@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB9CFF8873
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 14:25:53 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22012.1777559150101098277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 07:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cwMnF2ap;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: jhonata.poma@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso1688684a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 07:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777559148; x=1778163948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEhTgqiL/DbPNsCCRyQURTBLgfJBMUsQGHOu9EOFh9c=;
        b=cwMnF2apjFQ3/w0BaQ/LKofAUmXVQL2mv3O+m9K3pp0PMiL5pSPWDqs6I8VIllbtEW
         hKxS2rSiW4kkG7/xdu75cUsmoh/tc25SoZAxV6IJphtPMkhk/Ko0lGgNbil2ChD7oLM2
         r3ic+Vxqbhv7oxiKaLM3fFb4Eo2/N36UOx8E0DhuOqcAO3sor0PJnGIHDJ+wVDq3Ztw8
         UR099qDJqbhOYpJ8KPHmzajO2hCekcVmxjHpMbRXA8VnqaYZwI5JgciVczkftjqW9qVC
         /V7eqa6cs6HvJE/VFSU7ylUIH81OWhMoShw6JSXudzxfvbqJH0eRGS1D5JgrnsmH0v55
         2k1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777559148; x=1778163948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GEhTgqiL/DbPNsCCRyQURTBLgfJBMUsQGHOu9EOFh9c=;
        b=sD8yX4Nghc3Krcye9G1zAKM0rfp/EeHwNOs7IrB2+KO0sfeWc4mLlHsEnWEVfw2V7Q
         PDFwq2o464xWjsL2i2CFVbuNZuHbkCSw8sHVN3GGoD7E940GIlfJcPW2UHGXTz3ctcB1
         SWSmOG2mD3mF62ZR4J2s7WGUyQDaELObN9URgQyb/Os8omb6QkvMElMiArdspfkDEutz
         Za3lATfx3e9BymWZ90dPxAvR9YSIN+aMowbRiZZi0sVjtsFtvAYDqIoXCgqmkP4WSQT2
         f9/kHb1sxXSqA2c0buzf+nklMUxxIbPRsSLm3S5zlIo8E1gQ2ldtBxW9VOILy04Mi1iO
         cZZg==
X-Forwarded-Encrypted: i=1; AFNElJ8n31bJ0qDLO81yKhIOZn1o0Ko+wVtfgZkRKECBICLPM7evMgkF1oXQxRL+vHCwy2QZp0ljVnLv/2FpRIG9bLaQhQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJsjke9N1Hg2FPdFtynOeh8CiBNi7FtVp3O6vgiMFXbCt8wd71
	P+S+LYmovmsMBOiuAx1ra0hVuzmPKXxS4V+TcERCXXz2uQk3ANAxcKqj
X-Gm-Gg: AeBDiesgKDJFYMHM3bYQoWn1LIN0Qj+80rPNxl3drw+2SKYxZCibb0ezZ0q957M5Owv
	/+LtXwHTab7WNF7sT3rYEGN4C09YFbkD2/4WP6idWXIKv2WzTPOnHk9n39eO//LEufwEoaghY3F
	e5nFpFDBvtNXrT3ZlSlt5cg85EUM2YMbqauT51hwlaMVhlnHmpWmrBpvOoOjjIoyEGLo4rmoU1T
	zAyllYRfAFi9uatAlQ+5Dz5NU5wrqGSH8zKvSMzafEgTK6XXqxSXxMaOcQ3/SwlZ/+XzLveVUBK
	hx/AIQV2xsstmxMJ4EvfdTX/6h2R3z46nHR5ZIHgb3ygfA3u+cIHL9KXpzDpDMvsnI61wxXP2xA
	TyyoMxbgJEZhISQykMpwmMdEaphyax5ZpTp2u99tECozHrm3DlBPw8gjcmW/Hk4B4gE9FF82MYz
	FGNWlZXQM90dbuyzooM9qNdyE3KE7oM4kXVYT9i+TlEH7d3l12CY9I8x7uu6kSUpkX4xFrfdLFP
	T3LH61/NNXkirYzDVmkNTw=
X-Received: by 2002:a17:907:e11c:b0:b9d:c374:6e33 with SMTP id a640c23a62f3a-bbac78982aemr141317066b.26.1777559147995;
        Thu, 30 Apr 2026 07:25:47 -0700 (PDT)
Received: from karaburan ([89.150.155.129])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe675cc435sm2459166b.0.2026.04.30.07.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 07:25:47 -0700 (PDT)
From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Jhonata Poma-Hansen <jhonata.poma@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Yi Zhao <yi.zhao@windriver.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] rsync: add ptest support
Date: Thu, 30 Apr 2026 16:25:46 +0200
Message-ID: <20260430142546.2655723-1-jhonata.poma@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DI1CPLA12N5H.16XL7T8INAAJ6@bootlin.com>
References: <20260423113024.2549245-1-jhonata.poma@gmail.com> <DI1CPLA12N5H.16XL7T8INAAJ6@bootlin.com> <20260429-b4-yocto-16211-v4-v4-1-211f27c4daea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 14:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236173

Hi Mathieu,

Re-sending this response with corrected threading - the original
reply (msgid <20260429142749.2046089-1-jhonata.poma@gmail.com>,
sent 2026-04-29 14:27 UTC) used the v4 patch as In-Reply-To
because your message-id was not retrievable at the time, so it
threaded under v4 rather than under your autobuilder report.
Apologies for the duplicate; please use this one.

Thanks for the autobuilder pointer. I have sent v4 (Message-Id
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

