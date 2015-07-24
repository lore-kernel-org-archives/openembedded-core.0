Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1871175791
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 08:10:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6O8AWYq021579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 01:10:32 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 24 Jul 2015 01:10:31 -0700
Message-ID: <55B1F2F6.5030401@windriver.com>
Date: Fri, 24 Jul 2015 16:10:30 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1436256840-1930-1-git-send-email-wenzong.fan@windriver.com>
In-Reply-To: <1436256840-1930-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [PATCH] grub: Add support for net_default_mac and net_default_ip variables
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
X-List-Received-Date: Fri, 24 Jul 2015 08:10:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping ...

On 07/07/2015 04:14 PM, wenzong.fan@windriver.com wrote:
> From: Lijun Guo <Lijun.Guo@windriver.com>
>
> Using "-c" parameter, grub-mkimage can embed a configuration file into
> the grub image. However grub 2.0 doesn't support net_default_mac and
> net_default_ip variables in the configuration file.
>
> Backport upstream commit to fix the issue:
> * commit id: 2aa072d76a9c7df837a6a81bf80958094a522740
>
> Signed-off-by: Lijun Guo <Lijun.Guo@windriver.com>
> ---
>   ...-to-determine-MAC-IP-of-default-interface.patch | 127 +++++++++++++++++++++
>   meta/recipes-bsp/grub/grub2.inc                    |   1 +
>   2 files changed, 128 insertions(+)
>   create mode 100644 meta/recipes-bsp/grub/files/New-variables-to-determine-MAC-IP-of-default-interface.patch
>
> diff --git a/meta/recipes-bsp/grub/files/New-variables-to-determine-MAC-IP-of-default-interface.patch b/meta/recipes-bsp/grub/files/New-variables-to-determine-MAC-IP-of-default-interface.patch
> new file mode 100644
> index 0000000..b1b028e
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/New-variables-to-determine-MAC-IP-of-default-interface.patch
> @@ -0,0 +1,127 @@
> +From 2aa072d76a9c7df837a6a81bf80958094a522740 Mon Sep 17 00:00:00 2001
> +From: Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>
> +Date: Tue, 7 May 2013 12:05:36 +0200
> +Subject: [PATCH] New variables 'net_default_*' to determine MAC/IP of
> + default interface.
> +
> +commit 2aa072d76a9c7df837a6a81bf80958094a522740 upstream
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Lijun Guo <lijun.guo@windriver.com>
> +
> +---
> + grub-core/net/bootp.c |  3 +++
> + grub-core/net/net.c   | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++-
> + 2 files changed, 71 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/net/bootp.c b/grub-core/net/bootp.c
> +index 33f860a..c8ef4d6 100644
> +--- a/grub-core/net/bootp.c
> ++++ b/grub-core/net/bootp.c
> +@@ -211,6 +211,9 @@ grub_net_configure_by_dhcp_ack (const char *name,
> +       grub_print_error ();
> +     }
> +
> ++  if (is_def)
> ++    grub_env_set ("net_default_interface", name);
> ++
> +   if (device && !*device && bp->server_ip)
> +     {
> +       *device = grub_xasprintf ("tftp,%d.%d.%d.%d",
> +diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> +index aebbe4b..8ea6906 100644
> +--- a/grub-core/net/net.c
> ++++ b/grub-core/net/net.c
> +@@ -1,6 +1,6 @@
> + /*
> +  *  GRUB  --  GRand Unified Bootloader
> +- *  Copyright (C) 2010,2011  Free Software Foundation, Inc.
> ++ *  Copyright (C) 2010,2011,2012,2013  Free Software Foundation, Inc.
> +  *
> +  *  GRUB is free software: you can redistribute it and/or modify
> +  *  it under the terms of the GNU General Public License as published by
> +@@ -813,6 +813,69 @@ defserver_get_env (struct grub_env_var *var __attribute__ ((unused)),
> +   return grub_net_default_server ? : "";
> + }
> +
> ++static const char *
> ++defip_get_env (struct grub_env_var *var __attribute__ ((unused)),
> ++	       const char *val __attribute__ ((unused)))
> ++{
> ++  const char *intf = grub_env_get ("net_default_interface");
> ++  const char *ret = NULL;
> ++  if (intf)
> ++    {
> ++      char *buf = grub_xasprintf ("net_%s_ip", intf);
> ++      if (buf)
> ++	ret = grub_env_get (buf);
> ++      grub_free (buf);
> ++    }
> ++  return ret;
> ++}
> ++
> ++static char *
> ++defip_set_env (struct grub_env_var *var __attribute__ ((unused)),
> ++	       const char *val)
> ++{
> ++  const char *intf = grub_env_get ("net_default_interface");
> ++  if (intf)
> ++    {
> ++      char *buf = grub_xasprintf ("net_%s_ip", intf);
> ++      if (buf)
> ++	grub_env_set (buf, val);
> ++      grub_free (buf);
> ++    }
> ++  return NULL;
> ++}
> ++
> ++
> ++static const char *
> ++defmac_get_env (struct grub_env_var *var __attribute__ ((unused)),
> ++	       const char *val __attribute__ ((unused)))
> ++{
> ++  const char *intf = grub_env_get ("net_default_interface");
> ++  const char *ret = NULL;
> ++  if (intf)
> ++    {
> ++      char *buf = grub_xasprintf ("net_%s_mac", intf);
> ++      if (buf)
> ++	ret = grub_env_get (buf);
> ++      grub_free (buf);
> ++    }
> ++  return ret;
> ++}
> ++
> ++static char *
> ++defmac_set_env (struct grub_env_var *var __attribute__ ((unused)),
> ++	       const char *val)
> ++{
> ++  const char *intf = grub_env_get ("net_default_interface");
> ++  if (intf)
> ++    {
> ++      char *buf = grub_xasprintf ("net_%s_mac", intf);
> ++      if (buf)
> ++	grub_env_set (buf, val);
> ++      grub_free (buf);
> ++    }
> ++  return NULL;
> ++}
> ++
> +
> + static void
> + grub_net_network_level_interface_register (struct grub_net_network_level_interface *inter)
> +@@ -1560,6 +1623,10 @@ GRUB_MOD_INIT(net)
> + 			       defserver_set_env);
> +   grub_register_variable_hook ("pxe_default_server", defserver_get_env,
> + 			       defserver_set_env);
> ++  grub_register_variable_hook ("net_default_ip", defip_get_env,
> ++			       defip_set_env);
> ++  grub_register_variable_hook ("net_default_mac", defmac_get_env,
> ++			       defmac_set_env);
> +
> +   cmd_addaddr = grub_register_command ("net_add_addr", grub_cmd_addaddr,
> + 					/* TRANSLATORS: HWADDRESS stands for
> +--
> +1.8.5.2.233.g932f7e4
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index 312771b..07be851 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -27,6 +27,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>              file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
>              file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
>              file://grub2-fix-initrd-size-bug.patch \
> +           file://New-variables-to-determine-MAC-IP-of-default-interface.patch \
>               "
>
>   DEPENDS = "flex-native bison-native xz"
>

