Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id 15A996A45C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 16:34:05 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id e13so1414219vbg.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 09:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=iCG/TO+8MJdTx+Lbj2EqwFzlK0hbliLXR5XBLbiN/c4=;
	b=GYUFs6rVep2m3BPoX8G/q2NgAI9ldCOTeeZC3XPUtl1y8j2MJDC3P6vTMWIUezsMKI
	iJNvOR5IeQkGaqluQmiYwaaQb2KVmeBHde/zVHlfcroyUczdjewWfLgHukQ3CGCTLHY2
	1YTMfsyJdSXG9l1/xGs+3tzN2NKQw2otvcw4JjLxIfxZXRVBzw8BZFwNXFCJmR26S+Ff
	9us3xfo9ltKobXy7DTPPfPXEiIhXg7u2FMRltKrTAYLpevRAeE/fa2xRUEatLv0vTwiE
	hNcWmLPxvWEyTL+fzzp2Ca7GLmA2J9LCRuiVxa3W3z8XKR9tUfvRnzHIPWlwj0gkgKd/
	fgAg==
X-Received: by 10.52.69.200 with SMTP id g8mr2593316vdu.4.1369240444497; Wed,
	22 May 2013 09:34:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Wed, 22 May 2013 09:33:44 -0700 (PDT)
In-Reply-To: <1369187256-31043-1-git-send-email-net147@gmail.com>
References: <1369187256-31043-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 May 2013 17:33:44 +0100
Message-ID: <CAJTo0LawHFMUtJHzYGqyCzHA8sJhwC4x9xF1PwSUkZ4AB34j0Q@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQlzo9RclhFfL1NJ7tBpMQK3BayQ7jyb9FlwGDl46H/qs4EKZIfzYjRX2jLGp2E/uB12P458
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] base-files: add /run directory from FHS 3 draft specification
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
X-List-Received-Date: Wed, 22 May 2013 16:34:06 -0000
Content-Type: text/plain; charset=UTF-8

Hi Jonathan

On 22 May 2013 02:47, Jonathan Liu <net147@gmail.com> wrote:
> This adds the /run directory from the Filesystem Hierarchy Standard 3.0
> Draft [1] and refactors the filesystem as follows:

Good start!

> - Remove /var/run from dbus package as it is created on startup
> - Remove /var/volatile/run/resolvconf/interface from resolvconf package
>   as resolvconf package uses /etc/resolvconf/run/interface

Can these be separate patches, as they're essentially unrelated cleanups.

Please also drop all PR changes, they're not needed in oe-core.

> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
> index becb85c..c829bec 100644
> --- a/meta/files/fs-perms.txt
> +++ b/meta/files/fs-perms.txt
> @@ -45,15 +45,14 @@ ${oldincludedir}    0755    root    root    true    0644    root    root
>
>  # Items from base-files
>  # Links
> -${localstatedir}/run   link    volatile/run
> +${localstatedir}/run   link    /run
>  ${localstatedir}/log   link    volatile/log
> -${localstatedir}/lock  link    volatile/lock
> +${localstatedir}/lock  link    /run/lock
>  ${localstatedir}/tmp   link    volatile/tmp
>
>  # Special permissions from base-files
>  # Set 1777
>  /tmp                           01777   root    root    false - - -
> -${localstatedir}/volatile/lock 01777   root    root    false - - -
>  ${localstatedir}/volatile/tmp  01777   root    root    false - - -

Nothing appears to sets mode 1777 on /run/lock.  Then again Fedora
thinks that 0755 is sufficient, although Debian uses 1777.  We should
probably keep the permissions as 1777.

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 2be5bda..8055824 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -101,9 +101,9 @@ do_install() {
             > ${D}${sysconfdir}/default/volatiles/99_dbus


-       mkdir -p ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
+       mkdir -p ${D}${localstatedir}/lib/dbus

Presumably dbus will create /run/dbus if required?

Ross

