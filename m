Return-Path: <brendan.le.foll@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EE02160722
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:09:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2016 08:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="798764485"
Received: from jupiter.iwi.intel.com (HELO jupiter.localdomain)
	([172.28.33.51])
	by orsmga003.jf.intel.com with ESMTP; 04 May 2016 08:07:05 -0700
Date: Wed, 4 May 2016 16:07:32 +0100
From: Brendan Le Foll <brendan.le.foll@intel.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Message-ID: <20160504150732.GB12969@jupiter.localdomain>
References: <CAAPZna1xLfbyYUKa+qcLfeGCv=mqg7JwWtirfAbqfM+TCu5m7g@mail.gmail.com>
	<20160504143806.GA12969@jupiter.localdomain>
	<CAAPZna1M5ibZ8J2vOZ5PmJqAHVwNn=vR8mKrmYmuQ-YdLWopfw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAPZna1M5ibZ8J2vOZ5PmJqAHVwNn=vR8mKrmYmuQ-YdLWopfw@mail.gmail.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm class usage
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
X-List-Received-Date: Wed, 04 May 2016 15:09:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 04, 2016 at 11:53:08AM -0300, Fabio Berton wrote:
>    Hi Brendan,
>    Thanks for reply.
>    I'm trying to use npm class with this layer
>    [1]https://github.com/imyller/meta-nodejs
>    For example, I changed this recipe
>    [2]https://github.com/imyller/meta-nodejs/blob/master/recipes/grunt/gru
>    nt-cli_1.1.0.bb to use npm class provided by oe-core and removed all
>    classes from meta-nodejs.

I'm not sure where that npm class is from but it's not the one from
openembedded-core? With that npm.bbclass I'm able to build grunt-cli with a
simple recipe like this:

SUMMARY = "Grunt.js command line wrapper"
HOMEPAGE = "http://gruntjs.com/"
SECTION = "js/devel"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://README.md;md5=a24cc788ab726e615aa5bf0168c5d77d"
SRC_URI = "npm://registry.npmjs.org;name=${PN};version=${PV}"                                                                                                                  
inherit npm 

Does that help? Note the license isn't downloaded by npm so I cheekily took the
README.md for the md5 license check ;-) That probably needs to get fixed, using
the package.json would likely be nicer...

Cheers,
Brendan

>    I can install grunt-cli If I remove S = ${WORKDIR}/npmpkg and
>    --no-registry option.
>    I put PREFERRED_VERSION_nodejs-native on local.conf to set nodejs
>    version and I tried with all versions available on meta-nodejs and
>    meta-oe version, that has patch to enable --no-registry.
>    I'll try with nodejs version that you're using.
> 
>    On Wed, May 4, 2016 at 11:38 AM, Brendan Le Foll
>    <[3]brendan.le.foll@intel.com> wrote:
> 
>      On Tue, May 03, 2016 at 01:24:49PM -0300, Fabio Berton wrote:
>      >    Hi all!
>      >    I'm trying to install some recipes that use npm class and I
>      have two
>      >    questions.
>      >    1 - Why use S = "${WORKDIR}/npmpkg"? This not work for me.
>      That's surprising the fetcher basically extracts it that way so the
>      class just defaults to that location as 'the right thing'. Do you
>      have
>      an example recipe that isn't working that I could take a look at?
>      >    2 - Using option --no-registry inside npm_do_compile task I get
>      this
>      >    error:
>      >    | npm ERR! Registry not defined and registry files not found:
>      >
>      "/home/user/prj/build/tmp/work/all-linux-musleabi/gulp-cli/1.2.1-r0/
>      npm
>      >    _cache/noregistry/wreck/.cache.json",
>      >
>      "/home/user/prj/build/tmp/work/all-linux-musleabi/gulp-cli/1.2.1-r0/
>      npm
>      >    _cache/wreck/.cache.json".
>      >    | npm ERR!
>      >    | npm ERR! If you need help, you may report this error at:
>      >    | npm ERR!     <[1][4]https://github.com/npm/npm/issues>
>      >    | npm ERR! Linux 3.18.0-trunk-amd64
>      >    | npm ERR! argv
>      >    "/home/user/prj/build/tmp/sysroots/x86_64-linux/usr/bin/node"
>      >    "/home/user/prj/build/tmp/sysroots/x86_64-linux/usr/bin/npm"
>      >    "--arch=arm" "--production" "--no-registry" "install"
>      >    | npm ERR! node v4.4.1
>      >    | npm ERR! npm  v2.14.20
>      >    I found this issue [2][5]https://github.com/npm/npm/issues/5509
>      and using
>      >    --cache-min 99999 instead of --no-registry this error doesn't
>      appears
>      >    and build works fine.
>      >    I noticed that nodejs recipe is using this patch
>      >
>      [3][6]https://github.com/bendaaron/meta-oe-dev/commit/3e02a40d689a70
>      025472
>      >    15473a00606d8213ce0c
>      >    but seems not fix for me.
>      So I saw this, and ignored it since --no-registry was working fine
>      for
>      me with that patch and then with 4.2.x. It seems the cache-min
>      option
>      doesn't always work as intented.
>      I fired up a build with 4.4.x from
>      [7]https://github.com/ostroproject/meta-iot-web/blob/master/recipes-
>      devtools/nodejs/nodejs_4.4.1.bb
>      and it seemed to build ok for me with --no-registry.
>      Cheers,
>      Brendan
> 
> References
> 
>    1. https://github.com/imyller/meta-nodejs
>    2. https://github.com/imyller/meta-nodejs/blob/master/recipes/grunt/grunt-cli_1.1.0.bb
>    3. mailto:brendan.le.foll@intel.com
>    4. https://github.com/npm/npm/issues
>    5. https://github.com/npm/npm/issues/5509
>    6. https://github.com/bendaaron/meta-oe-dev/commit/3e02a40d689a70025472
>    7. https://github.com/ostroproject/meta-iot-web/blob/master/recipes-devtools/nodejs/nodejs_4.4.1.bb

