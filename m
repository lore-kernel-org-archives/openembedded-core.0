Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16319EEA870
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:57:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68520.1770976626167210051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 01:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=teuzNsLC;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so8820455e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 01:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770976624; x=1771581424; darn=lists.openembedded.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KycEJyp+7lJkSCZO2SLGgQpJIYJknNEBzqPHAW/6914=;
        b=teuzNsLC1wTjEN1qSbL+5Mw4z7tOJnutNyEs26EQanOMo8qQ1BnA7LTKgHKomp5jCK
         jcQSbv6swr8f9J+JmHQ+HrUXgjUYHtt8tUj4qrmkYOqaMq+cbO5aQDkY7QV6eAb193aq
         IfOgnC+AYMUfbixSHiLbuBa28a9M3YCTCBEZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770976624; x=1771581424;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KycEJyp+7lJkSCZO2SLGgQpJIYJknNEBzqPHAW/6914=;
        b=BucYM9CJntQmycu29wmpCsHI1aqayEQA5C6jDf47FOXRy3SJwe3pMIcp7l8RKDuz8I
         QzXorexVOXMZvoMI/mqr7oS+2n9QSG9BoIyMCFQlcTxGmNRWGs44L74lnQo5fRqpu5H1
         dSTL5OWcrWZ0s+PCRusowqKVg8h8qiYpMGnIeQV4HePumpHOVllU09IGOZeST+uJS/M9
         Gb5gwlohwng3BOkwuRnn2RjTbEFv3gK8wijB0vgnLupz8Jpb7Sya6Z/OsvERdrgeXe5I
         p40mseCZbWqiG9tMrqKnx4QGBdPU0Qni82OcoWZ6N1T37S/kguAvicuC7yh7BCBQ4KVv
         2WNw==
X-Forwarded-Encrypted: i=1; AJvYcCW+dJK7Ssq9rKEQRJpjnRXThT1LNy2jGJRow/Vdg2OMDGirR8Avid3vUzD4Dcoa8lhB1O7Sd8lpagTfNRvSh3T9GQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw2Xle+hhYK87j6ScF5MhjclbdAbkfpUGxDy+pG6S2HrAhsIthU
	5dtiDkS8PKEzpvKPZG4JgWXRbTb+pujDQ1QImanP8IHiCsg5Gr5NM1n5F8a9rfP6cCWnyTLL9VB
	I/rvi
X-Gm-Gg: AZuq6aKNUFAXbW0sQ64WlBaFl7H7HWNxl57Xz0h9RbaY5pYhIbfm/uaTzdxEQKQyBYi
	X5rUCSwQ5ndoKOcLCGBX3IheI28ksGXl94mlyzFFKF1DwJo9hz2IVmMMlEmVCceocmL9vPrAgU+
	SYyPEq62YZpB0KNFtkvQE6v21JWf//yNc8mQZG6bQbLbgEgO8F5GmPSefBN/KXoGvNyr3DWPMJZ
	vYQ9W/ss1NT06M3vKDmXSr1O5pZkUhd6vbnzK83EWtUWzjX2ImLhQnSSpkkl3LEXklIp8ywthJH
	Q90XPO8hg2FPHJ0LfAT7vpIkEXOx6lg8kKtmewg2r0B3XAid93bCm9kC42Z+4/zhAn81sxlBRTo
	xyMQp15uTbukie0mF3sdZ3nYcIuemE+k1relt3cRYYV7ArP42IzpW6Aj7sq1g3TnCU2df3ly/xo
	1dWLbhdrj+zZ0QPBtmgsuzpjhig6eYrEQv5s3vTd4qnGHoONwOrhk44zZXZ7Y3jXKQkDAN7T3YJ
	HotBOjeO9vSotY=
X-Received: by 2002:a05:600c:820f:b0:480:3b4e:41b8 with SMTP id 5b1f17b1804b1-48373a5baa7mr19665105e9.33.1770976623867;
        Fri, 13 Feb 2026 01:57:03 -0800 (PST)
Received: from localhost (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483709fdd39sm24467415e9.0.2026.02.13.01.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 01:57:03 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 10:57:03 +0100
Message-Id: <DGDQTH62U11P.389MPXQL92IJA@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [kirkstone][PATCH] libpam: fix CVE-2024-10963
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260213083949.143020-1-hprajapati@mvista.com>
In-Reply-To: <20260213083949.143020-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 09:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231107

Hello,

On Fri Feb 13, 2026 at 9:39 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/com=
mit/940747f88c16e029b69a74e80a2e94f65cb3e628
^ This line is not useful in the commit message (but definitively needed
in CVE-2024-10963.patch)

Can you add a justification as to why this patch does fix the CVE? (This
applies generally to all CVE patches)

In this case, we can use the debian security team analysis. And write
something like:
Pick up "Mitigated by" patch from Debian security tracker [0].
[0]: https://security-tracker.debian.org/tracker/CVE-2024-10963
Note that the commit that introduced the vulnerability is in upstream
v1.5.3 but was backported as CVE-2022-28321-0002.patch.

Can you check the above and send a v2 with it?

Thanks!

> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../pam/libpam/CVE-2024-10963.patch           | 229 ++++++++++++++++++
>  meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
>  2 files changed, 230 insertions(+)
>  create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10963.patch
>
> diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch b/meta=
/recipes-extended/pam/libpam/CVE-2024-10963.patch
> new file mode 100644
> index 0000000000..8f8e13f5e8
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/CVE-2024-10963.patch
> @@ -0,0 +1,229 @@
> +From f9ccee5c4c6cb0d4197b08ebeb36c1dceffe82e8 Mon Sep 17 00:00:00 2001
> +From: Thorsten Kukuk <kukuk@suse.com>
> +Date: Thu, 14 Nov 2024 10:27:28 +0100
> +Subject: [PATCH] pam_access: rework resolving of tokens as hostname
> +
> +* modules/pam_access/pam_access.c: separate resolving of IP addresses
> +  from hostnames. Don't resolve TTYs or display variables as hostname
> +  (#834).
> +  Add "nodns" option to disallow resolving of tokens as hostname.
> +* modules/pam_access/pam_access.8.xml: document nodns option
> +* modules/pam_access/access.conf.5.xml: document that hostnames should
> +  be written as FQHN.
> +
> +CVE: CVE-2024-10963
> +Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit=
/940747f88c16e029b69a74e80a2e94f65cb3e628]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + modules/pam_access/access.conf.5.xml |  4 ++
> + modules/pam_access/pam_access.8.xml  | 46 ++++++++++++------
> + modules/pam_access/pam_access.c      | 72 +++++++++++++++++++++++++++-
> + 3 files changed, 105 insertions(+), 17 deletions(-)
> +
> +diff --git a/modules/pam_access/access.conf.5.xml b/modules/pam_access/a=
ccess.conf.5.xml
> +index 8fdbc31..dc505a6 100644
> +--- a/modules/pam_access/access.conf.5.xml
> ++++ b/modules/pam_access/access.conf.5.xml
> +@@ -226,6 +226,10 @@
> +       item and the line will be most probably ignored. For this reason,=
 it is not
> +       recommended to put spaces around the ':' characters.
> +     </para>
> ++    <para>
> ++      Hostnames should be written as Fully-Qualified Host Name (FQHN) t=
o avoid
> ++      confusion with device names or PAM service names.
> ++    </para>
> +   </refsect1>
> +=20
> +   <refsect1 id=3D"access.conf-see_also">
> +diff --git a/modules/pam_access/pam_access.8.xml b/modules/pam_access/pa=
m_access.8.xml
> +index 9a6556c..eab9d9f 100644
> +--- a/modules/pam_access/pam_access.8.xml
> ++++ b/modules/pam_access/pam_access.8.xml
> +@@ -25,11 +25,14 @@
> +       <arg choice=3D"opt">
> +         debug
> +       </arg>
> ++      <arg choice=3D"opt" rep=3D"norepeat">
> ++        noaudit
> ++      </arg>
> +       <arg choice=3D"opt">
> +         nodefgroup
> +       </arg>
> +       <arg choice=3D"opt">
> +-        noaudit
> ++        nodns
> +       </arg>
> +       <arg choice=3D"opt">
> +         accessfile=3D<replaceable>file</replaceable>
> +@@ -112,6 +115,33 @@
> +         </listitem>
> +       </varlistentry>
> +=20
> ++      <varlistentry>
> ++        <term>
> ++          nodefgroup
> ++        </term>
> ++        <listitem>
> ++          <para>
> ++            User tokens which are not enclosed in parentheses will not =
be
> ++	    matched against the group database. The backwards compatible defau=
lt is
> ++            to try the group database match even for tokens not enclose=
d
> ++            in parentheses.
> ++          </para>
> ++        </listitem>
> ++      </varlistentry>
> ++
> ++      <varlistentry>
> ++        <term>
> ++          nodns
> ++        </term>
> ++        <listitem>
> ++          <para>
> ++	    Do not try to resolve tokens as hostnames, only IPv4 and IPv6
> ++	    addresses will be resolved. Which means to allow login from a
> ++	    remote host, the IP addresses need to be specified in <filename>ac=
cess.conf</filename>.
> ++          </para>
> ++        </listitem>
> ++      </varlistentry>
> ++
> +       <varlistentry>
> +         <term>
> +           <option>fieldsep=3D<replaceable>separators</replaceable></opt=
ion>
> +@@ -153,20 +183,6 @@
> +         </listitem>
> +       </varlistentry>
> +=20
> +-      <varlistentry>
> +-        <term>
> +-          <option>nodefgroup</option>
> +-        </term>
> +-        <listitem>
> +-          <para>
> +-            User tokens which are not enclosed in parentheses will not =
be
> +-	    matched against the group database. The backwards compatible defau=
lt is
> +-            to try the group database match even for tokens not enclose=
d
> +-            in parentheses.
> +-          </para>
> +-        </listitem>
> +-      </varlistentry>
> +-
> +     </variablelist>
> +   </refsect1>
> +=20
> +diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_ac=
cess.c
> +index bca424f..00a0a77 100644
> +--- a/modules/pam_access/pam_access.c
> ++++ b/modules/pam_access/pam_access.c
> +@@ -92,6 +92,7 @@ struct login_info {
> +     int debug;				/* Print debugging messages. */
> +     int only_new_group_syntax;		/* Only allow group entries of the form=
 "(xyz)" */
> +     int noaudit;			/* Do not audit denials */
> ++    int nodns;                          /* Do not try to resolve tokens=
 as hostnames */
> +     const char *fs;			/* field separator */
> +     const char *sep;			/* list-element separator */
> +     int from_remote_host;               /* If PAM_RHOST was used for fr=
om */
> +@@ -143,6 +144,8 @@ parse_args(pam_handle_t *pamh, struct login_info *lo=
ginfo,
> + 	    loginfo->only_new_group_syntax =3D YES;
> + 	} else if (strcmp (argv[i], "noaudit") =3D=3D 0) {
> + 	    loginfo->noaudit =3D YES;
> ++	} else if (strcmp (argv[i], "nodns") =3D=3D 0) {
> ++	    loginfo->nodns =3D YES;
> + 	} else {
> + 	    pam_syslog(pamh, LOG_ERR, "unrecognized option [%s]", argv[i]);
> + 	}
> +@@ -637,7 +640,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct =
login_info *item)
> +       if ((str_len =3D strlen(string)) > tok_len
> + 	  && strcasecmp(tok, string + str_len - tok_len) =3D=3D 0)
> + 	return YES;
> +-    } else if (tok[tok_len - 1] =3D=3D '.') {       /* internet network=
 numbers (end with ".") */
> ++    } else if (tok[tok_len - 1] =3D=3D '.') {       /* internet network=
 numbers/subnet (end with ".") */
> +       struct addrinfo hint;
> +=20
> +       memset (&hint, '\0', sizeof (hint));
> +@@ -712,6 +715,39 @@ string_match (pam_handle_t *pamh, const char *tok, =
const char *string,
> + }
> +=20
> +=20
> ++static int
> ++is_device (pam_handle_t *pamh, const char *tok)
> ++{
> ++  struct stat st;
> ++  const char *dev =3D "/dev/";
> ++  char *devname;
> ++
> ++  devname =3D malloc (strlen(dev) + strlen (tok) + 1);
> ++  if (devname =3D=3D NULL) {
> ++      pam_syslog(pamh, LOG_ERR, "Cannot allocate memory for device name=
: %m");
> ++      /*
> ++       * We should return an error and abort, but pam_access has no goo=
d
> ++       * error handling.
> ++       */
> ++      return NO;
> ++  }
> ++
> ++  char *cp =3D stpcpy (devname, dev);
> ++  strcpy (cp, tok);
> ++
> ++  if (lstat(devname, &st) !=3D 0)
> ++    {
> ++      free (devname);
> ++      return NO;
> ++    }
> ++  free (devname);
> ++
> ++  if (S_ISCHR(st.st_mode))
> ++    return YES;
> ++
> ++  return NO;
> ++}
> ++
> + /* network_netmask_match - match a string against one token
> +  * where string is a hostname or ip (v4,v6) address and tok
> +  * represents either a hostname, a single ip (v4,v6) address
> +@@ -773,10 +809,42 @@ network_netmask_match (pam_handle_t *pamh,
> + 	    return NO;
> + 	  }
> +       }
> ++    else if (isipaddr(tok, NULL, NULL) =3D=3D YES)
> ++      {
> ++	if (getaddrinfo (tok, NULL, NULL, &ai) !=3D 0)
> ++	  {
> ++	    if (item->debug)
> ++	      pam_syslog(pamh, LOG_DEBUG, "cannot resolve IP address \"%s\"", =
tok);
> ++
> ++	    return NO;
> ++	  }
> ++	netmask_ptr =3D NULL;
> ++      }
> ++    else if (item->nodns)
> ++      {
> ++	/* Only hostnames are left, which we would need to resolve via DNS */
> ++	return NO;
> ++      }
> +     else
> +       {
> ++	/* Bail out on X11 Display entries and ttys. */
> ++	if (tok[0] =3D=3D ':')
> ++	  {
> ++	    if (item->debug)
> ++	      pam_syslog (pamh, LOG_DEBUG,
> ++			  "network_netmask_match: tok=3D%s is X11 display", tok);
> ++	    return NO;
> ++	  }
> ++	if (is_device (pamh, tok))
> ++	  {
> ++	    if (item->debug)
> ++	      pam_syslog (pamh, LOG_DEBUG,
> ++			  "network_netmask_match: tok=3D%s is a TTY", tok);
> ++	    return NO;
> ++	  }
> ++
> +         /*
> +-	 * It is either an IP address or a hostname.
> ++	 * It is most likely a hostname.
> + 	 * Let getaddrinfo sort everything out
> + 	 */
> + 	if (getaddrinfo (tok, NULL, NULL, &ai) !=3D 0)
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-ext=
ended/pam/libpam_1.5.2.bb
> index 658212dd82..7d6546be53 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.2.bb
> +++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
> @@ -34,6 +34,7 @@ SRC_URI =3D "https://github.com/linux-pam/linux-pam/rel=
eases/download/v${PV}/Linux
>             file://CVE-2025-6020-01.patch \
>             file://CVE-2025-6020-02.patch \
>             file://CVE-2025-6020-03.patch \
> +           file://CVE-2024-10963.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "e4ec7131a91da44512574268f493c6d8ca105c87091691b8=
e9b56ca685d4f94d"


--=20
Yoann Congal
Smile ECS


