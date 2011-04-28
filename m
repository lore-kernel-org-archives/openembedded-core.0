Received: from mail-px0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QFVrf-00074v-V0
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 20:23:00 +0200
Received: by pxi9 with SMTP id 9so210598pxi.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2011 11:20:26 -0700 (PDT)
Received: by 10.68.40.40 with SMTP id u8mr1660169pbk.333.1304014826568;
	Thu, 28 Apr 2011 11:20:26 -0700 (PDT)
Received: from [10.0.10.113] (gateway-1237.mvista.com [206.112.117.35])
	by mx.google.com with ESMTPS id f1sm1361973pbn.22.2011.04.28.11.20.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2011 11:20:25 -0700 (PDT)
Message-ID: <4DB9AFE8.3060309@mvista.com>
Date: Thu, 28 Apr 2011 11:20:24 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
	ThunderBrowse/3.3.5
MIME-Version: 1.0
To: Jeremy Puhlman <jpuhlman@mvista.com>
References: <RFC: Layer tooling brainstorming>
	<1304014179-32612-2-git-send-email-jpuhlman@mvista.com>
In-Reply-To: <1304014179-32612-2-git-send-email-jpuhlman@mvista.com>
X-Enigmail-Version: 1.1.1
Cc: chris_larson@mentor.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Add support for remote layering.
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
X-List-Received-Date: Thu, 28 Apr 2011 18:23:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Missed prefix mail. Resent due to limited response.

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

Signed-off-by: Jeremy Puhlman <jpuhlman at mvista.com>



