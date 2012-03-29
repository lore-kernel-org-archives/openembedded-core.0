Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SDKOw-0006YD-1W
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 20:48:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2TIdic4005652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 11:39:44 -0700 (PDT)
Received: from msp-dhcp10.wrs.com (172.25.34.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 29 Mar 2012 11:39:45 -0700
Message-ID: <4F74AC6F.5040009@windriver.com>
Date: Thu, 29 Mar 2012 13:39:43 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAGDS+nnR4it2-C0FM1CeJBSakt9HmVizKQSO1wkc5EqxQKh22Q@mail.gmail.com>
In-Reply-To: <CAGDS+nnR4it2-C0FM1CeJBSakt9HmVizKQSO1wkc5EqxQKh22Q@mail.gmail.com>
Cc: "Seebach, Peter" <Peter.Seebach@windriver.com>
Subject: Re: pseudo failing with cc1: error: unrecognized command line option '-m32'
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
X-List-Received-Date: Thu, 29 Mar 2012 18:48:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

It appears you are trying to build pseudo for the target right?

We've not really validated pseudo on non-x86 hosts.  I'm guessing a patch to 
remove the -m32/-m64 hard coded flags may be necessary.

(I've cc'd the pseudo maintainer...)

--Mark

On 3/29/12 1:30 PM, Steve Sakoman wrote:
> The pseudo build fails on both 32 and 64 bit build machines.  I am
> building for arm (omap).
>
> Not sure if this is related to the recent pseudo recipes changes, but
> here are the details:
>
> NOTE: package pseudo-1.3-r7: task do_compile: Started
> ERROR: Function failed: do_compile (see
> /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/pseudo-1.3-r7/temp/log.do_compile.26657
> for further information)
> ERROR: Logfile of failure stored in:
> /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/pseudo-1.3-r7/temp/log.do_compile.26657
> Log data follows:
> | ERROR: Function failed: do_compile (see
> /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/pseudo-1.3-r7/temp/log.do_compile.26657
> for further information)
> | SQLite header for version 3007010 found.
> | NOTE: make -j 8 -e MAKEFLAGS=
> | mkdir -p lib/pseudo/lib
> | ./makewrappers
> | ./maketables enums/*.in
> | mkdir -p bin
> | enums/msg_type.in: type: msg_type_t (prefix 'PSEUDO_MSG_ENUM')
> |    ping               shutdown           op                 ack
> |    nak
> |
> | enums/op.in: type: op_t (prefix 'OP_ENUM')
> |    chdir              chmod              chown              chroot
> |    close              creat              dup                fchmod
> |    fchown             fstat              link               mkdir
> |    mknod              open               rename             stat
> |    unlink             symlink            exec               may-unlink
> |    did-unlink         cancel-unlink
> |
> | enums/query_field.in: type: query_field_t (prefix 'PSQF_ENUM')
> |    access             client             dev                fd
> |    ftype              gid                id                 inode
> |    mode               op                 order              path
> |    perm               program            result             severity
> |    stamp              tag                text               type
> |    uid
> |
> | enums/query_type.in: type: query_type_t (prefix 'PSQT_ENUM')
> |   extra column: sql (default 'LITTLE BOBBY TABLES')
> |    exact              less               greater            bitand
> |    notequal           like               notlike            sqlpat
> |
> | enums/res.in: type: res_t (prefix 'RESULT_ENUM')
> |    succeed            fail               error
> |
> | enums/sev.in: type: sev_t (prefix 'SEVERITY_ENUM')
> |    debug              info               warn               error
> |    critical
> |
> | Writing datatypes... done.  Cleaning up.
> | ccache arm-poky-linux-gnueabi-gcc  -march=armv7-a
> -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=softfp
> -mfpu=neon -mtune=cortex-a8
> --sysroot=/media/Work/yocto/tmp/sysroots/omap4-multi -O2 -pipe -g
> -feliminate-unused-debug-types -pipe -std=gnu99 -Wall -W -Wextra -fPIC
> -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE -m32 -DPSEUDO_PREFIX='"/usr"'
> -DPSEUDO_SUFFIX='""' -DPSEUDO_BINDIR='"bin"'
> -DPSEUDO_LIBDIR='"lib/pseudo/lib"'
> -DPSEUDO_LOCALSTATEDIR='"var/pseudo"' -DPSEUDO_VERSION='"1.3"' -O2 -g
> -L/media/Work/yocto/tmp/sysroots/omap4-multi/usr/lib
> -I/media/Work/yocto/tmp/sysroots/omap4-multi/usr/include
> -Wl,-R/media/Work/yocto/tmp/sysroots/omap4-multi/usr/lib -c -o
> pseudo_tables.o pseudo_tables.c
> | cc1: error: unrecognized command line option '-m32'
> | make: *** [pseudo_tables.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | Checking for old/new clone mechanics...New clone.
> | ports/common/wrapfuncs.in: .......
> | ports/linux/wrapfuncs.in:
> .............................................................
> | ports/unix/wrapfuncs.in:
> .........................................................
> | ports/uids_generic/wrapfuncs.in: ........................
> | ports/linux/newclone/wrapfuncs.in: .
> | Writing functions... Warning: lchown from linux overriding unix
> | done.  Cleaning up.
> | ERROR: oe_runmake failed
> NOTE: package pseudo-1.3-r7: task do_compile: Failed
> ERROR: Task 7 (/home/sakoman/source/yocto/poky/meta/recipes-devtools/pseudo/pseudo_1.3.bb,
> do_compile) failed with exit code '1'
>
> Steve
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



