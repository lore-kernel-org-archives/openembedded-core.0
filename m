Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52099CCF2ED
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 11:41:20 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33308.1768822879221575890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 03:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PqZXX/V2;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so6924560a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 03:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768822877; x=1769427677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sfKeTRIibDjnj/gAW9PlXHL3h8NA28+ign7Hre8kV/4=;
        b=PqZXX/V2YPXlV6gCsBL2o/0W0c/ilA7wUHCJjyOlaiQv96Uu4d7WCPl4kvqOvin1xb
         4nyGyTGQ/dOZbARs5p5XKbGSkgty+NqPN2UecPy+cPFGN7dU/r+nHRL+Giy9TzW7qgTa
         ROU9dG9fcoGjoJk/l2u5EvN1tJh+2eIWTukM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768822877; x=1769427677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfKeTRIibDjnj/gAW9PlXHL3h8NA28+ign7Hre8kV/4=;
        b=gZ2altjk6E7nCFBm9ClbvDDWUFhN6bEvoepq5muTZEhrXqQdoUw6W0zm49qQbKho1t
         rX8yOQKfdpV11DtdEU6V5yvjTIWTxFkr99wey01pnOf1NSuY0A5SeaI4lNx8Ox3crU68
         x0bki+cGs+mSuSZwpoT0/CP8jrG6PQWkc/RnSnPBpAASwpSLLkGPB10NPtVj9u2GRHWK
         a5yc7/3BkpJ8wbfKBD/aS+yFl2BBNUkVAFFf5uVYwippy3YGj4WpTtQYvwf0RpRnxQMO
         7BVZpCzxjix0FYcQ5VGTgcly61NOiiYPakKbZVIgI7SJU1bJRmgKxKF7uwwwDhDVeOY7
         ZPSQ==
X-Gm-Message-State: AOJu0YxPqoEVVf3PI4Ut/7sBNRADhBMJ99R7QLavkqxG4aXtlDSARtHY
	io8L+FeL7b0D/DqvS1R/ntRFll5xOIlzI0HsYn3j6FpyU3rTKtad433NuYp9njAe1ASVOvdx/Wn
	h0k6x
X-Gm-Gg: AY/fxX6Re3kWjckAcEPFQUi9pAi09nagzOIQxirG6M0jF3K6CZDEN5YwQOx42kBNYm0
	r/G/B/h6mmXEC+lK1tlIUZgDFf505uK55kcojLVhMb5lxBFxppezlswi4ZjwwapYNccVqhgzJri
	Q4XTpKeh8dNIbZ0sCg+LjDRh58T4YHWIb6oqvxPjkpd+7N8FK7v30O71Npgt/bVYQoZZ6FBEDX5
	SFwxHvb7ZZVB5K66FpZObapcVSaYCeLFYq7hx7k04ZSj5egmZwRavpoztDFJ0IF0BXirnlaz03E
	KQ53r4REwfCdBzlQFB4SW0jq3kdvSA9vMrbdJzsfpMpcOs6P3xarfb4DAgyC6Dk/4PlbnMJ1E+v
	6pJ+TRkrWYbLB1tFMgI+/Xdnkl4k4gwloNGuQ5T2JlqtePNIsDCmKNsS5FlUtpDuB1ey6Z0eQCb
	96oifxtzFkg0td42VghZlS0SWh
X-Received: by 2002:a05:6402:210a:b0:653:ae75:8d71 with SMTP id 4fb4d7f45d1cf-654525cbea6mr7888898a12.8.1768822877119;
        Mon, 19 Jan 2026 03:41:17 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cda145sm10006293a12.9.2026.01.19.03.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:41:16 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] python3-pathspec: Upgrade 0.12.1 -> 1.0.3
Date: Mon, 19 Jan 2026 13:41:03 +0200
Message-ID: <20260119114103.1592373-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 11:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229608

Upgrade to release 1.0.3:

Bug fixes:

- pyright strict errors with pathspec >= 1.0.0.
- No module named 'tomllib'.

Major changes from release 1.0.0:

- Dropped support of EoL Python 3.8.
- Added concept of backends to allow for faster regular expression
  matching. The backend can be controlled using the backend argument
  to PathSpec(), PathSpec.from_lines(), GitIgnoreSpec(), and
  GitIgnoreSpec.from_lines().
- Renamed "gitwildmatch" pattern back to "gitignore". The "gitignore"
  pattern behaves slightly differently when used with PathSpec
  (gitignore as documented) than with GitIgnoreSpec (replicates
  Git's edge cases).

API changes from release 1.0.0:

- Breaking: protected method pathspec.pathspec.PathSpec._match_file()
  (with a leading underscore) has been removed and replaced by
  backends. This does not affect normal usage of PathSpec or
  GitIgnoreSpec. Only custom subclasses will be affected. If this
  breaks your usage, let me know by opening an issue.
- Deprecated: "gitwildmatch" is now an alias for "gitignore".
- Deprecated: pathspec.patterns.GitWildMatchPattern is now an alias
  for pathspec.patterns.gitignore.spec.GitIgnoreSpecPattern.
- Deprecated: pathspec.patterns.gitwildmatch module has been
  replaced by the pathspec.patterns.gitignore package.
- Deprecated: pathspec.patterns.gitwildmatch.GitWildMatchPattern is
  now an alias for pathspec.patterns.gitignore.spec.GitIgnoreSpecPattern.
- Deprecated: pathspec.patterns.gitwildmatch.GitWildMatchPatternError
  is now an alias for pathspec.patterns.gitignore.GitIgnorePatternError.
- Removed: pathspec.patterns.gitwildmatch.GitIgnorePattern has been
  deprecated since v0.4 (2016-07-15).
- Signature of method pathspec.pattern.RegexPattern.match_file() has
  been changed from def match_file(self, file: str) ->
  RegexMatchResult | None to def match_file(self, file: AnyStr) ->
  RegexMatchResult | None to reflect usage.
- Signature of class method pathspec.pattern.RegexPattern.pattern_to_regex()
  has been changed from def pattern_to_regex(cls, pattern: str) ->
  tuple[str, bool] to def pattern_to_regex(cls, pattern: AnyStr) ->
  tuple[AnyStr | None, bool | None] to reflect usage and documentation.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pathspec_0.12.1.bb => python3-pathspec_1.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_0.12.1.bb => python3-pathspec_1.0.3.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb b/meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pathspec_0.12.1.bb
rename to meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
index 2c80b24c28..58651bced2 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "a482d51503a1ab33b1c67a6c3813a26953dbdc71c31dacaef9a838c4e29f5712"
+SRC_URI[sha256sum] = "bac5cf97ae2c2876e2d25ebb15078eb04d76e4b98921ee31c6f85ade8b59444d"
 
 inherit pypi python_flit_core
 
-- 
2.47.3


