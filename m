Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391F3C30653
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:59 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.4275.1719778135510432554
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HSPVnFlW;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.182, mailfrom: steve@sakoman.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-376243a112cso8196135ab.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778134; x=1720382934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtzUmIbood/MOb8bfAsJXVQf12gfqsLGkOuohm0rC4A=;
        b=HSPVnFlW9cvCbEFS57qIz1r6I9u/9msF0+GUO1UfhicfuLAqB15LFuxX3Pp4JXHV4z
         NVdBuh8LV03YnX7rq1KTL2SD23DgfpihQYG3OCPmynCySMFDkwBapj1OEgMQfGfNCtlE
         ikknHvHgH04P0DTt1J9nSAZ7tbdsDs77dFLVNGpdFdLWLBlWsIpatZifWyluTXjvJ10k
         u6v9+gwRCI+ruSaku5L6D9exezElCMVjmRjSerWx2MWBYqTW1BJLTIgDsOIWDZ6st5Cb
         tbjaPG55pDkRxJugxJuPcqVbipfH+eFHWc7f7srnqtDQIlZyD3aWlXSSVvm+TD5qpIr6
         yIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778134; x=1720382934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtzUmIbood/MOb8bfAsJXVQf12gfqsLGkOuohm0rC4A=;
        b=oTOvUvGTyglAxEYVA3HT3CjrC1W2Vw36vJo2/PH2StjehZNGFCr4AqFdDj1ta80UFn
         anUFt0P7cOdV42Dt1DZWfjHzINyd0DAve+CJBsNsTmCCdyCtyn+2uT7biT4jnq3+h7Wg
         jKzWNXdLa29kSHMCj0r7wbJCeUkJasbT7xi7bP9oLCEV7a42p1W67hyR75UvEfBL0dkv
         vhGLw6deUxe+W3AjlWt2tqi1zRjspo0LixoQfBFcvetS4C1s8MP8ysnb3dQsa/mdQasU
         F1rumt5a8Q2+MyYTlZzuso/tA0g8Es9Pm46FuCUQGVkHW91JTL4RfbsePtMGsckFt0Xh
         57CQ==
X-Gm-Message-State: AOJu0YwFRRE8XRxKU/sCfrvJLuD1G5EKGWv4Ga86zEijJaIRwXLwrSLv
	+Bx7D3xDpMATSF5dgGutie4mHk5+KAHq8FH8WtVIU5n6E6y8ITCM2cJdUddlM6eell52PrSZgOc
	leKw=
X-Google-Smtp-Source: AGHT+IHHa9iKvceAhjzJXHGpmX7IcYKYt7XJfK5tzSgts30AllesRdFeZAO/CgtsV5Fey7iyGN89EA==
X-Received: by 2002:a05:6e02:180e:b0:375:9828:ae6 with SMTP id e9e14a558f8ab-37cd2af74a4mr35484485ab.21.1719778134704;
        Sun, 30 Jun 2024 13:08:54 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 34/35] insane: handle dangling symlinks in the libdir QA check
Date: Sun, 30 Jun 2024 13:07:46 -0700
Message-Id: <0c263b207a309e9cdf6f55ce72e3cc751041a47c.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201271

From: Ross Burton <ross.burton@arm.com>

The "libdir" QA check tries to open every file it finds as an ELF.  If
it finds a dangling symlink that looks like a library by the filename it
will try to open it and fail with FileNotFoundError error.  As this
dangling symlink probably points to a real file, silently absorb the
error.

[ YOCTO #13949 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f044290f98ea66f2cecfbffd7d392dbc3d986da9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index e963001d09..c32dfffd83 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -298,7 +298,7 @@ def package_qa_check_libdir(d):
                         try:
                             elf.open()
                             messages.append("%s: found library in wrong location: %s" % (package, rel_path))
-                        except (oe.qa.NotELFFileError):
+                        except (oe.qa.NotELFFileError, FileNotFoundError):
                             pass
                 if exec_re.match(rel_path):
                     if libdir not in rel_path and libexecdir not in rel_path:
@@ -307,7 +307,7 @@ def package_qa_check_libdir(d):
                         try:
                             elf.open()
                             messages.append("%s: found library in wrong location: %s" % (package, rel_path))
-                        except (oe.qa.NotELFFileError):
+                        except (oe.qa.NotELFFileError, FileNotFoundError):
                             pass
 
     if messages:
-- 
2.34.1


