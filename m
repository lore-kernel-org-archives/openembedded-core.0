Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwATS-000192-U8 for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:18:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VB7Ehl020140
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:07:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19675-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:07:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VB75Zx020134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:07:06 +0100
Message-ID: <1343732826.9526.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2012 12:07:06 +0100
In-Reply-To: <1343697966-29777-1-git-send-email-Martin.Jansa@gmail.com>
References: <1343697966-29777-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] gdb-cross: add pythonnative
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
X-List-Received-Date: Tue, 31 Jul 2012 11:18:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-31 at 03:26 +0200, Martin Jansa wrote:
> * fails like this without:
> | gcc -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include -O2 -pipe   -L/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -L/OE/shr-core/tmp-eglibc/sysroo
> ts/x86_64-linux/lib -Wl,-rpath-link,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-rpath,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-O1   \
> |       -o gdb gdb.o libgdb.a \
> |          -lreadline ../opcodes/libopcodes.a ../bfd/libbfd.a  ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a    -ldl -lncurses -lz -lm    -lpthread -ldl -lutil -lm -lpython2.7 -Xlinker -export-dynamic /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libexpat.so -Wl,-rpath -Wl,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib ../libiberty/libiberty.a  gnulib/libgnu.a
> | libgdb.a(python.o): In function `gdbpy_target_wide_charset':
> | python.c:(.text+0x1e7): undefined reference to `PyUnicodeUCS4_Decode'
> | libgdb.a(python.o): In function `gdbpy_target_charset':
> | python.c:(.text+0x237): undefined reference to `PyUnicodeUCS4_Decode'
> | libgdb.a(py-cmd.o): In function `cmdpy_completer':
> | py-cmd.c:(.text+0x97): undefined reference to `PyUnicodeUCS4_Decode'
> | py-cmd.c:(.text+0xc3): undefined reference to `PyUnicodeUCS4_Decode'
> | libgdb.a(py-cmd.o): In function `cmdpy_function':
> | py-cmd.c:(.text+0x39d): undefined reference to `PyUnicodeUCS4_Decode'
> | libgdb.a(py-frame.o):py-frame.c:(.text+0xa21): more undefined references to `PyUnicodeUCS4_Decode' follow
> | libgdb.a(py-utils.o): In function `unicode_to_encoded_string':
> | py-utils.c:(.text+0x8): undefined reference to `PyUnicodeUCS4_AsEncodedString'
> | libgdb.a(py-utils.o): In function `python_string_to_unicode':
> | py-utils.c:(.text+0xc6): undefined reference to `PyUnicodeUCS4_FromEncodedObject'
> | libgdb.a(py-utils.o): In function `unicode_to_target_python_string':
> | py-utils.c:(.text+0x13a): undefined reference to `PyUnicodeUCS4_AsEncodedString'
> | libgdb.a(py-utils.o): In function `target_string_to_unicode':
> | py-utils.c:(.text+0x2a5): undefined reference to `PyUnicodeUCS4_Decode'
> | libgdb.a(py-value.o): In function `valpy_string':
> | py-value.c:(.text+0x4ac): undefined reference to `PyUnicodeUCS4_Decode'
> | libgdb.a(py-value.o): In function `valpy_str':
> | py-value.c:(.text+0xab4): undefined reference to `PyUnicodeUCS4_Decode'
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [gdb] Error 1
> | make[2]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gdb-cross-7.4.1-r1.0/build-arm-oe-linux-gnueabi/gdb'
> | make[1]: *** [all-gdb] Error 2
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross_7.4.1.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Is python enabled for gdb-cross in OE-Core?

Cheers,

Richard



