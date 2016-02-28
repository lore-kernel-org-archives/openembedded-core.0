Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 55419771C5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 12:20:16 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id 9so157908284iom.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 04:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=uqdzBtOW40B/sfy+QqoSca25iSwLdt6oJZJnhB8TGfk=;
	b=v+J5SqgzWMgN+NRNgv0u+DaF9HFY9ZFwHc2D15g0QVZigH05wf9kZro75DWCa50KIr
	nhnV7VlC6zDm3n+CY5vWzkw5W2QPj20YY37IZNrlTwuw7P5I4brAljRQt50BgTx0bru2
	lqPbJGCg0Z4SicCjJnfWso5wNETFwbkjlxDzGeYb3mLABsUygmeQEeRpw37N2yof/BSD
	VzUX+8TzqNogUQ0Qb2x7W2pWnNArNG6bcIM1+GUcgC8ZJ7qXEgRZ22LyNez2OJxKBan0
	leXrfjz1DCAJtGG9wW0SBDmvybeoy2ewI68TpQqDwBos2+2uu+kVL3b7d9araKf4ce2V
	Fflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=uqdzBtOW40B/sfy+QqoSca25iSwLdt6oJZJnhB8TGfk=;
	b=gg7yPg6F1+88lVclxP/8lBLkHbKbVRenrCvVtWmjI9MWO4HmJBnOvBbfUpATyd84DU
	im1ShFxkGqMktE1Z4+Sz4EgeAHEf9MXMhvXJ7lDXKzfVGMv8of4jgv91kbUn0gBg5a3l
	Ko9uZbM5C0DFcTnYYdUSj8gA8+93MVX9bb5PHzz05qdOMq6uAiD6t1FxSX+Wd5xU5g90
	A/7prHd7aegBy9XA04NW8wohzlAy6QwJUPNK3jNP+h0gaRiKgfG/IOMwEdIsyHl1Zm5X
	G3nVLbzHrTwCZaQWCatk/D+dP8fMiZJrYSwg8JFoAOx1xAkEnA3psQ1XT0odJ+eumW0P
	wQ+w==
X-Gm-Message-State: AG10YOSFnCIg83RTDkr/srQtBT1qM/VK0YuUofiW/U2fb003SnGTuDSj3NFSIfsigI0Oyl+unQyacNyohO6tsA==
MIME-Version: 1.0
X-Received: by 10.107.137.92 with SMTP id l89mr17083940iod.133.1456662016867; 
	Sun, 28 Feb 2016 04:20:16 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Sun, 28 Feb 2016 04:20:16 -0800 (PST)
In-Reply-To: <1456656801.11498.158.camel@linuxfoundation.org>
References: <1456656801.11498.158.camel@linuxfoundation.org>
Date: Sun, 28 Feb 2016 13:20:16 +0100
Message-ID: <CALbNGRTTAz=UfaXLEOjzdc5K_v7R3=OL8abzQQXq=97YkcofUA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: Improve configuration upgrade capabilities (support meta-yocto -> poky transition)
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
X-List-Received-Date: Sun, 28 Feb 2016 12:20:18 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 28, 2016 at 11:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Right now, only one configuration file can be processed (conf/bblayers.conf)
> and it can only have one version number. This is a cause of immense friction
> between OE-Core and Poky since if one needs a version change, it shouldn't
> be forced on the other.
>
> We'd like to rename the meta-yocto layer (within the meta-yocto repository)
> to meta-poky. To do this, we need to correct the bblayers.conf file and that
> means changing the sanity version. After the pain this caused the last time,
> Paul made me promise never to have them out of sync between OE-Core and Poky,
> equally, having every distro changing config update OE-Core isn't scalable
> either.
>
> This patch changes the sanity upgrade method to list a more generic format:
>
> <config file>:<current version variable name>:<required version variable name>:<upgrade function>
>
> This in theory allows us to support upgrades to any of the core
> configuration files, and allow layers to extend them as needed. Files
> with the same name can be handled in different layers by setting a unique
> version name variable in the file itself. The upgrade code is only called
> if the version variable is set.
>
> To allow us to make the poky name change and use a new configuration file
> name, one last version bump is included for poky to handle the transition.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 49693e7..a0553ee 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass

I think this breaks parsing. Have reverted it and can build again. I got
[superandy@localhost oe-core]$ bitbake -k xfce4-games-image
ERROR: Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:oecore_update_bblayers(d)
     0003:
File: '/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass',
lineno: 151, function: oecore_update_bblayers
     0147:            with open(bblayers_fn, "w") as f:
     0148:                f.write(''.join(lines))
     0149:            return
     0150:
 *** 0151:        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', "7")
     0152:        return
     0153:
     0154:    raise NotImplementedError(failmsg)
     0155:}
File: '/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass',
lineno: 24, function: sanity_conf_update
     0020:        if re.search(pattern, line)), (None, None))
     0021:
     0022:def sanity_conf_update(fn, lines, version_var_name, new_version):
     0023:    index, line = sanity_conf_find_line(version_var_name, lines)
 *** 0024:    lines[index] = '%s = "%d"\n' % (version_var_name, new_version)
     0025:    with open(fn, "w") as f:
     0026:        f.write(''.join(lines))
     0027:
     0028:# Functions added to this variable MUST throw a
NotImplementedError exception unless
Exception: TypeError: %d format: a number is required, not str

ERROR: Execution of event handler 'check_sanity_eventhandler' failed
Traceback (most recent call last):
  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 954, in check_sanity(sanity_data=<bb.data_smart.DataSmart object
at 0x7f932aa55890>):

    >    check_sanity_everybuild(status, sanity_data)

  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 768, in check_sanity_everybuild(status=<SanityStatus object at
0x7f932aca3810>, d=<bb.data_smart.DataSmart object at
0x7f932aa55890>):

    >    sanity_check_conffiles(status, d)

  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 548, in sanity_check_conffiles(status=<SanityStatus object at
0x7f932aca3810>, d=<bb.data_smart.DataSmart object at
0x7f932aa55890>):
                 try:
    >                bb.build.exec_func(func, d)
                 except NotImplementedError as e:
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/build.py",
line 227, in exec_func(func='oecore_update_bblayers',
d=<bb.data_smart.DataSmart object at 0x7f932aa55890>, dirs=None):
             if ispython:
    >            exec_func_python(func, d, runfile, cwd=adir)
             else:
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/build.py",
line 263, in exec_func_python(func='oecore_update_bblayers',
d=<bb.data_smart.DataSmart object at 0x7f932aa55890>,
runfile='/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/defaultpkgname/1.0-r0/temp/run.oecore_update_bblayers.4316',
cwd='/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/defaultpkgname/1.0-r0/defaultpkgname-1.0'):
         except:
    >        raise FuncFailed(func, None)
         finally:
FuncFailed: Function failed: oecore_update_bblayers

ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/command.py",
line 101, in runAsyncCommand
    self.cooker.updateCache()
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/cooker.py",
line 1538, in updateCache
    bb.event.fire(bb.event.SanityCheck(False), self.data)
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/event.py",
line 171, in fire
    fire_class_handlers(event, d)
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/event.py",
line 110, in fire_class_handlers
    execute_handler(name, handler, event, d)
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/event.py",
line 82, in execute_handler
    ret = handler(event)
  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 991, in check_sanity_eventhandler
    reparse = check_sanity(sanity_data)
  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 954, in check_sanity
    check_sanity_everybuild(status, sanity_data)
  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 768, in check_sanity_everybuild
    sanity_check_conffiles(status, d)
  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 548, in sanity_check_conffiles
    bb.build.exec_func(func, d)
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/build.py",
line 227, in exec_func
    exec_func_python(func, d, runfile, cwd=adir)
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/build.py",
line 263, in exec_func_python
    raise FuncFailed(func, None)
FuncFailed: Function failed: oecore_update_bblayers


Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
[superandy@localhost oe-core]$ bitbake -k xfce4-games-image
ERROR: Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:oecore_update_bblayers(d)
     0003:
File: '/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass',
lineno: 151, function: oecore_update_bblayers
     0147:            with open(bblayers_fn, "w") as f:
     0148:                f.write(''.join(lines))
     0149:            return
     0150:
 *** 0151:        sanity_conf_update(bblayers_fn, lines, 'LCONF_VERSION', "7")
     0152:        return
     0153:
     0154:    raise NotImplementedError(failmsg)
     0155:}
File: '/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass',
lineno: 24, function: sanity_conf_update
     0020:        if re.search(pattern, line)), (None, None))
     0021:
     0022:def sanity_conf_update(fn, lines, version_var_name, new_version):
     0023:    index, line = sanity_conf_find_line(version_var_name, lines)
 *** 0024:    lines[index] = '%s = "%d"\n' % (version_var_name, new_version)
     0025:    with open(fn, "w") as f:
     0026:        f.write(''.join(lines))
     0027:
     0028:# Functions added to this variable MUST throw a
NotImplementedError exception unless
Exception: TypeError: %d format: a number is required, not str

ERROR: Execution of event handler 'check_sanity_eventhandler' failed
Traceback (most recent call last):
  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 954, in check_sanity(sanity_data=<bb.data_smart.DataSmart object
at 0x7f2bb26f3cd0>):

    >    check_sanity_everybuild(status, sanity_data)

  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 768, in check_sanity_everybuild(status=<SanityStatus object at
0x7f2bb26f31d0>, d=<bb.data_smart.DataSmart object at
0x7f2bb26f3cd0>):

    >    sanity_check_conffiles(status, d)

  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 548, in sanity_check_conffiles(status=<SanityStatus object at
0x7f2bb26f31d0>, d=<bb.data_smart.DataSmart object at
0x7f2bb26f3cd0>):
                 try:
    >                bb.build.exec_func(func, d)
                 except NotImplementedError as e:
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/build.py",
line 227, in exec_func(func='oecore_update_bblayers',
d=<bb.data_smart.DataSmart object at 0x7f2bb26f3cd0>, dirs=None):
             if ispython:
    >            exec_func_python(func, d, runfile, cwd=adir)
             else:
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/build.py",
line 263, in exec_func_python(func='oecore_update_bblayers',
d=<bb.data_smart.DataSmart object at 0x7f2bb26f3cd0>,
runfile='/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/defaultpkgname/1.0-r0/temp/run.oecore_update_bblayers.4459',
cwd='/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/defaultpkgname/1.0-r0/defaultpkgname-1.0'):
         except:
    >        raise FuncFailed(func, None)
         finally:
FuncFailed: Function failed: oecore_update_bblayers

ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/command.py",
line 101, in runAsyncCommand
    self.cooker.updateCache()
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/cooker.py",
line 1538, in updateCache
    bb.event.fire(bb.event.SanityCheck(False), self.data)
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/event.py",
line 171, in fire
    fire_class_handlers(event, d)
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/event.py",
line 110, in fire_class_handlers
    execute_handler(name, handler, event, d)
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/event.py",
line 82, in execute_handler
    ret = handler(event)
  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 991, in check_sanity_eventhandler
    reparse = check_sanity(sanity_data)
  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 954, in check_sanity
    check_sanity_everybuild(status, sanity_data)
  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 768, in check_sanity_everybuild
    sanity_check_conffiles(status, d)
  File "/home/superandy/data/oe-core/sources/openembedded-core/meta/classes/sanity.bbclass",
line 548, in sanity_check_conffiles
    bb.build.exec_func(func, d)
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/build.py",
line 227, in exec_func
    exec_func_python(func, d, runfile, cwd=adir)
  File "/home/superandy/data/oe-core/sources/bitbake/lib/bb/build.py",
line 263, in exec_func_python
    raise FuncFailed(func, None)
FuncFailed: Function failed: oecore_update_bblayers

