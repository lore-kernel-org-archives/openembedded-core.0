Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E31C9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:44:07 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32862.1790495037266535505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OtHFAwZg;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso1182736f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495035; x=1791099835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1c5NfZ3Wf48RJgYI/DHW03HlYlDUCv46e/Wrl536QH8=;
        b=OtHFAwZg66na+fcUohH4mCTKBNOaojgX3EYfRqILS2IXnRZwweilQh9vfPEdEaInXQ
         UsKj50gS2R9Xq3afe8WGDUloqY2qTnADjugIfpfQMXPB4C2sjoJ82npRVaw2GVqM/B0+
         3iD6dbBM6tsFEgMJIq1/zev8HLqC/IgAhuUPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495035; x=1791099835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1c5NfZ3Wf48RJgYI/DHW03HlYlDUCv46e/Wrl536QH8=;
        b=OrN1PnvT0Z78Pb5/yy28wvqS3kqMWN9NqE97eh/7F2lAeMN350p6SZmIJgz5v0Ov41
         A+PNDH79HdtNNtJXxqX8doG7bWQXmllaDj51md0YMJrFK4NK+X5yS25XjjsKr6WcBQv9
         FmxsBsovnXaAz3ECIoIqK2yhusYC6lMALSQdH6zcvpJpuFDNAVnrUKaKUC2Rxyf4lh/E
         RUZr8Wtw/qtfuGp1eFEKe1k+hPPZ/erpAKDmqYLavj0YncBZ1w0EAdLXGKAXImMLl9QA
         BFnr44GoaUVNy8cy84+p7XZQVfx2TQa8RqyR/PYp01MB8muUjPNJZ/UMwiF2RvCgtsLi
         jrpg==
X-Gm-Message-State: AFq9FYJNI3vAZ9JeFl6RHzFQZBs46fcl14YEOG40joDn2RH+h1uYvA1F
	L/ufZkW1TJif2Et3ryNbYuEj7KOu06YA0TQZw7mzGu9VuIp31tG85FSFmvPWtN31X9npqmNmUw2
	ehyv/Dq4=
X-Gm-Gg: AYBFou2mKWXbtkFL1V799zZKpKc71Q6NK81CRTqrMaBZSvTtAqruzq3HQz0PnFqCh8x
	z9ANnku1rC2JgL8sqrxyKRiPu7PZlgTqUBSNZrMrnaCvXXer9PxEdcR4QmANDUdI/z1yr9dL9uV
	DLXGgJtMkb6f7NpvwE8ASsqucnHvioAfllA6HUd9zukch7XkHTgfQpegy6HeejsZRBIqib/jQs3
	FPi/EBzwR20NZ109Klo2bYnHYPESaMLRX97xJNC+8HwbPMuvPV2bwkdw9jicJ4O/u3r2hRi+vX1
	l9OoJJBFV2grT1lDWjGCIDH5nQtlRl67xoyTcDRM6RvpIfbIwTfWPVj5ETxgb6fbKtA/HUy0wjp
	fQx2WNohS/jaAB6np6gzoYSsPLjSgBHzLm7MEOlElkcQfjwREpwPf7pNm62MhIuS2/nAGJkc3tq
	SnANqqcBvdDpf2bH/qXF4AyDSAWBxwKbB0l9tw1MQ5CGEOpez1VtehFDJKExplbzJTzP1V+nNbv
	k3jZ1nxQtGth7Zgd2HSZEr6VcbtgNta+/1KmwYfKVCXyfL5QE4FMiHEB6kVrlBhva5cUz3HWpk=
X-Received: by 2002:a05:6000:2909:b0:487:a49:69d3 with SMTP id ffacd0b85a97d-4887db555d1mr12151644f8f.55.1790495035509;
        Sun, 27 Sep 2026 00:43:55 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/28] sstate: Update mtime/atime for sig/siginfo files in sstate_checkhashes()
Date: Sun, 27 Sep 2026 09:43:14 +0200
Message-ID: <53a663be633c5bf4d1aeb5924705131068d7ae82.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246673

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If we touch sstatefile, we should also touch any .sig/.siginfo file if we can.
We try and keep them both updated with accesses so one isn't removed without
the other and they stay consistent.

[YOCTO #15289]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc07895f951140dbbffcf32d3eabf65788cc4d00)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/sstate.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 4ac63823351..5beeded1e88 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -977,6 +977,9 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
         if os.path.exists(sstatefile):
             oe.utils.touch(sstatefile)
+            for ext in ['.sig', '.siginfo']:
+                if os.path.exists(sstatefile + ext):
+                    oe.utils.touch(sstatefile + ext)
             found.add(tid)
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
         else:

