Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91C5C745BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 00:49:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4N0n0X3023314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 May 2018 17:49:00 -0700 (PDT)
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 May 2018 17:49:00 -0700
To: Andre McCurdy <armccurdy@gmail.com>, akuster808 <akuster808@gmail.com>
References: <1526827795-10448-1-git-send-email-akuster@mvista.com>
	<CAJ86T=XKQdbiH3ND0Smmpne7FX=PqEtox9GJrJJi9WfiRZcOBQ@mail.gmail.com>
	<759e0c6d-d9cc-4ec2-2e56-871b18ae9313@gmail.com>
	<CAJ86T=UX195m2f_aSiR4uM7G++1rjLKj+_vvtERsKCLH7uMDOg@mail.gmail.com>
	<CAJ86T=WVzwj5j+W3GFTtW9akh3M=SEH5HTLVrBt_mkdFV0XCmA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b45998ef-41af-b965-c64a-b10a12f5ecfd@windriver.com>
Date: Tue, 22 May 2018 20:48:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WVzwj5j+W3GFTtW9akh3M=SEH5HTLVrBt_mkdFV0XCmA@mail.gmail.com>
X-Originating-IP: [172.25.44.2]
Cc: akuster <akuster@mvista.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] busybox: update to 1.28.3
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
X-List-Received-Date: Wed, 23 May 2018 00:49:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/22/2018 07:06 PM, Andre McCurdy wrote:
...
> Building before and after Armin's patch and then diffing .config files
> in each build directory gives:
> 

I didn't know what all of these configs were so I've
listed them below and stated a straw-man opinion as
to whether to keep them or not.

> Old 1.27.2 specific config options removed:
> 
> -CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
> -CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
> -CONFIG_FEATURE_ENV_LONG_OPTIONS=y
> -CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
> -CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y

I'm okay with following upstream busybox wrt long options so
we can drop this.

> 
> New 1.28.3 specific options added:
> 
> +CONFIG_BB_ARCH=y

Adds 'arch' which is the same output as 'uname -m' but
I always use arch and didn't know off-hand that uname -m was the same.

Keep it.

> +CONFIG_FEATURE_CATN=y
   This adds an option to cat:
    -n numbers all output lines while -b numbers nonempty output lines.
   The commit that added this feature says:
      a2bdc5c55 cat: allow compiling out -n and -b
   so since previously the feature was always available,

I'm okay with keeping it.

> +CONFIG_FEATURE_SH_READ_FRAC=y

   Enables a fractional second read timeout for the shell builtin.
   bool "read -t N.NNN support (+110 bytes)"
   Enable support for fractional second timeout in read builtin.

Potentially useful, keep it.

> +CONFIG_FEATURE_SWAPONOFF_LABEL=y

   This allows for specifying a device by label or uuid, rather than by
   name. This feature utilizes the same functionality as blkid/findfs.

Useful. Keep it.

> +CONFIG_FEATURE_VOLUMEID_MINIX=y

I don't know of a case where this would be generally useful.

Omit.

> +CONFIG_FEATURE_XARGS_SUPPORT_ARGS_FILE=y
     xargs: support -a FILE

     The GNU-specific option -a lets xargs read the arguments from a file
     rather than from stdin.

     This is particularly convenient when debugging in gdb interactively,
     and it might be of more general use.

Huh... what?
Digging through the findutils repo, I see that there's a better 
explaination in the findutils/NEWS file from 2004(!):

*** xargs can now read a list of arguments from a named file, allowing
     the invoked program to use the same stdin as xargs started with
     (for example ``xargs --arg-file=todo emacs'').

Keep it (I suppose).

> +CONFIG_FEATURE_XARGS_SUPPORT_PARALLEL=y

From: https://bugs.busybox.net/show_bug.cgi?id=9511
Example:
find samplegz | xargs -n1 -P4 sh parse.sh

Costs 241 bytes.

Keep it.

The next group are described below but
I've put my conclusions after each config.

> +CONFIG_HEXEDIT=y
Drop it.

> +CONFIG_NUKE=y
Drop it.

> +CONFIG_RESUME=y
Drop it -- maybe?

> +CONFIG_RUN_INIT=y
Drop it.

> +CONFIG_SETFATTR=y
Drop it.

> 
> So new applets hexedit, nuke, etc, are going to sneak in to our builds
> unless we refresh our defconfig to disable them.
> 


Here is the rough estimate of the new applet sizes:

$ git show 38da4c4420ea6d7b3cf120c0902458e7d8256560 | \
    grep "^+//config:.*bool"
+//config:	bool "nuke (2.4 kb)"
+//config:	bool "resume (3.3 kb)"
+//config:	bool "run-init (7.5 kb)"
+//config:	bool "hexedit (20 kb)"
+//config:	bool "setfattr (3.6 kb)"


and the commit that added most of the applets that includes
a brief explanation of the applet's function:

commit ab77e81a8527fa11a4f9392d97c2da037d6f4f98
Author: Denys Vlasenko <vda.linux@googlemail.com>
Date:   Fri Aug 18 19:15:29 2017 +0200

     klibc-utils: new applets: resume, nuke, minips

     minips is a pure alias to ps,
     just in case someone needs 100% klibc-utils compat.

     nuke is a primitive version of "rm -rf" without
     options and error checks. ~30 bytes.

     resume is a tool for initramfs which resumes from
     a given block device.

     function                                         old     new   delta
     resume_main                                        -     582    +582
     packed_usage                                   31640   31712     +72
     nuke_main                                          -      28     +28
     xstrtoull                                          -      24     +24
     applet_names                                    2646    2665     +19
     applet_main                                     1532    1544     +12
     applet_suid                                       96      97      +1
     applet_install_loc                               192     193      +1
     applet_flags                                      96      97      +1
 
------------------------------------------------------------------------
     (add/remove: 5/0 grow/shrink: 6/0 up/down: 740/0)   Total: 740 bytes

     Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>



While these are useful utilities,
I don't see a need for any of the new applets in the oe-core defconfig.

Armin,
If no one objects to my suggestions, please change the defconfig
in the next update or ping me and I'll do it.

-- 
# Randy MacLeod
# Wind River Linux

