Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id E92EC71AC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 04:50:07 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id k200so22894113itb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 20:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:content-transfer-encoding:user-agent;
	bh=EmVLqVsLMyo8D4EoNy6BWnjHrgj2xqfu4XebxM7CUqM=;
	b=sCAY6c+r14vGmVrW74b3D/vKsSZjxraMEnRBzwtqYdaXraBYVJUn+Vj7qPLgXii9WF
	CcV/WtOmdeoHw407rncJlzcYWFxcJbDbIGfaMPbRrEW39BmQgCCatD48VtNoFb0RBNBT
	FBBTs3qb9OWCOMPrbdmhXMDRi3NQ6uxK4JfC34i4wDDK+2ej+h4ADmFcSVLLFMFFf930
	51XqG9eqVTmGV9x6KNFguZak2N9LaT6UEN7pzlt/bQgsrfWtaFyzKvINnbub9g6AH1kA
	vkXoSFgxUkBHepHspES7NLPSin+az6uvaGcU5oqVgqwdesnw/eR+Yu+1U07VWCqcWoKo
	s9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:content-transfer-encoding:user-agent;
	bh=EmVLqVsLMyo8D4EoNy6BWnjHrgj2xqfu4XebxM7CUqM=;
	b=G+BbHHNjC7UHjk6ThXRZNev1ekpVE1F0wKVNo8p9G9N2YeM1ZKvlLGYrG8DBya0W/8
	zZ991drBzFdEvKPZHtHLcVrFJE8krOL98vh7FXznSNLeKMc2lnDoDE0St44SsazEjsSt
	6QDQKy8UEx/RiX7SUw74009a6IapGkFDAi6KfRoKeLFrCaHUDcIaLJImniZ78FMBUH9c
	BxF7HEsOYJQGxrK9e3T6mPV9FLdo5HsA4ShJ4NpxFKE6gdKTZpJr8QDItyQzDr8EIePC
	rKx7zLkkjiNX+M8PPNS+Ejs/qpB8HH+KiQRJXBwuLRF4t3RNna8jXIDAYFsz8dZCVUzJ
	D7jA==
X-Gm-Message-State: AMke39m28zKFIjiV/lTakbs/ojRsXpmZBkj3F2V/jVkf6xwxlA7o8Fb/obbq6P2h+eSZ0A==
X-Received: by 10.36.204.137 with SMTP id x131mr771554itf.35.1488257407581;
	Mon, 27 Feb 2017 20:50:07 -0800 (PST)
Received: from linux-uys3 ([45.72.250.10]) by smtp.gmail.com with ESMTPSA id
	b129sm5223814itc.3.2017.02.27.20.50.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Feb 2017 20:50:06 -0800 (PST)
Date: Mon, 27 Feb 2017 23:50:04 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170228045004.GA5913@linux-uys3>
MIME-Version: 1.0
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: npm thoughts
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
X-List-Received-Date: Tue, 28 Feb 2017 04:50:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

I was trying out devtool+npm with the electron quick-start node stuff and
noticed some interesting results. This simple app can be found at
https://github.com/electron/electron-quick-start

According to https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM there are
two ways to create a recipe for a node app using The Yocto Project's devtool:
	1) by pointing devtool at the npm registry
	2) by pointing devtool at the project's source code
It is also possible to:
	3) point to a tarball of the project's source

Preparation for 2) is as follows:
	$ git clone git://github.com/electron/electron-quick-start

Further preparation for 3) continues:
	$ tar -c electron-quick-start/ > electron-quick-start.tar
	$ gzip electron-quick-start.tar

It is important to note that the following assumes morty. Master is messed up
right now with the introduction of per-recipe sysroots (but is expected to get
fixed eventually). The layers used are openembedded-core:morty, bitbake:1.32,
and meta-openembedded:morty.

This app's package.json is:

	{
	  "name": "electron-quick-start",
	  "version": "1.0.0",
	  "description": "A minimal Electron application",
	  "main": "main.js",
	  "scripts": {
	    "start": "electron ."
	  },  
	  "repository": "https://github.com/electron/electron-quick-start",
	  "keywords": [
	    "Electron",
	    "quick",
	    "start",
	    "tutorial",
	    "demo"
	  ],  
	  "author": "GitHub",
	  "license": "CC0-1.0",
	  "devDependencies": {
	    "electron": "^1.4.1"
	  }
	}


Testing 3)
	$ . layers/openembedded-core/oe-init-build-env tarball layers/bitbake
	edit conf/bblayers.conf to add meta-openembedded/meta-oe
	$ devtool add electron-quick-start ~/npm/source/electron-quick-start.tar.gz

	Here is the recipe devtool creates:
		# Recipe created by recipetool
		# This is the basis of a recipe and may need further editing in order to be fully functional.
		# (Feel free to remove these comments when editing.)

		SUMMARY = "A minimal Electron application"
		# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
		# your responsibility to verify that the values are complete and correct.
		#
		# The following license files were not able to be identified and are
		# represented as "Unknown" below, you will need to check them yourself:
		#   LICENSE.md
		#
		LICENSE = "CC0-1.0"
		LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c4bb4655ae0c8ab590a1aa591e3a80c5"

		SRC_URI = "file:///z/npm/source/electron-quick-start.tar.gz"

		NPM_LOCKDOWN := "${THISDIR}/${PN}/lockdown.json"

		inherit npm 

		# Must be set after inherit npm since that itself sets S
		S = "${WORKDIR}/electron-quick-start.git"
		LICENSE_${PN} = "CC0-1.0"

	$ bitbake electron-quick-start
	$ tree tmp-glibc/work/i586-oe-linux/electron-quick-start/1.0.0-r0/packages-split/electron-quick-start
	electron-quick-start
	└── usr
	    └── lib
		└── node_modules
		    └── electron-quick-start
			├── index.html
			├── LICENSE.md
			├── main.js
			├── package.json
			├── README.md
			└── renderer.js


Testing 2)
	$ . layers/openembedded-core/oe-init-build-env clone layers/bitbake
	edit conf/bblayers.conf to add meta-openembedded/meta-oe
	$ devtool add electron-quick-start ~/npm/source/electron-quick-start.git

	Here is the recipe:
		# Recipe created by recipetool
		# This is the basis of a recipe and may need further editing in order to be fully functional.
		# (Feel free to remove these comments when editing.)

		SUMMARY = "A minimal Electron application"
		# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
		# your responsibility to verify that the values are complete and correct.
		#
		# The following license files were not able to be identified and are
		# represented as "Unknown" below, you will need to check them yourself:
		#   LICENSE.md
		#
		LICENSE = "CC0-1.0"
		LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c4bb4655ae0c8ab590a1aa591e3a80c5"

		SRC_URI = "git://github.com/electron/electron-quick-start.git"

		# Modify these as desired
		PV = "1.0.0+git${SRCPV}"
		SRCREV = "f8ae670ce85ce7329580b1085e37abb62ea3566b"

		NPM_LOCKDOWN := "${THISDIR}/${PN}/lockdown.json"

		inherit npm 

		# Must be set after inherit npm since that itself sets S
		S = "${WORKDIR}/git"
		LICENSE_${PN} = "CC0-1.0"

	$ bitbake electron-quick-start
	$ tree tmp-glibc/work/i586-oe-linux/electron-quick-start/1.0.0+git999-r0/packages-split/electron-quick-start
	tmp-glibc/work/i586-oe-linux/electron-quick-start/1.0.0+git999-r0/packages-split/electron-quick-start
	└── usr
	    └── lib
		└── node_modules
		    └── electron-quick-start
			├── index.html
			├── LICENSE.md
			├── main.js
			├── package.json
			├── README.md
			└── renderer.js


Testing 1)
	$ . layers/openembedded-core/oe-init-build-env registry layers/bitbake/
	edit conf/bblayers.conf to add meta-openembedded/meta-oe
	$ devtool add electron-quick-start "npm://registry.npmjs.org;name=electron-quick-start;version=1.0.0"
	this step runs for a while then fails because it can't find the license "MIT/X11"

	Here is the recipe when if finishes:
		# Recipe created by recipetool
		# This is the basis of a recipe and may need further editing in order to be fully functional.
		# (Feel free to remove these comments when editing.)

		SUMMARY = "A minimal Electron application"
		HOMEPAGE = "https://github.com/atom/electron-quick-start#readme"
		# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
		# your responsibility to verify that the values are complete and correct.
		#
		# NOTE: multiple licenses have been detected; if that is correct you should separate
		# these in the LICENSE value using & if the multiple licenses all apply, or | if there
		# is a choice between the multiple licenses. If in doubt, check the accompanying
		# documentation to determine which situation is applicable.
		#
		# The following license files were not able to be identified and are
		# represented as "Unknown" below, you will need to check them yourself:
		#   LICENSE.md
		#   node_modules/electron-updater/node_modules/unzip/node_modules/fstream/LICENSE
		#   node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/fs.realpath/LICENSE
		#   node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/minimatch/node_modules/brace-expansion/node_modules/balanced-match/LICENSE.md
		#   node_modules/electron-updater/node_modules/unzip/node_modules/binary/node_modules/chainsaw/node_modules/traverse/LICENSE
		#   node_modules/electron-updater/node_modules/tar-stream/node_modules/readable-stream/LICENSE
		#   node_modules/electron-updater/node_modules/tar-stream/node_modules/readable-stream/node_modules/buffer-shims/license.md
		#   node_modules/electron-updater/node_modules/tar-stream/node_modules/readable-stream/node_modules/process-nextick-args/license.md
		#   node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/LICENSE.md
		#   node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/node_modules/readable-stream/LICENSE
		#   node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/node_modules/readable-stream/node_modules/process-nextick-args/license.md
		#   node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/node_modules/readable-stream/node_modules/buffer-shims/license.md
		#   node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/readable-stream/LICENSE
		#   node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/readable-stream/node_modules/buffer-shims/license.md
		#   node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/readable-stream/node_modules/process-nextick-args/license.md
		#   node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/readable-stream/LICENSE
		#   node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/readable-stream/node_modules/buffer-shims/license.md
		#   node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/readable-stream/node_modules/process-nextick-args/license.md
		#   node_modules/electron-updater/node_modules/glob/node_modules/minimatch/node_modules/brace-expansion/node_modules/balanced-match/LICENSE.md
		#   Squirrel.Mac/script/LICENSE.md
		#   Squirrel.Mac/External/OHHTTPStubs/LICENSE
		#   Squirrel.Mac/Carthage/Checkouts/ReactiveCocoa/LICENSE.md
		#   Squirrel.Mac/Carthage/Checkouts/ReactiveCocoa/Carthage/Checkouts/Quick/LICENSE
		#   Squirrel.Mac/Carthage/Checkouts/ReactiveCocoa/Carthage/Checkouts/Quick/Externals/Nimble/LICENSE.md
		#   Squirrel.Mac/Carthage/Checkouts/ReactiveCocoa/Carthage/Checkouts/Nimble/LICENSE.md
		#   Squirrel.Mac/Carthage/Checkouts/ReactiveCocoa/script/LICENSE.md
		#   Squirrel.Mac/Carthage/Checkouts/Quick/LICENSE
		#   Squirrel.Mac/Carthage/Checkouts/Quick/Externals/Nimble/LICENSE.md
		#   Squirrel.Mac/Carthage/Checkouts/Nimble/LICENSE.md
		#   Squirrel.Mac/Carthage/Checkouts/Mantle/LICENSE.md
		#   Squirrel.Mac/Carthage/Checkouts/Mantle/Carthage/Checkouts/Quick/LICENSE
		#   Squirrel.Mac/Carthage/Checkouts/Mantle/Carthage/Checkouts/Quick/Externals/Nimble/LICENSE.md
		#   Squirrel.Mac/Carthage/Checkouts/Mantle/Carthage/Checkouts/Nimble/LICENSE.md
		#   Squirrel.Mac/Carthage/Checkouts/Mantle/script/LICENSE.md
		#
		LICENSE = "ISC & BSD & Unknown & MIT/X11 & MIT"
		LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c4bb4655ae0c8ab590a1aa591e3a80c5 \
				    file://node_modules/electron-updater/LICENSE;md5=71a52831f2bbba1383d42d9390458df8 \
				    file://node_modules/electron-updater/node_modules/commander/LICENSE;md5=25851d4d10d6611a12d5571dab945a00 \
				    file://node_modules/electron-updater/node_modules/commander/node_modules/graceful-readlink/LICENSE;md5=b0270ddb7ee6643eee76e80113234806 \
				    file://node_modules/electron-updater/node_modules/unzip/LICENSE;md5=46cc96ae87cdaa8f9ec33480b548dce5 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/setimmediate/LICENSE.txt;md5=af19eaafbc6aa0d2c97538dcfb6db94a \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/readable-stream/LICENSE;md5=d7351a4fc8e956f1a68413490d5e655e \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/readable-stream/node_modules/string_decoder/LICENSE;md5=fcf5cfdc777e49f11402422c72a86f43 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/readable-stream/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/readable-stream/node_modules/core-util-is/LICENSE;md5=6126e36127d20ec0e2f637204a5c68ff \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/pullstream/LICENSE;md5=46cc96ae87cdaa8f9ec33480b548dce5 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/pullstream/node_modules/readable-stream/LICENSE;md5=d7351a4fc8e956f1a68413490d5e655e \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/pullstream/node_modules/readable-stream/node_modules/string_decoder/LICENSE;md5=fcf5cfdc777e49f11402422c72a86f43 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/pullstream/node_modules/readable-stream/node_modules/core-util-is/LICENSE;md5=6126e36127d20ec0e2f637204a5c68ff \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/pullstream/node_modules/readable-stream/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/pullstream/node_modules/setimmediate/LICENSE.txt;md5=af19eaafbc6aa0d2c97538dcfb6db94a \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/pullstream/node_modules/slice-stream/LICENSE;md5=e3c4bafaf8e85046af71466220bd0eb3 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/pullstream/node_modules/slice-stream/node_modules/readable-stream/LICENSE;md5=d7351a4fc8e956f1a68413490d5e655e \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/pullstream/node_modules/slice-stream/node_modules/readable-stream/node_modules/string_decoder/LICENSE;md5=fcf5cfdc777e49f11402422c72a86f43 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/pullstream/node_modules/slice-stream/node_modules/readable-stream/node_modules/core-util-is/LICENSE;md5=6126e36127d20ec0e2f637204a5c68ff \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/pullstream/node_modules/slice-stream/node_modules/readable-stream/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/match-stream/LICENSE;md5=e3c4bafaf8e85046af71466220bd0eb3 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/match-stream/node_modules/readable-stream/LICENSE;md5=d7351a4fc8e956f1a68413490d5e655e \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/match-stream/node_modules/readable-stream/node_modules/string_decoder/LICENSE;md5=fcf5cfdc777e49f11402422c72a86f43 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/match-stream/node_modules/readable-stream/node_modules/core-util-is/LICENSE;md5=6126e36127d20ec0e2f637204a5c68ff \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/match-stream/node_modules/readable-stream/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/LICENSE;md5=8ce909f9cccb74a7c6f2720930d072c1 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/once/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/once/node_modules/wrappy/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/fs.realpath/LICENSE;md5=062470525c8e380f8567f665ef554d11 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/minimatch/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/minimatch/node_modules/brace-expansion/node_modules/concat-map/LICENSE;md5=aea1cde69645f4b99be4ff7ca9abcce1 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/minimatch/node_modules/brace-expansion/node_modules/balanced-match/LICENSE.md;md5=7fa99ddc3424107350ca6e9a24552085 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/inflight/LICENSE;md5=90a3ca01a5efed8b813a81c6c8fa2e63 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/inflight/node_modules/once/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/inflight/node_modules/once/node_modules/wrappy/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/inflight/node_modules/wrappy/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/rimraf/node_modules/glob/node_modules/path-is-absolute/license;md5=a12ebca0510a773644101a99a867d210 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/mkdirp/LICENSE;md5=b2d989bc186e7f6b418a5fdd5cc0b56b \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/mkdirp/node_modules/minimist/LICENSE;md5=aea1cde69645f4b99be4ff7ca9abcce1 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/fstream/node_modules/graceful-fs/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/unzip/node_modules/binary/node_modules/chainsaw/node_modules/traverse/LICENSE;md5=0f6546e91538ce8c26b2da1623705c62 \
				    file://node_modules/electron-updater/node_modules/tar-stream/LICENSE;md5=9befe7026bf915886cd566a98117c80e \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/xtend/LICENCE;md5=96bcdf84e670aafacac9e094bce29ac9 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/readable-stream/LICENSE;md5=a67a7926e54316d90c14f74f71080977 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/readable-stream/node_modules/buffer-shims/license.md;md5=e04ef9ec24d382b7576c997066a44835 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/readable-stream/node_modules/util-deprecate/LICENSE;md5=b7c99ef4b0f3ad9911a52219947f8cf0 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/readable-stream/node_modules/string_decoder/LICENSE;md5=fcf5cfdc777e49f11402422c72a86f43 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/readable-stream/node_modules/process-nextick-args/license.md;md5=216769dac98a78ec088ee7cc6fad1dfa \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/readable-stream/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/readable-stream/node_modules/core-util-is/LICENSE;md5=6126e36127d20ec0e2f637204a5c68ff \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/end-of-stream/LICENSE;md5=9befe7026bf915886cd566a98117c80e \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/end-of-stream/node_modules/once/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/end-of-stream/node_modules/once/node_modules/wrappy/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/LICENSE.md;md5=e58dc7a94bb9decf6a7b2ff97d22b213 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/node_modules/readable-stream/LICENSE;md5=a67a7926e54316d90c14f74f71080977 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/node_modules/readable-stream/node_modules/string_decoder/LICENSE;md5=fcf5cfdc777e49f11402422c72a86f43 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/node_modules/readable-stream/node_modules/util-deprecate/LICENSE;md5=b7c99ef4b0f3ad9911a52219947f8cf0 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/node_modules/readable-stream/node_modules/process-nextick-args/license.md;md5=216769dac98a78ec088ee7cc6fad1dfa \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/node_modules/readable-stream/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/node_modules/readable-stream/node_modules/buffer-shims/license.md;md5=e04ef9ec24d382b7576c997066a44835 \
				    file://node_modules/electron-updater/node_modules/tar-stream/node_modules/bl/node_modules/readable-stream/node_modules/core-util-is/LICENSE;md5=6126e36127d20ec0e2f637204a5c68ff \
				    file://node_modules/electron-updater/node_modules/spin/LICENSE.txt;md5=31f0289eb4d139200326604d10b9e21b \
				    file://node_modules/electron-updater/node_modules/semver/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/minimist/LICENSE;md5=aea1cde69645f4b99be4ff7ca9abcce1 \
				    file://node_modules/electron-updater/node_modules/got/license;md5=a12ebca0510a773644101a99a867d210 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/unzip-response/license;md5=5b422d6bf88afe88977d04f8bdd4959c \
				    file://node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/license;md5=2a8369b875113ae53aa6c5bb39a58d3c \
				    file://node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/pinkie-promise/license;md5=be72c3ad86c1c4e9578a1945b082b17d \
				    file://node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/pinkie-promise/node_modules/pinkie/license;md5=be72c3ad86c1c4e9578a1945b082b17d \
				    file://node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/readable-stream/LICENSE;md5=a67a7926e54316d90c14f74f71080977 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/readable-stream/node_modules/buffer-shims/license.md;md5=e04ef9ec24d382b7576c997066a44835 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/readable-stream/node_modules/util-deprecate/LICENSE;md5=b7c99ef4b0f3ad9911a52219947f8cf0 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/readable-stream/node_modules/string_decoder/LICENSE;md5=fcf5cfdc777e49f11402422c72a86f43 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/readable-stream/node_modules/process-nextick-args/license.md;md5=216769dac98a78ec088ee7cc6fad1dfa \
				    file://node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/readable-stream/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/read-all-stream/node_modules/readable-stream/node_modules/core-util-is/LICENSE;md5=6126e36127d20ec0e2f637204a5c68ff \
				    file://node_modules/electron-updater/node_modules/got/node_modules/prepend-http/license;md5=a12ebca0510a773644101a99a867d210 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/pinkie-promise/license;md5=be72c3ad86c1c4e9578a1945b082b17d \
				    file://node_modules/electron-updater/node_modules/got/node_modules/pinkie-promise/node_modules/pinkie/license;md5=be72c3ad86c1c4e9578a1945b082b17d \
				    file://node_modules/electron-updater/node_modules/got/node_modules/parse-json/license;md5=a12ebca0510a773644101a99a867d210 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/parse-json/node_modules/error-ex/LICENSE;md5=e67c75e89656b80fd99cb7d30fb43102 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/parse-json/node_modules/error-ex/node_modules/is-arrayish/LICENSE;md5=e67c75e89656b80fd99cb7d30fb43102 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/LICENSE;md5=9befe7026bf915886cd566a98117c80e \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/stream-shift/LICENSE;md5=42014010547e55bd3bcac2fec8c45624 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/readable-stream/LICENSE;md5=a67a7926e54316d90c14f74f71080977 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/readable-stream/node_modules/buffer-shims/license.md;md5=e04ef9ec24d382b7576c997066a44835 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/readable-stream/node_modules/util-deprecate/LICENSE;md5=b7c99ef4b0f3ad9911a52219947f8cf0 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/readable-stream/node_modules/string_decoder/LICENSE;md5=fcf5cfdc777e49f11402422c72a86f43 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/readable-stream/node_modules/process-nextick-args/license.md;md5=216769dac98a78ec088ee7cc6fad1dfa \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/readable-stream/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/readable-stream/node_modules/core-util-is/LICENSE;md5=6126e36127d20ec0e2f637204a5c68ff \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/end-of-stream/node_modules/once/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/got/node_modules/duplexify/node_modules/end-of-stream/node_modules/once/node_modules/wrappy/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/got/node_modules/node-status-codes/license;md5=a12ebca0510a773644101a99a867d210 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/is-stream/license;md5=a12ebca0510a773644101a99a867d210 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/is-redirect/license;md5=a12ebca0510a773644101a99a867d210 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/is-plain-obj/license;md5=a12ebca0510a773644101a99a867d210 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/create-error-class/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/got/node_modules/object-assign/license;md5=a12ebca0510a773644101a99a867d210 \
				    file://node_modules/electron-updater/node_modules/glob/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/glob/node_modules/path-is-absolute/license;md5=a12ebca0510a773644101a99a867d210 \
				    file://node_modules/electron-updater/node_modules/glob/node_modules/once/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/glob/node_modules/once/node_modules/wrappy/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/glob/node_modules/minimatch/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/glob/node_modules/minimatch/node_modules/brace-expansion/node_modules/concat-map/LICENSE;md5=aea1cde69645f4b99be4ff7ca9abcce1 \
				    file://node_modules/electron-updater/node_modules/glob/node_modules/minimatch/node_modules/brace-expansion/node_modules/balanced-match/LICENSE.md;md5=7fa99ddc3424107350ca6e9a24552085 \
				    file://node_modules/electron-updater/node_modules/glob/node_modules/inherits/LICENSE;md5=5b2ef2247af6d355ae9d9f988092d470 \
				    file://node_modules/electron-updater/node_modules/glob/node_modules/inflight/LICENSE;md5=90a3ca01a5efed8b813a81c6c8fa2e63 \
				    file://node_modules/electron-updater/node_modules/glob/node_modules/inflight/node_modules/once/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/glob/node_modules/inflight/node_modules/once/node_modules/wrappy/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/glob/node_modules/inflight/node_modules/wrappy/LICENSE;md5=82703a69f6d7411dde679954c2fd9dca \
				    file://node_modules/electron-updater/node_modules/async/LICENSE;md5=dc113e0fc4029c29942399ad22425402 \
				    file://node_modules/electron-updater/node_modules/appdirectory/LICENSE.md;md5=19b6cbfe48611ec68354aa02bf266b8a \
				    file://node_modules/electron-plugins/LICENSE;md5=71a52831f2bbba1383d42d9390458df8 \
				    file://node_modules/electron-plugins/node_modules/async/LICENSE;md5=dc113e0fc4029c29942399ad22425402 \
				    file://node_modules/electron-plugins/node_modules/appdirectory/LICENSE.md;md5=19b6cbfe48611ec68354aa02bf266b8a \
				    file://Squirrel.Mac/LICENSE;md5=128544b123235edfd1f1b0fcd835836b \
				    file://Squirrel.Mac/script/LICENSE.md;md5=0e5338dfdadf532bf261f0ff3b50e5c2 \
				    file://Squirrel.Mac/External/OHHTTPStubs/LICENSE;md5=02de072e1ba982f28a1af1385d484172 \
				    file://Squirrel.Mac/Carthage/Checkouts/ReactiveCocoa/LICENSE.md;md5=5543b4fe42a4a7723b1e010dc924c78a \
				    file://Squirrel.Mac/Carthage/Checkouts/ReactiveCocoa/Carthage/Checkouts/Quick/LICENSE;md5=579f318fc6783f299f5731c4a6c958d4 \
				    file://Squirrel.Mac/Carthage/Checkouts/ReactiveCocoa/Carthage/Checkouts/Quick/Externals/Nimble/LICENSE.md;md5=7177dcbba5a41d09e055d6d14add394f \
				    file://Squirrel.Mac/Carthage/Checkouts/ReactiveCocoa/Carthage/Checkouts/Nimble/LICENSE.md;md5=7177dcbba5a41d09e055d6d14add394f \
				    file://Squirrel.Mac/Carthage/Checkouts/ReactiveCocoa/script/LICENSE.md;md5=0e5338dfdadf532bf261f0ff3b50e5c2 \
				    file://Squirrel.Mac/Carthage/Checkouts/Quick/LICENSE;md5=579f318fc6783f299f5731c4a6c958d4 \
				    file://Squirrel.Mac/Carthage/Checkouts/Quick/Externals/Nimble/LICENSE.md;md5=7177dcbba5a41d09e055d6d14add394f \
				    file://Squirrel.Mac/Carthage/Checkouts/Nimble/LICENSE.md;md5=7177dcbba5a41d09e055d6d14add394f \
				    file://Squirrel.Mac/Carthage/Checkouts/Mantle/LICENSE.md;md5=7c732bf6e317d77c4350da48b0438900 \
				    file://Squirrel.Mac/Carthage/Checkouts/Mantle/Carthage/Checkouts/Quick/LICENSE;md5=579f318fc6783f299f5731c4a6c958d4 \
				    file://Squirrel.Mac/Carthage/Checkouts/Mantle/Carthage/Checkouts/Quick/Externals/Nimble/LICENSE.md;md5=7177dcbba5a41d09e055d6d14add394f \
				    file://Squirrel.Mac/Carthage/Checkouts/Mantle/Carthage/Checkouts/Nimble/LICENSE.md;md5=7177dcbba5a41d09e055d6d14add394f \
				    file://Squirrel.Mac/Carthage/Checkouts/Mantle/script/LICENSE.md;md5=0e5338dfdadf532bf261f0ff3b50e5c2"

		SRC_URI = "npm://registry.npmjs.org;name=electron-quick-start;version=${PV}"

		NPM_SHRINKWRAP := "${THISDIR}/${PN}/npm-shrinkwrap.json"
		NPM_LOCKDOWN := "${THISDIR}/${PN}/lockdown.json"

		inherit npm

		# Must be set after inherit npm since that itself sets S
		S = "${WORKDIR}/npmpkg"
		LICENSE_${PN}-electron-plugins-appdirectory = "MIT"
		LICENSE_${PN}-electron-plugins-async = "MIT"
		LICENSE_${PN}-electron-plugins = "MIT"
		LICENSE_${PN}-electron-updater-appdirectory = "MIT"
		LICENSE_${PN}-electron-updater-async = "MIT"
		LICENSE_${PN}-electron-updater-commander-graceful-readlink = "MIT"
		LICENSE_${PN}-electron-updater-commander = "MIT"
		LICENSE_${PN}-electron-updater-glob-inflight-once-wrappy = "ISC"
		LICENSE_${PN}-electron-updater-glob-inflight-once = "ISC"
		LICENSE_${PN}-electron-updater-glob-inflight-wrappy = "ISC"
		LICENSE_${PN}-electron-updater-glob-inflight = "ISC"
		LICENSE_${PN}-electron-updater-glob-inherits = "ISC"
		LICENSE_${PN}-electron-updater-glob-minimatch-brace-expansion-balanced-match = "MIT"
		LICENSE_${PN}-electron-updater-glob-minimatch-brace-expansion-concat-map = "MIT"
		LICENSE_${PN}-electron-updater-glob-minimatch-brace-expansion = "MIT"
		LICENSE_${PN}-electron-updater-glob-minimatch = "ISC"
		LICENSE_${PN}-electron-updater-glob-once-wrappy = "ISC"
		LICENSE_${PN}-electron-updater-glob-once = "ISC"
		LICENSE_${PN}-electron-updater-glob-path-is-absolute = "MIT"
		LICENSE_${PN}-electron-updater-glob = "ISC"
		LICENSE_${PN}-electron-updater-got-create-error-class-capture-stack-trace = "MIT"
		LICENSE_${PN}-electron-updater-got-create-error-class-inherits = "ISC"
		LICENSE_${PN}-electron-updater-got-create-error-class = "MIT"
		LICENSE_${PN}-electron-updater-got-duplexify-end-of-stream-once-wrappy = "ISC"
		LICENSE_${PN}-electron-updater-got-duplexify-end-of-stream-once = "ISC"
		LICENSE_${PN}-electron-updater-got-duplexify-end-of-stream = "MIT"
		LICENSE_${PN}-electron-updater-got-duplexify-inherits = "ISC"
		LICENSE_${PN}-electron-updater-got-duplexify-readable-stream-buffer-shims = "MIT"
		LICENSE_${PN}-electron-updater-got-duplexify-readable-stream-core-util-is = "MIT"
		LICENSE_${PN}-electron-updater-got-duplexify-readable-stream-inherits = "ISC"
		LICENSE_${PN}-electron-updater-got-duplexify-readable-stream-isarray = "MIT"
		LICENSE_${PN}-electron-updater-got-duplexify-readable-stream-process-nextick-args = "MIT"
		LICENSE_${PN}-electron-updater-got-duplexify-readable-stream-string-decoder = "MIT"
		LICENSE_${PN}-electron-updater-got-duplexify-readable-stream-util-deprecate = "MIT"
		LICENSE_${PN}-electron-updater-got-duplexify-readable-stream = "MIT"
		LICENSE_${PN}-electron-updater-got-duplexify-stream-shift = "MIT"
		LICENSE_${PN}-electron-updater-got-duplexify = "MIT"
		LICENSE_${PN}-electron-updater-got-is-plain-obj = "MIT"
		LICENSE_${PN}-electron-updater-got-is-redirect = "MIT"
		LICENSE_${PN}-electron-updater-got-is-stream = "MIT"
		LICENSE_${PN}-electron-updater-got-lowercase-keys = "MIT"
		LICENSE_${PN}-electron-updater-got-node-status-codes = "MIT"
		LICENSE_${PN}-electron-updater-got-object-assign = "MIT"
		LICENSE_${PN}-electron-updater-got-parse-json-error-ex-is-arrayish = "MIT"
		LICENSE_${PN}-electron-updater-got-parse-json-error-ex = "MIT"
		LICENSE_${PN}-electron-updater-got-parse-json = "MIT"
		LICENSE_${PN}-electron-updater-got-pinkie-promise-pinkie = "MIT"
		LICENSE_${PN}-electron-updater-got-pinkie-promise = "MIT"
		LICENSE_${PN}-electron-updater-got-prepend-http = "MIT"
		LICENSE_${PN}-electron-updater-got-read-all-stream-pinkie-promise-pinkie = "MIT"
		LICENSE_${PN}-electron-updater-got-read-all-stream-pinkie-promise = "MIT"
		LICENSE_${PN}-electron-updater-got-read-all-stream-readable-stream-buffer-shims = "MIT"
		LICENSE_${PN}-electron-updater-got-read-all-stream-readable-stream-core-util-is = "MIT"
		LICENSE_${PN}-electron-updater-got-read-all-stream-readable-stream-inherits = "ISC"
		LICENSE_${PN}-electron-updater-got-read-all-stream-readable-stream-isarray = "MIT"
		LICENSE_${PN}-electron-updater-got-read-all-stream-readable-stream-process-nextick-args = "MIT"
		LICENSE_${PN}-electron-updater-got-read-all-stream-readable-stream-string-decoder = "MIT"
		LICENSE_${PN}-electron-updater-got-read-all-stream-readable-stream-util-deprecate = "MIT"
		LICENSE_${PN}-electron-updater-got-read-all-stream-readable-stream = "MIT"
		LICENSE_${PN}-electron-updater-got-read-all-stream = "MIT"
		LICENSE_${PN}-electron-updater-got-timed-out = "MIT"
		LICENSE_${PN}-electron-updater-got-unzip-response = "MIT"
		LICENSE_${PN}-electron-updater-got = "MIT"
		LICENSE_${PN}-electron-updater-minimist = "MIT"
		LICENSE_${PN}-electron-updater-semver = "ISC"
		LICENSE_${PN}-electron-updater-spin = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-bl-readable-stream-buffer-shims = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-bl-readable-stream-core-util-is = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-bl-readable-stream-inherits = "ISC"
		LICENSE_${PN}-electron-updater-tar-stream-bl-readable-stream-isarray = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-bl-readable-stream-process-nextick-args = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-bl-readable-stream-string-decoder = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-bl-readable-stream-util-deprecate = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-bl-readable-stream = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-bl = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-end-of-stream-once-wrappy = "ISC"
		LICENSE_${PN}-electron-updater-tar-stream-end-of-stream-once = "ISC"
		LICENSE_${PN}-electron-updater-tar-stream-end-of-stream = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-readable-stream-buffer-shims = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-readable-stream-core-util-is = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-readable-stream-inherits = "ISC"
		LICENSE_${PN}-electron-updater-tar-stream-readable-stream-isarray = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-readable-stream-process-nextick-args = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-readable-stream-string-decoder = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-readable-stream-util-deprecate = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-readable-stream = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream-xtend = "MIT"
		LICENSE_${PN}-electron-updater-tar-stream = "MIT"
		LICENSE_${PN}-electron-updater-unzip-binary-buffers = "Unknown"
		LICENSE_${PN}-electron-updater-unzip-binary-chainsaw-traverse = "MIT/X11"
		LICENSE_${PN}-electron-updater-unzip-binary-chainsaw = "MIT/X11"
		LICENSE_${PN}-electron-updater-unzip-binary = "MIT"
		LICENSE_${PN}-electron-updater-unzip-fstream-graceful-fs-natives = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-graceful-fs = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-inherits = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-mkdirp-minimist = "MIT"
		LICENSE_${PN}-electron-updater-unzip-fstream-mkdirp = "MIT"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-fs.realpath = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-inflight-once-wrappy = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-inflight-once = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-inflight-wrappy = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-inflight = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-inherits = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-minimatch-brace-expansion-balanced-match = "MIT"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-minimatch-brace-expansion-concat-map = "MIT"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-minimatch-brace-expansion = "MIT"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-minimatch = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-once-wrappy = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-once = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob-path-is-absolute = "MIT"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf-glob = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream-rimraf = "ISC"
		LICENSE_${PN}-electron-updater-unzip-fstream = "BSD"
		LICENSE_${PN}-electron-updater-unzip-match-stream-buffers = "Unknown"
		LICENSE_${PN}-electron-updater-unzip-match-stream-readable-stream-core-util-is = "MIT"
		LICENSE_${PN}-electron-updater-unzip-match-stream-readable-stream-inherits = "ISC"
		LICENSE_${PN}-electron-updater-unzip-match-stream-readable-stream-isarray = "MIT"
		LICENSE_${PN}-electron-updater-unzip-match-stream-readable-stream-string-decoder = "MIT"
		LICENSE_${PN}-electron-updater-unzip-match-stream-readable-stream = "MIT"
		LICENSE_${PN}-electron-updater-unzip-match-stream = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream-over = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream-readable-stream-core-util-is = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream-readable-stream-inherits = "ISC"
		LICENSE_${PN}-electron-updater-unzip-pullstream-readable-stream-isarray = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream-readable-stream-string-decoder = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream-readable-stream = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream-setimmediate = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream-slice-stream-readable-stream-core-util-is = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream-slice-stream-readable-stream-inherits = "ISC"
		LICENSE_${PN}-electron-updater-unzip-pullstream-slice-stream-readable-stream-isarray = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream-slice-stream-readable-stream-string-decoder = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream-slice-stream-readable-stream = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream-slice-stream = "MIT"
		LICENSE_${PN}-electron-updater-unzip-pullstream = "MIT"
		LICENSE_${PN}-electron-updater-unzip-readable-stream-core-util-is = "MIT"
		LICENSE_${PN}-electron-updater-unzip-readable-stream-inherits = "ISC"
		LICENSE_${PN}-electron-updater-unzip-readable-stream-isarray = "MIT"
		LICENSE_${PN}-electron-updater-unzip-readable-stream-string-decoder = "MIT"
		LICENSE_${PN}-electron-updater-unzip-readable-stream = "MIT"
		LICENSE_${PN}-electron-updater-unzip-setimmediate = "MIT"
		LICENSE_${PN}-electron-updater-unzip = "MIT"
		LICENSE_${PN}-electron-updater = "MIT"
		LICENSE_${PN} = "Unknown MIT"

	$ bitbake electron-quick-start
	$ tree -L 6 tmp-glibc/work/i586-oe-linux/electron-quick-start/1.0.0-r0/packages-split/electron-quick-start
	tmp-glibc/work/i586-oe-linux/electron-quick-start/1.0.0-r0/packages-split/electron-quick-start
	└── usr
	    └── lib
		└── node_modules
		    └── electron-quick-start
			├── electron-quick-start-1.0.0.tgz
			├── index.html
			├── LICENSE.md
			├── main.js
			├── package.json
			├── README.md
			└── Squirrel.Mac
			    ├── Cartfile
			    ├── Cartfile.private
			    ├── Cartfile.resolved
			    ├── Carthage
			    ├── External
			    ├── LICENSE
			    ├── README.md
			    ├── script
			    ├── Squirrel
			    ├── SquirrelTests
			    ├── Squirrel.xcodeproj
			    ├── TestApplication
			    └── TestService

