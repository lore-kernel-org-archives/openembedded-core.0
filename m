Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8za-0001Hy-W4
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:05:31 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:52:00 -0700
Received: by lahj13 with SMTP id j13so2489505lah.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=p/pwvIMJO9maf1FnV/+gmckDRnTlqqDhvAoEVLp4BJk=;
	b=ahOu4VbQoMEwEGeoj9PgIfLpoImJAtlPtRhSkuogQ4d13DQjSFlR1VW8gcspTRLjHR
	xB9WHx2YlieINMC6/viFV20sGTDhC/ofJ0BBWioHM+RCGlZsfd7snQAHbYeNoCkybDGY
	LZ2TJvSYa1TbFiEkuE81f/lbWBxZViAb8p1F+3djihU2GYoquTeDD7jFF1iN21tovuG6
	XM11e5fPP0exGiZKX254rStVoTfVwhKi/2C8CjRXLtqmKTPVCFxCRlsSHhCO/bQcaUxX
	f7CJZZluruMBnYF1DfCaOjReUZFKJhu6yY9Zumcbq/B6W50JY0POsgFgMDEZEw4r9G7d
	eMaQ==
MIME-Version: 1.0
Received: by 10.112.48.169 with SMTP id m9mr3446393lbn.93.1339437118313; Mon,
	11 Jun 2012 10:51:58 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:51:58 -0700 (PDT)
In-Reply-To: <e50f2bf59b64accf580fc2df96e1fbc9eb6cfb98.1338323483.git.ross.burton@intel.com>
References: <cover.1338323483.git.ross.burton@intel.com>
	<e50f2bf59b64accf580fc2df96e1fbc9eb6cfb98.1338323483.git.ross.burton@intel.com>
Date: Mon, 11 Jun 2012 10:51:58 -0700
Message-ID: <CAPhnLPCp_rC-tsPUW5zgJKQHZQE9+eP3rE_2bkicdMLy9XRMZg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkBBcUdB1oHO0ZWpcop8HPOwaYzakRs/u+LvvU64ixzWjoXSuV95u1KoZp+bLHeLqkgocVg
Subject: Re: [PATCH 1/4] connman: just give xuser the extra rights it needs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jun 2012 18:05:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 29, 2012 at 1:43 PM, Ross Burton <ross.burton@intel.com> wrote:
> ---
> =A0.../connman/add_xuser_dbus_permission.patch =A0 =A0 =A0 =A0| =A0 14 ++=
+++---------
> =A01 files changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman/add_xuser_dbus_per=
mission.patch b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_pe=
rmission.patch
> index aa7a910..707b3ca 100644
> --- a/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission=
.patch
> +++ b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission=
.patch
> @@ -1,24 +1,20 @@
> -Some platform (like atom-pc) enables rootless X,
> -thus we need to add the xuser in the list.
> +Because Poky doesn't support at_console we need to special-case the sess=
ion
> +user.
>
> =A0Upstream-Status: Inappropriate [configuration]
>
> -Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> =A0diff --git a/src/connman-dbus.conf b/src/connman-dbus.conf
> -index 98a773e..cbe2ba3 100644
> +index 98a773e..466809c 100644
> =A0--- a/src/connman-dbus.conf
> =A0+++ b/src/connman-dbus.conf
> -@@ -8,6 +8,13 @@
> +@@ -8,6 +8,9 @@
> =A0 =A0 =A0 =A0 =A0<allow send_interface=3D"net.connman.Counter"/>
> =A0 =A0 =A0 =A0 =A0<allow send_interface=3D"net.connman.Notification"/>
> =A0 =A0 =A0</policy>
> =A0+ =A0 =A0<policy user=3D"xuser">
> -+ =A0 =A0 =A0 =A0<allow own=3D"net.connman"/>
> =A0+ =A0 =A0 =A0 =A0<allow send_destination=3D"net.connman"/>
> -+ =A0 =A0 =A0 =A0<allow send_interface=3D"net.connman.Agent"/>
> -+ =A0 =A0 =A0 =A0<allow send_interface=3D"net.connman.Counter"/>
> -+ =A0 =A0 =A0 =A0<allow send_interface=3D"net.connman.Notification"/>
> =A0+ =A0 =A0</policy>
> =A0 =A0 =A0<policy at_console=3D"true">
> =A0 =A0 =A0 =A0 =A0<allow send_destination=3D"net.connman"/>
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Merged into OE-Core

Thanks

-b

--=20
Elizabeth Flanagan
Yocto Project
Build and Release


