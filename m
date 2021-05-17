Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web12.619.1621291874172139843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=vRhGPIMn;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.202, mailfrom: 3yfoiyamkan4wakgoogle.com@flex--wak.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id d4-20020a25b5c40000b02904f8e3c8c6c9so11130083ybg.14
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=UGz37/IV4uqKLFspVlpm6WYNH3J6OzwDzScszHC4VvE=;
        b=vRhGPIMnIRTkodw2dlbZOsDYXy4ewabqnnMDxHWTAggnp7nVWc9S1SHz+uQe/sM75T
         pBpaQraZD30b3GAc8MhIIbY+EwijWnb+x1ab36tUr48ISQGNQr0eOFiXvkO1XAo2wk5D
         +ajWut20+z7J52f1vg5LIyPmbtdPLyrsTOXm+ntzccBEGbjY8/YSkhmyCSI0PyoFbu5i
         YC/AX66zZsuY/7riIqAwqeBjwXOivcYKyOi0QSRYtSA0s9xN2pTSU8fpQd59+rJEQI0b
         Lek5ZccKhbTegV5YHGnxzRPa20K8NnLo34gyPOz6WOB1JfyiwQu08m+9ePv75djsQoNW
         f8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=UGz37/IV4uqKLFspVlpm6WYNH3J6OzwDzScszHC4VvE=;
        b=G5SJKXZ3kGIsqj05l1nJSBzynOaHwc9Y4Fgunu1Bgflsp2GjsFpqC6gnFOd5P2klHT
         9SjfJrs/tjM+CUFucFouFhpEjzmnAcOWCBhE/a8nvjpL2LoHGooqLcbPe8NALr5XmJFe
         sBgjccihQEi1dv72CcbJDR045Qw90IYfveO2c6X0EtS2auqoXp35iuIZBCRc+Vvfg7VC
         cs760FCWRnX5vQOIqN/vOxV3OPhBnmSaW5MTxqwERe5dVPnBtciAA/HX3a/DCVzMDbvi
         WgDZtmMcLCWtygVxymBxWXSc9eEnZcv7EqZIuPaT2QGD2o1YOqm58Ar++CD08U6TO1Z+
         TnpA==
X-Gm-Message-State: AOAM532gzvETXQaNj8KcNb1pjkDrs3Kp5towsahuO+i+nvtNHjrQ/58r
	aKskWgEKAmrdgeY1s4nbxVxqecwtlfKr1JmFDwB28c5wre6YLewfyMmGjecJBVdsB/RjFpCf+ay
	TMdZoPI+v2hU2nK+a1qMSKy89YZ5B51eF0Yfr4nB727H9SB4uJpV6u4wFHOiIUKUcHmupgT5BOF
	4prw==
X-Google-Smtp-Source: ABdhPJw/qr/R1RNiMqBYJRIwGGEwvlJTmsgjXSpLXyCK35219UW+YkFNgISSrnYBS4y//w4d9yfJWAk=
X-Received: from wak-linux.svl.corp.google.com ([2620:15c:2c5:3:dc0b:7266:720:d64b])
 (user=wak job=sendgmr) by 2002:a25:348f:: with SMTP id b137mr3285239yba.31.1621291873114;
 Mon, 17 May 2021 15:51:13 -0700 (PDT)
Date: Mon, 17 May 2021 15:51:01 -0700
In-Reply-To: <20210517225101.1100864-1-wak@google.com>
Message-Id: <20210517225101.1100864-2-wak@google.com>
Mime-Version: 1.0
References: <20210517225101.1100864-1-wak@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [OE-core][PATCH 2/2] systemd: Fix networkd failing links with loopback RAs
From: "William A. Kennington III" <wak@google.com>
To: openembedded-core@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"

Backport a patch to situations where the current node receives an RA
packet from itself, which triggers systemd-networkd to put the link into
a failed state which turns off internal RA functionality.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 ...le-ignoring-ll-gateway-being-link-ll.patch | 68 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_247.6.bb    |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-networkd-handle-ignoring-ll-gateway-being-link-ll.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-networkd-handle-ignoring-ll-gateway-being-link-ll.patch b/meta/recipes-core/systemd/systemd/0001-networkd-handle-ignoring-ll-gateway-being-link-ll.patch
new file mode 100644
index 0000000000..47e81a6c38
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-networkd-handle-ignoring-ll-gateway-being-link-ll.patch
@@ -0,0 +1,68 @@
+From 40c6396bfd1e83f80dde31f4886bb1dbf155012d Mon Sep 17 00:00:00 2001
+From: Devon Pringle <devon.pringle@opengear.com>
+Date: Mon, 14 Dec 2020 14:22:18 +1000
+Subject: [PATCH] networkd: handle ignoring ll gateway being link ll
+
+In the event where network discovery gets a route with the gateway being
+the interfaces local link address, networkd will fail the interface.
+
+systemd-networkd[44319]: br_lan: Configuring route: dst: fdcd:41a4:5559:ec03::/64, src: n/a, gw: fe80::e4da:7eff:fe77:5c5e, prefsrc: n/a, scope: global, table: main, proto: ra, type: unicast
+systemd-networkd[44319]: br_lan: Could not set NDisc route or address: Gateway can not be a local address. Invalid argument
+systemd-networkd[44319]: br_lan: Failed
+systemd-networkd[44319]: br_lan: State changed: configuring -> failed
+
+This patch, instead of allowing the interface to fail, will instead log
+the event and skip setting the route.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/221019166f315252304b3459902ead613b905de5]
+---
+ src/network/networkd-ndisc.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.c
+index d2aa3db175..41591900e9 100644
+--- a/src/network/networkd-ndisc.c
++++ b/src/network/networkd-ndisc.c
+@@ -820,7 +820,7 @@ static int ndisc_router_process_onlink_prefix(Link *link, sd_ndisc_router *rt) {
+ 
+ static int ndisc_router_process_route(Link *link, sd_ndisc_router *rt) {
+         _cleanup_(route_freep) Route *route = NULL;
+-        struct in6_addr gateway;
++        union in_addr_union gateway;
+         uint32_t lifetime;
+         unsigned preference, prefixlen;
+         usec_t time_now;
+@@ -835,10 +835,20 @@ static int ndisc_router_process_route(Link *link, sd_ndisc_router *rt) {
+         if (lifetime == 0)
+                 return 0;
+ 
+-        r = sd_ndisc_router_get_address(rt, &gateway);
++        r = sd_ndisc_router_get_address(rt, &gateway.in6);
+         if (r < 0)
+                 return log_link_error_errno(link, r, "Failed to get gateway address from RA: %m");
+ 
++        if (address_exists(link, AF_INET6, &gateway)) {
++                _cleanup_free_ char *buf = NULL;
++
++                if (DEBUG_LOGGING) {
++                        (void) in_addr_to_string(AF_INET6, &gateway, &buf);
++                        log_link_debug(link, "Advertised route gateway, %s, is local to the link, ignoring route", strnull(buf));
++                }
++                return 0;
++        }
++
+         r = sd_ndisc_router_route_get_prefixlen(rt, &prefixlen);
+         if (r < 0)
+                 return log_link_error_errno(link, r, "Failed to get route prefix length: %m");
+@@ -860,7 +870,7 @@ static int ndisc_router_process_route(Link *link, sd_ndisc_router *rt) {
+         route->priority = link->network->dhcp6_route_metric;
+         route->protocol = RTPROT_RA;
+         route->pref = preference;
+-        route->gw.in6 = gateway;
++        route->gw.in6 = gateway.in6;
+         route->gw_family = AF_INET6;
+         route->dst_prefixlen = prefixlen;
+         route->lifetime = time_now + lifetime * USEC_PER_SEC;
+-- 
+2.31.1.607.g51e8a6a459-goog
+
diff --git a/meta/recipes-core/systemd/systemd_247.6.bb b/meta/recipes-core/systemd/systemd_247.6.bb
index fb4acf2d37..dc04908922 100644
--- a/meta/recipes-core/systemd/systemd_247.6.bb
+++ b/meta/recipes-core/systemd/systemd_247.6.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch \
            file://0001-analyze-resolve-executable-path-if-it-is-relative.patch \
            file://0001-network-neighbor-Always-add-neighbors-with-replace.patch \
+           file://0001-networkd-handle-ignoring-ll-gateway-being-link-ll.patch \
            "
 
 # patches needed by musl
-- 
2.31.1.751.gd2f1c929bd-goog

