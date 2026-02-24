Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1709EFB81B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 08:56:28 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16187.1771923379396543424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 00:56:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EyXvqR0d;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-437711e9195so3451272f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 00:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771923378; x=1772528178; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+w7LVFHKo/ru/WwLScjK8O/vtp4/fmO2syfypSLBOw=;
        b=EyXvqR0dKrEfzeoLEuMw/u51+FYj+v4vcyNU9zSYMohADZAdWW+0GwBrxRHVkoQ9n0
         xoMNS95FNMX6AUxlrXpjexC4Lz+DW2IRQmeCLxR2/5maM+PoChtg0Ao02u7UvQlo3s/k
         em4MTlHZ4fFgxEu5Vn2LWrJfSHROr4IDccDvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771923378; x=1772528178;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M+w7LVFHKo/ru/WwLScjK8O/vtp4/fmO2syfypSLBOw=;
        b=CqDEXU1QDrgNs9Vzap2Ux7Cy+hcUwan0aEGC3ttFll/uW84DyVNt780D7bjhQshte+
         PicCX9lt0TSjqZ1OrLU/4tOfAqOTDT8+iaOH/24Rk0SN5TgWpfkHkbdXtUzeaSiwZgtF
         22/GilDH03XPRWJ+4mH6Rc4iN1Y2PHIN812oyNk16F+Pt+/uNvPbSucUQPS6c3YJPGIf
         xoi9B2WR4xoZrWDo/8WyWjcqrhMJ6ReUTKTPvrg8MQfKKGKoFzNo6jo1+j5LyuJ3tNkR
         J9/AR6+h1Vu8+5ZzPoKYry575M89YTLvdKeQm7sUkHiXbsd5VUip9lYgmn/nFlFQELAy
         JZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRW37CnjAPPeckdSz9bcyGoatyjBwGAptHZfR1jHj2WRwSljx+CNGp+JhJYfNTVSL0gSMaprqiCot24gKqv4ITOA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxq8xVxh5zsalzE5w+0Q8NLImQ5Ycqcfz+RiRdDdKYDTZXYr/rx
	EnWzwgWqq/mmuCENiFQkv5ieHzSrhb3Dz7YvGGUxaQtihwXRyPByCAO3bybFs1wrokBXuuCmJOl
	d6lfK
X-Gm-Gg: ATEYQzzJQobDHO+2UIvZKxaoLPJ4fSebM6FI5Er0MrH/JE2JQ+NdQrq4c2CgbXSbQ7k
	X4ivpl/AOD/Zq06SPY7WimYMr4sKQZiQR+0zk3QE+o8WRL3cftm66VKM1nJ/avmUW7i+Ap6Io6v
	eF9TgbryFO4cDAAavl4VqZ9O9aynAawd1AnsdzUC7P55GGl32jYYp2+QpJ4DnW/VFJQf174YusM
	+/dIB3myA7boYSgv6GzgWpoL7UO90WRf92q2yQ8z9V2JGSNNUkOqLX+IuMZxQTwO0GMbNTspstO
	pjrtHZXgMp82xcqhfhZioTPi1+86X2M0yYakDY6346T2ISTU9ZtZZ2dvpUVIyZgjdngyMBRaaUL
	hFgJ7KeobhJ5fkSXqF48xBJmLEw/wJXHb5b7B5Us35R7vZKk9DKc8AvuYltTYmQjaEvtRKZNr6C
	9Vx6deTD0hKdlbge54hAYSk9MEe9pM8vnyq0WD3C5E+9zVkAq0tIQAWs2D1mYN+S3BGKtOsc+a7
	4cmsXRBcbM=
X-Received: by 2002:a05:6000:240f:b0:437:6758:ce7d with SMTP id ffacd0b85a97d-4396f1742afmr18650396f8f.24.1771923377320;
        Tue, 24 Feb 2026 00:56:17 -0800 (PST)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4cc81sm24563006f8f.26.2026.02.24.00.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 00:56:16 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 09:56:16 +0100
Message-Id: <DGN2EXQKZPIJ.UUT574YZRE44@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCHv2] grub: fix CVE-2025-54770
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260224042919.7049-1-hprajapati@mvista.com>
In-Reply-To: <20260224042919.7049-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231750

On Tue Feb 24, 2026 at 5:29 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2025-54770

This patch is not in this NVD page. You need to provide a way to quickly
check why the patch you add is the right one.

>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../grub/files/CVE-2025-54770-01.patch        | 138 ++++++++++++++++++
>  .../grub/files/CVE-2025-54770-02.patch        |  39 +++++
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


