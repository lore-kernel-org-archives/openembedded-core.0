Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A9B366B1EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 20:40:08 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Jul 2013 13:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,789,1367996400"; d="scan'208";a="275944489"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Jul 2013 13:40:08 -0700
Message-ID: <51F97628.9040801@linux.intel.com>
Date: Wed, 31 Jul 2013 13:40:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
In-Reply-To: <45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Wed, 31 Jul 2013 20:40:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2013 01:16 AM, Khem Raj wrote:
>
> On Jun 29, 2013, at 8:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> On Sat, Jun 29, 2013 at 07:11:35AM -0700, Khem Raj wrote:
>>>
>>> On Jun 28, 2013, at 10:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>>> On Fri, Jun 28, 2013 at 03:03:39PM -0700, Khem Raj wrote:
>>>>>
>>>>> generate-manifest-3.3.py: Add script to generate python 3.3 manifests
>>>>> python-3.3-manifest: Add python3 manifest file
>>>>
>>>>> classes: Add distutils for python3
>>>>> setuptools.bbclass: Use python-distribute instead of
>>>>>    python-setuptools
>>>>> distutils3.bbclass: Port the distutils class fix to handle filenames
>>>>>    with spaces
>>>>> setuptools3.bbclass: Remove useless multiline comment
>>>>> distutils: Introduce PYTHON_ABI variable
>>>>> distutils3: Do build_ext as separate step during compile
>>>>
>>>
>>>> I think these 2 groups could be squashed together for easier review, but
>>>
>>> do you mean create just two patches out of those ?
>>
>> Yes
>>
>>>> otherwise great work, thanks for doing it!
>>>>
>>>> I'll add them to jenkins a bit later when I get some better build that
>>>> what we have now.
>>>
>>> They were added in order that the build keeps working with every commit for helping bisects on tree later
>>
>> I meant that e.g.
>>   classes: Add distutils for python3
>> introduces setuptools3.bbclass and
>>   setuptools3.bbclass: Remove useless multiline comment
>> just 3 commits later fixes that, the same with the left-over commit I
>> mentined in other thread which was also resolved by some follow up
>> commit, with all new .bbclasses together I would read them just once.
>>
>
> Thanks Martin and Paul for reviewing and trying out the patches
> Finally I have now addressed all the comments/feedback that was provided for this patch set.
> The pull tree is now updated to latest.
>
> Take a look and install if its ok
>

Tried to build this set and received failures in python3-jinja 
(do_sanitize) and python3-distribute (do_compile)


> DEBUG: Executing shell function do_sanitize
> /srv/ssd/sgw/builds/world/tmp/work/x86_64-poky-linux/python3-jinja/1.2-r1/temp/run.do_sanitize.22474: line 85: /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/python3-native/python3: No such file or directory
> ERROR: Function failed: do_sanitize (log file is located at /srv/ssd/sgw/builds/world/tmp/work/x86_64-poky-linux/python3-jinja/1.2-r1/temp/log.do_sanitize.22474)


> Traceback (most recent call last):
>   File "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/distutils/sysconfig.py", line 447, in _init_posix
>     parse_makefile(filename, g)
>   File "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/distutils/sysconfig.py", line 316, in parse_makefile
>     fp = TextFile(fn, strip_comments=1, skip_blanks=1, join_lines=1, errors="surrogateescape")
>   File "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/distutils/text_file.py", line 100, in __init__
>     self.open(filename)
>   File "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/distutils/text_file.py", line 115, in open
>     self.file = io.open(self.filename, 'r', errors=self.errors)
> FileNotFoundError: [Errno 2] No such file or directory: '/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python3.3/config-3.3m/Makefile'
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>   File "setup.py", line 250, in <module>
>     scripts = scripts,
>   File "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/distutils/core.py", line 134, in setup
>     ok = dist.parse_command_line()
>   File "/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/python3-distribute-native/0.6.32-ml5/distribute-0.6.32/build/src/setuptools/dist.py", line 232, in parse_command_line
>     result = _Distribution.parse_command_line(self)
>   File "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/distutils/dist.py", line 445, in parse_command_line
>     args = self._parse_command_opts(parser, args)
>   File "/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/python3-distribute-native/0.6.32-ml5/distribute-0.6.32/build/src/setuptools/dist.py", line 558, in _parse_command_opts
>     nargs = _Distribution._parse_command_opts(self, parser, args)
>   File "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/distutils/dist.py", line 501, in _parse_command_opts
>     cmd_class = self.get_command_class(command)
>   File "/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/python3-distribute-native/0.6.32-ml5/distribute-0.6.32/build/src/setuptools/dist.py", line 363, in get_command_class
>     self.cmdclass[command] = cmdclass = ep.load()
>   File "/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/python3-distribute-native/0.6.32-ml5/distribute-0.6.32/build/src/pkg_resources.py", line 2018, in load
>     entry = __import__(self.module_name, globals(),globals(), ['__name__'])
>   File "/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/python3-distribute-native/0.6.32-ml5/distribute-0.6.32/build/src/setuptools/command/build_ext.py", line 13, in <module>
>     get_config_var("LDSHARED")  # make sure _config_vars is initialized
>   File "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/distutils/sysconfig.py", line 600, in get_config_var
>     return get_config_vars().get(name)
>   File "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/distutils/sysconfig.py", line 540, in get_config_vars
>     func()
>   File "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/python3.3/distutils/sysconfig.py", line 453, in _init_posix
>     raise DistutilsPlatformError(my_msg)
> distutils.errors.DistutilsPlatformError: invalid Python installation: unable to open /srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python3.3/config-3.3m/Makefile (No such file or directory)
> ERROR: python3 setup.py build_ext execution failed.
> ERROR: Function failed: do_compile (log file is located at /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/python3-distribute-native/0.6.32-ml5/temp/log.do_compile.8665)


I am going to hold this patch set out of Master_under_Test for now.


Sau!

> -Khem
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

