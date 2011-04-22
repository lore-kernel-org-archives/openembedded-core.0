Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QDPpV-0003yO-3H
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 01:32:05 +0200
Received: by pzk35 with SMTP id 35so506824pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 16:29:38 -0700 (PDT)
Received: by 10.68.15.231 with SMTP id a7mr2325191pbd.239.1303514977881;
	Fri, 22 Apr 2011 16:29:37 -0700 (PDT)
Received: from [192.168.1.32] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id j2sm14249pbo.79.2011.04.22.16.29.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Apr 2011 16:29:36 -0700 (PDT)
Message-ID: <4DB20F61.7060103@mvista.com>
Date: Fri, 22 Apr 2011 16:29:37 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
	ThunderBrowse/3.3.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1303107421.5518.45.camel@rex>
In-Reply-To: <1303107421.5518.45.camel@rex>
X-Enigmail-Version: 1.1.1
Cc: Chris Larson <clarson@mvista.com>
Subject: Re: RFC: Layer tooling brainstorming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Apr 2011 23:32:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> * Maybe need to split into "bootstrap" steps (e.g where pseduo is
>   established, layers downloaded etc)

So for the most part, the last product we shipped was largely arranged
in this manner. We were using collections, but in many cases layers is
just a reimplementation at a lower level(which is definitely goodness).
During ELC I had a number of discussions primarily around remote layer
fetch and most of the responses were meh, or that they wanted to make
the tool external to bitbake. So after the conference was over I went
ahead and worked out a version of the implementation  that could be done
either in a include or in the bitbake code itself. The version in the
git repo below is obviously just the bitbake implementation.

I have a rough implementation largely based off of collection.inc + some
enhancements we made internally for remote collection fetching. Some of
it is messy(setting up the early fetching vars with out using another
config), but for the ones I list in the patch header it appears to work
well.

I do not believe that this is complete, but it is probably a reasonable
starting point.

Pull URL: git://gitorious.org/jpwork/bb.git
Branch: remote-layering
Browse: https://gitorious.org/jpwork/bb/trees/remote-layering


---
Add support for remote layering.

The bulk of this patch is based on Chris Larson's collection.inc,
but refactored for use inside bitbake, and for layers.

Adds two new configuration options:

LAYER_UNPACKDIR - directory to unpack downloaded layers for use in
configuration.
LAYER_REMOTE_STASH - location to store downloaded layers for use in
configuration.

Layers can be specified in the current manner:
BBLAYERS = " \
   /path/to/layer/one \
   /path/to/layer/two \
"

Or you can specify uris:

BBLAYERS = " \
	http://url.to.my.tarball/tarball.tar.gz \
	git://gitserver.com/git/repo;proto=http \
        /path/to/layer/three \
        file:///path/to/layer/four \
"

Currently there is a single layer option, that can be added to a uri,
layerBase=<subpath>.
This option would be used to specify if a layer starts somewhere other
then the base of the
tarball/scm repository. For example if you wanted to add oe-core you
would do:

BBLAYERS  =
"git://git.openembedded.org/openembedded-core;protocol=git;tag=master;layerBase=meta"

Currently for fetch the following uris should work  :
'git','http','https','ftp','file'
Currently for fetch2 the following uris should work :
'git','http','https','ftp','file','svn'

There are certainly some ugly bits in here, and there are certainly lots
of places to improve,
but this gets a good chunk of the base support in.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Diff rendering mode:inlineside by side


