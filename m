Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707F8C83F2A
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 14:11:35 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.17229.1724940687114530665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 07:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=midKobvz;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a1dac7f0b7so47111685a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724940686; x=1725545486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=of5114qN6EEX8oS6WQbWuf2DovL5mj/L2nxY1LeKW70=;
        b=midKobvzSDaLubz7PRMxDKL/p7Xo46gbnwfsZ2feBidy1Z/O6eTDZ1vZZCykdIwan0
         On605ghGMtvIz6l/fpFz/h5Awv5VESMAJ05/tbWt0aJ5wKhqbaOjb3IaEMNzjsbfe/Qd
         jVuFJ+6LfXFR3mIPWhTDbv4tnoIZ6XQxELozh6+oWJ7vTqFNlN5y7YtrmN7do/byRcNe
         Fs3bsI4ANeTcEAdf/CeMF+dMn2YsE25lMr/hqK3uRxYMObIwQbgU4YA1X7SnHMSicYHr
         01zZfPVW26tj+XTZot80q65BclUTpqm+d8RDG3cfrJ/rIWZ+zDp4fI/TkOOj95UhMv9K
         djQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724940686; x=1725545486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=of5114qN6EEX8oS6WQbWuf2DovL5mj/L2nxY1LeKW70=;
        b=ONp2rqhrlyAHfAu/vfuOxq2UtW4bwJBjDOCyfADZBarL4RAvFEROvfYRwMbEy1xlHn
         1BNSd+3SKrccdvsJkchubUe/hAM027aS1sNq9lrhcib5r0IOmRL0xZjVRhvG1tQFbekp
         RuaGIp8tQ3qgpMqLbw+q5PhMUWXLsMVu5gXPNGzwJNGInktSyRRuKzHxMErODfWnq3vj
         sZk2hjwlcouuPEp/ibixEKG41+RbYnCBimAgXFCsS0JGxceX5pHHkr7SvsOIhjr8rgHK
         0PyFjmYS9e9YaaQ37A2vHKweRPvaKW9WMBD2u8MkIfxmsgRvp2jQnD/0c9fOXoctajuQ
         pzVg==
X-Gm-Message-State: AOJu0Yyf/uR4DoUb0HlVo6T75BefPFyzeAc9krb5Wojx+wB2eXywCpye
	gfZm9Y40yKNx/X0KF/lfMOP7rnMUTzvqyP41A0DizcP5vweLDkqpYm3C3M2O2LLreRNkfMR41R/
	+xmg=
X-Google-Smtp-Source: AGHT+IEDzWfHxeY4fQry1mcw4mtACFwfTdwlH2AptD8Ag5AkcgX5lJjmHbrSUIehHxGjRg5d0ZJg9Q==
X-Received: by 2002:a05:620a:288f:b0:7a7:db2d:9ca2 with SMTP id af79cd13be357-7a80429443cmr283909085a.68.1724940685454;
        Thu, 29 Aug 2024 07:11:25 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806bf6d7asm53930485a.13.2024.08.29.07.11.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 07:11:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] python3-pyparsing: upgrade 3.1.2 -> 3.1.4
Date: Thu, 29 Aug 2024 10:11:22 -0400
Message-Id: <20240829141122.3558638-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240829141122.3558638-1-tgamblin@baylibre.com>
References: <20240829141122.3558638-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 14:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203935

Changelog (https://github.com/pyparsing/pyparsing/releases):

3.1.4

- Fixed a regression introduced in pyparsing 3.1.3, addition of a type
  annotation that referenced re.Pattern. Since this type was introduced
  in Python 3.7, using this type definition broke Python 3.6 installs of
  pyparsing 3.1.3. PR submitted by Felix Fontein, nice work!

3.1.3

- Added new Tag ParserElement, for inserting metadata into the parsed
  results. This allows a parser to add metadata or annotations to the
  parsed tokens. The Tag element also accepts an optional value
  parameter, defaulting to True. See the new tag_metadata.py example in
  the examples directory.

    Example:

      # add tag indicating mood
      end_punc = "." | ("!" + Tag("enthusiastic")))
      greeting = "Hello" + Word(alphas) + end_punc

      result = greeting.parse_string("Hello World.")
      print(result.dump())

      result = greeting.parse_string("Hello World!")
      print(result.dump())

    prints:

      ['Hello', 'World', '.']

      ['Hello', 'World', '!']
      - enthusiastic: True

- Added example mongodb_query_expression.py, to convert human-readable
  infix query expressions (such as a==100 and b>=200) and transform them
  into the equivalent query argument for the pymongo package ({'$and':
  [{'a': 100}, {'b': {'$gte': 200}}]}). Supports many equality and
  inequality operators - see the docstring for the transform_query
  function for more examples.
- Fixed issue where PEP8 compatibility names for ParserElement static
  methods were not themselves defined as staticmethods. When called
  using a ParserElement instance, this resulted in a TypeError
  exception. Reported by eylenburg (#548).  To address a compatibility
  issue in RDFLib, added a property setter for the ParserElement.name
  property, to call ParserElement.set_name.  Modified
  ParserElement.set_name() to accept a None value, to clear the defined
  name and corresponding error message for a ParserElement.  Updated
  railroad diagram generation for ZeroOrMore and OneOrMore expressions
  with stop_on expressions, while investigating #558, reported by user
  Gu_f.  Added <META> tag to HTML generated for railroad diagrams to
  force UTF-8 encoding with older browsers, to better display Unicode
  parser characters.
- Fixed some cosmetics/bugs in railroad diagrams: fixed groups being
  shown even when show_groups=False show results names as quoted strings
  when show_results_names=True only use integer loop counter if
  repetition > 2
- Some type annotations added for parse action related methods, thanks
  August Karlstedt (#551).
- Added exception type to trace_parse_action exception output, while
  investigating SO question posted by medihack.
- Added set_name calls to internal expressions generated in
  infix_notation, for improved railroad diagramming.
- delta_time, lua_parser, decaf_parser, and roman_numerals examples
  cleaned up to use latest PEP8 names and add minor enhancements.
- Fixed bug (and corresponding test code) in delta_time example that did
  not handle weekday references in time expressions (like "Monday at
  4pm") when the weekday was the same as the current weekday.
- Minor performance speedup in trim_arity, to benefit any parsers using
  parse actions.
- Added early testing support for Python 3.13 with JIT enabled.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-pyparsing_3.1.2.bb => python3-pyparsing_3.1.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.1.2.bb => python3-pyparsing_3.1.4.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.1.2.bb b/meta/recipes-devtools/python/python3-pyparsing_3.1.4.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.1.2.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.1.4.bb
index 64210ade53e..f256b047e3a 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.1.4.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "a1bac0ce561155ecc3ed78ca94d3c9378656ad4c94c1270de543f621420f94ad"
+SRC_URI[sha256sum] = "f86ec8d1a83f11977c9a6ea7598e8c27fc5cddfa5b07ea2241edbbde1d7bc032"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.39.2


