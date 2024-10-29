Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEBBD2AB0A
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 09:41:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.15289.1730194862023213506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 02:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BVdLSIpX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B33B40008;
	Tue, 29 Oct 2024 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730194860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQ0zbz/TzCvAHPtnyxyu9DYFD2RF41CecCD3Iz9du2k=;
	b=BVdLSIpXXvHi8ACHMB0Xd3USJ5tQk54OhksUxooXDm+3hX2qXE5WsnT4aEQvo6OUmknf12
	3sk4LfPFjTwIWnnhvPmHnrcZMgiMBodMhVssIDNNXQOTJvzCYoxIeN2GCXt0QoKaxqSx1h
	ooPWsgCunmJHcyrysOS5EcqImNRDGH8qu2f2FYxVRRLFbO1SN7fWU+LPt6cI1kN/FHay/e
	TB/HdPhlkyrwk0QZNX6UC1xf+HDdExmta5oHGacTtLVHOmA/8tPUd8vhKlA5tLrH8Vwigv
	iYd4TjwJq486njCWWj9SFLQViSPg35ohl06gP7sZ0xjY2+aOvllYD5W+mK3ORg==
Date: Tue, 29 Oct 2024 10:40:58 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 18/22] python3-rdflib: upgrade 7.0.0 -> 7.1.0
Message-ID: <ZyCtqjqSmJmvBupb@bootlin-mathieu>
Mail-Followup-To: wangmy@fujitsu.com,
	openembedded-core@lists.openembedded.org
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
 <1729834769-4717-18-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1729834769-4717-18-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 09:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206485

On Fri, Oct 25, 2024 at 01:39:25PM +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> License-Update: Copyright year updated to 2024.
> 
> Changelog:
>  https://github.com/RDFLib/rdflib/blob/main/CHANGELOG.md#2024-10-17-release-710
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

Hi,

It seems one of these python commit is triggering a build issue in the
oe-selftest autobuilders:

2024-10-29 07:12:37,279 - oe-selftest - INFO - spdx.SPDX22Check.test_spdx_base_files (subunit.RemotedTestCase)
2024-10-29 07:12:37,279 - oe-selftest - INFO -  ... FAIL
2024-10-29 07:12:37,280 - oe-selftest - INFO - 9: 14/16 170/611 (36.87s) (0 failed) (spdx.SPDX22Check.test_spdx_base_files)
2024-10-29 07:12:37,280 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/spdx.py", line 67, in test_spdx_base_files
    self.check_recipe_spdx("packages", "base-files.spdx.json", "base-files")
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/spdx.py", line 64, in check_recipe_spdx
    result = check_spdx_json(full_file_path)
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/spdx.py", line 61, in check_spdx_json
    result = runCmd("{} {} -i {}".format(python, validator, filename))
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/utils/commands.py", line 212, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command '/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-312849/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.3/recipe-sysroot-native/usr/bin/nativepython3 /srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-312849/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.3/recipe-sysroot-native/usr/bin/pyspdxtools -i /srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-312849/tmp/deploy/spdx/2.2/qemux86_64/packages/base-files.spdx.json' returned non-zero exit status 1:
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-312849/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.3/recipe-sysroot-native/usr/bin/pyspdxtools", line 5, in <module>
    from spdx_tools.spdx.clitools.pyspdxtools import main
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-312849/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.3/recipe-sysroot-native/usr/lib/python3.13/site-packages/spdx_tools/spdx/clitools/pyspdxtools.py", line 28, in <module>
    from spdx_tools.spdx.parser.parse_anything import parse_file
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-312849/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.3/recipe-sysroot-native/usr/lib/python3.13/site-packages/spdx_tools/spdx/parser/parse_anything.py", line 16, in <module>
    from spdx_tools.spdx.parser.rdf import rdf_parser
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-312849/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.3/recipe-sysroot-native/usr/lib/python3.13/site-packages/spdx_tools/spdx/parser/rdf/rdf_parser.py", line 5, in <module>
    from rdflib import RDF, Graph
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-312849/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.3/recipe-sysroot-native/usr/lib/python3.13/site-packages/rdflib/__init__.py", line 168, in <module>
    from rdflib.graph import ConjunctiveGraph, Dataset, Graph
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-312849/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.3/recipe-sysroot-native/usr/lib/python3.13/site-packages/rdflib/graph.py", line 283, in <module>
    import rdflib.namespace as namespace  # noqa: F401 # This is here because it is used in a docstring.
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-312849/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.3/recipe-sysroot-native/usr/lib/python3.13/site-packages/rdflib/namespace/__init__.py", line 83, in <module>
    from rdflib.term import URIRef, Variable, _is_valid_uri
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-312849/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.3/recipe-sysroot-native/usr/lib/python3.13/site-packages/rdflib/term.py", line 68, in <module>
    import html5lib
ModuleNotFoundError: No module named 'html5lib'

https://valkyrie.yoctoproject.org/#/builders/54/builds/315/steps/14/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/76/builds/326/steps/14/logs/stdio

Can you have a look at this issue please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

