Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1C366FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:31:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3JCVJrx026091
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Apr 2016 05:31:19 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Apr 2016 05:31:19 -0700
To: Hongxu Jia <hongxu.jia@windriver.com>, =?UTF-8?Q?Andreas_M=c3=bcller?=
	<schnitzeltony@googlemail.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
	<5714DC35.7040206@windriver.com>
	<CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
	<CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
	<5715DF5B.5030406@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <57162516.7000009@windriver.com>
Date: Tue, 19 Apr 2016 07:31:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <5715DF5B.5030406@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Tue, 19 Apr 2016 12:31:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 4/19/16 2:33 AM, Hongxu Jia wrote:
> Hi all,
> 
> With some investigation, there is an example to explain how to do remote debug.
> 
> Also file [YOCTO #9481] for document.
> 
> Hi Andreas,
> 
> Would you please have a look the example, to see if it could fit your case.
> 
> Example:
> 
> 1. Build a image with gdbserver and gzip installed. The gzip
>    is the debug binary. Append the following to local.conf
> ...
> IMAGE_INSTALL_append = " gdbserver gzip"
> ...
> 
> $ bitbake core-image-sato
> 
> 2. Build gdb-cross for remote debug on host
> 
> $ bitbake gdb-cross-i586
> 
> 3. start qemu
> 
> $ runqemu qemux86 core-image-sato
> 
> 4. On host side, create symlink /usr/src/debug to
>    ${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS} which the
>    location of sources is /usr/src/debug.
> 
> $ ln -snf /TOPDIR/tmp/work/i586-poky-linux /usr/src/debug

This is incorrect.  On the host you use the combination of:

(gdb) set sysroot <your debug capable fs path>
(gdb) set substitute-path /usr/src/debug <your debug capable fs path>/usr/src/debug

> 5. On target side, ipaddr is 128.224.163.187,
>    run gdbserver to debug "gzip -h"
> 
> root@qemux86-64:~# gdbserver localhost:1024 gzip -h
> Process gzip created; pid = 530
> Listening on port 1024
> 
> 6. On host side, enter gzip's devshell
> $ bitbake -cdevshell gzip
> 
> 7. On host side, run gdb-cross to remote debug gzip
> 
> gzip-1.6# i586-poky-linux-gdb ../build/gzip
> 
> 8. Use path ${STAGING_DIR_HOST} as the system root for
>    the program being debugged. Any absolute shared
>    library paths will be prefixed with path;
> 
> (gdb) set sysroot /TOPDIR/tmp/sysroots/qemux86
> 
> 
> 9. Start remote target, set break point at help()
> 
> (gdb) target remote 128.224.163.187:1024
> (gdb) break gzip.c:325
> (gdb) info break
> Num     Type           Disp Enb Address            What
> 1       breakpoint     keep y   0x0000000000401ec1 in main at
> /usr/src/debug/gzip/1.6-r0/gzip-1.6/gzip.c:325
> (gdb) c
> Continuing.
> 
> Breakpoint 1, main (argc=2, argv=0x7fffffffeca8) at
> /usr/src/debug/gzip/1.6-r0/gzip-1.6/gzip.c:465
> 465                 help(); do_exit(OK); break;
> (gdb) list
> 460             case 'd':
> 461                 decompress = 1; break;
> 462             case 'f':
> 463                 force++; break;
> 464             case 'h': case 'H':
> 465                 help(); do_exit(OK); break;
> 466             case 'k':
> 467                 keep = 1; break;
> 468             case 'l':
> 469                 list = decompress = to_stdout = 1; break;
> (gdb) c
> Continuing.
> [Inferior 1 (process 1246) exited normally]
> 
> 
> 10. On target side, get output of "gzip -h"
> [snip]
> Remote debugging from host 128.224.153.74
> Usage: gzip [OPTION]... [FILE]...
> Compress or uncompress FILEs (by default, compress FILES in-place).
> 
> Mandatory arguments to long options are mandatory for short options too.
> 
>   -c, --stdout      write on standard output, keep original files unchanged
>   -d, --decompress  decompress
>   -f, --force       force overwrite of output file and compress links
>   -h, --help        give this help
>   -k, --keep        keep (don't delete) input files
>   -l, --list        list compressed file contents
>   -L, --license     display software license
>   -n, --no-name     do not save or restore the original name and time stamp
>   -N, --name        save or restore the original name and time stamp
>   -q, --quiet       suppress all warnings
>   -r, --recursive   operate recursively on directories
>   -S, --suffix=SUF  use suffix SUF on compressed files
>   -t, --test        test compressed file integrity
>   -v, --verbose     verbose mode
>   -V, --version     display version number
>   -1, --fast        compress faster
>   -9, --best        compress better
> 
> With no FILE, or when FILE is -, read standard input.
> 
> Report bugs to <bug-gzip@gnu.org>.
> 
> Child exited with status 0
> GDBserver exiting
> [snip]
> 
> //Hongxu
> 


