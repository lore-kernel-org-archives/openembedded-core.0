Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34770D730B5
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 07:37:31 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6887.1775201841142597030
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 00:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=qg1b/s+P;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=U3VcmeqJ;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4A98C7A013C;
	Fri,  3 Apr 2026 03:37:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 03 Apr 2026 03:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1775201839; x=1775288239; bh=Xo
	szKGq69vgl+7TFxRPr4rRhdUFd7lfjTwHT56ieLsY=; b=qg1b/s+PybXlV1uSDX
	w4uGZ7yKZEjwTMalgAc05uMR9bg3YL42tgoVrUmeja6Oba86DJXGO0rtTi/UqjcC
	TnNDi2FCTAP2jH2fVBwi6RsM84MTstQjkyWzbsZIQPdGjIhbrlYsoD7vSDaFU3cz
	oi6n01mBwIBa+ti7LthHOxiTNlL0/rCL63MMpjT0vdWnYAtoJZeojHD6g6QiQWl9
	nM1zYaasP7E/LsSdo3jBLTO1iN2BaL1lcsyyEZGqAbUJoQuVSeHHisrLuKxj92I3
	wUKX6D0EJTIjbm/SwPXqfsFDV9xxC1u8kAqa7gGaEULqfzasdynNXFXKVXKDSLgF
	5wVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1775201839; x=1775288239; bh=XoszKGq69vgl+7TFxRPr4rRhdUFd
	7lfjTwHT56ieLsY=; b=U3VcmeqJVuPGF5UDRGZzT4Vbq+J0zgEHTL4MP0nytp3M
	VX295uQODxWkRBOQVaAWUFqc/DHXtmeefycWniC0hc/kstY+ntHGpLdJitV2g4o5
	6CtAe1nf3Drnn6NDCzqFuVG804hnfKDrPq+exT8Q0RhShT/mYlozqpFBvnHdvITn
	LeJKLwm9S9/U3SETc7cmECCklr9LwYtYLSv9baquxUH2T/eG+PYhyXqZVHz8uIO9
	+5Q8Gb7gqx+Zy9n7vISLaLNhZhC8MdjrdrQP40zNmS4c7avsJS8Nesdu0clow8f5
	doaGOfBHiDyhhHu4sRG0prFofsLEvaszf07S/nHwjg==
X-ME-Sender: <xms:L27PabjxdmrcA8y80PNnVD_bk7RKS_dYH7qGXoveyOYNSkD0zjIhLw>
    <xme:L27PaeDaA3BtaPKaJfEG6FPieLE1AYh2jz7sVNEUGXnCA4x1M1LpGrBPU9Azv7vdU
    b-trV1LOI2Cx6WCkQ9YXOYLI4QaQSl91JdyN0F64U_FK1rPNmgIr5o>
X-ME-Received: <xmr:L27PaYtnEmNE8OyYN-lqMvBNGS0FXA-5FJPGBSmfZ9CbkdicgvIn5MN2CPRLJdFSp20dHjSfFZdVRsbdknl2SKVQg5QFa0o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtredtje
    enucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggv
    vheqnecuggftrfgrthhtvghrnhephfetuefgveevvedvveegfffgffethedvjeeflefhle
    fhtddvjedvffegtdeludfhnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
    hulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghpthhtoh
    epohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvuggu
    vggurdhorhhg
X-ME-Proxy: <xmx:L27PaTZB2915WZXFBvo_sUP1asfK6R7gQZbdOFfsbQ-ECA-21WWAsA>
    <xmx:L27PabXFf05S10sQpaddcctimqiBXS86ZPM_jicIzr9ltBdAfz2t0w>
    <xmx:L27PaX63ew6YPA4D7ytabCUFJGRJSdblx3CUCFOjBUSQ07wYpEvD8A>
    <xmx:L27PaWgHRZkwxlkcPUmk3-fQptjHW3-Uv-KvqPyU0omNi6lQy2OpmA>
    <xmx:L27PaYEMfIVx8BKZESzQLquiXFenzKC3aKOgOyT0ajNv2hl8GS0rY8dZ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 03:37:19 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 03 Apr 2026 08:37:15 +0100
Subject: [PATCH] checklayer: Fix current_tune tracking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-checklayer-3-v1-1-2620496920cf@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIACpuz2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNj3eSM1OTsnMTK1CJdY90kyyQLyxRTw6SU1FQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loANQFPMXAAAAA=
X-Change-ID: 20260403-checklayer-3-b9b89d51bdee
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4050; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=XkjoSmWIBxt38AG3Hq7rWWhFSGgxB6WwIrdRG9i5h9c=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSez9Pz5ZFwe7P68MTcv6FrSp6lPFm8rOCtiLy7Sur1b
 +rft3350lHKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJNO1m+B+nfzf/X3FH5MNj
 F3iYe5rfetuxpuk85Lv06Z7kUhbrpa0M/3PzWJzlJrtoneDsumYcvyj0uW9zBYf7GqF9BbE12lP
 mMgAA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 07:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234559

Previous attempts to fix get_signatures() (see fixes tags below) were
misguided.

SIGGEN_UNIHASHMAP was added by commit 11373def3171
("sstatesig/populate_sdk_ext: Improve unihash cache handling"), and
exists to map taskhashes to unihashes for use by other code.
Importantly, entries in the list are duplicates of entries in
SIGGEN_LOCKEDSIGS_t-* lists but are not split by tune here.

The code in get_signatures() was not updated to handle SIGGEN_UNIHASHMAP
and so was accidentally treating these as additional signatures to check
for conflicts. However, current_tune was stuck at the value of the last
SIGGEN_LOCKEDSIGS_t-* assignment seen, typically x86-64 due to sorting.
So, we got nonsensical errors like the following (split for
readability):

    AssertionError: The machines have conflicting signatures for some shared tasks:
       x86-64 busybox:do_recipe_qa: 5638e2062f09663bf2536a5f91e8788511aa6c31eac8e173dae1aee49e895945 (beaglebone-yocto, genericarm64, genericx86)
       != ae5900e39ac275822744f241eefc7f0e707e43e03fd3107d82b5190e4a4e6da9 (genericx86-64)

The error only occurred with a hash equivalence server running, since
without one SIGGEN_UNIHASHMAP is empty. It was also non-deterministic -
a task only appears in the unihash map after the hashequiv server has
recorded a mapping for it, which may not happen on the first build after
a metadata change.

After this change, the locked-sigs.inc parser in yocto-check-layer is
still somewhat fragile and we need to be careful with future changes
that modify the locked sigs output. However, we can at least track which
variable we are looking at now :)

Fixes: 225923f3bfec ("checklayer: Really fix regex in get_signatures")
Fixes: a2f7052cf832 ("checklayer: Fix regex in get_signatures")
Signed-off-by: Paul Barker <paul@pbarker.dev>
---
Tested on the autobuilder:
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/27/builds/3565

Also confirmed ability to detect signature conflicts by adding
`echo ${MACHINE}` to do_compile in an allarch recipe:
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/27/builds/3568
---
 scripts/lib/checklayer/__init__.py | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index f9ba44d08d88..274dc7578fda 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -324,15 +324,27 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
         else:
             raise
 
-    sig_regex = re.compile(r"^(?P<task>[^:]*:[^:]*)(:(?P<taskhash>[^:]*))?:(?P<hash>.*) .$")
-    tune_regex = re.compile(r"(^|\s)SIGGEN_LOCKEDSIGS_t-(?P<tune>\S*)\s*=\s*")
+    sig_regex = re.compile(r"^(?P<task>[^:]*:[^:]*):(?P<hash>[^:]*) .$")
+    assignment_regex = re.compile(r"^\s*(?P<var>\S+)\s*\+?=")
+    lockedsigs_regex = re.compile(r"^SIGGEN_LOCKEDSIGS_t-(?P<tune>\S*)$")
     current_tune = None
     with open(sigs_file, 'r') as f:
         for line in f.readlines():
             line = line.strip()
-            t = tune_regex.search(line)
-            if t:
-                current_tune = t.group('tune')
+            assignment = assignment_regex.search(line)
+            if assignment:
+                lockedsigs = lockedsigs_regex.search(assignment.group('var'))
+                if lockedsigs:
+                    # This variable contains signatures we want to compare
+                    current_tune = lockedsigs.group('tune')
+                else:
+                    # This variable isn't relevant for us
+                    current_tune = None
+                continue
+
+            if not current_tune:
+                continue
+
             s = sig_regex.match(line)
             if s:
                 exclude = False

---
base-commit: e954a94b5b528b2430e8da331107d7d58287f89b
change-id: 20260403-checklayer-3-b9b89d51bdee

Best regards,
--  
Paul Barker


