Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web09.198.1630174472811521098
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Csra/ioM;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.173, mailfrom: steve@sakoman.com)
Received: by mail-il1-f173.google.com with SMTP id h29so10913950ila.2
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MqTx54pbFFfPr7SKf+vsMFEviWKQXyKfuOeAQ3Aux+o=;
        b=Csra/ioMrj8FFUYG0chroWnIaMJoUCYbau7lGs6QME2PJW+mPd2OcA6NJnrqZm5yZ3
         57a6sqxyvcsBtFM4qeJbUKXlNvSRJQEwaYJTtKfF0cY05+BPe9qSyBs6e0HUQvRQCt7Z
         txCesaHqmEZSZNQqZ/ZmPAioNR5niDIbfcZ1abRRtRs/a7IrQtX1S4lpV6hWMsnHaw9S
         wpZjeyfgkUa+Mml2HoOUYN7DWY6zWvTKDgSSsFCCCDbmqJSKmqd5zIJPYZHvw31fzcij
         1W2UBD9box+p/mGymme4F4YGlTBXlpQ5enFw3yEIZrlQecXhncQeKsc5JIf8eydekCjt
         /LGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MqTx54pbFFfPr7SKf+vsMFEviWKQXyKfuOeAQ3Aux+o=;
        b=OHnIdlwTfzArkljm9Ax9JLkcgWiAMTafOnHVK6QThyoKMUOC+E0jfwhCtJSHDTv9lE
         JNZu3X/2WItRPtxfVcxKI7zXsZ08PkWDPsAZE5qixlyvUqnFVlLpKFhrih4GYksEtYKU
         ThRcuN3fq9OcOooYM+PkroKDO2Q7JRajwGcBTmZqK8jSSDcRVwB+1Rr+SrMVbmnuf9k/
         F0NQc9uvi703rEKTSw6gEXddvSTZE2lF+LLEoe/MPIXE6GZCv82z3LsJJLAxFHMj8qvN
         aZ66XYs6hhRpoz9IbHtLN3EUwsWuMofKapLklCcmh/YZ6TwzM+EIvU3TJpgv0E8S0KpJ
         /FcA==
X-Gm-Message-State: AOAM531abzQDXftxZC2xluNjfoRYB61HGPiRis15MaxmpjbojLY41cqW
	49Su2Tcs0G29NJrMINXzKfQD+HU7JqIX33Ih
X-Google-Smtp-Source: ABdhPJz1iY5jjV8lmtUx+nFjnNfJKgFtrOEHBNFNQE6kHmin8h9mEEkjF1ze5ErcwhAMbelhGfbldQ==
X-Received: by 2002:a92:870f:: with SMTP id m15mr10966806ild.2.1630174471826;
        Sat, 28 Aug 2021 11:14:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.14.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:14:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 31/36] image_types: Restore pre-btrfs-tools 4.14.1 mkfs.btrfs shrink behavior
Date: Sat, 28 Aug 2021 08:11:19 -1000
Message-Id: <6de30e62fc5815edc19c96b49c0ff9681298c56c.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

Currently the mkfs.btrfs generates large images with a lot of wasted
space. This happens since OE-core updated btrfs-tools from 4.13.3 to
4.15.1 in commit 94b645aa77 ("btrfs-tools: update to 4.15.1") .

Note in mkfs.btrfs(8) manpage section -r says the following:
"
  -r|--rootdir <rootdir>
...
       Note This option may enlarge the image or file to ensure
       it’s big enough to contain the files from rootdir. Since
       version 4.14.1 the filesystem size is not minimized. Please
       see option --shrink if you need that functionality.

  --shrink
     Shrink the filesystem to its minimal size, only works with
     --rootdir option.
...
       Note prior to version 4.14.1, the shrinking was done
       automatically.
"

Add the --shrink option to EXTRA_IMAGECMD_btrfs to reinstate the
original behavior and un-waste the space.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c4a99d36967302c176b62fad840b5e79486ea356)
Cc: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index ff42ac9423..6dc0e094d0 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -240,7 +240,7 @@ EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLO
 EXTRA_IMAGECMD_ext2 ?= "-i 4096"
 EXTRA_IMAGECMD_ext3 ?= "-i 4096"
 EXTRA_IMAGECMD_ext4 ?= "-i 4096"
-EXTRA_IMAGECMD_btrfs ?= "-n 4096"
+EXTRA_IMAGECMD_btrfs ?= "-n 4096 --shrink"
 EXTRA_IMAGECMD_f2fs ?= ""
 
 do_image_cpio[depends] += "cpio-native:do_populate_sysroot"
-- 
2.25.1

