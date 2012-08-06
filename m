Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1SyTUJ-0005Mc-0F
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 22:01:15 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id A58B521112;
	Mon,  6 Aug 2012 12:41:08 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2012 12:41:04 -0700
Message-Id: <1344282064-15309-1-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.2
Subject: [PATCH] iputils: Break libsysfs dependency
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
X-List-Received-Date: Mon, 06 Aug 2012 20:01:15 -0000

iputils drops a /bin/arping with a runtime linkage against libsysfs in
/usr.  Port Fedora 17 iputils-20071127-infiniband.patch, which inlines
access previously done by libsysfs.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 .../files/arping-break-libsysfs-dependency.patch   | 296 +++++++++++++++++++++
 meta/recipes-extended/iputils/iputils_s20101006.bb |   5 +-
 2 files changed, 299 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/iputils/files/arping-break-libsysfs-dependency.patch

diff --git a/meta/recipes-extended/iputils/files/arping-break-libsysfs-dependency.patch b/meta/recipes-extended/iputils/files/arping-break-libsysfs-dependency.patch
new file mode 100644
index 0000000..37325ee
--- /dev/null
+++ b/meta/recipes-extended/iputils/files/arping-break-libsysfs-dependency.patch
@@ -0,0 +1,296 @@
+arping: Break libsysfs dependency
+
+Port Fedora 17's iputils-20071127-infiniband.patch, which inlines sysfs
+access previously done by libsysfs (which is in /usr, and thus not
+usable by /bin/arping).
+
+Upstream-Status: Inappropriate [not author] 
+Signed-off-by: Andy Ross <andy.ross@windriver.com>
+---
+ Makefile |    2 +-
+ arping.c |  152 ++++++++++++++++++++++++++++++++++++++++++++------------------
+ 2 files changed, 109 insertions(+), 45 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d9a5ca5..943f048 100644
+--- a/Makefile
++++ b/Makefile
+@@ -27,7 +27,7 @@ all: $(TARGETS)
+ 
+ 
+ tftpd: tftpd.o tftpsubs.o
+-arping: arping.o -lsysfs
++arping: arping.o
+ ping: ping.o ping_common.o
+ ping6: ping6.o ping_common.o -lresolv -lcrypto
+ ping.o ping6.o ping_common.o: ping_common.h
+diff --git a/arping.c b/arping.c
+index 13484de..6379354 100644
+--- a/arping.c
++++ b/arping.c
+@@ -32,8 +32,6 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ 
+-#include <sysfs/libsysfs.h>
+-
+ #include "SNAPSHOT.h"
+ 
+ static void usage(void) __attribute__((noreturn));
+@@ -52,14 +50,22 @@ int unicasting;
+ int s;
+ int broadcast_only;
+ 
+-struct sockaddr_storage me;
+-struct sockaddr_storage he;
++struct sockaddr_ll *me=NULL;
++struct sockaddr_ll *he=NULL;
+ 
+ struct timeval start, last;
+ 
+ int sent, brd_sent;
+ int received, brd_recv, req_recv;
+ 
++#define SYSFS_MNT_PATH          "/sys"
++#define SYSFS_CLASS             "class"
++#define SYSFS_NET               "net"
++#define SYSFS_BROADCAST         "broadcast"
++#define SYSFS_PATH_ENV          "SYSFS_PATH"
++#define SYSFS_PATH_LEN          256
++#define SOCKADDR_LEN		(2 * sizeof(struct sockaddr_ll))
++
+ #define MS_TDIFF(tv1,tv2) ( ((tv1).tv_sec-(tv2).tv_sec)*1000 + \
+ 			   ((tv1).tv_usec-(tv2).tv_usec)/1000 )
+ 
+@@ -166,6 +172,10 @@ void finish(void)
+ 		printf("\n");
+ 		fflush(stdout);
+ 	}
++
++	free(me);
++	free(he);
++
+ 	if (dad)
+ 		exit(!!received);
+ 	if (unsolicited)
+@@ -189,8 +199,7 @@ void catcher(void)
+ 		finish();
+ 
+ 	if ( count!=0  && (last.tv_sec==0 || MS_TDIFF(tv,last) > 500 ) ) {
+-		send_pack(s, src, dst,
+-			  (struct sockaddr_ll *)&me, (struct sockaddr_ll *)&he);
++		send_pack(s, src, dst, me, he);
+ 		if (count >= 0)
+ 		    count--;
+ 		if (count == 0 && unsolicited)
+@@ -239,7 +248,7 @@ int recv_pack(unsigned char *buf, int len, struct sockaddr_ll *FROM)
+ 		return 0;
+ 	if (ah->ar_pln != 4)
+ 		return 0;
+-	if (ah->ar_hln != ((struct sockaddr_ll *)&me)->sll_halen)
++	if (ah->ar_hln != me->sll_halen)
+ 		return 0;
+ 	if (len < sizeof(*ah) + 2*(4 + ah->ar_hln))
+ 		return 0;
+@@ -250,7 +259,7 @@ int recv_pack(unsigned char *buf, int len, struct sockaddr_ll *FROM)
+ 			return 0;
+ 		if (src.s_addr != dst_ip.s_addr)
+ 			return 0;
+-		if (memcmp(p+ah->ar_hln+4, ((struct sockaddr_ll *)&me)->sll_addr, ah->ar_hln))
++		if (memcmp(p+ah->ar_hln+4, me->sll_addr, ah->ar_hln))
+ 			return 0;
+ 	} else {
+ 		/* DAD packet was:
+@@ -268,7 +277,7 @@ int recv_pack(unsigned char *buf, int len, struct sockaddr_ll *FROM)
+ 		 */
+ 		if (src_ip.s_addr != dst.s_addr)
+ 			return 0;
+-		if (memcmp(p, ((struct sockaddr_ll *)&me)->sll_addr, ((struct sockaddr_ll *)&me)->sll_halen) == 0)
++		if (memcmp(p, me->sll_addr, me->sll_halen) == 0)
+ 			return 0;
+ 		if (src.s_addr && src.s_addr != dst_ip.s_addr)
+ 			return 0;
+@@ -284,7 +293,7 @@ int recv_pack(unsigned char *buf, int len, struct sockaddr_ll *FROM)
+ 			printf("for %s ", inet_ntoa(dst_ip));
+ 			s_printed = 1;
+ 		}
+-		if (memcmp(p+ah->ar_hln+4, ((struct sockaddr_ll *)&me)->sll_addr, ah->ar_hln)) {
++		if (memcmp(p+ah->ar_hln+4, me->sll_addr, ah->ar_hln)) {
+ 			if (!s_printed)
+ 				printf("for ");
+ 			printf("[");
+@@ -310,40 +319,67 @@ int recv_pack(unsigned char *buf, int len, struct sockaddr_ll *FROM)
+ 	if (quit_on_reply)
+ 		finish();
+ 	if(!broadcast_only) {
+-		memcpy(((struct sockaddr_ll *)&he)->sll_addr, p, ((struct sockaddr_ll *)&me)->sll_halen);
++		memcpy(he->sll_addr, p, me->sll_halen);
+ 		unicasting=1;
+ 	}
+ 	return 1;
+ }
+ 
+-void set_device_broadcast(char *device, unsigned char *ba, size_t balen)
++int get_sysfs_mnt_path(char *mnt_path, size_t len)
+ {
+-	struct sysfs_class_device *dev;
+-	struct sysfs_attribute *brdcast;
+-	unsigned char *p;
+-	int ch;
++        const char *sysfs_path_env;
++        int pth_len=0;
+ 
+-	dev = sysfs_open_class_device("net", device);
+-	if (!dev) {
+-		perror("sysfs_open_class_device(net)");
+-		exit(2);
+-	}
++        if (len == 0 || mnt_path == NULL)
++                return -1;
+ 
+-	brdcast = sysfs_get_classdev_attr(dev, "broadcast");
+-	if (!brdcast) {
+-		perror("sysfs_get_classdev_attr(broadcast)");
+-		exit(2);
+-	}
++        /* possible overrride of real mount path */
++        sysfs_path_env = getenv(SYSFS_PATH_ENV);
++        memset(mnt_path, 0, len);
++        strncpy(mnt_path,
++                sysfs_path_env != NULL ? sysfs_path_env : SYSFS_MNT_PATH,
++                len-1);
+ 
+-	if (sysfs_read_attribute(brdcast)) {
+-		perror("sysfs_read_attribute");
+-		exit(2);
+-	}
++        if ((pth_len = strlen(mnt_path)) > 0 && mnt_path[pth_len-1] == '/')
++                mnt_path[pth_len-1] = '\0';
++
++        return 0;
++}
++
++int make_sysfs_broadcast_path(char *broadcast_path, size_t len)
++{
++        char mnt_path[SYSFS_PATH_LEN];
++
++        if (get_sysfs_mnt_path(mnt_path, len) != 0)
++                return -1;
+ 
+-	for (p = ba, ch = 0; p < ba + balen; p++, ch += 3)
+-		*p = strtoul(brdcast->value + ch, NULL, 16);
++        snprintf(broadcast_path, len,
++                "%s/" SYSFS_CLASS "/" SYSFS_NET "/%s/" SYSFS_BROADCAST,
++                mnt_path, device);
+ 
+-	return;
++        return 0;
++}
++
++char * read_sysfs_broadcast(char *brdcast_path)
++{
++        int fd;
++        int len_to_read;
++        char *brdcast = NULL;
++
++        if ((fd = open(brdcast_path, O_RDONLY)) > -1) {
++                len_to_read = lseek(fd, 0L, SEEK_END);
++                if ((brdcast = malloc(len_to_read+1)) != NULL) {
++                        lseek(fd, 0L, SEEK_SET);
++                        memset(brdcast, 0, len_to_read+1);
++                        if (read(fd, brdcast, len_to_read) == -1) {
++                                free(brdcast);
++                                brdcast = NULL;
++                        }
++                }
++                close(fd);
++        }
++
++        return brdcast;
+ }
+ 
+ int
+@@ -361,6 +397,17 @@ main(int argc, char **argv)
+ 		exit(-1);
+ 	}
+ 
++	me = malloc(SOCKADDR_LEN);
++	if (!me) {
++		fprintf(stderr, "arping: could not allocate memory\n");
++		exit(1);
++	}
++	he = malloc(SOCKADDR_LEN);
++	if (!he) {
++		fprintf(stderr, "arping: could not allocate memory\n");
++		exit(1);
++	}
++
+ 	while ((ch = getopt(argc, argv, "h?bfDUAqc:w:s:I:V")) != EOF) {
+ 		switch(ch) {
+ 		case 'b':
+@@ -509,34 +556,51 @@ main(int argc, char **argv)
+ 		close(probe_fd);
+ 	};
+ 
+-	((struct sockaddr_ll *)&me)->sll_family = AF_PACKET;
+-	((struct sockaddr_ll *)&me)->sll_ifindex = ifindex;
+-	((struct sockaddr_ll *)&me)->sll_protocol = htons(ETH_P_ARP);
+-	if (bind(s, (struct sockaddr*)&me, sizeof(me)) == -1) {
++	me->sll_family = AF_PACKET;
++	me->sll_ifindex = ifindex;
++	me->sll_protocol = htons(ETH_P_ARP);
++	if (bind(s, (struct sockaddr*)me, SOCKADDR_LEN) == -1) {
+ 		perror("bind");
+ 		exit(2);
+ 	}
+ 
+ 	if (1) {
+-		socklen_t alen = sizeof(me);
+-		if (getsockname(s, (struct sockaddr*)&me, &alen) == -1) {
++		socklen_t alen = SOCKADDR_LEN;
++		if (getsockname(s, (struct sockaddr*)me, &alen) == -1) {
+ 			perror("getsockname");
+ 			exit(2);
+ 		}
+ 	}
+-	if (((struct sockaddr_ll *)&me)->sll_halen == 0) {
++	if (me->sll_halen == 0) {
+ 		if (!quiet)
+ 			printf("Interface \"%s\" is not ARPable (no ll address)\n", device);
+ 		exit(dad?0:2);
+ 	}
+ 
+-	he = me;
++	memcpy(he, me, SOCKADDR_LEN);
+ 
+ #if 1
+-	set_device_broadcast(device, ((struct sockaddr_ll *)&he)->sll_addr,
+-			     ((struct sockaddr_ll *)&he)->sll_halen);
++	char brdcast_path[SYSFS_PATH_LEN];
++	char *brdcast_val=NULL;
++	char *next_ch;
++
++	if (make_sysfs_broadcast_path(brdcast_path, sizeof brdcast_path) != 0) {
++		perror("sysfs attribute broadcast");
++		exit(2);
++	}
++
++	if ((brdcast_val = read_sysfs_broadcast(brdcast_path)) == NULL) {
++		perror("sysfs read broadcast value");
++		exit(2);
++	}
++
++	for (ch=0; ch<he->sll_halen; ch++) {
++		he->sll_addr[ch] = strtol(brdcast_val + (ch*3), &next_ch, 16);
++	}
++
++	free(brdcast_val);
+ #else
+-	memset(((struct sockaddr_ll *)&he)->sll_addr, -1, ((struct sockaddr_ll *)&he)->sll_halen);
++	memset(he->sll_addr, -1, he->sll_halen);
+ #endif
+ 
+ 	if (!quiet) {
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb b/meta/recipes-extended/iputils/iputils_s20101006.bb
index 394ab58..62e2b5e 100644
--- a/meta/recipes-extended/iputils/iputils_s20101006.bb
+++ b/meta/recipes-extended/iputils/iputils_s20101006.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
                     file://arping.c;beginline=1;endline=10;md5=ada2a6d06acc90f943bddf40d15e0541 \
                     file://tftpd.c;beginline=1;endline=32;md5=28834bf8a91a5b8a92755dbee709ef96 "
 
-DEPENDS = "sysfsutils openssl docbook-utils-native sgmlspl-native"
+DEPENDS = "openssl docbook-utils-native sgmlspl-native"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/fix-dead-host-ping-stats.diff \
@@ -22,6 +22,7 @@ SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/targets.diff \
            file://debian/fix-arping-timeouts.diff \
            file://nsgmls-path-fix.patch \
+           file://arping-break-libsysfs-dependency.patch \
           "
 
 SRC_URI[md5sum] = "a36c25e9ec17e48be514dc0485e7376c"
-- 
1.7.11.2



