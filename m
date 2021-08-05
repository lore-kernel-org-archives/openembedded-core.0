Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web08.10543.1628177811256962795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mpvTxSij;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id x15so7862020oic.9
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=m9zcs50Dv9/uI8+bEyfRVQ7Ek+rayJo+zlT8Q3e5hn0=;
        b=mpvTxSijeGPALpLHDjhnY2mOym0fsbQTYj2OEA3a5lWA6pi+Bogs8IGX7TeNjsi2kN
         /1e7zLoDKl8gks0L1ljSCL4pfIWQBT4g+islkcteFJaA8ROWMlWkiWpETmuVSRD5vldI
         A1MRy0u/2ZNzC8OnlP36jvZ44PPYO9/HJ4E0j27uOHR4q3GiAiJ1MyN4iqqWLROAYK6/
         4clCHkgFI/bBLi6XZV8rsv7N1l+uIEi712QUSo9oKJbTNIjQY/qPhObOCQZMnuHX6p/C
         EU0eaFaojcgPBpRhAoL4dvO2S+AvJOfEClkGPg4dNl/+4zpXS296zyHEBSvoULVzGiqz
         s/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m9zcs50Dv9/uI8+bEyfRVQ7Ek+rayJo+zlT8Q3e5hn0=;
        b=kMBLKHbKqdQJbunofeB6cazpkoYBizA0fzz/z/OK76b5BlEbrIJBkzgirdz3JjM2zR
         BCEzp2qQgf4fhjwywuBCwiY1oGPZUddDmy6+JK4VXKxKoQknAWPJLRbcDgqbCDsivPlN
         LjZbKf2TuM3SztUZSswPQiELDCACOkjONtgSgTIQ9h114u3QEv08d0zr/XPAbFmZZpCl
         eCtDk4d0lxQ7w0OG5LMQi8hDIs2Z7LClNxi26evU8a/G6Npg7iIIOnmMqBrmauIIW9pV
         M7s6l07nKHJFXiptG6NBPyy7EtOsxc6VzNPJzA0iMIxBPYW7pqbqFUhuvhhx/8Ru55TZ
         kN5w==
X-Gm-Message-State: AOAM533a3930Un2cvlSaF0mf1EU44QeuLeOHUXrOg0ZRh1UjDpnzrdD2
	se08h+8jsS7qx890pHU5YNPM2uVenuRPf/6+
X-Google-Smtp-Source: ABdhPJwFzC/RUxVD/rTVsWlmtI4PB8bZnjm70EVete1d443G74CbFY2rr6EZvhRI5KblcF8PEC2rdw==
X-Received: by 2002:a05:6808:4d0:: with SMTP id a16mr749651oie.166.1628177810235;
        Thu, 05 Aug 2021 08:36:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.36.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:36:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/33] ifupdown: added -1 option to dhclient for dhcpv6
Date: Thu,  5 Aug 2021 05:33:56 -1000
Message-Id: <6d8bf12bffa146cb51153a79a4b96b05298c4fbf.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Zhao <yi.zhao@windriver.com>

When dhclient is used with ifupdown and in the /etc/network/interfaces
file is something like e.g. "iface eth0 inet6 dhcp" the system does not
boot but hangs at the after dhcp configuration of IPv4 at the stage
where IPv6 should be configured.
The reason seems to be, that ifupdown calls the dhclient in a blocking
way which leads to a permanent block of the boot when no DHCPv6 server
is available.
A similar bug in Redhat:
https://bugzilla.redhat.com/show_bug.cgi?id=585047

[YOCTO #14117]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-1-option-to-dhclient-on-upping-an-i.patch | 65 +++++++++++++++++++
 meta/recipes-core/ifupdown/ifupdown_0.8.35.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/ifupdown/files/0001-inet6.defn-Added-1-option-to-dhclient-on-upping-an-i.patch

diff --git a/meta/recipes-core/ifupdown/files/0001-inet6.defn-Added-1-option-to-dhclient-on-upping-an-i.patch b/meta/recipes-core/ifupdown/files/0001-inet6.defn-Added-1-option-to-dhclient-on-upping-an-i.patch
new file mode 100644
index 0000000000..e374d8ca59
--- /dev/null
+++ b/meta/recipes-core/ifupdown/files/0001-inet6.defn-Added-1-option-to-dhclient-on-upping-an-i.patch
@@ -0,0 +1,65 @@
+From e2263b58d7733835355d7b46c3caa96d911a4717 Mon Sep 17 00:00:00 2001
+From: Simon Schwarz <simon.schwarz@infoteam.de>
+Date: Fri, 6 Nov 2020 08:53:20 +0100
+Subject: [PATCH] inet6.defn: Added -1 option to dhclient on upping an
+ interface
+
+This prevents hangs on startup when no server is available and dhcpv6 is used
+
+Upstream-Status: Pending
+
+Signed-off-by: Simon Schwarz <simon.schwarz@infoteam.de>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ inet6.defn | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/inet6.defn b/inet6.defn
+index 73dce24..25022e3 100644
+--- a/inet6.defn
++++ b/inet6.defn
+@@ -29,9 +29,9 @@ method auto
+         if (var_set("accept_ra", ifd) && !var_true("accept_ra", ifd))
+     /sbin/ip link set dev %iface% up
+     /lib/ifupdown/wait-for-ll6.sh if (var_true("dhcp", ifd) && execable("/lib/ifupdown/wait-for-ll6.sh"))
+-    /sbin/dhclient -6 -v -P -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
++    /sbin/dhclient -6 -1 -v -P -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
+         if (var_true("dhcp", ifd) && execable("/sbin/dhclient") && var_true("request_prefix", ifd))
+-    /sbin/dhclient -6 -v -S -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
++    /sbin/dhclient -6 -1 -v -S -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
+         elsif (var_true("dhcp", ifd) && execable("/sbin/dhclient"))
+     echo 'No DHCPv6 client software found!' >&2; false \
+         elsif (var_true("dhcp", ifd))
+@@ -154,9 +154,9 @@ method dhcp
+         if (var_set("accept_ra", ifd) && !var_true("accept_ra", ifd))
+     /sbin/ip link set dev %iface% [[address %hwaddress%]] up
+     /lib/ifupdown/wait-for-ll6.sh if (execable("/lib/ifupdown/wait-for-ll6.sh"))
+-    /sbin/dhclient -6 -v -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -P -N -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
++    /sbin/dhclient -6 -1 -v -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -P -N -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
+         if (execable("/sbin/dhclient") && var_true("request_prefix", ifd))
+-    /sbin/dhclient -6 -v -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
++    /sbin/dhclient -6 -1 -v -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
+         elsif (execable("/sbin/dhclient"))
+     echo 'No DHCPv6 client software found!' >&2; false \
+         elsif (1)
+@@ -325,7 +325,7 @@ method dhcp
+ 
+   up
+     /sbin/ifconfig %iface% [[link %hwaddress%]] up
+-    /sbin/dhclient -6 -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
++    /sbin/dhclient -6 -1 -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
+         if (execable("/sbin/dhclient"))
+     echo 'No DHCPv6 client software found!' >&2; false \
+         elsif (1)
+@@ -397,7 +397,7 @@ method dhcp
+   up
+     [[Warning: Option hwaddress: %hwaddress% not yet supported]]
+     inetutils-ifconfig --interface %iface% --up
+-    /sbin/dhclient -6 -pf /run/dhclient6.%iface///.%.pid -lf /var/lib/dhcp/dhclient6.%iface///.%.leases -I -df /var/lib/dhcp/dhclient.%iface///.%.leases %iface% \
++    /sbin/dhclient -6 -1 -pf /run/dhclient6.%iface///.%.pid -lf /var/lib/dhcp/dhclient6.%iface///.%.leases -I -df /var/lib/dhcp/dhclient.%iface///.%.leases %iface% \
+         if (execable("/sbin/dhclient"))
+     echo 'No DHCPv6 client software found!' >&2; false \
+         elsif (1)
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
index ae175848b7..16807eb675 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
            file://99_network \
            file://0001-Define-FNM_EXTMATCH-for-musl.patch \
            file://0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch \
+           file://0001-inet6.defn-Added-1-option-to-dhclient-on-upping-an-i.patch \
            file://run-ptest \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
            "
-- 
2.25.1

