Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64826C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 13:57:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53452.1724680626244656231
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 06:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8968701cd6=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q5KXW6009129
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 06:57:06 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1k9k18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 06:57:05 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 06:57:04 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 06:57:03 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/1] qemu: fix CVE-2024-7409
Date: Mon, 26 Aug 2024 13:57:02 +0000
Message-ID: <20240826135702.3956243-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: B39hloVjSXMi5LEAAjuPBsPqKAVGBsLn
X-Authority-Analysis: v=2.4 cv=McQ+uI/f c=1 sm=1 tr=0 ts=66cc89b1 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=ID6ng7r3AAAA:8 a=20KFwNOVAAAA:8 a=6R7veym_AAAA:8 a=NEAV23lmAAAA:8
 a=p0WdMEafAAAA:8 a=TYBLyS7eAAAA:8 a=69wJf7TsAAAA:8 a=INz7Y_WmDyEQKF96OXMA:9 a=vhQ4YlEGRr9AivtB:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=AkheI1RvQwOzcTXhi5f4:22 a=ILCOIF4F_8SzUMnO7jNM:22 a=zvYvwCWiE4KgVXXeO06c:22
 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-GUID: B39hloVjSXMi5LEAAjuPBsPqKAVGBsLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_10,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408260107
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47Q5KXW6009129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 13:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203753

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the QEMU NBD Server. This vulnerability allows a deni=
al of service (DoS) attack
via improper synchronization during socket closure when a client keeps a =
socket open as the server
is taken offline.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   4 +
 .../qemu/qemu/CVE-2024-7409-0001.patch        | 167 +++++++++++++++++
 .../qemu/qemu/CVE-2024-7409-0002.patch        | 175 ++++++++++++++++++
 .../qemu/qemu/CVE-2024-7409-0003.patch        | 126 +++++++++++++
 .../qemu/qemu/CVE-2024-7409-0004.patch        | 164 ++++++++++++++++
 5 files changed, 636 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.pa=
tch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 50d92b04bd..a1d8a309a0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -45,6 +45,10 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
            file://CVE-2024-4467-0003.patch \
            file://CVE-2024-4467-0004.patch \
            file://CVE-2024-4467-0005.patch \
+           file://CVE-2024-7409-0001.patch \
+           file://CVE-2024-7409-0002.patch \
+           file://CVE-2024-7409-0003.patch \
+           file://CVE-2024-7409-0004.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
new file mode 100644
index 0000000000..631e93a6d2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
@@ -0,0 +1,167 @@
+From fb1c2aaa981e0a2fa6362c9985f1296b74f055ac Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Wed, 7 Aug 2024 08:50:01 -0500
+Subject: [PATCH] nbd/server: Plumb in new args to nbd_client_add()
+
+Upcoming patches to fix a CVE need to track an opaque pointer passed
+in by the owner of a client object, as well as request for a time
+limit on how fast negotiation must complete.  Prepare for that by
+changing the signature of nbd_client_new() and adding an accessor to
+get at the opaque pointer, although for now the two servers
+(qemu-nbd.c and blockdev-nbd.c) do not change behavior even though
+they pass in a new default timeout value.
+
+Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
+Signed-off-by: Eric Blake <eblake@redhat.com>
+Message-ID: <20240807174943.771624-11-eblake@redhat.com>
+Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+[eblake: s/LIMIT/MAX_SECS/ as suggested by Dan]
+Signed-off-by: Eric Blake <eblake@redhat.com>
+
+CVE: CVE-2024-7409
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/fb1c2aaa9=
81e0a2fa6362c9985f1296b74f055ac]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ blockdev-nbd.c      |  6 ++++--
+ include/block/nbd.h | 11 ++++++++++-
+ nbd/server.c        | 20 +++++++++++++++++---
+ qemu-nbd.c          |  4 +++-
+ 4 files changed, 34 insertions(+), 7 deletions(-)
+
+diff --git a/blockdev-nbd.c b/blockdev-nbd.c
+index 213012435..267a1de90 100644
+--- a/blockdev-nbd.c
++++ b/blockdev-nbd.c
+@@ -64,8 +64,10 @@ static void nbd_accept(QIONetListener *listener, QIOC=
hannelSocket *cioc,
+     nbd_update_server_watch(nbd_server);
+
+     qio_channel_set_name(QIO_CHANNEL(cioc), "nbd-server");
+-    nbd_client_new(cioc, nbd_server->tlscreds, nbd_server->tlsauthz,
+-                   nbd_blockdev_client_closed);
++    /* TODO - expose handshake timeout as QMP option */
++    nbd_client_new(cioc, NBD_DEFAULT_HANDSHAKE_MAX_SECS,
++                   nbd_server->tlscreds, nbd_server->tlsauthz,
++                   nbd_blockdev_client_closed, NULL);
+ }
+
+ static void nbd_update_server_watch(NBDServerData *s)
+diff --git a/include/block/nbd.h b/include/block/nbd.h
+index 4e7bd6342..1d4d65922 100644
+--- a/include/block/nbd.h
++++ b/include/block/nbd.h
+@@ -33,6 +33,12 @@ typedef struct NBDMetaContexts NBDMetaContexts;
+
+ extern const BlockExportDriver blk_exp_nbd;
+
++/*
++ * NBD_DEFAULT_HANDSHAKE_MAX_SECS: Number of seconds in which client mu=
st
++ * succeed at NBD_OPT_GO before being forcefully dropped as too slow.
++ */
++#define NBD_DEFAULT_HANDSHAKE_MAX_SECS 10
++
+ /* Handshake phase structs - this struct is passed on the wire */
+
+ typedef struct NBDOption {
+@@ -403,9 +409,12 @@ AioContext *nbd_export_aio_context(NBDExport *exp);
+ NBDExport *nbd_export_find(const char *name);
+
+ void nbd_client_new(QIOChannelSocket *sioc,
++                    uint32_t handshake_max_secs,
+                     QCryptoTLSCreds *tlscreds,
+                     const char *tlsauthz,
+-                    void (*close_fn)(NBDClient *, bool));
++                    void (*close_fn)(NBDClient *, bool),
++                    void *owner);
++void *nbd_client_owner(NBDClient *client);
+ void nbd_client_get(NBDClient *client);
+ void nbd_client_put(NBDClient *client);
+
+diff --git a/nbd/server.c b/nbd/server.c
+index 091b57119..f8881936e 100644
+--- a/nbd/server.c
++++ b/nbd/server.c
+@@ -124,12 +124,14 @@ struct NBDMetaContexts {
+ struct NBDClient {
+     int refcount; /* atomic */
+     void (*close_fn)(NBDClient *client, bool negotiated);
++    void *owner;
+
+     QemuMutex lock;
+
+     NBDExport *exp;
+     QCryptoTLSCreds *tlscreds;
+     char *tlsauthz;
++    uint32_t handshake_max_secs;
+     QIOChannelSocket *sioc; /* The underlying data channel */
+     QIOChannel *ioc; /* The current I/O channel which may differ (eg TL=
S) */
+
+@@ -3160,6 +3162,7 @@ static coroutine_fn void nbd_co_client_start(void =
*opaque)
+
+     qemu_co_mutex_init(&client->send_lock);
+
++    /* TODO - utilize client->handshake_max_secs */
+     if (nbd_negotiate(client, &local_err)) {
+         if (local_err) {
+             error_report_err(local_err);
+@@ -3174,14 +3177,17 @@ static coroutine_fn void nbd_co_client_start(voi=
d *opaque)
+ }
+
+ /*
+- * Create a new client listener using the given channel @sioc.
++ * Create a new client listener using the given channel @sioc and @owne=
r.
+  * Begin servicing it in a coroutine.  When the connection closes, call
+- * @close_fn with an indication of whether the client completed negotia=
tion.
++ * @close_fn with an indication of whether the client completed negotia=
tion
++ * within @handshake_max_secs seconds (0 for unbounded).
+  */
+ void nbd_client_new(QIOChannelSocket *sioc,
++                    uint32_t handshake_max_secs,
+                     QCryptoTLSCreds *tlscreds,
+                     const char *tlsauthz,
+-                    void (*close_fn)(NBDClient *, bool))
++                    void (*close_fn)(NBDClient *, bool),
++                    void *owner)
+ {
+     NBDClient *client;
+     Coroutine *co;
+@@ -3194,13 +3200,21 @@ void nbd_client_new(QIOChannelSocket *sioc,
+         object_ref(OBJECT(client->tlscreds));
+     }
+     client->tlsauthz =3D g_strdup(tlsauthz);
++    client->handshake_max_secs =3D handshake_max_secs;
+     client->sioc =3D sioc;
+     qio_channel_set_delay(QIO_CHANNEL(sioc), false);
+     object_ref(OBJECT(client->sioc));
+     client->ioc =3D QIO_CHANNEL(sioc);
+     object_ref(OBJECT(client->ioc));
+     client->close_fn =3D close_fn;
++    client->owner =3D owner;
+
+     co =3D qemu_coroutine_create(nbd_co_client_start, client);
+     qemu_coroutine_enter(co);
+ }
++
++void *
++nbd_client_owner(NBDClient *client)
++{
++    return client->owner;
++}
+diff --git a/qemu-nbd.c b/qemu-nbd.c
+index 186e6468b..5fa399c0b 100644
+--- a/qemu-nbd.c
++++ b/qemu-nbd.c
+@@ -389,7 +389,9 @@ static void nbd_accept(QIONetListener *listener, QIO=
ChannelSocket *cioc,
+
+     nb_fds++;
+     nbd_update_server_watch();
+-    nbd_client_new(cioc, tlscreds, tlsauthz, nbd_client_closed);
++    /* TODO - expose handshake timeout as command line option */
++    nbd_client_new(cioc, NBD_DEFAULT_HANDSHAKE_MAX_SECS,
++                   tlscreds, tlsauthz, nbd_client_closed, NULL);
+ }
+
+ static void nbd_update_server_watch(void)
+--
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.patch
new file mode 100644
index 0000000000..ca8ef0b44d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.patch
@@ -0,0 +1,175 @@
+From c8a76dbd90c2f48df89b75bef74917f90a59b623 Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Tue, 6 Aug 2024 13:53:00 -0500
+Subject: [PATCH] nbd/server: CVE-2024-7409: Cap default max-connections =
to 100
+
+Allowing an unlimited number of clients to any web service is a recipe
+for a rudimentary denial of service attack: the client merely needs to
+open lots of sockets without closing them, until qemu no longer has
+any more fds available to allocate.
+
+For qemu-nbd, we default to allowing only 1 connection unless more are
+explicitly asked for (-e or --shared); this was historically picked as
+a nice default (without an explicit -t, a non-persistent qemu-nbd goes
+away after a client disconnects, without needing any additional
+follow-up commands), and we are not going to change that interface now
+(besides, someday we want to point people towards qemu-storage-daemon
+instead of qemu-nbd).
+
+But for qemu proper, and the newer qemu-storage-daemon, the QMP
+nbd-server-start command has historically had a default of unlimited
+number of connections, in part because unlike qemu-nbd it is
+inherently persistent until nbd-server-stop.  Allowing multiple client
+sockets is particularly useful for clients that can take advantage of
+MULTI_CONN (creating parallel sockets to increase throughput),
+although known clients that do so (such as libnbd's nbdcopy) typically
+use only 8 or 16 connections (the benefits of scaling diminish once
+more sockets are competing for kernel attention).  Picking a number
+large enough for typical use cases, but not unlimited, makes it
+slightly harder for a malicious client to perform a denial of service
+merely by opening lots of connections withot progressing through the
+handshake.
+
+This change does not eliminate CVE-2024-7409 on its own, but reduces
+the chance for fd exhaustion or unlimited memory usage as an attack
+surface.  On the other hand, by itself, it makes it more obvious that
+with a finite limit, we have the problem of an unauthenticated client
+holding 100 fds opened as a way to block out a legitimate client from
+being able to connect; thus, later patches will further add timeouts
+to reject clients that are not making progress.
+
+This is an INTENTIONAL change in behavior, and will break any client
+of nbd-server-start that was not passing an explicit max-connections
+parameter, yet expects more than 100 simultaneous connections.  We are
+not aware of any such client (as stated above, most clients aware of
+MULTI_CONN get by just fine on 8 or 16 connections, and probably cope
+with later connections failing by relying on the earlier connections;
+libvirt has not yet been passing max-connections, but generally
+creates NBD servers with the intent for a single client for the sake
+of live storage migration; meanwhile, the KubeSAN project anticipates
+a large cluster sharing multiple clients [up to 8 per node, and up to
+100 nodes in a cluster], but it currently uses qemu-nbd with an
+explicit --shared=3D0 rather than qemu-storage-daemon with
+nbd-server-start).
+
+We considered using a deprecation period (declare that omitting
+max-parameters is deprecated, and make it mandatory in 3 releases -
+then we don't need to pick an arbitrary default); that has zero risk
+of breaking any apps that accidentally depended on more than 100
+connections, and where such breakage might not be noticed under unit
+testing but only under the larger loads of production usage.  But it
+does not close the denial-of-service hole until far into the future,
+and requires all apps to change to add the parameter even if 100 was
+good enough.  It also has a drawback that any app (like libvirt) that
+is accidentally relying on an unlimited default should seriously
+consider their own CVE now, at which point they are going to change to
+pass explicit max-connections sooner than waiting for 3 qemu releases.
+Finally, if our changed default breaks an app, that app can always
+pass in an explicit max-parameters with a larger value.
+
+It is also intentional that the HMP interface to nbd-server-start is
+not changed to expose max-connections (any client needing to fine-tune
+things should be using QMP).
+
+Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+Signed-off-by: Eric Blake <eblake@redhat.com>
+Message-ID: <20240807174943.771624-12-eblake@redhat.com>
+Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+[ericb: Expand commit message to summarize Dan's argument for why we
+break corner-case back-compat behavior without a deprecation period]
+Signed-off-by: Eric Blake <eblake@redhat.com>
+
+CVE: CVE-2024-7409
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/c8a76dbd9=
0c2f48df89b75bef74917f90a59b623]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ block/monitor/block-hmp-cmds.c | 3 ++-
+ blockdev-nbd.c                 | 8 ++++++++
+ include/block/nbd.h            | 7 +++++++
+ qapi/block-export.json         | 4 ++--
+ 4 files changed, 19 insertions(+), 3 deletions(-)
+
+diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cm=
ds.c
+index c729cbf1e..78a697585 100644
+--- a/block/monitor/block-hmp-cmds.c
++++ b/block/monitor/block-hmp-cmds.c
+@@ -415,7 +415,8 @@ void hmp_nbd_server_start(Monitor *mon, const QDict =
*qdict)
+         goto exit;
+     }
+
+-    nbd_server_start(addr, NULL, NULL, 0, &local_err);
++    nbd_server_start(addr, NULL, NULL, NBD_DEFAULT_MAX_CONNECTIONS,
++                     &local_err);
+     qapi_free_SocketAddress(addr);
+     if (local_err !=3D NULL) {
+         goto exit;
+diff --git a/blockdev-nbd.c b/blockdev-nbd.c
+index 267a1de90..24ba5382d 100644
+--- a/blockdev-nbd.c
++++ b/blockdev-nbd.c
+@@ -170,6 +170,10 @@ void nbd_server_start(SocketAddress *addr, const ch=
ar *tls_creds,
+
+ void nbd_server_start_options(NbdServerOptions *arg, Error **errp)
+ {
++    if (!arg->has_max_connections) {
++        arg->max_connections =3D NBD_DEFAULT_MAX_CONNECTIONS;
++    }
++
+     nbd_server_start(arg->addr, arg->tls_creds, arg->tls_authz,
+                      arg->max_connections, errp);
+ }
+@@ -182,6 +186,10 @@ void qmp_nbd_server_start(SocketAddressLegacy *addr=
,
+ {
+     SocketAddress *addr_flat =3D socket_address_flatten(addr);
+
++    if (!has_max_connections) {
++        max_connections =3D NBD_DEFAULT_MAX_CONNECTIONS;
++    }
++
+     nbd_server_start(addr_flat, tls_creds, tls_authz, max_connections, =
errp);
+     qapi_free_SocketAddress(addr_flat);
+ }
+diff --git a/include/block/nbd.h b/include/block/nbd.h
+index 1d4d65922..d4f8b21ae 100644
+--- a/include/block/nbd.h
++++ b/include/block/nbd.h
+@@ -39,6 +39,13 @@ extern const BlockExportDriver blk_exp_nbd;
+  */
+ #define NBD_DEFAULT_HANDSHAKE_MAX_SECS 10
+
++/*
++ * NBD_DEFAULT_MAX_CONNECTIONS: Number of client sockets to allow at
++ * once; must be large enough to allow a MULTI_CONN-aware client like
++ * nbdcopy to create its typical number of 8-16 sockets.
++ */
++#define NBD_DEFAULT_MAX_CONNECTIONS 100
++
+ /* Handshake phase structs - this struct is passed on the wire */
+
+ typedef struct NBDOption {
+diff --git a/qapi/block-export.json b/qapi/block-export.json
+index 7874a49ba..1d255d77e 100644
+--- a/qapi/block-export.json
++++ b/qapi/block-export.json
+@@ -28,7 +28,7 @@
+ # @max-connections: The maximum number of connections to allow at the
+ #     same time, 0 for unlimited.  Setting this to 1 also stops the
+ #     server from advertising multiple client support (since 5.2;
+-#     default: 0)
++#     default: 100)
+ #
+ # Since: 4.2
+ ##
+@@ -63,7 +63,7 @@
+ # @max-connections: The maximum number of connections to allow at the
+ #     same time, 0 for unlimited.  Setting this to 1 also stops the
+ #     server from advertising multiple client support (since 5.2;
+-#     default: 0).
++#     default: 100).
+ #
+ # Returns: error if the server is already running.
+ #
+--
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.patch
new file mode 100644
index 0000000000..b2b9b15c54
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.patch
@@ -0,0 +1,126 @@
+From b9b72cb3ce15b693148bd09cef7e50110566d8a0 Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Thu, 8 Aug 2024 16:05:08 -0500
+Subject: [PATCH] nbd/server: CVE-2024-7409: Drop non-negotiating clients
+
+A client that opens a socket but does not negotiate is merely hogging
+qemu's resources (an open fd and a small amount of memory); and a
+malicious client that can access the port where NBD is listening can
+attempt a denial of service attack by intentionally opening and
+abandoning lots of unfinished connections.  The previous patch put a
+default bound on the number of such ongoing connections, but once that
+limit is hit, no more clients can connect (including legitimate ones).
+The solution is to insist that clients complete handshake within a
+reasonable time limit, defaulting to 10 seconds.  A client that has
+not successfully completed NBD_OPT_GO by then (including the case of
+where the client didn't know TLS credentials to even reach the point
+of NBD_OPT_GO) is wasting our time and does not deserve to stay
+connected.  Later patches will allow fine-tuning the limit away from
+the default value (including disabling it for doing integration
+testing of the handshake process itself).
+
+Note that this patch in isolation actually makes it more likely to see
+qemu SEGV after nbd-server-stop, as any client socket still connected
+when the server shuts down will now be closed after 10 seconds rather
+than at the client's whims.  That will be addressed in the next patch.
+
+For a demo of this patch in action:
+$ qemu-nbd -f raw -r -t -e 10 file &
+$ nbdsh --opt-mode -c '
+H =3D list()
+for i in range(20):
+  print(i)
+  H.insert(i, nbd.NBD())
+  H[i].set_opt_mode(True)
+  H[i].connect_uri("nbd://localhost")
+'
+$ kill $!
+
+where later connections get to start progressing once earlier ones are
+forcefully dropped for taking too long, rather than hanging.
+
+Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+Signed-off-by: Eric Blake <eblake@redhat.com>
+Message-ID: <20240807174943.771624-13-eblake@redhat.com>
+Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+[eblake: rebase to changes earlier in series, reduce scope of timer]
+Signed-off-by: Eric Blake <eblake@redhat.com>
+
+CVE: CVE-2024-7409
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/b9b72cb3ce15b693148bd09cef7e50110566d8a0]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ nbd/server.c     | 28 +++++++++++++++++++++++++++-
+ nbd/trace-events |  1 +
+ 2 files changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/nbd/server.c b/nbd/server.c
+index f8881936e..6155e329a 100644
+--- a/nbd/server.c
++++ b/nbd/server.c
+@@ -3155,22 +3155,48 @@ static void nbd_client_receive_next_request(NBDC=
lient *client)
+     }
+ }
+
++static void nbd_handshake_timer_cb(void *opaque)
++{
++    QIOChannel *ioc =3D opaque;
++
++    trace_nbd_handshake_timer_cb();
++    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
++}
++
+ static coroutine_fn void nbd_co_client_start(void *opaque)
+ {
+     NBDClient *client =3D opaque;
+     Error *local_err =3D NULL;
++    QEMUTimer *handshake_timer =3D NULL;
+
+     qemu_co_mutex_init(&client->send_lock);
+
+-    /* TODO - utilize client->handshake_max_secs */
++    /*
++     * Create a timer to bound the time spent in negotiation. If the
++     * timer expires, it is likely nbd_negotiate will fail because the
++     * socket was shutdown.
++     */
++    if (client->handshake_max_secs > 0) {
++        handshake_timer =3D aio_timer_new(qemu_get_aio_context(),
++                                        QEMU_CLOCK_REALTIME,
++                                        SCALE_NS,
++                                        nbd_handshake_timer_cb,
++                                        client->sioc);
++        timer_mod(handshake_timer,
++                  qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
++                  client->handshake_max_secs * NANOSECONDS_PER_SECOND);
++    }
++
+     if (nbd_negotiate(client, &local_err)) {
+         if (local_err) {
+             error_report_err(local_err);
+         }
++        timer_free(handshake_timer);
+         client_close(client, false);
+         return;
+     }
+
++    timer_free(handshake_timer);
+     WITH_QEMU_LOCK_GUARD(&client->lock) {
+         nbd_client_receive_next_request(client);
+     }
+diff --git a/nbd/trace-events b/nbd/trace-events
+index 00ae3216a..cbd0a4ab7 100644
+--- a/nbd/trace-events
++++ b/nbd/trace-events
+@@ -76,6 +76,7 @@ nbd_co_receive_request_payload_received(uint64_t cooki=
e, uint64_t len) "Payload
+ nbd_co_receive_ext_payload_compliance(uint64_t from, uint64_t len) "cli=
ent sent non-compliant write without payload flag: from=3D0x%" PRIx64 ", =
len=3D0x%" PRIx64
+ nbd_co_receive_align_compliance(const char *op, uint64_t from, uint64_t=
 len, uint32_t align) "client sent non-compliant unaligned %s request: fr=
om=3D0x%" PRIx64 ", len=3D0x%" PRIx64 ", align=3D0x%" PRIx32
+ nbd_trip(void) "Reading request"
++nbd_handshake_timer_cb(void) "client took too long to negotiate"
+
+ # client-connection.c
+ nbd_connect_thread_sleep(uint64_t timeout) "timeout %" PRIu64
+--
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.patch
new file mode 100644
index 0000000000..9515c631ad
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.patch
@@ -0,0 +1,164 @@
+From 3e7ef738c8462c45043a1d39f702a0990406a3b3 Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Wed, 7 Aug 2024 12:23:13 -0500
+Subject: [PATCH] nbd/server: CVE-2024-7409: Close stray clients at serve=
r-stop
+
+A malicious client can attempt to connect to an NBD server, and then
+intentionally delay progress in the handshake, including if it does
+not know the TLS secrets.  Although the previous two patches reduce
+this behavior by capping the default max-connections parameter and
+killing slow clients, they did not eliminate the possibility of a
+client waiting to close the socket until after the QMP nbd-server-stop
+command is executed, at which point qemu would SEGV when trying to
+dereference the NULL nbd_server global which is no longer present.
+This amounts to a denial of service attack.  Worse, if another NBD
+server is started before the malicious client disconnects, I cannot
+rule out additional adverse effects when the old client interferes
+with the connection count of the new server (although the most likely
+is a crash due to an assertion failure when checking
+nbd_server->connections > 0).
+
+For environments without this patch, the CVE can be mitigated by
+ensuring (such as via a firewall) that only trusted clients can
+connect to an NBD server.  Note that using frameworks like libvirt
+that ensure that TLS is used and that nbd-server-stop is not executed
+while any trusted clients are still connected will only help if there
+is also no possibility for an untrusted client to open a connection
+but then stall on the NBD handshake.
+
+Given the previous patches, it would be possible to guarantee that no
+clients remain connected by having nbd-server-stop sleep for longer
+than the default handshake deadline before finally freeing the global
+nbd_server object, but that could make QMP non-responsive for a long
+time.  So intead, this patch fixes the problem by tracking all client
+sockets opened while the server is running, and forcefully closing any
+such sockets remaining without a completed handshake at the time of
+nbd-server-stop, then waiting until the coroutines servicing those
+sockets notice the state change.  nbd-server-stop now has a second
+AIO_WAIT_WHILE_UNLOCKED (the first is indirectly through the
+blk_exp_close_all_type() that disconnects all clients that completed
+handshakes), but forced socket shutdown is enough to progress the
+coroutines and quickly tear down all clients before the server is
+freed, thus finally fixing the CVE.
+
+This patch relies heavily on the fact that nbd/server.c guarantees
+that it only calls nbd_blockdev_client_closed() from the main loop
+(see the assertion in nbd_client_put() and the hoops used in
+nbd_client_put_nonzero() to achieve that); if we did not have that
+guarantee, we would also need a mutex protecting our accesses of the
+list of connections to survive re-entrancy from independent iothreads.
+
+Although I did not actually try to test old builds, it looks like this
+problem has existed since at least commit 862172f45c (v2.12.0, 2017) -
+even back when that patch started using a QIONetListener to handle
+listening on multiple sockets, nbd_server_free() was already unaware
+that the nbd_blockdev_client_closed callback can be reached later by a
+client thread that has not completed handshakes (and therefore the
+client's socket never got added to the list closed in
+nbd_export_close_all), despite that patch intentionally tearing down
+the QIONetListener to prevent new clients.
+
+Reported-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
+Fixes: CVE-2024-7409
+CC: qemu-stable@nongnu.org
+Signed-off-by: Eric Blake <eblake@redhat.com>
+Message-ID: <20240807174943.771624-14-eblake@redhat.com>
+Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+
+CVE: CVE-2024-7409
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/3e7ef738c8462c45043a1d39f702a0990406a3b3]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ blockdev-nbd.c | 35 ++++++++++++++++++++++++++++++++++-
+ 1 file changed, 34 insertions(+), 1 deletion(-)
+
+diff --git a/blockdev-nbd.c b/blockdev-nbd.c
+index 24ba5382d..f73409ae4 100644
+--- a/blockdev-nbd.c
++++ b/blockdev-nbd.c
+@@ -21,12 +21,18 @@
+ #include "io/channel-socket.h"
+ #include "io/net-listener.h"
+
++typedef struct NBDConn {
++    QIOChannelSocket *cioc;
++    QLIST_ENTRY(NBDConn) next;
++} NBDConn;
++
+ typedef struct NBDServerData {
+     QIONetListener *listener;
+     QCryptoTLSCreds *tlscreds;
+     char *tlsauthz;
+     uint32_t max_connections;
+     uint32_t connections;
++    QLIST_HEAD(, NBDConn) conns;
+ } NBDServerData;
+
+ static NBDServerData *nbd_server;
+@@ -51,6 +57,14 @@ int nbd_server_max_connections(void)
+
+ static void nbd_blockdev_client_closed(NBDClient *client, bool ignored)
+ {
++    NBDConn *conn =3D nbd_client_owner(client);
++
++    assert(qemu_in_main_thread() && nbd_server);
++
++    object_unref(OBJECT(conn->cioc));
++    QLIST_REMOVE(conn, next);
++    g_free(conn);
++
+     nbd_client_put(client);
+     assert(nbd_server->connections > 0);
+     nbd_server->connections--;
+@@ -60,14 +74,20 @@ static void nbd_blockdev_client_closed(NBDClient *cl=
ient, bool ignored)
+ static void nbd_accept(QIONetListener *listener, QIOChannelSocket *cioc=
,
+                        gpointer opaque)
+ {
++    NBDConn *conn =3D g_new0(NBDConn, 1);
++
++    assert(qemu_in_main_thread() && nbd_server);
+     nbd_server->connections++;
++    object_ref(OBJECT(cioc));
++    conn->cioc =3D cioc;
++    QLIST_INSERT_HEAD(&nbd_server->conns, conn, next);
+     nbd_update_server_watch(nbd_server);
+
+     qio_channel_set_name(QIO_CHANNEL(cioc), "nbd-server");
+     /* TODO - expose handshake timeout as QMP option */
+     nbd_client_new(cioc, NBD_DEFAULT_HANDSHAKE_MAX_SECS,
+                    nbd_server->tlscreds, nbd_server->tlsauthz,
+-                   nbd_blockdev_client_closed, NULL);
++                   nbd_blockdev_client_closed, conn);
+ }
+
+ static void nbd_update_server_watch(NBDServerData *s)
+@@ -81,12 +101,25 @@ static void nbd_update_server_watch(NBDServerData *=
s)
+
+ static void nbd_server_free(NBDServerData *server)
+ {
++    NBDConn *conn, *tmp;
++
+     if (!server) {
+         return;
+     }
+
++    /*
++     * Forcefully close the listener socket, and any clients that have
++     * not yet disconnected on their own.
++     */
+     qio_net_listener_disconnect(server->listener);
+     object_unref(OBJECT(server->listener));
++    QLIST_FOREACH_SAFE(conn, &server->conns, next, tmp) {
++        qio_channel_shutdown(QIO_CHANNEL(conn->cioc), QIO_CHANNEL_SHUTD=
OWN_BOTH,
++                             NULL);
++    }
++
++    AIO_WAIT_WHILE_UNLOCKED(NULL, server->connections > 0);
++
+     if (server->tlscreds) {
+         object_unref(OBJECT(server->tlscreds));
+     }
+--
+2.40.0
--=20
2.40.0


