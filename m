Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B86C5CFDB
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 14:08:32 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13869.1786716504390305695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 07:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GgisvIXj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so878850f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 07:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786716502; x=1787321302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2dl05CAZRYuVuM16UvxxDSzkUOFwcSGLJZIIQtIQAhg=;
        b=GgisvIXjRNUtA1HsPNScsZmYaBravG4xyRP5xCHuGm4Tv5spxzTR8Vcnf8kL7NxMI2
         qRifzr9UPi+z17F7UNTj3pP40Yl1gRYLGzNKK18trU+XeXfu/ocHDgjNNcQ2Ap9LQVv2
         lPMRWUcdZhunZL8cnmZH7d38mhcUZZmrz3h6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716502; x=1787321302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2dl05CAZRYuVuM16UvxxDSzkUOFwcSGLJZIIQtIQAhg=;
        b=kCPpeA4H1yPCbQL/da866saq9QqTgm/ShXrgBmih+ytveTB4cGBhNAmGs6WkMTsFBu
         ZguYfwEGcwS1ws4iV/v9xQtwm2asEXIxnmf/QmRqI6oefsFvZt6x70MY2whxCEq2X/uW
         WFAP7EXMNmiCyb72JDSZTFvTqjgyXof6ADqew+6oyAH+79gm7loTmYtcPL+gOfidYoMt
         nd082ixQP4DyJ2ES4lt5gninY9oO3kPoSAdXhFR3akw14kJSELK62casApvaJc3YHRRj
         dJe6A8JBh9Pg2/vOqsVYPHWwbwrJJ+Jwa6HyKTTmRL0zPdTd8qrUnwnHPEvUbdlcd0+c
         VInQ==
X-Gm-Message-State: AOJu0YwF+WkjfYClzmUE+KwZpK/F6+kpGJiJ0jcrqo3oxZrsEicW16D1
	3EcuW5Y7OZibuRJmBYpFwymN2GnHJk6IwzoPQykzCF31KZKIwtkQ8a3v6TKzFsp2qQp38EINWoD
	36e5hfII=
X-Gm-Gg: AR+sD113kQNCz+/ZoEHr+B8pFnf68+EG0Z2q3Xb2p+odMOJdRMy6f9n5ArVYxuX2DDh
	0CkNLnQ/WSJRwhNLOvk6kOhlwgP5KVJDmRkYFQF/rrSZxafr6HgT9RriVVUuRMlX0/CNfKXcPnQ
	65fjlPjnCNri9YBYmqoyMX6Pc9JloVCFHCMopWv+lZLBEjb7OHWLQQsqMk3sj2Sz1jZrGPIjA72
	TC68XV7QCxLjkTeywoAuR4+vJ0iNA4oFvJovM4YLyWAi39aT0bs9s7THikBD5JnYRiM2Ub1CTng
	EZrf9G4YvuwjaOxUkm3zbGKNp3aB80t4zNVQZLs+jGffgRHHGvetj5llz/GNqaCFXDanQ5XI1Qf
	F0xohU9RVpKxdYNPlx8GBMU7WP8Lf7o8eyEuFF/Ia/RZmNySZmaGV1m25lLhtrGZvpptMm3ggvf
	ZJztnikeb3SpUe377Shy7kI8RzReUR8ob1i5N+qDYabV4BBNdD8nFywF7i/b154Y48r+wJomZSq
	geZJFloUNl2J9E6pRp9sUns6Qei
X-Received: by 2002:a05:6000:18ad:b0:481:57d6:c0f6 with SMTP id ffacd0b85a97d-4816075b23dmr10058523f8f.12.1786716502337;
        Fri, 14 Aug 2026 07:08:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9095:412f:3012:ddca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21df13sm7072915f8f.15.2026.08.14.07.08.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:08:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] findutils: upgrade 4.10.0 -> 4.11.0
Date: Fri, 14 Aug 2026 15:08:18 +0100
Message-ID: <20260814140819.2840177-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260814140819.2840177-1-richard.purdie@linuxfoundation.org>
References: <20260814140819.2840177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243452

https://lists.gnu.org/archive/html/bug-findutils/2026-07/msg00050.html

* Noteworthy changes in release 4.11.0 (2026-07-11) [stable]

** Bug Fixes

  find no longer crashes when diagnosing a directory cycle (without a symlink
  being involved pointing to a parent directory).
  [Bug present since the FTS implementation.]

  'find -used' now behaves correctly on OpenBSD 7.8 with difftime(3) underflow
  bug in the C library (already fixed there) when the access time of a file is
  identical to its change time. [#68264]

  'find -ignore_readdir_race' now better handles races between FTS reading a
  directory and visiting its entries when the file or directory was meanwhile
  removed. [#45930]

  To fix a POSIX compatibility bug, -exec foo Z{} + is no longer a
  complete predicate, because '+' is only a terminator when it follows
  an argument which is exactly '{}'.  The findutils documentation
  already states this, and now find's behaviour matches the
  documentation. [#66365]

  'updatedb.sh' now properly handles the variables for the 'find' and 'frcode'
  utilities, and hence avoids command injection.

** Changes in find

  As announced since the release of 4.7.0 (2019) and mandated by POSIX 2024,
  the behaviour of the -mount option changed: while it was a mere alias for
  the -xdev option to prevent descending into directories of another device,
  the -mount option now makes find(1) ignore files on another device, i.e.,
  'find -mount' will skip the entry of active mount points already.
  Example, assuming the PROC filesystem is mounted on '/proc':
    $ find / -mount -path /proc -print
    $ find / -xdev -path /proc -print
    /proc
  [#54745]

  The actions -execdir and -okdir now refuse the '{}' replacement in the zeroth
  argument of the command to be run.  While POSIX allows this for -exec, this is
  deemed insecure as an attacker could influence which files could be found.

  'find -regex' with the default or the 'emacs' regextype now aligns better with
  Emacs behaviour, and therefore e.g. supports character classes:
    $ touch 123 && find -regex './12[[:digit:]]'
    ./123

  find now issues a warning when the punctuation operators '(', ')', '!' and ','
  are passed with a leading dash, e.g. '-!'.  Future releases will not accept
  that any more.  Accepting that was rather a bug "since the beginning".

** Improvements

  xargs now gives a better error diagnostic when executing the given command
  failed.

** Future Changes

  A future release will remove the warning message find prints about
  the 2007 change in the meaning of "-perm /000".  Everybody who is
  likely to care probably knows about this change by now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../findutils/{findutils_4.10.0.bb => findutils_4.11.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/findutils/{findutils_4.10.0.bb => findutils_4.11.0.bb} (90%)

diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb b/meta/recipes-extended/findutils/findutils_4.11.0.bb
similarity index 90%
rename from meta/recipes-extended/findutils/findutils_4.10.0.bb
rename to meta/recipes-extended/findutils/findutils_4.11.0.bb
index 91bb1be1708..aa5313e991e 100644
--- a/meta/recipes-extended/findutils/findutils_4.10.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.11.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 DEPENDS = "bison-native"
 
-SRC_URI[sha256sum] = "1387e0b67ff247d2abde998f90dfbf70c1491391a59ddfecb8ae698789f0a4f5"
+SRC_URI[sha256sum] = "bfd19cb06cc71f3352d567e90284d8cdac02ac89774bbeadf0b533b0c11432fd"
 
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 

