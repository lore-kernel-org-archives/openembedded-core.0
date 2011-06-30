Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcQRS-0004Ll-Ri for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:14:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UNArHD002500;
	Fri, 1 Jul 2011 00:10:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00360-02; Fri,  1 Jul 2011 00:10:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UNAimG002476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 1 Jul 2011 00:10:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1db24b664bf6fb292d8a84dd6398e330305f18fd.1309473383.git.scott.a.garman@intel.com>
References: <cover.1309473383.git.scott.a.garman@intel.com>
	<1db24b664bf6fb292d8a84dd6398e330305f18fd.1309473383.git.scott.a.garman@intel.com>
Date: Fri, 01 Jul 2011 00:10:25 +0100
Message-ID: <1309475425.20015.493.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 2/3] useradd.bbclass: new class for managing user/group permissions
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
X-List-Received-Date: Thu, 30 Jun 2011 23:14:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Scott,

This is looking good, thanks for the changes! I just have some cosmetic
things to tweak before it goes in.

On Thu, 2011-06-30 at 15:39 -0700, Scott Garman wrote:
[...]
> +# Recipe parse-time sanity checks
> +def update_useradd_after_parse(d):
> +	if bb.data.getVar('USERADD_PACKAGES', d) == None:

if not d.getVar('USERADD_PACKAGES', False):

> +		if bb.data.getVar('USERADD_PARAM', d) == None and bb.data.getVar('GROUPADD_PARAM', d) == None:

if not d.getVar('USERADD_PARAM', False) and not d.getVar('GROUPADD_PARAM', False):

> +			raise bb.build.FuncFailed, "%s inherits useradd but doesn't set USERADD_PARAM or GROUPADD_PARAM" % bb.data.getVar('FILE', d)
> +
> +python __anonymous() {
> +	update_useradd_after_parse(d)
> +}
> +
> +# Return a single [GROUP|USER]ADD_PARAM formatted string which includes the
> +# [group|user]add parameters for all packages in this recipe
> +def get_all_cmd_params(d, cmd_type):
> +	import string
> +	
> +	localdata = bb.data.createCopy(d)

No need to use createCopy here since you don't change OVERRIDES or write
to the datastore at all. Just use d directly.

> +	param_type = cmd_type.upper() + "ADD_PARAM_%s"
> +	params = []
> +
> +	pkgs = localdata.getVar('USERADD_PACKAGES', True)
> +	if not pkgs:
> +		pkgs = localdata.getVar('USERADDPN', True)
> +		packages = (localdata.getVar('PACKAGES', True) or "").split()
> +		if packages and pkgs not in packages:
> +			pkgs = packages[0]
> +
> +	for pkg in pkgs.split():
> +		param = localdata.getVar(param_type % pkg, True)
> +		if param:
> +			params.append(param)
> +
> +	return string.join(params, "; ")
> +
> +# Adds the preinst script into generated packages
> +fakeroot python populate_packages_prepend () {
> +	def update_useradd_package(pkg):
> +		bb.debug(1, 'adding user/group calls to preinst for %s' % pkg)
> +		localdata = bb.data.createCopy(d)
> +		overrides = localdata.getVar("OVERRIDES", True)
> +		bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
> +		bb.data.update_data(localdata)
> +
> +		"""
> +		useradd preinst is appended here because pkg_preinst may be
> +		required to execute on the target. Not doing so may cause
> +		useradd preinst to be invoked twice, causing unwanted warnings.
> +		"""

You can just do:

preinst = d.getVar('pkg_preinst_%s' % pkg, True) or d.getVar('pkg_preinst', True)

and ditch all the createCopy/OVERRIDES stuff.

> +		preinst = localdata.getVar('pkg_preinst', True)
> +		if not preinst:
> +			preinst = '#!/bin/sh\n'
> +		preinst += localdata.getVar('useradd_preinst', True)
> +		bb.data.setVar('pkg_preinst_%s' % pkg, preinst, d)
> +
> +	# We add the user/group calls to all packages to allow any package
> +	# to contain files owned by the users/groups defined in the recipe.
> +	# The user/group addition code is careful not to create duplicate
> +	# entries, so this is safe.
> +	pkgs = d.getVar('USERADD_PACKAGES', True)
> +	if pkgs == None:

if not pkgs:

> +		pkgs = d.getVar('USERADDPN', True)
> +		packages = (d.getVar('PACKAGES', True) or "").split()
> +		if not pkgs in packages and packages != []:

if packages and pkgs not in packages:

> +			pkgs = packages[0]
> +	for pkg in pkgs.split():
> +		update_useradd_package(pkg)
> +}

Cheers,

Richard



