Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2136E268
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 16:11:17 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so276778961pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=AWYDezPXEmCmbAZtIFRAoXC9U9nXgcFOA+Nm55O9bDI=;
	b=Hyj81PUtM8xq/PGgOW+nW1Wzi+X38YjUtf6mdxAlQCV9aNB17KXy+s8dCTrZqtaqRp
	RzHvYibF68gf0+ljzEnRdcF/1R1hi81PpP0Q+IaJs2PnofAdzUZ7albx8ak/jgnq90qk
	tr0z+Fu3sCunQJuMSjrLr0h2I8TizGtb5sBNElaMk5c0NUWENOPHfaeP72CoK5MZbfvu
	ZGDHjEeMe/p0ho2iOVWSdIve264D9o1cWUkJZSxH9Hk/XugU/ZqKSNqWfa+aUqCj4tAT
	cMoYDesMfKlZG5GtwCIGCVDTv61b/zrWdkR5ZDXbb23wN3OeIOoqZNKBqvBbWkjCei3V
	2Mog==
X-Received: by 10.70.133.170 with SMTP id pd10mr48382538pdb.127.1429719078737; 
	Wed, 22 Apr 2015 09:11:18 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:b51c:29c6:4263:3b58?
	([2601:9:3580:84c:b51c:29c6:4263:3b58])
	by mx.google.com with ESMTPSA id jd5sm5466749pbd.35.2015.04.22.09.11.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Apr 2015 09:11:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1429698472.2652.15.camel@linux.intel.com>
Date: Wed, 22 Apr 2015 09:11:16 -0700
Message-Id: <01A25937-186D-4D64-A4F8-EFC90CC39DFD@gmail.com>
References: <cover.1429688786.git.raj.khem@gmail.com>
	<42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
	<1429698472.2652.15.camel@linux.intel.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/10] connman: Fix builds to compile on musl
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
X-List-Received-Date: Wed, 22 Apr 2015 16:11:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

=09
> On Apr 22, 2015, at 3:27 AM, Jukka Rissanen =
<jukka.rissanen@linux.intel.com> wrote:
>=20
> Hi,
>=20
> On ke, 2015-04-22 at 07:49 +0000, Khem Raj wrote:
>> Add explicit includes for headers which are indirectly included on =
glibc
>> Dont use backtrace APIs on non-glibc C libs
>> res_nimit is a glibc specific API in resolvers so we avoid it
>>=20
>> Change-Id: I78a173f02f8c117ebb513311f27a48bc8d645efe
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> ...cktrace-API-only-when-compiling-for-glibc.patch |  41 ++++
>> .../connman/connman/0002-musl-header-fixes.patch   | 235 =
+++++++++++++++++++++
>> ...resolve-musl-does-not-implement-res_ninit.patch |  77 +++++++
>> ...Fix-duplicate-definitions-issue-with-musl.patch |  43 ++++
>> meta/recipes-connectivity/connman/connman_1.28.bb  |   4 +
>> 5 files changed, 400 insertions(+)
>> create mode 100644 =
meta/recipes-connectivity/connman/connman/0001-Enable-backtrace-API-only-w=
hen-compiling-for-glibc.patch
>> create mode 100644 =
meta/recipes-connectivity/connman/connman/0002-musl-header-fixes.patch
>> create mode 100644 =
meta/recipes-connectivity/connman/connman/0003-resolve-musl-does-not-imple=
ment-res_ninit.patch
>> create mode 100644 =
meta/recipes-connectivity/connman/connman/0004-tethering-Fix-duplicate-def=
initions-issue-with-musl.patch
>>=20
>> diff --git =
a/meta/recipes-connectivity/connman/connman/0001-Enable-backtrace-API-only=
-when-compiling-for-glibc.patch =
b/meta/recipes-connectivity/connman/connman/0001-Enable-backtrace-API-only=
-when-compiling-for-glibc.patch
>> new file mode 100644
>> index 0000000..873843b
>> --- /dev/null
>> +++ =
b/meta/recipes-connectivity/connman/connman/0001-Enable-backtrace-API-only=
-when-compiling-for-glibc.patch
>> @@ -0,0 +1,41 @@
>> +=46rom b736e90681e135e0cccb143a9ce8b7049e1ec0f0 Mon Sep 17 00:00:00 =
2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Mon, 6 Apr 2015 22:57:20 -0700
>> +Subject: [PATCH 1/4] Enable backtrace() API only when compiling for =
glibc
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + src/log.c | 6 ++++--
>> + 1 file changed, 4 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/log.c b/src/log.c
>> +index a693bd0..3bf9fcc 100644
>> +--- a/src/log.c
>> ++++ b/src/log.c
>> +@@ -30,7 +30,9 @@
>> + #include <stdlib.h>
>> + #include <string.h>
>> + #include <syslog.h>
>> ++#ifdef __GLIBC__
>> + #include <execinfo.h>
>> ++#endif
>=20
> Should this be #ifdef HAVE_EXECINFO_H
> and should this patch merged into 0002-musl-header-fixes.patch

It could be yes

>=20
>> + #include <dlfcn.h>
>> +=20
>> + #include "connman.h"
>> +@@ -215,9 +217,9 @@ static void print_backtrace(unsigned int offset)
>> + static void signal_handler(int signo)
>> + {
>> + 	connman_error("Aborting (signal %d) [%s]", signo, program_exec);
>> +-
>> ++#ifdef __GLIBC__
>> + 	print_backtrace(2);
>> +-
>> ++#endif
>=20
> The above is not needed as print_backtrace() is no-op if there is no
> execinfo.h avaiable (in the next patch).


this patch can be ignored for now since its not the updated one. I have =
to send a v3 of it
I would use libunwind for musl to get same functionality so may be thats =
a better option for backtrace()
>=20
>=20
>> + 	exit(EXIT_FAILURE);
>> + }
>> +=20
>> +--=20
>> +2.1.4
>> +
>> diff --git =
a/meta/recipes-connectivity/connman/connman/0002-musl-header-fixes.patch =
b/meta/recipes-connectivity/connman/connman/0002-musl-header-fixes.patch
>> new file mode 100644
>> index 0000000..058f1dc
>> --- /dev/null
>> +++ =
b/meta/recipes-connectivity/connman/connman/0002-musl-header-fixes.patch
>> @@ -0,0 +1,235 @@
>> +=46rom b6ff3a5989e72307cd54a840179ea072c4e0213e Mon Sep 17 00:00:00 =
2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Mon, 6 Apr 2015 22:59:55 -0700
>> +Subject: [PATCH 2/4] musl header fixes
>> +
>> +ported from
>> =
+http://git.alpinelinux.org/cgit/aports/plain/testing/connman/musl-fixes.p=
atch
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + configure.ac                 | 1 +
>> + gdhcp/common.c               | 6 +++++-
>> + gweb/gresolv.c               | 1 +
>> + plugins/wifi.c               | 3 +--
>> + src/ippool.c                 | 2 +-
>> + src/iptables.c               | 2 +-
>> + src/log.c                    | 2 ++
>> + src/ntp.c                    | 2 +-
>> + src/tethering.c              | 2 --
>> + tools/dhcp-test.c            | 1 -
>> + tools/dnsproxy-test.c        | 1 +
>> + tools/private-network-test.c | 2 +-
>> + tools/tap-test.c             | 2 +-
>> + 13 files changed, 16 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 6fa01ba..493a5f1 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -165,6 +165,7 @@ fi
>> + AM_CONDITIONAL(PPTP, test "${enable_pptp}" !=3D "no")
>> + AM_CONDITIONAL(PPTP_BUILTIN, test "${enable_pptp}" =3D "builtin")
>> +=20
>> ++AC_CHECK_HEADERS(execinfo.h)
>> + AC_CHECK_HEADERS(resolv.h, dummy=3Dyes,
>> + 	AC_MSG_ERROR(resolver header files are required))
>> + AC_CHECK_LIB(resolv, ns_initparse, dummy=3Dyes, [
>> +diff --git a/gdhcp/common.c b/gdhcp/common.c
>> +index 48fcdef..40ade87 100644
>> +--- a/gdhcp/common.c
>> ++++ b/gdhcp/common.c
>> +@@ -22,6 +22,7 @@
>> + #include <config.h>
>> + #endif
>> +=20
>> ++#define _GNU_SOURCE
>> + #include <stdio.h>
>> + #include <stdlib.h>
>> + #include <errno.h>
>> +@@ -31,7 +32,6 @@
>> + #include <string.h>
>> + #include <endian.h>
>> + #include <net/if_arp.h>
>> +-#include <linux/if.h>
>> + #include <netpacket/packet.h>
>> + #include <net/ethernet.h>
>> + #include <arpa/inet.h>
>> +@@ -40,6 +40,8 @@
>> + #include "gdhcp.h"
>> + #include "common.h"
>> +=20
>> ++#include <linux/if.h>
>> ++
>> + static const DHCPOption client_options[] =3D {
>> + 	{ OPTION_IP,			0x01 }, /* subnet-mask */
>> + 	{ OPTION_IP | OPTION_LIST,	0x03 }, /* routers */
>> +@@ -474,10 +476,12 @@ static const struct in6_addr =
in6addr_all_dhcp_relay_agents_and_servers_mc =3D
>> + 	IN6ADDR_ALL_DHCP_RELAY_AGENTS_AND_SERVERS_MC_INIT;
>> +=20
>> + /* from netinet/in.h */
>> ++#if 0
>> + struct in6_pktinfo {
>> + 	struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
>> + 	unsigned int ipi6_ifindex;  /* send/recv interface index */
>> + };
>> ++#endif
>=20
> This is already fixed by connman commit
> e8784053a0a680ec8943ff20559c6561cb5b9a96 and will be available in 1.29

yes, we can remove it when we upgrade.

>=20
>> +=20
>> + int dhcpv6_send_packet(int index, struct dhcpv6_packet *dhcp_pkt, =
int len)
>> + {
>> +diff --git a/gweb/gresolv.c b/gweb/gresolv.c
>> +index 5cf7a9a..c11a1d9 100644
>> +--- a/gweb/gresolv.c
>> ++++ b/gweb/gresolv.c
>> +@@ -24,6 +24,7 @@
>> + #endif
>> +=20
>> + #include <errno.h>
>> ++#include <stdio.h>
>> + #include <unistd.h>
>> + #include <stdarg.h>
>> + #include <string.h>
>> +diff --git a/plugins/wifi.c b/plugins/wifi.c
>> +index 1f90a31..427c552 100644
>> +--- a/plugins/wifi.c
>> ++++ b/plugins/wifi.c
>> +@@ -30,9 +30,8 @@
>> + #include <string.h>
>> + #include <sys/ioctl.h>
>> + #include <sys/socket.h>
>> +-#include <linux/if_arp.h>
>> +-#include <linux/wireless.h>
>> + #include <net/ethernet.h>
>> ++#include <linux/wireless.h>
>> +=20
>> + #ifndef IFF_LOWER_UP
>> + #define IFF_LOWER_UP	0x10000
>> +diff --git a/src/ippool.c b/src/ippool.c
>> +index bb8568d..f1eb1f3 100644
>> +--- a/src/ippool.c
>> ++++ b/src/ippool.c
>> +@@ -28,7 +28,7 @@
>> + #include <stdio.h>
>> + #include <string.h>
>> + #include <unistd.h>
>> +-#include <sys/errno.h>
>> ++#include <errno.h>
>> + #include <sys/socket.h>
>> +=20
>> + #include "connman.h"
>> +diff --git a/src/iptables.c b/src/iptables.c
>> +index 8d583ea..a91a451 100644
>> +--- a/src/iptables.c
>> ++++ b/src/iptables.c
>> +@@ -28,7 +28,7 @@
>> + #include <stdio.h>
>> + #include <string.h>
>> + #include <unistd.h>
>> +-#include <sys/errno.h>
>> ++#include <errno.h>
>> + #include <sys/socket.h>
>> + #include <xtables.h>
>> +=20
>> +diff --git a/src/log.c b/src/log.c
>> +index 3bf9fcc..3b9843f 100644
>> +--- a/src/log.c
>> ++++ b/src/log.c
>> +@@ -114,6 +114,7 @@ void connman_debug(const char *format, ...)
>> +=20
>> + static void print_backtrace(unsigned int offset)
>> + {
>> ++#ifdef HAVE_EXECINFO_H
>> + 	void *frames[99];
>> + 	size_t n_ptrs;
>> + 	unsigned int i;
>> +@@ -212,6 +213,7 @@ static void print_backtrace(unsigned int offset)
>> +=20
>> + 	close(outfd[1]);
>> + 	close(infd[0]);
>> ++#endif /* HAVE_EXECINFO_H */
>> + }
>> +=20
>> + static void signal_handler(int signo)
>> +diff --git a/src/ntp.c b/src/ntp.c
>> +index abb2caa..dd50532 100644
>> +--- a/src/ntp.c
>> ++++ b/src/ntp.c
>> +@@ -180,7 +180,7 @@ static void send_packet(int fd, const char =
*server, uint32_t timeout)
>> + 	msg.xmttime.fraction =3D htonl(transmit_timeval.tv_usec * 1000);
>> +=20
>> + 	len =3D sendto(fd, &msg, sizeof(msg), MSG_DONTWAIT,
>> +-						&addr, sizeof(addr));
>> ++						(struct sockaddr *) =
&addr, sizeof(addr));
>> + 	if (len < 0) {
>> + 		connman_error("Time request for server %s failed =
(%d/%s)",
>> + 			server, errno, strerror(errno));
>> +diff --git a/src/tethering.c b/src/tethering.c
>> +index ceeec74..c44cb36 100644
>> +--- a/src/tethering.c
>> ++++ b/src/tethering.c
>> +@@ -31,10 +31,8 @@
>> + #include <stdio.h>
>> + #include <sys/ioctl.h>
>> + #include <net/if.h>
>> +-#include <linux/sockios.h>
>> + #include <string.h>
>> + #include <fcntl.h>
>> +-#include <linux/if_tun.h>
>> + #include <netinet/in.h>
>> + #include <linux/if_bridge.h>
>> +=20
>> +diff --git a/tools/dhcp-test.c b/tools/dhcp-test.c
>> +index c34e10a..eae66fc 100644
>> +--- a/tools/dhcp-test.c
>> ++++ b/tools/dhcp-test.c
>> +@@ -33,7 +33,6 @@
>> + #include <arpa/inet.h>
>> + #include <net/route.h>
>> + #include <net/ethernet.h>
>> +-#include <linux/if_arp.h>
>> +=20
>> + #include <gdhcp/gdhcp.h>
>> +=20
>> +diff --git a/tools/dnsproxy-test.c b/tools/dnsproxy-test.c
>> +index 551cae9..371e2e2 100644
>> +--- a/tools/dnsproxy-test.c
>> ++++ b/tools/dnsproxy-test.c
>> +@@ -24,6 +24,7 @@
>> + #endif
>> +=20
>> + #include <errno.h>
>> ++#include <stdio.h>
>> + #include <stdlib.h>
>> + #include <string.h>
>> + #include <unistd.h>
>> +diff --git a/tools/private-network-test.c =
b/tools/private-network-test.c
>> +index 3dd115b..2828bb3 100644
>> +--- a/tools/private-network-test.c
>> ++++ b/tools/private-network-test.c
>> +@@ -32,7 +32,7 @@
>> + #include <stdlib.h>
>> + #include <string.h>
>> + #include <signal.h>
>> +-#include <sys/poll.h>
>> ++#include <poll.h>
>> + #include <sys/signalfd.h>
>> + #include <unistd.h>
>> +=20
>> +diff --git a/tools/tap-test.c b/tools/tap-test.c
>> +index fdc098a..ea9a567 100644
>> +--- a/tools/tap-test.c
>> ++++ b/tools/tap-test.c
>> +@@ -29,7 +29,7 @@
>> + #include <fcntl.h>
>> + #include <unistd.h>
>> + #include <string.h>
>> +-#include <sys/poll.h>
>> ++#include <poll.h>
>> + #include <sys/ioctl.h>
>> +=20
>> + #include <netinet/in.h>
>> +--=20
>> +2.1.4
>> +
>> diff --git =
a/meta/recipes-connectivity/connman/connman/0003-resolve-musl-does-not-imp=
lement-res_ninit.patch =
b/meta/recipes-connectivity/connman/connman/0003-resolve-musl-does-not-imp=
lement-res_ninit.patch
>> new file mode 100644
>> index 0000000..28931c1
>> --- /dev/null
>> +++ =
b/meta/recipes-connectivity/connman/connman/0003-resolve-musl-does-not-imp=
lement-res_ninit.patch
>> @@ -0,0 +1,77 @@
>> +=46rom 93bb904cc4e1e97152e6408077ba136fc883b6bb Mon Sep 17 00:00:00 =
2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Mon, 6 Apr 2015 23:02:21 -0700
>> +Subject: [PATCH 3/4] resolve: musl does not implement res_ninit
>> +
>> +ported from
>> =
+http://git.alpinelinux.org/cgit/aports/plain/testing/connman/libresolv.pa=
tch
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + gweb/gresolv.c | 33 ++++++++++++---------------------
>> + 1 file changed, 12 insertions(+), 21 deletions(-)
>> +
>> +diff --git a/gweb/gresolv.c b/gweb/gresolv.c
>> +index c11a1d9..991b14c 100644
>> +--- a/gweb/gresolv.c
>> ++++ b/gweb/gresolv.c
>> +@@ -876,8 +876,6 @@ GResolv *g_resolv_new(int index)
>> + 	resolv->index =3D index;
>> + 	resolv->nameserver_list =3D NULL;
>> +=20
>> +-	res_ninit(&resolv->res);
>> +-
>> + 	return resolv;
>> + }
>> +=20
>> +@@ -917,8 +915,6 @@ void g_resolv_unref(GResolv *resolv)
>> +=20
>> + 	flush_nameservers(resolv);
>> +=20
>> +-	res_nclose(&resolv->res);
>> +-
>> + 	g_free(resolv);
>> + }
>> +=20
>> +@@ -1021,24 +1017,19 @@ guint g_resolv_lookup_hostname(GResolv =
*resolv, const char *hostname,
>> + 	debug(resolv, "hostname %s", hostname);
>> +=20
>> + 	if (!resolv->nameserver_list) {
>> +-		int i;
>> +-
>> +-		for (i =3D 0; i < resolv->res.nscount; i++) {
>> +-			char buf[100];
>> +-			int family =3D =
resolv->res.nsaddr_list[i].sin_family;
>> +-			void *sa_addr =3D =
&resolv->res.nsaddr_list[i].sin_addr;
>> +-
>> +-			if (family !=3D AF_INET &&
>> +-					resolv->res._u._ext.nsaddrs[i]) =
{
>> +-				family =3D AF_INET6;
>> +-				sa_addr =3D =
&resolv->res._u._ext.nsaddrs[i]->sin6_addr;
>> ++		FILE *f =3D fopen("/etc/resolv.conf", "r");
>> ++		if (f) {
>> ++			char line[256], *s;
>> ++			int i;
>> ++			while (fgets(line, sizeof(line), f)) {
>> ++				if (strncmp(line, "nameserver", 10) || =
!isspace(line[10]))
>> ++					continue;
>> ++				for (s =3D &line[11]; isspace(s[0]); =
s++);
>> ++				for (i =3D 0; s[i] && !isspace(s[i]); =
i++);
>> ++				s[i] =3D 0;
>> ++				g_resolv_add_nameserver(resolv, s, 53, =
0);
>> + 			}
>> +-
>> +-			if (family !=3D AF_INET && family !=3D AF_INET6)
>> +-				continue;
>> +-
>> +-			if (inet_ntop(family, sa_addr, buf, =
sizeof(buf)))
>> +-				g_resolv_add_nameserver(resolv, buf, 53, =
0);
>> ++			fclose(f);
>> + 		}
>> +=20
>> + 		if (!resolv->nameserver_list)
>=20
> Should the above be conditional and only for musl, for glibc we
> could/should still use the resolv library?

I would think code depending on glibc might not be good option since it =
adds dependency
and having ifdefs is as bad

>=20
>> +	    =
file://0001-Enable-backtrace-API-only-when-compiling-for-glibc.patch \
>> +	    file://0002-musl-header-fixes.patch \
>> +	    file://0003-resolve-musl-does-not-implement-res_ninit.patch =
\
>> +	    =
file://0004-tethering-Fix-duplicate-definitions-issue-with-musl.patch \
>>             file://connman \
>>             "
>> SRC_URI[md5sum] =3D "6e07c93877f80bb73c9d4dbfc697f3fc"
>> --=20
>> 2.1.4
>>=20
>=20
> Have you considered sending these to ConnMan upstream?
>=20

Not yet


