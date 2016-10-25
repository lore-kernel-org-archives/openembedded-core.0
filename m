Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0003C71C06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 11:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id E7A8536207
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 6Pkb0ofBh1N1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 82E722E47A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 697151E094
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D8F91E092
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 505CD3FA;
	Tue, 25 Oct 2016 13:03:36 +0200 (CEST)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id B0B737C615; Tue, 25 Oct 2016 13:03:35 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: olani@axis.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2016 13:03:31 +0200
Message-Id: <1477393415-13053-1-git-send-email-olani@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [PATCH 0/4] Load devtool and reciptool plugins in a well-defined manner
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
X-List-Received-Date: Tue, 25 Oct 2016 11:03:42 -0000

From: Ola x Nilsson <ola.x.nilsson@axis.com>

Make devtool and recipetool load plugins in a well-defined and expected manner.

devtool and reciptool search for pluings first in scripts/lib/<tool>
and then in BBPATH.  Each found plugin is loaded, which means that any
plugin found later in BBPATH shadows previously loaded plugins.
plugin_init is loaded for all plugins, no matter whether they are
later replaced.  register_plugin is called once for each time a plugin
with a certain name is found, but it is always called on the last
loaded plugin.

Change the scriptutils.load_plugins function to never load a plugin
file if one with the same filename has already been loaded.  This
means that the first found plugin wins.

Change the load order to first search BBPATH and then
scripts/lib/tools.  This means that plugins in scripts/lib/<tool> can
be shadowed by plugins in layers.

Ola x Nilsson (4):
  devtool: selftest: add test for devtool plugin loading
  recipetool: selftest: Add test for recipetool plugin loading
  devtool: Load plugins in a well defined order
  recipetool: Load plugins in a well defined order

 meta-selftest/lib/devtool/bbpath.py    | 44 ++++++++++++++++++++++++++++++++++
 meta-selftest/lib/recipetool/bbpath.py | 41 +++++++++++++++++++++++++++++++
 meta/lib/oeqa/selftest/devtool.py      | 43 +++++++++++++++++++++++++++++++++
 meta/lib/oeqa/selftest/recipetool.py   | 44 ++++++++++++++++++++++++++++++++++
 scripts/devtool                        |  3 ++-
 scripts/lib/scriptutils.py             |  8 +++++--
 scripts/recipetool                     |  4 ++--
 7 files changed, 182 insertions(+), 5 deletions(-)
 create mode 100644 meta-selftest/lib/devtool/bbpath.py
 create mode 100644 meta-selftest/lib/recipetool/bbpath.py

-- 
2.1.4


