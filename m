Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEFEF364BC
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 20:35:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.142161.1775766932370638234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 13:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZGe5kvTt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a041eae5so9515095e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 13:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775766930; x=1776371730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=12b/5pPch9Aq65Y1fK3mBo52T79C/leQ93FGq3dIWwI=;
        b=ZGe5kvTtvOknWJvGnVgl71wZTF2OsoMOScSyoTedo2DqvG+dz5rA+fOIxz4nVmvhPR
         roO/9N1yjo66+yO+Lfm8O082+jPUt//tU3xNASzIa5ml98Ml9BLSKub7Qo3Cfj0xMtp0
         Kjfrgu7M+Urh4UIhwolyHEQBarOuxbIN5Qplo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775766930; x=1776371730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12b/5pPch9Aq65Y1fK3mBo52T79C/leQ93FGq3dIWwI=;
        b=VEZLwvsZkfEoJbwS0JQGrqVqZmYaAHdt9FdF0XWDCBS1xRkMtleYWswDsP2DLU1XZq
         6Hw9iMwdFWos5kWWjYTWiYk3t5PhwBBDFE7FMstMkmZyyZnNv9E35/1/j3Di0j+lZE70
         WTeGQGgIXE9KqM3O1PBbKcfpf8amwunVjllV6LtVoImftQ5c92UtN+GPKJpWImFgkPEM
         5lJ6I2Nn3WerVPO8v4EUPN+/gT0AeEX4PtXmf41jXkC6PNPxKztfKu3TvWjjmo4plrsq
         0LSjVYv8+Czd7wl+dpXT2VpXxOK5I+7df14JU5Uk6B8AIQ0n6DlaNFBIwi/ETbrGlGP4
         U24A==
X-Gm-Message-State: AOJu0YytF4i+AfBwVUJ0bpkk+QAY9VbbxueuksqD++4Mu07Roaj/2tkt
	91v24J9QF26eUt0lj6xd0dY5i0UqPZZwcpn9RJN2r449ZygVz64rZnDfa6gJB4c5q4dg0nSZIrq
	hpa3Elqs=
X-Gm-Gg: AeBDietuSC388sb8r6rhbaksruzYpzJW5E1Vm3IAFoKYD6qai+zQ3ose3lgO5MOduuL
	EV8VfgOHo5eRzPD54i3t26O6DUxDLeB/z02lu6FPDXPBs0uDZ5bX5uQlkfoU4K4E01CF+sFtlSL
	ikVlflX24jZMu4LcLC2f1j3Q8ii5mkuH2apx9bjENHI3Hon7rYlvLSGkP7gMO5BkDZAbeBfF2L3
	ers1UmcJm43q8/jBs5GWPoZ1hF9ATdBDd99qt95U0Qxrkg3SLF22R5ntYhLe2+jMP8dOGnNHYdm
	3Ai2y1RsHXJ+vS2nhDQZbNSrWg7bPx8zFVcF+fBFGTXDKbr27VJnacUd7W1nOsUPvYDX3VYM7Y3
	aB3t6qA7y6CIPjTMJottsLdRNvTzVxKaLBOwS2c9M8oxZh/ULHQkCFMadcatc1b55m3VbsmyOmN
	SgspTfbOl+kyvVMptfUaCZojtQH5p8/zz+WsOWru21uPHvHMtc09eN
X-Received: by 2002:a05:600c:8b16:b0:488:a916:14a8 with SMTP id 5b1f17b1804b1-488d67e3773mr2897805e9.10.1775766930097;
        Thu, 09 Apr 2026 13:35:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c642:6c74:9bb7:e65d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dbcb66sm3878745e9.9.2026.04.09.13.35.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:35:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/reproducibility: Work around subunit protocol limitations/bugs
Date: Thu,  9 Apr 2026 21:35:26 +0100
Message-ID: <20260409203526.3540882-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 20:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234948

We've seen reproducibility failures with:

  File "/usr/lib/python3/dist-packages/subunit/chunked.py", line 108, in _read_length
    raise ValueError("chunk header invalid: %r" % count_str)
ValueError: chunk header invalid: b'\n'

which leads to:

2026-04-09 01:18:20,886 - oe-selftest - INFO - ERROR: broken-runner

and UNKNOWN status for builds queued in that runner.

This appears to be when reproducibility builds fail with:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/bringup-fast/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/reproducible.py", line 407, in test_reproducible_builds
    self.fail('\n'.join(fails))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.14/unittest/case.py", line 750, in fail
    raise self.failureException(msg)

which is possibly from bad placement of '\n' in the byte stream. It doesn't
100% reproduce since the placement is critical but from the subunit code, it
does use <int>\n as a header in the protocol.

I've wondered if the presence of "\n" in the traceback code is part of the issue
so remove "\n" from the traceback by writing the python code differently just in
case it helps.

Ideally we'd report the issue and fix subunit but I was unable to work out the
exact sequence to reproduce and any fix would take time to propogate anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 7adeaacd4f5..9ed7dec591a 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -404,5 +404,6 @@ class ReproducibleTests(OESelftestTestCase):
                         native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=package_dir)
 
         if fails:
-            self.fail('\n'.join(fails))
+            failmsg = '\n'.join(fails)
+            self.fail(failmsg)
 

