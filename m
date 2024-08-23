Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A226BC52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 12:07:32 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.14516.1724414850482456889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 05:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BpJlmVcX;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53351642021so1918537e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724414848; x=1725019648; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f3TWgrJHSWamek2wMwyPqQEcf4/6ezvVnQg8uU0wx9U=;
        b=BpJlmVcX3/xyDyE+X7r43h1pfQ6oAE+BMy0xNTz38zelv9toNm0pAi+gGCd3YlXyrt
         cYySOeArO/vHFI1ADhKz7hO9K5yDe91RNhSDNUmjD7nDOuFhozMVndpH5L2WOVjaceq4
         keVwC2CWzfjfzBIrib/Yecg0bczPdp/mMl4MGcju9e7OemEl+ZKOtO9bC/L/s6iRTyfX
         bmggKH8K4P5LdPUH24HWcRpATy4pI2qwkndRFuLKIWeRuCfdGxN88GB/splmhdfNQZDU
         P2tOgpdKKaGKU4AzVvFrAO9GzNIRkN9aLio2Q1H04Oc5o2JPHFk1CTwH9eicpX8/v2GF
         gSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724414848; x=1725019648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3TWgrJHSWamek2wMwyPqQEcf4/6ezvVnQg8uU0wx9U=;
        b=pn44BpYkO/BmBEJAEfDFJKSMnb2VFo0e8Tq4mAaLF4BHvNCvdCQRudtJnKlbNf4+dR
         lUMaw1NVURH4tfZvNGx9VOwd7dabQirLNu0jc9ZnXrE/iZSEf45a+KaAKqyoKcZHr32T
         hmlIrEYUfVqSoV8F+2JVeDAY14UU2H1OL+IIjT25kKDZ2qyA4henz5B8VPPz25gq7Ev7
         bE1i8fpu+HtF3BBZ0XPt6/9sFhtVzSzOkhSf54YaWucrY1A7P2nnMLiUSVPBScpuKUi0
         cIVrETp+ZyY2T2nDsDZhqmfqmXnuO7S0X14e8agPWdax6abXGOHL6uXTgXFzOGJYEktS
         +Bcw==
X-Gm-Message-State: AOJu0YxClCHeJqee3LXOK2Z5KfNnYsgtjopWU47LeJNs4z8twM/OTBrq
	DR/6ad3cdgH8dqRZdkzWDSf/fdJmAimrSvGgEI3f/FofwT9TLFC6Ly1KxHGg7imM8h1X506V4H8
	pYn4ZtFNsMpRkim7a0rUPOkUhR43O5A==
X-Google-Smtp-Source: AGHT+IF16i6sMPld/ckJG0pYq2IeyiuhsBwDxgA0GP7/bNVHj4mWo/304Y+Md0BCjVm2W+MxhWhZzHXMjWlrmLUZV0o=
X-Received: by 2002:a05:6512:3d09:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-5343877a8e5mr1054778e87.20.1724414847801; Fri, 23 Aug 2024
 05:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240823115912.703747-1-quic_dgangire@quicinc.com>
In-Reply-To: <20240823115912.703747-1-quic_dgangire@quicinc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Aug 2024 14:07:16 +0200
Message-ID: <CANNYZj9uOvYpzmdSx_A726scLxpyTRO+NqLNe=3FwfqgKDAi-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] obexd: Add system bus support for obexd
To: quic_dgangire@quicinc.com
Cc: openembedded-core@lists.openembedded.org, quic_mohamull@quicinc.com, 
	quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 12:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203685

I think this needs to be better justified. What were the reasons
upstream didn't want to take this patch? Why would oe-core take it and
maintain it until the end of time? Shouldn't this be a product
specific feature for those (few) who need it, rather than a project
level feature?

Alex

On Fri, 23 Aug 2024 at 13:59, quic_dgangire via lists.openembedded.org
<quic_dgangire=quicinc.com@lists.openembedded.org> wrote:
>
> From: Damodar Reddy GangiReddy <quic_dgangire@quicinc.com>
>
> Currently obexd uses session bus.
> Distros  where session bus is not supported and still obex profiles
> are required in that case use system bus instead of session bus
> which can be configured with new optional feature
>
> Additional optional feature has been added to achieve this
> with name --enable-use-systembus-for-obexd
>
> steps to configure system bus
> ./configure --enable-use-systembus-for-obexd
>
> Upstream-Status: Denied
> Upstream denied as it is distro specific
>
> Signed-off-by: Damodar Reddy GangiReddy <quic_dgangire@quicinc.com>
> Change-Id: I1db23ed506631ea6ae8f69034e5211751313e046
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
>  ...exd-Add-system-bus-support-for-obexd.patch | 244 ++++++++++++++++++
>  2 files changed, 245 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Add-system-bus-support-for-obexd.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index d8b9f81771..9ad307b0d0 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -63,6 +63,7 @@ PACKAGECONFIG[mesh] = "--enable-mesh --enable-external-ell,--disable-mesh, json-
>  PACKAGECONFIG[btpclient] = "--enable-btpclient --enable-external-ell,--disable-btpclient, ell"
>  PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>  PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,python3-docutils-native"
> +PACKAGECONFIG[obexdbus] = "--enable-use-systembus-for-obexd,--disable-use-systembus-for-obexd"
>
>  SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>             file://init \
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Add-system-bus-support-for-obexd.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Add-system-bus-support-for-obexd.patch
> new file mode 100644
> index 0000000000..025386cd07
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Add-system-bus-support-for-obexd.patch
> @@ -0,0 +1,244 @@
> +From e22394839b98db580f6937c92ffbea499f47aa89 Mon Sep 17 00:00:00 2001
> +From: Damodar Reddy GangiReddy <quic_dgangire@quicinc.com>
> +Date: Fri, 23 Aug 2024 12:23:47 +0530
> +Subject: [PATCH BlueZ v1] obexd: Add system bus support for obexd
> +
> +Currently obexd uses session bus.
> +Distros  where session bus is not supported and still obex profiles
> +are required in that case use system bus instead of session bus
> +which can be configured with new optional feature
> +
> +Additional optional feature has been added to achieve this
> +with name --enable-use-systembus-for-obexd
> +
> +steps to configure system bus
> +./configure --enable-use-systembus-for-obexd
> +
> +Upstream-Status: Denied
> +Upstream denied as it is distro specific
> +
> +Signed-off-by: Damodar Reddy GangiReddy <quic_dgangire@quicinc.com>
> +
> +---
> + Makefile.obexd          | 14 ++++++++++++++
> + configure.ac            |  9 +++++++++
> + obexd/client/ftp.c      |  3 ++-
> + obexd/client/map.c      |  3 ++-
> + obexd/client/opp.c      |  3 ++-
> + obexd/client/pbap.c     |  3 ++-
> + obexd/client/session.c  |  3 ++-
> + obexd/client/sync.c     |  3 ++-
> + obexd/plugins/pcsuite.c |  3 ++-
> + obexd/src/manager.c     |  3 ++-
> + src/bluetooth.conf      | 12 ++++++++++++
> + tools/obexctl.c         |  3 ++-
> + 12 files changed, 53 insertions(+), 9 deletions(-)
> +
> +diff --git a/Makefile.obexd b/Makefile.obexd
> +index b7e9f2d33..87432cc37 100644
> +--- a/Makefile.obexd
> ++++ b/Makefile.obexd
> +@@ -2,6 +2,19 @@
> + if OBEX
> +
> + if SYSTEMD
> ++
> ++if USE_SYSTEMBUS_FOR_OBEXD
> ++
> ++systemdsystemunit_DATA += obexd/src/obex.service
> ++dbussystembus_DATA += obexd/src/org.bluez.obex.service
> ++
> ++obexd-add-service-symlink:
> ++      $(LN_S) -f obex.service $(DESTDIR)$(SYSTEMD_SYSTEMUNITDIR)/dbus-org.bluez.obex.service
> ++
> ++obexd-remove-service-symlink:
> ++      rm -f $(DESTDIR)$(SYSTEMD_SYSTEMUNITDIR)/dbus-org.bluez.obex.service
> ++else
> ++
> + systemduserunitdir = $(SYSTEMD_USERUNITDIR)
> + systemduserunit_DATA = obexd/src/obex.service
> +
> +@@ -13,6 +26,7 @@ obexd-add-service-symlink:
> +
> + obexd-remove-service-symlink:
> +       rm -f $(DESTDIR)$(SYSTEMD_USERUNITDIR)/dbus-org.bluez.obex.service
> ++endif
> + else
> + obexd-add-service-symlink:
> + obexd-remove-service-symlink:
> +diff --git a/configure.ac b/configure.ac
> +index d31eb1656..cc9a55f4c 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -283,6 +283,15 @@ if (test "${enable_obex}" != "no"); then
> + fi
> + AM_CONDITIONAL(OBEX, test "${enable_obex}" != "no")
> +
> ++AC_ARG_ENABLE(use-systembus-for-obexd, AS_HELP_STRING([--enable-use-systembus-for-obexd],
> ++              [enable systembus for obexd]), [enable_use_systembus_for_obexd=${enableval}])
> ++AM_CONDITIONAL(USE_SYSTEMBUS_FOR_OBEXD, test "${enable_use_systembus_for_obexd}" = "yes")
> ++if (test "${enable_use_systembus_for_obexd}" = "yes"); then
> ++      AC_DEFINE(USE_SYSTEMBUS_FOR_OBEXD, 1, [Define to 1 if you want to use system bus for obexd.])
> ++else
> ++      AC_DEFINE(USE_SYSTEMBUS_FOR_OBEXD, 0, [Define to 0 if you want to use session bus for obexd.])
> ++fi
> ++
> + AC_ARG_ENABLE(btpclient, AS_HELP_STRING([--enable-btpclient],
> +               [enable BTP client]), [enable_btpclient=${enableval}])
> + AM_CONDITIONAL(BTPCLIENT, test "${enable_btpclient}" = "yes")
> +diff --git a/obexd/client/ftp.c b/obexd/client/ftp.c
> +index 160e0636a..e3cef32f6 100644
> +--- a/obexd/client/ftp.c
> ++++ b/obexd/client/ftp.c
> +@@ -463,7 +463,8 @@ int ftp_init(void)
> +
> +       DBG("");
> +
> +-      conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
> ++      conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
> ++                      DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
> +       if (!conn)
> +               return -EIO;
> +
> +diff --git a/obexd/client/map.c b/obexd/client/map.c
> +index 513dcaf14..815806f52 100644
> +--- a/obexd/client/map.c
> ++++ b/obexd/client/map.c
> +@@ -2063,7 +2063,8 @@ int map_init(void)
> +
> +       DBG("");
> +
> +-      conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
> ++      conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
> ++                      DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
> +       if (!conn)
> +               return -EIO;
> +
> +diff --git a/obexd/client/opp.c b/obexd/client/opp.c
> +index 90d0c0c8e..4889a3a0f 100644
> +--- a/obexd/client/opp.c
> ++++ b/obexd/client/opp.c
> +@@ -178,7 +178,8 @@ int opp_init(void)
> +
> +       DBG("");
> +
> +-      conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
> ++      conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
> ++                      DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
> +       if (!conn)
> +               return -EIO;
> +
> +diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
> +index 2d2aa9508..1658c853a 100644
> +--- a/obexd/client/pbap.c
> ++++ b/obexd/client/pbap.c
> +@@ -1303,7 +1303,8 @@ int pbap_init(void)
> +
> +       DBG("");
> +
> +-      conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
> ++      conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
> ++                      DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
> +       if (!conn)
> +               return -EIO;
> +
> +diff --git a/obexd/client/session.c b/obexd/client/session.c
> +index 7d8ebb04e..4e447e8eb 100644
> +--- a/obexd/client/session.c
> ++++ b/obexd/client/session.c
> +@@ -583,7 +583,8 @@ struct obc_session *obc_session_create(const char *source,
> +       if (driver == NULL)
> +               return NULL;
> +
> +-      conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
> ++      conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
> ++                      DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
> +       if (conn == NULL)
> +               return NULL;
> +
> +diff --git a/obexd/client/sync.c b/obexd/client/sync.c
> +index 92faf4434..bd339adfa 100644
> +--- a/obexd/client/sync.c
> ++++ b/obexd/client/sync.c
> +@@ -224,7 +224,8 @@ int sync_init(void)
> +
> +       DBG("");
> +
> +-      conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
> ++      conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
> ++                      DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
> +       if (!conn)
> +               return -EIO;
> +
> +diff --git a/obexd/plugins/pcsuite.c b/obexd/plugins/pcsuite.c
> +index 07c444ff2..5daed2abb 100644
> +--- a/obexd/plugins/pcsuite.c
> ++++ b/obexd/plugins/pcsuite.c
> +@@ -322,7 +322,8 @@ static gboolean send_backup_dbus_message(const char *oper,
> +
> +       file_size = size ? *size : 0;
> +
> +-      conn = g_dbus_setup_bus(DBUS_BUS_SESSION, NULL, NULL);
> ++      conn = g_dbus_setup_bus(USE_SYSTEMBUS_FOR_OBEXD ?
> ++                      DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL, NULL);
> +
> +       if (conn == NULL)
> +               return FALSE;
> +diff --git a/obexd/src/manager.c b/obexd/src/manager.c
> +index 3c0c2a7cc..dd83f056d 100644
> +--- a/obexd/src/manager.c
> ++++ b/obexd/src/manager.c
> +@@ -488,7 +488,8 @@ gboolean manager_init(void)
> +
> +       dbus_error_init(&err);
> +
> +-      connection = g_dbus_setup_bus(DBUS_BUS_SESSION, OBEXD_SERVICE, &err);
> ++      connection = g_dbus_setup_bus(USE_SYSTEMBUS_FOR_OBEXD ?
> ++              DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, OBEXD_SERVICE, &err);
> +       if (connection == NULL) {
> +               if (dbus_error_is_set(&err) == TRUE) {
> +                       fprintf(stderr, "%s\n", err.message);
> +diff --git a/src/bluetooth.conf b/src/bluetooth.conf
> +index b6c614908..f8879c8bb 100644
> +--- a/src/bluetooth.conf
> ++++ b/src/bluetooth.conf
> +@@ -21,10 +21,22 @@
> +     <allow send_interface="org.freedesktop.DBus.ObjectManager"/>
> +     <allow send_interface="org.freedesktop.DBus.Properties"/>
> +     <allow send_interface="org.mpris.MediaPlayer2.Player"/>
> ++    <allow own="org.bluez.obex"/>
> ++    <allow send_destination="org.bluez.obex"/>
> ++    <allow send_interface="org.bluez.obex.Agent1"/>
> ++    <allow send_interface="org.bluez.obex.Client1"/>
> ++    <allow send_interface="org.bluez.obex.Session1"/>
> ++    <allow send_interface="org.bluez.obex.Transfer1"/>
> ++    <allow send_interface="org.bluez.obex.ObjectPush1"/>
> ++    <allow send_interface="org.bluez.obex.PhonebookAccess1"/>
> ++    <allow send_interface="org.bluez.obex.Synchronization1"/>
> ++    <allow send_interface="org.bluez.obex.MessageAccess1"/>
> ++    <allow send_interface="org.bluez.obex.Message1"/>
> +   </policy>
> +
> +   <policy context="default">
> +     <allow send_destination="org.bluez"/>
> ++    <allow send_destination="org.bluez.obex"/>
> +   </policy>
> +
> + </busconfig>
> +diff --git a/tools/obexctl.c b/tools/obexctl.c
> +index 56a76915c..07dc1ae6b 100644
> +--- a/tools/obexctl.c
> ++++ b/tools/obexctl.c
> +@@ -2154,7 +2154,8 @@ int main(int argc, char *argv[])
> +       bt_shell_set_menu(&main_menu);
> +       bt_shell_set_prompt(PROMPT_OFF);
> +
> +-      dbus_conn = g_dbus_setup_bus(DBUS_BUS_SESSION, NULL, NULL);
> ++      dbus_conn = g_dbus_setup_bus(USE_SYSTEMBUS_FOR_OBEXD ?
> ++                              DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL, NULL);
> +
> +       client = g_dbus_client_new(dbus_conn, "org.bluez.obex",
> +                                                       "/org/bluez/obex");
> +--
> +2.34.1
> +
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203684): https://lists.openembedded.org/g/openembedded-core/message/203684
> Mute This Topic: https://lists.openembedded.org/mt/108054508/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

