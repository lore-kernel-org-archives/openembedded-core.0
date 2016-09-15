Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2C67719A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 13:15:34 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 15 Sep 2016 06:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,339,1470726000"; 
   d="scan'208";a="8805091"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.6.213])
	by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2016 06:15:33 -0700
Message-ID: <1473945331.3558.32.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: jwang <jing.j.wang@intel.com>, openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 14:15:31 +0100
In-Reply-To: <1473729455-32649-1-git-send-email-jing.j.wang@intel.com>
References: <1473729455-32649-1-git-send-email-jing.j.wang@intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] meta: introduce a small baserunner framework
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
X-List-Received-Date: Thu, 15 Sep 2016 13:15:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Jing, 

Thanks for your submission.

On Tue, 2016-09-13 at 09:17 +0800, jwang wrote:
> From: zjh <junhuix.zhang@intel.com>

There's no commit message here, which makes this harder to review as I
have to try and work out what it's for and why we want it. 

A useful commit message would tell me why we are introducing a
baserunner framework. This may also make a useful comment in the code
itself.

Also, the patch prefix for the series should be "lib/oeqa", i.e

"[PATCH 3/4] lib/oeqa: use baserunner in oetest"

> Signed-off-by: zjh <junhuix.zhang@intel.com>
> ---
>  meta/lib/base/baserunner.py | 60
> +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100755 meta/lib/base/baserunner.py
> 
> diff --git a/meta/lib/base/baserunner.py
> b/meta/lib/base/baserunner.py
> new file mode 100755
> index 0000000..56b838e
> --- /dev/null
> +++ b/meta/lib/base/baserunner.py
> @@ -0,0 +1,60 @@
> +#!/usr/bin/env python

We're defaulting to Python3 in OE-Core nowadays, do you really want
Python2 here (which is the default Python on most Linux distros)

> +# Copyright (C) 2013 Intel Corporation
> +#
> +# Released under the MIT license (see COPYING.MIT)
> +
> +# Base unittest module used by testrunner
> +# This provides the common test runner functionalities including
> manifest input,
> +# xunit output, timeout, tag filtering.
> +
> +"""Base testrunner"""
> +
> +from __future__ import absolute_import
> +import os
> +import sys
> +import time
> +import unittest
> +import shutil
> +
> +class TestContext(object):
> +    '''test context which inject into testcase'''
> +    def __init__(self):
> +        self.target = None
> +
> +class FakeOptions(object):
> +    '''This class just use for configure's defualt arg.
> +       Usually, we use this object in a non comandline
> environment.'''
> +    timeout = 0
> +    def __getattr__(self, name):
> +        return None

What's the purpose of overloading __getattr__() here?

> +
> +class TestRunnerBase(object):
> +    '''test runner base '''

This comment isn't very useful, same for other similar comments in this
series.

> +    def __init__(self, context=None):
> +        self.tclist = []
> +        self.runner = None
> +        self.context = context if context else TestContext()

This would probably be better as: 
self.context = context or TestContext()

or better yet, pass TestContext() as the default param for context,
rather than None?

> +        self.test_result = None
> +        self.run_time = None
> +
> +
> +    def configure(self, options=FakeOptions()):
> +        '''configure before testing'''
> +        pass
> +
> +    def result(self):
> +        '''output test result '''
> +        pass
> +
> +    def loadtest(self, names=None):
> +        '''load test suite'''
> +        pass
> +
> +    def runtest(self, testsuite):
> +        '''run test suite'''
> +        pass
> +
> +    def start(self, testsuite):
> +        '''start testing'''
> +        pass
> +
> -- 
> 2.1.4
> 

