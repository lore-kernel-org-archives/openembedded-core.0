Received: from avasout01.plus.net (avasout01.plus.net [84.93.230.227])
 by mx.groups.io with SMTP id smtpd.web09.9510.1628697511783993565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 08:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=mM/AQHN3;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.227, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id DqcdmuSt07w2vDqcfm174H; Wed, 11 Aug 2021 16:58:30 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=YueUu7QX c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=MhDmnRu9jo8A:10 a=-An2I_7KAAAA:8 a=7PZDOzIidoxbgkZk1WgA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=Wub7Bf0VM9AQ/6vgXXVMGcPHaccjP6wAYUTJ7a9Q6j4=; b=mM
	/AQHN3g5b3htwlypQMN+2aDihJtYsnsqZpWTY2S8auKJZlpt/xGnCltQ9WuIfLGOEqrl4kF3JUXuO
	SODQOVV8Kfyr8OxLe8YSUUXTNXSyMkfzMyfPnUdzVJyQ5E34RK1HegDBSEpBQW1GsAbrWXChcd9+v
	LXE2AfKVZcFMsB1vjXXN5PC2pnuFhfrF5Md+cfCMsL3F47+ZAihIgPLHVXZlHC/Fb7iVG7Lx66gB1
	Ez+1RGk034Q7c2cZBFU3IvBhnoOkAbEWNGTqr58jSK+9PcJy5a/HBT2aUD2xze1T7A46Noi65m5E1
	BqZELELD/iVRfxZi39rGACxTqpbcKAsA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mDqcb-0001NI-Sm; Wed, 11 Aug 2021 16:58:25 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [pseudo][PATCH] fcntl: Add support for F_GETPIPE_SZ
Date: Wed, 11 Aug 2021 16:58:21 +0100
Message-Id: <20210811155821.863938-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLJXABEogzUosovQVPxX0DDKe2wLsGOgPfmUBvfpDKUv1kHpxZX1oPI6yQ5cDK/39O2+UlsUd3lRjjHA6ZnnXv8cN9G3arCdA2DXjfZAeb+7/ESA+Hyp
 z9NgOg2LnVX3e2axvgy0eX5K4afFBP6rgyhFtYJAcu2LwKVRGOt7CwJMDUn9j+rZzxjUp3KVGFIBfg==
Content-Transfer-Encoding: 8bit

When running the test suite on my Debian 11 box I see many occurrences
of:

 unknown fcntl argument 1032, assuming long argument.

(for example from test-execl.sh.)

It appears that this is F_GETPIPE_SZ and it takes no arguments. Let's
add it to avoid the warning messages.

I could add F_SETPIPE_SZ too, but that apparently takes an int argument
which would mean moving the va_arg call into the switch statement. :(

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 ports/linux/guts/fcntl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c
index 434c7f3..e9c6140 100644
--- a/ports/linux/guts/fcntl.c
+++ b/ports/linux/guts/fcntl.c
@@ -37,6 +37,9 @@
 	case F_GETOWN:
 	case F_GETSIG:
 	case F_GETLEASE:
+#if defined(F_GETPIPE_SZ)
+        case F_GETPIPE_SZ:
+#endif
 		rc = real_fcntl(fd, cmd);
 		break;
 	/* long argument */
-- 
2.30.2

