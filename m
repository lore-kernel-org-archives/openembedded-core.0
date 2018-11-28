Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DF5356C573
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 16:23:50 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a18so2544762wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=67naM6v/0J1/nzegKZcPJbc2qpc3z/hN45PgexwFRcE=;
	b=hjWWtg4NQCgoNsK1HASzQb0+nCqY7PNIWo1PZ1gMQs9LUPB5shtzf6DjUUDmfyyVCM
	Vr1JlfMJtUNBN5TNV2lMAk4Y5IGZ8kBGMS34YBs8ZS5ibXWKMngveego8cQqcNBy9zhI
	WH3ciFTTz2puNNwqR68JXNOaBbs4MUq2vmnGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=67naM6v/0J1/nzegKZcPJbc2qpc3z/hN45PgexwFRcE=;
	b=cOp4qtH8unHhEusocLcuxVqo24EwPl5X0cLjBKg863gS5hvJCBw0aWg6X/KSht6GGF
	H8IbYSdRt+XE4kdJNpmb+0y9g9waqqMLzmnU2c9ulUzbheFzwFrtOkXZKGlzXoE0wo/i
	1VoY5hicW0CKPppTyW1xtFCP/fsABfhkzMnorCDzfruNkDFIiq6ObFF6TySU/GbTAYOu
	2mVswXN4czowOabAzyEWEtLsfebS7erRSZDhm4G57YFYZYByv8wK64Yd4MJxlcD2X7dV
	9YhDvjsxB+fNfel8/90+38apNcKpIQEUVWCVoGf0Owu06s0i3XRxFzY1ZwVJY1/Bk/hY
	qezQ==
X-Gm-Message-State: AA+aEWY9seZ/5lfTvP9AcJEESDJV8fwkBgNxSHWBDuOusYWx0VWj6MU7
	qNJnPcj/WIQ8ZbzMXHBaPw3oL4DhAqQ=
X-Google-Smtp-Source: AFSGD/X3HgRXSV+2S1R3jmuwIgozxWnb7PH8TWKTPFXdt7yaN1Wx+uoYHOcLECcsJOE2OvTU7h29qg==
X-Received: by 2002:a1c:da92:: with SMTP id r140mr3503729wmg.136.1543422231198;
	Wed, 28 Nov 2018 08:23:51 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l3sm10033017wru.36.2018.11.28.08.23.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 08:23:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 16:23:46 +0000
Message-Id: <20181128162347.16512-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128162347.16512-1-richard.purdie@linuxfoundation.org>
References: <20181128162347.16512-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/4] scripts/runqemu: Fix logic error causing failures with MACHINE from the environment
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
X-List-Received-Date: Wed, 28 Nov 2018 16:23:51 -0000

MACHINE=qemux86-64 oe-selftest -r runqemu.RunqemuTests.test_boot_machine_slirp_qcow2

fails yet

oe-selftest -r runqemu.RunqemuTests.test_boot_machine_slirp_qcow2

with MACHINE in local.conf would work.

It turns out that:

runqemu slirp wic.qcow2 qemux86-64

works but:

MACHINE=qemux86-64 runqemu slirp wic.qcow2 qemux86-64

does not.

The reason are the misplaced return statements in runqemu, its skipping a block
of logic when MACHINE is set in the environment when it shouldn't. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c79be9a8461..3786646c5d7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -475,14 +475,11 @@ class BaseConfig(object):
                                        "Try 'runqemu help' on how to use it" % \
                                         (unknown_arg, arg))
         # Check to make sure it is a valid machine
-        if unknown_arg:
-            if self.get('MACHINE') == unknown_arg:
-                return
+        if unknown_arg and self.get('MACHINE') != unknown_arg:
             if self.get('DEPLOY_DIR_IMAGE'):
                 machine = os.path.basename(self.get('DEPLOY_DIR_IMAGE'))
                 if unknown_arg == machine:
                     self.set("MACHINE", machine)
-                    return
 
             self.check_arg_machine(unknown_arg)
 
-- 
2.17.1


