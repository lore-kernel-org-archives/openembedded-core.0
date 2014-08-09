Return-Path: <tylerwhall@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id A9BB265F81
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 22:44:11 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id c1so2640109igq.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 15:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LLphvunFRIpQhRGm7oHdKcmy/FaGQJgp5T6cov8peTk=;
	b=y8VyoQTSHMhO3oKEHDQVp3vbQS8JXel2xvSsW+pTpSA2VPPWeTwEA6AnvJVfz4IPY4
	UBr2C/VTIsD2FjIMsMMGbK3NXC4r+uvIk4a8/6e6O9npoWgE2WeBvxkSANfcK1X5yXOd
	z94Ow941HYTObQCTjC3/vdLZtnPUWj7MSaZmZm76GRwhORjZUcHNxzVcoZ5y0SfVBT69
	+R/wZvZnJKEYNtgdTFEIdzT/taJQSU/RWiKu0yGCHGI23zdjEOPLKGojigw0P+rRYm5k
	PjcOF66UxDkFUEVPbd5dUv8xzSSl8dgF+hjToDZxL9D+xvB7ds7gcnrBfNXsdxEMuceH
	vH9w==
X-Received: by 10.50.66.197 with SMTP id h5mr17227004igt.34.1407624252064;
	Sat, 09 Aug 2014 15:44:12 -0700 (PDT)
Received: from localhost.localdomain (CPE-76-177-97-210.natcky.res.rr.com.
	[76.177.97.210])
	by mx.google.com with ESMTPSA id x3sm27287087igl.7.2014.08.09.15.44.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Aug 2014 15:44:11 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:43:56 -0400
Message-Id: <1407624237-21625-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 2.0.3
Subject: [PATCH 0/1] Fix TOCTOU issue with sstate mirror
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
X-List-Received-Date: Sat, 09 Aug 2014 22:44:19 -0000

When attempting to use sstate from a mirror, the siginfo file will be checked
twice: first when deciding whether to run the setscene task and again while
fetching in the setscene task. If the file is removed from the mirror between
those two checks, the setscene task will run and fail. This is acceptable since
since the real task will be run instead, but currently the fetcher will emit an
error message which causes bitbake to return a nonzero exit code. The build
completes successfully but appears to have failed.

This race has occurred several times in practice when using an http sstate
server that periodically prunes old files.

The simple fix provided here is to downgrade the internal fetcher error message
to a warning and let the do_fetch task continue to generate its error level
message.

This is one of two paches. First openembedded-core must be patched to ignore
the "Error:" prefix when scraping the log for this message. Then bitbake's log
level can change.

Tyler Hall (1):
  lib/oeqa/selftest: Don't match log level in output

 meta/lib/oeqa/selftest/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.0.3


