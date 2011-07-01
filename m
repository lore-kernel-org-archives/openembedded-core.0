Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QcVXq-0005L7-Py
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 06:41:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Jun 2011 21:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,456,1304319600"; d="scan'208";a="21298053"
Received: from unknown (HELO [10.255.13.252]) ([10.255.13.252])
	by azsmga001.ch.intel.com with ESMTP; 30 Jun 2011 21:36:44 -0700
Message-ID: <4E0D4EDC.5080403@intel.com>
Date: Thu, 30 Jun 2011 21:36:44 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1309473383.git.scott.a.garman@intel.com>	
	<1db24b664bf6fb292d8a84dd6398e330305f18fd.1309473383.git.scott.a.garman@intel.com>
	<1309475425.20015.493.camel@rex>
In-Reply-To: <1309475425.20015.493.camel@rex>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 01 Jul 2011 04:41:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/30/2011 04:10 PM, Richard Purdie wrote:
> Hi Scott,
>
> This is looking good, thanks for the changes! I just have some cosmetic
> things to tweak before it goes in.

Ok, respinning now based on your requests.

BTW, some parts of useradd.bbclass were derived from 
update-rc.d.bbclass. So it sounds like that class could use a refresh in 
light of the preferred style you've been showing me. I'd be happy to do 
this as a background task over the next week if it would be useful.

Scott

>
> On Thu, 2011-06-30 at 15:39 -0700, Scott Garman wrote:
> [...]
>> +# Recipe parse-time sanity checks
>> +def update_useradd_after_parse(d):
>> +	if bb.data.getVar('USERADD_PACKAGES', d) == None:
>
> if not d.getVar('USERADD_PACKAGES', False):
>
>> +		if bb.data.getVar('USERADD_PARAM', d) == None and bb.data.getVar('GROUPADD_PARAM', d) == None:
>
> if not d.getVar('USERADD_PARAM', False) and not d.getVar('GROUPADD_PARAM', False):
>
>> +			raise bb.build.FuncFailed, "%s inherits useradd but doesn't set USERADD_PARAM or GROUPADD_PARAM" % bb.data.getVar('FILE', d)
>> +
>> +python __anonymous() {
>> +	update_useradd_after_parse(d)
>> +}
>> +
>> +# Return a single [GROUP|USER]ADD_PARAM formatted string which includes the
>> +# [group|user]add parameters for all packages in this recipe
>> +def get_all_cmd_params(d, cmd_type):
>> +	import string
>> +	
>> +	localdata = bb.data.createCopy(d)
>
> No need to use createCopy here since you don't change OVERRIDES or write
> to the datastore at all. Just use d directly.
>
>> +	param_type = cmd_type.upper() + "ADD_PARAM_%s"
>> +	params = []
>> +
>> +	pkgs = localdata.getVar('USERADD_PACKAGES', True)
>> +	if not pkgs:
>> +		pkgs = localdata.getVar('USERADDPN', True)
>> +		packages = (localdata.getVar('PACKAGES', True) or "").split()
>> +		if packages and pkgs not in packages:
>> +			pkgs = packages[0]
>> +
>> +	for pkg in pkgs.split():
>> +		param = localdata.getVar(param_type % pkg, True)
>> +		if param:
>> +			params.append(param)
>> +
>> +	return string.join(params, "; ")
>> +
>> +# Adds the preinst script into generated packages
>> +fakeroot python populate_packages_prepend () {
>> +	def update_useradd_package(pkg):
>> +		bb.debug(1, 'adding user/group calls to preinst for %s' % pkg)
>> +		localdata = bb.data.createCopy(d)
>> +		overrides = localdata.getVar("OVERRIDES", True)
>> +		bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
>> +		bb.data.update_data(localdata)
>> +
>> +		"""
>> +		useradd preinst is appended here because pkg_preinst may be
>> +		required to execute on the target. Not doing so may cause
>> +		useradd preinst to be invoked twice, causing unwanted warnings.
>> +		"""
>
> You can just do:
>
> preinst = d.getVar('pkg_preinst_%s' % pkg, True) or d.getVar('pkg_preinst', True)
>
> and ditch all the createCopy/OVERRIDES stuff.
>
>> +		preinst = localdata.getVar('pkg_preinst', True)
>> +		if not preinst:
>> +			preinst = '#!/bin/sh\n'
>> +		preinst += localdata.getVar('useradd_preinst', True)
>> +		bb.data.setVar('pkg_preinst_%s' % pkg, preinst, d)
>> +
>> +	# We add the user/group calls to all packages to allow any package
>> +	# to contain files owned by the users/groups defined in the recipe.
>> +	# The user/group addition code is careful not to create duplicate
>> +	# entries, so this is safe.
>> +	pkgs = d.getVar('USERADD_PACKAGES', True)
>> +	if pkgs == None:
>
> if not pkgs:
>
>> +		pkgs = d.getVar('USERADDPN', True)
>> +		packages = (d.getVar('PACKAGES', True) or "").split()
>> +		if not pkgs in packages and packages != []:
>
> if packages and pkgs not in packages:
>
>> +			pkgs = packages[0]
>> +	for pkg in pkgs.split():
>> +		update_useradd_package(pkg)
>> +}
>
> Cheers,
>
> Richard
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


