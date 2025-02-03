Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4582DC02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:00:50 +0000 (UTC)
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
 by mx.groups.io with SMTP id smtpd.web10.91438.1738598447369784749
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.169, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YmrnT3y8czSx5;
	Mon,  3 Feb 2025 17:00:45 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YmrnT01JczmCM;
	Mon,  3 Feb 2025 17:00:44 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH RFC 0/6] prepare patchtest to be run with b4 prep --check
Date: Mon, 03 Feb 2025 17:00:28 +0100
Message-Id: <20250203-b4-patchtest-v1-0-ef6ee5fcdd78@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzooGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3SQT3YLEkuSMktTiEl0LsyRj0xRzc3Oj1FQloJaCotS0zAqwcdF
 KQW7OSrG1tQCrLCwBYwAAAA==
X-Change-ID: 20250203-b4-patchtest-86b35d7772ee
To: Trevor Gamblin <tgamblin@baylibre.com>, 
 openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210659

Marked as RFC because the second to last patch is very ewww but I don't
have a much better idea right now.

b4 prep --check can run an executable on each patch in a series, so it'd
be nice to be able to use patchtest with that so that we don't duplicate
tests run locally and those run on patches found on the ML by a bot.

b4 sends the patch to check over stdin, with the "From " field stripped
from the Mbox, c.f. https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/src/b4/__init__.py?h=stable-0.14.y#n3494
This means we need to add to patchtest the ability to pass patches from
stdin and also tell it to ignore "malformed" Mboxes in some cases
(whenever the patch is passed via stdin for example).

b4 expects absolutely zero message on either stderr or stdout or it
interprets those as error messages. patchtest is currently quite
verbose, so we need to disable everything we can and only keep error
messages.

This would be a first step for using patchtest with b4 prep --check,
ideally we should also make it possible to use patchtest with other git
repos, specifically poky for example. This would allow people to run
tests for BitBake, OE-Core, Yocto-docs and poky source code. We're not
there yet but this is a step in that direction.

One can now use patchtest as b4 prep --check step with the following
.b4-config:

[b4]
   prep-perpatch-check-cmd = patchtest --patch - --quiet --no-summary

oe-init-buildenv needs to be sourced first to make patchtest available
in PATH and a few Python modules installed (e.g. unidiff, pylint, ...;
see meta/lib/patchtest/requirements.txt).

This series depends on
https://lore.kernel.org/openembedded-core/20250203-b4-support-v2-0-848008ad29ea@cherry.de/T/#m24b6594da5d57d0715e16636ad2936b1478f08ae
except if the last patch in this series is removed (the modification of
.b4-config).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (6):
      patchtest: use logger instead of printing to stdout
      patchtest: allow to pass patch from stdin
      patchtest: allow to silence non-error messages
      patchtest: allow to not print summary
      patchtest: allow malformed Mbox
      b4: enable patchtest as b4 prep --check step

 .b4-config                             |  3 +-
 meta/lib/patchtest/mbox.py             |  9 +++---
 meta/lib/patchtest/patchtest_parser.py |  8 +++++
 meta/lib/patchtest/repo.py             |  4 +--
 meta/lib/patchtest/tests/base.py       |  2 +-
 scripts/patchtest                      | 54 ++++++++++++++++++++++++----------
 6 files changed, 56 insertions(+), 24 deletions(-)
---
base-commit: ea18694110e68cdfd90984e0f7f2d4303fd12ff0
change-id: 20250203-b4-patchtest-86b35d7772ee

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


