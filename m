Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E84E6121F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 17:18:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s34HItQb023398
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Apr 2014 10:18:55 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 4 Apr 2014 10:18:55 -0700
Message-ID: <533EE97D.90207@windriver.com>
Date: Sat, 5 Apr 2014 01:18:53 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>,
	<openembedded-core@lists.openembedded.org>
References: <CALbNGRR3cOLUR+HBKkfSqLMRL75sn7uzEace23KJLYy43F1Vtg@mail.gmail.com>
	<CALbNGRShXafNdCYR62h3tpQ4RLTXyZTgvrs0xBOhsn_Z57=sdg@mail.gmail.com>
In-Reply-To: <CALbNGRShXafNdCYR62h3tpQ4RLTXyZTgvrs0xBOhsn_Z57=sdg@mail.gmail.com>
Subject: util-macros.do_package failed Re: Build failure
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
X-List-Received-Date: Fri, 04 Apr 2014 17:19:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


Hi Andreas,

I met the error on the master, we seldom met this error, but we did meet
it once in a while, I did several rough investigations, I think that the
problem is happened when etc/passwd is being created but is null before
write anything into it, and the util-macros.do_package runs right at the
same time, here is a hack way to reproduce it: (Use qemux86 as an example):

$ bitbake base-passwd

# Move the passwd file
$ mv tmp/sysroots/qemux86/etc/passwd tmp/sysroots/qemux86/etc/passwd.bak

# Create a passwd file which is null
$ touch tmp/sysroots/qemux86/etc/passwd

$ bitbake util-macros

Then we will see the errors.

The build is be OK if there is no tmp/sysroots/qemux86/etc/passwd, maybe
the pwd.getpwnam() reads the host's /etc/passwd when there is no
tmp/sysroots/qemux86/etc/passwd (not sure about this). but it would fail
if it exists and is null.

Maybe we can let the do_package depend on base-passwd:do_populate_sysroot
to fix the problem.

Will do more investigations tomorrow.

Night.

// Robert

On 11/14/2012 05:30 PM, Andreas Müller wrote:
> On Wed, Nov 14, 2012 at 10:15 AM, Andreas Müller
> <schnitzeltony@googlemail.com> wrote:
>> Ciao,
>>
>> with latest layer HEADS and build from scratch I get:
>>
>> KeyError: 'getpwnam(): name not found: root'
>>
>> ERROR: The stack trace of python calls that resulted in this
>> exception/failure was:
>> ERROR:   File "fixup_perms", line 227, in <module>
>> ERROR:
>> ERROR:   File "fixup_perms", line 155, in fixup_perms
>> ERROR:
>> ERROR:   File "fixup_perms", line 32, in __init__
>> ERROR:
>> ERROR:   File "fixup_perms", line 42, in _setdir
>> ERROR:
>> ERROR:   File "fixup_perms", line 66, in _procuid
>> ERROR:
>> ERROR: The code that was being executed was:
>> ERROR:      0223:                    each_file = os.path.join(root, f)
>> ERROR:      0224:                    fix_perms(each_file,
>> fs_perms_table[dir].fmode, fs_perms_table[dir].fuid,
>> fs_perms_table[dir].fgid, dir)
>> ERROR:      0225:
>> ERROR:      0226:
>> ERROR:  *** 0227:fixup_perms(d)
>> ERROR:      0228:
>> ERROR: [From file: 'fixup_perms', lineno: 227, function: <module>]
>> ERROR:      0151:    for path in target_path_vars:
>> ERROR:      0152:        dir = d.getVar(path, True) or ""
>> ERROR:      0153:        if dir == "":
>> ERROR:      0154:            continue
>> ERROR:  *** 0155:        fs_perms_table[dir] =
>> fs_perms_entry(bb.data.expand("%s 0755 root root false - - -" % (dir),
>> d))
>> ERROR:      0156:
>> ERROR:      0157:    # Now we actually load from the configuration files
>> ERROR:      0158:    for conf in get_fs_perms_list(d).split():
>> ERROR:      0159:        if os.path.exists(conf):
>> ERROR: [From file: 'fixup_perms', lineno: 155, function: fixup_perms]
>> ERROR: Function failed: fixup_perms
>> ERROR: Logfile of failure stored in:
>> /home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/util-macros-1_1.17-r0/temp/log.do_package.28653
>> ERROR: Task 4450
>> (/home/andreas/data/oe-core/sources/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb,
>> do_package) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 3985 tasks of which 397 didn't need to
>> be rerun and 1 failed.
>>
>> The only additional information I found up to now:
>>
>> * the code mentioned in error message is found in package.bbclass.
>> * in sysroot/etc/passwd there is a line 'root::0:0:root:/home/root:/bin/sh'
>>
>> Any ideas?
>>
> Additional info: After running
>
> bitbake -ccleansstate util-macros util-macros-native
>
> the build continues as without issues. Some missing dependency race?
>
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

