Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 099027E840
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 15:26:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	x5HFQjL2017278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 17 Jun 2019 16:26:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1560785207; bh=EFjcIbQYiAInFjYEdFWiQ/n5qDvhjr4uYkybJKiPEcs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=u5S4IrXGUeFNVjbnfUEE0oPSsxsHE/p2Ti5hhmOGXGv6EWWUO40JV2OeCIFex0p81
	ONRvrbJIdoBlL3SWwC1u/4G5ZF6uJePSskILCIoq+yJ1jx6hiCRO8cOiyoz4HmN2QS
	kKyzwxfhbF9+xnM4G5XbOZhW/cRqIoadTNEXM3XWza6W5Mmh8sKHgEBGrRPvUyVQ3q
	tXGsJOzj7wbfHF5mNF59HfsPY1g7MCTUsh5XTcEIG7ik/h5lJgOKQKEOXrjed+forP
	VS3dyxl3wmcX7dB60HVG0JzobeCdRT/HXtWXlTXzI8SeSXZyHuNQaAZTzFSCv49gKH
	/BhPAi7SsvpIQ==
Message-ID: <591c1c8752c4c0526d18d5cd6596a35bc41c6645.camel@rpsys.net>
From: Richard Purdie <rpurdie@rpsys.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Eggleton, Paul"
	<paul.eggleton@intel.com>
Date: Mon, 17 Jun 2019 16:26:45 +0100
In-Reply-To: <CANNYZj_vg_jzcMRhfQ35C_2kDnyH-yxVj52pKk2WpfZxfo5iOw@mail.gmail.com>
References: <CANNYZj9rVD4cZ-AN7rvF=0fuc4d99brU_Tt_wQeRMGm=L83M2w@mail.gmail.com>
	<201906171422.x5HEMKtf012735@dan.rpsys.net>
	<CANNYZj_vg_jzcMRhfQ35C_2kDnyH-yxVj52pKk2WpfZxfo5iOw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.3 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] lttng-ust: upgrading to 2.10.4 FAILED
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
X-List-Received-Date: Mon, 17 Jun 2019 15:26:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-17 at 16:51 +0200, Alexander Kanavin wrote:
> On Mon, 17 Jun 2019 at 16:22, Richard Purdie <rpurdie@rpsys.net>
> wrote:
> > >Yes, it's another one of those recipes which includes a 
> > >different recipe with its version number (which breaks when 
> > >devtool upgrades one but not the other).
> > >
> > >I have a fix queued:
> > >
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=00eb5952479370553756dface4cf6c81f51b9e8f
> > 
> > I think what worries me more is the build isn't reset so this is
> > reported against lttng-ust. I guess its because its testing the
> > changes together?
> > 
> > Perhaps it should parse test them individually?
> > 
> 
> The build isn't reset because 'devtool upgrade libnewt-python' fails
> mid-way and leaves the workspace in an inconsistent state
> (workspace/recipes/ has content but workspace/append does not), so
> 'devtool reset' isn't able to revert that state.
> 
> AUH could probably clean up the files in this situation, but
> currently doesn't - it just assumes that devtool is able to clean up
> after itself in any situation (which seems to not be the case,
> sadly).
> 
> Specific traceback from devtool:
> 
> Traceback (most recent call last):
>   File "/home/alexander/development/poky/scripts/devtool", line 334,
> in <module>
>     ret = main()
>   File "/home/alexander/development/poky/scripts/devtool", line 321,
> in main
>     ret = args.func(args, config, basepath, workspace)
>   File
> "/home/alexander/development/poky/scripts/lib/devtool/upgrade.py",
> line 551, in upgrade
>     rf, copied = _create_new_recipe(args.version, md5, sha256,
> args.srcrev, srcbranch, srcsubdir1, srcsubdir2,
> config.workspace_path, tinfoil, rd, license_diff, new_licenses)
>   File
> "/home/alexander/development/poky/scripts/lib/devtool/upgrade.py",
> line 419, in _create_new_recipe
>     rd = tinfoil.parse_recipe_file(fullpath, False)
>   File "/home/alexander/development/poky/bitbake/lib/bb/tinfoil.py",
> line 641, in parse_recipe_file
>     dscon = self.run_command('parseRecipeFile', fn, appends,
> appendlist)
>   File "/home/alexander/development/poky/bitbake/lib/bb/tinfoil.py",
> line 466, in run_command
>     raise TinfoilCommandFailed(result[1])
> bb.tinfoil.TinfoilCommandFailed: Traceback (most recent call last):
>   File
> "/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/ConfH
> andler.py", line 94, in include_single_file
>     bb.parse.handle(fn, data, True)
>   File
> "/home/alexander/development/poky/bitbake/lib/bb/parse/__init__.py",
> line 107, in handle
>     return h['handle'](fn, data, include)
>   File
> "/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/BBHan
> dler.py", line 120, in handle
>     abs_fn = resolve_file(fn, d)
>   File
> "/home/alexander/development/poky/bitbake/lib/bb/parse/__init__.py",
> line 125, in resolve_file
>     raise IOError(errno.ENOENT, "file %s not found in %s" % (fn,
> bbpath))
> FileNotFoundError: [Errno 2] file recipes-
> extended/newt/libnewt_0.52.21.bb not found in
> /home/alexander/development/poky/build/workspace:/home/alexander/deve
> lopment/poky/meta-
> poky:/home/alexander/development/poky/build:/home/alexander/developme
> nt/poky/meta:/home/alexander/development/poky/meta-yocto-
> bsp:/home/alexander/development/meta-mingw
> 
> During handling of the above exception, another exception occurred:
> 
> Traceback (most recent call last):
>   File "/home/alexander/development/poky/bitbake/lib/bb/command.py",
> line 74, in runCommand
>     result = command_method(self, commandline)
>   File "/home/alexander/development/poky/bitbake/lib/bb/command.py",
> line 562, in parseRecipeFile
>     envdata = parser.loadDataFull(fn, appendfiles)
>   File "/home/alexander/development/poky/bitbake/lib/bb/cache.py",
> line 327, in loadDataFull
>     bb_data = self.load_bbfile(virtualfn, appends, virtonly=True)
>   File "/home/alexander/development/poky/bitbake/lib/bb/cache.py",
> line 340, in load_bbfile
>     datastores = parse_recipe(bb_data, bbfile, appends, mc)
>   File "/home/alexander/development/poky/bitbake/lib/bb/cache.py",
> line 303, in parse_recipe
>     bb_data = bb.parse.handle(bbfile, bb_data)
>   File
> "/home/alexander/development/poky/bitbake/lib/bb/parse/__init__.py",
> line 107, in handle
>     return h['handle'](fn, data, include)
>   File
> "/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/BBHan
> dler.py", line 130, in handle
>     statements.eval(d)
>   File
> "/home/alexander/development/poky/bitbake/lib/bb/parse/ast.py", line
> 23, in eval
>     statement.eval(data)
>   File
> "/home/alexander/development/poky/bitbake/lib/bb/parse/ast.py", line
> 45, in eval
>     bb.parse.ConfHandler.include(self.filename, s, self.lineno, data,
> "include required")
>   File
> "/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/ConfH
> andler.py", line 71, in include
>     include_single_file(parentfn, fn, lineno, data, error_out)
>   File
> "/home/alexander/development/poky/bitbake/lib/bb/parse/parse_py/ConfH
> andler.py", line 98, in include_single_file
>     raise ParseError("Could not %s file %s" % (error_out, fn),
> parentfn, lineno)
> bb.parse.ParseError: ParseError at
> /home/alexander/development/poky/build/workspace/recipes/libnewt-
> python/libnewt-python_0.52.21.bb:1: Could not include required file
> recipes-extended/newt/libnewt_0.52.21.bb

I think that perhaps:

a) we should have a bug for this as devtool shouldn't be giving
tracebacks?
b) we could add some kind of "reset" command that AUH could run between
builds which would clean things up?

Cheers,

Richard


