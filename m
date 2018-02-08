Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4B02278520
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 06:50:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Feb 2018 22:50:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,477,1511856000"; d="scan'208";a="25783854"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Feb 2018 22:50:15 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20180202173815.9500-1-alexander.kanavin@linux.intel.com>
	<3144211.9qXzQgCZpO@yow-masselst-lx1>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <00d7531e-b773-536e-ad5b-e19f8f993dbf@linux.intel.com>
Date: Thu, 8 Feb 2018 08:44:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <3144211.9qXzQgCZpO@yow-masselst-lx1>
Subject: Re: [PATCH 1/2] gtk-doc: update to 1.27
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
X-List-Received-Date: Thu, 08 Feb 2018 06:50:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/07/2018 11:34 PM, Mark Asselstine wrote:
> Alexander. When things move to python you can almost always bet on them
> requiring additional libraries and as such the lack of RDEPENDS here is a bit
> surprising. As you can see from the top of some of the py files in gtk-doc we
> have:
> 
> import logging
> import os
> import re
> import subprocess
> import sys
> import six
> import codecs
> 
> Some of which are python stdlibs but others are external modules, such as
> 'six'. As such I am now getting a build failure:
> 
>       -- Installing ../../../libunique-1.1.6/doc/reference/html/up.png
>       Traceback (most recent call last):
>        File "/home/mark/build/overc/tmp/work/core2-64-overc-linux/libunique/
>        1.1.6-r7/recipe-sysroot-native/usr/bin/gtkdoc-rebase", line 28, in
>         <module>
>       from gtkdoc import common, config, rebase
>       File "/home/mark/build/overc/tmp/work/core2-64-overc-linux/libunique/
>       1.1.6-r7/recipe-sysroot-native/usr/share/gtk-doc/python/gtkdoc/
>       common.py", line 31, in <module>
>       import six
>   ImportError: No module named 'six'
> 
> So we need to RDEPENDS on "python-six" here for starters. We do have a recipe
> for python-six but it is in meta-openembedded. So we either need to move this
> recipe there or the python-six recipe to oe-core or...

Thanks for the failure report Mark, but the diagnosis is way off :-)

First of all, for what purpose are you even building libunique? It's a 
very old, unmaintained library for gtk 2.x apps from gnome stack (last 
release: 2011), and here's what gnome has to say about it: "Unique is 
now in maintenance mode and its usage is strongly discouraged".

It's coming from the gnome section of meta-oe, which is badly suffering 
from lack of maintenance and general bitrot. I think much of it was 
about to be removed a few months ago at last, but for some reason it 
hasn't happened.

This specific failure is because libunique recipe neither inherits 
gtk-doc class (which correctly sets things up) nor explicitly disables 
gtk-doc. I'm now building the rest of meta-oe to check if anything else 
needs to be fixed up, and will send a patch in a moment.

Alex

