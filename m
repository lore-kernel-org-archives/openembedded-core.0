Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5C510706E9
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 16:24:26 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12937.1773505462741729557
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 09:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q8NEmoKA;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439ce3605ecso2448832f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 09:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773505461; x=1774110261; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1R8iSUphNtcUOqN/pfxVTnYtaZxwuY0zKv2gcI8KYI=;
        b=Q8NEmoKABg5D9/bjHL2m5MAWA0g2ztz5++m6WdhsYEaY5dx+/AopKpPDjP8N0GpbDV
         Q8h5omZk3xfyDI5SgwS09D8hNKT9qedxeHCeLiNjtAUWSByEZOvFRyAHrJC877zPZ6cQ
         8i7zKlOScn3MELjhdNDw7svEJH6o3Un1UM0WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773505461; x=1774110261;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1R8iSUphNtcUOqN/pfxVTnYtaZxwuY0zKv2gcI8KYI=;
        b=KYnivnc8S1JpIkudMD2gP2vkbIgGzQlGoRMCWqbuZ7O+Welqv4bJFvmgCqSJKyAYYT
         ycqOi4ac8ipkmG2C/kGKH9kFdCXt2MhISSuzGt5VcXEBi5HJLm5EXV1l2N3aicL85RE3
         SP0yj2JXjngxajm4gj2EfwQGL7Tf/CISKmpxYJEuKYp8lwi1PxY+VLdKhxgENAO/+uJE
         RdlE7hRp/x0k8n5zCVEyo6j7go1nmMPCtXksVq3e4omXj/zYW9Wsbvmp9WisGt5BtfS6
         uXg0fP/wnQvYzACF1+nnQQZzhHD9G0mf6JqgILc/hThOg6efzMIPSuRQyuLKXhRFWa+z
         +/kw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6UKyQFiPKW+AauVTsUeux6pqEvWEf+5bNj9h5q6xxhoVv8+gwyhSL+j9CEhKs/V9loIYY6dKf3T9Yk1OflStnA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxGlQNvwbG3ozHsXpGaG9oEuJlO1FxImySGNvTW1vodKIjmbZ3Y
	fbOVuyUOOARpl6GN4mR0l+JBnlZtlN8Gvfo7DTzKjmspYNOYX8caR06bp7IfB7+oYSs=
X-Gm-Gg: ATEYQzwPxRibvWEJ9iHJTa0mbrMbkss57D8PgLCPETDCvNoRgqXbq0buyhp8X6h8eCK
	5QYuzNOIBs6pJLDRmbJ0IPXDBCBV3HVdj3ftIGOpKcMjAUoaobdJJ1jQ4oY6a6PE6r9rVP/9heH
	jKzt9C30UVSSVG1Hh9KgC+z8twj9n7bUrNjVBvDNhu3ERPjGtBe1eGd5g9q8eakMsfmzQcyVNM7
	cT4Dbt4lN0IvOHvhIgK3nP6q4JdxgWl/5KoDXOWw1yOFBXzKhagL+BMZDAk/E6wexLgV8naNzoR
	r6Bc10J6+ODu5IgfcD9BifyxHClYYgSLVTqBhi4TA9P2iDZgH+758hE+K9Qn/VUnK+hcvWRIqd/
	w4u6s7gc45qREaf583O8WWFHLpfDJ7LxdiW+J9BYSKhsXdxS7LJ8UgjGRl3jFG4hMD4c/jKo0rg
	9vnkojhIsxqbwhvXCNtwT86pi/mXD9doZVkC2Yl5uHIXt1GNxLBe4DpQ5LmM1zK+e/iRXvq1nxv
	WGoNKcNIbZ6BRw=
X-Received: by 2002:a05:6000:220e:b0:439:cee7:7160 with SMTP id ffacd0b85a97d-43a04dc877dmr13156169f8f.52.1773505460888;
        Sat, 14 Mar 2026 09:24:20 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186e3sm31316446f8f.26.2026.03.14.09.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 09:24:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 17:24:20 +0100
Message-Id: <DH2N7SRYPRQ3.39K4ACZDXQF9@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH] grub: fix CVE-2025-54770
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260305121517.15675-1-hprajapati@mvista.com>
In-Reply-To: <20260305121517.15675-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 16:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233090

Hello,

On Thu Mar 5, 2026 at 1:15 PM CET, Hitendra Prajapati via lists.openembedde=
d.org wrote:
> Pick up patch from Debian security tracker.
> [0]: https://security-tracker.debian.org/tracker/CVE-2025-54770
>
> More Details : https://nvd.nist.gov/vuln/detail/CVE-2025-54770
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---

>  .../grub/files/CVE-2025-54770-01.patch        | 138 ++++++++++++++++++
>  .../grub/files/CVE-2025-54770-02.patch        |  39 +++++

Is the original code before the 2 patches vulnerable?
It looks to me like the CVE vulnerability is added in -01 to then, be
fixed in -02.

If that the case, you can use CVE_CHECK_IGNORE to specify that the
vulneratble code is not present and the CVE does not apply.

Regards,

>  meta/recipes-bsp/grub/grub2.inc               |   2 +
>  3 files changed, 179 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770-01.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770-02.patch
>
> diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54770-01.patch b/meta/r=
ecipes-bsp/grub/files/CVE-2025-54770-01.patch
> new file mode 100644
> index 0000000000..ea749fc8f6
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2025-54770-01.patch
> @@ -0,0 +1,138 @@
> +From 954c48b9c833d64b74ced1f27701af2ea5c6f55a Mon Sep 17 00:00:00 2001
> +From: Chad Kimes <chkimes@github.com>
> +Date: Mon, 21 Mar 2022 17:29:16 -0400
> +Subject: [PATCH] net/net: Add net_set_vlan command
> +
> +Previously there was no way to set the 802.1Q VLAN identifier, despite
> +support for vlantag in the net module. The only location vlantag was
> +being populated was from PXE boot and only for Open Firmware hardware.
> +This commit allows users to manually configure VLAN information for any
> +interface.
> +
> +Example usage:
> +  grub> net_ls_addr
> +  efinet1 00:11:22:33:44:55 192.0.2.100
> +  grub> net_set_vlan efinet1 100
> +  grub> net_ls_addr
> +  efinet1 00:11:22:33:44:55 192.0.2.100 vlan100
> +  grub> net_set_vlan efinet1 0
> +  efinet1 00:11:22:33:44:55 192.0.2.100
> +
> +Signed-off-by: Chad Kimes <chkimes@github.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +CVE: CVE-2025-54770
> +Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=
=3Dgrub.git;a=3Dcommit;h=3D954c48b9c833d64b74ced1f27701af2ea5c6f55a]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + docs/grub.texi      | 20 ++++++++++++++++++++
> + grub-core/net/net.c | 41 ++++++++++++++++++++++++++++++++++++++++-
> + 2 files changed, 60 insertions(+), 1 deletion(-)
> +
> +diff --git a/docs/grub.texi b/docs/grub.texi
> +index f8b4b3b..f7fc6d7 100644
> +--- a/docs/grub.texi
> ++++ b/docs/grub.texi
> +@@ -5493,6 +5493,7 @@ This command is only available on AArch64 systems.
> + * net_ls_dns::                  List DNS servers
> + * net_ls_routes::               List routing entries
> + * net_nslookup::                Perform a DNS lookup
> ++* net_set_vlan::                Set vlan id on an interface
> + @end menu
> +=20
> +=20
> +@@ -5669,6 +5670,25 @@ is given, use default list of servers.
> + @end deffn
> +=20
> +=20
> ++@node net_set_vlan
> ++@subsection net_set_vlan
> ++
> ++@deffn Command net_set_vlan @var{interface} @var{vlanid}
> ++Set the 802.1Q VLAN identifier on @var{interface} to @var{vlanid}. For =
example,
> ++to set the VLAN identifier on interface @samp{efinet1} to @samp{100}:
> ++
> ++@example
> ++net_set_vlan efinet1 100
> ++@end example
> ++
> ++The VLAN identifier can be removed by setting it to @samp{0}:
> ++
> ++@example
> ++net_set_vlan efinet1 0
> ++@end example
> ++@end deffn
> ++
> ++
> + @node Internationalisation
> + @chapter Internationalisation
> +=20
> +diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> +index ec7f01c..03ede6d 100644
> +--- a/grub-core/net/net.c
> ++++ b/grub-core/net/net.c
> +@@ -1162,6 +1162,42 @@ grub_cmd_addroute (struct grub_command *cmd __att=
ribute__ ((unused)),
> +     }
> + }
> +=20
> ++static grub_err_t
> ++grub_cmd_setvlan (struct grub_command *cmd __attribute__ ((unused)),
> ++		  int argc, char **args)
> ++{
> ++  const char *vlan_string, *vlan_string_end;
> ++  unsigned long vlantag;
> ++  struct grub_net_network_level_interface *inter;
> ++
> ++  if (argc !=3D 2)
> ++    return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("two arguments expecte=
d"));
> ++
> ++  vlan_string =3D args[1];
> ++  vlantag =3D grub_strtoul (vlan_string, &vlan_string_end, 10);
> ++
> ++  if (*vlan_string =3D=3D '\0' || *vlan_string_end !=3D '\0')
> ++    return grub_error (GRUB_ERR_BAD_NUMBER,
> ++		       N_("non-numeric or invalid number `%s'"), vlan_string);
> ++
> ++  if (vlantag > 4094)
> ++    return grub_error (GRUB_ERR_OUT_OF_RANGE,
> ++		       N_("vlan id `%s' not in the valid range of 0-4094"),
> ++		       vlan_string);
> ++
> ++  FOR_NET_NETWORK_LEVEL_INTERFACES (inter)
> ++    {
> ++      if (grub_strcmp (inter->name, args[0]) !=3D 0)
> ++	continue;
> ++
> ++      inter->vlantag =3D vlantag;
> ++      return GRUB_ERR_NONE;
> ++    }
> ++
> ++  return grub_error (GRUB_ERR_BAD_ARGUMENT,
> ++                     N_("network interface not found"));
> ++}
> ++
> + static void
> + print_net_address (const grub_net_network_level_netaddress_t *target)
> + {
> +@@ -1876,7 +1912,7 @@ grub_net_search_config_file (char *config, grub_si=
ze_t config_buf_len)
> + static struct grub_preboot *fini_hnd;
> +=20
> + static grub_command_t cmd_addaddr, cmd_deladdr, cmd_addroute, cmd_delro=
ute;
> +-static grub_command_t cmd_lsroutes, cmd_lscards;
> ++static grub_command_t cmd_setvlan, cmd_lsroutes, cmd_lscards;
> + static grub_command_t cmd_lsaddr, cmd_slaac;
> +=20
> + GRUB_MOD_INIT(net)
> +@@ -1914,6 +1950,9 @@ GRUB_MOD_INIT(net)
> +   cmd_delroute =3D grub_register_command ("net_del_route", grub_cmd_del=
route,
> + 					N_("SHORTNAME"),
> + 					N_("Delete a network route."));
> ++  cmd_setvlan =3D grub_register_command ("net_set_vlan", grub_cmd_setvl=
an,
> ++				       N_("SHORTNAME VLANID"),
> ++				       N_("Set an interface's vlan id."));
> +   cmd_lsroutes =3D grub_register_command ("net_ls_routes", grub_cmd_lis=
troutes,
> + 					"", N_("list network routes"));
> +   cmd_lscards =3D grub_register_command ("net_ls_cards", grub_cmd_listc=
ards,
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54770-02.patch b/meta/r=
ecipes-bsp/grub/files/CVE-2025-54770-02.patch
> new file mode 100644
> index 0000000000..bc56997726
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2025-54770-02.patch
> @@ -0,0 +1,39 @@
> +From 10e58a14db20e17d1b6a39abe38df01fef98e29d Mon Sep 17 00:00:00 2001
> +From: Thomas Frauendorfer | Miray Software <tf@miray.de>
> +Date: Fri, 9 May 2025 14:20:47 +0200
> +Subject: [PATCH] net/net: Unregister net_set_vlan command on unload
> +
> +The commit 954c48b9c (net/net: Add net_set_vlan command) added command
> +net_set_vlan to the net module. Unfortunately the commit only added the
> +grub_register_command() call on module load but missed the
> +grub_unregister_command() on unload. Let's fix this.
> +
> +Fixes: CVE-2025-54770
> +Fixes: 954c48b9c (net/net: Add net_set_vlan command)
> +
> +Reported-by: Thomas Frauendorfer | Miray Software <tf@miray.de>
> +Signed-off-by: Thomas Frauendorfer | Miray Software <tf@miray.de>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +CVE: CVE-2025-54770
> +Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=
=3Dgrub.git;a=3Dpatch;h=3D10e58a14db20e17d1b6a39abe38df01fef98e29d]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + grub-core/net/net.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> +index 03ede6d..e66d192 100644
> +--- a/grub-core/net/net.c
> ++++ b/grub-core/net/net.c
> +@@ -1980,6 +1980,7 @@ GRUB_MOD_FINI(net)
> +   grub_unregister_command (cmd_deladdr);
> +   grub_unregister_command (cmd_addroute);
> +   grub_unregister_command (cmd_delroute);
> ++  grub_unregister_command (cmd_setvlan);
> +   grub_unregister_command (cmd_lsroutes);
> +   grub_unregister_command (cmd_lscards);
> +   grub_unregister_command (cmd_lsaddr);
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
> index 4744e26693..b21afe34f7 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -63,6 +63,8 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>             file://CVE-2025-61661.patch \
>             file://CVE-2025-61662.patch \
>             file://CVE-2025-61663_61664.patch \
> +           file://CVE-2025-54770-01.patch \
> +           file://CVE-2025-54770-02.patch \
>  "
> =20
>  SRC_URI[sha256sum] =3D "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f=
62aa3f53ae803f5f"


--=20
Yoann Congal
Smile ECS


