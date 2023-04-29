Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5815FC77B60
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 01:29:32 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.38227.1682731767708925182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 18:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hTZP7A9s;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b733fd00bso511083b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 18:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682731767; x=1685323767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j0M/TERPf/iR9OjJSLqr1t8yI48ZpBCRKPfsVxeUGSI=;
        b=hTZP7A9sBxUdakKy4C+W8FUpK0d7qQiFfCOF0CYHlunRq3ksTj134Sa/cwtsbTjaI3
         rGUaIhWbttpc3AKeMO3aHqJgc+E9wW5ap/QWagj4jW5eQdy+hFh1W92VDdai3r8Q0hAQ
         UFzGGsrxxS+8m1Ii4ia8cpIqJVLgBoCICK0L2wg0lgebgKdwQBgXK93ksMLuDqhFq7El
         +JnKjp802HpOyN/oIiyGZnnPnENUPg2d/U7QX5mGM1BsUTSl45y3UXmAsUx3dw5Qx/hg
         qri5HLNngxdFbE8af0m9G4J9EyZClvpdc1rOinD1IWptuWPtQBOfC2pO+rtBqpEcoMcK
         ru+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682731767; x=1685323767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0M/TERPf/iR9OjJSLqr1t8yI48ZpBCRKPfsVxeUGSI=;
        b=jzWBgtT38M8yKxoHMm8YtwIDV3lAtF+aOL+kGbP2H0fHsXSv6+oQnfxsIjNt9dPqoG
         dXY3uB2/x72jXRCJhGKyOgUaZSGGYoU/q4BGO81/9Uac16H9jbBlZhAn3r3X3J0+UGk6
         2Xo/oL9U0RkOM0rnzZGhwJv6mwxAPGSI1BxYygRC/cCqjC69L/BV97HIIKC++FFGQHEC
         +u9NMR0uHPJz+auIxMviBxlEpE8BdIa2B5vFeDeBxB2JnYxU/rX2HCfDFRfXmJ+kaluE
         5ykY1TWGx/DsRC0ktdXFTWxY67Ckl9jB0WQV1j00HqE4k9YGZ/+7DaIhVruPhv+m+Ekw
         APAA==
X-Gm-Message-State: AC+VfDyrHKClOSSjMFUgBj/Xi8IbdYgKUxtY1El7o7AWk5tcID3kB/aS
	fp4tDmDQiXml5WYSblgqPJC5Tj7yvRgufA==
X-Google-Smtp-Source: ACHHUZ7eiEdjM4GxtUpJVmfNQosf/+RVYAJjwh4+ihVNgvuhtyFeHTneeCbfTYHKXbbEDN9medK7Yg==
X-Received: by 2002:a05:6a20:748d:b0:ec:d7cf:bcf7 with SMTP id p13-20020a056a20748d00b000ecd7cfbcf7mr8790311pzd.17.1682731766448;
        Fri, 28 Apr 2023 18:29:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id n10-20020a63ee4a000000b0051b0e564963sm13885720pgk.49.2023.04.28.18.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 18:29:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Fix timesyncd runtime assertions with 64bit time_t
Date: Fri, 28 Apr 2023 18:29:23 -0700
Message-Id: <20230429012923.872571-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 01:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180538

This issue is seen on 32bit architectures using 64bit time_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd/27253.patch | 313 ++++++++++++++++
 meta/recipes-core/systemd/systemd/27254.patch | 345 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_253.3.bb    |   2 +
 3 files changed, 660 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/27253.patch
 create mode 100644 meta/recipes-core/systemd/systemd/27254.patch

diff --git a/meta/recipes-core/systemd/systemd/27253.patch b/meta/recipes-core/systemd/systemd/27253.patch
new file mode 100644
index 0000000000..6c556fe80f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/27253.patch
@@ -0,0 +1,313 @@
+From 924937cbc0bf692bc6e5b3a0bd3c18347d9521e9 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Thu, 13 Apr 2023 16:40:36 +0900
+Subject: [PATCH 1/7] timesync: drop unnecessary initialization
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/27253]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/timesync/timesyncd-manager.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/src/timesync/timesyncd-manager.c
++++ b/src/timesync/timesyncd-manager.c
+@@ -410,7 +410,7 @@ static int manager_receive_response(sd_e
+                 .msg_name = &server_addr,
+                 .msg_namelen = sizeof(server_addr),
+         };
+-        struct timespec *recv_time = NULL;
++        struct timespec *recv_time;
+         triple_timestamp dts;
+         ssize_t len;
+         double origin, receive, trans, dest, delay, offset, root_distance;
+@@ -445,7 +445,7 @@ static int manager_receive_response(sd_e
+                 return 0;
+         }
+ 
+-        recv_time = CMSG_FIND_DATA(&msghdr, SOL_SOCKET, SCM_TIMESTAMPNS, struct timespec);
++        recv_time = CMSG_FIND_AND_COPY_DATA(&msghdr, SOL_SOCKET, SCM_TIMESTAMPNS, struct timespec);
+         if (!recv_time)
+                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL), "Packet timestamp missing.");
+ 
+--- a/src/basic/socket-util.h
++++ b/src/basic/socket-util.h
+@@ -183,17 +183,22 @@ int flush_accept(int fd);
+  * riscv32. */
+ #define CMSG_TYPED_DATA(cmsg, type)                                     \
+         ({                                                              \
+-                struct cmsghdr *_cmsg = cmsg;                           \
+-                assert_cc(__alignof__(type) <= __alignof__(struct cmsghdr)); \
++                struct cmsghdr *_cmsg = (cmsg);                         \
++                assert_cc(alignof(type) <= alignof(struct cmsghdr));    \
+                 _cmsg ? CAST_ALIGN_PTR(type, CMSG_DATA(_cmsg)) : (type*) NULL; \
+         })
+ 
+ struct cmsghdr* cmsg_find(struct msghdr *mh, int level, int type, socklen_t length);
++void* cmsg_find_and_copy_data(struct msghdr *mh, int level, int type, void *buf, size_t buf_len);
+ 
+ /* Type-safe, dereferencing version of cmsg_find() */
+ #define CMSG_FIND_DATA(mh, level, type, ctype)                          \
+         CMSG_TYPED_DATA(cmsg_find(mh, level, type, CMSG_LEN(sizeof(ctype))), ctype)
+ 
++/* Type-safe version of cmsg_find_and_copy_data() */
++#define CMSG_FIND_AND_COPY_DATA(mh, level, type, ctype)             \
++        (ctype*) cmsg_find_and_copy_data(mh, level, type, &(ctype){}, sizeof(ctype))
++
+ /* Resolves to a type that can carry cmsghdr structures. Make sure things are properly aligned, i.e. the type
+  * itself is placed properly in memory and the size is also aligned to what's appropriate for "cmsghdr"
+  * structures. */
+--- a/src/boot/efi/pe.c
++++ b/src/boot/efi/pe.c
+@@ -197,7 +197,7 @@ static uint32_t get_compatibility_entry_
+                 uint32_t entry_point;
+         } _packed_ LinuxPeCompat1;
+ 
+-        while (size >= sizeof(LinuxPeCompat1) && addr % __alignof__(LinuxPeCompat1) == 0) {
++        while (size >= sizeof(LinuxPeCompat1) && addr % alignof(LinuxPeCompat1) == 0) {
+                 LinuxPeCompat1 *compat = (LinuxPeCompat1 *) ((uint8_t *) dos + addr);
+ 
+                 if (compat->type == 0 || compat->size == 0 || compat->size > size)
+--- a/src/fundamental/macro-fundamental.h
++++ b/src/fundamental/macro-fundamental.h
+@@ -6,12 +6,13 @@
+ #endif
+ 
+ #include <limits.h>
++#include <stdalign.h>
+ #include <stdbool.h>
+ #include <stddef.h>
+ #include <stdint.h>
+ 
+ #define _align_(x) __attribute__((__aligned__(x)))
+-#define _alignas_(x) __attribute__((__aligned__(__alignof__(x))))
++#define _alignas_(x) __attribute__((__aligned__(alignof(x))))
+ #define _alignptr_ __attribute__((__aligned__(sizeof(void *))))
+ #define _cleanup_(x) __attribute__((__cleanup__(x)))
+ #define _const_ __attribute__((__const__))
+@@ -346,9 +347,9 @@ static inline size_t ALIGN_TO(size_t l,
+ #endif
+ 
+ /* Checks if the specified pointer is aligned as appropriate for the specific type */
+-#define IS_ALIGNED16(p) (((uintptr_t) p) % __alignof__(uint16_t) == 0)
+-#define IS_ALIGNED32(p) (((uintptr_t) p) % __alignof__(uint32_t) == 0)
+-#define IS_ALIGNED64(p) (((uintptr_t) p) % __alignof__(uint64_t) == 0)
++#define IS_ALIGNED16(p) (((uintptr_t) p) % alignof(uint16_t) == 0)
++#define IS_ALIGNED32(p) (((uintptr_t) p) % alignof(uint32_t) == 0)
++#define IS_ALIGNED64(p) (((uintptr_t) p) % alignof(uint64_t) == 0)
+ 
+ /* Same as ALIGN_TO but callable in constant contexts. */
+ #define CONST_ALIGN_TO(l, ali)                                         \
+@@ -366,7 +367,7 @@ static inline size_t ALIGN_TO(size_t l,
+ #define CAST_ALIGN_PTR(t, p)                                    \
+         ({                                                      \
+                 const void *_p = (p);                           \
+-                assert(((uintptr_t) _p) % __alignof__(t) == 0); \
++                assert(((uintptr_t) _p) % alignof(t) == 0); \
+                 (t *) _p;                                       \
+         })
+ 
+--- a/src/network/networkd-nexthop.c
++++ b/src/network/networkd-nexthop.c
+@@ -894,7 +894,7 @@ int manager_rtnl_process_nexthop(sd_netl
+                         return 0;
+                 }
+ 
+-                assert((uintptr_t) group % __alignof__(struct nexthop_grp) == 0);
++                assert((uintptr_t) group % alignof(struct nexthop_grp) == 0);
+ 
+                 n_group = raw_group_size / sizeof(struct nexthop_grp);
+                 for (size_t i = 0; i < n_group; i++) {
+--- a/src/test/test-sizeof.c
++++ b/src/test/test-sizeof.c
+@@ -17,16 +17,16 @@
+ DISABLE_WARNING_TYPE_LIMITS;
+ 
+ #define info_no_sign(t)                                                 \
+-        printf("%s → %zu bits, %zu byte alignment\n", STRINGIFY(t),     \
++        printf("%s → %zu bits, %zu byte alignment\n", STRINGIFY(t),    \
+                sizeof(t)*CHAR_BIT,                                      \
+-               __alignof__(t))
++               alignof(t))
+ 
+ #define info(t)                                                         \
+-        printf("%s → %zu bits%s, %zu byte alignment\n", STRINGIFY(t),   \
++        printf("%s → %zu bits%s, %zu byte alignment\n", STRINGIFY(t),  \
+                sizeof(t)*CHAR_BIT,                                      \
+                strstr(STRINGIFY(t), "signed") ? "" :                    \
+                (t)-1 < (t)0 ? ", signed" : ", unsigned",                \
+-               __alignof__(t))
++               alignof(t))
+ 
+ enum Enum {
+         enum_value,
+@@ -44,7 +44,7 @@ enum BigEnum2 {
+ int main(void) {
+         int (*function_pointer)(void);
+ 
+-        info_no_sign(function_pointer);
++        info_no_sign(typeof(function_pointer));
+         info_no_sign(void*);
+         info(char*);
+ 
+--- a/src/basic/socket-util.c
++++ b/src/basic/socket-util.c
+@@ -1171,6 +1171,18 @@ struct cmsghdr* cmsg_find(struct msghdr
+         return NULL;
+ }
+ 
++void* cmsg_find_and_copy_data(struct msghdr *mh, int level, int type, void *buf, size_t buf_len) {
++        struct cmsghdr *cmsg;
++
++        assert(mh);
++
++        cmsg = cmsg_find(mh, level, type, buf_len == SIZE_MAX ? (socklen_t) -1 : CMSG_LEN(buf_len));
++        if (!cmsg)
++                return NULL;
++
++        return memcpy_safe(buf, CMSG_DATA(cmsg), buf_len == SIZE_MAX ? cmsg->cmsg_len : buf_len);
++}
++
+ int socket_ioctl_fd(void) {
+         int fd;
+ 
+--- a/src/journal/journald-server.c
++++ b/src/journal/journald-server.c
+@@ -1385,7 +1385,7 @@ int server_process_datagram(
+         size_t label_len = 0, m;
+         Server *s = ASSERT_PTR(userdata);
+         struct ucred *ucred = NULL;
+-        struct timeval *tv = NULL;
++        struct timeval tv_buf, *tv = NULL;
+         struct cmsghdr *cmsg;
+         char *label = NULL;
+         struct iovec iovec;
+@@ -1461,10 +1461,10 @@ int server_process_datagram(
+                         label = CMSG_TYPED_DATA(cmsg, char);
+                         label_len = cmsg->cmsg_len - CMSG_LEN(0);
+                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
+-                           cmsg->cmsg_type == SO_TIMESTAMP &&
++                           cmsg->cmsg_type == SCM_TIMESTAMP &&
+                            cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval))) {
+                         assert(!tv);
+-                        tv = CMSG_TYPED_DATA(cmsg, struct timeval);
++                        tv = memcpy(&tv_buf, CMSG_DATA(cmsg), sizeof(struct timeval));
+                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
+                          cmsg->cmsg_type == SCM_RIGHTS) {
+                         assert(!fds);
+--- a/src/libsystemd-network/icmp6-util.c
++++ b/src/libsystemd-network/icmp6-util.c
+@@ -199,9 +199,11 @@ int icmp6_receive(int fd, void *buffer,
+                 }
+ 
+                 if (cmsg->cmsg_level == SOL_SOCKET &&
+-                    cmsg->cmsg_type == SO_TIMESTAMP &&
+-                    cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval)))
+-                        triple_timestamp_from_realtime(&t, timeval_load(CMSG_TYPED_DATA(cmsg, struct timeval)));
++                    cmsg->cmsg_type == SCM_TIMESTAMP &&
++                    cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval))) {
++                        struct timeval *tv = memcpy(&(struct timeval) {}, CMSG_DATA(cmsg), sizeof(struct timeval));
++                        triple_timestamp_from_realtime(&t, timeval_load(tv));
++                }
+         }
+ 
+         if (!triple_timestamp_is_set(&t))
+--- a/src/libsystemd-network/sd-dhcp6-client.c
++++ b/src/libsystemd-network/sd-dhcp6-client.c
+@@ -1276,7 +1276,6 @@ static int client_receive_message(
+                 .msg_control = &control,
+                 .msg_controllen = sizeof(control),
+         };
+-        struct cmsghdr *cmsg;
+         triple_timestamp t = {};
+         _cleanup_free_ DHCP6Message *message = NULL;
+         struct in6_addr *server_address = NULL;
+@@ -1320,12 +1319,9 @@ static int client_receive_message(
+                 server_address = &sa.in6.sin6_addr;
+         }
+ 
+-        CMSG_FOREACH(cmsg, &msg) {
+-                if (cmsg->cmsg_level == SOL_SOCKET &&
+-                    cmsg->cmsg_type == SO_TIMESTAMP &&
+-                    cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval)))
+-                        triple_timestamp_from_realtime(&t, timeval_load(CMSG_TYPED_DATA(cmsg, struct timeval)));
+-        }
++        struct timeval *tv = CMSG_FIND_AND_COPY_DATA(&msg, SOL_SOCKET, SCM_TIMESTAMP, struct timeval);
++        if (tv)
++                triple_timestamp_from_realtime(&t, timeval_load(tv));
+ 
+         if (client->transaction_id != (message->transaction_id & htobe32(0x00ffffff)))
+                 return 0;
+--- a/src/libsystemd-network/sd-dhcp-server.c
++++ b/src/libsystemd-network/sd-dhcp-server.c
+@@ -407,7 +407,7 @@ static int dhcp_server_send_udp(sd_dhcp_
+                    rather than binding the socket. This will be mostly useful
+                    when we gain support for arbitrary number of server addresses
+                  */
+-                pktinfo = (struct in_pktinfo*) CMSG_DATA(cmsg);
++                pktinfo = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
+                 assert(pktinfo);
+ 
+                 pktinfo->ipi_ifindex = server->ifindex;
+@@ -1270,7 +1270,6 @@ static int server_receive_message(sd_eve
+                 .msg_control = &control,
+                 .msg_controllen = sizeof(control),
+         };
+-        struct cmsghdr *cmsg;
+         ssize_t datagram_size, len;
+         int r;
+ 
+@@ -1306,19 +1305,10 @@ static int server_receive_message(sd_eve
+         if ((size_t) len < sizeof(DHCPMessage))
+                 return 0;
+ 
+-        CMSG_FOREACH(cmsg, &msg)
+-                if (cmsg->cmsg_level == IPPROTO_IP &&
+-                    cmsg->cmsg_type == IP_PKTINFO &&
+-                    cmsg->cmsg_len == CMSG_LEN(sizeof(struct in_pktinfo))) {
+-                        struct in_pktinfo *info = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
+-
+-                        /* TODO figure out if this can be done as a filter on
+-                         * the socket, like for IPv6 */
+-                        if (server->ifindex != info->ipi_ifindex)
+-                                return 0;
+-
+-                        break;
+-                }
++        /* TODO figure out if this can be done as a filter on the socket, like for IPv6 */
++        struct in_pktinfo *info = CMSG_FIND_DATA(&msg, IPPROTO_IP, IP_PKTINFO, struct in_pktinfo);
++        if (info && info->ipi_ifindex != server->ifindex)
++                return 0;
+ 
+         if (sd_dhcp_server_is_in_relay_mode(server)) {
+                 r = dhcp_server_relay_message(server, message, len - sizeof(DHCPMessage), buflen);
+--- a/src/libsystemd/sd-daemon/sd-daemon.c
++++ b/src/libsystemd/sd-daemon/sd-daemon.c
+@@ -567,7 +567,7 @@ _public_ int sd_pid_notify_with_fds(
+                         cmsg->cmsg_type = SCM_CREDENTIALS;
+                         cmsg->cmsg_len = CMSG_LEN(sizeof(struct ucred));
+ 
+-                        ucred = (struct ucred*) CMSG_DATA(cmsg);
++                        ucred = CMSG_TYPED_DATA(cmsg, struct ucred);
+                         ucred->pid = pid != 0 ? pid : getpid_cached();
+                         ucred->uid = getuid();
+                         ucred->gid = getgid();
+--- a/src/resolve/resolved-manager.c
++++ b/src/resolve/resolved-manager.c
+@@ -984,7 +984,7 @@ static int manager_ipv4_send(
+                 cmsg->cmsg_level = IPPROTO_IP;
+                 cmsg->cmsg_type = IP_PKTINFO;
+ 
+-                pi = (struct in_pktinfo*) CMSG_DATA(cmsg);
++                pi = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
+                 pi->ipi_ifindex = ifindex;
+ 
+                 if (source)
+@@ -1040,7 +1040,7 @@ static int manager_ipv6_send(
+                 cmsg->cmsg_level = IPPROTO_IPV6;
+                 cmsg->cmsg_type = IPV6_PKTINFO;
+ 
+-                pi = (struct in6_pktinfo*) CMSG_DATA(cmsg);
++                pi = CMSG_TYPED_DATA(cmsg, struct in6_pktinfo);
+                 pi->ipi6_ifindex = ifindex;
+ 
+                 if (source)
diff --git a/meta/recipes-core/systemd/systemd/27254.patch b/meta/recipes-core/systemd/systemd/27254.patch
new file mode 100644
index 0000000000..3928088dc6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/27254.patch
@@ -0,0 +1,345 @@
+From 79dec6f5cc0b72d43dfb0469fa68b5cd023fbaf9 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 13 Apr 2023 10:21:31 +0200
+Subject: [PATCH 1/3] socket-util: tighten aignment check for CMSG_TYPED_DATA()
+
+Apparently CMSG_DATA() alignment is very much undefined. Which is quite
+an ABI fuck-up, but we need to deal with this. CMSG_TYPED_DATA() already
+checks alignment of the specified pointer. Let's also check matching
+alignment of the underlying structures, which we already can do at
+compile-time.
+
+See: #27241
+
+(This does not fix #27241, but should catch such errors already at
+compile-time instead of runtime)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/27254]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/socket-util.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+--- a/src/basic/socket-util.h
++++ b/src/basic/socket-util.h
+@@ -175,9 +175,16 @@ int flush_accept(int fd);
+ #define CMSG_FOREACH(cmsg, mh)                                          \
+         for ((cmsg) = CMSG_FIRSTHDR(mh); (cmsg); (cmsg) = CMSG_NXTHDR((mh), (cmsg)))
+ 
++/* Returns the cmsghdr's data pointer, but safely cast to the specified type. Does two alignment checks: one
++ * at compile time, that the requested type has a smaller or same alignment as 'struct cmsghdr', and one
++ * during runtime, that the actual pointer matches the alignment too. This is supposed to catch cases such as
++ * 'struct timeval' is embedded into 'struct cmsghdr' on architectures where the alignment of the former is 8
++ * bytes (because of a 64bit time_t), but of the latter is 4 bytes (because size_t is 32bit), such as
++ * riscv32. */
+ #define CMSG_TYPED_DATA(cmsg, type)                                     \
+         ({                                                              \
+                 struct cmsghdr *_cmsg = cmsg;                           \
++                assert_cc(__alignof__(type) <= __alignof__(struct cmsghdr)); \
+                 _cmsg ? CAST_ALIGN_PTR(type, CMSG_DATA(_cmsg)) : (type*) NULL; \
+         })
+ 
+--- a/src/basic/socket-util.c
++++ b/src/basic/socket-util.c
+@@ -1047,7 +1047,7 @@ ssize_t receive_one_fd_iov(
+         }
+ 
+         if (found)
+-                *ret_fd = *(int*) CMSG_DATA(found);
++                *ret_fd = *CMSG_TYPED_DATA(found, int);
+         else
+                 *ret_fd = -EBADF;
+ 
+--- a/src/core/manager.c
++++ b/src/core/manager.c
+@@ -2503,7 +2503,7 @@ static int manager_dispatch_notify_fd(sd
+                 if (cmsg->cmsg_level == SOL_SOCKET && cmsg->cmsg_type == SCM_RIGHTS) {
+ 
+                         assert(!fd_array);
+-                        fd_array = (int*) CMSG_DATA(cmsg);
++                        fd_array = CMSG_TYPED_DATA(cmsg, int);
+                         n_fds = (cmsg->cmsg_len - CMSG_LEN(0)) / sizeof(int);
+ 
+                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
+@@ -2511,7 +2511,7 @@ static int manager_dispatch_notify_fd(sd
+                            cmsg->cmsg_len == CMSG_LEN(sizeof(struct ucred))) {
+ 
+                         assert(!ucred);
+-                        ucred = (struct ucred*) CMSG_DATA(cmsg);
++                        ucred = CMSG_TYPED_DATA(cmsg, struct ucred);
+                 }
+         }
+ 
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -1163,7 +1163,7 @@ static int process_socket(int fd) {
+                         }
+ 
+                         assert(input_fd < 0);
+-                        input_fd = *(int*) CMSG_DATA(found);
++                        input_fd = *CMSG_TYPED_DATA(found, int);
+                         break;
+                 } else
+                         cmsg_close_all(&mh);
+--- a/src/home/homed-manager.c
++++ b/src/home/homed-manager.c
+@@ -1086,7 +1086,7 @@ static ssize_t read_datagram(
+                     cmsg->cmsg_type == SCM_CREDENTIALS &&
+                     cmsg->cmsg_len == CMSG_LEN(sizeof(struct ucred))) {
+                         assert(!sender);
+-                        sender = (struct ucred*) CMSG_DATA(cmsg);
++                        sender = CMSG_TYPED_DATA(cmsg, struct ucred);
+                 }
+ 
+                 if (cmsg->cmsg_level == SOL_SOCKET &&
+@@ -1098,7 +1098,7 @@ static ssize_t read_datagram(
+                         }
+ 
+                         assert(passed_fd < 0);
+-                        passed_fd = *(int*) CMSG_DATA(cmsg);
++                        passed_fd = *CMSG_TYPED_DATA(cmsg, int);
+                 }
+         }
+ 
+--- a/src/journal/journald-server.c
++++ b/src/journal/journald-server.c
+@@ -1454,21 +1454,21 @@ int server_process_datagram(
+                     cmsg->cmsg_type == SCM_CREDENTIALS &&
+                     cmsg->cmsg_len == CMSG_LEN(sizeof(struct ucred))) {
+                         assert(!ucred);
+-                        ucred = (struct ucred*) CMSG_DATA(cmsg);
++                        ucred = CMSG_TYPED_DATA(cmsg, struct ucred);
+                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
+                          cmsg->cmsg_type == SCM_SECURITY) {
+                         assert(!label);
+-                        label = (char*) CMSG_DATA(cmsg);
++                        label = CMSG_TYPED_DATA(cmsg, char);
+                         label_len = cmsg->cmsg_len - CMSG_LEN(0);
+                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
+                            cmsg->cmsg_type == SO_TIMESTAMP &&
+                            cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval))) {
+                         assert(!tv);
+-                        tv = (struct timeval*) CMSG_DATA(cmsg);
++                        tv = CMSG_TYPED_DATA(cmsg, struct timeval);
+                 } else if (cmsg->cmsg_level == SOL_SOCKET &&
+                          cmsg->cmsg_type == SCM_RIGHTS) {
+                         assert(!fds);
+-                        fds = (int*) CMSG_DATA(cmsg);
++                        fds = CMSG_TYPED_DATA(cmsg, int);
+                         n_fds = (cmsg->cmsg_len - CMSG_LEN(0)) / sizeof(int);
+                 }
+ 
+--- a/src/libsystemd-network/icmp6-util.c
++++ b/src/libsystemd-network/icmp6-util.c
+@@ -192,7 +192,7 @@ int icmp6_receive(int fd, void *buffer,
+                 if (cmsg->cmsg_level == SOL_IPV6 &&
+                     cmsg->cmsg_type == IPV6_HOPLIMIT &&
+                     cmsg->cmsg_len == CMSG_LEN(sizeof(int))) {
+-                        int hops = *(int*) CMSG_DATA(cmsg);
++                        int hops = *CMSG_TYPED_DATA(cmsg, int);
+ 
+                         if (hops != 255)
+                                 return -EMULTIHOP;
+@@ -201,7 +201,7 @@ int icmp6_receive(int fd, void *buffer,
+                 if (cmsg->cmsg_level == SOL_SOCKET &&
+                     cmsg->cmsg_type == SO_TIMESTAMP &&
+                     cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval)))
+-                        triple_timestamp_from_realtime(&t, timeval_load((struct timeval*) CMSG_DATA(cmsg)));
++                        triple_timestamp_from_realtime(&t, timeval_load(CMSG_TYPED_DATA(cmsg, struct timeval)));
+         }
+ 
+         if (!triple_timestamp_is_set(&t))
+--- a/src/libsystemd-network/sd-dhcp-client.c
++++ b/src/libsystemd-network/sd-dhcp-client.c
+@@ -1981,7 +1981,7 @@ static int client_receive_message_raw(
+ 
+         cmsg = cmsg_find(&msg, SOL_PACKET, PACKET_AUXDATA, CMSG_LEN(sizeof(struct tpacket_auxdata)));
+         if (cmsg) {
+-                struct tpacket_auxdata *aux = (struct tpacket_auxdata*) CMSG_DATA(cmsg);
++                struct tpacket_auxdata *aux = CMSG_TYPED_DATA(cmsg, struct tpacket_auxdata);
+                 checksum = !(aux->tp_status & TP_STATUS_CSUMNOTREADY);
+         }
+ 
+--- a/src/libsystemd-network/sd-dhcp-server.c
++++ b/src/libsystemd-network/sd-dhcp-server.c
+@@ -1310,7 +1310,7 @@ static int server_receive_message(sd_eve
+                 if (cmsg->cmsg_level == IPPROTO_IP &&
+                     cmsg->cmsg_type == IP_PKTINFO &&
+                     cmsg->cmsg_len == CMSG_LEN(sizeof(struct in_pktinfo))) {
+-                        struct in_pktinfo *info = (struct in_pktinfo*)CMSG_DATA(cmsg);
++                        struct in_pktinfo *info = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
+ 
+                         /* TODO figure out if this can be done as a filter on
+                          * the socket, like for IPv6 */
+--- a/src/libsystemd/sd-bus/bus-socket.c
++++ b/src/libsystemd/sd-bus/bus-socket.c
+@@ -604,7 +604,7 @@ static int bus_socket_read_auth(sd_bus *
+                                  * protocol? Somebody is playing games with
+                                  * us. Close them all, and fail */
+                                 j = (cmsg->cmsg_len - CMSG_LEN(0)) / sizeof(int);
+-                                close_many((int*) CMSG_DATA(cmsg), j);
++                                close_many(CMSG_TYPED_DATA(cmsg, int), j);
+                                 return -EIO;
+                         } else
+                                 log_debug("Got unexpected auxiliary data with level=%d and type=%d",
+@@ -1270,18 +1270,18 @@ int bus_socket_read_message(sd_bus *bus)
+                                          * isn't actually enabled? Close them,
+                                          * and fail */
+ 
+-                                        close_many((int*) CMSG_DATA(cmsg), n);
++                                        close_many(CMSG_TYPED_DATA(cmsg, int), n);
+                                         return -EIO;
+                                 }
+ 
+                                 f = reallocarray(bus->fds, bus->n_fds + n, sizeof(int));
+                                 if (!f) {
+-                                        close_many((int*) CMSG_DATA(cmsg), n);
++                                        close_many(CMSG_TYPED_DATA(cmsg, int), n);
+                                         return -ENOMEM;
+                                 }
+ 
+                                 for (i = 0; i < n; i++)
+-                                        f[bus->n_fds++] = fd_move_above_stdio(((int*) CMSG_DATA(cmsg))[i]);
++                                        f[bus->n_fds++] = fd_move_above_stdio(CMSG_TYPED_DATA(cmsg, int)[i]);
+                                 bus->fds = f;
+                         } else
+                                 log_debug("Got unexpected auxiliary data with level=%d and type=%d",
+--- a/src/resolve/resolved-dns-stream.c
++++ b/src/resolve/resolved-dns-stream.c
+@@ -147,7 +147,7 @@ static int dns_stream_identify(DnsStream
+                         switch (cmsg->cmsg_type) {
+ 
+                         case IPV6_PKTINFO: {
+-                                struct in6_pktinfo *i = (struct in6_pktinfo*) CMSG_DATA(cmsg);
++                                struct in6_pktinfo *i = CMSG_TYPED_DATA(cmsg, struct in6_pktinfo);
+ 
+                                 if (s->ifindex <= 0)
+                                         s->ifindex = i->ipi6_ifindex;
+@@ -155,7 +155,7 @@ static int dns_stream_identify(DnsStream
+                         }
+ 
+                         case IPV6_HOPLIMIT:
+-                                s->ttl = *(int *) CMSG_DATA(cmsg);
++                                s->ttl = *CMSG_TYPED_DATA(cmsg, int);
+                                 break;
+                         }
+ 
+@@ -165,7 +165,7 @@ static int dns_stream_identify(DnsStream
+                         switch (cmsg->cmsg_type) {
+ 
+                         case IP_PKTINFO: {
+-                                struct in_pktinfo *i = (struct in_pktinfo*) CMSG_DATA(cmsg);
++                                struct in_pktinfo *i = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
+ 
+                                 if (s->ifindex <= 0)
+                                         s->ifindex = i->ipi_ifindex;
+@@ -173,7 +173,7 @@ static int dns_stream_identify(DnsStream
+                         }
+ 
+                         case IP_TTL:
+-                                s->ttl = *(int *) CMSG_DATA(cmsg);
++                                s->ttl = *CMSG_TYPED_DATA(cmsg, int);
+                                 break;
+                         }
+                 }
+--- a/src/resolve/resolved-manager.c
++++ b/src/resolve/resolved-manager.c
+@@ -801,7 +801,7 @@ int manager_recv(Manager *m, int fd, Dns
+                         switch (cmsg->cmsg_type) {
+ 
+                         case IPV6_PKTINFO: {
+-                                struct in6_pktinfo *i = (struct in6_pktinfo*) CMSG_DATA(cmsg);
++                                struct in6_pktinfo *i = CMSG_TYPED_DATA(cmsg, struct in6_pktinfo);
+ 
+                                 if (p->ifindex <= 0)
+                                         p->ifindex = i->ipi6_ifindex;
+@@ -811,11 +811,11 @@ int manager_recv(Manager *m, int fd, Dns
+                         }
+ 
+                         case IPV6_HOPLIMIT:
+-                                p->ttl = *(int *) CMSG_DATA(cmsg);
++                                p->ttl = *CMSG_TYPED_DATA(cmsg, int);
+                                 break;
+ 
+                         case IPV6_RECVFRAGSIZE:
+-                                p->fragsize = *(int *) CMSG_DATA(cmsg);
++                                p->fragsize = *CMSG_TYPED_DATA(cmsg, int);
+                                 break;
+                         }
+                 } else if (cmsg->cmsg_level == IPPROTO_IP) {
+@@ -824,7 +824,7 @@ int manager_recv(Manager *m, int fd, Dns
+                         switch (cmsg->cmsg_type) {
+ 
+                         case IP_PKTINFO: {
+-                                struct in_pktinfo *i = (struct in_pktinfo*) CMSG_DATA(cmsg);
++                                struct in_pktinfo *i = CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
+ 
+                                 if (p->ifindex <= 0)
+                                         p->ifindex = i->ipi_ifindex;
+@@ -834,11 +834,11 @@ int manager_recv(Manager *m, int fd, Dns
+                         }
+ 
+                         case IP_TTL:
+-                                p->ttl = *(int *) CMSG_DATA(cmsg);
++                                p->ttl = *CMSG_TYPED_DATA(cmsg, int);
+                                 break;
+ 
+                         case IP_RECVFRAGSIZE:
+-                                p->fragsize = *(int *) CMSG_DATA(cmsg);
++                                p->fragsize = *CMSG_TYPED_DATA(cmsg, int);
+                                 break;
+                         }
+                 }
+--- a/src/libsystemd/sd-device/device-monitor.c
++++ b/src/libsystemd/sd-device/device-monitor.c
+@@ -503,7 +503,6 @@ int device_monitor_receive_device(sd_dev
+                 .msg_name = &snl,
+                 .msg_namelen = sizeof(snl),
+         };
+-        struct cmsghdr *cmsg;
+         struct ucred *cred;
+         size_t offset;
+         ssize_t n;
+@@ -559,12 +558,11 @@ int device_monitor_receive_device(sd_dev
+                                                  snl.nl.nl_pid);
+         }
+ 
+-        cmsg = CMSG_FIRSTHDR(&smsg);
+-        if (!cmsg || cmsg->cmsg_type != SCM_CREDENTIALS)
++        cred = CMSG_FIND_DATA(&smsg, SOL_SOCKET, SCM_CREDENTIALS, struct ucred);
++        if (!cred)
+                 return log_monitor_errno(m, SYNTHETIC_ERRNO(EAGAIN),
+                                          "No sender credentials received, ignoring message.");
+ 
+-        cred = (struct ucred*) CMSG_DATA(cmsg);
+         if (!check_sender_uid(m, cred->uid))
+                 return log_monitor_errno(m, SYNTHETIC_ERRNO(EAGAIN),
+                                          "Sender uid="UID_FMT", message ignored.", cred->uid);
+--- a/src/udev/udev-ctrl.c
++++ b/src/udev/udev-ctrl.c
+@@ -161,7 +161,6 @@ static int udev_ctrl_connection_event_ha
+                 .msg_control = &control,
+                 .msg_controllen = sizeof(control),
+         };
+-        struct cmsghdr *cmsg;
+         struct ucred *cred;
+         ssize_t size;
+ 
+@@ -185,15 +184,12 @@ static int udev_ctrl_connection_event_ha
+ 
+         cmsg_close_all(&smsg);
+ 
+-        cmsg = CMSG_FIRSTHDR(&smsg);
+-
+-        if (!cmsg || cmsg->cmsg_type != SCM_CREDENTIALS) {
++        cred = CMSG_FIND_DATA(&smsg, SOL_SOCKET, SCM_CREDENTIALS, struct ucred);
++        if (!cred) {
+                 log_error("No sender credentials received, ignoring message");
+                 return 0;
+         }
+ 
+-        cred = (struct ucred *) CMSG_DATA(cmsg);
+-
+         if (cred->uid != 0) {
+                 log_error("Invalid sender uid "UID_FMT", ignoring message", cred->uid);
+                 return 0;
diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core/systemd/systemd_253.3.bb
index 26a1efc1d1..09432f9192 100644
--- a/meta/recipes-core/systemd/systemd_253.3.bb
+++ b/meta/recipes-core/systemd/systemd_253.3.bb
@@ -25,6 +25,8 @@ SRC_URI += " \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
            file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
+           file://27254.patch \
+           file://27253.patch \
            "
 
 # patches needed by musl
-- 
2.40.1


