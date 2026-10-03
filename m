Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F39ACA5FF4
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 21:43:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13636.1791063795683132748
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 14:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HowcldC/;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afe75f055so523476f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 14:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791063794; x=1791668594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h37iQzfSjWKwnQrGz7g5jtJoX8Bm1TyhFG4iqN0tii0=;
        b=HowcldC/AWh9QVQyntGd2kaedv+C79GFSicfy9JiH9f1cjlHWJRIZ60foFk6834/+w
         Zh/fpcsRTGaoR77iReRotL8rTcaXuooiF2xwYUmwvsXoDLA7SS+8zNBT1jmJxkpM80Qf
         uuqsH2tM6WOK6je736mTIidamy77F5XWBqnDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063794; x=1791668594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h37iQzfSjWKwnQrGz7g5jtJoX8Bm1TyhFG4iqN0tii0=;
        b=gfm12JWT/oKcSTr9uO3AMX096yhL+5SIRNbOr6VdwVT+E0TqVOTpSXzu/1aGMYzrXi
         ogZKnF+VCJlFCR/5GpCDC6iyY0caaC0HBqJp9YzCRTeCrnjT6Wt9G2hpsqZXwfzmO+yf
         nxp92ubyGdA6ZsxKZnRxeXmjSI6dkEhrJWPy2gto2jmt9haCi4VrwGhNG8MOlFqhgo23
         TDXAqFVil6sDQTzmdW8d3UTLrA7+3Om8ixqEgjmoM3hztbYsmazjDErN+SN+aATX1nBb
         JVnewnAyT9vgyLK/+mv3q093yWoLHuGXn4r2kCY0EkJ1kvsYrIw8F8dY5RvezgUhFZ5E
         iHLw==
X-Gm-Message-State: AFq9FYLNp1MxEYvrikI/pMbZ9BNwFA8K5E80bwNIyzyyhrvm182nTmjp
	pVcFdDT6w8Rvh4z1cJ1VbVQtbmAqJIhnIxnYjF9mRCfQmh9GkVKz0D2bjM4QOyJ2hvsXIfoprgr
	5au4e89o=
X-Gm-Gg: AYBFou3yH2SZXDhhY38gyP0LmUWb/5mOlJ4XBFREWk+qIf1ueSxI3G1QF/vEJB7rScg
	hAUdhR9VCv0hL8HC7y3EzebSyinrVrOemgKdObyxNBeWZinOwbUAlXU6X/d8la/9One+4FIpO4V
	dRdSM4qH3tQ7elvoj5Ij7SyxVW1+PFEBln/ZMb1CQcvm3x9EOVwJTtC0I6cSGENl3CDnpKrPqNw
	ZAx8EEVv8teZfSbCi9ZPb9sQlNfJ0sn3vDjy+2sQvci6XzL4kNU1vGKV4Fl68Q1Ao0k8K7K5uYT
	+tpz0OqGBvKXRafJOKB7LTY3GhcQKYYyfWWBw+JJ1jA629s+C14C1ru/pe1Qeht/MTseMUtOISq
	/1ST3R0KGiu1t2SPm4ZgOA044CByOApcdAikz2ZxF9yqvU9WVRZjzPaeBp3J7hG6jewF+e/AwQL
	7oir1PWHZAWzB/bU3YOU3Fkps/fRY4+tWIMn6B3jNlRcMIVDiqZ+Jgt3o0yKOQooEhKcttjNX+6
	cOkiOWTAeCpMcz5guoX2yHOYAbsqg26TdmHGIeWSykgIzpHBG015gqO0EHpeehzCxQ=
X-Received: by 2002:a5d:64e9:0:b0:48a:fdb2:f2f4 with SMTP id ffacd0b85a97d-48c4801be23mr5904847f8f.57.1791063793974;
        Sat, 03 Oct 2026 14:43:13 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f04e2sm12832952f8f.15.2026.10.03.14.43.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:43:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/8] sstate: Update mtime/atime for sig/siginfo files in sstate_checkhashes()
Date: Sat,  3 Oct 2026 23:42:13 +0200
Message-ID: <2bd595a9d95fac64174a25759124a0aa3d0dd001.1791061402.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791061402.git.yoann.congal@smile.fr>
References: <cover.1791061402.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 21:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247181

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
index 567797305f2..f2fc4e99524 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -978,6 +978,9 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
         if os.path.exists(sstatefile):
             oe.utils.touch(sstatefile)
+            for ext in ['.sig', '.siginfo']:
+                if os.path.exists(sstatefile + ext):
+                    oe.utils.touch(sstatefile + ext)
             found.add(tid)
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
         else:

