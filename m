Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3C65785A6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 22:13:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w18MDVqG024645
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Feb 2018 14:13:32 -0800 (PST)
Received: from yow-masselst-lx1.localnet (128.224.60.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 8 Feb 2018 14:13:25 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 8 Feb 2018 17:13:31 -0500
Message-ID: <1778379.J915XxZyfQ@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <00d7531e-b773-536e-ad5b-e19f8f993dbf@linux.intel.com>
References: <20180202173815.9500-1-alexander.kanavin@linux.intel.com>
	<3144211.9qXzQgCZpO@yow-masselst-lx1>
	<00d7531e-b773-536e-ad5b-e19f8f993dbf@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 08 Feb 2018 22:13:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, February 8, 2018 1:44:02 AM EST Alexander Kanavin wrote:
> On 02/07/2018 11:34 PM, Mark Asselstine wrote:
> > Alexander. When things move to python you can almost always bet on them
> > requiring additional libraries and as such the lack of RDEPENDS here is a
> > bit surprising. As you can see from the top of some of the py files in
> > gtk-doc we have:
> > 
> > import logging
> > import os
> > import re
> > import subprocess
> > import sys
> > import six
> > import codecs
> > 
> > Some of which are python stdlibs but others are external modules, such as
> > 
> > 'six'. As such I am now getting a build failure:
> >       -- Installing ../../../libunique-1.1.6/doc/reference/html/up.png
> >       
> >       Traceback (most recent call last):
> >        File
> >        "/home/mark/build/overc/tmp/work/core2-64-overc-linux/libunique/
> >        1.1.6-r7/recipe-sysroot-native/usr/bin/gtkdoc-rebase", line 28, in
> >        
> >         <module>
> >       
> >       from gtkdoc import common, config, rebase
> >       File
> >       "/home/mark/build/overc/tmp/work/core2-64-overc-linux/libunique/
> >       1.1.6-r7/recipe-sysroot-native/usr/share/gtk-doc/python/gtkdoc/
> >       common.py", line 31, in <module>
> >       import six
> >   
> >   ImportError: No module named 'six'
> > 
> > So we need to RDEPENDS on "python-six" here for starters. We do have a
> > recipe for python-six but it is in meta-openembedded. So we either need
> > to move this recipe there or the python-six recipe to oe-core or...
> 
> Thanks for the failure report Mark, but the diagnosis is way off :-)
> 
> First of all, for what purpose are you even building libunique? It's a
> very old, unmaintained library for gtk 2.x apps from gnome stack (last
> release: 2011), and here's what gnome has to say about it: "Unique is
> now in maintenance mode and its usage is strongly discouraged".
> 

The use of libunique is non-consequential here. The issue is that the gtk-doc 
package has imports which are not going to be present via direct runtime 
dependencies. Any sw which attempts to run the python scripts found in gtk-doc 
will fail in the same way unless the python3-six is installed via an indirect 
dependency. I didn't have a chance to dig in to this deeper today so I don't 
have more to add than this but the "import six" is pretty explicit and will 
fail unless this script is not meant to actually be run anytime, anywhere.

Mark

> It's coming from the gnome section of meta-oe, which is badly suffering
> from lack of maintenance and general bitrot. I think much of it was
> about to be removed a few months ago at last, but for some reason it
> hasn't happened.
> 
> This specific failure is because libunique recipe neither inherits
> gtk-doc class (which correctly sets things up) nor explicitly disables
> gtk-doc. I'm now building the rest of meta-oe to check if anything else
> needs to be fixed up, and will send a patch in a moment.
> 
> Alex



