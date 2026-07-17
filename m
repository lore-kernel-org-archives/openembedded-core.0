Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141D1C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:34:56 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14990.1784298889318121029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 07:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YPSoLrcz;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8eeb4508f29so80459256d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784298888; x=1784903688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tNJNDh8P2m/LSO/Wc3vK0FI0h6qRwMo7WlQM1/KTv8=;
        b=YPSoLrczhdK7GKpRIbwppwjrtD/0Cz2zMIFoxAazxCQQhe77MbIHIomoImuSKPiroV
         DnYO294YA2i2LoF1KWBblCyjtPDBEJcyukQnDimYcdBs2wlBBS3vdDBb4xZywr70l3rR
         HbCVdC2CPKJ//3GZWIGHQ9LqNQzX8YHLcUCpvgaHvv+wpd0nK/3qtKqT/Tm7PnnWCK1I
         NEnZdbURFwqxhM49Me3G3K7pODzd2RgxLyvP3FpgKtVmpOqAaCmbwn1shZIOb1djS7b8
         Jp1u6naBhUmiTG9iKCB2vukLCCYF/HroWzk3e67UiFhoHduqwZ712UnLs+00x6yhC7Gw
         CXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298888; x=1784903688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+tNJNDh8P2m/LSO/Wc3vK0FI0h6qRwMo7WlQM1/KTv8=;
        b=VQIXfGmM1LZkylVoPzu1KqmvJzIQwxCvt2gLXLVCBLIzpGIzmfsIG3Ik/DzPEBIHWn
         x5XnAsStlbZ2bN4hAB4blgeCAiOa5WAyCKSMIH52CQcVsgd2fgww2xLCudBylESdMqnV
         jXdugbkrR7cPT5L3oADLw8BmUyS/efkuNTioLjoaHrl5aYW6ULxGDmTJ2OL5muWgXRWR
         YGxRRes7IlARACqOgDEGvSDNWLnqQ3T0E4A5vmXyTabL11MIife1xXLq//3C/0sZvH9i
         VgdgNftTALiCG+jS7ptuvaZT4t14VAk2iH2XMXjaqq+4Q6Z6BjokIrOl0SNUNR/MT05+
         1tuw==
X-Gm-Message-State: AOJu0Yzmg7q0H1JvJy99+jibN/webt4ErTKSTChal17qp4+UFVwQoEq+
	JknqffJeOV1+nb8F18GJfmvapxV4B5+Wyxl5l24SgGSfXSvFNwo+TZPiHxXNeg==
X-Gm-Gg: AfdE7cnalXK8UyTV8UdUiAGtBDRQppc+EoFVPbwt6Z0yv9K2jbZ+9iMS3G9KWKwNQ9s
	EqE2syuLTHtxUF0J169OMrpABl/+T/eKzuxgO6DjqipRlADdDQsM/XLtfrEYwTZdD7odfRu4Mwk
	1wXOtOKIj2Y/TLdFONUxBH1EBYDJsM644gaaD4HTOd0e16Pfs3IH7I4LVWcOUGdjNZxTXVc2QpI
	sKMwK3RSIq9Jj11gjbCIx6MXmOcXl9FSbMTXEQNQq/VazxfZixXipz8slnNUOQNLGz2EVbTsWvK
	WQt7niE2bfUQXHNokvxnCwONgV8YSnNgqpxypIQy8ne4dKUQy4Cg51UnQ2njC8AQF0s3AL7aPeV
	zUEnhWzJO4kAqofzmcmzhQnBOforpeRQqZ5v6e0xJOtUEgkuZWoX5R4BTvLZfdErK/Cu5q+HANA
	jQTAbBf43Q0if8Uh4132w6Ap2Y1iaB/h31Wc0Z67BY9MKN
X-Received: by 2002:a05:620a:2901:b0:92e:573f:c2 with SMTP id af79cd13be357-930b43147ddmr311408485a.72.1784298888140;
        Fri, 17 Jul 2026 07:34:48 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b5493cb0sm165208785a.42.2026.07.17.07.34.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:34:47 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/4] oe/path: three fixes plus selftest coverage
Date: Fri, 17 Jul 2026 10:34:21 -0400
Message-ID: <20260717143425.3521709-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241196

While adding unit coverage for the copy of oe/path.py vendored into the
standalone wic repository, three real bugs turned up in the shared
meta/lib/oe/path.py. They are fixed here at the source so the whole
project benefits, each as its own standalone commit:

  - __realpath()'s isdir guard assigns a bare `false`, which is not a
    Python name; when os.path.isdir() raises, the handler meant to
    absorb the error raises NameError instead. Use the builtin False.
  - symlink(force=True) cleared the destination through remove(), which
    globs its argument; a destination containing glob metacharacters
    could fail to match itself (leaving a stale entry) or match
    unrelated files. Remove the literal destination instead.
  - canonicalize('') and canonicalize(None) returned the current
    working directory, because os.path.realpath('') does; a stray
    separator injected a spurious cwd entry too. Skip empty tokens.

The final commit extends meta/lib/oeqa/selftest/cases/liboe.py with a
PathTests class covering oe.path's own logic (join(), is_path_parent(),
symlink(), make_relative_symlink(), canonicalize(), which_wild(),
realpath()) and locking in the three fixes; backing any fix out turns
the matching test red. oe-selftest -r liboe.PathTests runs 46 tests,
all passing.

changes in v2:
  - No source changes; the three oe/path.py fixes are unchanged from v1.
  - Expand liboe.PathTests from 37 to 46 cases, mostly around the
    harder realpath() contracts (self-referential and A->B->A symlink
    loops both raising ELOOP, multi-component resolution under
    use_physdir, and the assume_dir ENOENT-vs-tolerated contract), plus
    a dangling symlink(), a make_relative_symlink() several directories
    below its target, and two more canonicalize() cases.

Trevor Woerner (4):
  oe/path: fix bare `false` NameError in __realpath's isdir guard
  oe/path: don't glob-expand the destination in symlink(force=True)
  oe/path: canonicalize('') should return '' rather than the cwd
  oeqa/selftest/liboe: cover oe.path's own path logic

 meta/lib/oe/path.py                   |  21 +-
 meta/lib/oeqa/selftest/cases/liboe.py | 376 ++++++++++++++++++++++++++
 2 files changed, 394 insertions(+), 3 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a

