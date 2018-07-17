Return-Path: <rv@rasmusvillemoes.dk>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 232D378996
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 13:33:44 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id j19-v6so1004199ljc.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 06:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rasmusvillemoes.dk; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=nuwLE+ZkupJQSInPXskBWT4s4SNPRnSFV7zmE/Xq/Vk=;
	b=Yc2dQW4XUgrlVm758bdGo8jbQ24gMfPWaXsv7NHTqQh3jjP/22/JX5CV/1r4oLpNJ6
	mAz6DNWekP1xKhtw0FC6j8+Ol4M3bn1h6Ifa0Rd8PTgwQtOcK7Q906auARgeW5zK/sb2
	ugHqDi2gQywNTxZzfChf4VzpyNPb+FvlpW6TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nuwLE+ZkupJQSInPXskBWT4s4SNPRnSFV7zmE/Xq/Vk=;
	b=rEfZs2qIpS2ri0UzrZCJqruvhPpHaOdD6E0P/hdUKHdwPlCaebGUzsokzg3n8Q4WBN
	4x59wmoMN+Polo8ul9AxV2/NZ+YxJFm2r6okl7eCGmHptvynFKxcpleCHnDO0ca47OSJ
	et8FYuLSfFKiBy4qIQEyyq1QT7x46LztH3oOr2tFvjOqEWywu5GUVi8ii+7DxKbbAtd7
	g+XlosCUgRRgf7mkxMsl+03ZCGV2LEOwMB390X5DidiutQ7eAKF73ECcFlI37Y7hBzZL
	iDFrChlF6MNCbHbBU142fuIraXPoHRUl0mQAf3PyA1KGY7DEbRpfb2/IsAw3F6bVGvzq
	9Tjw==
X-Gm-Message-State: AOUpUlEnw/Q95u4oYBRzd8XfONGMykh5eWEQ7SqFm8cLxF1JMgbcY0sV
	fP1bKlXkB2hmr1OJHhi5Jnwmgs8a6fc=
X-Google-Smtp-Source: AAOMgpdiyKHobYwcwGZuLTKmQHfBRfY8JTB7q1riJBWI/2uP4/UHkJ9Xa8hMmYjDv1H1ZFAznylkDQ==
X-Received: by 2002:a2e:1d50:: with SMTP id
	d77-v6mr1499300ljd.104.1531834424950; 
	Tue, 17 Jul 2018 06:33:44 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
	by smtp.gmail.com with ESMTPSA id
	w14-v6sm177800ljh.71.2018.07.17.06.33.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Jul 2018 06:33:44 -0700 (PDT)
From: Rasmus Villemoes <rv@rasmusvillemoes.dk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 15:33:41 +0200
Message-Id: <20180717133341.22388-1-rv@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.16.4
Subject: [PATCH] busybox: udhcpd: fix not dying on SIGTERM
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
X-List-Received-Date: Tue, 17 Jul 2018 13:33:45 -0000

busybox 1.27.2 udhcpd does not respond to SIGTERM. Backport the upstream
fix. I've verified that this makes our local automated test suite pass
again.

Signed-off-by: Rasmus Villemoes <rv@rasmusvillemoes.dk>
---
 .../busybox/udhcpd-fix-not-dying-on-SIGTERM.patch  | 273 +++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb        |   1 +
 2 files changed, 274 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/udhcpd-fix-not-dying-on-SIGTERM.patch

diff --git a/meta/recipes-core/busybox/busybox/udhcpd-fix-not-dying-on-SIGTERM.patch b/meta/recipes-core/busybox/busybox/udhcpd-fix-not-dying-on-SIGTERM.patch
new file mode 100644
index 0000000000..1ea0385a8f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/udhcpd-fix-not-dying-on-SIGTERM.patch
@@ -0,0 +1,273 @@
+From 1384459d88cb0f5f47b6a36b8346dcf425a643f5 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Sat, 10 Mar 2018 19:01:48 +0100
+Subject: [PATCH] udhcpd: fix "not dying on SIGTERM"
+
+Upstream-status: Backport [https://git.busybox.net/busybox/commit/?id=3293bc146985c56790033409facc0ad64a471084]
+
+Fixes:
+	commit 52a515d18724bbb34e3ccbbb0218efcc4eccc0a8
+	"udhcp: use poll() instead of select()"
+	Feb 16 2017
+
+udhcp_sp_read() is meant to check whether signal pipe indeed has some data to read.
+In the above commit, it was changed as follows:
+
+-	if (!FD_ISSET(signal_pipe.rd, rfds))
++	if (!pfds[0].revents)
+		return 0;
+
+The problem is, the check was working for select() purely by accident.
+Caught signal interrupts select()/poll() syscalls, they return with EINTR
+(regardless of SA_RESTART flag in sigaction). _Then_ signal handler is invoked.
+IOW: they can't see any changes to fd state caused by signal haldler
+(in our case, signal handler makes signal pipe ready to be read).
+
+For select(), it means that rfds[] bit array is unmodified, bit of signal
+pipe's read fd is still set, and the above check "works": it thinks select()
+says there is data to read.
+
+This accident does not work for poll(): .revents stays clear, and we do not
+try reading signal pipe as we should. In udhcpd, we fall through and block
+in socket read. Further SIGTERM signals simply cause socket read to be
+interrupted and then restarted (since SIGTERM handler has SA_RESTART=1).
+
+Fixing this as follows: remove the check altogether. Set signal pipe read fd
+to nonblocking mode. Always read it in udhcp_sp_read().
+If read fails, assume it's EAGAIN and return 0 ("no signal seen").
+
+udhcpd avoids reading signal pipe on every recvd packet by looping if EINTR
+(using safe_poll()) - thus ensuring we have correct .revents for all fds -
+and calling udhcp_sp_read() only if pfds[0].revents!=0.
+
+udhcpc performs much fewer reads (typically it sleeps >99.999% of the time),
+there is no need to optimize it: can call udhcp_sp_read() after each poll
+unconditionally.
+
+To robustify socket reads, unconditionally set pfds[1].revents=0
+in udhcp_sp_fd_set() (which is before poll), and check it before reading
+network socket in udhcpd.
+
+TODO:
+This might still fail: if pfds[1].revents=POLLIN, socket read may still block.
+There are rare cases when select/poll indicates that data can be read,
+but then actual read still blocks (one such case is UDP packets with
+wrong checksum). General advise is, if you use a poll/select loop,
+keep all your fds nonblocking.
+Maybe we should also do that to our network sockets?
+
+function                                             old     new   delta
+udhcp_sp_setup                                        55      65     +10
+udhcp_sp_fd_set                                       54      60      +6
+udhcp_sp_read                                         46      36     -10
+udhcpd_main                                         1451    1437     -14
+udhcpc_main                                         2723    2708     -15
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/3 up/down: 16/-39)            Total: -23 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ examples/var_service/dhcpd_if/run                  |  4 +--
+ .../dhcpd_if/{udhcpc.conf => udhcpd.conf}          |  0
+ networking/udhcp/common.h                          |  2 +-
+ networking/udhcp/d6_dhcpc.c                        |  9 +++---
+ networking/udhcp/dhcpc.c                           |  9 +++---
+ networking/udhcp/dhcpd.c                           | 34 ++++++++++++----------
+ networking/udhcp/signalpipe.c                      | 11 +++----
+ 7 files changed, 35 insertions(+), 34 deletions(-)
+ rename examples/var_service/dhcpd_if/{udhcpc.conf => udhcpd.conf} (100%)
+
+diff --git a/examples/var_service/dhcpd_if/run b/examples/var_service/dhcpd_if/run
+index de85dece0..a603bdc71 100755
+--- a/examples/var_service/dhcpd_if/run
++++ b/examples/var_service/dhcpd_if/run
+@@ -11,13 +11,13 @@ echo "* Upping iface $if"
+ ip link set dev $if up
+ 
+ >>udhcpd.leases
+-sed 's/^interface.*$/interface '"$if/" -i udhcpc.conf
++sed 's/^interface.*$/interface '"$if/" -i udhcpd.conf
+ 
+ echo "* Starting udhcpd"
+ exec \
+ env - PATH="$PATH" \
+ softlimit \
+ setuidgid root \
+-udhcpd -f -vv udhcpc.conf
++udhcpd -f -vv udhcpd.conf
+ 
+ exit $?
+diff --git a/examples/var_service/dhcpd_if/udhcpc.conf b/examples/var_service/dhcpd_if/udhcpd.conf
+similarity index 100%
+rename from examples/var_service/dhcpd_if/udhcpc.conf
+rename to examples/var_service/dhcpd_if/udhcpd.conf
+diff --git a/networking/udhcp/common.h b/networking/udhcp/common.h
+index a9c23a186..866f3d8b1 100644
+--- a/networking/udhcp/common.h
++++ b/networking/udhcp/common.h
+@@ -312,7 +312,7 @@ int udhcp_send_kernel_packet(struct dhcp_packet *dhcp_pkt,
+ 
+ void udhcp_sp_setup(void) FAST_FUNC;
+ void udhcp_sp_fd_set(struct pollfd *pfds, int extra_fd) FAST_FUNC;
+-int udhcp_sp_read(struct pollfd *pfds) FAST_FUNC;
++int udhcp_sp_read(void) FAST_FUNC;
+ 
+ int udhcp_read_interface(const char *interface, int *ifindex, uint32_t *nip, uint8_t *mac) FAST_FUNC;
+ 
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index f6d3fb98b..bdf8dad17 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -1371,13 +1371,12 @@ int udhcpc6_main(int argc UNUSED_PARAM, char **argv)
+ 			/* yah, I know, *you* say it would never happen */
+ 			timeout = INT_MAX;
+ 			continue; /* back to main loop */
+-		} /* if select timed out */
++		} /* if poll timed out */
+ 
+-		/* select() didn't timeout, something happened */
++		/* poll() didn't timeout, something happened */
+ 
+ 		/* Is it a signal? */
+-		/* note: udhcp_sp_read checks poll result before reading */
+-		switch (udhcp_sp_read(pfds)) {
++		switch (udhcp_sp_read()) {
+ 		case SIGUSR1:
+ 			client_config.first_secs = 0; /* make secs field count from 0 */
+ 			already_waited_sec = 0;
+@@ -1412,7 +1411,7 @@ int udhcpc6_main(int argc UNUSED_PARAM, char **argv)
+ 		}
+ 
+ 		/* Is it a packet? */
+-		if (listen_mode == LISTEN_NONE || !pfds[1].revents)
++		if (!pfds[1].revents)
+ 			continue; /* no */
+ 
+ 		{
+diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c
+index 1a66c610e..c8027983e 100644
+--- a/networking/udhcp/dhcpc.c
++++ b/networking/udhcp/dhcpc.c
+@@ -1588,13 +1588,12 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+ 			/* yah, I know, *you* say it would never happen */
+ 			timeout = INT_MAX;
+ 			continue; /* back to main loop */
+-		} /* if select timed out */
++		} /* if poll timed out */
+ 
+-		/* select() didn't timeout, something happened */
++		/* poll() didn't timeout, something happened */
+ 
+ 		/* Is it a signal? */
+-		/* note: udhcp_sp_read checks poll result before reading */
+-		switch (udhcp_sp_read(pfds)) {
++		switch (udhcp_sp_read()) {
+ 		case SIGUSR1:
+ 			client_config.first_secs = 0; /* make secs field count from 0 */
+ 			already_waited_sec = 0;
+@@ -1629,7 +1628,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+ 		}
+ 
+ 		/* Is it a packet? */
+-		if (listen_mode == LISTEN_NONE || !pfds[1].revents)
++		if (!pfds[1].revents)
+ 			continue; /* no */
+ 
+ 		{
+diff --git a/networking/udhcp/dhcpd.c b/networking/udhcp/dhcpd.c
+index 3a5fc2db7..c4e990a48 100644
+--- a/networking/udhcp/dhcpd.c
++++ b/networking/udhcp/dhcpd.c
+@@ -912,20 +912,18 @@ int udhcpd_main(int argc UNUSED_PARAM, char **argv)
+ 
+ 		udhcp_sp_fd_set(pfds, server_socket);
+ 		tv = timeout_end - monotonic_sec();
+-		retval = 0;
+-		if (!server_config.auto_time || tv > 0) {
+-			retval = poll(pfds, 2, server_config.auto_time ? tv * 1000 : -1);
+-		}
+-		if (retval == 0) {
+-			write_leases();
+-			goto continue_with_autotime;
+-		}
+-		if (retval < 0 && errno != EINTR) {
+-			log1("error on select");
+-			continue;
++		/* Block here waiting for either signal or packet */
++		retval = safe_poll(pfds, 2, server_config.auto_time ? tv * 1000 : -1);
++		if (retval <= 0) {
++			if (retval == 0) {
++				write_leases();
++				goto continue_with_autotime;
++			}
++			/* < 0 and not EINTR: should not happen */
++			bb_perror_msg_and_die("poll");
+ 		}
+ 
+-		switch (udhcp_sp_read(pfds)) {
++		if (pfds[0].revents) switch (udhcp_sp_read()) {
+ 		case SIGUSR1:
+ 			bb_error_msg("received %s", "SIGUSR1");
+ 			write_leases();
+@@ -935,12 +933,16 @@ int udhcpd_main(int argc UNUSED_PARAM, char **argv)
+ 			bb_error_msg("received %s", "SIGTERM");
+ 			write_leases();
+ 			goto ret0;
+-		case 0: /* no signal: read a packet */
+-			break;
+-		default: /* signal or error (probably EINTR): back to select */
+-			continue;
+ 		}
+ 
++		/* Is it a packet? */
++		if (!pfds[1].revents)
++			continue; /* no */
++
++		/* Note: we do not block here, we block on poll() instead.
++		 * Blocking here would prevent SIGTERM from working:
++		 * socket read inside this call is restarted on caught signals.
++		 */
+ 		bytes = udhcp_recv_kernel_packet(&packet, server_socket);
+ 		if (bytes < 0) {
+ 			/* bytes can also be -2 ("bad packet data") */
+diff --git a/networking/udhcp/signalpipe.c b/networking/udhcp/signalpipe.c
+index b101b4ce4..2ff78f0f2 100644
+--- a/networking/udhcp/signalpipe.c
++++ b/networking/udhcp/signalpipe.c
+@@ -40,6 +40,7 @@ void FAST_FUNC udhcp_sp_setup(void)
+ 	xpiped_pair(signal_pipe);
+ 	close_on_exec_on(signal_pipe.rd);
+ 	close_on_exec_on(signal_pipe.wr);
++	ndelay_on(signal_pipe.rd);
+ 	ndelay_on(signal_pipe.wr);
+ 	bb_signals(0
+ 		+ (1 << SIGUSR1)
+@@ -61,20 +62,20 @@ void FAST_FUNC udhcp_sp_fd_set(struct pollfd pfds[2], int extra_fd)
+ 		pfds[1].fd = extra_fd;
+ 		pfds[1].events = POLLIN;
+ 	}
++	/* this simplifies "is extra_fd ready?" tests elsewhere: */
++	pfds[1].revents = 0;
+ }
+ 
+ /* Read a signal from the signal pipe. Returns 0 if there is
+  * no signal, -1 on error (and sets errno appropriately), and
+  * your signal on success */
+-int FAST_FUNC udhcp_sp_read(struct pollfd pfds[2])
++int FAST_FUNC udhcp_sp_read(void)
+ {
+ 	unsigned char sig;
+ 
+-	if (!pfds[0].revents)
+-		return 0;
+-
++	/* Can't block here, fd is in nonblocking mode */
+ 	if (safe_read(signal_pipe.rd, &sig, 1) != 1)
+-		return -1;
++		return 0;
+ 
+ 	return sig;
+ }
+-- 
+2.16.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index 92678701fc..704ccbe0e0 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2017-15873.patch \
            file://busybox-CVE-2017-16544.patch \
            file://busybox-fix-lzma-segfaults.patch \
+           file://udhcpd-fix-not-dying-on-SIGTERM.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.16.4


