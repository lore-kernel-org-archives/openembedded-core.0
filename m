Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27498.1792952334746873077
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=DAiPsU5v;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202610251818516a5a8ae2be0002076f-_ov_m8@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202610251818516a5a8ae2be0002076f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:18:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MHXI5Lk6vIdDVjgLkQiKDIxWDKaSzTVfjjaEgcCrERQ=;
 b=DAiPsU5vwhkOmL28HWaiuzor76NIKo8FofwYBwWGnlRzy9uDGUKY3rqhh84ojKbCMrTfBu
 bPMqvAqjr90M7ob8GQAdqIZIdInHBcLjUEmrZZnv3b4tsbYRdo5TDCrUN+goL2N1G9vOhG3y
 i6hf35zpa9cmDqqqwqa2EngHDT7/MB5zqm706xHD5+AxwxsI3aUq80kspLy3PYJanZqN/LwX
 R7YsVJJCD6If7YiR0CZh5Pdw2s3TeiIaIZ4kgcXK0zdCHbNbo49j6HalUF9xKnKN1zuFNYyB
 2QvbOzsa0IgFfA63b/Xybbv2n2jH9sYdwzxJUrvG9bB1WH/UM8KOYzKA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/6] kernel-fit-image: add FIT_LOADABLE_* variables to do_compile vardeps
Date: Sun, 25 Oct 2026 19:18:26 +0100
Message-ID: <20261025181847.784113-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248615
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changing a flag of a FIT loadable, e.g. FIT_LOADABLE_LOADADDRESS[atf],
did not rerun do_compile of the FIT image recipe and a stale FIT image
was reused. Add the FIT_LOADABLE_* variables to the do_compile vardeps.

The class also set FIT_LOADABLE_* to synthetic values which were only
there to make the flags visible to the selftests. To drop them,
get_bb_vars learns to read variable flags with the VAR[flag] syntax.
It now reads the values from a tinfoil datastore instead of parsing the
"bitbake -e" output, which is faster. get_bb_var uses the same code,
which also fixes its postconfig handling.

Adrian Freihofer (6):
  kernel-fit-image: add FIT_LOADABLE_* variables to do_compile vardeps
  oeqa/selftest/esdk: pass only the image name to get_bb_vars
  oeqa/utils/commands: use tinfoil in get_bb_vars
  oeqa/utils/commands: support variable flags in get_bb_vars
  oeqa/utils/commands: use the tinfoil helper in get_bb_var
  kernel-fit-image: drop the synthetic FIT_LOADABLE_* values

 meta/classes-recipe/kernel-fit-image.bbclass |  17 ++-
 meta/lib/oeqa/selftest/cases/esdk.py         |   4 +-
 meta/lib/oeqa/selftest/cases/fitimage.py     |  13 +-
 meta/lib/oeqa/utils/commands.py              | 141 ++++++++++---------
 4 files changed, 94 insertions(+), 81 deletions(-)

-- 
2.56.0

